Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4255B2878
	for <lists+drbd-dev@lfdr.de>; Thu,  8 Sep 2022 23:22:33 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 60F62420668;
	Thu,  8 Sep 2022 23:22:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from aragorn.cowesettanimalhospital.com
	(wsip-72-215-235-61.ri.ri.cox.net [72.215.235.61])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 07A354210CC
	for <drbd-dev@lists.linbit.com>; Thu,  8 Sep 2022 23:21:24 +0200 (CEST)
Received: by aragorn.cowesettanimalhospital.com (Postfix, from userid 1200)
	id 3660B1407AE; Thu,  8 Sep 2022 17:13:53 -0400 (EDT)
From: Michael D Labriola <veggiemike@sourceruckus.org>
To: drbd-dev@lists.linbit.com
Date: Thu,  8 Sep 2022 17:13:35 -0400
Message-Id: <20220908211337.17090-2-veggiemike@sourceruckus.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908211337.17090-1-veggiemike@sourceruckus.org>
References: <20220908211337.17090-1-veggiemike@sourceruckus.org>
Subject: [Drbd-dev] [PATCH 1/3] drbd: remove WRITE_SAME support
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

This commit mimics upstream commit a34592ff6b78, which removes all the
WRITE_SAME code because "REQ_OP_WRITE_SAME was only ever submitted by
the legacy Linux zeroing code, which has switched to use
REQ_OP_WRITE_ZEROES long ago."  WRITE_SAME was then removed from Linux
5.18.

Signed-off-by: Michael D Labriola <veggiemike@sourceruckus.org>
---
 drbd/drbd_main.c          | 35 ++++----------------
 drbd/drbd_nl.c            | 70 ++-------------------------------------
 drbd/drbd_receiver.c      | 38 ++++-----------------
 drbd/drbd_req.c           |  1 -
 drbd/drbd_sender.c        |  4 ---
 drbd/drbd_transport_tcp.c |  3 --
 6 files changed, 16 insertions(+), 135 deletions(-)

diff --git a/drbd/drbd_main.c b/drbd/drbd_main.c
index 545d739d..c0b37c9c 100644
--- a/drbd/drbd_main.c
+++ b/drbd/drbd_main.c
@@ -1572,8 +1572,7 @@ int drbd_send_sizes(struct drbd_peer_device *peer_device,
 			queue_discard_zeroes_data(q)
 			/* but that is always false on recent kernels */
 			;
-		p->qlim->write_same_capable = !disable_write_same &&
-			!!q->limits.max_write_same_sectors;
+		p->qlim->write_same_capable = 0;
 		put_ldev(device);
 	} else {
 		struct request_queue *q = device->rq_queue;
@@ -2137,9 +2136,6 @@ static int _drbd_send_bio(struct drbd_peer_device *peer_device, struct bio *bio)
 					 bio_iter_last(bvec, iter) ? 0 : MSG_MORE);
 		if (err)
 			return err;
-		/* WRITE_SAME has only one segment */
-		if (bio_op(bio) == REQ_OP_WRITE_SAME)
-			break;
 
 		peer_device->send_cnt += bvec.bv_len >> 9;
 	}
