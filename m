Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A38357173
	for <lists+drbd-dev@lfdr.de>; Wed, 26 Jun 2019 21:20:37 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 09FFD1028A75;
	Wed, 26 Jun 2019 21:20:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 716C11011C03
	for <drbd-dev@lists.linbit.com>; Wed, 26 Jun 2019 21:20:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id CADE2A0692;
	Wed, 26 Jun 2019 19:20:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id RWufN_oGuSXC; Wed, 26 Jun 2019 19:20:31 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id DD5B2A067D;
	Wed, 26 Jun 2019 19:20:31 +0000 (UTC)
Date: Wed, 26 Jun 2019 19:20:31 +0000 (UTC)
From: Eric Wheeler <drbd-dev@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Lars Ellenberg <lars.ellenberg@linbit.com>
In-Reply-To: <20190624154946.GU30528@soda.linbit>
Message-ID: <alpine.LRH.2.11.1906261914150.1114@mx.ewheeler.net>
References: <alpine.LRH.2.11.1906210638010.3326@mx.ewheeler.net>
	<20190624154946.GU30528@soda.linbit>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1690155773-1867630225-1561576831=:1114"
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1690155773-1867630225-1561576831=:1114
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Mon, 24 Jun 2019, Lars Ellenberg wrote:

> On Sat, Jun 22, 2019 at 12:03:55AM +0000, Eric Wheeler wrote:
> > Hello all,
> > 
> > Can someone help explain how checksum-based sync and verify are 
> > implemented in the sender and receive side?  It looks like the hashes are 
> > per-sector (looking at read_for_csum?) and I am interested in making the 
> > csum chunk size configurable, or at least hack in some test code to see if 
> > it would provide a performance benefit to csum multiple sectors.
> > 
> > I'm also trying to understand what iterates over the lldev and understand 
> > where the csum takes place foreach chunk of data.
> > 
> > Any direction would be helpful.  Thank you.
> 
> As our in-sync/out-of-sync bitmap tracks 4k blocks,
> we want to compare 4k checkesums.
> 
> Yes, that generates "a lot" of requests, and if these are not merged by
> some IO scheduler on the lower layers, that may seriously suck.
> 
> make_ov_request() is what generates the online-verify requests.
> 
> What we potentially could do is issue the requests in larger chunks,
> like (1 MiB) to the backends, then calculate and communicate the
> checksum per each 4k, as well as the result.

What if it were to calculate 1MiB chunks (configurable) and then 
invalidate all 4k bitmap entries in that 1MiB range if the hash 
mismatches?


--
Eric Wheeler


> 
> -- 
> : Lars Ellenberg
> : LINBIT | Keeping the Digital World Running
> : DRBD -- Heartbeat -- Corosync -- Pacemaker
> : R&D, Integration, Ops, Consulting, Support
> 
> DRBD® and LINBIT® are registered trademarks of LINBIT
> _______________________________________________
> drbd-dev mailing list
> drbd-dev@lists.linbit.com
> http://lists.linbit.com/mailman/listinfo/drbd-dev
> 
---1690155773-1867630225-1561576831=:1114
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev

---1690155773-1867630225-1561576831=:1114--
