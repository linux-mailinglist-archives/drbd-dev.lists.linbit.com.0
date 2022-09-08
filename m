Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 084365B286F
	for <lists+drbd-dev@lfdr.de>; Thu,  8 Sep 2022 23:21:33 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F2B04421743;
	Thu,  8 Sep 2022 23:21:31 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 450 seconds by postgrey-1.31 at mail19;
	Thu, 08 Sep 2022 23:21:29 CEST
Received: from aragorn.cowesettanimalhospital.com
	(wsip-72-215-235-61.ri.ri.cox.net [72.215.235.61])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0362C420668
	for <drbd-dev@lists.linbit.com>; Thu,  8 Sep 2022 23:21:24 +0200 (CEST)
Received: by aragorn.cowesettanimalhospital.com (Postfix, from userid 1200)
	id 308341407A2; Thu,  8 Sep 2022 17:13:53 -0400 (EDT)
From: Michael D Labriola <veggiemike@sourceruckus.org>
To: drbd-dev@lists.linbit.com
Date: Thu,  8 Sep 2022 17:13:34 -0400
Message-Id: <20220908211337.17090-1-veggiemike@sourceruckus.org>
X-Mailer: git-send-email 2.17.1
Subject: [Drbd-dev] [PATCH 0/3] 5.18 kernel patches w/out compat
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Ahoy!  I put together the following patches to get things compiling on
5.18 a while back and never got a chance to do anything with them.
Now 5.19 is stable, 5.18 is EOL, and 6.0 is coming soon.  Where has
the time gone.

I just rebased on drbd-9.1 today, everything compiles against 5.18,
and my resources at least come up and look ok w/out doing any
strenuous testing.  Can somebody take a look at these and make sure
I'm not way off course before I go gin up compat patches to go along
with these?

Michael D Labriola (3):
      drbd: remove WRITE_SAME support
      drbd: remove reliance on bdi congestion
      drbd: use bio_alloc_clone() instead of bio_clone_fast()

 drbd/drbd_main.c          | 35 +++++++----------------------------
 drbd/drbd_nl.c            | 75 +++------------------------------------------------------------------------
 drbd/drbd_receiver.c      | 38 +++++++-------------------------------
 drbd/drbd_req.c           |  6 ++----
 drbd/drbd_sender.c        |  4 ----
 drbd/drbd_transport_tcp.c |  3 ---
 6 files changed, 19 insertions(+), 142 deletions(-)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
