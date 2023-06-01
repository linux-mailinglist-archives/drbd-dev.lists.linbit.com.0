Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 006A071A251
	for <lists+drbd-dev@lfdr.de>; Thu,  1 Jun 2023 17:19:07 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 538EF420624;
	Thu,  1 Jun 2023 17:19:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2378542036A
	for <drbd-dev@lists.linbit.com>; Thu,  1 Jun 2023 17:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=lbZQIxtGvltk6tGm6fkQPEmgkJpyIOCCgi68KnMoOH4=;
	b=2y6yZeRsKHU3GjW/XNCM8RaEeg
	hLgsqrOyHGCTEVNhLxz0wtBy7ghWlgU+YJiIOeSU1wvlz8uVlVdlj9afP8V1VEmnN06vaCg3c6CWb
	N0k8yP5mnRKAfQOEv/D4zS0cYxJ0t8e8deTaYuUAgCYyIfgNgQTMsqtOVxFbAgdxObGR3JhTLFHNI
	rTmBcHne2w6jmbBgj42l9FrDhe9GUDSZdp/k08FnyF+jIV3gjBS1TPQYKfsAVNsDWLE5H7hIBr1Np
	/RqOLpPb672mg0kz6VsHEwq8dOXfID9Gxcy55f1PViwkAJStNGIRDcvhrJjNpoN+fjBGP2/JE2PoG
	7pyjgd1g==;
Received: from [2001:4bb8:182:6d06:eacb:c751:971:73eb] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1q4k2i-003zin-1n; Thu, 01 Jun 2023 15:16:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com
Date: Thu,  1 Jun 2023 17:16:46 +0200
Message-Id: <20230601151646.1386867-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, axboe@kernel.dk, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: stop defining __KERNEL_SYSCALLS__
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

__KERNEL_SYSCALLS__ hasn't been needed since Linux 2.6.19 so stop
defining it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_main.c     | 1 -
 drivers/block/drbd/drbd_receiver.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 83987e7a5ef275..54223f64610a05 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -37,7 +37,6 @@
 #include <linux/notifier.h>
 #include <linux/kthread.h>
 #include <linux/workqueue.h>
-#define __KERNEL_SYSCALLS__
 #include <linux/unistd.h>
 #include <linux/vmalloc.h>
 #include <linux/sched/signal.h>
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 8c2bc47de4735e..0c9f54197768d6 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -27,7 +27,6 @@
 #include <uapi/linux/sched/types.h>
 #include <linux/sched/signal.h>
 #include <linux/pkt_sched.h>
-#define __KERNEL_SYSCALLS__
 #include <linux/unistd.h>
 #include <linux/vmalloc.h>
 #include <linux/random.h>
-- 
2.39.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
