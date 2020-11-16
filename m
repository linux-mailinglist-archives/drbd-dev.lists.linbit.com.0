Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA972B4A75
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 17:14:43 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5DA4A420827;
	Mon, 16 Nov 2020 17:14:43 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C200D420820
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 17:11:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=K+kkAiIfWzB4syRFt+33j5OXLPH83fZlF9ACMDZkYhg=;
	b=k5dNhGax8VxlBfuaj9EQBdAXgt
	4072QYhm07kKi1w+W9nEyoMSW3ELii8kjNeM1F9XviJBMC0uEQv6MPhU9nRzHBDI1yZZmWAy9Q0N2
	fTvPwi+VC8nhfIjC7jFXt9leIcNNiMb0XmPx9eg/JoTwye7h/y7KHjVMVYweaBNLQMktbr4A8iWEt
	dOTjTgdEq+CLoKYrid8bVvBdmQLTGWBIgPYXUmyZ/n6rnRuKWj+UuQ5XIshtknCUOMSkMwKUNjD5w
	dJBoojTYMzEvaH9mPATlftM3BLIRcn7GZkGadLtxoUQdZeeK4Y0pHIv111cNROAtxxvV+mZxdO2Kj
	KOai2cDA==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyL-0003zc-NO; Mon, 16 Nov 2020 14:59:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:36 +0100
Message-Id: <20201116145809.410558-46-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [Drbd-dev] [PATCH 45/78] md: use __register_blkdev to allocate
	devices on demand
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

Use the simpler mechanism attached to major_name to allocate a md device
when a currently unregistered minor is accessed.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Song Liu <song@kernel.org>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/md.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index fa31b71a72a35d..b2edf5e0f965b5 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5764,11 +5764,12 @@ static int md_alloc(dev_t dev, char *name)
 	return error;
 }
 
-static struct kobject *md_probe(dev_t dev, int *part, void *data)
+static void md_probe(dev_t dev)
 {
+	if (MAJOR(dev) == MD_MAJOR && MINOR(dev) >= 512)
+		return;
 	if (create_on_open)
 		md_alloc(dev, NULL);
-	return NULL;
 }
 
 static int add_named_array(const char *val, const struct kernel_param *kp)
@@ -6532,7 +6533,7 @@ static void autorun_devices(int part)
 			break;
 		}
 
-		md_probe(dev, NULL, NULL);
+		md_probe(dev);
 		mddev = mddev_find(dev);
 		if (!mddev || !mddev->gendisk) {
 			if (mddev)
@@ -9563,18 +9564,15 @@ static int __init md_init(void)
 	if (!md_rdev_misc_wq)
 		goto err_rdev_misc_wq;
 
-	if ((ret = register_blkdev(MD_MAJOR, "md")) < 0)
+	ret = __register_blkdev(MD_MAJOR, "md", md_probe);
+	if (ret < 0)
 		goto err_md;
 
-	if ((ret = register_blkdev(0, "mdp")) < 0)
+	ret = __register_blkdev(0, "mdp", md_probe);
+	if (ret < 0)
 		goto err_mdp;
 	mdp_major = ret;
 
-	blk_register_region(MKDEV(MD_MAJOR, 0), 512, THIS_MODULE,
-			    md_probe, NULL, NULL);
-	blk_register_region(MKDEV(mdp_major, 0), 1UL<<MINORBITS, THIS_MODULE,
-			    md_probe, NULL, NULL);
-
 	register_reboot_notifier(&md_notifier);
 	raid_table_header = register_sysctl_table(raid_root_table);
 
@@ -9841,9 +9839,6 @@ static __exit void md_exit(void)
 	struct list_head *tmp;
 	int delay = 1;
 
-	blk_unregister_region(MKDEV(MD_MAJOR,0), 512);
-	blk_unregister_region(MKDEV(mdp_major,0), 1U << MINORBITS);
-
 	unregister_blkdev(MD_MAJOR,"md");
 	unregister_blkdev(mdp_major, "mdp");
 	unregister_reboot_notifier(&md_notifier);
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
