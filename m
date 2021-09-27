Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 398A241A2DC
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Sep 2021 00:23:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 12B5842087D;
	Tue, 28 Sep 2021 00:23:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4618942062B
	for <drbd-dev@lists.linbit.com>; Tue, 28 Sep 2021 00:22:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=9wGZZnosWrb9aTYR1SBOukCJpr3hksEMHXreqE1SaGg=;
	b=vE2w2sgbBOa5s2r/fEOjAo4r6A
	vmgVE3sv1Z9pc+/AfsYWsgxHk3CMiGysIlAelw2ykZZM4reECJ+y5g29/vGfuGtxvE1YL4kV1oAo+
	PngUO4oMH91DujUB6uc9VTwURtU0BVWPQ3eHYQc+05YyV+IPxjEYAuLcd+S4oBvvt7RCpiSURqN0T
	gqPdd0ZPsAzm2+jLq4ASrsHuC0TLc0Wkr/nW37J68Cm5vQg2EyCcpueX9BFYyYbOiWgwKQVrfjJSq
	fblMC33qrnfECzL4KyNKkoWcFKmyAte2pJsZ6XhXFzupubwbSpu0dT4gvHZ813DzS396QzHuh4SCl
	85j9WHOg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mUygS-004TPc-4h; Mon, 27 Sep 2021 22:01:12 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 27 Sep 2021 15:01:06 -0700
Message-Id: <20210927220110.1066271-12-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220110.1066271-1-mcgrof@kernel.org>
References: <20210927220110.1066271-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 11/15] pd: cleanup initialization
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
 drivers/block/paride/pd.c | 140 +++++++++++++++++++-------------------
 1 file changed, 70 insertions(+), 70 deletions(-)

diff --git a/drivers/block/paride/pd.c b/drivers/block/paride/pd.c
index 675327df6aff..500b89a4bdaf 100644
--- a/drivers/block/paride/pd.c
+++ b/drivers/block/paride/pd.c
@@ -875,9 +875,27 @@ static const struct blk_mq_ops pd_mq_ops = {
 	.queue_rq	= pd_queue_rq,
 };
 
-static void pd_probe_drive(struct pd_unit *disk)
+static int pd_probe_drive(struct pd_unit *disk, int autoprobe, int port,
+		int mode, int unit, int protocol, int delay)
 {
+	int index = disk - pd;
+	int *parm = *drives[index];
 	struct gendisk *p;
+	int ret;
+
+	disk->pi = &disk->pia;
+	disk->access = 0;
+	disk->changed = 1;
+	disk->capacity = 0;
+	disk->drive = parm[D_SLV];
+	snprintf(disk->name, PD_NAMELEN, "%s%c", name, 'a' + index);
+	disk->alt_geom = parm[D_GEO];
+	disk->standby = parm[D_SBY];
+	INIT_LIST_HEAD(&disk->rq_list);
+
+	if (!pi_init(disk->pi, autoprobe, port, mode, unit, protocol, delay,
+			pd_scratch, PI_PD, verbose, disk->name))
+		return -ENXIO;
 
 	memset(&disk->tag_set, 0, sizeof(disk->tag_set));
 	disk->tag_set.ops = &pd_mq_ops;
@@ -887,14 +905,14 @@ static void pd_probe_drive(struct pd_unit *disk)
 	disk->tag_set.queue_depth = 2;
 	disk->tag_set.numa_node = NUMA_NO_NODE;
 	disk->tag_set.flags = BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING;
-
-	if (blk_mq_alloc_tag_set(&disk->tag_set))
-		return;
+	ret = blk_mq_alloc_tag_set(&disk->tag_set);
+	if (ret)
+		goto pi_release;
 
 	p = blk_mq_alloc_disk(&disk->tag_set, disk);
 	if (IS_ERR(p)) {
-		blk_mq_free_tag_set(&disk->tag_set);
-		return;
+		ret = PTR_ERR(p);
+		goto free_tag_set;
 	}
 	disk->gd = p;
 
@@ -905,102 +923,84 @@ static void pd_probe_drive(struct pd_unit *disk)
 	p->minors = 1 << PD_BITS;
 	p->events = DISK_EVENT_MEDIA_CHANGE;
 	p->private_data = disk;
-
 	blk_queue_max_hw_sectors(p->queue, cluster);
 	blk_queue_bounce_limit(p->queue, BLK_BOUNCE_HIGH);
 
 	if (disk->drive == -1) {
-		for (disk->drive = 0; disk->drive <= 1; disk->drive++)
-			if (pd_special_command(disk, pd_identify) == 0)
-				return;
-	} else if (pd_special_command(disk, pd_identify) == 0)
-		return;
-	disk->gd = NULL;
+		for (disk->drive = 0; disk->drive <= 1; disk->drive++) {
+			ret = pd_special_command(disk, pd_identify);
+			if (ret == 0)
+				break;
+		}
+	} else {
+		ret = pd_special_command(disk, pd_identify);
+	}
+	if (ret)
+		goto put_disk;
+	set_capacity(disk->gd, disk->capacity);
+	add_disk(disk->gd);
+	return 0;
+put_disk:
 	put_disk(p);
