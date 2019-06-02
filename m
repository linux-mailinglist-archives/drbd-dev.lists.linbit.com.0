Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB4332149
	for <lists+drbd-dev@lfdr.de>; Sun,  2 Jun 2019 02:28:38 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id B56271028A70;
	Sun,  2 Jun 2019 02:28:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 069D41028A68
	for <drbd-dev@lists.linbit.com>; Sun,  2 Jun 2019 02:28:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id B8A46A0692;
	Sun,  2 Jun 2019 00:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id W-A0Bg48Fkrc; Sun,  2 Jun 2019 00:28:31 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [66.155.3.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id C446BA067D;
	Sun,  2 Jun 2019 00:28:31 +0000 (UTC)
Date: Sun, 2 Jun 2019 00:28:31 +0000 (UTC)
From: Eric Wheeler <drbd-dev@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Lars Ellenberg <lars.ellenberg@linbit.com>
In-Reply-To: <20190528131823.GD5803@soda.linbit>
Message-ID: <alpine.LRH.2.11.1906012121470.27699@mx.ewheeler.net>
References: <15124635.GA4107@soda.linbit>
	<1516057231-21756-1-git-send-email-drbd-dev@lists.ewheeler.net>
	<20180116072615.GA3940@infradead.org>
	<20180116094907.GD4107@soda.linbit>
	<alpine.LRH.2.11.1905101728280.1835@mx.ewheeler.net>
	<20190528131823.GD5803@soda.linbit>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1690155773-127689699-1559435311=:27699"
Cc: linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1690155773-127689699-1559435311=:27699
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT

On Tue, 28 May 2019, Lars Ellenberg wrote:

> On Fri, May 10, 2019 at 05:36:32PM +0000, Eric Wheeler wrote:
> > Hi Lars,
> > 
> > We just tried 4.19.x and this bugs still exists. We applied the patch 
> > which was originally submitted to this thread and it still applies cleanly 
> > and seems to work for our use case. You mentioned that you had some older 
> > code which zeroed out unaligned discard requests (or perhaps it was for a 
> > different purpose) that you may be able to use to patch this. Could you 
> > dig those up and see if we can get this solved?
> > 
> > It would be nice to be able to use drbd with thin backing volumes from the 
> > vanilla kernel. If this has already been fixed in something newer than 
> > 4.19, then please point me to the commit.
> 
> I think it was merged upstream in 5.0
> f31e583aa2c2 drbd: introduce P_ZEROES (REQ_OP_WRITE_ZEROES on the "wire")

Thanks Lars, I appreciate your patch.  

Your unaligned zerout code in drbd_issue_discard_or_zero_out() looks 
great.  I particulary like how you adjusted max_discard_sectors to the 
granularity, as well as alignment handling.  Well thought out.

Your commit notes that "for backward compatibility, P_TRIM means zero-out, 
unless the DRBD_FF_WZEROES feature flag is agreed upon during handshake."

We test our environment by deploying the newer kernel on one of the DRBD 
servers and checking for regressions---but this will cause a zero-out on 
the new server because the old server doesn't yet support DRBD_FF_WZEROES.

For our purpose, can you think of any reason that it would be unsafe to 
hack the following into drbd_do_features() so the newer version will not 
zero-out while we test and get both nodes up to the newer version?

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index c7ad88d..76191e6 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -5382,6 +5382,8 @@ static int drbd_do_features(struct drbd_connection *connection)
 	connection->agreed_pro_version = min_t(int, PRO_VERSION_MAX, p->protocol_max);
 	connection->agreed_features = PRO_FEATURES & be32_to_cpu(p->feature_flags);
 
+	connection->agreed_features |= DRBD_FF_WZEROES;
+
 	drbd_info(connection, "Handshake successful: "
 	     "Agreed network protocol version %d\n", connection->agreed_pro_version);


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
> 
---1690155773-127689699-1559435311=:27699
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev

---1690155773-127689699-1559435311=:27699--
