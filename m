Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id B813B58963
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jun 2019 19:59:46 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 2A4B21028A75;
	Thu, 27 Jun 2019 19:59:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 635A61011BFF
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jun 2019 19:59:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id BEE3DA0692;
	Thu, 27 Jun 2019 17:59:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aJ6sH7LF3Qxv; Thu, 27 Jun 2019 17:59:40 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id DC7BAA067D;
	Thu, 27 Jun 2019 17:59:40 +0000 (UTC)
Date: Thu, 27 Jun 2019 17:59:40 +0000 (UTC)
From: Eric Wheeler <drbd-dev@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Robert Altnoeder <robert.altnoeder@linbit.com>
In-Reply-To: <27d9a6d5-6ee7-be44-8d46-2dc15d466307@linbit.com>
Message-ID: <alpine.LRH.2.11.1906271737510.1114@mx.ewheeler.net>
References: <alpine.LRH.2.11.1906210638010.3326@mx.ewheeler.net>
	<20190624154946.GU30528@soda.linbit>
	<alpine.LRH.2.11.1906261914150.1114@mx.ewheeler.net>
	<27d9a6d5-6ee7-be44-8d46-2dc15d466307@linbit.com>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] Checksum based resync block size
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

On Thu, 27 Jun 2019, Robert Altnoeder wrote:

> On 6/26/19 9:20 PM, Eric Wheeler wrote:
> > On Mon, 24 Jun 2019, Lars Ellenberg wrote:
> >
> >> As our in-sync/out-of-sync bitmap tracks 4k blocks,
> >> we want to compare 4k checkesums.
> >>
> >> Yes, that generates "a lot" of requests, and if these are not merged by
> >> some IO scheduler on the lower layers, that may seriously suck.
> >>
> >> make_ov_request() is what generates the online-verify requests.
> >>
> >> What we potentially could do is issue the requests in larger chunks,
> >> like (1 MiB) to the backends, then calculate and communicate the
> >> checksum per each 4k, as well as the result.
>
> > What if it were to calculate 1MiB chunks (configurable) and then 
> > invalidate all 4k bitmap entries in that 1MiB range if the hash 
> > mismatches?

This could also help resync by checksuming contiguous dirty bitmap entries 
(up to a chunk size limit) and resyncing the whole series instead of each 
4k block.
 
> Is your intention to reduce the number of packets with checksums that
> are being sent, and/or the number of checksum comparisons for the same
> amount of data?

Reduce the number of packets, but also, crypto transforms perform better 
on larger data chunks. You make another good point: fewer hash comparisons 
will help too.

> Both could have a positive impact on performance, but the question is,
> whether the difference is big enough to be relevant. On the other hand,
> hashing more data per checksum increases the chance of hash collisions.

I'm not too concerned about hash collisions.  That might be a problem with 
small CRC32-based sums, but assuming crypto hashes with a hash size of 
2^128, then the birthday paradox gives us a collision betwen some two 
hashes after 2^64 hashes---that is, any 2 hashes---not specifically the 
two being compared.  The probability of two chosen hashes colliding is 
even lower than 1/(2^64).

-Eric

> 
> br,
> Robert
> 
> _______________________________________________
> drbd-dev mailing list
> drbd-dev@lists.linbit.com
> http://lists.linbit.com/mailman/listinfo/drbd-dev
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
