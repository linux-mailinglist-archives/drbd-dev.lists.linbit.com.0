Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5B41A2D9
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Sep 2021 00:22:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7BC1742087D;
	Tue, 28 Sep 2021 00:22:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CE004420626
	for <drbd-dev@lists.linbit.com>; Tue, 28 Sep 2021 00:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=AMZVObxgC7VN7OHNbaRSDrEFm1ly7VvlQaG7uu88zPQ=;
	b=YBuw7ZguvA5HtY6bWAIoYcWYor
	NwrC7VpbaEsRUDRHrJ1hqGXmqSxbgjoDYNgEcWZ0l4HzBVg6uR6twW7FzqzLN8dIjMIyRUKfTxCTd
	5zrAlWD4MAhSDzrqqUsvjeQwwZAG8o94VrGSfhsmDZKa85PwOeu+UHthoLzmQ8MdybFD8zfpmOnoJ
	z33SgJ4jiSu1lBAS/1bt+OxzT8VXBLz55dvTALw901NFPAmpvSp60L+Zn+Tc9jOxvx7zM0o4QqO+s
	XmGPZjr//tHFsc+3h2eeN3lGAfDZ5MhmlKjj295T9Jbs9/LYwsO05qjQ1v9Fk+imi1tGJC59GBpSK
	/1NH5Ijw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mUygS-004TPW-1B; Mon, 27 Sep 2021 22:01:12 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 27 Sep 2021 15:01:04 -0700
Message-Id: <20210927220110.1066271-10-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220110.1066271-1-mcgrof@kernel.org>
References: <20210927220110.1066271-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 09/15] pcd: cleanup initialization
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

Refactor the pcd initialization to have a dedicated helper to initialize
a single disk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/paride/pcd.c | 286 ++++++++++++++++---------------------
 1 file changed, 127 insertions(+), 159 deletions(-)