+	disk->gd = NULL;
+free_tag_set:
+	blk_mq_free_tag_set(&disk->tag_set);
+pi_release:
+	pi_release(disk->pi);
+	return ret;
 }
 
-static int pd_detect(void)
+static int __init pd_init(void)
 {
 	int found = 0, unit, pd_drive_count = 0;
 	struct pd_unit *disk;
 
-	for (unit = 0; unit < PD_UNITS; unit++) {
-		int *parm = *drives[unit];
-		struct pd_unit *disk = pd + unit;
-		disk->pi = &disk->pia;
-		disk->access = 0;
-		disk->changed = 1;
-		disk->capacity = 0;
-		disk->drive = parm[D_SLV];
-		snprintf(disk->name, PD_NAMELEN, "%s%c", name, 'a'+unit);
-		disk->alt_geom = parm[D_GEO];
-		disk->standby = parm[D_SBY];
-		if (parm[D_PRT])
-			pd_drive_count++;
-		INIT_LIST_HEAD(&disk->rq_list);
-	}
+	if (disable)
+		return -ENODEV;
+
+	if (register_blkdev(major, name))
+		return -ENODEV;
+
+	printk("%s: %s version %s, major %d, cluster %d, nice %d\n",
+	       name, name, PD_VERSION, major, cluster, nice);
 
 	par_drv = pi_register_driver(name);
 	if (!par_drv) {
 		pr_err("failed to register %s driver\n", name);
-		return -1;
+		goto out_unregister_blkdev;
 	}
 
-	if (pd_drive_count == 0) { /* nothing spec'd - so autoprobe for 1 */
-		disk = pd;
-		if (pi_init(disk->pi, 1, -1, -1, -1, -1, -1, pd_scratch,
-			    PI_PD, verbose, disk->name)) {
-			pd_probe_drive(disk);
-			if (!disk->gd)
-				pi_release(disk->pi);
-		}
+	for (unit = 0; unit < PD_UNITS; unit++) {
+		int *parm = *drives[unit];
 
+		if (parm[D_PRT])
+			pd_drive_count++;
+	}
+
+	if (pd_drive_count == 0) { /* nothing spec'd - so autoprobe for 1 */
+		if (!pd_probe_drive(pd, 1, -1, -1, -1, -1, -1))
+			found++;
 	} else {
 		for (unit = 0, disk = pd; unit < PD_UNITS; unit++, disk++) {
 			int *parm = *drives[unit];
 			if (!parm[D_PRT])
 				continue;
-			if (pi_init(disk->pi, 0, parm[D_PRT], parm[D_MOD],
-				     parm[D_UNI], parm[D_PRO], parm[D_DLY],
-				     pd_scratch, PI_PD, verbose, disk->name)) {
-				pd_probe_drive(disk);
-				if (!disk->gd)
-					pi_release(disk->pi);
-			}
-		}
-	}
-	for (unit = 0, disk = pd; unit < PD_UNITS; unit++, disk++) {
-		if (disk->gd) {
-			set_capacity(disk->gd, disk->capacity);
-			add_disk(disk->gd);
-			found = 1;
+			if (!pd_probe_drive(disk, 0, parm[D_PRT], parm[D_MOD],
+					parm[D_UNI], parm[D_PRO], parm[D_DLY]))
+				found++;
 		}
 	}
 	if (!found) {
 		printk("%s: no valid drive found\n", name);
-		pi_unregister_driver(par_drv);
+		goto out_pi_unregister_driver;
 	}
-	return found;
-}
-
-static int __init pd_init(void)
-{
-	if (disable)
-		goto out1;
-
-	if (register_blkdev(major, name))
-		goto out1;
-
-	printk("%s: %s version %s, major %d, cluster %d, nice %d\n",
-	       name, name, PD_VERSION, major, cluster, nice);
-	if (!pd_detect())
-		goto out2;
 
 	return 0;
 
-out2:
+out_pi_unregister_driver:
+	pi_unregister_driver(par_drv);
+out_unregister_blkdev:
 	unregister_blkdev(major, name);
-out1:
 	return -ENODEV;
 }
 
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
