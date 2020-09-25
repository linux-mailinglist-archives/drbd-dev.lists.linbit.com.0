Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA11278DAA
	for <lists+drbd-dev@lfdr.de>; Fri, 25 Sep 2020 18:08:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BF5B242102C;
	Fri, 25 Sep 2020 18:08:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B680E420F4F
	for <drbd-dev@lists.linbit.com>; Fri, 25 Sep 2020 18:08:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EjNzpvnboK85JerXPDGgwG3Wix6vw2AAW2Aa987eicI=;
	b=kfwta0/sEXuCC5v0z8RUfR/RE5
	Gx1BgIcz/F6duPnjOLQQ79j7lrVsBMBem2hlH0pyPbDVTKNSWWgHr/OS5zzg9lrl5fKoGfoXj73JR
	JnASkhPsjuQV5QjYlxG1WOHmzPfP1K7Dvgfz8+QtLNWoMJoy58YpsgHNh5uOGiFLPuWoYjOe4cGAs
	nKOIGsUmkwPT4x+S433aNYuBRE2bacMWTsxyQ/AflCPDBVdNUNsyrsZy/Nh4ssbDK2K75dSNCChJy
	Wyy/OofGpX0t3/VU0t1SUqIJSp2eF19h0vNF5IgIEHaLYDPpLWHZ2bF+TCPAaqFFFun1EbNd5YS7a
	/ldbRxaA==;
Received: from [213.208.157.35] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLqEy-0003OL-Ua; Fri, 25 Sep 2020 16:06:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Sep 2020 18:06:17 +0200
Message-Id: <20200925160618.1481450-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200925160618.1481450-1-hch@lst.de>
References: <20200925160618.1481450-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org
Subject: [Drbd-dev] [PATCH 1/2] drbd: remove ->this_bdev
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

DRBD keeps a block device open just to get and set the capacity from
it.  Switch to primarily using the disk capacity as intended by the
block layer, and sync it to the bdev using revalidate_disk_size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_actlog.c   |  2 +-
 drivers/block/drbd/drbd_int.h      |  1 -
 drivers/block/drbd/drbd_main.c     | 29 ++++++++++++-----------------
 drivers/block/drbd/drbd_nl.c       | 10 ++++------
 drivers/block/drbd/drbd_receiver.c | 10 +++++-----
 drivers/block/drbd/drbd_req.c      |  2 +-
 drivers/block/drbd/drbd_worker.c   |  4 ++--
 7 files changed, 25 insertions(+), 33 deletions(-)

diff --git a/drivers/block/drbd/drbd_actlog.c b/drivers/block/drbd/drbd_actlog.c
index b41897dceb2b90..7227fc7ab8ed1e 100644
--- a/drivers/block/drbd/drbd_actlog.c
+++ b/drivers/block/drbd/drbd_actlog.c
@@ -865,7 +865,7 @@ int __drbd_change_sync(struct drbd_device *device, sector_t sector, int size,
 	if (!get_ldev(device))
 		return 0; /* no disk, no metadata, no bitmap to manipulate bits in */
 
-	nr_sectors = drbd_get_capacity(device->this_bdev);
+	nr_sectors = get_capacity(device->vdisk);
 	esector = sector + (size >> 9) - 1;
 
 	if (!expect(sector < nr_sectors))
diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index 740e93bad21feb..8f879e5c2f6706 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -841,7 +841,6 @@ struct drbd_device {
 
 	sector_t p_size;     /* partner's disk size */
 	struct request_queue *rq_queue;
-	struct block_device *this_bdev;
 	struct gendisk	    *vdisk;
 
 	unsigned long last_reattach_jif;
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index bd8b129196d49a..85c865ab485faa 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -984,7 +984,10 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device, int trigger_reply, enu
 
 	p->d_size = cpu_to_be64(d_size);
 	p->u_size = cpu_to_be64(u_size);
-	p->c_size = cpu_to_be64(trigger_reply ? 0 : drbd_get_capacity(device->this_bdev));
+	if (trigger_reply)
+		p->c_size = 0;
+	else
+		p->c_size = cpu_to_be64(get_capacity(device->vdisk));
 	p->max_bio_size = cpu_to_be32(max_bio_size);
 	p->queue_order_type = cpu_to_be16(q_order_type);
 	p->dds_flags = cpu_to_be16(flags);
@@ -2029,17 +2032,13 @@ void drbd_init_set_defaults(struct drbd_device *device)
 	device->local_max_bio_size = DRBD_MAX_BIO_SIZE_SAFE;
 }
 
-static void _drbd_set_my_capacity(struct drbd_device *device, sector_t size)
-{
-	/* set_capacity(device->this_bdev->bd_disk, size); */
-	set_capacity(device->vdisk, size);
-	device->this_bdev->bd_inode->i_size = (loff_t)size << 9;
-}
-
 void drbd_set_my_capacity(struct drbd_device *device, sector_t size)
 {
 	char ppb[10];
-	_drbd_set_my_capacity(device, size);
+
+	set_capacity(device->vdisk, size);
+	revalidate_disk_size(device->vdisk, false);
+
 	drbd_info(device, "size = %s (%llu KB)\n",
 		ppsize(ppb, size>>1), (unsigned long long)size>>1);
 }
@@ -2069,7 +2068,8 @@ void drbd_device_cleanup(struct drbd_device *device)
 	}
 	D_ASSERT(device, first_peer_device(device)->connection->net_conf == NULL);
 