@@ -2219,7 +2215,6 @@ static u32 bio_flags_to_wire(struct drbd_connection *connection, struct bio *bio
 		return  (bio->bi_opf & REQ_SYNC ? DP_RW_SYNC : 0) |
 			(bio->bi_opf & REQ_FUA ? DP_FUA : 0) |
 			(bio->bi_opf & REQ_PREFLUSH ? DP_FLUSH : 0) |
-			(bio_op(bio) == REQ_OP_WRITE_SAME ? DP_WSAME : 0) |
 			(bio_op(bio) == REQ_OP_DISCARD ? DP_DISCARD : 0) |
 			(bio_op(bio) == REQ_OP_WRITE_ZEROES ?
 			 ((connection->agreed_features & DRBD_FF_WZEROES) ?
@@ -2241,7 +2236,6 @@ int drbd_send_dblock(struct drbd_peer_device *peer_device, struct drbd_request *
 	char *const after = peer_device->connection->scratch_buffer.d.after;
 	struct p_trim *trim = NULL;
 	struct p_data *p;
-	struct p_wsame *wsame = NULL;
 	void *digest_out = NULL;
 	unsigned int dp_flags = 0;
 	int digest_size = 0;
@@ -2259,19 +2253,10 @@ int drbd_send_dblock(struct drbd_peer_device *peer_device, struct drbd_request *
 		if (peer_device->connection->integrity_tfm)
 			digest_size = crypto_shash_digestsize(peer_device->connection->integrity_tfm);
 
-		if (op == REQ_OP_WRITE_SAME) {
-			wsame = drbd_prepare_command(peer_device, sizeof(*wsame) + digest_size, DATA_STREAM);
-			if (!wsame)
-				return -EIO;
-			p = &wsame->p_data;
-			wsame->size = cpu_to_be32(req->i.size);
-			digest_out = wsame + 1;
-		} else {
-			p = drbd_prepare_command(peer_device, sizeof(*p) + digest_size, DATA_STREAM);
-			if (!p)
-				return -EIO;
-			digest_out = p + 1;
-		}
+		p = drbd_prepare_command(peer_device, sizeof(*p) + digest_size, DATA_STREAM);
+		if (!p)
+			return -EIO;
+		digest_out = p + 1;
 	}
 
 	p->sector = cpu_to_be64(req->i.sector);
@@ -2300,14 +2285,8 @@ int drbd_send_dblock(struct drbd_peer_device *peer_device, struct drbd_request *
 		memcpy(digest_out, before, digest_size);
 	}
 
-	if (wsame) {
-		additional_size_command(peer_device->connection, DATA_STREAM,
-					bio_iovec(req->master_bio).bv_len);
-		err = __send_command(peer_device->connection, device->vnr, P_WSAME, DATA_STREAM);
-	} else {
-		additional_size_command(peer_device->connection, DATA_STREAM, req->i.size);
-		err = __send_command(peer_device->connection, device->vnr, P_DATA, DATA_STREAM);
-	}
+	additional_size_command(peer_device->connection, DATA_STREAM, req->i.size);
+	err = __send_command(peer_device->connection, device->vnr, P_DATA, DATA_STREAM);
 	if (!err) {
 		/* For protocol A, we have to memcpy the payload into
 		 * socket buffers, as we may complete right away
diff --git a/drbd/drbd_nl.c b/drbd/drbd_nl.c
index 4d7af4f4..79464bb7 100644
--- a/drbd/drbd_nl.c
+++ b/drbd/drbd_nl.c
@@ -1996,69 +1996,6 @@ static void fixup_write_zeroes(struct drbd_device *device, struct request_queue
 		q->limits.max_write_zeroes_sectors = 0;
 }
 
-static void decide_on_write_same_support(struct drbd_device *device,
-			struct request_queue *q,
-			struct request_queue *b, struct o_qlim *o,
-			bool disable_write_same)
-{
-	bool can_do = b ? b->limits.max_write_same_sectors : true;
-
-	if (can_do && disable_write_same) {
-		can_do = false;
-		drbd_info(device, "WRITE_SAME disabled by config\n");
-	}
-
-	if (can_do && !(common_connection_features(device->resource) & DRBD_FF_WSAME)) {
-		can_do = false;
-		drbd_info(device, "peer does not support WRITE_SAME\n");
-	}
-
-	if (o) {
-		/* logical block size; queue_logical_block_size(NULL) is 512 */
-		unsigned int peer_lbs = be32_to_cpu(o->logical_block_size);
-		unsigned int me_lbs_b = queue_logical_block_size(b);
-		unsigned int me_lbs = queue_logical_block_size(q);
-
-		if (me_lbs_b != me_lbs) {
-			drbd_warn(device,
-				"logical block size of local backend does not match (drbd:%u, backend:%u); was this a late attach?\n",
-				me_lbs, me_lbs_b);
-			/* rather disable write same than trigger some BUG_ON later in the scsi layer. */
-			can_do = false;
-		}
-		if (me_lbs_b != peer_lbs) {
-			drbd_warn(device, "logical block sizes do not match (me:%u, peer:%u); this may cause problems.\n",
-				me_lbs, peer_lbs);
-			if (can_do) {
-				dynamic_drbd_dbg(device, "logical block size mismatch: WRITE_SAME disabled.\n");
-				can_do = false;
-			}
-			me_lbs = max(me_lbs, me_lbs_b);
-			/* We cannot change the logical block size of an in-use queue.
-			 * We can only hope that access happens to be properly aligned.
-			 * If not, the peer will likely produce an IO error, and detach. */
-			if (peer_lbs > me_lbs) {
-				if (device->resource->role[NOW] != R_PRIMARY) {
-					blk_queue_logical_block_size(q, peer_lbs);
-					drbd_warn(device, "logical block size set to %u\n", peer_lbs);
-				} else {
-					drbd_warn(device,
-						"current Primary must NOT adjust logical block size (%u -> %u); hope for the best.\n",
-						me_lbs, peer_lbs);
-				}
-			}
-		}
-		if (can_do && !o->write_same_capable) {
-			/* If we introduce an open-coded write-same loop on the receiving side,
-			 * the peer would present itself as "capable". */
-			dynamic_drbd_dbg(device, "WRITE_SAME disabled (peer device not capable)\n");
-			can_do = false;
-		}
-	}
-
-	blk_queue_max_write_same_sectors(q, can_do ? DRBD_MAX_BBIO_SECTORS : 0);
-}
-
 static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backing_dev *bdev,
 				   unsigned int max_bio_size, struct o_qlim *o)
 {
@@ -2067,7 +2004,6 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 	struct request_queue *b = NULL;
 	struct disk_conf *dc;
 	bool discard_zeroes_if_aligned = true;
-	bool disable_write_same = false;
 
 	if (bdev) {
 		b = bdev->backing_bdev->bd_disk->queue;
@@ -2076,7 +2012,6 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 		rcu_read_lock();
 		dc = rcu_dereference(device->ldev->disk_conf);
 		discard_zeroes_if_aligned = dc->discard_zeroes_if_aligned;
-		disable_write_same = dc->disable_write_same;
 		rcu_read_unlock();
 
 		blk_set_stacking_limits(&q->limits);
@@ -2086,7 +2021,6 @@ static void drbd_setup_queue_param(struct drbd_device *device, struct drbd_backi
 	/* This is the workaround for "bio would need to, but cannot, be split" */
 	blk_queue_segment_boundary(q, PAGE_SIZE-1);
 	decide_on_discard_support(device, q, b, o, discard_zeroes_if_aligned);
-	decide_on_write_same_support(device, q, b, o, disable_write_same);
 
 	if (b) {
 		blk_stack_limits(&q->limits, &b->limits, 0);
@@ -2358,8 +2292,8 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 	if (write_ordering_changed(old_disk_conf, new_disk_conf))
 		drbd_bump_write_ordering(device->resource, NULL, WO_BIO_BARRIER);
 
-	if (old_disk_conf->discard_zeroes_if_aligned != new_disk_conf->discard_zeroes_if_aligned
-	||  old_disk_conf->disable_write_same != new_disk_conf->disable_write_same)
+	if (old_disk_conf->discard_zeroes_if_aligned !=
+	    new_disk_conf->discard_zeroes_if_aligned)
 		drbd_reconsider_queue_parameters(device, device->ldev, NULL);
 
 	drbd_md_sync_if_dirty(device);
diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index 4783d58e..eba6a3c4 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -1746,17 +1746,6 @@ static void drbd_issue_peer_discard_or_zero_out(struct drbd_device *device, stru
 	drbd_endio_write_sec_final(peer_req);
 }
 
-static void drbd_issue_peer_wsame(struct drbd_device *device,
-				  struct drbd_peer_request *peer_req)
-{
-	struct block_device *bdev = device->ldev->backing_bdev;
-	sector_t s = peer_req->i.sector;
-	sector_t nr = peer_req->i.size >> 9;
-	if (blkdev_issue_write_same(bdev, s, nr, GFP_NOIO, peer_req->page_chain.head))
-		peer_req->flags |= EE_WAS_ERROR;
-	drbd_endio_write_sec_final(peer_req);
-}
-
 static bool conn_wait_ee_cond(struct drbd_connection *connection, struct list_head *head)
 {
 	bool done;
@@ -1827,14 +1816,11 @@ int drbd_submit_peer_request(struct drbd_peer_request *peer_req)
 	 * Correctness first, performance later.  Next step is to code an
 	 * asynchronous variant of the same.
 	 */
-	if (peer_req->flags & (EE_TRIM|EE_WRITE_SAME|EE_ZEROOUT)) {
+	if (peer_req->flags & (EE_TRIM|EE_ZEROOUT)) {
 		peer_req->submit_jif = jiffies;
 		peer_req->flags |= EE_SUBMITTED;
 
-		if (peer_req->flags & (EE_TRIM|EE_ZEROOUT))
-			drbd_issue_peer_discard_or_zero_out(device, peer_req);
-		else /* EE_WRITE_SAME */
-			drbd_issue_peer_wsame(device, peer_req);
+		drbd_issue_peer_discard_or_zero_out(device, peer_req);
 		return 0;
 	}
 
@@ -1847,7 +1833,7 @@ int drbd_submit_peer_request(struct drbd_peer_request *peer_req)
 	 * generated bio, but a bio allocated on behalf of the peer.
 	 */
 next_bio:
-	/* REQ_OP_WRITE_SAME, _DISCARD, _WRITE_ZEROES handled above.
+	/* _DISCARD, _WRITE_ZEROES handled above.
 	 * REQ_OP_FLUSH (empty flush) not expected,
 	 * should have been mapped to a "drbd protocol barrier".
 	 * REQ_OP_SECURE_ERASE: I don't see how we could ever support that.
@@ -2118,7 +2104,7 @@ static void p_req_detail_from_pi(struct drbd_connection *connection,
 		struct drbd_peer_request_details *d, struct packet_info *pi)
 {
 	struct p_trim *p = pi->data;
-	bool is_trim_or_wsame = pi->cmd == P_TRIM || pi->cmd == P_WSAME || pi->cmd == P_ZEROES;
+	bool is_trim_or_zeroes = pi->cmd == P_TRIM || pi->cmd == P_ZEROES;
 	unsigned int digest_size =
 		pi->cmd != P_TRIM && connection->peer_integrity_tfm ?
 		crypto_shash_digestsize(connection->peer_integrity_tfm) : 0;
@@ -2128,7 +2114,7 @@ static void p_req_detail_from_pi(struct drbd_connection *connection,
 	d->peer_seq = be64_to_cpu(p->p_data.seq_num);
 	d->dp_flags = be32_to_cpu(p->p_data.dp_flags);
 	d->length = pi->size;
-	d->bi_size = is_trim_or_wsame ? be32_to_cpu(p->size) : pi->size - digest_size;
+	d->bi_size = is_trim_or_zeroes ? be32_to_cpu(p->size) : pi->size - digest_size;
 	d->digest_size = digest_size;
 }
 
@@ -2161,7 +2147,7 @@ read_in_block(struct drbd_peer_device *peer_device, struct drbd_peer_request_det
 
 	if (!expect(peer_device, IS_ALIGNED(d->bi_size, 512)))
 		return NULL;
-	if (d->dp_flags & (DP_WSAME|DP_DISCARD|DP_ZEROES)) {
+	if (d->dp_flags & (DP_DISCARD|DP_ZEROES)) {
 		if (!expect(peer_device, d->bi_size <= (DRBD_MAX_BBIO_SECTORS << 9)))
 			return NULL;
 	} else if (!expect(peer_device, d->bi_size <= DRBD_MAX_BIO_SIZE))
@@ -2696,10 +2682,7 @@ static unsigned long wire_flags_to_bio_op(u32 dpf)
 		return REQ_OP_WRITE_ZEROES;
 	if (dpf & DP_DISCARD)
 		return REQ_OP_DISCARD;
-	if (dpf & DP_WSAME)
-		return REQ_OP_WRITE_SAME;
-	else
-		return REQ_OP_WRITE;
+	return REQ_OP_WRITE;
 }
 
 /* see also bio_flags_to_wire() */
@@ -2908,8 +2891,6 @@ static int receive_Data(struct drbd_connection *connection, struct packet_info *
 		peer_req->flags |= EE_TRIM;
 	else if (pi->cmd == P_ZEROES)
 		peer_req->flags |= EE_ZEROOUT;
-	else if (pi->cmd == P_WSAME)
-		peer_req->flags |= EE_WRITE_SAME;
 
 	peer_req->dagtag_sector = atomic64_read(&connection->last_dagtag_sector) + (peer_req->i.size >> 9);
 	atomic64_set(&connection->last_dagtag_sector, peer_req->dagtag_sector);
@@ -2937,10 +2918,6 @@ static int receive_Data(struct drbd_connection *connection, struct packet_info *
 		/* Do (not) pass down BLKDEV_ZERO_NOUNMAP? */
 		if (d.dp_flags & DP_DISCARD)
 			peer_req->flags |= EE_TRIM;
-	} else if (pi->cmd == P_WSAME) {
-		D_ASSERT(peer_device, peer_req->i.size > 0);
-		D_ASSERT(peer_device, peer_req_op(peer_req) == REQ_OP_WRITE_SAME);
-		D_ASSERT(peer_device, peer_req->page_chain.head != NULL);
 	} else if (peer_req->page_chain.head == NULL) {
 		/* Actually, this must not happen anymore,
 		 * "empty" flushes are mapped to P_BARRIER,
@@ -8127,7 +8104,6 @@ static struct data_cmd drbd_cmd_handler[] = {
 	[P_TRIM]	    = { 0, sizeof(struct p_trim), receive_Data },
 	[P_ZEROES]	    = { 0, sizeof(struct p_trim), receive_Data },
 	[P_RS_DEALLOCATED]  = { 0, sizeof(struct p_block_desc), receive_rs_deallocated },
-	[P_WSAME]	    = { 1, sizeof(struct p_wsame), receive_Data },
 	[P_DISCONNECT]      = { 0, 0, receive_disconnect },
 };
 
diff --git a/drbd/drbd_req.c b/drbd/drbd_req.c
index dc0eb613..f58bfc4a 100644
--- a/drbd/drbd_req.c
+++ b/drbd/drbd_req.c
@@ -54,7 +54,6 @@ static struct drbd_request *drbd_req_new(struct drbd_device *device, struct bio
 	spin_lock_init(&req->rq_lock);
 
 	req->local_rq_state = (bio_data_dir(bio_src) == WRITE ? RQ_WRITE : 0)
-	              | (bio_op(bio_src) == REQ_OP_WRITE_SAME ? RQ_WSAME : 0)
 	              | (bio_op(bio_src) == REQ_OP_WRITE_ZEROES ? RQ_ZEROES : 0)
 	              | (bio_op(bio_src) == REQ_OP_DISCARD ? RQ_UNMAP : 0);
 
diff --git a/drbd/drbd_sender.c b/drbd/drbd_sender.c
index d4759d82..22a5a996 100644
--- a/drbd/drbd_sender.c
+++ b/drbd/drbd_sender.c
@@ -355,10 +355,6 @@ void drbd_csum_bio(struct crypto_shash *tfm, struct bio *bio, void *digest)
 		src = kmap_atomic(bvec.bv_page);
 		crypto_shash_update(desc, src + bvec.bv_offset, bvec.bv_len);
 		kunmap_atomic(src);
-		/* WRITE_SAME has only one segment,
-		 * checksum the payload only once. */
-		if (bio_op(bio) == REQ_OP_WRITE_SAME)
-			break;
 	}
 	crypto_shash_final(desc, digest);
 	shash_desc_zero(desc);
diff --git a/drbd/drbd_transport_tcp.c b/drbd/drbd_transport_tcp.c
index 9911d26a..29ff0bcf 100644
--- a/drbd/drbd_transport_tcp.c
+++ b/drbd/drbd_transport_tcp.c
@@ -1225,9 +1225,6 @@ static int dtt_send_zc_bio(struct drbd_transport *transport, struct bio *bio)
 				      bio_iter_last(bvec, iter) ? 0 : MSG_MORE);
 		if (err)
 			return err;
-
-		if (bio_op(bio) == REQ_OP_WRITE_SAME)
-			break;
 	}
 	return 0;
 }
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
