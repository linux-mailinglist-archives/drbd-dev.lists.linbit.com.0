Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDA141A2DA
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Sep 2021 00:23:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AF468420955;
	Tue, 28 Sep 2021 00:23:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B9E3C420626
	for <drbd-dev@lists.linbit.com>; Tue, 28 Sep 2021 00:22:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7HsBSAXvJVS50Uiqx29feEn9n8Si95gNmRNJecp6B2Q=;
	b=3Ess48YLoTSGFL2YYsnTd0kv20
	73ZZNmZzS2Ja1DzBcZeiUzMKDZDeORtY++OsydxJ8qjN6BHy/qRMQl4fuIr+A/iWUUcnxX60xD/57
	dD4buBA0nGZ2hz9oX2MCpgu05MaXhGoTRGbRF5697NJFdL+8Um77FpvpbP7DCqKR/0KkJQbPMcI2j
	EjHsivXWwuljscJ+cr9v2M0VofPEbBfBmfVZfcNCREl+xL5/Fl115IhwumwsHCJ/vVCzG+plphm3X
	D+kkvw7qmBaKrJc+aKLsntabB8UlZG69u1PZvVOUoJc5shVZpal/PIbdkvlCo/6dAohJvIYow2tco
	LO/veLpA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mUygS-004TPa-38; Mon, 27 Sep 2021 22:01:12 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 27 Sep 2021 15:01:05 -0700
Message-Id: <20210927220110.1066271-11-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220110.1066271-1-mcgrof@kernel.org>
References: <20210927220110.1066271-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 10/15] pf: cleanup initialization
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

From: Christoph Hellwig <hch@lst.de>

Refactor the pf initialization to have a dedicated helper to initialize
a single disk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/paride/pf.c | 223 +++++++++++++++++---------------------
 1 file changed, 99 insertions(+), 124 deletions(-)

diff --git a/drivers/block/paride/pf.c b/drivers/block/paride/pf.c
index d5b9c88ba76f..f471d48a87bc 100644
--- a/drivers/block/paride/pf.c
+++ b/drivers/block/paride/pf.c
@@ -214,7 +214,6 @@ static int pf_getgeo(struct block_device *bdev, struct hd_geometry *geo);
 
 static void pf_release(struct gendisk *disk, fmode_t mode);
 
-static int pf_detect(void);
 static void do_pf_read(void);
 static void do_pf_read_start(void);
 static void do_pf_write(void);
@@ -285,45 +284,6 @@ static const struct blk_mq_ops pf_mq_ops = {
 	.queue_rq	= pf_queue_rq,
 };
 
-static void __init pf_init_units(void)
-{
-	struct pf_unit *pf;
-	int unit;
-
-	pf_drive_count = 0;
-	for (unit = 0, pf = units; unit < PF_UNITS; unit++, pf++) {
-		struct gendisk *disk;
-
-		if (blk_mq_alloc_sq_tag_set(&pf->tag_set, &pf_mq_ops, 1,
-				BLK_MQ_F_SHOULD_MERGE))
-			continue;
-
-		disk = blk_mq_alloc_disk(&pf->tag_set, pf);
-		if (IS_ERR(disk)) {
-			blk_mq_free_tag_set(&pf->tag_set);
-			continue;
-		}
-
-		INIT_LIST_HEAD(&pf->rq_list);
-		blk_queue_max_segments(disk->queue, cluster);
-		blk_queue_bounce_limit(disk->queue, BLK_BOUNCE_HIGH);
-		pf->disk = disk;
-		pf->pi = &pf->pia;
-		pf->media_status = PF_NM;
-		pf->drive = (*drives[unit])[D_SLV];
-		pf->lun = (*drives[unit])[D_LUN];
-		snprintf(pf->name, PF_NAMELEN, "%s%d", name, unit);
-		disk->major = major;
-		disk->first_minor = unit;
-		disk->minors = 1;
-		strcpy(disk->disk_name, pf->name);
-		disk->fops = &pf_fops;
-		disk->events = DISK_EVENT_MEDIA_CHANGE;
-		if (!(*drives[unit])[D_PRT])
-			pf_drive_count++;
-	}
-}
-
 static int pf_open(struct block_device *bdev, fmode_t mode)
 {
 	struct pf_unit *pf = bdev->bd_disk->private_data;
@@ -718,59 +678,6 @@ static int pf_probe(struct pf_unit *pf)
 	return -1;
 }
 
