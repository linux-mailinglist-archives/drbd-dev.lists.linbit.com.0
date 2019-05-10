Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA4D1A28B
	for <lists+drbd-dev@lfdr.de>; Fri, 10 May 2019 19:43:16 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 6045D1028A64;
	Fri, 10 May 2019 19:43:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 387 seconds by postgrey-1.31 at mail09;
	Fri, 10 May 2019 19:43:13 CEST
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 5B7D1101E043
	for <drbd-dev@lists.linbit.com>; Fri, 10 May 2019 19:43:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id 1BF7DA0692;
	Fri, 10 May 2019 17:36:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Dp0a1D6s0PIr; Fri, 10 May 2019 17:36:44 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id 4B05EA067D;
	Fri, 10 May 2019 17:36:44 +0000 (UTC)
Date: Fri, 10 May 2019 17:36:32 +0000 (UTC)
From: Eric Wheeler <drbd-dev@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Lars Ellenberg <lars.ellenberg@linbit.com>
In-Reply-To: <20180116094907.GD4107@soda.linbit>
Message-ID: <alpine.LRH.2.11.1905101728280.1835@mx.ewheeler.net>
References: <15124635.GA4107@soda.linbit>
	<1516057231-21756-1-git-send-email-drbd-dev@lists.ewheeler.net>
	<20180116072615.GA3940@infradead.org>
	<20180116094907.GD4107@soda.linbit>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
Cc: Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	stable@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: fix discard_zeroes_if_aligned
	regression
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Tue, 16 Jan 2018, Lars Ellenberg wrote:

> On Mon, Jan 15, 2018 at 11:26:15PM -0800, Christoph Hellwig wrote:
> > NAK.  Calling a discard and expecting zeroing is simply buggy.
> 
> What he said.
> 
> The bug/misunderstanding was that we now use zeroout even for discards,
> with the assumption that it would try to do discards where it can.
> 
> Which is even true.
> 
> But our expectations of when zeroout "should" use unmap,
> and where it actually can do that safely
> based on the information it has,
> don't really match:
> our expectations where wrong, we assumed too much.
> (in the general case).
> 
> Which means in DRBD we have to stop use zeroout for discards,
> and again pass down normal discard for discards.
> 
> In the specific case where the backend to DRBD is lvm-thin,
> AND it does de-alloc blocks on discard,
> AND it does NOT have skip_block_zeroing set or it's backend
> does zero on discard and it does discard passdown, and we tell
> DRBD about all of that (using the discard_zeroes_if_aligned flag)
> then we can do this "zero head and tail, discard full blocks",
> and expect them to be zero.
> 
> If skip_block_zeroing is set however, and there is no discard
> passdown in thin, or the backend of thin does not zero on discard,
> DRBD can still pass down discards to thin, and expect them do be
> de-allocated, but can not expect discarded ranges to remain
> "zero", any later partial write to an unallocated area could pull
> in different "undefined" garbage on different replicas for the
> not-written-to part of a new allocated block.
> 
> The end result is that you have areas of the block device
> that return different data depending on which replica you
> read from.
> 
> But that is the case even eithout discard in that setup,
> don't do that then or live with it.
> 
> "undefined data" is undefined, you have that directly on thin
> in that setup already, with DRBD on top you now have several
> versions of "undefined".
> 
> Anything on top of such a setup must not do "read-modify-write"
> of "undefined" data and expect a defined result, adding DRBD
> on top does not change that.
> 
> DRBD can deal with that just fine, but our "online verify" will
> report loads of boring "mismatches" for those areas.
> 
> TL;DR: we'll stop doing "discard-is-zeroout"
> (our assumptions were wrong).
> We still won't do exactly "discard-is-discard", but re-enable our
> "discard-is-discard plus zeroout on head and tail", because in
> some relevant setups, this gives us the best result, and avoids
> the false positives in our online-verify.
> 
>     Lars
> 

Hi Lars,

We just tried 4.19.x and this bugs still exists. We applied the patch 
which was originally submitted to this thread and it still applies cleanly 
and seems to work for our use case. You mentioned that you had some older 
code which zeroed out unaligned discard requests (or perhaps it was for a 
different purpose) that you may be able to use to patch this. Could you 
dig those up and see if we can get this solved?

It would be nice to be able to use drbd with thin backing volumes from the 
vanilla kernel. If this has already been fixed in something newer than 
4.19, then please point me to the commit.

Thank you for your help!

 
--
Eric Wheeler


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