diff --git a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
index 8903fdaa2046..93ed63626232 100644
--- a/drivers/block/paride/pcd.c
+++ b/drivers/block/paride/pcd.c
@@ -183,8 +183,6 @@ static int pcd_audio_ioctl(struct cdrom_device_info *cdi,
 static int pcd_packet(struct cdrom_device_info *cdi,
 		      struct packet_command *cgc);
 
-static int pcd_detect(void);
-static void pcd_probe_capabilities(void);
 static void do_pcd_read_drq(void);
 static blk_status_t pcd_queue_rq(struct blk_mq_hw_ctx *hctx,
 				 const struct blk_mq_queue_data *bd);
@@ -302,53 +300,6 @@ static const struct blk_mq_ops pcd_mq_ops = {
 	.queue_rq	= pcd_queue_rq,
 };
 
-static void pcd_init_units(void)
-{
-	struct pcd_unit *cd;
-	int unit;
-
-	pcd_drive_count = 0;
-	for (unit = 0, cd = pcd; unit < PCD_UNITS; unit++, cd++) {
-		struct gendisk *disk;
-
-		if (blk_mq_alloc_sq_tag_set(&cd->tag_set, &pcd_mq_ops, 1,
-				BLK_MQ_F_SHOULD_MERGE))
-			continue;
-
-		disk = blk_mq_alloc_disk(&cd->tag_set, cd);
-		if (IS_ERR(disk)) {
-			blk_mq_free_tag_set(&cd->tag_set);
-			continue;
-		}
-
-		INIT_LIST_HEAD(&cd->rq_list);
-		blk_queue_bounce_limit(disk->queue, BLK_BOUNCE_HIGH);
-		cd->disk = disk;
-		cd->pi = &cd->pia;
-		cd->present = 0;
-		cd->last_sense = 0;
-		cd->changed = 1;
-		cd->drive = (*drives[unit])[D_SLV];
-		if ((*drives[unit])[D_PRT])
-			pcd_drive_count++;
-
-		cd->name = &cd->info.name[0];
-		snprintf(cd->name, sizeof(cd->info.name), "%s%d", name, unit);
-		cd->info.ops = &pcd_dops;
-		cd->info.handle = cd;
-		cd->info.speed = 0;
-		cd->info.capacity = 1;
-		cd->info.mask = 0;
-		disk->major = major;
-		disk->first_minor = unit;
-		disk->minors = 1;
-		strcpy(disk->disk_name, cd->name);	/* umm... */
-		disk->fops = &pcd_bdops;
-		disk->flags = GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE;
-		disk->events = DISK_EVENT_MEDIA_CHANGE;
-	}
-}
-
 static int pcd_open(struct cdrom_device_info *cdi, int purpose)
 {
 	struct pcd_unit *cd = cdi->handle;
@@ -679,90 +630,31 @@ static int pcd_probe(struct pcd_unit *cd, int ms)
 	return -1;
 }
 
-static void pcd_probe_capabilities(void)
+static int pcd_probe_capabilities(struct pcd_unit *cd)
 {
-	int unit, r;
-	char buffer[32];
 	char cmd[12] = { 0x5a, 1 << 3, 0x2a, 0, 0, 0, 0, 18, 0, 0, 0, 0 };
-	struct pcd_unit *cd;
-
-	for (unit = 0, cd = pcd; unit < PCD_UNITS; unit++, cd++) {
-		if (!cd->present)
-			continue;
-		r = pcd_atapi(cd, cmd, 18, buffer, "mode sense capabilities");
-		if (r)
-			continue;
-		/* we should now have the cap page */
-		if ((buffer[11] & 1) == 0)
-			cd->info.mask |= CDC_CD_R;
-		if ((buffer[11] & 2) == 0)
-			cd->info.mask |= CDC_CD_RW;
-		if ((buffer[12] & 1) == 0)
-			cd->info.mask |= CDC_PLAY_AUDIO;
-		if ((buffer[14] & 1) == 0)
-			cd->info.mask |= CDC_LOCK;
-		if ((buffer[14] & 8) == 0)
-			cd->info.mask |= CDC_OPEN_TRAY;
-		if ((buffer[14] >> 6) == 0)
-			cd->info.mask |= CDC_CLOSE_TRAY;
-	}
-}
-
-static int pcd_detect(void)
-{
-	int k, unit;
-	struct pcd_unit *cd;
-
-	printk("%s: %s version %s, major %d, nice %d\n",
-	       name, name, PCD_VERSION, major, nice);
+	char buffer[32];
+	int ret;
 
-	par_drv = pi_register_driver(name);
-	if (!par_drv) {
-		pr_err("failed to register %s driver\n", name);
-		return -1;
-	}
+	ret = pcd_atapi(cd, cmd, 18, buffer, "mode sense capabilities");
+	if (ret)
+		return ret;
+
+	/* we should now have the cap page */
+	if ((buffer[11] & 1) == 0)
+		cd->info.mask |= CDC_CD_R;
+	if ((buffer[11] & 2) == 0)
+		cd->info.mask |= CDC_CD_RW;
+	if ((buffer[12] & 1) == 0)
+		cd->info.mask |= CDC_PLAY_AUDIO;
+	if ((buffer[14] & 1) == 0)
+		cd->info.mask |= CDC_LOCK;
+	if ((buffer[14] & 8) == 0)
+		cd->info.mask |= CDC_OPEN_TRAY;
+	if ((buffer[14] >> 6) == 0)
+		cd->info.mask |= CDC_CLOSE_TRAY;
 
-	k = 0;
-	if (pcd_drive_count == 0) { /* nothing spec'd - so autoprobe for 1 */
-		cd = pcd;
-		if (cd->disk && pi_init(cd->pi, 1, -1, -1, -1, -1, -1,
-			    pcd_buffer, PI_PCD, verbose, cd->name)) {
-			if (!pcd_probe(cd, -1)) {
-				cd->present = 1;
-				k++;
-			} else
-				pi_release(cd->pi);
-		}
-	} else {
-		for (unit = 0, cd = pcd; unit < PCD_UNITS; unit++, cd++) {
-			int *conf = *drives[unit];
-			if (!conf[D_PRT])
-				continue;
-			if (!cd->disk)
-				continue;
-			if (!pi_init(cd->pi, 0, conf[D_PRT], conf[D_MOD],
-				     conf[D_UNI], conf[D_PRO], conf[D_DLY],
-				     pcd_buffer, PI_PCD, verbose, cd->name)) 
-				continue;
-			if (!pcd_probe(cd, conf[D_SLV])) {
-				cd->present = 1;
-				k++;
-			} else
-				pi_release(cd->pi);
-		}
-	}
-	if (k)
-		return 0;
-
-	printk("%s: No CD-ROM drive found\n", name);
-	for (unit = 0, cd = pcd; unit < PCD_UNITS; unit++, cd++) {
-		if (!cd->disk)
-			continue;
-		blk_cleanup_disk(cd->disk);
-		blk_mq_free_tag_set(&cd->tag_set);
-	}
-	pi_unregister_driver(par_drv);
-	return -1;
+	return 0;
 }
 
 /* I/O request processing */
@@ -999,43 +891,121 @@ static int pcd_get_mcn(struct cdrom_device_info *cdi, struct cdrom_mcn *mcn)
 	return 0;
 }
 