-	_drbd_set_my_capacity(device, 0);
+	set_capacity(device->vdisk, 0);
+	revalidate_disk_size(device->vdisk, false);
 	if (device->bitmap) {
 		/* maybe never allocated. */
 		drbd_bm_resize(device, 0, 1);
@@ -2236,9 +2236,6 @@ void drbd_destroy_device(struct kref *kref)
 	/* cleanup stuff that may have been allocated during
 	 * device (re-)configuration or state changes */
 
-	if (device->this_bdev)
-		bdput(device->this_bdev);
-
 	drbd_backing_dev_free(device, device->ldev);
 	device->ldev = NULL;
 
@@ -2765,8 +2762,6 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 	sprintf(disk->disk_name, "drbd%d", minor);
 	disk->private_data = device;
 
-	device->this_bdev = bdget(MKDEV(DRBD_MAJOR, minor));
-
 	blk_queue_write_cache(q, true, true);
 	/* Setting the max_hw_sectors to an odd value of 8kibyte here
 	   This triggers a max_bio_size message upon first attach or connect */
@@ -3042,7 +3037,7 @@ void drbd_md_write(struct drbd_device *device, void *b)
 
 	memset(buffer, 0, sizeof(*buffer));
 
-	buffer->la_size_sect = cpu_to_be64(drbd_get_capacity(device->this_bdev));
+	buffer->la_size_sect = cpu_to_be64(get_capacity(device->vdisk));
 	for (i = UI_CURRENT; i < UI_SIZE; i++)
 		buffer->uuid[i] = cpu_to_be64(device->ldev->md.uuid[i]);
 	buffer->flags = cpu_to_be32(device->ldev->md.flags);
@@ -3100,7 +3095,7 @@ void drbd_md_sync(struct drbd_device *device)
 
 	/* Update device->ldev->md.la_size_sect,
 	 * since we updated it on metadata. */
-	device->ldev->md.la_size_sect = drbd_get_capacity(device->this_bdev);
+	device->ldev->md.la_size_sect = get_capacity(device->vdisk);
 
 	drbd_md_put_buffer(device);
 out:
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 54a4930c04fe07..bf7de4c7b96c19 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -996,7 +996,7 @@ drbd_determine_dev_size(struct drbd_device *device, enum dds_flags flags, struct
 			goto err_out;
 	}
 
-	if (drbd_get_capacity(device->this_bdev) != size ||
+	if (get_capacity(device->vdisk) != size ||
 	    drbd_bm_capacity(device) != size) {
 		int err;
 		err = drbd_bm_resize(device, size, !(flags & DDSF_NO_RESYNC));
@@ -1933,8 +1933,7 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 
 	/* Make sure the new disk is big enough
 	 * (we may currently be R_PRIMARY with no local disk...) */
-	if (drbd_get_max_capacity(nbc) <
-	    drbd_get_capacity(device->this_bdev)) {
+	if (drbd_get_max_capacity(nbc) < get_capacity(device->vdisk)) {
 		retcode = ERR_DISK_TOO_SMALL;
 		goto fail;
 	}
@@ -3377,7 +3376,7 @@ static void device_to_statistics(struct device_statistics *s,
 		s->dev_disk_flags = md->flags;
 		put_ldev(device);
 	}
-	s->dev_size = drbd_get_capacity(device->this_bdev);
+	s->dev_size = get_capacity(device->vdisk);
 	s->dev_read = device->read_cnt;
 	s->dev_write = device->writ_cnt;
 	s->dev_al_writes = device->al_writ_cnt;
@@ -3817,8 +3816,7 @@ static int nla_put_status_info(struct sk_buff *skb, struct drbd_device *device,
 	if (nla_put_u32(skb, T_sib_reason, sib ? sib->sib_reason : SIB_GET_STATUS_REPLY) ||
 	    nla_put_u32(skb, T_current_state, device->state.i) ||
 	    nla_put_u64_0pad(skb, T_ed_uuid, device->ed_uuid) ||
-	    nla_put_u64_0pad(skb, T_capacity,
-			     drbd_get_capacity(device->this_bdev)) ||
+	    nla_put_u64_0pad(skb, T_capacity, get_capacity(device->vdisk)) ||
 	    nla_put_u64_0pad(skb, T_send_cnt, device->send_cnt) ||
 	    nla_put_u64_0pad(skb, T_recv_cnt, device->recv_cnt) ||
 	    nla_put_u64_0pad(skb, T_read_cnt, device->read_cnt) ||
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 2d16fb0905999d..dc333dbe523281 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1860,7 +1860,7 @@ read_in_block(struct drbd_peer_device *peer_device, u64 id, sector_t sector,
 	      struct packet_info *pi) __must_hold(local)
 {
 	struct drbd_device *device = peer_device->device;
-	const sector_t capacity = drbd_get_capacity(device->this_bdev);
+	const sector_t capacity = get_capacity(device->vdisk);
 	struct drbd_peer_request *peer_req;
 	struct page *page;
 	int digest_size, err;
@@ -2849,7 +2849,7 @@ static int receive_DataRequest(struct drbd_connection *connection, struct packet
 	if (!peer_device)
 		return -EIO;
 	device = peer_device->device;
-	capacity = drbd_get_capacity(device->this_bdev);
+	capacity = get_capacity(device->vdisk);
 
 	sector = be64_to_cpu(p->sector);
 	size   = be32_to_cpu(p->blksize);
@@ -4117,7 +4117,7 @@ static int receive_sizes(struct drbd_connection *connection, struct packet_info
 	if (!peer_device)
 		return config_unknown_volume(connection, pi);
 	device = peer_device->device;
-	cur_size = drbd_get_capacity(device->this_bdev);
+	cur_size = get_capacity(device->vdisk);
 
 	p_size = be64_to_cpu(p->d_size);
 	p_usize = be64_to_cpu(p->u_size);
@@ -4252,8 +4252,8 @@ static int receive_sizes(struct drbd_connection *connection, struct packet_info
 	}
 
 	if (device->state.conn > C_WF_REPORT_PARAMS) {
-		if (be64_to_cpu(p->c_size) !=
-		    drbd_get_capacity(device->this_bdev) || ldsc) {
+		if (be64_to_cpu(p->c_size) != get_capacity(device->vdisk) ||
+		    ldsc) {
 			/* we have different sizes, probably peer
 			 * needs to know my new size... */
 			drbd_send_sizes(peer_device, 0, ddsf);
diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index 5c975af9c15fb8..330f851cb8f0b0 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -888,7 +888,7 @@ static bool drbd_may_do_local_read(struct drbd_device *device, sector_t sector,
 	if (device->state.disk != D_INCONSISTENT)
 		return false;
 	esector = sector + (size >> 9) - 1;
-	nr_sectors = drbd_get_capacity(device->this_bdev);
+	nr_sectors = get_capacity(device->vdisk);
 	D_ASSERT(device, sector  < nr_sectors);
 	D_ASSERT(device, esector < nr_sectors);
 
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 9107b109ba7bcb..ba56f3f05312f0 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -591,7 +591,7 @@ static int make_resync_request(struct drbd_device *const device, int cancel)
 	struct drbd_connection *const connection = peer_device ? peer_device->connection : NULL;
 	unsigned long bit;
 	sector_t sector;
-	const sector_t capacity = drbd_get_capacity(device->this_bdev);
+	const sector_t capacity = get_capacity(device->vdisk);
 	int max_bio_size;
 	int number, rollback_i, size;
 	int align, requeue = 0;
@@ -769,7 +769,7 @@ static int make_ov_request(struct drbd_device *device, int cancel)
 {
 	int number, i, size;
 	sector_t sector;
-	const sector_t capacity = drbd_get_capacity(device->this_bdev);
+	const sector_t capacity = get_capacity(device->vdisk);
 	bool stop_sector_reached = false;
 
 	if (unlikely(cancel))
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