-static int pf_detect(void)
-{
-	struct pf_unit *pf = units;
-	int k, unit;
-
-	printk("%s: %s version %s, major %d, cluster %d, nice %d\n",
-	       name, name, PF_VERSION, major, cluster, nice);
-
-	par_drv = pi_register_driver(name);
-	if (!par_drv) {
-		pr_err("failed to register %s driver\n", name);
-		return -1;
-	}
-	k = 0;
-	if (pf_drive_count == 0) {
-		if (pi_init(pf->pi, 1, -1, -1, -1, -1, -1, pf_scratch, PI_PF,
-			    verbose, pf->name)) {
-			if (!pf_probe(pf) && pf->disk) {
-				pf->present = 1;
-				k++;
-			} else
-				pi_release(pf->pi);
-		}
-
-	} else
-		for (unit = 0; unit < PF_UNITS; unit++, pf++) {
-			int *conf = *drives[unit];
-			if (!conf[D_PRT])
-				continue;
-			if (pi_init(pf->pi, 0, conf[D_PRT], conf[D_MOD],
-				    conf[D_UNI], conf[D_PRO], conf[D_DLY],
-				    pf_scratch, PI_PF, verbose, pf->name)) {
-				if (pf->disk && !pf_probe(pf)) {
-					pf->present = 1;
-					k++;
-				} else
-					pi_release(pf->pi);
-			}
-		}
-	if (k)
-		return 0;
-
-	printk("%s: No ATAPI disk detected\n", name);
-	for (pf = units, unit = 0; unit < PF_UNITS; pf++, unit++) {
-		if (!pf->disk)
-			continue;
-		blk_cleanup_disk(pf->disk);
-		blk_mq_free_tag_set(&pf->tag_set);
-	}
-	pi_unregister_driver(par_drv);
-	return -1;
-}
-
 /* The i/o request engine */
 
 static int pf_start(struct pf_unit *pf, int cmd, int b, int c)
@@ -1014,61 +921,129 @@ static void do_pf_write_done(void)
 	next_request(0);
 }
 