+static int pcd_init_unit(struct pcd_unit *cd, bool autoprobe, int port,
+		int mode, int unit, int protocol, int delay, int ms)
+{
+	struct gendisk *disk;
+	int ret;
+
+	ret = blk_mq_alloc_sq_tag_set(&cd->tag_set, &pcd_mq_ops, 1,
+				      BLK_MQ_F_SHOULD_MERGE);
+	if (ret)
+		return ret;
+
+	disk = blk_mq_alloc_disk(&cd->tag_set, cd);
+	if (IS_ERR(disk)) {
+		ret = PTR_ERR(disk);
+		goto out_free_tag_set;
+	}
+
+	INIT_LIST_HEAD(&cd->rq_list);
+	blk_queue_bounce_limit(disk->queue, BLK_BOUNCE_HIGH);
+	cd->disk = disk;
+	cd->pi = &cd->pia;
+	cd->present = 0;
+	cd->last_sense = 0;
+	cd->changed = 1;
+	cd->drive = (*drives[cd - pcd])[D_SLV];
+
+	cd->name = &cd->info.name[0];
+	snprintf(cd->name, sizeof(cd->info.name), "%s%d", name, unit);
+	cd->info.ops = &pcd_dops;
+	cd->info.handle = cd;
+	cd->info.speed = 0;
+	cd->info.capacity = 1;
+	cd->info.mask = 0;
+	disk->major = major;
+	disk->first_minor = unit;
+	disk->minors = 1;
+	strcpy(disk->disk_name, cd->name);	/* umm... */
+	disk->fops = &pcd_bdops;
+	disk->flags = GENHD_FL_BLOCK_EVENTS_ON_EXCL_WRITE;
+	disk->events = DISK_EVENT_MEDIA_CHANGE;
+
+	if (!pi_init(cd->pi, autoprobe, port, mode, unit, protocol, delay,
+			pcd_buffer, PI_PCD, verbose, cd->name))
+		goto out_free_disk;
+	if (pcd_probe(cd, ms))
+		goto out_pi_release;
+
+	cd->present = 1;
+	pcd_probe_capabilities(cd);
+	register_cdrom(cd->disk, &cd->info);
+	add_disk(cd->disk);
+	return 0;
+
+out_pi_release:
+	pi_release(cd->pi);
+out_free_disk:
+	blk_cleanup_disk(cd->disk);
+out_free_tag_set:
+	blk_mq_free_tag_set(&cd->tag_set);
+	return ret;
+}
+
 static int __init pcd_init(void)
 {
-	struct pcd_unit *cd;
-	int unit;
+	int found = 0, unit;
 
 	if (disable)
 		return -EINVAL;
 
-	pcd_init_units();
+	if (register_blkdev(major, name))
+		return -EBUSY;
 
-	if (pcd_detect())
-		return -ENODEV;
+	pr_info("%s: %s version %s, major %d, nice %d\n",
+		name, name, PCD_VERSION, major, nice);
 
-	/* get the atapi capabilities page */
-	pcd_probe_capabilities();
+	par_drv = pi_register_driver(name);
+	if (!par_drv) {
+		pr_err("failed to register %s driver\n", name);
+		goto out_unregister_blkdev;
+	}
 
-	if (register_blkdev(major, name)) {
-		for (unit = 0, cd = pcd; unit < PCD_UNITS; unit++, cd++) {
-			if (!cd->disk)
-				continue;
+	for (unit = 0; unit < PCD_UNITS; unit++) {
+		if ((*drives[unit])[D_PRT])
+			pcd_drive_count++;
+	}
 
-			blk_cleanup_queue(cd->disk->queue);
-			blk_mq_free_tag_set(&cd->tag_set);
-			put_disk(cd->disk);
+	if (pcd_drive_count == 0) { /* nothing spec'd - so autoprobe for 1 */
+		if (!pcd_init_unit(pcd, 1, -1, -1, -1, -1, -1, -1))
+			found++;
+	} else {
+		for (unit = 0; unit < PCD_UNITS; unit++) {
+			struct pcd_unit *cd = &pcd[unit];
+			int *conf = *drives[unit];
+
+			if (!conf[D_PRT])
+				continue;
+			if (!pcd_init_unit(cd, 0, conf[D_PRT], conf[D_MOD],
+					conf[D_UNI], conf[D_PRO], conf[D_DLY],
+					conf[D_SLV]))
+				found++;
 		}
-		return -EBUSY;
 	}
 
-	for (unit = 0, cd = pcd; unit < PCD_UNITS; unit++, cd++) {
-		if (cd->present) {
-			register_cdrom(cd->disk, &cd->info);
-			cd->disk->private_data = cd;
-			add_disk(cd->disk);
-		}
+	if (!found) {
+		pr_info("%s: No CD-ROM drive found\n", name);
+		goto out_unregister_pi_driver;
 	}
 
 	return 0;
+
+out_unregister_pi_driver:
+	pi_unregister_driver(par_drv);
+out_unregister_blkdev:
+	unregister_blkdev(major, name);
+	return -ENODEV;
 }
 
 static void __exit pcd_exit(void)
@@ -1044,20 +1014,18 @@ static void __exit pcd_exit(void)
 	int unit;
 
 	for (unit = 0, cd = pcd; unit < PCD_UNITS; unit++, cd++) {
-		if (!cd->disk)
+		if (!cd->present)
 			continue;
 
-		if (cd->present) {
-			del_gendisk(cd->disk);
-			pi_release(cd->pi);
-			unregister_cdrom(&cd->info);
-		}
-		blk_cleanup_queue(cd->disk->queue);
+		del_gendisk(cd->disk);
+		pi_release(cd->pi);
+		unregister_cdrom(&cd->info);
+		blk_cleanup_disk(cd->disk);
+
 		blk_mq_free_tag_set(&cd->tag_set);
-		put_disk(cd->disk);
 	}
-	unregister_blkdev(major, name);
 	pi_unregister_driver(par_drv);
+	unregister_blkdev(major, name);
 }
 
 MODULE_LICENSE("GPL");
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