+static int __init pf_init_unit(struct pf_unit *pf, bool autoprobe, int port,
+		int mode, int unit, int protocol, int delay, int ms)
+{
+	struct gendisk *disk;
+	int ret;
+
+	ret = blk_mq_alloc_sq_tag_set(&pf->tag_set, &pf_mq_ops, 1,
+				      BLK_MQ_F_SHOULD_MERGE);
+	if (ret)
+		return ret;
+
+	disk = blk_mq_alloc_disk(&pf->tag_set, pf);
+	if (IS_ERR(disk)) {
+		ret = PTR_ERR(disk);
+		goto out_free_tag_set;
+	}
+	disk->major = major;
+	disk->first_minor = pf - units;
+	disk->minors = 1;
+	strcpy(disk->disk_name, pf->name);
+	disk->fops = &pf_fops;
+	disk->events = DISK_EVENT_MEDIA_CHANGE;
+	disk->private_data = pf;
+
+	blk_queue_max_segments(disk->queue, cluster);
+	blk_queue_bounce_limit(disk->queue, BLK_BOUNCE_HIGH);
+
+	INIT_LIST_HEAD(&pf->rq_list);
+	pf->disk = disk;
+	pf->pi = &pf->pia;
+	pf->media_status = PF_NM;
+	pf->drive = (*drives[disk->first_minor])[D_SLV];
+	pf->lun = (*drives[disk->first_minor])[D_LUN];
+	snprintf(pf->name, PF_NAMELEN, "%s%d", name, disk->first_minor);
+
+	if (!pi_init(pf->pi, autoprobe, port, mode, unit, protocol, delay,
+			pf_scratch, PI_PF, verbose, pf->name))
+		goto out_free_disk;
+	if (pf_probe(pf))
+		goto out_pi_release;
+
+	add_disk(disk);
+	pf->present = 1;
+	return 0;
+
+out_pi_release:
+	pi_release(pf->pi);
+out_free_disk:
+	blk_cleanup_disk(pf->disk);
+out_free_tag_set:
+	blk_mq_free_tag_set(&pf->tag_set);
+	return ret;
+}
+
 static int __init pf_init(void)
 {				/* preliminary initialisation */
 	struct pf_unit *pf;
-	int unit;
+	int found = 0, unit;
 
 	if (disable)
 		return -EINVAL;
 
-	pf_init_units();
+	if (register_blkdev(major, name))
+		return -EBUSY;
 
-	if (pf_detect())
-		return -ENODEV;
-	pf_busy = 0;
+	printk("%s: %s version %s, major %d, cluster %d, nice %d\n",
+	       name, name, PF_VERSION, major, cluster, nice);
 
-	if (register_blkdev(major, name)) {
-		for (pf = units, unit = 0; unit < PF_UNITS; pf++, unit++) {
-			if (!pf->disk)
-				continue;
-			blk_cleanup_queue(pf->disk->queue);
-			blk_mq_free_tag_set(&pf->tag_set);
-			put_disk(pf->disk);
-		}
-		return -EBUSY;
+	par_drv = pi_register_driver(name);
+	if (!par_drv) {
+		pr_err("failed to register %s driver\n", name);
+		goto out_unregister_blkdev;
 	}
 
-	for (pf = units, unit = 0; unit < PF_UNITS; pf++, unit++) {
-		struct gendisk *disk = pf->disk;
+	for (unit = 0; unit < PF_UNITS; unit++) {
+		if (!(*drives[unit])[D_PRT])
+			pf_drive_count++;
+	}
 
-		if (!pf->present)
-			continue;
-		disk->private_data = pf;
-		add_disk(disk);
+	pf = units;
+	if (pf_drive_count == 0) {
+		if (pf_init_unit(pf, 1, -1, -1, -1, -1, -1, verbose))
+			found++;
+	} else {
+		for (unit = 0; unit < PF_UNITS; unit++, pf++) {
+			int *conf = *drives[unit];
+			if (!conf[D_PRT])
+				continue;
+			if (pf_init_unit(pf, 0, conf[D_PRT], conf[D_MOD],
+				    conf[D_UNI], conf[D_PRO], conf[D_DLY],
+				    verbose))
+				found++;
+		}
+	}
+	if (!found) {
+		printk("%s: No ATAPI disk detected\n", name);
+		goto out_unregister_pi_driver;
 	}
+	pf_busy = 0;
 	return 0;
+
+out_unregister_pi_driver:
+	pi_unregister_driver(par_drv);
+out_unregister_blkdev:
+	unregister_blkdev(major, name);
+	return -ENODEV;
 }
 
 static void __exit pf_exit(void)
 {
 	struct pf_unit *pf;
 	int unit;
-	unregister_blkdev(major, name);
+
 	for (pf = units, unit = 0; unit < PF_UNITS; pf++, unit++) {
-		if (!pf->disk)
+		if (!pf->present)
 			continue;
-
-		if (pf->present)
-			del_gendisk(pf->disk);
-
-		blk_cleanup_queue(pf->disk->queue);
+		del_gendisk(pf->disk);
+		blk_cleanup_disk(pf->disk);
 		blk_mq_free_tag_set(&pf->tag_set);
-		put_disk(pf->disk);
-
-		if (pf->present)
-			pi_release(pf->pi);
+		pi_release(pf->pi);
 	}
+
+	unregister_blkdev(major, name);
 }
 
 MODULE_LICENSE("GPL");
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
