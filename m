Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGJhFsAIx2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:46:24 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id EC17A34C1B5
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:46:23 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8AA0416315A;
	Fri, 27 Mar 2026 23:46:23 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5A6F416312D
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:39:10 +0100 (CET)
Received: by mail-wr1-f44.google.com with SMTP id
	ffacd0b85a97d-43b9f43a1feso840963f8f.1
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651150;
	x=1775255950; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=yS1c/Qu/MTl7SvUphjl7ia6GFCb96EzzGzJcN6z5A/8=;
	b=1cudeiJzQWAl6fA88R3rWHVD42Oe81T2LQbNVuuM0oZpgfn665GbkBFvuFx6RE13Nq
	8CLFpxRqH3xIUG2rplILZfncmAY55pINFBLhlF5PuyMvLilCZskowlQucNCkYbien+HS
	HUTCLpSN9kWXkbxVCr4ZGu0c9KFLpL/oPZCZqg9t5+eyw5Z53JDKTEgpozVb1ssPE+kI
	wutiftfDJ6xF4AjAQSf98TX78T65RD5q3Zj1xdBfSyy+ziq7MI8vsb1jsoaRKHaMzShJ
	fT34IJxqHmCfn/vhNEesUcV2VlxWpxvH0XoCj5STJimyOspp4ixJbORjnoEvufGYXADc
	/TrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651150; x=1775255950;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=yS1c/Qu/MTl7SvUphjl7ia6GFCb96EzzGzJcN6z5A/8=;
	b=FCHa5Jz4zNkGk7ZxdXvSDoVu2sbqKKHvHX+ra9OsNurrlr+D7zP6KztUGxJj2Zo/1S
	pUvOZZ8k0rNfoicajADAUhY5DUac0RBmxa/WREpxjSSDUMskdUupvMynHS0ISTtTW9H+
	LJ4YKu+S6GtWi28MeFsklkVJC6yKus9iLC5avu3fNzQz/ShpzJWx/YOhAgvCGOOt/qbu
	ebU+QMCK32Lh4zVcIslXR7hO8JbVt623X+Y7zVKiXvQdOEsgBnePDTku0vicjrexbYBR
	l15WZmyeREMWMJRcn1DIi/HiSauFaGSaAoeHo8G5THSxKDNBHqREjPj1yRxqAqCrPkuC
	tSiA==
X-Gm-Message-State: AOJu0YyUApOnSZqAeNcU6qOqRLhagz2ytRFHSDiC3PsDg6jdRKsYYVEC
	KbKl/ZUhLpgAgdnfL5QE6pGUS2g+IKgdPkYHRDmPHjqiNjRNJ1EZzKBYOpz3KKWpvh0f4A==
X-Gm-Gg: ATEYQzzNqteakWzbS4tSKLKhrp4yP6i8vXFlNSCYRtDn0u1we7rXS1upviPu/z9uGtC
	yolmM3246jjYYea80GcpofjW9fuyOIkmMW3YsZLuPwDn2spWEE7IIis+92RYTun1AhI3iLrm99b
	fgIVaZy4dAbrEey6qwOAFhjShAO+LwYDoxN0V0AbpH/6zaAm9cBFpy41DMuAKUuHITM+aA9engj
	IqkWGoo0ozWp8qBOv5xb+p4YJ5sly4dN7hPjDq2VzndbQMys+hmNnpPwT1t19/tWm4pNBa74gmq
	U6eyTI9knfq0YeApo3CnfFRPQ1wWkByiQ9COIKGHW41nDMosetFeUny5Tcx2Ia1ZCftQSUrQ+QU
	ViAgWhyGGFToGuctqVR3LnanN1sr5a/B52QPvhK8Xx+j4UKW626RO5cpuMma6TVjckGdmMWtw56
	RVdaEAoIaTnMj8A3NcTErNSO34nlSSaoa9+2N1vLV7QUt3ZqmBYyWSLcd7juphoDdY0TEvZD6X/
	x0EiSzAddQYgQkzUMSU6w==
X-Received: by 2002:a05:6000:2c03:b0:43b:801e:488e with SMTP id
	ffacd0b85a97d-43b9e9ea4f2mr6393908f8f.15.1774651148912; 
	Fri, 27 Mar 2026 15:39:08 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.39.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:39:07 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 11/20] drbd: rework sender for DRBD 9 multi-peer
Date: Fri, 27 Mar 2026 23:38:11 +0100
Message-ID: <20260327223820.2244227-12-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 27 Mar 2026 23:46:22 +0100
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	NEURAL_SPAM(0.00)[0.752];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[m.bio:url,mail19.linbit.com:helo,mail19.linbit.com:rdns,linbit.com:email,linbit.com:mid]
X-Rspamd-Queue-Id: EC17A34C1B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Split the single legacy worker thread into two: a per-connection
sender thread that drives the transfer log and replication data, and
a per-resource worker thread for background device tasks.
Resync and online-verify state moves entirely from the device to the
per-peer-device object.

Rewrite the resync request path around the interval tree instead of
the old resync-LRU extent locking, so conflict detection against
application I/O is precise rather than coarse-grained.
Resync requests carry DAG-tag ordering information if the peer supports
it, allowing the sync source to safely reorder replies.

Variable bitmap block sizes are handled correctly across peers with
different bitmap granularities.

Tighten locking throughout: replace the per-resource request spinlock
by a read-write state lock plus fine-grained per-connection and
per-device locks.
Move I/O completion tracking from per-device lists to per-connection
counters.
Switch the resync controller to nanosecond precision for better
throughput adaptation.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Co-developed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Co-developed-by: Joel Colledge <joel.colledge@linbit.com>
Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
Co-developed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_sender.c | 3974 +++++++++++++++++++++---------
 1 file changed, 2811 insertions(+), 1163 deletions(-)

diff --git a/drivers/block/drbd/drbd_sender.c b/drivers/block/drbd/drbd_sender.c
index 0697f99fed18..bb854a3bc6b1 100644
--- a/drivers/block/drbd/drbd_sender.c
+++ b/drivers/block/drbd/drbd_sender.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-   drbd_worker.c
+   drbd_sender.c
 
    This file is part of DRBD by Philipp Reisner and Lars Ellenberg.
 
@@ -9,27 +9,32 @@
    Copyright (C) 2002-2008, Lars Ellenberg <lars.ellenberg@linbit.com>.
 
 
-*/
+ */
 
-#include <linux/module.h>
 #include <linux/drbd.h>
+#include <linux/sched.h>
 #include <linux/sched/signal.h>
 #include <linux/wait.h>
 #include <linux/mm.h>
-#include <linux/memcontrol.h>
+#include <linux/memcontrol.h> /* needed on kernels <4.3 */
 #include <linux/mm_inline.h>
 #include <linux/slab.h>
 #include <linux/random.h>
-#include <linux/string.h>
-#include <linux/scatterlist.h>
+#include <linux/overflow.h>
 #include <linux/part_stat.h>
 
 #include "drbd_int.h"
 #include "drbd_protocol.h"
 #include "drbd_req.h"
+#include "drbd_meta_data.h"
+
+void drbd_panic_after_delayed_completion_of_aborted_request(struct drbd_device *device);
 
 static int make_ov_request(struct drbd_peer_device *, int);
 static int make_resync_request(struct drbd_peer_device *, int);
+static bool should_send_barrier(struct drbd_connection *, unsigned int epoch);
+static void maybe_send_barrier(struct drbd_connection *, unsigned int);
+static unsigned long get_work_bits(const unsigned long mask, unsigned long *flags);
 
 /* endio handlers:
  *   drbd_md_endio (defined here)
@@ -51,10 +56,13 @@ void drbd_md_endio(struct bio *bio)
 {
 	struct drbd_device *device;
 
+	blk_status_t status = bio->bi_status;
+
 	device = bio->bi_private;
-	device->md_io.error = blk_status_to_errno(bio->bi_status);
+	device->md_io.error = blk_status_to_errno(status);
 
 	/* special case: drbd_md_read() during drbd_adm_attach() */
+	/* ldev_ref_transfer: ldev ref from bio submit in md I/O path */
 	if (device->ldev)
 		put_ldev(device);
 	bio_put(bio);
@@ -68,7 +76,7 @@ void drbd_md_endio(struct bio *bio)
 	 * Make sure we first drop the reference, and only then signal
 	 * completion, or we may (in drbd_al_read_log()) cycle so fast into the
 	 * next drbd_md_sync_page_io(), that we trigger the
-	 * ASSERT(atomic_read(&device->md_io_in_use) == 1) there.
+	 * ASSERT(atomic_read(&mdev->md_io_in_use) == 1) there.
 	 */
 	drbd_md_put_buffer(device);
 	device->md_io.done = 1;
@@ -78,89 +86,148 @@ void drbd_md_endio(struct bio *bio)
 /* reads on behalf of the partner,
  * "submitted" by the receiver
  */
-static void drbd_endio_read_sec_final(struct drbd_peer_request *peer_req) __releases(local)
+static void drbd_endio_read_sec_final(struct drbd_peer_request *peer_req)
 {
-	unsigned long flags = 0;
 	struct drbd_peer_device *peer_device = peer_req->peer_device;
 	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection = peer_device->connection;
+	bool io_error;
 
-	spin_lock_irqsave(&device->resource->req_lock, flags);
 	device->read_cnt += peer_req->i.size >> 9;
-	list_del(&peer_req->w.list);
-	if (list_empty(&device->read_ee))
-		wake_up(&device->ee_wait);
-	if (test_bit(__EE_WAS_ERROR, &peer_req->flags))
-		__drbd_chk_io_error(device, DRBD_READ_ERROR);
-	spin_unlock_irqrestore(&device->resource->req_lock, flags);
-
-	drbd_queue_work(&peer_device->connection->sender_work, &peer_req->w);
+	io_error = test_bit(__EE_WAS_ERROR, &peer_req->flags);
+
+	drbd_queue_work(&connection->sender_work, &peer_req->w);
+	peer_req = NULL; /* peer_req may be freed. */
+
+	/*
+	 * Decrement counter after queuing work to avoid a moment where
+	 * backing_ee_cnt is zero and the sender work list is empty.
+	 */
+	if (atomic_dec_and_test(&connection->backing_ee_cnt))
+		wake_up(&connection->ee_wait);
+
+	if (io_error)
+		drbd_handle_io_error(device, DRBD_READ_ERROR);
+
 	put_ldev(device);
 }
 
+static int is_failed_barrier(int ee_flags)
+{
+	return (ee_flags & (EE_IS_BARRIER|EE_WAS_ERROR|EE_RESUBMITTED|EE_TRIM|EE_ZEROOUT))
+		== (EE_IS_BARRIER|EE_WAS_ERROR);
+}
+
+static bool drbd_peer_request_is_merged(struct drbd_peer_request *peer_req,
+		sector_t main_sector, sector_t main_sector_end)
+{
+	/*
+	 * We do not send overlapping resync requests. So any request which is
+	 * in the corresponding range and for which we have received a reply
+	 * must be a merged request. EE_TRIM implies that we have received a
+	 * reply.
+	 */
+	return peer_req->i.sector >= main_sector &&
+		peer_req->i.sector + (peer_req->i.size >> SECTOR_SHIFT) <= main_sector_end &&
+			peer_req->i.type == INTERVAL_RESYNC_WRITE &&
+			(peer_req->flags & EE_TRIM);
+}
+
+int drbd_unmerge_discard(struct drbd_peer_request *peer_req_main, struct list_head *list)
+{
+	struct drbd_peer_device *peer_device = peer_req_main->peer_device;
+	struct drbd_peer_request *peer_req = peer_req_main;
+	sector_t main_sector = peer_req_main->i.sector;
+	sector_t main_sector_end = main_sector + (peer_req_main->i.size >> SECTOR_SHIFT);
+	int merged_count = 0;
+
+	list_for_each_entry_continue(peer_req, &peer_device->resync_requests, recv_order) {
+		if (!drbd_peer_request_is_merged(peer_req, main_sector, main_sector_end))
+			break;
+
+		merged_count++;
+		list_add_tail(&peer_req->w.list, list);
+	}
+
+	return merged_count;
+}
+
 /* writes on behalf of the partner, or resync writes,
  * "submitted" by the receiver, final stage.  */
-void drbd_endio_write_sec_final(struct drbd_peer_request *peer_req) __releases(local)
+void drbd_endio_write_sec_final(struct drbd_peer_request *peer_req)
 {
 	unsigned long flags = 0;
 	struct drbd_peer_device *peer_device = peer_req->peer_device;
 	struct drbd_device *device = peer_device->device;
 	struct drbd_connection *connection = peer_device->connection;
-	struct drbd_interval i;
-	int do_wake;
-	u64 block_id;
-	int do_al_complete_io;
+	enum drbd_interval_type type;
+	bool do_wake;
+
+	/* if this is a failed barrier request, disable use of barriers,
+	 * and schedule for resubmission */
+	if (is_failed_barrier(peer_req->flags)) {
+		drbd_bump_write_ordering(device->resource, device->ldev, WO_BDEV_FLUSH);
+		spin_lock_irqsave(&connection->peer_reqs_lock, flags);
+		peer_req->flags = (peer_req->flags & ~EE_WAS_ERROR) | EE_RESUBMITTED;
+		peer_req->w.cb = w_e_reissue;
+		spin_unlock_irqrestore(&connection->peer_reqs_lock, flags);
+		drbd_queue_work(&connection->sender_work, &peer_req->w);
+		if (atomic_dec_and_test(&connection->active_ee_cnt))
+			wake_up(&connection->ee_wait);
+		return;
+	}
 
 	/* after we moved peer_req to done_ee,
 	 * we may no longer access it,
 	 * it may be freed/reused already!
-	 * (as soon as we release the req_lock) */
-	i = peer_req->i;
-	do_al_complete_io = peer_req->flags & EE_CALL_AL_COMPLETE_IO;
-	block_id = peer_req->block_id;
-	peer_req->flags &= ~EE_CALL_AL_COMPLETE_IO;
+	 * (as soon as we release the peer_reqs_lock) */
+	type = peer_req->i.type;
 
 	if (peer_req->flags & EE_WAS_ERROR) {
 		/* In protocol != C, we usually do not send write acks.
-		 * In case of a write error, send the neg ack anyways. */
-		if (!__test_and_set_bit(__EE_SEND_WRITE_ACK, &peer_req->flags))
-			inc_unacked(device);
+		 * In case of a write error, send the neg ack anyways.
+		 * This only applies to to application writes, not to resync. */
+		if (peer_req->i.type == INTERVAL_PEER_WRITE) {
+			if (!__test_and_set_bit(__EE_SEND_WRITE_ACK, &peer_req->flags))
+				inc_unacked(peer_device);
+		}
 		drbd_set_out_of_sync(peer_device, peer_req->i.sector, peer_req->i.size);
+		drbd_handle_io_error(device, DRBD_WRITE_ERROR);
 	}
 
-	spin_lock_irqsave(&device->resource->req_lock, flags);
+	spin_lock_irqsave(&connection->peer_reqs_lock, flags);
 	device->writ_cnt += peer_req->i.size >> 9;
-	list_move_tail(&peer_req->w.list, &device->done_ee);
+	atomic_inc(&connection->done_ee_cnt);
+	list_add_tail(&peer_req->w.list, &connection->done_ee);
+	if (peer_req->i.type == INTERVAL_RESYNC_WRITE && peer_req->flags & EE_TRIM) {
+		LIST_HEAD(merged);
+		int merged_count;
+
+		merged_count = drbd_unmerge_discard(peer_req, &merged);
+		list_splice_tail(&merged, &connection->done_ee);
+		atomic_add(merged_count, &connection->done_ee_cnt);
+	}
+	peer_req = NULL; /* may be freed after unlock */
+	spin_unlock_irqrestore(&connection->peer_reqs_lock, flags);
 
 	/*
-	 * Do not remove from the write_requests tree here: we did not send the
-	 * Ack yet and did not wake possibly waiting conflicting requests.
-	 * Removed from the tree from "drbd_process_done_ee" within the
-	 * appropriate dw.cb (e_end_block/e_end_resync_block) or from
-	 * _drbd_clear_done_ee.
+	 * Do not remove from the requests tree here: we did not send the
+	 * Ack yet.
+	 * Removed from the tree from "drbd_finish_peer_reqs" within the
+	 * appropriate callback (e_end_block/e_end_resync_block) or from
+	 * cleanup functions if the connection is lost.
 	 */
 
-	do_wake = list_empty(block_id == ID_SYNCER ? &device->sync_ee : &device->active_ee);
-
-	/* FIXME do we want to detach for failed REQ_OP_DISCARD?
-	 * ((peer_req->flags & (EE_WAS_ERROR|EE_TRIM)) == EE_WAS_ERROR) */
-	if (peer_req->flags & EE_WAS_ERROR)
-		__drbd_chk_io_error(device, DRBD_WRITE_ERROR);
-
-	if (connection->cstate >= C_WF_REPORT_PARAMS) {
-		kref_get(&device->kref); /* put is in drbd_send_acks_wf() */
-		if (!queue_work(connection->ack_sender, &peer_device->send_acks_work))
-			kref_put(&device->kref, drbd_destroy_device);
-	}
-	spin_unlock_irqrestore(&device->resource->req_lock, flags);
+	if (connection->cstate[NOW] == C_CONNECTED)
+		queue_work(connection->ack_sender, &connection->send_acks_work);
 
-	if (block_id == ID_SYNCER)
-		drbd_rs_complete_io(device, i.sector);
+	if (type == INTERVAL_RESYNC_WRITE)
+		do_wake = atomic_dec_and_test(&connection->backing_ee_cnt);
+	else
+		do_wake = atomic_dec_and_test(&connection->active_ee_cnt);
 
 	if (do_wake)
-		wake_up(&device->ee_wait);
-
-	if (do_al_complete_io)
-		drbd_al_complete_io(device, &i);
+		wake_up(&connection->ee_wait);
 
 	put_ldev(device);
 }
@@ -175,33 +242,63 @@ void drbd_peer_request_endio(struct bio *bio)
 	bool is_write = bio_data_dir(bio) == WRITE;
 	bool is_discard = bio_op(bio) == REQ_OP_WRITE_ZEROES ||
 			  bio_op(bio) == REQ_OP_DISCARD;
+	blk_status_t status = bio->bi_status;
+	unsigned long flags;
+	struct page *page;
+	struct bio **pos;
 
-	if (bio->bi_status && drbd_ratelimit())
+	if (status && drbd_device_ratelimit(device, BACKEND))
 		drbd_warn(device, "%s: error=%d s=%llus\n",
 				is_write ? (is_discard ? "discard" : "write")
-					: "read", bio->bi_status,
+					: "read", status,
 				(unsigned long long)peer_req->i.sector);
 
-	if (bio->bi_status)
+	if (status)
 		set_bit(__EE_WAS_ERROR, &peer_req->flags);
 
-	bio_put(bio); /* no need for the bio anymore */
+	bio->bi_next = NULL; /* bi_next was used by the kernel during I/O; reinitialize */
+	/* Reset iter and restore sector and size for bio_for_each_segment(). */
+	page = bio->bi_io_vec[0].bv_page;
+	bio->bi_iter = (struct bvec_iter) {
+		.bi_sector = peer_req->i.sector + page->private,
+		.bi_size = (unsigned int)(unsigned long)page->lru.next,
+	};
+
+	spin_lock_irqsave(&device->peer_req_bio_completion_lock, flags);
+	if (bio_list_empty(&peer_req->bios)) {
+		bio_list_add(&peer_req->bios, bio);
+	} else {
+		/* Insert bio into the chain ordered by bi_sector */
+		for (pos = &peer_req->bios.head; *pos; pos = &(*pos)->bi_next) {
+			if (bio->bi_iter.bi_sector < (*pos)->bi_iter.bi_sector)
+				break;
+		}
+		bio->bi_next = *pos;
+		*pos = bio;
+		/* Update tail if we inserted at the end */
+		if (!bio->bi_next)
+			peer_req->bios.tail = bio;
+	}
+	spin_unlock_irqrestore(&device->peer_req_bio_completion_lock, flags);
+
 	if (atomic_dec_and_test(&peer_req->pending_bios)) {
 		if (is_write)
+			/* ldev_ref_transfer: ldev ref from bio submit in peer request I/O path */
 			drbd_endio_write_sec_final(peer_req);
 		else
 			drbd_endio_read_sec_final(peer_req);
 	}
 }
 
-static void
-drbd_panic_after_delayed_completion_of_aborted_request(struct drbd_device *device)
+/* Not static to increase the likelyhood that it will show up in a stack trace */
+void drbd_panic_after_delayed_completion_of_aborted_request(struct drbd_device *device)
 {
 	panic("drbd%u %s/%u potential random memory corruption caused by delayed completion of aborted local request\n",
 		device->minor, device->resource->name, device->vnr);
 }
 
-/* read, readA or write requests on R_PRIMARY coming from drbd_make_request
+
+/* read, readA or write requests on R_PRIMARY coming from drbd_submit_bio
  */
 void drbd_request_endio(struct bio *bio)
 {
@@ -211,6 +308,8 @@ void drbd_request_endio(struct bio *bio)
 	struct bio_and_error m;
 	enum drbd_req_event what;
 
+	blk_status_t status = bio->bi_status;
+
 	/* If this request was aborted locally before,
 	 * but now was completed "successfully",
 	 * chances are that this caused arbitrary data corruption.
@@ -221,7 +320,7 @@ void drbd_request_endio(struct bio *bio)
 	 * situation, usually a hard-reset and failover is the only way out.
 	 *
 	 * By "aborting", basically faking a local error-completion,
-	 * we allow for a more graceful swichover by cleanly migrating services.
+	 * we allow for a more graceful switchover by cleanly migrating services.
 	 * Still the affected node has to be rebooted "soon".
 	 *
 	 * By completing these requests, we allow the upper layers to re-use
@@ -239,89 +338,198 @@ void drbd_request_endio(struct bio *bio)
 	 * We assume that a delayed *error* completion is OK,
 	 * though we still will complain noisily about it.
 	 */
-	if (unlikely(req->rq_state & RQ_LOCAL_ABORTED)) {
-		if (drbd_ratelimit())
+	if (unlikely(req->local_rq_state & RQ_LOCAL_ABORTED)) {
+		if (drbd_device_ratelimit(device, BACKEND))
 			drbd_emerg(device, "delayed completion of aborted local request; disk-timeout may be too aggressive\n");
 
-		if (!bio->bi_status)
+		if (!status)
 			drbd_panic_after_delayed_completion_of_aborted_request(device);
 	}
 
 	/* to avoid recursion in __req_mod */
-	if (unlikely(bio->bi_status)) {
-		switch (bio_op(bio)) {
-		case REQ_OP_WRITE_ZEROES:
-		case REQ_OP_DISCARD:
-			if (bio->bi_status == BLK_STS_NOTSUPP)
+	if (unlikely(status)) {
+		enum req_op op = bio_op(bio);
+		if (op == REQ_OP_DISCARD || op == REQ_OP_WRITE_ZEROES) {
+			if (status == BLK_STS_NOTSUPP)
 				what = DISCARD_COMPLETED_NOTSUPP;
 			else
 				what = DISCARD_COMPLETED_WITH_ERROR;
-			break;
-		case REQ_OP_READ:
+		} else if (op == REQ_OP_READ) {
 			if (bio->bi_opf & REQ_RAHEAD)
 				what = READ_AHEAD_COMPLETED_WITH_ERROR;
 			else
 				what = READ_COMPLETED_WITH_ERROR;
-			break;
-		default:
+		} else {
 			what = WRITE_COMPLETED_WITH_ERROR;
-			break;
 		}
 	} else {
 		what = COMPLETED_OK;
 	}
 
-	req->private_bio = ERR_PTR(blk_status_to_errno(bio->bi_status));
-	bio_put(bio);
+	bio_put(req->private_bio);
+	req->private_bio = ERR_PTR(blk_status_to_errno(status));
+
+	/* it is legal to fail read-ahead, no drbd_handle_io_error for READ_AHEAD_COMPLETED_WITH_ERROR */
+	if (what == WRITE_COMPLETED_WITH_ERROR)
+		drbd_handle_io_error(device, DRBD_WRITE_ERROR);
+	else if (what == READ_COMPLETED_WITH_ERROR)
+		drbd_handle_io_error(device, DRBD_READ_ERROR);
+
+	spin_lock_irqsave(&device->interval_lock, flags);
+	set_bit(INTERVAL_BACKING_COMPLETED, &req->i.flags);
+	if (req->local_rq_state & RQ_WRITE)
+		drbd_release_conflicts(device, &req->i);
+	spin_unlock_irqrestore(&device->interval_lock, flags);
 
 	/* not req_mod(), we need irqsave here! */
-	spin_lock_irqsave(&device->resource->req_lock, flags);
+	read_lock_irqsave(&device->resource->state_rwlock, flags);
+	/* ldev_safe: bio endio, ldev ref held since drbd_request_prepare(), put_ldev() follows */
 	__req_mod(req, what, NULL, &m);
-	spin_unlock_irqrestore(&device->resource->req_lock, flags);
+	read_unlock_irqrestore(&device->resource->state_rwlock, flags);
 	put_ldev(device);
 
 	if (m.bio)
 		complete_master_bio(device, &m);
 }
 
-void drbd_csum_ee(struct crypto_shash *tfm, struct drbd_peer_request *peer_req, void *digest)
+struct dagtag_find_result {
+	int err;
+	unsigned int node_id;
+	u64 dagtag;
+};
+
+static struct dagtag_find_result find_current_dagtag(struct drbd_resource *resource)
 {
-	SHASH_DESC_ON_STACK(desc, tfm);
-	struct page *page = peer_req->pages;
-	struct page *tmp;
-	unsigned len;
-	void *src;
+	struct drbd_connection *connection;
+	struct dagtag_find_result ret = { 0 };
+
+	read_lock_irq(&resource->state_rwlock);
+
+	if (resource->role[NOW] == R_PRIMARY) {
+		/* Sending data and sending resync requests are not
+		 * synchronized with each other, so our peer may need to wait
+		 * until it has received more data before it can reply to this
+		 * request. */
+		ret.node_id = resource->res_opts.node_id;
+		ret.dagtag = resource->dagtag_sector;
+	} else {
+		for_each_connection(connection, resource) {
+			if (connection->peer_role[NOW] != R_PRIMARY)
+				continue;
 
-	desc->tfm = tfm;
+			/* Do not depend on a stale dagtag. */
+			if (!test_bit(RECEIVED_DAGTAG, &connection->flags))
+				continue;
 
-	crypto_shash_init(desc);
+			if (ret.dagtag) {
+				if (drbd_ratelimit())
+					drbd_err(resource, "Refusing to resync due to multiple remote primaries\n");
+				ret.err = 1;
+				break;
+			} else {
+				ret.node_id = connection->peer_node_id;
+				ret.dagtag = atomic64_read(&connection->last_dagtag_sector);
+			}
+		}
+	}
 
-	src = kmap_atomic(page);
-	while ((tmp = page_chain_next(page))) {
-		/* all but the last page will be fully used */
-		crypto_shash_update(desc, src, PAGE_SIZE);
-		kunmap_atomic(src);
-		page = tmp;
-		src = kmap_atomic(page);
+	read_unlock_irq(&resource->state_rwlock);
+
+	return ret;
+}
+
+static void send_resync_request(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_connection *connection = peer_device->connection;
+	struct dagtag_find_result dagtag_result;
+
+	if (!(connection->agreed_features & DRBD_FF_RESYNC_DAGTAG) &&
+			drbd_al_active(peer_device->device, peer_req->i.sector, peer_req->i.size)) {
+		dynamic_drbd_dbg(peer_device,
+				"Abort resync request at %llus+%u due to activity",
+				(unsigned long long) peer_req->i.sector, peer_req->i.size);
+
+		drbd_unsuccessful_resync_request(peer_req, false);
+		return;
 	}
-	/* and now the last, possibly only partially used page */
-	len = peer_req->i.size & (PAGE_SIZE - 1);
-	crypto_shash_update(desc, src, len ?: PAGE_SIZE);
-	kunmap_atomic(src);
 
-	crypto_shash_final(desc, digest);
-	shash_desc_zero(desc);
+	inc_rs_pending(peer_device);
+
+	dagtag_result = find_current_dagtag(peer_device->device->resource);
+	if (dagtag_result.err) {
+		change_cstate(peer_device->connection, C_DISCONNECTING, CS_HARD);
+		return;
+	}
+
+	if (peer_req->flags & EE_HAS_DIGEST) {
+		enum drbd_packet cmd = connection->agreed_features & DRBD_FF_RESYNC_DAGTAG ?
+			P_RS_CSUM_DAGTAG_REQ : P_CSUM_RS_REQUEST;
+
+		void *digest = drbd_prepare_drequest_csum(peer_req, cmd,
+				peer_req->digest->digest_size,
+				dagtag_result.node_id, dagtag_result.dagtag);
+		if (!digest)
+			return;
+
+		memcpy(digest, peer_req->digest->digest, peer_req->digest->digest_size);
+
+		/* We are now finished with the digest, so we can free it.
+		 * If we don't, the reference will be lost when the block_id
+		 * field of the union is used for the reply. */
+		peer_req->flags &= ~EE_HAS_DIGEST;
+		kfree(peer_req->digest);
+		peer_req->digest = NULL;
+
+		drbd_send_command(peer_device, cmd, DATA_STREAM);
+	} else {
+		enum drbd_packet cmd;
+		if (connection->agreed_features & DRBD_FF_RESYNC_DAGTAG)
+			cmd = peer_req->flags & EE_RS_THIN_REQ ? P_RS_THIN_DAGTAG_REQ : P_RS_DAGTAG_REQ;
+		else
+			cmd = peer_req->flags & EE_RS_THIN_REQ ? P_RS_THIN_REQ : P_RS_DATA_REQUEST;
+
+		drbd_send_rs_request(peer_device, cmd,
+				peer_req->i.sector, peer_req->i.size, peer_req->block_id,
+				dagtag_result.node_id, dagtag_result.dagtag);
+	}
 }
 
-void drbd_csum_bio(struct crypto_shash *tfm, struct bio *bio, void *digest)
+void drbd_conflict_send_resync_request(struct drbd_peer_request *peer_req)
 {
-	SHASH_DESC_ON_STACK(desc, tfm);
-	struct bio_vec bvec;
-	struct bvec_iter iter;
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_connection *connection = peer_req->peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+	bool conflict;
+	bool canceled;
+
+	spin_lock_irq(&device->interval_lock);
+	clear_bit(INTERVAL_SUBMIT_CONFLICT_QUEUED, &peer_req->i.flags);
+	canceled = test_bit(INTERVAL_CANCELED, &peer_req->i.flags);
+	conflict = drbd_find_conflict(device, &peer_req->i, CONFLICT_FLAG_IGNORE_SAME_PEER);
+	if (drbd_interval_empty(&peer_req->i))
+		drbd_insert_interval(&device->requests, &peer_req->i);
+	if (!conflict)
+		set_bit(INTERVAL_READY_TO_SEND, &peer_req->i.flags);
+	spin_unlock_irq(&device->interval_lock);
+
+	if (!conflict) {
+		send_resync_request(peer_req);
+	} else if (canceled) {
+		drbd_remove_peer_req_interval(peer_req);
+		drbd_free_peer_req(peer_req);
+	}
 
-	desc->tfm = tfm;
+	if ((!conflict || canceled) && atomic_dec_and_test(&connection->backing_ee_cnt))
+		wake_up(&connection->ee_wait);
+}
 
-	crypto_shash_init(desc);
+
+
+static void __drbd_csum_bio(struct bio *bio, struct shash_desc *desc)
+{
+	struct bio_vec bvec;
+	struct bvec_iter iter;
 
 	bio_for_each_segment(bvec, bio, iter) {
 		u8 *src;
@@ -330,6 +538,33 @@ void drbd_csum_bio(struct crypto_shash *tfm, struct bio *bio, void *digest)
 		crypto_shash_update(desc, src, bvec.bv_len);
 		kunmap_local(src);
 	}
+}
+
+void drbd_csum_bios(struct crypto_shash *tfm, struct bio_list *bios, void *digest)
+{
+	struct bio *bio;
+	SHASH_DESC_ON_STACK(desc, tfm);
+
+	desc->tfm = tfm;
+	crypto_shash_init(desc);
+
+	bio_list_for_each(bio, bios)
+		__drbd_csum_bio(bio, desc);
+
+	crypto_shash_final(desc, digest);
+	shash_desc_zero(desc);
+}
+
+/* This function needs to ignore bi_next */
+void drbd_csum_bio(struct crypto_shash *tfm, struct bio *bio, void *digest)
+{
+	SHASH_DESC_ON_STACK(desc, tfm);
+
+	desc->tfm = tfm;
+	crypto_shash_init(desc);
+
+	__drbd_csum_bio(bio, desc);
+
 	crypto_shash_final(desc, digest);
 	shash_desc_zero(desc);
 }
@@ -339,73 +574,91 @@ static int w_e_send_csum(struct drbd_work *w, int cancel)
 {
 	struct drbd_peer_request *peer_req = container_of(w, struct drbd_peer_request, w);
 	struct drbd_peer_device *peer_device = peer_req->peer_device;
-	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection = peer_device->connection;
 	int digest_size;
-	void *digest;
 	int err = 0;
+	struct digest_info *di;
 
 	if (unlikely(cancel))
 		goto out;
 
+	/* Do not add to interval tree if already disconnected or resync aborted */
+	if (!repl_is_sync_target(peer_device->repl_state[NOW]))
+		goto out;
+
 	if (unlikely((peer_req->flags & EE_WAS_ERROR) != 0))
 		goto out;
 
 	digest_size = crypto_shash_digestsize(peer_device->connection->csums_tfm);
-	digest = kmalloc(digest_size, GFP_NOIO);
-	if (digest) {
-		sector_t sector = peer_req->i.sector;
-		unsigned int size = peer_req->i.size;
-		drbd_csum_ee(peer_device->connection->csums_tfm, peer_req, digest);
-		/* Free peer_req and pages before send.
-		 * In case we block on congestion, we could otherwise run into
-		 * some distributed deadlock, if the other side blocks on
-		 * congestion as well, because our receiver blocks in
-		 * drbd_alloc_pages due to pp_in_use > max_buffers. */
-		drbd_free_peer_req(device, peer_req);
-		peer_req = NULL;
-		inc_rs_pending(peer_device);
-		err = drbd_send_drequest_csum(peer_device, sector, size,
-					      digest, digest_size,
-					      P_CSUM_RS_REQUEST);
-		kfree(digest);
-	} else {
-		drbd_err(device, "kmalloc() of digest failed.\n");
+
+	di = kmalloc(sizeof(*di) + digest_size, GFP_NOIO);
+	if (!di) {
 		err = -ENOMEM;
+		goto out;
 	}
 
+	di->digest_size = digest_size;
+	di->digest = (((char *)di)+sizeof(struct digest_info));
+
+	drbd_csum_bios(connection->csums_tfm, &peer_req->bios, di->digest);
+
+	/* Free pages before continuing.
+	 * In case we block on congestion, we could otherwise run into
+	 * some distributed deadlock, if the other side blocks on
+	 * congestion as well, because our receiver blocks in
+	 * drbd_alloc_pages due to pp_in_use > max_buffers. */
+	drbd_peer_req_strip_bio(peer_req);
+
+	/* Use the same drbd_peer_request for tracking resync request and for
+	 * writing, if that is necessary. */
+	peer_req->digest = di;
+	peer_req->flags |= EE_HAS_DIGEST;
+
+	atomic_inc(&connection->backing_ee_cnt);
+	drbd_conflict_send_resync_request(peer_req);
+	return 0;
+
 out:
-	if (peer_req)
-		drbd_free_peer_req(device, peer_req);
+	atomic_sub(peer_req->i.size >> SECTOR_SHIFT, &peer_device->device->rs_sect_ev);
+	drbd_free_peer_req(peer_req);
 
 	if (unlikely(err))
-		drbd_err(device, "drbd_send_drequest(..., csum) failed\n");
+		drbd_err(peer_device, "drbd_send_drequest(..., csum) failed\n");
 	return err;
 }
 
-#define GFP_TRY	(__GFP_HIGHMEM | __GFP_NOWARN)
-
 static int read_for_csum(struct drbd_peer_device *peer_device, sector_t sector, int size)
 {
+	struct drbd_connection *connection = peer_device->connection;
 	struct drbd_device *device = peer_device->device;
 	struct drbd_peer_request *peer_req;
 
 	if (!get_ldev(device))
 		return -EIO;
 
-	/* GFP_TRY, because if there is no memory available right now, this may
-	 * be rescheduled for later. It is "only" background resync, after all. */
-	peer_req = drbd_alloc_peer_req(peer_device, ID_SYNCER /* unused */, sector,
-				       size, size, GFP_TRY);
+	/* Do not wait if no memory is immediately available.  */
+	peer_req = drbd_alloc_peer_req(peer_device, GFP_TRY & ~__GFP_RECLAIM,
+				       size, REQ_OP_READ);
 	if (!peer_req)
 		goto defer;
 
+	spin_lock_irq(&connection->peer_reqs_lock);
+	list_add_tail(&peer_req->recv_order, &peer_device->resync_requests);
+	peer_req->flags |= EE_ON_RECV_ORDER;
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	peer_req->i.size = size;
+	peer_req->i.sector = sector;
+	/* This will be a resync write once we receive the data back from the
+	 * peer, assuming the checksums differ. */
+	peer_req->i.type = INTERVAL_RESYNC_WRITE;
+	peer_req->requested_size = size;
+
 	peer_req->w.cb = w_e_send_csum;
-	peer_req->opf = REQ_OP_READ;
-	spin_lock_irq(&device->resource->req_lock);
-	list_add_tail(&peer_req->w.list, &device->read_ee);
-	spin_unlock_irq(&device->resource->req_lock);
 
+	atomic_inc(&connection->backing_ee_cnt);
 	atomic_add(size >> 9, &device->rs_sect_ev);
+	/* ldev_ref_transfer: put_ldev in peer_req endio */
 	if (drbd_submit_peer_request(peer_req) == 0)
 		return 0;
 
@@ -413,41 +666,143 @@ static int read_for_csum(struct drbd_peer_device *peer_device, sector_t sector,
 	 * because bio_add_page failed (probably broken lower level driver),
 	 * retry may or may not help.
 	 * If it does not, you may need to force disconnect. */
-	spin_lock_irq(&device->resource->req_lock);
-	list_del(&peer_req->w.list);
-	spin_unlock_irq(&device->resource->req_lock);
 
-	drbd_free_peer_req(device, peer_req);
 defer:
 	put_ldev(device);
 	return -EAGAIN;
 }
 
+static int make_one_resync_request(struct drbd_peer_device *peer_device, int discard_granularity, sector_t sector, int size)
+{
+	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_peer_request *peer_req;
+
+	/* Do not wait if no memory is immediately available.  */
+	peer_req = drbd_alloc_peer_req(peer_device, GFP_TRY & ~__GFP_RECLAIM,
+				       size, REQ_OP_WRITE);
+	if (!peer_req) {
+		drbd_err(device, "Could not allocate resync request\n");
+		put_ldev(device);
+		return -EAGAIN;
+	}
+
+	peer_req->i.size = size;
+	peer_req->i.sector = sector;
+	peer_req->i.type = INTERVAL_RESYNC_WRITE;
+	peer_req->requested_size = size;
+
+	if (size == discard_granularity)
+		peer_req->flags |= EE_RS_THIN_REQ;
+
+	spin_lock_irq(&connection->peer_reqs_lock);
+	list_add_tail(&peer_req->recv_order, &peer_device->resync_requests);
+	peer_req->flags |= EE_ON_RECV_ORDER;
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	atomic_inc(&connection->backing_ee_cnt);
+	drbd_conflict_send_resync_request(peer_req);
+	return 0;
+}
+
 int w_resync_timer(struct drbd_work *w, int cancel)
 {
-	struct drbd_device *device =
-		container_of(w, struct drbd_device, resync_work);
+	struct drbd_peer_device *peer_device =
+		container_of(w, struct drbd_peer_device, resync_work);
 
-	switch (device->state.conn) {
-	case C_VERIFY_S:
-		make_ov_request(first_peer_device(device), cancel);
+	switch (peer_device->repl_state[NOW]) {
+	case L_VERIFY_S:
+		make_ov_request(peer_device, cancel);
+		break;
+	case L_SYNC_TARGET:
+		make_resync_request(peer_device, cancel);
 		break;
-	case C_SYNC_TARGET:
-		make_resync_request(first_peer_device(device), cancel);
+	default:
+		if (atomic_read(&peer_device->rs_sect_in) >= peer_device->rs_in_flight) {
+			struct drbd_resource *resource = peer_device->device->resource;
+			unsigned long irq_flags;
+			begin_state_change(resource, &irq_flags, 0);
+			peer_device->resync_active[NEW] = false;
+			end_state_change(resource, &irq_flags, "resync-inactive");
+		}
 		break;
 	}
 
 	return 0;
 }
 
+int w_send_dagtag(struct drbd_work *w, int cancel)
+{
+	struct drbd_connection *connection =
+		container_of(w, struct drbd_connection, send_dagtag_work);
+	struct drbd_resource *resource = connection->resource;
+	int err;
+	u64 dagtag_sector;
+
+	if (cancel)
+		return 0;
+
+	read_lock_irq(&resource->state_rwlock);
+	dagtag_sector = connection->send_dagtag;
+	/* It is OK to use the value outside the lock, because the work will be
+	 * queued again if it is changed. */
+	read_unlock_irq(&resource->state_rwlock);
+
+	/* Only send if no request with a newer dagtag has been sent. This can
+	 * occur if a write arrives after the state change and is processed
+	 * before this work item. */
+	if (dagtag_newer_eq(connection->send.current_dagtag_sector, dagtag_sector))
+		return 0;
+
+	err = drbd_send_dagtag(connection, dagtag_sector);
+	if (err)
+		return err;
+
+	connection->send.current_dagtag_sector = dagtag_sector;
+	return 0;
+}
+
+int w_send_uuids(struct drbd_work *w, int cancel)
+{
+	struct drbd_peer_device *peer_device =
+		container_of(w, struct drbd_peer_device, propagate_uuids_work);
+
+	if (peer_device->repl_state[NOW] < L_ESTABLISHED ||
+	    !test_bit(INITIAL_STATE_SENT, &peer_device->flags))
+		return 0;
+
+	drbd_send_uuids(peer_device, 0, 0);
+
+	return 0;
+}
+
+bool drbd_any_flush_pending(struct drbd_resource *resource)
+{
+	unsigned long flags;
+	struct drbd_connection *primary_connection;
+	bool any_flush_pending = false;
+
+	spin_lock_irqsave(&resource->initiator_flush_lock, flags);
+	rcu_read_lock();
+	for_each_connection_rcu(primary_connection, resource) {
+		if (primary_connection->pending_flush_mask) {
+			any_flush_pending = true;
+			break;
+		}
+	}
+	rcu_read_unlock();
+	spin_unlock_irqrestore(&resource->initiator_flush_lock, flags);
+
+	return any_flush_pending;
+}
+
 void resync_timer_fn(struct timer_list *t)
 {
-	struct drbd_device *device = timer_container_of(device, t,
-							resync_timer);
+	struct drbd_peer_device *peer_device = timer_container_of(peer_device, t, resync_timer);
 
 	drbd_queue_work_if_unqueued(
-		&first_peer_device(device)->connection->sender_work,
-		&device->resync_work);
+		&peer_device->connection->sender_work,
+		&peer_device->resync_work);
 }
 
 static void fifo_set(struct fifo_buffer *fb, int value)
@@ -494,32 +849,54 @@ struct fifo_buffer *fifo_alloc(unsigned int fifo_size)
 	return fb;
 }
 
-static int drbd_rs_controller(struct drbd_peer_device *peer_device, unsigned int sect_in)
+/* FIXME by choosing to calculate in nano seconds, we now have several do_div()
+ * in here, which I find very ugly.
+ */
+static int drbd_rs_controller(struct drbd_peer_device *peer_device, u64 sect_in, u64 duration_ns)
 {
-	struct drbd_device *device = peer_device->device;
-	struct disk_conf *dc;
+	const u64 max_duration_ns = RS_MAKE_REQS_INTV_NS * 10;
+	struct peer_device_conf *pdc;
 	unsigned int want;     /* The number of sectors we want in-flight */
 	int req_sect; /* Number of sectors to request in this turn */
 	int correction; /* Number of sectors more we need in-flight */
 	int cps; /* correction per invocation of drbd_rs_controller() */
 	int steps; /* Number of time steps to plan ahead */
 	int curr_corr;
-	int max_sect;
+	u64 max_sect;
 	struct fifo_buffer *plan;
+	u64 duration_ms;
+
+	if (duration_ns == 0)
+		duration_ns = 1;
+	else if (duration_ns > max_duration_ns)
+		duration_ns = max_duration_ns;
+
+	if (duration_ns < RS_MAKE_REQS_INTV_NS) {
+		/* Scale sect_in so that it represents the number of sectors which
+		 * would have arrived if the cycle had lasted the normal time
+		 * (RS_MAKE_REQS_INTV). */
+		sect_in = sect_in * RS_MAKE_REQS_INTV_NS;
+		do_div(sect_in, duration_ns);
+	}
 
-	dc = rcu_dereference(device->ldev->disk_conf);
-	plan = rcu_dereference(device->rs_plan_s);
+	pdc = rcu_dereference(peer_device->conf);
+	plan = rcu_dereference(peer_device->rs_plan_s);
 
-	steps = plan->size; /* (dc->c_plan_ahead * 10 * SLEEP_TIME) / HZ; */
+	steps = plan->size; /* (pdc->c_plan_ahead * 10 * RS_MAKE_REQS_INTV) / HZ; */
 
-	if (device->rs_in_flight + sect_in == 0) { /* At start of resync */
-		want = ((dc->resync_rate * 2 * SLEEP_TIME) / HZ) * steps;
+	if (peer_device->rs_in_flight + sect_in == 0) { /* At start of resync */
+		want = ((pdc->resync_rate * 2 * RS_MAKE_REQS_INTV) / HZ) * steps;
 	} else { /* normal path */
-		want = dc->c_fill_target ? dc->c_fill_target :
-			sect_in * dc->c_delay_target * HZ / (SLEEP_TIME * 10);
+		if (pdc->c_fill_target) {
+			want = pdc->c_fill_target;
+		} else {
+			u64 tmp = sect_in * pdc->c_delay_target * NSEC_PER_SEC;
+			do_div(tmp, (duration_ns * 10));
+			want = tmp;
+		}
 	}
 
-	correction = want - device->rs_in_flight - plan->total;
+	correction = want - peer_device->rs_in_flight - plan->total;
 
 	/* Plan ahead */
 	cps = correction / steps;
@@ -534,36 +911,62 @@ static int drbd_rs_controller(struct drbd_peer_device *peer_device, unsigned int
 	if (req_sect < 0)
 		req_sect = 0;
 
-	max_sect = (dc->c_max_rate * 2 * SLEEP_TIME) / HZ;
+	if (pdc->c_max_rate == 0) {
+		/* No rate limiting. */
+		max_sect = ~0ULL;
+	} else {
+		max_sect = (u64)pdc->c_max_rate * 2 * RS_MAKE_REQS_INTV_NS;
+		do_div(max_sect, NSEC_PER_SEC);
+	}
+
+	duration_ms = duration_ns;
+	do_div(duration_ms, NSEC_PER_MSEC);
+	dynamic_drbd_dbg(peer_device, "dur=%lluns (%llums) sect_in=%llu in_flight=%d wa=%u co=%d st=%d cps=%d cc=%d rs=%d mx=%llu\n",
+		 duration_ns, duration_ms, sect_in, peer_device->rs_in_flight, want, correction,
+		 steps, cps, curr_corr, req_sect, max_sect);
+
 	if (req_sect > max_sect)
 		req_sect = max_sect;
 
-	/*
-	drbd_warn(device, "si=%u if=%d wa=%u co=%d st=%d cps=%d pl=%d cc=%d rs=%d\n",
-		 sect_in, device->rs_in_flight, want, correction,
-		 steps, cps, device->rs_planed, curr_corr, req_sect);
-	*/
-
 	return req_sect;
 }
 
+/* Calculate how many 4k sized blocks we want to resync this time.
+ * Because peer nodes may have different bitmap granularity, and won't
+ * be able to clear "partial bits", make sure we try to request
+ * multiples of the bitmap block size (of myself or the peer, whichever
+ * is larger) in one go. Return value is scaled to our bm_block_size.
+ * If both peers operate at 4k granularity, or at identical granularity,
+ * this should not change behavior.
+ * If we operate at different granularities, we may need to improve our
+ * drbd_rs_controller() as well to get intended resync rates,
+ * especially if you configure for rather small c-max-rate.
+ */
 static int drbd_rs_number_requests(struct drbd_peer_device *peer_device)
 {
-	struct drbd_device *device = peer_device->device;
+	struct net_conf *nc;
+	ktime_t duration, now;
 	unsigned int sect_in;  /* Number of sectors that came in since the last turn */
 	int number, mxb;
+	int effective_resync_request_size;
+	struct drbd_bitmap *bm = peer_device->device->bitmap;
+
+	sect_in = atomic_xchg(&peer_device->rs_sect_in, 0);
+	peer_device->rs_in_flight -= sect_in;
 
-	sect_in = atomic_xchg(&device->rs_sect_in, 0);
-	device->rs_in_flight -= sect_in;
+	now = ktime_get();
+	duration = ktime_sub(now, peer_device->rs_last_mk_req_kt);
+	peer_device->rs_last_mk_req_kt = now;
 
 	rcu_read_lock();
-	mxb = drbd_get_max_buffers(device) / 2;
-	if (rcu_dereference(device->rs_plan_s)->size) {
-		number = drbd_rs_controller(peer_device, sect_in) >> (BM_BLOCK_SHIFT - 9);
-		device->c_sync_rate = number * HZ * (BM_BLOCK_SIZE / 1024) / SLEEP_TIME;
+	nc = rcu_dereference(peer_device->connection->transport.net_conf);
+	mxb = nc ? nc->max_buffers : 0;
+	if (rcu_dereference(peer_device->rs_plan_s)->size) {
+		number = drbd_rs_controller(peer_device, sect_in, ktime_to_ns(duration));
+		number = sect_to_bit(number, BM_BLOCK_SHIFT_4k);
 	} else {
-		device->c_sync_rate = rcu_dereference(device->ldev->disk_conf)->resync_rate;
-		number = SLEEP_TIME * device->c_sync_rate  / ((BM_BLOCK_SIZE / 1024) * HZ);
+		number = RS_MAKE_REQS_INTV * rcu_dereference(peer_device->conf)->resync_rate
+			/ ((BM_BLOCK_SIZE_4k/1024) * HZ);
 	}
 	rcu_read_unlock();
 
@@ -571,201 +974,603 @@ static int drbd_rs_number_requests(struct drbd_peer_device *peer_device)
 	 * Otherwise we may cause the remote site to stall on drbd_alloc_pages(),
 	 * potentially causing a distributed deadlock on congestion during
 	 * online-verify or (checksum-based) resync, if max-buffers,
-	 * socket buffer sizes and resync rate settings are mis-configured. */
-
-	/* note that "number" is in units of "BM_BLOCK_SIZE" (which is 4k),
+	 * socket buffer sizes and resync rate settings are mis-configured.
+	 * Note that "number" is in units of "bm_bytes_per_bit",
 	 * mxb (as used here, and in drbd_alloc_pages on the peer) is
-	 * "number of pages" (typically also 4k),
-	 * but "rs_in_flight" is in "sectors" (512 Byte). */
-	if (mxb - device->rs_in_flight/8 < number)
-		number = mxb - device->rs_in_flight/8;
+	 * "number of pages" (typically 4k), and "rs_in_flight" is in "sectors"
+	 * (512 Byte). Convert everything to sectors and back.
+	 */
+	{
+		int mxb_sect = mxb << (PAGE_SHIFT - 9);
+		int num_sect = bit_to_sect(number, BM_BLOCK_SHIFT_4k);
 
-	return number;
+		if (mxb_sect - peer_device->rs_in_flight < num_sect) {
+			num_sect = mxb_sect - peer_device->rs_in_flight;
+			number = sect_to_bit(num_sect, BM_BLOCK_SHIFT_4k);
+		}
+	}
+
+	/* BM_BLOCK_SIZE_MAX/BM_BLOCK_SIZE_4k? Maybe. But do not round up unless we have to. */
+	effective_resync_request_size =
+		1 << (max(bm->bm_block_shift, peer_device->bm_block_shift) - BM_BLOCK_SHIFT_4k);
+	number = ALIGN(number, effective_resync_request_size);
+	peer_device->c_sync_rate = number * HZ * (BM_BLOCK_SIZE_4k/1024) / RS_MAKE_REQS_INTV;
+	return number >> (bm->bm_block_shift - BM_BLOCK_SHIFT_4k);
 }
 
-static int make_resync_request(struct drbd_peer_device *const peer_device, int cancel)
+static int resync_delay(bool request_ok, int number, int done)
 {
-	struct drbd_device *const device = peer_device->device;
-	struct drbd_connection *const connection = peer_device ? peer_device->connection : NULL;
-	unsigned long bit;
-	sector_t sector;
-	const sector_t capacity = get_capacity(device->vdisk);
-	int max_bio_size;
-	int number, rollback_i, size;
-	int align, requeue = 0;
-	int i = 0;
-	int discard_granularity = 0;
+	if (request_ok && number > 0 && done > 0) {
+		/* Requests in-flight. Adjusting the standard delay to
+		 * mitigate rounding and other errors, that cause 'done'
+		 * to be different from the optimal 'number'.  (usually
+		 * in the range of 66ms to 133ms) */
+		return RS_MAKE_REQS_INTV * done / number;
+	}
 
-	if (unlikely(cancel))
-		return 0;
+	return RS_MAKE_REQS_INTV;
+}
 
-	if (device->rs_total == 0) {
-		/* empty resync? */
-		drbd_resync_finished(peer_device);
-		return 0;
-	}
+void drbd_rs_all_in_flight_came_back(struct drbd_peer_device *peer_device, int rs_sect_in)
+{
+	unsigned int max_bio_size_kb = DRBD_MAX_BIO_SIZE / 1024;
+	struct drbd_device *device = peer_device->device;
+	unsigned int c_max_rate, interval, latency, m, amount_kb;
+	unsigned int rs_kib_in = rs_sect_in / 2;
+	ktime_t latency_kt;
+	bool kickstart;
 
-	if (!get_ldev(device)) {
-		/* Since we only need to access device->rsync a
-		   get_ldev_if_state(device,D_FAILED) would be sufficient, but
-		   to continue resync with a broken disk makes no sense at
-		   all */
-		drbd_err(device, "Disk broke down during resync!\n");
-		return 0;
+	if (get_ldev(device)) {
+		max_bio_size_kb = queue_max_hw_sectors(device->rq_queue) / 2;
+		put_ldev(device);
 	}
 
-	if (connection->agreed_features & DRBD_FF_THIN_RESYNC) {
-		rcu_read_lock();
-		discard_granularity = rcu_dereference(device->ldev->disk_conf)->rs_discard_granularity;
-		rcu_read_unlock();
-	}
+	rcu_read_lock();
+	c_max_rate = rcu_dereference(peer_device->conf)->c_max_rate;
+	rcu_read_unlock();
 
-	max_bio_size = queue_max_hw_sectors(device->rq_queue) << 9;
-	number = drbd_rs_number_requests(peer_device);
-	if (number <= 0)
-		goto requeue;
+	latency_kt = ktime_sub(ktime_get(), peer_device->rs_last_mk_req_kt);
+	latency = nsecs_to_jiffies(ktime_to_ns(latency_kt));
 
-	for (i = 0; i < number; i++) {
-		/* Stop generating RS requests when half of the send buffer is filled,
-		 * but notify TCP that we'd like to have more space. */
-		mutex_lock(&connection->data.mutex);
-		if (connection->data.socket) {
-			struct sock *sk = connection->data.socket->sk;
-			int queued = sk->sk_wmem_queued;
-			int sndbuf = sk->sk_sndbuf;
-			if (queued > sndbuf / 2) {
-				requeue = 1;
-				if (sk->sk_socket)
-					set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
-			}
-		} else
-			requeue = 1;
-		mutex_unlock(&connection->data.mutex);
-		if (requeue)
-			goto requeue;
+	m = max_bio_size_kb > rs_kib_in ? max_bio_size_kb / rs_kib_in : 1;
+	if (c_max_rate != 0)
+		interval = rs_kib_in * m * HZ / c_max_rate;
+	else
+		interval = 0;
+	/* interval holds the ideal pace in which we should request max_bio_size */
+
+	if (peer_device->repl_state[NOW] == L_SYNC_TARGET) {
+		/* Only run resync_work early if we are definitely making
+		 * progress. Otherwise we might continually lock a resync
+		 * extent even when all the requests are canceled. This can
+		 * cause application IO to be blocked for an indefinitely long
+		 * time. */
+		if (test_bit(RS_REQUEST_UNSUCCESSFUL, &peer_device->flags))
+			return;
+	}
 
-next_sector:
-		size = BM_BLOCK_SIZE;
-		bit  = drbd_bm_find_next(device, device->bm_resync_fo);
+	amount_kb = c_max_rate / (HZ / RS_MAKE_REQS_INTV);
+	kickstart = rs_kib_in < amount_kb / 2 && latency < RS_MAKE_REQS_INTV / 2;
+	/* In case the latency of the link and remote IO subsystem is small and
+	   the controller was clearly issuing a too small number of requests,
+	   kickstart it by scheduling it immediately */
 
-		if (bit == DRBD_END_OF_BITMAP) {
-			device->bm_resync_fo = drbd_bm_bits(device);
-			put_ldev(device);
-			return 0;
-		}
+	if (kickstart || interval <= latency) {
+		drbd_queue_work_if_unqueued(
+			&peer_device->connection->sender_work,
+			&peer_device->resync_work);
+		return;
+	}
+
+	if (interval < RS_MAKE_REQS_INTV)
+		mod_timer(&peer_device->resync_timer, jiffies + (interval - latency));
+}
 
-		sector = BM_BIT_TO_SECT(bit);
+static void drbd_enable_peer_replication(struct drbd_device *device)
+{
+	struct drbd_resource *resource = device->resource;
+	unsigned long irq_flags;
+	struct drbd_peer_device *peer_device;
 
-		if (drbd_try_rs_begin_io(peer_device, sector)) {
-			device->bm_resync_fo = bit;
-			goto requeue;
+	begin_state_change(resource, &irq_flags, CS_VERBOSE);
+	for_each_peer_device(peer_device, device)
+		peer_device->peer_replication[NEW] = true;
+	end_state_change(resource, &irq_flags, "enable-peer-replication");
+}
+
+/* Returns whether whole resync is finished. */
+static bool drbd_resync_check_finished(struct drbd_peer_device *peer_device)
+{
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+	struct drbd_resource *resource = connection->resource;
+	bool resync_requests_complete;
+	unsigned long bitmap_weight;
+	unsigned long last_resync_pass_bits;
+	bool peer_replication;
+
+	/* Test whether resync pass finished */
+	if (drbd_bm_find_next(peer_device, peer_device->resync_next_bit) < DRBD_END_OF_BITMAP)
+		return false;
+
+	if (drbd_any_flush_pending(resource))
+		return false;
+
+	spin_lock_irq(&connection->peer_reqs_lock);
+	resync_requests_complete = list_empty(&peer_device->resync_requests);
+	spin_unlock_irq(&connection->peer_reqs_lock);
+
+	if (!resync_requests_complete)
+		return false;
+
+	last_resync_pass_bits = peer_device->last_resync_pass_bits;
+	bitmap_weight = drbd_bm_total_weight(peer_device);
+	peer_device->last_resync_pass_bits = bitmap_weight;
+
+	peer_replication = drbd_all_peer_replication(device, NOW);
+	dynamic_drbd_dbg(peer_device, "Resync pass complete last:%lu out-of-sync:%lu failed:%lu replication:%s\n",
+			last_resync_pass_bits, bitmap_weight, peer_device->rs_failed,
+			peer_replication ? "enabled" : "disabled");
+
+	if (!peer_replication) {
+		if (peer_device->rs_failed == 0 && bitmap_weight > 0 &&
+				bitmap_weight < last_resync_pass_bits / 2) {
+			/* Start next pass with replication still disabled */
+			peer_device->resync_next_bit = 0;
+			return false;
 		}
-		device->bm_resync_fo = bit + 1;
 
-		if (unlikely(drbd_bm_test_bit(device, bit) == 0)) {
-			drbd_rs_complete_io(device, sector);
-			goto next_sector;
+		drbd_enable_peer_replication(device);
+		return false;
+	}
+
+	if (peer_device->rs_failed == 0 && bitmap_weight > 0) {
+		/* Start next pass. Replication is enabled. */
+		peer_device->resync_next_bit = 0;
+		return false;
+	}
+
+	drbd_resync_finished(peer_device, D_MASK);
+	return true;
+}
+
+static bool send_buffer_half_full(struct drbd_peer_device *peer_device)
+{
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_transport *transport = &connection->transport;
+	bool half_full = false;
+
+	mutex_lock(&connection->mutex[DATA_STREAM]);
+	if (transport->class->ops.stream_ok(transport, DATA_STREAM)) {
+		struct drbd_transport_stats transport_stats;
+		int queued, sndbuf;
+
+		transport->class->ops.stats(transport, &transport_stats);
+		queued = transport_stats.send_buffer_used;
+		sndbuf = transport_stats.send_buffer_size;
+		if (queued > sndbuf / 2) {
+			half_full = true;
+			transport->class->ops.hint(transport, DATA_STREAM, NOSPACE);
 		}
+	} else {
+		half_full = true;
+	}
+	mutex_unlock(&connection->mutex[DATA_STREAM]);
 
-#if DRBD_MAX_BIO_SIZE > BM_BLOCK_SIZE
-		/* try to find some adjacent bits.
-		 * we stop if we have already the maximum req size.
-		 *
-		 * Additionally always align bigger requests, in order to
-		 * be prepared for all stripe sizes of software RAIDs.
+	return half_full;
+}
+
+static int optimal_bits_for_alignment(unsigned long bit, int bm_block_shift)
+{
+	int max_bio_bits = DRBD_MAX_BIO_SIZE >> bm_block_shift;
+
+	/* under the assumption that we find a big block of out-of-sync blocks
+	   in the bitmap, calculate the optimal request size so that the
+	   request sizes get bigger, and each request is "perfectly" aligned.
+	   (In case the backing device is a RAID5)
+	   for an odd number, it returns 1.
+	   for anything dividable by 2, it returns 2.
+	   for 3 it returns 1 so that the next request size can be 4.
+	   and so on...
+	*/
+
+	/* Only consider the lower order bits up to the size of max_bio_bits.
+	 * This prevents overflows when converting to int. */
+	bit = bit & (max_bio_bits - 1);
+
+	if (bit == 0)
+		return max_bio_bits;
+
+	return 1 << __ffs(bit);
+}
+
+static int round_to_powerof_2(int value)
+{
+	int l2 = fls(value) - 1;
+	int smaller = 1 << l2;
+	int bigger = smaller << 1;
+
+	if (value == 0)
+		return 0;
+
+	return value - smaller < bigger - value ? smaller : bigger;
+}
+
+static bool adjacent(sector_t sector1, int size, sector_t sector2)
+{
+	return sector1 + (size >> SECTOR_SHIFT) == sector2;
+}
+
+/* make_resync_request() - initiate resync requests as required
+ *
+ * Request handling flow:
+ *
+ *                     checksum resync
+ * make_resync_request --------+
+ *       |                     v
+ *       |               read_for_csum
+ *       |                     |
+ *       |                     v
+ *       |          drbd_submit_peer_request
+ *       |                     |
+ *       |                    ... backing device
+ *       |                     |
+ *       |                     v
+ *       |           drbd_peer_request_endio
+ *       |                     |
+ *       |                     v
+ *       |          drbd_endio_read_sec_final
+ *       |                     |
+ *       V                    ... sender_work
+ * make_one_resync_request     |
+ *       |                     v
+ *       +---------------- w_e_send_csum
+ *       |
+ *       v                             conflict
+ * drbd_conflict_send_resync_request -------+
+ *       |                ^                 |
+ *       |                |                ...
+ *       |                |                 |
+ *       |                |                 v
+ *       v                +---- drbd_do_submit_conflict
+ * send_resync_request
+ *       |
+ *      ... via peer
+ *       |
+ *       +----------------------------+
+ *       |                            |
+ *       v                            v
+ * receive_RSDataReply      receive_rs_deallocated
+ *       |                            |
+ *       |                           ... using list resync_requests
+ *       |                            |
+ *       v                            v
+ * recv_resync_read        drbd_process_rs_discards
+ *       |                            |
+ *       |                            v
+ *       +----------------- drbd_submit_rs_discard
+ *       |
+ *       v                             conflict
+ * drbd_conflict_submit_resync_request -----+
+ *       |                ^                 |
+ *       |                |                ...
+ *       |                |                 |
+ *       |                |                 v
+ *       v                +---- drbd_do_submit_conflict
+ * drbd_submit_peer_request
+ *       |
+ *      ... backing device
+ *       |
+ *       v
+ * drbd_peer_request_endio
+ *       |
+ *       v
+ * drbd_endio_write_sec_final
+ *       |
+ *      ... done_ee
+ *       |
+ *       v
+ * drbd_finish_peer_reqs
+ *       |
+ *       v
+ * e_end_resync_block
+ *       |
+ *       v
+ * drbd_resync_request_complete
+ */
+static int make_resync_request(struct drbd_peer_device *peer_device, int cancel)
+{
+	int optimal_bits_alignment, optimal_bits_rate, discard_granularity = 0;
+	int number = 0, rollback_i, size = 0, i = 0, optimal_bits;
+	struct drbd_connection *connection = peer_device->connection;
+	struct drbd_device *device = peer_device->device;
+	struct drbd_bitmap *bm;
+	const sector_t capacity = get_capacity(device->vdisk);
+	bool request_ok = true;
+	unsigned long bit;
+	sector_t sector, prev_sector = 0;
+	unsigned int peer_bm_block_shift = peer_device->bm_block_shift;
+	unsigned int bm_block_shift, bits_per_peer_bit;
+
+	if (unlikely(cancel))
+		return 0;
+
+	if (test_bit(SYNC_TARGET_TO_BEHIND, &peer_device->flags)) {
+		/* If a P_RS_CANCEL_AHEAD on control socket overtook the
+		 * already queued data and state change to Ahead/Behind,
+		 * don't add more resync requests, just wait it out. */
+		drbd_info_ratelimit(peer_device, "peer pulled ahead during resync\n");
+		return 0;
+	}
+	if (!get_ldev(device)) {
+		/* Since we only need to access device->rsync a
+		   get_ldev_if_state(device,D_FAILED) would be sufficient, but
+		   to continue resync with a broken disk makes no sense at
+		   all */
+		drbd_err(device, "Disk broke down during resync!\n");
+		return 0;
+	}
+	bm = device->bitmap;
+
+	if (drbd_resync_check_finished(peer_device))
+		goto out_put_ldev;
+
+	if (send_buffer_half_full(peer_device)) {
+		/* We still want to reschedule ourselves, so do not return. */
+		goto skip_request;
+	}
+
+	if (connection->agreed_features & DRBD_FF_THIN_RESYNC) {
+		rcu_read_lock();
+		discard_granularity = rcu_dereference(device->ldev->disk_conf)->rs_discard_granularity;
+		rcu_read_unlock();
+	}
+
+	bm_block_shift = bm->bm_block_shift;
+	number = drbd_rs_number_requests(peer_device);
+	if (number < discard_granularity >> bm_block_shift)
+		number = discard_granularity >> bm_block_shift;
+
+	/*
+	 * Drain resync requests when we jump back to avoid conflicts that are
+	 * resolved in an arbitrary order, leading to an unexpected ordering of
+	 * requests being completed.
+	 */
+	if (test_bit(RS_REQUEST_UNSUCCESSFUL, &peer_device->flags) &&
+			peer_device->rs_in_flight > 0) {
+		/*
+		 * The rs_in_flight counter does not include discards waiting
+		 * to be merged. Hence we may jump back while there are
+		 * discards waiting to be merged. In this situation, we may
+		 * make a resync request that conflicts with a discard. Allow
+		 * the discard to be merged here so that the conflict is
+		 * resolved.
 		 */
-		align = 1;
-		rollback_i = i;
-		while (i < number) {
-			if (size + BM_BLOCK_SIZE > max_bio_size)
-				break;
+		drbd_process_rs_discards(peer_device, false);
+		goto skip_request;
+	}
 
-			/* Be always aligned */
-			if (sector & ((1<<(align+3))-1))
-				break;
+	/* don't let rs_sectors_came_in() re-schedule us "early"
+	 * just because the first reply came "fast", ... */
+	peer_device->rs_in_flight += bm_bit_to_sect(device->bitmap, number);
+
+	bits_per_peer_bit = peer_bm_block_shift > bm_block_shift ?
+		1 << (peer_bm_block_shift - bm_block_shift) : 1;
+
+	clear_bit(RS_REQUEST_UNSUCCESSFUL, &peer_device->flags);
+	for (; i < number; i += bits_per_peer_bit) {
+		int err;
+
+		/* If we are aborting the requests or the peer is canceling
+		 * them, there is no need to flood the connection with
+		 * requests. Back off now. */
+		if (i > 0 && test_bit(RS_REQUEST_UNSUCCESSFUL, &peer_device->flags)) {
+			request_ok = false;
+			goto request_done;
+		}
+
+		if ((number - i) < discard_granularity >> bm_block_shift)
+			goto request_done;
+
+		bit  = drbd_bm_find_next(peer_device, peer_device->resync_next_bit);
+		if (bit == DRBD_END_OF_BITMAP) {
+			peer_device->resync_next_bit = drbd_bm_bits(device);
+			goto request_done;
+		}
 
+		bit = ALIGN_DOWN(bit, bits_per_peer_bit);
+		sector = bm_bit_to_sect(bm, bit);
+
+		if (drbd_rs_c_min_rate_throttle(peer_device)) {
+			peer_device->resync_next_bit = bit;
+			goto request_done;
+		}
+
+		if (adjacent(prev_sector, size, sector) && (number - i) < size >> bm_block_shift) {
+			/* When making requests in an out-of-sync area, ensure that the size
+			   of successive requests does not decrease. This allows the next
+			   make_resync_request call to start with optimal alignment. */
+			goto request_done;
+		}
+
+		prev_sector = sector;
+		size = bm_block_size(bm) * bits_per_peer_bit;
+		optimal_bits_alignment = optimal_bits_for_alignment(bit,
+						max(peer_bm_block_shift, bm_block_shift));
+		optimal_bits_rate = round_to_powerof_2(number - i);
+		optimal_bits = min(optimal_bits_alignment, optimal_bits_rate) - 1;
+
+		/* try to find some adjacent bits. */
+		rollback_i = i;
+		while (optimal_bits-- > 0) {
 			if (discard_granularity && size == discard_granularity)
 				break;
 
-			/* do not cross extent boundaries */
-			if (((bit+1) & BM_BLOCKS_PER_BM_EXT_MASK) == 0)
+			if (drbd_bm_count_bits(device, peer_device->bitmap_index,
+					       bit + bits_per_peer_bit,
+					       bit + bits_per_peer_bit * 2 - 1) == 0)
 				break;
-			/* now, is it actually dirty, after all?
-			 * caution, drbd_bm_test_bit is tri-state for some
-			 * obscure reason; ( b == 0 ) would get the out-of-band
-			 * only accidentally right because of the "oddly sized"
-			 * adjustment below */
-			if (drbd_bm_test_bit(device, bit+1) != 1)
-				break;
-			bit++;
-			size += BM_BLOCK_SIZE;
-			if ((BM_BLOCK_SIZE << align) <= size)
-				align++;
-			i++;
+			size += bm_block_size(bm) * bits_per_peer_bit;
+			bit += bits_per_peer_bit;
+			i += bits_per_peer_bit;
 		}
-		/* if we merged some,
-		 * reset the offset to start the next drbd_bm_find_next from */
-		if (size > BM_BLOCK_SIZE)
-			device->bm_resync_fo = bit + 1;
-#endif
+
+		/* set the offset to start the next drbd_bm_find_next from */
+		peer_device->resync_next_bit = bit + bits_per_peer_bit;
 
 		/* adjust very last sectors, in case we are oddly sized */
 		if (sector + (size>>9) > capacity)
 			size = (capacity-sector)<<9;
 
-		if (device->use_csums) {
-			switch (read_for_csum(peer_device, sector, size)) {
-			case -EIO: /* Disk failure */
-				put_ldev(device);
-				return -EIO;
-			case -EAGAIN: /* allocation failed, or ldev busy */
-				drbd_rs_complete_io(device, sector);
-				device->bm_resync_fo = BM_SECT_TO_BIT(sector);
-				i = rollback_i;
-				goto requeue;
-			case 0:
-				/* everything ok */
-				break;
-			default:
-				BUG();
-			}
-		} else {
-			int err;
-
-			inc_rs_pending(peer_device);
-			err = drbd_send_drequest(peer_device,
-						 size == discard_granularity ? P_RS_THIN_REQ : P_RS_DATA_REQUEST,
-						 sector, size, ID_SYNCER);
-			if (err) {
-				drbd_err(device, "drbd_send_drequest() failed, aborting...\n");
-				dec_rs_pending(peer_device);
-				put_ldev(device);
-				return err;
-			}
+		if (peer_device->use_csums)
+			err = read_for_csum(peer_device, sector, size);
+		else
+			err = make_one_resync_request(peer_device, discard_granularity, sector, size);
+
+		switch (err) {
+		case -EIO: /* Disk failure */
+			put_ldev(device);
+			return -EIO;
+		case -EAGAIN: /* allocation failed, or ldev busy */
+			set_bit(RS_REQUEST_UNSUCCESSFUL, &peer_device->flags);
+			peer_device->resync_next_bit = bm_sect_to_bit(bm, sector);
+			i = rollback_i;
+			goto request_done;
+		case 0:
+			/* everything ok */
+			break;
+		default:
+			BUG();
 		}
 	}
 
-	if (device->bm_resync_fo >= drbd_bm_bits(device)) {
-		/* last syncer _request_ was sent,
-		 * but the P_RS_DATA_REPLY not yet received.  sync will end (and
-		 * next sync group will resume), as soon as we receive the last
-		 * resync data block, and the last bit is cleared.
-		 * until then resync "work" is "inactive" ...
+request_done:
+	/* ... but do a correction, in case we had to break/goto request_done; */
+	peer_device->rs_in_flight -= (number - i) * bm_sect_per_bit(bm);
+
+	if (peer_device->resync_next_bit >= drbd_bm_bits(device)) {
+		/*
+		 * Last resync request sent in this pass. There will be no
+		 * replies for subsequent sectors so discard merging should
+		 * stop here.
 		 */
-		put_ldev(device);
-		return 0;
+		drbd_last_resync_request(peer_device, false);
 	}
 
- requeue:
-	device->rs_in_flight += (i << (BM_BLOCK_SHIFT - 9));
-	mod_timer(&device->resync_timer, jiffies + SLEEP_TIME);
+skip_request:
+	/* Always reschedule ourselves as a form of polling to detect the end of a resync pass. */
+	mod_timer(&peer_device->resync_timer, jiffies + resync_delay(request_ok, number, i));
+
+	if (peer_device->rs_in_flight > 0 && request_ok) {
+		int rs_sect_in = atomic_read(&peer_device->rs_sect_in);
+
+		if (rs_sect_in >= peer_device->rs_in_flight) {
+			/*
+			 * In case replies were received before correction to
+			 * rs_in_flight, consider whether to schedule ourselves
+			 * early.
+			 */
+			drbd_rs_all_in_flight_came_back(peer_device, rs_sect_in);
+		}
+	}
+out_put_ldev:
 	put_ldev(device);
 	return 0;
 }
 
+static void send_ov_request(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct dagtag_find_result dagtag_result;
+	enum drbd_packet cmd = peer_device->connection->agreed_features & DRBD_FF_RESYNC_DAGTAG ?
+		P_OV_DAGTAG_REQ : P_OV_REQUEST;
+
+	inc_rs_pending(peer_device);
+
+	dagtag_result = find_current_dagtag(peer_device->device->resource);
+	if (dagtag_result.err) {
+		change_cstate(peer_device->connection, C_DISCONNECTING, CS_HARD);
+		return;
+	}
+
+	drbd_send_rs_request(peer_device, cmd,
+			peer_req->i.sector, peer_req->i.size, peer_req->block_id,
+			dagtag_result.node_id, dagtag_result.dagtag);
+}
+
+static void drbd_conflict_send_ov_request(struct drbd_peer_request *peer_req)
+{
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_device *device = peer_device->device;
+
+	spin_lock_irq(&device->interval_lock);
+	if (drbd_find_conflict(device, &peer_req->i, 0))
+		set_bit(INTERVAL_CONFLICT, &peer_req->i.flags);
+	drbd_insert_interval(&device->requests, &peer_req->i);
+	set_bit(INTERVAL_READY_TO_SEND, &peer_req->i.flags);
+	/* Mark as submitted now, since OV requests do not have a second
+	 * conflict resolution stage when the reply is received. */
+	set_bit(INTERVAL_SUBMITTED, &peer_req->i.flags);
+	spin_unlock_irq(&device->interval_lock);
+
+	/* If there were conflicts we will skip the block. However, we send a
+	 * request anyway because the protocol doesn't include any way to mark
+	 * a block as skipped without having sent any request. */
+	send_ov_request(peer_req);
+}
+
+/* make_ov_request() - initiate online verify requests as required
+ *
+ * Request handling flow:
+ *
+ * make_ov_request
+ *        |
+ *        v
+ * drbd_conflict_send_ov_request
+ *        |
+ *        v
+ * send_ov_request
+ *        |
+ *       ... via peer
+ *        |
+ *        v
+ * receive_dagtag_ov_reply
+ *        |
+ *        v
+ * receive_common_ov_reply
+ *        |
+ *        v              dagtag waiting
+ * drbd_peer_resync_read --------------+
+ *        |                            |
+ *        |                           ... dagtag_wait_ee
+ *        |                            |
+ *        |                            v
+ *        +--------------- release_dagtag_wait
+ *        |
+ *        v
+ * drbd_conflict_submit_peer_read
+ *        |
+ *        v
+ * drbd_submit_peer_request
+ *        |
+ *       ... backing device
+ *        |
+ *        v
+ * drbd_peer_request_endio
+ *        |
+ *        v
+ * drbd_endio_read_sec_final
+ *        |
+ *       ... sender_work
+ *        |
+ *        v
+ * w_e_end_ov_reply
+ */
 static int make_ov_request(struct drbd_peer_device *peer_device, int cancel)
 {
 	struct drbd_device *device = peer_device->device;
+	struct drbd_bitmap *bm;
+	struct drbd_connection *connection = peer_device->connection;
 	int number, i, size;
 	sector_t sector;
 	const sector_t capacity = get_capacity(device->vdisk);
@@ -774,262 +1579,538 @@ static int make_ov_request(struct drbd_peer_device *peer_device, int cancel)
 	if (unlikely(cancel))
 		return 1;
 
+	if (!get_ldev(device))
+		return 0;
+
+	bm = device->bitmap;
 	number = drbd_rs_number_requests(peer_device);
+	sector = peer_device->ov_position;
 
-	sector = device->ov_position;
+	/* don't let rs_sectors_came_in() re-schedule us "early"
+	 * just because the first reply came "fast", ... */
+	peer_device->rs_in_flight += bm_bit_to_sect(bm, number);
 	for (i = 0; i < number; i++) {
+		struct drbd_peer_request *peer_req;
+
 		if (sector >= capacity)
-			return 1;
+			break;
 
 		/* We check for "finished" only in the reply path:
 		 * w_e_end_ov_reply().
 		 * We need to send at least one request out. */
-		stop_sector_reached = i > 0
-			&& verify_can_do_stop_sector(device)
-			&& sector >= device->ov_stop_sector;
+		stop_sector_reached = sector > peer_device->ov_start_sector
+			&& verify_can_do_stop_sector(peer_device)
+			&& sector >= peer_device->ov_stop_sector;
 		if (stop_sector_reached)
 			break;
 
-		size = BM_BLOCK_SIZE;
-
-		if (drbd_try_rs_begin_io(peer_device, sector)) {
-			device->ov_position = sector;
-			goto requeue;
-		}
+		if (drbd_rs_c_min_rate_throttle(peer_device))
+			break;
 
+		size = bm_block_size(bm);
 		if (sector + (size>>9) > capacity)
 			size = (capacity-sector)<<9;
 
-		inc_rs_pending(peer_device);
-		if (drbd_send_ov_request(first_peer_device(device), sector, size)) {
-			dec_rs_pending(peer_device);
+		/* Do not wait if no memory is immediately available.
+		 * Don't allocate pages yet - we only need them when we
+		 * receive the P_OV_REPLY and need to read local data.
+		 * That is important to not exhaust max_buffers prematurely.
+		 */
+		peer_req = drbd_alloc_peer_req(peer_device, GFP_TRY & ~__GFP_RECLAIM, size,
+					       REQ_NO_BIO);
+		if (!peer_req) {
+			drbd_err(device, "Could not allocate online verify request\n");
+			put_ldev(device);
 			return 0;
 		}
-		sector += BM_SECT_PER_BIT;
-	}
-	device->ov_position = sector;
 
- requeue:
-	device->rs_in_flight += (i << (BM_BLOCK_SHIFT - 9));
-	if (i == 0 || !stop_sector_reached)
-		mod_timer(&device->resync_timer, jiffies + SLEEP_TIME);
+		peer_req->i.size = size;
+		peer_req->i.sector = sector;
+		peer_req->i.type = INTERVAL_OV_READ_SOURCE;
+
+		spin_lock_irq(&connection->peer_reqs_lock);
+		list_add_tail(&peer_req->recv_order, &connection->peer_reads);
+		peer_req->flags |= EE_ON_RECV_ORDER;
+		spin_unlock_irq(&connection->peer_reqs_lock);
+
+		drbd_conflict_send_ov_request(peer_req);
+
+		sector += bm_sect_per_bit(bm);
+	}
+	/* ... but do a correction, in case we had to break; ... */
+	peer_device->rs_in_flight -= bm_bit_to_sect(bm, number-i);
+	peer_device->ov_position = sector;
+	if (stop_sector_reached)
+		goto out_ok;
+	/* ... and in case that raced with the receiver,
+	 * reschedule ourselves right now */
+	if (i > 0 && atomic_read(&peer_device->rs_sect_in) >= peer_device->rs_in_flight)
+		drbd_queue_work_if_unqueued(
+			&peer_device->connection->sender_work,
+			&peer_device->resync_work);
+	else
+		mod_timer(&peer_device->resync_timer, jiffies + resync_delay(true, number, i));
+out_ok:
+	put_ldev(device);
 	return 1;
 }
 
-int w_ov_finished(struct drbd_work *w, int cancel)
+struct resync_finished_work {
+	struct drbd_peer_device_work pdw;
+	enum drbd_disk_state new_peer_disk_state;
+};
+
+static int w_resync_finished(struct drbd_work *w, int cancel)
 {
-	struct drbd_device_work *dw =
-		container_of(w, struct drbd_device_work, w);
-	struct drbd_device *device = dw->device;
-	kfree(dw);
-	ov_out_of_sync_print(first_peer_device(device));
-	drbd_resync_finished(first_peer_device(device));
+	struct resync_finished_work *rfw = container_of(
+		container_of(w, struct drbd_peer_device_work, w),
+		struct resync_finished_work, pdw);
+
+	if (!cancel)
+		drbd_resync_finished(rfw->pdw.peer_device, rfw->new_peer_disk_state);
+	kfree(rfw);
 
 	return 0;
 }
 
-static int w_resync_finished(struct drbd_work *w, int cancel)
+static long ping_timeout(struct drbd_connection *connection)
 {
-	struct drbd_device_work *dw =
-		container_of(w, struct drbd_device_work, w);
-	struct drbd_device *device = dw->device;
-	kfree(dw);
+	struct net_conf *nc;
+	long timeout;
 
-	drbd_resync_finished(first_peer_device(device));
+	rcu_read_lock();
+	nc = rcu_dereference(connection->transport.net_conf);
+	timeout = nc->ping_timeo * HZ / 10;
+	rcu_read_unlock();
 
-	return 0;
+	return timeout;
+}
+
+static int send_ping_peer(struct drbd_connection *connection)
+{
+	bool was_pending = test_and_set_bit(PING_PENDING, &connection->flags);
+	int err = 0;
+
+	if (!was_pending) {
+		err = drbd_send_ping(connection);
+		if (err)
+			change_cstate(connection, C_NETWORK_FAILURE, CS_HARD);
+	}
+
+	return err;
+}
+
+void drbd_ping_peer(struct drbd_connection *connection)
+{
+	long r, timeout = ping_timeout(connection);
+	int err;
+
+	err = send_ping_peer(connection);
+	if (err)
+		return;
+
+	r = wait_event_timeout(connection->resource->state_wait,
+			       !test_bit(PING_PENDING, &connection->flags) ||
+			       connection->cstate[NOW] < C_CONNECTED,
+			       timeout);
+	if (r > 0)
+		return;
+
+	drbd_warn(connection, "PingAck did not arrive in time\n");
+	change_cstate(connection, C_NETWORK_FAILURE, CS_HARD);
+}
+
+/* caller needs to hold rcu_read_lock, state_rwlock, adm_mutex or conf_update */
+struct drbd_peer_device *peer_device_by_node_id(struct drbd_device *device, int node_id)
+{
+	struct drbd_peer_device *peer_device;
+
+	for_each_peer_device_rcu(peer_device, device) {
+		if (peer_device->node_id == node_id)
+			return peer_device;
+	}
+
+	return NULL;
+}
+
+static void __outdate_peer_disk_by_mask(struct drbd_device *device, u64 nodes)
+{
+	struct drbd_peer_device *peer_device;
+	int node_id;
+
+	for (node_id = 0; node_id < DRBD_NODE_ID_MAX; node_id++) {
+		if (!(nodes & NODE_MASK(node_id)))
+			continue;
+		peer_device = peer_device_by_node_id(device, node_id);
+		if (peer_device && peer_device->disk_state[NEW] >= D_CONSISTENT)
+			__change_peer_disk_state(peer_device, D_OUTDATED);
+	}
+}
+
+/* An annoying corner case is if we are resync target towards a bunch
+   of nodes. One of the resyncs finished as STABLE_RESYNC, the others
+   as UNSTABLE_RESYNC. */
+static bool was_resync_stable(struct drbd_peer_device *peer_device)
+{
+	struct drbd_device *device = peer_device->device;
+
+	if (test_bit(UNSTABLE_RESYNC, &peer_device->flags) &&
+	    !test_bit(STABLE_RESYNC, &device->flags))
+		return false;
+
+	set_bit(STABLE_RESYNC, &device->flags);
+	/* that STABLE_RESYNC bit gets reset if in any other ongoing resync
+	   we receive something from a resync source that is marked with
+	   UNSTABLE RESYNC. */
+
+	return true;
+}
+
+static u64 __cancel_other_resyncs(struct drbd_device *device)
+{
+	struct drbd_peer_device *peer_device;
+	u64 target_m = 0;
+
+	for_each_peer_device(peer_device, device) {
+		if (peer_device->repl_state[NEW] == L_PAUSED_SYNC_T) {
+			target_m |= NODE_MASK(peer_device->node_id);
+			__change_repl_state(peer_device, L_ESTABLISHED);
+		}
+	}
+
+	return target_m;
 }
 
-static void ping_peer(struct drbd_device *device)
+static void resync_again(struct drbd_device *device, u64 source_m, u64 target_m)
 {
-	struct drbd_connection *connection = first_peer_device(device)->connection;
+	struct drbd_peer_device *peer_device;
+
+	for_each_peer_device(peer_device, device) {
+		if (peer_device->resync_again) {
+			u64 m = NODE_MASK(peer_device->node_id);
+			enum drbd_repl_state new_repl_state =
+				source_m & m ? L_WF_BITMAP_S :
+				target_m & m ? L_WF_BITMAP_T :
+				L_ESTABLISHED;
+
+			if (new_repl_state != L_ESTABLISHED) {
+				peer_device->resync_again--;
+				begin_state_change_locked(device->resource, CS_VERBOSE);
+				__change_repl_state(peer_device, new_repl_state);
+				end_state_change_locked(device->resource, "resync-again");
+			}
+		}
+	}
+}
+
+static void init_resync_stable_bits(struct drbd_peer_device *first_target_pd)
+{
+	struct drbd_device *device = first_target_pd->device;
+	struct drbd_peer_device *peer_device;
 
-	clear_bit(GOT_PING_ACK, &connection->flags);
-	request_ping(connection);
-	wait_event(connection->ping_wait,
-		   test_bit(GOT_PING_ACK, &connection->flags) || device->state.conn < C_CONNECTED);
+	clear_bit(UNSTABLE_RESYNC, &first_target_pd->flags);
+
+	/* Clear the device wide STABLE_RESYNC flag when becoming
+	   resync target on the first peer_device. */
+	for_each_peer_device(peer_device, device) {
+		enum drbd_repl_state repl_state = peer_device->repl_state[NOW];
+		if (peer_device == first_target_pd)
+			continue;
+		if (repl_state == L_SYNC_TARGET || repl_state == L_PAUSED_SYNC_T)
+			return;
+	}
+	clear_bit(STABLE_RESYNC, &device->flags);
 }
 
-int drbd_resync_finished(struct drbd_peer_device *peer_device)
+static void after_reconciliation_resync(struct drbd_connection *connection)
+{
+	struct drbd_connection *lost_peer =
+		drbd_get_connection_by_node_id(connection->resource,
+					       connection->after_reconciliation.lost_node_id);
+
+	if (lost_peer) {
+		if (lost_peer->cstate[NOW] < C_CONNECTED)
+			atomic64_set(&lost_peer->last_dagtag_sector,
+				connection->after_reconciliation.dagtag_sector);
+
+		kref_put(&lost_peer->kref, drbd_destroy_connection);
+	}
+
+	connection->after_reconciliation.lost_node_id = -1;
+}
+
+static void try_to_get_resynced_from_primary(struct drbd_device *device)
+{
+	struct drbd_resource *resource = device->resource;
+	struct drbd_peer_device *peer_device;
+	struct drbd_connection *connection;
+
+	read_lock_irq(&resource->state_rwlock);
+	for_each_peer_device(peer_device, device) {
+		if (peer_device->connection->peer_role[NEW] == R_PRIMARY &&
+		    peer_device->disk_state[NEW] == D_UP_TO_DATE)
+			goto found;
+	}
+	peer_device = NULL;
+found:
+	read_unlock_irq(&resource->state_rwlock);
+
+	if (!peer_device)
+		return;
+
+	connection = peer_device->connection;
+	if (connection->agreed_pro_version < 118) {
+		drbd_warn(connection,
+			  "peer is lower than protocol vers 118, reconnecting to get resynced\n");
+		change_cstate(connection, C_PROTOCOL_ERROR, CS_HARD);
+		return;
+	}
+
+	drbd_send_uuids(peer_device, 0, 0);
+	drbd_start_resync(peer_device, L_SYNC_TARGET, "resync-from-primary");
+}
+
+static void queue_resync_finished(struct drbd_peer_device *peer_device, enum drbd_disk_state new_peer_disk_state)
+{
+	struct drbd_connection *connection = peer_device->connection;
+	struct resync_finished_work *rfw;
+
+	rfw = kmalloc_obj(*rfw, GFP_ATOMIC);
+	if (!rfw) {
+		drbd_err(peer_device, "Warn failed to kmalloc(dw).\n");
+		return;
+	}
+
+	rfw->pdw.w.cb = w_resync_finished;
+	rfw->pdw.peer_device = peer_device;
+	rfw->new_peer_disk_state = new_peer_disk_state;
+	drbd_queue_work(&connection->sender_work, &rfw->pdw.w);
+}
+
+static void drbd_queue_final_peers_in_sync(struct drbd_peer_device *peer_device)
+{
+	sector_t last_end = peer_device->last_in_sync_end;
+	sector_t last_step = last_end & ~PEERS_IN_SYNC_STEP_SECT_MASK;
+	sector_t last_step_end = min(get_capacity(peer_device->device->vdisk),
+			last_step + PEERS_IN_SYNC_STEP_SECT);
+
+	/* Send for last request if it was part way through a step */
+	if (last_end > last_step)
+		drbd_queue_update_peers(peer_device, last_step, last_step_end);
+}
+
+void drbd_resync_finished(struct drbd_peer_device *peer_device,
+			 enum drbd_disk_state new_peer_disk_state)
 {
 	struct drbd_device *device = peer_device->device;
 	struct drbd_connection *connection = peer_device->connection;
+	enum drbd_repl_state *repl_state = peer_device->repl_state;
+	enum drbd_repl_state old_repl_state = L_ESTABLISHED;
+	bool try_to_get_resynced_from_primary_flag = false;
+	u64 source_m = 0, target_m = 0;
 	unsigned long db, dt, dbdt;
 	unsigned long n_oos;
-	union drbd_state os, ns;
-	struct drbd_device_work *dw;
 	char *khelper_cmd = NULL;
 	int verify_done = 0;
+	bool aborted = false;
+	int bm_block_shift = device->last_bm_block_shift;
 
-	/* Remove all elements from the resync LRU. Since future actions
-	 * might set bits in the (main) bitmap, then the entries in the
-	 * resync LRU would be wrong. */
-	if (drbd_rs_del_all(device)) {
-		/* In case this is not possible now, most probably because
-		 * there are P_RS_DATA_REPLY Packets lingering on the worker's
-		 * queue (or even the read operations for those packets
-		 * is not finished by now).   Retry in 100ms. */
-
-		schedule_timeout_interruptible(HZ / 10);
-		dw = kmalloc_obj(struct drbd_device_work, GFP_ATOMIC);
-		if (dw) {
-			dw->w.cb = w_resync_finished;
-			dw->device = device;
-			drbd_queue_work(&connection->sender_work, &dw->w);
-			return 1;
+	if (repl_state[NOW] == L_SYNC_SOURCE || repl_state[NOW] == L_PAUSED_SYNC_S) {
+		/* Make sure all queued w_update_peers() executed. */
+		if (current == device->resource->worker.task) {
+			queue_resync_finished(peer_device, new_peer_disk_state);
+			return;
+		} else {
+			drbd_flush_workqueue(&device->resource->work);
 		}
-		drbd_err(device, "Warn failed to drbd_rs_del_all() and to kmalloc(dw).\n");
 	}
 
-	dt = (jiffies - device->rs_start - device->rs_paused) / HZ;
+	if (!down_write_trylock(&device->uuid_sem)) {
+		if (current == device->resource->worker.task) {
+			queue_resync_finished(peer_device, new_peer_disk_state);
+			return;
+		} else {
+			down_write(&device->uuid_sem);
+		}
+	}
+
+	dt = (jiffies - peer_device->rs_start - peer_device->rs_paused) / HZ;
 	if (dt <= 0)
 		dt = 1;
-
-	db = device->rs_total;
+	db = peer_device->rs_total;
 	/* adjust for verify start and stop sectors, respective reached position */
-	if (device->state.conn == C_VERIFY_S || device->state.conn == C_VERIFY_T)
-		db -= device->ov_left;
+	if (repl_state[NOW] == L_VERIFY_S || repl_state[NOW] == L_VERIFY_T)
+		db -= atomic64_read(&peer_device->ov_left);
 
-	dbdt = Bit2KB(db/dt);
-	device->rs_paused /= HZ;
+	dbdt = bit_to_kb(db/dt, bm_block_shift);
+	peer_device->rs_paused /= HZ;
 
-	if (!get_ldev(device))
+	if (!get_ldev(device)) {
+		up_write(&device->uuid_sem);
 		goto out;
+	}
 
-	ping_peer(device);
+	drbd_ping_peer(connection);
 
-	spin_lock_irq(&device->resource->req_lock);
-	os = drbd_read_state(device);
+	write_lock_irq(&device->resource->state_rwlock);
+	begin_state_change_locked(device->resource, CS_VERBOSE);
+	old_repl_state = repl_state[NOW];
 
-	verify_done = (os.conn == C_VERIFY_S || os.conn == C_VERIFY_T);
+	verify_done = (repl_state[NOW] == L_VERIFY_S || repl_state[NOW] == L_VERIFY_T);
 
 	/* This protects us against multiple calls (that can happen in the presence
 	   of application IO), and against connectivity loss just before we arrive here. */
-	if (os.conn <= C_CONNECTED)
+	if (peer_device->repl_state[NOW] <= L_ESTABLISHED)
 		goto out_unlock;
 
-	ns = os;
-	ns.conn = C_CONNECTED;
+	/*
+	 * This protects us against a race with the peer when finishing a
+	 * resync at the same time as entering Ahead-Behind mode.
+	 */
+	if (peer_device->repl_state[NOW] == L_BEHIND)
+		goto out_unlock;
 
-	drbd_info(device, "%s done (total %lu sec; paused %lu sec; %lu K/sec)\n",
-	     verify_done ? "Online verify" : "Resync",
-	     dt + device->rs_paused, device->rs_paused, dbdt);
+	peer_device->resync_active[NEW] = false;
+	__change_repl_state(peer_device, L_ESTABLISHED);
+
+	aborted = device->disk_state[NOW] == D_OUTDATED && new_peer_disk_state == D_INCONSISTENT;
+	{
+	char tmp[sizeof(" but 01234567890123456789 4k blocks skipped")] = "";
+	if (verify_done && peer_device->ov_skipped)
+		snprintf(tmp, sizeof(tmp), " but %lu %lluk blocks skipped",
+			peer_device->ov_skipped, bit_to_kb(1, bm_block_shift));
+	drbd_info(peer_device, "%s %s%s (total %lu sec; paused %lu sec; %lu K/sec)\n",
+		  verify_done ? "Online verify" : "Resync",
+		  aborted ? "aborted" : "done", tmp,
+		  dt + peer_device->rs_paused, peer_device->rs_paused, dbdt);
+	}
 
-	n_oos = drbd_bm_total_weight(device);
+	n_oos = drbd_bm_total_weight(peer_device);
 
-	if (os.conn == C_VERIFY_S || os.conn == C_VERIFY_T) {
+	if (repl_state[NOW] == L_VERIFY_S || repl_state[NOW] == L_VERIFY_T) {
 		if (n_oos) {
-			drbd_alert(device, "Online verify found %lu %dk block out of sync!\n",
-			      n_oos, Bit2KB(1));
+			drbd_alert(peer_device, "Online verify found %lu %lluk blocks out of sync!\n",
+			      n_oos, bit_to_kb(1, bm_block_shift));
 			khelper_cmd = "out-of-sync";
 		}
 	} else {
-		D_ASSERT(device, (n_oos - device->rs_failed) == 0);
+		if (!aborted && peer_device->rs_failed == 0 && n_oos != 0)
+			drbd_warn(peer_device, "expected n_oos:%lu to be 0\n", n_oos);
 
-		if (os.conn == C_SYNC_TARGET || os.conn == C_PAUSED_SYNC_T)
+		if (repl_state[NOW] == L_SYNC_TARGET || repl_state[NOW] == L_PAUSED_SYNC_T)
 			khelper_cmd = "after-resync-target";
 
-		if (device->use_csums && device->rs_total) {
-			const unsigned long s = device->rs_same_csum;
-			const unsigned long t = device->rs_total;
+		if (peer_device->use_csums && peer_device->rs_total) {
+			const unsigned long s = peer_device->rs_same_csum;
+			const unsigned long t = peer_device->rs_total;
 			const int ratio =
 				(t == 0)     ? 0 :
 			(t < 100000) ? ((s*100)/t) : (s/(t/100));
-			drbd_info(device, "%u %% had equal checksums, eliminated: %luK; "
-			     "transferred %luK total %luK\n",
+			drbd_info(peer_device, "%u %% had equal checksums, eliminated: %lluK; "
+			     "transferred %lluK total %lluK\n",
 			     ratio,
-			     Bit2KB(device->rs_same_csum),
-			     Bit2KB(device->rs_total - device->rs_same_csum),
-			     Bit2KB(device->rs_total));
+			     bit_to_kb(peer_device->rs_same_csum, bm_block_shift),
+			     bit_to_kb(peer_device->rs_total - peer_device->rs_same_csum,
+					bm_block_shift),
+			     bit_to_kb(peer_device->rs_total, bm_block_shift));
 		}
 	}
 
-	if (device->rs_failed) {
-		drbd_info(device, "            %lu failed blocks\n", device->rs_failed);
+	if (peer_device->rs_failed) {
+		drbd_info(peer_device, "            %lu failed blocks\n", peer_device->rs_failed);
 
-		if (os.conn == C_SYNC_TARGET || os.conn == C_PAUSED_SYNC_T) {
-			ns.disk = D_INCONSISTENT;
-			ns.pdsk = D_UP_TO_DATE;
+		if (repl_state[NOW] == L_SYNC_TARGET || repl_state[NOW] == L_PAUSED_SYNC_T) {
+			__change_disk_state(device, D_INCONSISTENT);
+			__change_peer_disk_state(peer_device, D_UP_TO_DATE);
 		} else {
-			ns.disk = D_UP_TO_DATE;
-			ns.pdsk = D_INCONSISTENT;
+			__change_disk_state(device, D_UP_TO_DATE);
+			__change_peer_disk_state(peer_device, D_INCONSISTENT);
 		}
 	} else {
-		ns.disk = D_UP_TO_DATE;
-		ns.pdsk = D_UP_TO_DATE;
+		if (repl_state[NOW] == L_SYNC_TARGET || repl_state[NOW] == L_PAUSED_SYNC_T) {
+			bool stable_resync = was_resync_stable(peer_device);
+			if (stable_resync) {
+				enum drbd_disk_state new_disk_state = peer_device->disk_state[NOW];
+				if (new_disk_state < D_UP_TO_DATE &&
+				    test_bit(SYNC_SRC_CRASHED_PRI, &peer_device->flags)) {
+					try_to_get_resynced_from_primary_flag = true;
+					set_bit(CRASHED_PRIMARY, &device->flags);
+				}
+				__change_disk_state(device, new_disk_state);
+			}
 
-		if (os.conn == C_SYNC_TARGET || os.conn == C_PAUSED_SYNC_T) {
-			if (device->p_uuid) {
+			if (device->disk_state[NEW] == D_UP_TO_DATE)
+				target_m = __cancel_other_resyncs(device);
+
+			if (stable_resync && test_bit(UUIDS_RECEIVED, &peer_device->flags)) {
+				const int node_id = device->resource->res_opts.node_id;
 				int i;
-				for (i = UI_BITMAP ; i <= UI_HISTORY_END ; i++)
-					_drbd_uuid_set(device, i, device->p_uuid[i]);
-				drbd_uuid_set(device, UI_BITMAP, device->ldev->md.uuid[UI_CURRENT]);
-				_drbd_uuid_set(device, UI_CURRENT, device->p_uuid[UI_CURRENT]);
-			} else {
-				drbd_err(device, "device->p_uuid is NULL! BUG\n");
-			}
-		}
 
-		if (!(os.conn == C_VERIFY_S || os.conn == C_VERIFY_T)) {
-			/* for verify runs, we don't update uuids here,
-			 * so there would be nothing to report. */
-			drbd_uuid_set_bm(device, 0UL);
-			drbd_print_uuids(device, "updated UUIDs");
-			if (device->p_uuid) {
+				u64 newer = drbd_uuid_resync_finished(peer_device);
+				__outdate_peer_disk_by_mask(device, newer);
+				drbd_print_uuids(peer_device, "updated UUIDs");
+
 				/* Now the two UUID sets are equal, update what we
 				 * know of the peer. */
-				int i;
-				for (i = UI_CURRENT ; i <= UI_HISTORY_END ; i++)
-					device->p_uuid[i] = device->ldev->md.uuid[i];
+				peer_device->current_uuid = drbd_current_uuid(device);
+				peer_device->bitmap_uuids[node_id] = drbd_bitmap_uuid(peer_device);
+				for (i = 0; i < ARRAY_SIZE(peer_device->history_uuids); i++)
+					peer_device->history_uuids[i] =
+						drbd_history_uuid(device, i);
+			} else {
+				if (!test_bit(UUIDS_RECEIVED, &peer_device->flags))
+					drbd_err(peer_device, "BUG: uuids were not received!\n");
+
+				if (test_bit(UNSTABLE_RESYNC, &peer_device->flags))
+					drbd_info(peer_device, "Peer was unstable during resync\n");
+			}
+		} else if (repl_state[NOW] == L_SYNC_SOURCE || repl_state[NOW] == L_PAUSED_SYNC_S) {
+			if (new_peer_disk_state != D_MASK)
+				__change_peer_disk_state(peer_device, new_peer_disk_state);
+			if (peer_device->connection->agreed_pro_version < 110) {
+				drbd_uuid_set_bitmap(peer_device, 0UL);
+				drbd_print_uuids(peer_device, "updated UUIDs");
 			}
 		}
 	}
 
-	_drbd_set_state(device, ns, CS_VERBOSE, NULL);
 out_unlock:
-	spin_unlock_irq(&device->resource->req_lock);
+	end_state_change_locked(device->resource, "resync-finished");
 
-	/* If we have been sync source, and have an effective fencing-policy,
-	 * once *all* volumes are back in sync, call "unfence". */
-	if (os.conn == C_SYNC_SOURCE) {
-		enum drbd_disk_state disk_state = D_MASK;
-		enum drbd_disk_state pdsk_state = D_MASK;
-		enum drbd_fencing_p fp = FP_DONT_CARE;
+	put_ldev(device);
 
-		rcu_read_lock();
-		fp = rcu_dereference(device->ldev->disk_conf)->fencing;
-		if (fp != FP_DONT_CARE) {
-			struct drbd_peer_device *peer_device;
-			int vnr;
-			idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
-				struct drbd_device *device = peer_device->device;
-				disk_state = min_t(enum drbd_disk_state, disk_state, device->state.disk);
-				pdsk_state = min_t(enum drbd_disk_state, pdsk_state, device->state.pdsk);
-			}
-		}
-		rcu_read_unlock();
-		if (disk_state == D_UP_TO_DATE && pdsk_state == D_UP_TO_DATE)
-			conn_khelper(connection, "unfence-peer");
-	}
+	peer_device->rs_total  = 0;
+	peer_device->rs_failed = 0;
+	peer_device->rs_paused = 0;
 
-	put_ldev(device);
-out:
-	device->rs_total  = 0;
-	device->rs_failed = 0;
-	device->rs_paused = 0;
+	if (old_repl_state == L_SYNC_TARGET || old_repl_state == L_PAUSED_SYNC_T)
+		target_m |= NODE_MASK(peer_device->node_id);
+	else if (old_repl_state == L_SYNC_SOURCE || old_repl_state == L_PAUSED_SYNC_S)
+		source_m |= NODE_MASK(peer_device->node_id);
 
+	resync_again(device, source_m, target_m);
+	write_unlock_irq(&device->resource->state_rwlock);
+	up_write(&device->uuid_sem);
+	if (connection->after_reconciliation.lost_node_id != -1)
+		after_reconciliation_resync(connection);
+
+	drbd_queue_final_peers_in_sync(peer_device);
+
+out:
 	/* reset start sector, if we reached end of device */
-	if (verify_done && device->ov_left == 0)
-		device->ov_start_sector = 0;
+	if (verify_done && atomic64_read(&peer_device->ov_left) == 0)
+		peer_device->ov_start_sector = 0;
 
-	drbd_md_sync(device);
+	drbd_md_sync_if_dirty(device);
 
 	if (khelper_cmd)
-		drbd_khelper(device, khelper_cmd);
+		drbd_maybe_khelper(device, connection, khelper_cmd);
 
-	return 1;
+	if (try_to_get_resynced_from_primary_flag)
+		try_to_get_resynced_from_primary(device);
 }
 
+
 /**
  * w_e_end_data_req() - Worker callback, to send a P_DATA_REPLY packet in response to a P_DATA_REQUEST
  * @w:		work object.
@@ -1039,7 +2120,6 @@ int w_e_end_data_req(struct drbd_work *w, int cancel)
 {
 	struct drbd_peer_request *peer_req = container_of(w, struct drbd_peer_request, w);
 	struct drbd_peer_device *peer_device = peer_req->peer_device;
-	struct drbd_device *device = peer_device->device;
 	int err;
 
 	if (unlikely(cancel)) {
@@ -1050,162 +2130,236 @@ int w_e_end_data_req(struct drbd_work *w, int cancel)
 	if (likely((peer_req->flags & EE_WAS_ERROR) == 0)) {
 		err = drbd_send_block(peer_device, P_DATA_REPLY, peer_req);
 	} else {
-		if (drbd_ratelimit())
-			drbd_err(device, "Sending NegDReply. sector=%llus.\n",
+		drbd_err_ratelimit(peer_device, "Sending NegDReply. sector=%llus.\n",
 			    (unsigned long long)peer_req->i.sector);
 
 		err = drbd_send_ack(peer_device, P_NEG_DREPLY, peer_req);
 	}
-
 	if (unlikely(err))
-		drbd_err(device, "drbd_send_block() failed\n");
+		drbd_err(peer_device, "drbd_send_block() failed\n");
+
 out:
-	dec_unacked(device);
-	drbd_free_peer_req(device, peer_req);
+	dec_unacked(peer_device);
+	drbd_free_peer_req(peer_req);
 
 	return err;
 }
 
+void
+drbd_resync_read_req_mod(struct drbd_peer_request *peer_req, enum drbd_interval_flags bit_to_set)
+{
+	const unsigned long done_mask = 1UL << INTERVAL_SENT | 1UL << INTERVAL_RECEIVED;
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	unsigned long nflags, oflags, new_flag;
+
+	new_flag = 1UL << bit_to_set;
+	if (!(new_flag & done_mask))
+		drbd_err(peer_device, "BUG: %s: Unexpected flag 0x%lx\n", __func__, new_flag);
+
+	do {
+		oflags = READ_ONCE(peer_req->i.flags);
+		nflags = oflags | new_flag;
+	} while (cmpxchg(&peer_req->i.flags, oflags, nflags) != oflags);
+
+	if (new_flag & oflags)
+		drbd_err(peer_device, "BUG: %s: Flag 0x%lx already set\n", __func__, new_flag);
+
+	if ((nflags & done_mask) == done_mask)
+		drbd_free_peer_req(peer_req);
+}
+
 static bool all_zero(struct drbd_peer_request *peer_req)
 {
-	struct page *page = peer_req->pages;
-	unsigned int len = peer_req->i.size;
+	struct bvec_iter iter;
+	struct bio_vec bvec;
+	struct bio *bio;
 
-	page_chain_for_each(page) {
-		unsigned int l = min_t(unsigned int, len, PAGE_SIZE);
-		unsigned int i, words = l / sizeof(long);
-		unsigned long *d;
+	bio_list_for_each(bio, &peer_req->bios) {
+		bio_for_each_segment(bvec, bio, iter) {
+			unsigned long *d = bvec_virt(&bvec);
+			unsigned int i, words = bvec.bv_len / sizeof(*d);
 
-		d = kmap_atomic(page);
-		for (i = 0; i < words; i++) {
-			if (d[i]) {
-				kunmap_atomic(d);
-				return false;
+			for (i = 0; i < words; i++) {
+				if (d[i])
+					return false;
 			}
 		}
-		kunmap_atomic(d);
-		len -= l;
 	}
 
 	return true;
 }
 
-/**
- * w_e_end_rsdata_req() - Worker callback to send a P_RS_DATA_REPLY packet in response to a P_RS_DATA_REQUEST
- * @w:		work object.
- * @cancel:	The connection will be closed anyways
- */
-int w_e_end_rsdata_req(struct drbd_work *w, int cancel)
+static bool al_resync_extent_active(struct drbd_device *device, sector_t sector, unsigned int size)
 {
-	struct drbd_peer_request *peer_req = container_of(w, struct drbd_peer_request, w);
-	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	sector_t resync_extent_sector = sector & ~LEGACY_BM_EXT_SECT_MASK;
+	sector_t end_sector = sector + (size >> SECTOR_SHIFT);
+	sector_t resync_extent_end_sector =
+		(end_sector + LEGACY_BM_EXT_SECT_MASK) & ~LEGACY_BM_EXT_SECT_MASK;
+	return drbd_al_active(device,
+			resync_extent_sector,
+			(resync_extent_end_sector - resync_extent_sector) << SECTOR_SHIFT);
+}
+
+static int drbd_rs_reply(struct drbd_peer_device *peer_device, struct drbd_peer_request *peer_req, bool *expect_ack)
+{
+	struct drbd_connection *connection = peer_device->connection;
 	struct drbd_device *device = peer_device->device;
 	int err;
+	bool eq = false;
 
-	if (unlikely(cancel)) {
-		err = 0;
-		goto out;
-	}
+	if (peer_req->flags & EE_HAS_DIGEST) {
+		struct digest_info *di = peer_req->digest;
+		int digest_size;
+		void *digest = NULL;
 
-	if (get_ldev_if_state(device, D_FAILED)) {
-		drbd_rs_complete_io(device, peer_req->i.sector);
-		put_ldev(device);
+		/* quick hack to try to avoid a race against reconfiguration.
+		 * a real fix would be much more involved,
+		 * introducing more locking mechanisms */
+		if (connection->csums_tfm) {
+			digest_size = crypto_shash_digestsize(connection->csums_tfm);
+			D_ASSERT(device, digest_size == di->digest_size);
+			digest = kmalloc(digest_size, GFP_NOIO);
+			if (digest) {
+				drbd_csum_bios(connection->csums_tfm, &peer_req->bios, digest);
+				eq = !memcmp(digest, di->digest, digest_size);
+				kfree(digest);
+			}
+		}
+
+		peer_req->flags &= ~EE_HAS_DIGEST; /* This peer request no longer has a digest pointer */
+		kfree(di);
 	}
 
-	if (device->state.conn == C_AHEAD) {
-		err = drbd_send_ack(peer_device, P_RS_CANCEL, peer_req);
-	} else if (likely((peer_req->flags & EE_WAS_ERROR) == 0)) {
-		if (likely(device->state.pdsk >= D_INCONSISTENT)) {
-			inc_rs_pending(peer_device);
-			if (peer_req->flags & EE_RS_THIN_REQ && all_zero(peer_req))
-				err = drbd_send_rs_deallocated(peer_device, peer_req);
-			else
-				err = drbd_send_block(peer_device, P_RS_DATA_REPLY, peer_req);
+	if (eq) {
+		drbd_set_in_sync(peer_device, peer_req->i.sector, peer_req->i.size);
+		/* rs_same_csums unit is BM_BLOCK_SIZE */
+		/* ldev_safe: a bio that holds a ldev ref exists */
+		peer_device->rs_same_csum += peer_req->i.size >> device->ldev->md.bm_block_shift;
+		err = drbd_send_ack(peer_device, P_RS_IS_IN_SYNC, peer_req);
+	} else {
+		inc_rs_pending(peer_device);
+		/*
+		 * If we send back as P_RS_DEALLOCATED,
+		 * this is overestimating "in-flight" accounting.
+		 * But needed to be properly balanced with
+		 * the atomic_sub() in got_RSWriteAck.
+		 */
+		atomic_add(peer_req->i.size >> 9, &connection->rs_in_flight);
+
+		/* After setting this, peer_req can be found by got_RSWriteAck. */
+		set_bit(INTERVAL_READY_TO_SEND, &peer_req->i.flags);
+
+		if (peer_req->flags & EE_RS_THIN_REQ && all_zero(peer_req)) {
+			err = drbd_send_rs_deallocated(peer_device, peer_req);
 		} else {
-			if (drbd_ratelimit())
-				drbd_err(device, "Not sending RSDataReply, "
-				    "partner DISKLESS!\n");
-			err = 0;
+			err = drbd_send_block(peer_device, P_RS_DATA_REPLY, peer_req);
 		}
-	} else {
-		if (drbd_ratelimit())
-			drbd_err(device, "Sending NegRSDReply. sector %llus.\n",
-			    (unsigned long long)peer_req->i.sector);
+		*expect_ack = true;
 
-		err = drbd_send_ack(peer_device, P_NEG_RS_DREPLY, peer_req);
+		drbd_peer_req_strip_bio(peer_req);
 
-		/* update resync data with failure */
-		drbd_rs_failed_io(peer_device, peer_req->i.sector, peer_req->i.size);
+		drbd_resync_read_req_mod(peer_req, INTERVAL_SENT);
+		peer_req = NULL;
 	}
-	if (unlikely(err))
-		drbd_err(device, "drbd_send_block() failed\n");
-out:
-	dec_unacked(device);
-	drbd_free_peer_req(device, peer_req);
 
 	return err;
 }
 
-int w_e_end_csum_rs_req(struct drbd_work *w, int cancel)
+/**
+ * w_e_end_rsdata_req() - Reply to a resync request.
+ * @w:		work object.
+ * @cancel:	The connection is being closed
+ *
+ * Worker callback to send P_RS_DATA_REPLY or a related packet after completing
+ * a resync read.
+ *
+ * Return: Error code or 0 on success.
+ */
+int w_e_end_rsdata_req(struct drbd_work *w, int cancel)
 {
 	struct drbd_peer_request *peer_req = container_of(w, struct drbd_peer_request, w);
 	struct drbd_peer_device *peer_device = peer_req->peer_device;
-	struct drbd_device *device = peer_device->device;
-	struct digest_info *di;
-	int digest_size;
-	void *digest = NULL;
-	int err, eq = 0;
-
-	if (unlikely(cancel)) {
-		err = 0;
-		goto out;
-	}
+	struct drbd_connection *connection = peer_device->connection;
+	int err;
+	bool expect_ack = false;
 
-	if (get_ldev(device)) {
-		drbd_rs_complete_io(device, peer_req->i.sector);
-		put_ldev(device);
+	if (unlikely(cancel) || connection->cstate[NOW] < C_CONNECTED) {
+		drbd_remove_peer_req_interval(peer_req);
+		drbd_free_peer_req(peer_req);
+		dec_unacked(peer_device);
+		return 0;
 	}
 
-	di = peer_req->digest;
-
-	if (likely((peer_req->flags & EE_WAS_ERROR) == 0)) {
-		/* quick hack to try to avoid a race against reconfiguration.
-		 * a real fix would be much more involved,
-		 * introducing more locking mechanisms */
-		if (peer_device->connection->csums_tfm) {
-			digest_size = crypto_shash_digestsize(peer_device->connection->csums_tfm);
-			D_ASSERT(device, digest_size == di->digest_size);
-			digest = kmalloc(digest_size, GFP_NOIO);
-		}
-		if (digest) {
-			drbd_csum_ee(peer_device->connection->csums_tfm, peer_req, digest);
-			eq = !memcmp(digest, di->digest, digest_size);
-			kfree(digest);
-		}
-
-		if (eq) {
-			drbd_set_in_sync(peer_device, peer_req->i.sector, peer_req->i.size);
-			/* rs_same_csums unit is BM_BLOCK_SIZE */
-			device->rs_same_csum += peer_req->i.size >> BM_BLOCK_SHIFT;
-			err = drbd_send_ack(peer_device, P_RS_IS_IN_SYNC, peer_req);
+	if (peer_device->repl_state[NOW] == L_AHEAD) {
+		err = drbd_send_ack(peer_device, P_RS_CANCEL, peer_req);
+	} else if (likely((peer_req->flags & EE_WAS_ERROR) == 0)) {
+		if (unlikely(peer_device->disk_state[NOW] < D_INCONSISTENT)) {
+			if (connection->agreed_features & DRBD_FF_RESYNC_DAGTAG) {
+				drbd_err_ratelimit(peer_device,
+						"Sending P_RS_CANCEL, partner DISKLESS!\n");
+				err = drbd_send_ack(peer_device, P_RS_CANCEL, peer_req);
+			} else {
+				/*
+				 * A peer that does not support DRBD_FF_RESYNC_DAGTAG does not
+				 * expect to receive P_RS_CANCEL after losing its disk.
+				 */
+				drbd_err_ratelimit(peer_device,
+						"Not sending resync reply, partner DISKLESS!\n");
+				err = 0;
+			}
+		} else if (connection->agreed_pro_version >= 110 &&
+				!(connection->agreed_features & DRBD_FF_RESYNC_DAGTAG) &&
+				al_resync_extent_active(peer_device->device,
+					peer_req->i.sector, peer_req->i.size)) {
+			/* DRBD versions without DRBD_FF_RESYNC_DAGTAG lock
+			 * 128MiB "resync extents" in the activity log whenever
+			 * they make resync requests. Some of these versions
+			 * also lock activity lock extents when receiving
+			 * P_DATA. In particular, DRBD 9.0 and 9.1. This can
+			 * cause a deadlock if we send resync replies in these
+			 * extents as follows:
+			 * * Node is SyncTarget towards us
+			 * * Node locks a resync extent and sends P_RS_DATA_REQUEST
+			 * * Node receives P_DATA write in this extent; write
+			 *   waits for resync extent to be unlocked
+			 * * Node receives P_BARRIER (protocol A); receiver
+			 *   thread blocks waiting for write to complete
+			 * * We reply to P_RS_DATA_REQUEST, but it is never
+			 *   processed because receiver thread is blocked
+			 *
+			 * Break the deadlock by canceling instead. This is
+			 * sent on the control socket so it will be processed. */
+			dynamic_drbd_dbg(peer_device,
+					"Cancel resync request at %llus+%u due to activity",
+					(unsigned long long) peer_req->i.sector, peer_req->i.size);
+
+			err = drbd_send_ack(peer_device, P_RS_CANCEL, peer_req);
 		} else {
-			inc_rs_pending(peer_device);
-			peer_req->block_id = ID_SYNCER; /* By setting block_id, digest pointer becomes invalid! */
-			peer_req->flags &= ~EE_HAS_DIGEST; /* This peer request no longer has a digest pointer */
-			kfree(di);
-			err = drbd_send_block(peer_device, P_RS_DATA_REPLY, peer_req);
+			err = drbd_rs_reply(peer_device, peer_req, &expect_ack);
+
+			/* If expect_ack is true, peer_req may already have been freed. */
+			if (expect_ack)
+				peer_req = NULL;
 		}
 	} else {
+		drbd_err_ratelimit(peer_device, "Sending NegRSDReply. sector %llus.\n",
+		    (unsigned long long)peer_req->i.sector);
+
 		err = drbd_send_ack(peer_device, P_NEG_RS_DREPLY, peer_req);
-		if (drbd_ratelimit())
-			drbd_err(device, "Sending NegDReply. I guess it gets messy.\n");
+
+		/* update resync data with failure */
+		drbd_rs_failed_io(peer_device, peer_req->i.sector, peer_req->i.size);
+	}
+
+	dec_unacked(peer_device);
+
+	if (!expect_ack) {
+		drbd_remove_peer_req_interval(peer_req);
+		drbd_free_peer_req(peer_req);
 	}
-	if (unlikely(err))
-		drbd_err(device, "drbd_send_block/ack() failed\n");
-out:
-	dec_unacked(device);
-	drbd_free_peer_req(device, peer_req);
 
+	if (unlikely(err))
+		drbd_err(peer_device, "Sending resync reply failed\n");
 	return err;
 }
 
@@ -1214,97 +2368,204 @@ int w_e_end_ov_req(struct drbd_work *w, int cancel)
 	struct drbd_peer_request *peer_req = container_of(w, struct drbd_peer_request, w);
 	struct drbd_peer_device *peer_device = peer_req->peer_device;
 	struct drbd_device *device = peer_device->device;
-	sector_t sector = peer_req->i.sector;
-	unsigned int size = peer_req->i.size;
+	struct drbd_connection *connection = peer_device->connection;
 	int digest_size;
 	void *digest;
+	sector_t sector = peer_req->i.sector;
+	unsigned int size = peer_req->i.size;
+	struct dagtag_find_result dagtag_result;
 	int err = 0;
+	enum drbd_packet cmd = connection->agreed_features & DRBD_FF_RESYNC_DAGTAG ?
+		P_OV_DAGTAG_REPLY : P_OV_REPLY;
 
-	if (unlikely(cancel))
+	if (unlikely(cancel) || connection->cstate[NOW] < C_CONNECTED)
+		goto out;
+
+	if (!(connection->agreed_features & DRBD_FF_RESYNC_DAGTAG) &&
+		al_resync_extent_active(peer_device->device, peer_req->i.sector, peer_req->i.size)) {
+		/* A peer that does not support DRBD_FF_RESYNC_DAGTAG expects
+		 * online verify to be exclusive with 128MiB "resync extents"
+		 * in the activity log. If such a verify source sends a request
+		 * but we receive an overlapping write before the request then
+		 * we will read newer data for the verify transaction than the
+		 * source did. So we may detect spurious out-of-sync blocks.
+		 *
+		 * In addition, we may trigger a deadlock in such a peer by
+		 * sending a reply if it is waiting for writes to drain due to
+		 * a P_BARRIER packet. See w_e_end_rsdata_req for details.
+		 *
+		 * Prevent these issues by canceling instead.
+		 */
+		dynamic_drbd_dbg(peer_device,
+				"Cancel online verify request at %llus+%u due to activity",
+				(unsigned long long) peer_req->i.sector, peer_req->i.size);
+
+		spin_lock_irq(&device->interval_lock);
+		set_bit(INTERVAL_CONFLICT, &peer_req->i.flags);
+		spin_unlock_irq(&device->interval_lock);
+	}
+
+	if (test_bit(INTERVAL_CONFLICT, &peer_req->i.flags)) {
+		if (connection->agreed_pro_version < 110) {
+			if (drbd_ratelimit())
+				drbd_warn(peer_device, "Verify request conflicts but cannot cancel, "
+						"peer may report spurious out-of-sync\n");
+		} else {
+			drbd_verify_skipped_block(peer_device, sector, size);
+			verify_progress(peer_device, sector, size);
+			drbd_send_ack(peer_device, P_RS_CANCEL, peer_req);
+			goto out;
+		}
+	}
+
+	dagtag_result = find_current_dagtag(peer_device->device->resource);
+	if (dagtag_result.err)
 		goto out;
 
+	set_bit(INTERVAL_READY_TO_SEND, &peer_req->i.flags);
+
 	digest_size = crypto_shash_digestsize(peer_device->connection->verify_tfm);
-	digest = kmalloc(digest_size, GFP_NOIO);
+	/* FIXME if this allocation fails, online verify will not terminate! */
+	digest = drbd_prepare_drequest_csum(peer_req, cmd, digest_size,
+			dagtag_result.node_id, dagtag_result.dagtag);
 	if (!digest) {
-		err = 1;	/* terminate the connection in case the allocation failed */
+		err = -ENOMEM;
 		goto out;
 	}
 
-	if (likely(!(peer_req->flags & EE_WAS_ERROR)))
-		drbd_csum_ee(peer_device->connection->verify_tfm, peer_req, digest);
+	if (!(peer_req->flags & EE_WAS_ERROR))
+		drbd_csum_bios(peer_device->connection->verify_tfm, &peer_req->bios, digest);
 	else
 		memset(digest, 0, digest_size);
 
-	/* Free e and pages before send.
+	/* Free pages before send.
 	 * In case we block on congestion, we could otherwise run into
 	 * some distributed deadlock, if the other side blocks on
 	 * congestion as well, because our receiver blocks in
 	 * drbd_alloc_pages due to pp_in_use > max_buffers. */
-	drbd_free_peer_req(device, peer_req);
-	peer_req = NULL;
+	drbd_peer_req_strip_bio(peer_req);
+
 	inc_rs_pending(peer_device);
-	err = drbd_send_drequest_csum(peer_device, sector, size, digest, digest_size, P_OV_REPLY);
+
+	err = drbd_send_command(peer_device, cmd, DATA_STREAM);
 	if (err)
-		dec_rs_pending(peer_device);
-	kfree(digest);
+		goto out_rs_pending;
+
+	dec_unacked(peer_device);
+	return 0;
 
+out_rs_pending:
+	dec_rs_pending(peer_device);
 out:
-	if (peer_req)
-		drbd_free_peer_req(device, peer_req);
-	dec_unacked(device);
+	drbd_remove_peer_req_interval(peer_req);
+	drbd_free_peer_req(peer_req);
+	dec_unacked(peer_device);
 	return err;
 }
 
 void drbd_ov_out_of_sync_found(struct drbd_peer_device *peer_device, sector_t sector, int size)
 {
-	struct drbd_device *device = peer_device->device;
-	if (device->ov_last_oos_start + device->ov_last_oos_size == sector) {
-		device->ov_last_oos_size += size>>9;
+	if (peer_device->ov_last_oos_start + peer_device->ov_last_oos_size == sector) {
+		peer_device->ov_last_oos_size += size>>9;
 	} else {
-		device->ov_last_oos_start = sector;
-		device->ov_last_oos_size = size>>9;
+		ov_out_of_sync_print(peer_device);
+		peer_device->ov_last_oos_start = sector;
+		peer_device->ov_last_oos_size = size>>9;
 	}
 	drbd_set_out_of_sync(peer_device, sector, size);
 }
 
-int w_e_end_ov_reply(struct drbd_work *w, int cancel)
+void verify_progress(struct drbd_peer_device *peer_device,
+		const sector_t sector, const unsigned int size)
+{
+	bool stop_sector_reached =
+		(peer_device->repl_state[NOW] == L_VERIFY_S) &&
+		verify_can_do_stop_sector(peer_device) &&
+		(sector + (size>>9)) >= peer_device->ov_stop_sector;
+
+	unsigned long ov_left = atomic64_dec_return(&peer_device->ov_left);
+
+	/* let's advance progress step marks only for every other megabyte */
+	if ((ov_left & 0x1ff) == 0)
+		drbd_advance_rs_marks(peer_device, ov_left);
+
+	if (ov_left == 0 || stop_sector_reached)
+		drbd_peer_device_post_work(peer_device, RS_DONE);
+}
+
+static bool digest_equal(struct drbd_peer_request *peer_req)
 {
-	struct drbd_peer_request *peer_req = container_of(w, struct drbd_peer_request, w);
 	struct drbd_peer_device *peer_device = peer_req->peer_device;
 	struct drbd_device *device = peer_device->device;
 	struct digest_info *di;
 	void *digest;
+	int digest_size;
+	bool eq = false;
+
+	di = peer_req->digest;
+
+	digest_size = crypto_shash_digestsize(peer_device->connection->verify_tfm);
+	digest = kmalloc(digest_size, GFP_NOIO);
+	if (digest) {
+		drbd_csum_bios(peer_device->connection->verify_tfm, &peer_req->bios, digest);
+
+		D_ASSERT(device, digest_size == di->digest_size);
+		eq = !memcmp(digest, di->digest, digest_size);
+		kfree(digest);
+	}
+
+	return eq;
+}
+
+int w_e_end_ov_reply(struct drbd_work *w, int cancel)
+{
+	struct drbd_peer_request *peer_req = container_of(w, struct drbd_peer_request, w);
+	struct drbd_peer_device *peer_device = peer_req->peer_device;
+	struct drbd_connection *connection = peer_device->connection;
 	sector_t sector = peer_req->i.sector;
 	unsigned int size = peer_req->i.size;
-	int digest_size;
-	int err, eq = 0;
-	bool stop_sector_reached = false;
+	u64 block_id = peer_req->block_id;
+	enum ov_result result;
+	bool al_conflict = false;
+	int err;
 
 	if (unlikely(cancel)) {
-		drbd_free_peer_req(device, peer_req);
-		dec_unacked(device);
+		drbd_remove_peer_req_interval(peer_req);
+		drbd_free_peer_req(peer_req);
+		dec_unacked(peer_device);
 		return 0;
 	}
 
-	/* after "cancel", because after drbd_disconnect/drbd_rs_cancel_all
-	 * the resync lru has been cleaned up already */
-	if (get_ldev(device)) {
-		drbd_rs_complete_io(device, peer_req->i.sector);
-		put_ldev(device);
-	}
-
-	di = peer_req->digest;
+	if (!(connection->agreed_features & DRBD_FF_RESYNC_DAGTAG) &&
+		al_resync_extent_active(peer_device->device, peer_req->i.sector, peer_req->i.size)) {
+		/* A peer that does not support DRBD_FF_RESYNC_DAGTAG expects
+		 * online verify to be exclusive with 128MiB "resync extents"
+		 * in the activity log. We may have received an overlapping
+		 * write before issuing this read, which the peer did not have
+		 * at the time of its read. So we may detect spurious
+		 * out-of-sync blocks.
+		 *
+		 * Prevent this by skipping instead.
+		 */
+		dynamic_drbd_dbg(peer_device,
+				"Skip online verify block at %llus+%u due to activity",
+				(unsigned long long) peer_req->i.sector, peer_req->i.size);
 
-	if (likely((peer_req->flags & EE_WAS_ERROR) == 0)) {
-		digest_size = crypto_shash_digestsize(peer_device->connection->verify_tfm);
-		digest = kmalloc(digest_size, GFP_NOIO);
-		if (digest) {
-			drbd_csum_ee(peer_device->connection->verify_tfm, peer_req, digest);
+		al_conflict = true;
+	}
 
-			D_ASSERT(device, digest_size == di->digest_size);
-			eq = !memcmp(digest, di->digest, digest_size);
-			kfree(digest);
-		}
+	if (test_bit(INTERVAL_CONFLICT, &peer_req->i.flags) || al_conflict) {
+		/* DRBD versions without DRBD_FF_RESYNC_DAGTAG do not know about
+		 * OV_RESULT_SKIP, but they treat it the same as OV_RESULT_IN_SYNC which is
+		 * the best we can do here anyway. */
+		result = OV_RESULT_SKIP;
+		drbd_verify_skipped_block(peer_device, sector, size);
+	} else if (likely((peer_req->flags & EE_WAS_ERROR) == 0) && digest_equal(peer_req)) {
+		result = OV_RESULT_IN_SYNC;
+		ov_out_of_sync_print(peer_device);
+	} else {
+		result = OV_RESULT_OUT_OF_SYNC;
+		drbd_ov_out_of_sync_found(peer_device, sector, size);
 	}
 
 	/* Free peer_req and pages before send.
@@ -1312,30 +2573,15 @@ int w_e_end_ov_reply(struct drbd_work *w, int cancel)
 	 * some distributed deadlock, if the other side blocks on
 	 * congestion as well, because our receiver blocks in
 	 * drbd_alloc_pages due to pp_in_use > max_buffers. */
-	drbd_free_peer_req(device, peer_req);
-	if (!eq)
-		drbd_ov_out_of_sync_found(peer_device, sector, size);
-	else
-		ov_out_of_sync_print(peer_device);
-
-	err = drbd_send_ack_ex(peer_device, P_OV_RESULT, sector, size,
-			       eq ? ID_IN_SYNC : ID_OUT_OF_SYNC);
-
-	dec_unacked(device);
-
-	--device->ov_left;
+	drbd_remove_peer_req_interval(peer_req);
+	drbd_free_peer_req(peer_req);
+	peer_req = NULL;
 
-	/* let's advance progress step marks only for every other megabyte */
-	if ((device->ov_left & 0x200) == 0x200)
-		drbd_advance_rs_marks(peer_device, device->ov_left);
+	err = drbd_send_ov_result(peer_device, sector, size, block_id, result);
 
-	stop_sector_reached = verify_can_do_stop_sector(device) &&
-		(sector + (size>>9)) >= device->ov_stop_sector;
+	dec_unacked(peer_device);
 
-	if (device->ov_left == 0 || stop_sector_reached) {
-		ov_out_of_sync_print(peer_device);
-		drbd_resync_finished(peer_device);
-	}
+	verify_progress(peer_device, sector, size);
 
 	return err;
 }
@@ -1348,194 +2594,92 @@ int w_e_end_ov_reply(struct drbd_work *w, int cancel)
 static int drbd_send_barrier(struct drbd_connection *connection)
 {
 	struct p_barrier *p;
-	struct drbd_socket *sock;
+	int err;
 
-	sock = &connection->data;
-	p = conn_prepare_command(connection, sock);
+	p = conn_prepare_command(connection, sizeof(*p), DATA_STREAM);
 	if (!p)
 		return -EIO;
+
 	p->barrier = connection->send.current_epoch_nr;
 	p->pad = 0;
+	connection->send.last_sent_epoch_nr = connection->send.current_epoch_nr;
 	connection->send.current_epoch_writes = 0;
 	connection->send.last_sent_barrier_jif = jiffies;
 
-	return conn_send_command(connection, sock, P_BARRIER, sizeof(*p), NULL, 0);
-}
-
-static int pd_send_unplug_remote(struct drbd_peer_device *pd)
-{
-	struct drbd_socket *sock = &pd->connection->data;
-	if (!drbd_prepare_command(pd, sock))
-		return -EIO;
-	return drbd_send_command(pd, sock, P_UNPLUG_REMOTE, 0, NULL, 0);
-}
-
-int w_send_write_hint(struct drbd_work *w, int cancel)
-{
-	struct drbd_device *device =
-		container_of(w, struct drbd_device, unplug_work);
-
-	if (cancel)
-		return 0;
-	return pd_send_unplug_remote(first_peer_device(device));
-}
-
-static void re_init_if_first_write(struct drbd_connection *connection, unsigned int epoch)
-{
-	if (!connection->send.seen_any_write_yet) {
-		connection->send.seen_any_write_yet = true;
-		connection->send.current_epoch_nr = epoch;
-		connection->send.current_epoch_writes = 0;
-		connection->send.last_sent_barrier_jif = jiffies;
-	}
-}
-
-static void maybe_send_barrier(struct drbd_connection *connection, unsigned int epoch)
-{
-	/* re-init if first write on this connection */
-	if (!connection->send.seen_any_write_yet)
-		return;
-	if (connection->send.current_epoch_nr != epoch) {
-		if (connection->send.current_epoch_writes)
-			drbd_send_barrier(connection);
-		connection->send.current_epoch_nr = epoch;
-	}
-}
-
-int w_send_out_of_sync(struct drbd_work *w, int cancel)
-{
-	struct drbd_request *req = container_of(w, struct drbd_request, w);
-	struct drbd_device *device = req->device;
-	struct drbd_peer_device *const peer_device = first_peer_device(device);
-	struct drbd_connection *const connection = peer_device->connection;
-	int err;
-
-	if (unlikely(cancel)) {
-		req_mod(req, SEND_CANCELED, peer_device);
-		return 0;
-	}
-	req->pre_send_jif = jiffies;
-
-	/* this time, no connection->send.current_epoch_writes++;
-	 * If it was sent, it was the closing barrier for the last
-	 * replicated epoch, before we went into AHEAD mode.
-	 * No more barriers will be sent, until we leave AHEAD mode again. */
-	maybe_send_barrier(connection, req->epoch);
-
-	err = drbd_send_out_of_sync(peer_device, req);
-	req_mod(req, OOS_HANDED_TO_NETWORK, peer_device);
-
-	return err;
-}
-
-/**
- * w_send_dblock() - Worker callback to send a P_DATA packet in order to mirror a write request
- * @w:		work object.
- * @cancel:	The connection will be closed anyways
- */
-int w_send_dblock(struct drbd_work *w, int cancel)
-{
-	struct drbd_request *req = container_of(w, struct drbd_request, w);
-	struct drbd_device *device = req->device;
-	struct drbd_peer_device *const peer_device = first_peer_device(device);
-	struct drbd_connection *connection = peer_device->connection;
-	bool do_send_unplug = req->rq_state & RQ_UNPLUG;
-	int err;
-
-	if (unlikely(cancel)) {
-		req_mod(req, SEND_CANCELED, peer_device);
-		return 0;
+	set_bit(BARRIER_ACK_PENDING, &connection->flags);
+	err = send_command(connection, -1, P_BARRIER, DATA_STREAM);
+	if (err) {
+		clear_bit(BARRIER_ACK_PENDING, &connection->flags);
+		wake_up(&connection->resource->barrier_wait);
 	}
-	req->pre_send_jif = jiffies;
-
-	re_init_if_first_write(connection, req->epoch);
-	maybe_send_barrier(connection, req->epoch);
-	connection->send.current_epoch_writes++;
-
-	err = drbd_send_dblock(peer_device, req);
-	req_mod(req, err ? SEND_FAILED : HANDED_OVER_TO_NETWORK, peer_device);
-
-	if (do_send_unplug && !err)
-		pd_send_unplug_remote(peer_device);
-
 	return err;
 }
 
-/**
- * w_send_read_req() - Worker callback to send a read request (P_DATA_REQUEST) packet
- * @w:		work object.
- * @cancel:	The connection will be closed anyways
- */
-int w_send_read_req(struct drbd_work *w, int cancel)
+static bool need_unplug(struct drbd_connection *connection)
 {
-	struct drbd_request *req = container_of(w, struct drbd_request, w);
-	struct drbd_device *device = req->device;
-	struct drbd_peer_device *const peer_device = first_peer_device(device);
-	struct drbd_connection *connection = peer_device->connection;
-	bool do_send_unplug = req->rq_state & RQ_UNPLUG;
-	int err;
-
-	if (unlikely(cancel)) {
-		req_mod(req, SEND_CANCELED, peer_device);
-		return 0;
-	}
-	req->pre_send_jif = jiffies;
-
-	/* Even read requests may close a write epoch,
-	 * if there was any yet. */
-	maybe_send_barrier(connection, req->epoch);
-
-	err = drbd_send_drequest(peer_device, P_DATA_REQUEST, req->i.sector, req->i.size,
-				 (unsigned long)req);
-
-	req_mod(req, err ? SEND_FAILED : HANDED_OVER_TO_NETWORK, peer_device);
-
-	if (do_send_unplug && !err)
-		pd_send_unplug_remote(peer_device);
-
-	return err;
+	unsigned i = connection->todo.unplug_slot;
+	return dagtag_newer_eq(connection->send.current_dagtag_sector,
+			connection->todo.unplug_dagtag_sector[i]);
 }
 
-int w_restart_disk_io(struct drbd_work *w, int cancel)
+static void maybe_send_unplug_remote(struct drbd_connection *connection, bool send_anyways)
 {
-	struct drbd_request *req = container_of(w, struct drbd_request, w);
-	struct drbd_device *device = req->device;
+	if (need_unplug(connection)) {
+		/* Yes, this is non-atomic wrt. its use in drbd_unplug_fn.
+		 * We save a spin_lock_irq, and worst case
+		 * we occasionally miss an unplug event. */
+
+		/* Paranoia: to avoid a continuous stream of unplug-hints,
+		 * in case we never get any unplug events */
+		connection->todo.unplug_dagtag_sector[connection->todo.unplug_slot] =
+			connection->send.current_dagtag_sector + (1ULL << 63);
+		/* advance the current unplug slot */
+		connection->todo.unplug_slot ^= 1;
+	} else if (!send_anyways)
+		return;
 
-	if (bio_data_dir(req->master_bio) == WRITE && req->rq_state & RQ_IN_ACT_LOG)
-		drbd_al_begin_io(device, &req->i);
+	if (connection->cstate[NOW] < C_CONNECTED)
+		return;
 
-	req->private_bio = bio_alloc_clone(device->ldev->backing_bdev,
-					   req->master_bio, GFP_NOIO,
-					  &drbd_io_bio_set);
-	req->private_bio->bi_private = req;
-	req->private_bio->bi_end_io = drbd_request_endio;
-	submit_bio_noacct(req->private_bio);
+	if (!conn_prepare_command(connection, 0, DATA_STREAM))
+		return;
 
-	return 0;
+	send_command(connection, -1, P_UNPLUG_REMOTE, DATA_STREAM);
 }
 
-static int _drbd_may_sync_now(struct drbd_device *device)
+static bool __drbd_may_sync_now(struct drbd_peer_device *peer_device)
 {
-	struct drbd_device *odev = device;
-	int resync_after;
+	struct drbd_device *other_device = peer_device->device;
+	int ret = true;
 
+	rcu_read_lock();
 	while (1) {
-		if (!odev->ldev || odev->state.disk == D_DISKLESS)
-			return 1;
-		rcu_read_lock();
-		resync_after = rcu_dereference(odev->ldev->disk_conf)->resync_after;
-		rcu_read_unlock();
+		struct drbd_peer_device *other_peer_device;
+		int resync_after;
+
+		if (!other_device->ldev || other_device->disk_state[NOW] == D_DISKLESS)
+			break;
+		resync_after = rcu_dereference(other_device->ldev->disk_conf)->resync_after;
 		if (resync_after == -1)
-			return 1;
-		odev = minor_to_device(resync_after);
-		if (!odev)
-			return 1;
-		if ((odev->state.conn >= C_SYNC_SOURCE &&
-		     odev->state.conn <= C_PAUSED_SYNC_T) ||
-		    odev->state.aftr_isp || odev->state.peer_isp ||
-		    odev->state.user_isp)
-			return 0;
+			break;
+		other_device = minor_to_device(resync_after);
+		if (!other_device)
+			break;
+		for_each_peer_device_rcu(other_peer_device, other_device) {
+			if ((other_peer_device->repl_state[NOW] >= L_SYNC_SOURCE &&
+			     other_peer_device->repl_state[NOW] <= L_PAUSED_SYNC_T) ||
+			    other_peer_device->resync_susp_dependency[NOW] ||
+			    other_peer_device->resync_susp_peer[NOW] ||
+			    other_peer_device->resync_susp_user[NOW]) {
+				ret = false;
+				goto break_unlock;
+			}
+		}
 	}
+break_unlock:
+	rcu_read_unlock();
+
+	return ret;
 }
 
 /**
@@ -1546,21 +2690,32 @@ static int _drbd_may_sync_now(struct drbd_device *device)
  */
 static bool drbd_pause_after(struct drbd_device *device)
 {
+	struct drbd_device *other_device;
 	bool changed = false;
-	struct drbd_device *odev;
-	int i;
+	int vnr;
 
+	/* FIXME seriously inefficient with many devices,
+	 * while also ignoring the input "device" argument :-( */
 	rcu_read_lock();
-	idr_for_each_entry(&drbd_devices, odev, i) {
-		if (odev->state.conn == C_STANDALONE && odev->state.disk == D_DISKLESS)
+	idr_for_each_entry(&drbd_devices, other_device, vnr) {
+		struct drbd_peer_device *other_peer_device;
+
+		begin_state_change_locked(other_device->resource, CS_HARD);
+		if (other_device->disk_state[NOW] == D_DISKLESS) {
+			abort_state_change_locked(other_device->resource);
 			continue;
-		if (!_drbd_may_sync_now(odev) &&
-		    _drbd_set_state(_NS(odev, aftr_isp, 1),
-				    CS_HARD, NULL) != SS_NOTHING_TO_DO)
+		}
+		for_each_peer_device_rcu(other_peer_device, other_device) {
+			if (other_peer_device->repl_state[NOW] == L_OFF)
+				continue;
+			if (!__drbd_may_sync_now(other_peer_device))
+				__change_resync_susp_dependency(other_peer_device, true);
+		}
+		if (end_state_change_locked(other_device->resource, "resync-after") !=
+				SS_NOTHING_TO_DO)
 			changed = true;
 	}
 	rcu_read_unlock();
-
 	return changed;
 }
 
@@ -1568,24 +2723,35 @@ static bool drbd_pause_after(struct drbd_device *device)
  * drbd_resume_next() - Resume resync on all devices that may resync now
  * @device:	DRBD device.
  *
- * Called from process context only (admin command and worker).
+ * Called from process context only (admin command and sender).
  */
 static bool drbd_resume_next(struct drbd_device *device)
 {
+	struct drbd_device *other_device;
 	bool changed = false;
-	struct drbd_device *odev;
-	int i;
+	int vnr;
 
+	/* FIXME seriously inefficient with many devices,
+	 * while also ignoring the input "device" argument :-( */
 	rcu_read_lock();
-	idr_for_each_entry(&drbd_devices, odev, i) {
-		if (odev->state.conn == C_STANDALONE && odev->state.disk == D_DISKLESS)
+	idr_for_each_entry(&drbd_devices, other_device, vnr) {
+		struct drbd_peer_device *other_peer_device;
+
+		begin_state_change_locked(other_device->resource, CS_HARD);
+		if (other_device->disk_state[NOW] == D_DISKLESS) {
+			abort_state_change_locked(other_device->resource);
 			continue;
-		if (odev->state.aftr_isp) {
-			if (_drbd_may_sync_now(odev) &&
-			    _drbd_set_state(_NS(odev, aftr_isp, 0),
-					    CS_HARD, NULL) != SS_NOTHING_TO_DO)
-				changed = true;
 		}
+		for_each_peer_device_rcu(other_peer_device, other_device) {
+			if (other_peer_device->repl_state[NOW] == L_OFF)
+				continue;
+			if (other_peer_device->resync_susp_dependency[NOW] &&
+			    __drbd_may_sync_now(other_peer_device))
+				__change_resync_susp_dependency(other_peer_device, false);
+		}
+		if (end_state_change_locked(other_device->resource, "resync-after") !=
+				SS_NOTHING_TO_DO)
+			changed = true;
 	}
 	rcu_read_unlock();
 	return changed;
@@ -1594,84 +2760,92 @@ static bool drbd_resume_next(struct drbd_device *device)
 void resume_next_sg(struct drbd_device *device)
 {
 	lock_all_resources();
-	drbd_resume_next(device);
+	while (drbd_resume_next(device))
+		; /* Iterate if some state changed. */
 	unlock_all_resources();
 }
 
 void suspend_other_sg(struct drbd_device *device)
 {
 	lock_all_resources();
-	drbd_pause_after(device);
+	while (drbd_pause_after(device))
+		; /* Iterate if some state changed. */
 	unlock_all_resources();
 }
 
-/* caller must lock_all_resources() */
-enum drbd_ret_code drbd_resync_after_valid(struct drbd_device *device, int o_minor)
+/* caller must hold resources_mutex */
+enum drbd_ret_code drbd_resync_after_valid(struct drbd_device *device, int resync_after)
 {
-	struct drbd_device *odev;
-	int resync_after;
+	struct drbd_device *other_device;
+	int rv = NO_ERROR;
 
-	if (o_minor == -1)
+	if (resync_after == -1)
 		return NO_ERROR;
-	if (o_minor < -1 || o_minor > MINORMASK)
+	if (resync_after < -1)
 		return ERR_RESYNC_AFTER;
+	other_device = minor_to_device(resync_after);
+
+	/* You are free to depend on diskless, non-existing,
+	 * or not yet/no longer existing minors.
+	 * We only reject dependency loops.
+	 * We cannot follow the dependency chain beyond a detached or
+	 * missing minor.
+	 */
+	if (!other_device)
+		return NO_ERROR;
 
 	/* check for loops */
-	odev = minor_to_device(o_minor);
+	rcu_read_lock();
 	while (1) {
-		if (odev == device)
-			return ERR_RESYNC_AFTER_CYCLE;
-
-		/* You are free to depend on diskless, non-existing,
-		 * or not yet/no longer existing minors.
-		 * We only reject dependency loops.
-		 * We cannot follow the dependency chain beyond a detached or
-		 * missing minor.
-		 */
-		if (!odev || !odev->ldev || odev->state.disk == D_DISKLESS)
-			return NO_ERROR;
+		if (other_device == device) {
+			rv = ERR_RESYNC_AFTER_CYCLE;
+			break;
+		}
+
+		if (!other_device)
+			break;
+
+		if (!get_ldev_if_state(other_device, D_NEGOTIATING))
+			break;
+		resync_after = rcu_dereference(other_device->ldev->disk_conf)->resync_after;
+		put_ldev(other_device);
 
-		rcu_read_lock();
-		resync_after = rcu_dereference(odev->ldev->disk_conf)->resync_after;
-		rcu_read_unlock();
 		/* dependency chain ends here, no cycles. */
 		if (resync_after == -1)
-			return NO_ERROR;
+			break;
 
 		/* follow the dependency chain */
-		odev = minor_to_device(resync_after);
+		other_device = minor_to_device(resync_after);
 	}
+	rcu_read_unlock();
+
+	return rv;
 }
 
-/* caller must lock_all_resources() */
+/* caller must hold resources_mutex */
 void drbd_resync_after_changed(struct drbd_device *device)
 {
-	int changed;
-
-	do {
-		changed  = drbd_pause_after(device);
-		changed |= drbd_resume_next(device);
-	} while (changed);
+	while (drbd_pause_after(device) || drbd_resume_next(device))
+		/* do nothing */ ;
 }
 
 void drbd_rs_controller_reset(struct drbd_peer_device *peer_device)
 {
-	struct drbd_device *device = peer_device->device;
-	struct gendisk *disk = device->ldev->backing_bdev->bd_disk;
+	struct gendisk *disk = peer_device->device->ldev->backing_bdev->bd_disk;
 	struct fifo_buffer *plan;
 
-	atomic_set(&device->rs_sect_in, 0);
-	atomic_set(&device->rs_sect_ev, 0);
-	device->rs_in_flight = 0;
-	device->rs_last_events =
-		(int)part_stat_read_accum(disk->part0, sectors);
+	atomic_set(&peer_device->rs_sect_in, 0);
+	atomic_set(&peer_device->device->rs_sect_ev, 0);  /* FIXME: ??? */
+	peer_device->rs_last_mk_req_kt = ktime_get();
+	peer_device->rs_in_flight = 0;
+	peer_device->rs_last_events = (int)part_stat_read_accum(disk->part0, sectors);
 
 	/* Updating the RCU protected object in place is necessary since
 	   this function gets called from atomic context.
 	   It is valid since all other updates also lead to an completely
 	   empty fifo */
 	rcu_read_lock();
-	plan = rcu_dereference(device->rs_plan_s);
+	plan = rcu_dereference(peer_device->rs_plan_s);
 	plan->total = 0;
 	fifo_set(plan, 0);
 	rcu_read_unlock();
@@ -1679,76 +2853,160 @@ void drbd_rs_controller_reset(struct drbd_peer_device *peer_device)
 
 void start_resync_timer_fn(struct timer_list *t)
 {
-	struct drbd_device *device = timer_container_of(device, t,
-							start_resync_timer);
-	drbd_device_post_work(device, RS_START);
+	struct drbd_peer_device *peer_device = timer_container_of(peer_device, t,
+			start_resync_timer);
+	drbd_peer_device_post_work(peer_device, RS_START);
+}
+
+bool drbd_stable_sync_source_present(struct drbd_peer_device *except_peer_device, enum which_state which)
+{
+	struct drbd_device *device = except_peer_device->device;
+	struct drbd_peer_device *peer_device;
+	u64 authoritative_nodes = 0;
+	bool rv = false;
+
+	if (!(except_peer_device->uuid_flags & UUID_FLAG_STABLE))
+		authoritative_nodes = except_peer_device->uuid_node_mask;
+
+	/* If a peer considers himself as unstable and sees me as an authoritative
+	   node, then we have a stable resync source! */
+	if (authoritative_nodes & NODE_MASK(device->resource->res_opts.node_id))
+		return true;
+
+	rcu_read_lock();
+	for_each_peer_device_rcu(peer_device, device) {
+		enum drbd_repl_state repl_state;
+		struct net_conf *nc;
+
+		if (peer_device == except_peer_device)
+			continue;
+
+		repl_state = peer_device->repl_state[which];
+
+		if (repl_state == L_ESTABLISHED ||
+				repl_state == L_WF_BITMAP_S ||
+				(repl_state >= L_SYNC_SOURCE && repl_state < L_AHEAD)) {
+			if (authoritative_nodes & NODE_MASK(peer_device->node_id)) {
+				rv = true;
+				break;
+			}
+
+			nc = rcu_dereference(peer_device->connection->transport.net_conf);
+			/* Restricting the clause the two_primaries not allowed, otherwise
+			   we need to ensure here that we are neighbor of all primaries,
+			   and that is a lot more challenging. */
+
+			if ((!nc->two_primaries &&
+			     peer_device->connection->peer_role[which] == R_PRIMARY) ||
+			    ((repl_state == L_SYNC_TARGET || repl_state == L_PAUSED_SYNC_T) &&
+			     peer_device->uuid_flags & UUID_FLAG_STABLE)) {
+				rv = true;
+				break;
+			}
+		}
+	}
+	rcu_read_unlock();
+
+	return rv;
 }
 
-static void do_start_resync(struct drbd_device *device)
+static void do_start_resync(struct drbd_peer_device *peer_device)
 {
-	if (atomic_read(&device->unacked_cnt) || atomic_read(&device->rs_pending_cnt)) {
-		drbd_warn(device, "postponing start_resync ...\n");
-		device->start_resync_timer.expires = jiffies + HZ/10;
-		add_timer(&device->start_resync_timer);
+	/*
+	 * Postpone resync in any of these situations:
+	 * - There is still activity from a previous resync according to rs_pending_cnt.
+	 * - The resync as SyncTarget is still active.
+	 * - The transition from Ahead to SyncSource if there is any activity on this peer device.
+	 */
+	if (atomic_read(&peer_device->rs_pending_cnt) ||
+			peer_device->resync_active[NOW] ||
+			(peer_device->repl_state[NOW] == L_AHEAD &&
+			 atomic_read(&peer_device->unacked_cnt))) {
+		drbd_warn(peer_device, "postponing start_resync ...\n");
+		mod_timer(&peer_device->start_resync_timer, jiffies + HZ/10);
 		return;
 	}
 
-	drbd_start_resync(device, C_SYNC_SOURCE);
-	clear_bit(AHEAD_TO_SYNC_SOURCE, &device->flags);
+	drbd_start_resync(peer_device, peer_device->start_resync_side, "postponed-resync");
+	clear_bit(AHEAD_TO_SYNC_SOURCE, &peer_device->flags);
 }
 
-static bool use_checksum_based_resync(struct drbd_connection *connection, struct drbd_device *device)
+static void handle_congestion(struct drbd_peer_device *peer_device)
 {
-	bool csums_after_crash_only;
+	struct drbd_resource *resource = peer_device->device->resource;
+	unsigned long irq_flags;
+	struct net_conf *nc;
+	enum drbd_on_congestion on_congestion;
+
 	rcu_read_lock();
-	csums_after_crash_only = rcu_dereference(connection->net_conf)->csums_after_crash_only;
+	nc = rcu_dereference(peer_device->connection->transport.net_conf);
+	if (nc) {
+		on_congestion = nc->on_congestion;
+
+		begin_state_change(resource, &irq_flags, CS_VERBOSE | CS_HARD);
+		/* congestion may have cleared since it was detected */
+		if (atomic_read(&peer_device->connection->ap_in_flight) > 0) {
+			if (on_congestion == OC_PULL_AHEAD)
+				__change_repl_state(peer_device, L_AHEAD);
+			else if (on_congestion == OC_DISCONNECT)
+				__change_cstate(peer_device->connection, C_DISCONNECTING);
+		}
+		end_state_change(resource, &irq_flags, "congestion");
+	}
 	rcu_read_unlock();
-	return connection->agreed_pro_version >= 89 &&		/* supported? */
-		connection->csums_tfm &&			/* configured? */
-		(csums_after_crash_only == false		/* use for each resync? */
-		 || test_bit(CRASHED_PRIMARY, &device->flags));	/* or only after Primary crash? */
+
+	clear_bit(HANDLING_CONGESTION, &peer_device->flags);
 }
 
 /**
  * drbd_start_resync() - Start the resync process
- * @device:	DRBD device.
- * @side:	Either C_SYNC_SOURCE or C_SYNC_TARGET
+ * @peer_device: The DRBD peer device to start the resync on.
+ * @side: Direction of the resync; which side am I? Either L_SYNC_SOURCE or
+ * 	  L_SYNC_TARGET.
+ * @tag: State change tag to print in status messages.
  *
  * This function might bring you directly into one of the
  * C_PAUSED_SYNC_* states.
  */
-void drbd_start_resync(struct drbd_device *device, enum drbd_conns side)
+void drbd_start_resync(struct drbd_peer_device *peer_device, enum drbd_repl_state side,
+		const char *tag)
 {
-	struct drbd_peer_device *peer_device = first_peer_device(device);
-	struct drbd_connection *connection = peer_device ? peer_device->connection : NULL;
-	union drbd_state ns;
+	struct drbd_device *device = peer_device->device;
+	struct drbd_connection *connection = peer_device->connection;
+	enum drbd_disk_state finished_resync_pdsk = D_UNKNOWN;
+	enum drbd_repl_state repl_state;
 	int r;
 
-	if (device->state.conn >= C_SYNC_SOURCE && device->state.conn < C_AHEAD) {
-		drbd_err(device, "Resync already running!\n");
+	read_lock_irq(&device->resource->state_rwlock);
+	repl_state = peer_device->repl_state[NOW];
+	read_unlock_irq(&device->resource->state_rwlock);
+	if (repl_state < L_ESTABLISHED) {
+		/* Connection closed meanwhile. */
 		return;
 	}
-
-	if (!connection) {
-		drbd_err(device, "No connection to peer, aborting!\n");
+	if (repl_state >= L_SYNC_SOURCE && repl_state < L_AHEAD) {
+		drbd_err(peer_device, "Resync already running!\n");
 		return;
 	}
 
-	if (!test_bit(B_RS_H_DONE, &device->flags)) {
-		if (side == C_SYNC_TARGET) {
-			/* Since application IO was locked out during C_WF_BITMAP_T and
-			   C_WF_SYNC_UUID we are still unmodified. Before going to C_SYNC_TARGET
-			   we check that we might make the data inconsistent. */
-			r = drbd_khelper(device, "before-resync-target");
+	if (!test_bit(B_RS_H_DONE, &peer_device->flags)) {
+		if (side == L_SYNC_TARGET) {
+			r = drbd_maybe_khelper(device, connection, "before-resync-target");
+			if (r == DRBD_UMH_DISABLED)
+				goto skip_helper;
+
 			r = (r >> 8) & 0xff;
 			if (r > 0) {
 				drbd_info(device, "before-resync-target handler returned %d, "
 					 "dropping connection.\n", r);
-				conn_request_state(connection, NS(conn, C_DISCONNECTING), CS_HARD);
+				change_cstate(connection, C_DISCONNECTING, CS_HARD);
 				return;
 			}
-		} else /* C_SYNC_SOURCE */ {
-			r = drbd_khelper(device, "before-resync-source");
+		} else /* L_SYNC_SOURCE */ {
+			r = drbd_maybe_khelper(device, connection, "before-resync-source");
+			if (r == DRBD_UMH_DISABLED)
+				goto skip_helper;
+
 			r = (r >> 8) & 0xff;
 			if (r > 0) {
 				if (r == 3) {
@@ -1757,185 +3015,101 @@ void drbd_start_resync(struct drbd_device *device, enum drbd_conns side)
 				} else {
 					drbd_info(device, "before-resync-source handler returned %d, "
 						 "dropping connection.\n", r);
-					conn_request_state(connection,
-							   NS(conn, C_DISCONNECTING), CS_HARD);
+					change_cstate(connection, C_DISCONNECTING, CS_HARD);
 					return;
 				}
 			}
 		}
 	}
 
-	if (current == connection->worker.task) {
-		/* The worker should not sleep waiting for state_mutex,
-		   that can take long */
-		if (!mutex_trylock(device->state_mutex)) {
-			set_bit(B_RS_H_DONE, &device->flags);
-			device->start_resync_timer.expires = jiffies + HZ/5;
-			add_timer(&device->start_resync_timer);
-			return;
+skip_helper:
+
+	if (side == L_SYNC_TARGET && drbd_current_uuid(device) == UUID_JUST_CREATED) {
+		/* prepare to continue an interrupted initial resync later */
+		if (get_ldev(device)) {
+			const int my_node_id = device->resource->res_opts.node_id;
+			u64 peer_bitmap_uuid = peer_device->bitmap_uuids[my_node_id];
+
+			if (peer_bitmap_uuid) {
+				down_write(&device->uuid_sem);
+				_drbd_uuid_set_current(device, peer_bitmap_uuid);
+				up_write(&device->uuid_sem);
+				drbd_print_uuids(peer_device, "setting UUIDs to");
+			}
+			put_ldev(device);
 		}
-	} else {
-		mutex_lock(device->state_mutex);
+	}
+
+	if (down_trylock(&device->resource->state_sem)) {
+		/* Retry later and let the worker make progress in the
+		 * meantime; two-phase commits depend on that.  */
+		set_bit(B_RS_H_DONE, &peer_device->flags);
+		peer_device->start_resync_side = side;
+		mod_timer(&peer_device->start_resync_timer, jiffies + HZ/5);
+		return;
 	}
 
 	lock_all_resources();
-	clear_bit(B_RS_H_DONE, &device->flags);
-	/* Did some connection breakage or IO error race with us? */
-	if (device->state.conn < C_CONNECTED
-	|| !get_ldev_if_state(device, D_NEGOTIATING)) {
+	clear_bit(B_RS_H_DONE, &peer_device->flags);
+	if (connection->cstate[NOW] < C_CONNECTED ||
+	    !get_ldev_if_state(device, D_NEGOTIATING)) {
 		unlock_all_resources();
 		goto out;
 	}
 
-	ns = drbd_read_state(device);
-
-	ns.aftr_isp = !_drbd_may_sync_now(device);
-
-	ns.conn = side;
-
-	if (side == C_SYNC_TARGET)
-		ns.disk = D_INCONSISTENT;
-	else /* side == C_SYNC_SOURCE */
-		ns.pdsk = D_INCONSISTENT;
-
-	r = _drbd_set_state(device, ns, CS_VERBOSE, NULL);
-	ns = drbd_read_state(device);
-
-	if (ns.conn < C_CONNECTED)
+	begin_state_change_locked(device->resource, CS_VERBOSE);
+	__change_resync_susp_dependency(peer_device, !__drbd_may_sync_now(peer_device));
+	__change_repl_state(peer_device, side);
+	if (side == L_SYNC_TARGET)
+		init_resync_stable_bits(peer_device);
+	finished_resync_pdsk = peer_device->resync_finished_pdsk;
+	peer_device->resync_finished_pdsk = D_UNKNOWN;
+	r = end_state_change_locked(device->resource, tag);
+	repl_state = peer_device->repl_state[NOW];
+
+	if (repl_state < L_ESTABLISHED)
 		r = SS_UNKNOWN_ERROR;
 
-	if (r == SS_SUCCESS) {
-		unsigned long tw = drbd_bm_total_weight(device);
-		unsigned long now = jiffies;
-		int i;
-
-		device->rs_failed    = 0;
-		device->rs_paused    = 0;
-		device->rs_same_csum = 0;
-		device->rs_last_sect_ev = 0;
-		device->rs_total     = tw;
-		device->rs_start     = now;
-		for (i = 0; i < DRBD_SYNC_MARKS; i++) {
-			device->rs_mark_left[i] = tw;
-			device->rs_mark_time[i] = now;
-		}
+	if (r == SS_SUCCESS)
 		drbd_pause_after(device);
-		/* Forget potentially stale cached per resync extent bit-counts.
-		 * Open coded drbd_rs_cancel_all(device), we already have IRQs
-		 * disabled, and know the disk state is ok. */
-		spin_lock(&device->al_lock);
-		lc_reset(device->resync);
-		device->resync_locked = 0;
-		device->resync_wenr = LC_FREE;
-		spin_unlock(&device->al_lock);
-	}
-	unlock_all_resources();
-
-	if (r == SS_SUCCESS) {
-		wake_up(&device->al_wait); /* for lc_reset() above */
-		/* reset rs_last_bcast when a resync or verify is started,
-		 * to deal with potential jiffies wrap. */
-		device->rs_last_bcast = jiffies - HZ;
-
-		drbd_info(device, "Began resync as %s (will sync %lu KB [%lu bits set]).\n",
-		     drbd_conn_str(ns.conn),
-		     (unsigned long) device->rs_total << (BM_BLOCK_SHIFT-10),
-		     (unsigned long) device->rs_total);
-		if (side == C_SYNC_TARGET) {
-			device->bm_resync_fo = 0;
-			device->use_csums = use_checksum_based_resync(connection, device);
-		} else {
-			device->use_csums = false;
-		}
 
-		/* Since protocol 96, we must serialize drbd_gen_and_send_sync_uuid
-		 * with w_send_oos, or the sync target will get confused as to
-		 * how much bits to resync.  We cannot do that always, because for an
-		 * empty resync and protocol < 95, we need to do it here, as we call
-		 * drbd_resync_finished from here in that case.
-		 * We drbd_gen_and_send_sync_uuid here for protocol < 96,
-		 * and from after_state_ch otherwise. */
-		if (side == C_SYNC_SOURCE && connection->agreed_pro_version < 96)
-			drbd_gen_and_send_sync_uuid(peer_device);
-
-		if (connection->agreed_pro_version < 95 && device->rs_total == 0) {
-			/* This still has a race (about when exactly the peers
-			 * detect connection loss) that can lead to a full sync
-			 * on next handshake. In 8.3.9 we fixed this with explicit
-			 * resync-finished notifications, but the fix
-			 * introduces a protocol change.  Sleeping for some
-			 * time longer than the ping interval + timeout on the
-			 * SyncSource, to give the SyncTarget the chance to
-			 * detect connection loss, then waiting for a ping
-			 * response (implicit in drbd_resync_finished) reduces
-			 * the race considerably, but does not solve it. */
-			if (side == C_SYNC_SOURCE) {
-				struct net_conf *nc;
-				int timeo;
-
-				rcu_read_lock();
-				nc = rcu_dereference(connection->net_conf);
-				timeo = nc->ping_int * HZ + nc->ping_timeo * HZ / 9;
-				rcu_read_unlock();
-				schedule_timeout_interruptible(timeo);
-			}
-			drbd_resync_finished(peer_device);
-		}
-
-		drbd_rs_controller_reset(peer_device);
-		/* ns.conn may already be != device->state.conn,
-		 * we may have been paused in between, or become paused until
-		 * the timer triggers.
-		 * No matter, that is handled in resync_timer_fn() */
-		if (ns.conn == C_SYNC_TARGET)
-			mod_timer(&device->resync_timer, jiffies);
-
-		drbd_md_sync(device);
-	}
+	unlock_all_resources();
 	put_ldev(device);
-out:
-	mutex_unlock(device->state_mutex);
+    out:
+	up(&device->resource->state_sem);
+	if (finished_resync_pdsk != D_UNKNOWN)
+		drbd_resync_finished(peer_device, finished_resync_pdsk);
 }
 
 static void update_on_disk_bitmap(struct drbd_peer_device *peer_device, bool resync_done)
 {
 	struct drbd_device *device = peer_device->device;
-	struct sib_info sib = { .sib_reason = SIB_SYNC_PROGRESS, };
-	device->rs_last_bcast = jiffies;
+	peer_device->rs_last_writeout = jiffies;
 
 	if (!get_ldev(device))
 		return;
 
-	drbd_bm_write_lazy(device, 0);
-	if (resync_done && is_sync_state(device->state.conn))
-		drbd_resync_finished(peer_device);
-
-	drbd_bcast_event(device, &sib);
-	/* update timestamp, in case it took a while to write out stuff */
-	device->rs_last_bcast = jiffies;
-	put_ldev(device);
-}
-
-static void drbd_ldev_destroy(struct drbd_device *device)
-{
-	lc_destroy(device->resync);
-	device->resync = NULL;
-	lc_destroy(device->act_log);
-	device->act_log = NULL;
+	drbd_bm_write_lazy(device, 0);
 
-	__acquire(local);
-	drbd_backing_dev_free(device, device->ldev);
-	device->ldev = NULL;
-	__release(local);
+	if (resync_done) {
+		if (is_verify_state(peer_device, NOW)) {
+			ov_out_of_sync_print(peer_device);
+			ov_skipped_print(peer_device);
+			drbd_resync_finished(peer_device, D_MASK);
+		} else if (is_sync_state(peer_device, NOW)) {
+			drbd_resync_finished(peer_device, D_MASK);
+		}
+	}
 
-	clear_bit(GOING_DISKLESS, &device->flags);
-	wake_up(&device->misc_wait);
+	/* update timestamp, in case it took a while to write out stuff */
+	peer_device->rs_last_writeout = jiffies;
+	put_ldev(device);
 }
 
 static void go_diskless(struct drbd_device *device)
 {
-	struct drbd_peer_device *peer_device = first_peer_device(device);
-	D_ASSERT(device, device->state.disk == D_FAILED);
+	D_ASSERT(device, device->disk_state[NOW] == D_FAILED ||
+			 device->disk_state[NOW] == D_DETACHING);
 	/* we cannot assert local_cnt == 0 here, as get_ldev_if_state will
 	 * inc/dec it frequently. Once we are D_DISKLESS, no one will touch
 	 * the protected members anymore, though, so once put_ldev reaches zero
@@ -1954,21 +3128,25 @@ static void go_diskless(struct drbd_device *device)
 	 * We still need to check if both bitmap and ldev are present, we may
 	 * end up here after a failed attach, before ldev was even assigned.
 	 */
+	/* ldev_safe: ldev is only destroyed after state change to D_DISKLESS below */
 	if (device->bitmap && device->ldev) {
-		/* An interrupted resync or similar is allowed to recounts bits
-		 * while we detach.
-		 * Any modifications would not be expected anymore, though.
-		 */
 		if (drbd_bitmap_io_from_worker(device, drbd_bm_write,
-					"detach", BM_LOCKED_TEST_ALLOWED, peer_device)) {
-			if (test_bit(WAS_READ_ERROR, &device->flags)) {
-				drbd_md_set_flag(device, MDF_FULL_SYNC);
-				drbd_md_sync(device);
+					       "detach",
+					       BM_LOCK_SET | BM_LOCK_CLEAR | BM_LOCK_BULK,
+					       NULL)) {
+			if (test_bit(CRASHED_PRIMARY, &device->flags)) {
+				struct drbd_peer_device *peer_device;
+
+				rcu_read_lock();
+				for_each_peer_device_rcu(peer_device, device)
+					drbd_md_set_peer_flag(peer_device, MDF_PEER_FULL_SYNC);
+				rcu_read_unlock();
 			}
 		}
 	}
 
-	drbd_force_state(device, NS(disk, D_DISKLESS));
+	drbd_md_sync_if_dirty(device);
+	change_disk_state(device, D_DISKLESS, CS_HARD, "go-diskless", NULL);
 }
 
 static int do_md_sync(struct drbd_device *device)
@@ -2001,41 +3179,148 @@ void __update_timing_details(
 	++(*cb_nr);
 }
 
+static bool all_responded(struct drbd_resource *resource)
+{
+	struct drbd_connection *connection;
+	bool all_responded = true;
+
+	rcu_read_lock();
+	for_each_connection_rcu(connection, resource) {
+		if (!test_bit(CHECKING_PEER, &connection->flags))
+			continue;
+		if (connection->cstate[NOW] < C_CONNECTED) {
+			clear_bit(CHECKING_PEER, &connection->flags);
+			continue;
+		}
+		if (test_bit(PING_PENDING, &connection->flags)) {
+			all_responded = false;
+			continue;
+		} else {
+			clear_bit(CHECKING_PEER, &connection->flags);
+		}
+	}
+	rcu_read_unlock();
+
+	return all_responded;
+}
+
+void drbd_check_peers(struct drbd_resource *resource)
+{
+	struct drbd_connection *connection;
+	long t, timeo = LONG_MAX;
+	unsigned long start;
+	bool check_ongoing;
+	u64 im;
+
+	check_ongoing = test_and_set_bit(CHECKING_PEERS, &resource->flags);
+	if (check_ongoing) {
+		wait_event(resource->state_wait,
+			   !test_bit(CHECKING_PEERS, &resource->flags));
+		return;
+	}
+
+	start = jiffies;
+	for_each_connection_ref(connection, im, resource) {
+		if (connection->cstate[NOW] < C_CONNECTED)
+			continue;
+		set_bit(CHECKING_PEER, &connection->flags);
+		send_ping_peer(connection);
+		t = ping_timeout(connection);
+		if (t < timeo)
+			timeo = t;
+	}
+
+	while (!wait_event_timeout(resource->state_wait, all_responded(resource), timeo)) {
+		unsigned long waited = jiffies - start;
+
+		timeo = LONG_MAX;
+		rcu_read_lock();
+		for_each_connection_rcu(connection, resource) {
+			if (!test_bit(CHECKING_PEER, &connection->flags))
+				continue;
+			t = ping_timeout(connection);
+			if (waited >= t) {
+				drbd_warn(connection, "peer failed to send PingAck in time\n");
+				change_cstate(connection, C_NETWORK_FAILURE, CS_HARD);
+				clear_bit(CHECKING_PEER, &connection->flags);
+				continue;
+			}
+			if (t - waited < timeo)
+				timeo = t - waited;
+		}
+		rcu_read_unlock();
+	}
+
+	clear_bit(CHECKING_PEERS, &resource->flags);
+	wake_up_all(&resource->state_wait);
+}
+
+void drbd_check_peers_new_current_uuid(struct drbd_device *device)
+{
+	struct drbd_resource *resource = device->resource;
+
+	drbd_check_peers(resource);
+
+	if (device->have_quorum[NOW] && drbd_data_accessible(device, NOW))
+		drbd_uuid_new_current(device, false);
+}
+
+static void make_new_current_uuid(struct drbd_device *device)
+{
+	drbd_check_peers_new_current_uuid(device);
+
+	get_work_bits(1UL << NEW_CUR_UUID | 1UL << WRITING_NEW_CUR_UUID, &device->flags);
+	wake_up(&device->misc_wait);
+}
+
 static void do_device_work(struct drbd_device *device, const unsigned long todo)
 {
 	if (test_bit(MD_SYNC, &todo))
 		do_md_sync(device);
-	if (test_bit(RS_DONE, &todo) ||
-	    test_bit(RS_PROGRESS, &todo))
-		update_on_disk_bitmap(first_peer_device(device), test_bit(RS_DONE, &todo));
 	if (test_bit(GO_DISKLESS, &todo))
 		go_diskless(device);
-	if (test_bit(DESTROY_DISK, &todo))
-		drbd_ldev_destroy(device);
+	if (test_bit(MAKE_NEW_CUR_UUID, &todo))
+		make_new_current_uuid(device);
+}
+
+static void do_peer_device_work(struct drbd_peer_device *peer_device, const unsigned long todo)
+{
+	if (test_bit(RS_PROGRESS, &todo))
+		drbd_broadcast_peer_device_state(peer_device);
+	if (test_bit(RS_DONE, &todo) ||
+	    test_bit(RS_LAZY_BM_WRITE, &todo))
+		update_on_disk_bitmap(peer_device, test_bit(RS_DONE, &todo));
 	if (test_bit(RS_START, &todo))
-		do_start_resync(device);
+		do_start_resync(peer_device);
+	if (test_bit(HANDLE_CONGESTION, &todo))
+		handle_congestion(peer_device);
 }
 
 #define DRBD_DEVICE_WORK_MASK	\
 	((1UL << GO_DISKLESS)	\
-	|(1UL << DESTROY_DISK)	\
 	|(1UL << MD_SYNC)	\
-	|(1UL << RS_START)	\
-	|(1UL << RS_PROGRESS)	\
-	|(1UL << RS_DONE)	\
+	|(1UL << MAKE_NEW_CUR_UUID)\
+	)
+
+#define DRBD_PEER_DEVICE_WORK_MASK	\
+	((1UL << RS_START)		\
+	|(1UL << RS_LAZY_BM_WRITE)	\
+	|(1UL << RS_PROGRESS)		\
+	|(1UL << RS_DONE)		\
+	|(1UL << HANDLE_CONGESTION)     \
 	)
 
-static unsigned long get_work_bits(unsigned long *flags)
+static unsigned long get_work_bits(const unsigned long mask, unsigned long *flags)
 {
 	unsigned long old, new;
 	do {
 		old = *flags;
-		new = old & ~DRBD_DEVICE_WORK_MASK;
+		new = old & ~mask;
 	} while (cmpxchg(flags, old, new) != old);
-	return old & DRBD_DEVICE_WORK_MASK;
+	return old & mask;
 }
 
-static void do_unqueued_work(struct drbd_connection *connection)
+static void __do_unqueued_peer_device_work(struct drbd_connection *connection)
 {
 	struct drbd_peer_device *peer_device;
 	int vnr;
@@ -2043,7 +3328,36 @@ static void do_unqueued_work(struct drbd_connection *connection)
 	rcu_read_lock();
 	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
 		struct drbd_device *device = peer_device->device;
-		unsigned long todo = get_work_bits(&device->flags);
+		unsigned long todo = get_work_bits(DRBD_PEER_DEVICE_WORK_MASK, &peer_device->flags);
+		if (!todo)
+			continue;
+
+		kref_get(&device->kref);
+		rcu_read_unlock();
+		do_peer_device_work(peer_device, todo);
+		kref_put(&device->kref, drbd_destroy_device);
+		rcu_read_lock();
+	}
+	rcu_read_unlock();
+}
+
+static void do_unqueued_peer_device_work(struct drbd_resource *resource)
+{
+	struct drbd_connection *connection;
+	u64 im;
+
+	for_each_connection_ref(connection, im, resource)
+		__do_unqueued_peer_device_work(connection);
+}
+
+static void do_unqueued_device_work(struct drbd_resource *resource)
+{
+	struct drbd_device *device;
+	int vnr;
+
+	rcu_read_lock();
+	idr_for_each_entry(&resource->devices, device, vnr) {
+		unsigned long todo = get_work_bits(DRBD_DEVICE_WORK_MASK, &device->flags);
 		if (!todo)
 			continue;
 
@@ -2064,14 +3378,105 @@ static bool dequeue_work_batch(struct drbd_work_queue *queue, struct list_head *
 	return !list_empty(work_list);
 }
 
-static void wait_for_work(struct drbd_connection *connection, struct list_head *work_list)
+static struct drbd_request *__next_request_for_connection(
+		struct drbd_connection *connection)
+{
+	struct drbd_request *req;
+
+	list_for_each_entry_rcu(req, &connection->resource->transfer_log, tl_requests) {
+		unsigned s = req->net_rq_state[connection->peer_node_id];
+
+		if (likely(s & RQ_NET_QUEUED))
+			return req;
+	}
+	return NULL;
+}
+
+static struct drbd_request *tl_next_request_for_connection(
+		struct drbd_connection *connection, bool wait_ready)
+{
+	if (connection->todo.req_next == NULL)
+		connection->todo.req_next = __next_request_for_connection(connection);
+
+	if (connection->todo.req_next == NULL) {
+		connection->todo.req = NULL;
+	} else {
+		unsigned int s = connection->todo.req_next->net_rq_state[connection->peer_node_id];
+
+		if (likely((s & RQ_NET_READY) || !wait_ready)) {
+			connection->todo.req = connection->todo.req_next;
+			connection->send.seen_dagtag_sector = connection->todo.req->dagtag_sector;
+		} else {
+			/* Leave the request in "req_next" until it is ready */
+			connection->todo.req = NULL;
+		}
+	}
+
+	/*
+	 * Advancement of todo.req_next happens in advance_conn_req_next(),
+	 * called from mod_rq_state()
+	 */
+
+	return connection->todo.req;
+}
+
+static void maybe_send_state_after_ahead(struct drbd_connection *connection)
+{
+	struct drbd_peer_device *peer_device;
+	int vnr;
+
+	rcu_read_lock();
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+		if (test_and_clear_bit(SEND_STATE_AFTER_AHEAD, &peer_device->flags)) {
+			peer_device->todo.was_sending_out_of_sync = false;
+			rcu_read_unlock();
+			drbd_send_current_state(peer_device);
+			rcu_read_lock();
+		}
+	}
+	rcu_read_unlock();
+}
+
+/* This finds the next not yet processed request from
+ * connection->resource->transfer_log.
+ * It also moves all currently queued connection->sender_work
+ * to connection->todo.work_list.
+ */
+static bool check_sender_todo(struct drbd_connection *connection)
+{
+	rcu_read_lock();
+	tl_next_request_for_connection(connection, true);
+
+	/* FIXME can we get rid of this additional lock? */
+	spin_lock_irq(&connection->sender_work.q_lock);
+	list_splice_tail_init(&connection->sender_work.q, &connection->todo.work_list);
+	spin_unlock_irq(&connection->sender_work.q_lock);
+	rcu_read_unlock();
+
+	return connection->todo.req
+		|| need_unplug(connection)
+		|| !list_empty(&connection->todo.work_list);
+}
+
+static bool drbd_send_barrier_next_oos(struct drbd_connection *connection)
+{
+	if (!connection->todo.req_next)
+		return false;
+
+	return connection->todo.req_next->net_rq_state[connection->peer_node_id]
+		& RQ_NET_PENDING_OOS;
+}
+
+static void wait_for_sender_todo(struct drbd_connection *connection)
 {
+	struct drbd_resource *resource = connection->resource;
 	DEFINE_WAIT(wait);
 	struct net_conf *nc;
 	int uncork, cork;
+	bool got_something = 0;
 
-	dequeue_work_batch(&connection->sender_work, work_list);
-	if (!list_empty(work_list))
+	got_something = check_sender_todo(connection);
+	if (got_something)
 		return;
 
 	/* Still nothing to do?
@@ -2081,26 +3486,19 @@ static void wait_for_work(struct drbd_connection *connection, struct list_head *
 	 * Also, poke TCP, just in case.
 	 * Then wait for new work (or signal). */
 	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
+	nc = rcu_dereference(connection->transport.net_conf);
 	uncork = nc ? nc->tcp_cork : 0;
 	rcu_read_unlock();
 	if (uncork) {
-		mutex_lock(&connection->data.mutex);
-		if (connection->data.socket)
-			tcp_sock_set_cork(connection->data.socket->sk, false);
-		mutex_unlock(&connection->data.mutex);
+		if (drbd_uncork(connection, DATA_STREAM))
+			return;
 	}
 
 	for (;;) {
 		int send_barrier;
-		prepare_to_wait(&connection->sender_work.q_wait, &wait, TASK_INTERRUPTIBLE);
-		spin_lock_irq(&connection->resource->req_lock);
-		spin_lock(&connection->sender_work.q_lock);	/* FIXME get rid of this one? */
-		if (!list_empty(&connection->sender_work.q))
-			list_splice_tail_init(&connection->sender_work.q, work_list);
-		spin_unlock(&connection->sender_work.q_lock);	/* FIXME get rid of this one? */
-		if (!list_empty(work_list) || signal_pending(current)) {
-			spin_unlock_irq(&connection->resource->req_lock);
+		prepare_to_wait(&connection->sender_work.q_wait, &wait,
+				TASK_INTERRUPTIBLE);
+		if (check_sender_todo(connection) || signal_pending(current)) {
 			break;
 		}
 
@@ -2108,23 +3506,46 @@ static void wait_for_work(struct drbd_connection *connection, struct list_head *
 		 * no other work item.  We may still need to close the last
 		 * epoch.  Next incoming request epoch will be connection ->
 		 * current transfer log epoch number.  If that is different
-		 * from the epoch of the last request we communicated, it is
-		 * safe to send the epoch separating barrier now.
+		 * from the epoch of the last request we communicated, we want
+		 * to send the epoch separating barrier now.
 		 */
-		send_barrier =
-			atomic_read(&connection->current_tle_nr) !=
-			connection->send.current_epoch_nr;
-		spin_unlock_irq(&connection->resource->req_lock);
-
-		if (send_barrier)
-			maybe_send_barrier(connection,
-					connection->send.current_epoch_nr + 1);
+		send_barrier = should_send_barrier(connection,
+					atomic_read(&resource->current_tle_nr));
+
+		if (send_barrier) {
+			/* Ensure that we read the most recent
+			 * resource->dagtag_sector value. */
+			smp_rmb();
+			/* If a request is currently being submitted it may not
+			 * have been picked up by this sender, even though it
+			 * belongs to the old epoch. Ensure that we are
+			 * up-to-date with the most recently submitted dagtag
+			 * to ensure that we do not send a barrier early in
+			 * this case. If there is such a request then this
+			 * sender will be woken, so it is OK to schedule().
+			 *
+			 * If we have found a request that is
+			 * RQ_NET_PENDING_OOS, but not yet RQ_NET_READY, then
+			 * we also need to send a barrier.
+			 */
+			if (dagtag_newer_eq(connection->send.seen_dagtag_sector,
+						READ_ONCE(resource->dagtag_sector))
+					|| drbd_send_barrier_next_oos(connection)) {
+				finish_wait(&connection->sender_work.q_wait, &wait);
+				maybe_send_barrier(connection,
+						connection->send.current_epoch_nr + 1);
+				continue;
+			}
+		}
 
-		if (test_bit(DEVICE_WORK_PENDING, &connection->flags))
-			break;
+		if (test_and_clear_bit(SEND_STATE_AFTER_AHEAD_C, &connection->flags)) {
+			finish_wait(&connection->sender_work.q_wait, &wait);
+			maybe_send_state_after_ahead(connection);
+			continue;
+		}
 
 		/* drbd_send() may have called flush_signals() */
-		if (get_t_state(&connection->worker) != RUNNING)
+		if (get_t_state(&connection->sender) != RUNNING)
 			break;
 
 		schedule();
@@ -2136,44 +3557,279 @@ static void wait_for_work(struct drbd_connection *connection, struct list_head *
 
 	/* someone may have changed the config while we have been waiting above. */
 	rcu_read_lock();
-	nc = rcu_dereference(connection->net_conf);
+	nc = rcu_dereference(connection->transport.net_conf);
 	cork = nc ? nc->tcp_cork : 0;
 	rcu_read_unlock();
-	mutex_lock(&connection->data.mutex);
-	if (connection->data.socket) {
-		if (cork)
-			tcp_sock_set_cork(connection->data.socket->sk, true);
-		else if (!uncork)
-			tcp_sock_set_cork(connection->data.socket->sk, false);
+
+	if (cork)
+		drbd_cork(connection, DATA_STREAM);
+	else if (!uncork)
+		drbd_uncork(connection, DATA_STREAM);
+}
+
+static void re_init_if_first_write(struct drbd_connection *connection, unsigned int epoch)
+{
+	if (!connection->send.seen_any_write_yet) {
+		connection->send.seen_any_write_yet = true;
+		connection->send.current_epoch_nr = epoch;
+		connection->send.current_epoch_writes = 0;
+		connection->send.last_sent_barrier_jif = jiffies;
 	}
-	mutex_unlock(&connection->data.mutex);
 }
 
-int drbd_worker(struct drbd_thread *thi)
+static bool should_send_barrier(struct drbd_connection *connection, unsigned int epoch)
+{
+	if (!connection->send.seen_any_write_yet)
+		return false;
+	return connection->send.current_epoch_nr != epoch;
+}
+static void maybe_send_barrier(struct drbd_connection *connection, unsigned int epoch)
+{
+	/* re-init if first write on this connection */
+	if (should_send_barrier(connection, epoch)) {
+		if (connection->send.current_epoch_writes)
+			drbd_send_barrier(connection);
+		connection->send.current_epoch_nr = epoch;
+	}
+}
+
+static int process_one_request(struct drbd_connection *connection)
+{
+	struct bio_and_error m;
+	struct drbd_request *req = connection->todo.req;
+	struct drbd_device *device = req->device;
+	struct drbd_peer_device *peer_device =
+			conn_peer_device(connection, device->vnr);
+	unsigned s = req->net_rq_state[peer_device->node_id];
+	bool do_send_unplug = req->local_rq_state & RQ_UNPLUG;
+	int err = 0;
+	enum drbd_req_event what;
+
+	/* pre_send_jif[] is used in net_timeout_reached() */
+	req->pre_send_jif[peer_device->node_id] = jiffies;
+	ktime_get_accounting(req->pre_send_kt[peer_device->node_id]);
+	if (drbd_req_is_write(req)) {
+		/* If a WRITE does not expect a barrier ack,
+		 * we are supposed to only send an "out of sync" info packet */
+		if (s & RQ_EXP_BARR_ACK) {
+			u64 current_dagtag_sector =
+				req->dagtag_sector - (req->i.size >> 9);
+
+			re_init_if_first_write(connection, req->epoch);
+			maybe_send_barrier(connection, req->epoch);
+			if (current_dagtag_sector != connection->send.current_dagtag_sector)
+				drbd_send_dagtag(connection, current_dagtag_sector);
+
+			connection->send.current_epoch_writes++;
+			connection->send.current_dagtag_sector = req->dagtag_sector;
+
+			if (peer_device->todo.was_sending_out_of_sync) {
+				clear_bit(SEND_STATE_AFTER_AHEAD, &peer_device->flags);
+				peer_device->todo.was_sending_out_of_sync = false;
+				drbd_send_current_state(peer_device);
+			}
+
+			err = drbd_send_dblock(peer_device, req);
+			what = err ? SEND_FAILED : HANDED_OVER_TO_NETWORK;
+		} else {
+			/* this time, no connection->send.current_epoch_writes++;
+			 * If it was sent, it was the closing barrier for the last
+			 * replicated epoch, before we went into AHEAD mode.
+			 * No more barriers will be sent, until we leave AHEAD mode again. */
+			maybe_send_barrier(connection, req->epoch);
+
+			/* make sure the state change to L_AHEAD/L_BEHIND
+			 * arrives before the first set-out-of-sync information */
+			if (!peer_device->todo.was_sending_out_of_sync) {
+				peer_device->todo.was_sending_out_of_sync = true;
+				drbd_send_current_state(peer_device);
+			}
+
+			/* When this flag is not set, sending OOS may be skipped */
+			if (s & RQ_NET_PENDING_OOS)
+				err = drbd_send_out_of_sync(peer_device,
+						req->i.sector, req->i.size);
+			/* This event has the appropriate effect even if OOS skipped or failed */
+			what = OOS_HANDED_TO_NETWORK;
+		}
+	} else {
+		maybe_send_barrier(connection, req->epoch);
+		err = drbd_send_drequest(peer_device,
+				req->i.sector, req->i.size, (unsigned long)req);
+		what = err ? SEND_FAILED : HANDED_OVER_TO_NETWORK;
+	}
+
+	read_lock_irq(&connection->resource->state_rwlock);
+	__req_mod(req, what, peer_device, &m);
+	read_unlock_irq(&connection->resource->state_rwlock);
+
+	check_sender_todo(connection);
+
+	if (m.bio)
+		complete_master_bio(device, &m);
+
+	do_send_unplug = do_send_unplug && what == HANDED_OVER_TO_NETWORK;
+	maybe_send_unplug_remote(connection, do_send_unplug);
+
+	return err;
+}
+
+static int process_sender_todo(struct drbd_connection *connection)
 {
-	struct drbd_connection *connection = thi->connection;
 	struct drbd_work *w = NULL;
+
+	/* Process all currently pending work items,
+	 * or requests from the transfer log.
+	 *
+	 * Right now, work items do not require any strict ordering wrt. the
+	 * request stream, so lets just do simple interleaved processing.
+	 *
+	 * Stop processing as soon as an error is encountered.
+	 */
+	if (!connection->todo.req) {
+		update_sender_timing_details(connection, maybe_send_unplug_remote);
+		maybe_send_unplug_remote(connection, false);
+	} else if (list_empty(&connection->todo.work_list)) {
+		update_sender_timing_details(connection, process_one_request);
+		/* ldev_safe: have connection->todo.req which holds its own ldev ref */
+		return process_one_request(connection);
+	}
+
+	while (!list_empty(&connection->todo.work_list)) {
+		int err;
+
+		w = list_first_entry(&connection->todo.work_list, struct drbd_work, list);
+		list_del_init(&w->list);
+		update_sender_timing_details(connection, w->cb);
+		err = w->cb(w, connection->cstate[NOW] < C_CONNECTED);
+		if (err)
+			return err;
+
+		if (connection->todo.req) {
+			update_sender_timing_details(connection, process_one_request);
+			/* ldev_safe: have connection->todo.req which holds its own ldev ref */
+			err = process_one_request(connection);
+		}
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+int drbd_sender(struct drbd_thread *thi)
+{
+	struct drbd_connection *connection = thi->connection;
+	struct drbd_work *w;
 	struct drbd_peer_device *peer_device;
-	LIST_HEAD(work_list);
 	int vnr;
+	int err;
+
+	/* Should we drop this? Or reset even more stuff? */
+	rcu_read_lock();
+	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
+		peer_device->send_cnt = 0;
+		peer_device->recv_cnt = 0;
+	}
+	rcu_read_unlock();
 
 	while (get_t_state(thi) == RUNNING) {
 		drbd_thread_current_set_cpu(thi);
 
-		if (list_empty(&work_list)) {
-			update_worker_timing_details(connection, wait_for_work);
-			wait_for_work(connection, &work_list);
+		if (list_empty(&connection->todo.work_list) &&
+		    connection->todo.req == NULL) {
+			update_sender_timing_details(connection, wait_for_sender_todo);
+			wait_for_sender_todo(connection);
+		}
+
+		if (signal_pending(current)) {
+			flush_signals(current);
+			if (get_t_state(thi) == RUNNING) {
+				drbd_warn(connection, "Sender got an unexpected signal\n");
+				continue;
+			}
+			break;
+		}
+
+		if (get_t_state(thi) != RUNNING)
+			break;
+
+		err = process_sender_todo(connection);
+		if (err)
+			change_cstate(connection, C_NETWORK_FAILURE, CS_HARD);
+	}
+
+	/* cleanup all currently unprocessed requests */
+	if (!connection->todo.req) {
+		rcu_read_lock();
+		tl_next_request_for_connection(connection, false);
+		rcu_read_unlock();
+	}
+	while (connection->todo.req) {
+		struct bio_and_error m;
+		struct drbd_request *req = connection->todo.req;
+		struct drbd_device *device = req->device;
+		peer_device = conn_peer_device(connection, device->vnr);
+
+		read_lock_irq(&connection->resource->state_rwlock);
+		/* ldev_safe: requests hold their own ldev refs */
+		__req_mod(req, SEND_CANCELED, peer_device, &m);
+		read_unlock_irq(&connection->resource->state_rwlock);
+		if (m.bio)
+			complete_master_bio(device, &m);
+
+		rcu_read_lock();
+		tl_next_request_for_connection(connection, false);
+		rcu_read_unlock();
+	}
+
+	/* cancel all still pending works */
+	do {
+		while (!list_empty(&connection->todo.work_list)) {
+			w = list_first_entry(&connection->todo.work_list, struct drbd_work, list);
+			list_del_init(&w->list);
+			w->cb(w, 1);
 		}
+		dequeue_work_batch(&connection->sender_work, &connection->todo.work_list);
+	} while (!list_empty(&connection->todo.work_list));
+
+	return 0;
+}
+
+int drbd_worker(struct drbd_thread *thi)
+{
+	LIST_HEAD(work_list);
+	struct drbd_resource *resource = thi->resource;
+	struct drbd_work *w;
+
+	while (get_t_state(thi) == RUNNING) {
+		drbd_thread_current_set_cpu(thi);
+
+		if (list_empty(&work_list)) {
+			bool w, d, p;
+
+			update_worker_timing_details(resource, dequeue_work_batch);
+			wait_event_interruptible(resource->work.q_wait,
+				(w = dequeue_work_batch(&resource->work, &work_list),
+				 d = test_and_clear_bit(DEVICE_WORK_PENDING, &resource->flags),
+				 p = test_and_clear_bit(PEER_DEVICE_WORK_PENDING, &resource->flags),
+				 w || d || p));
+
+			if (p) {
+				update_worker_timing_details(resource, do_unqueued_peer_device_work);
+				do_unqueued_peer_device_work(resource);
+			}
 
-		if (test_and_clear_bit(DEVICE_WORK_PENDING, &connection->flags)) {
-			update_worker_timing_details(connection, do_unqueued_work);
-			do_unqueued_work(connection);
+			if (d) {
+				update_worker_timing_details(resource, do_unqueued_device_work);
+				do_unqueued_device_work(resource);
+			}
 		}
 
 		if (signal_pending(current)) {
 			flush_signals(current);
 			if (get_t_state(thi) == RUNNING) {
-				drbd_warn(connection, "Worker got an unexpected signal\n");
+				drbd_warn(resource, "Worker got an unexpected signal\n");
 				continue;
 			}
 			break;
@@ -2182,42 +3838,34 @@ int drbd_worker(struct drbd_thread *thi)
 		if (get_t_state(thi) != RUNNING)
 			break;
 
-		if (!list_empty(&work_list)) {
+
+		while (!list_empty(&work_list)) {
 			w = list_first_entry(&work_list, struct drbd_work, list);
 			list_del_init(&w->list);
-			update_worker_timing_details(connection, w->cb);
-			if (w->cb(w, connection->cstate < C_WF_REPORT_PARAMS) == 0)
-				continue;
-			if (connection->cstate >= C_WF_REPORT_PARAMS)
-				conn_request_state(connection, NS(conn, C_NETWORK_FAILURE), CS_HARD);
+			update_worker_timing_details(resource, w->cb);
+			w->cb(w, 0);
 		}
 	}
 
 	do {
-		if (test_and_clear_bit(DEVICE_WORK_PENDING, &connection->flags)) {
-			update_worker_timing_details(connection, do_unqueued_work);
-			do_unqueued_work(connection);
+		if (test_and_clear_bit(DEVICE_WORK_PENDING, &resource->flags)) {
+			update_worker_timing_details(resource, do_unqueued_device_work);
+			do_unqueued_device_work(resource);
 		}
-		if (!list_empty(&work_list)) {
+		if (test_and_clear_bit(PEER_DEVICE_WORK_PENDING, &resource->flags)) {
+			update_worker_timing_details(resource, do_unqueued_peer_device_work);
+			do_unqueued_peer_device_work(resource);
+		}
+		while (!list_empty(&work_list)) {
 			w = list_first_entry(&work_list, struct drbd_work, list);
 			list_del_init(&w->list);
-			update_worker_timing_details(connection, w->cb);
+			update_worker_timing_details(resource, w->cb);
 			w->cb(w, 1);
-		} else
-			dequeue_work_batch(&connection->sender_work, &work_list);
-	} while (!list_empty(&work_list) || test_bit(DEVICE_WORK_PENDING, &connection->flags));
-
-	rcu_read_lock();
-	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
-		struct drbd_device *device = peer_device->device;
-		D_ASSERT(device, device->state.disk == D_DISKLESS && device->state.conn == C_STANDALONE);
-		kref_get(&device->kref);
-		rcu_read_unlock();
-		drbd_device_cleanup(device);
-		kref_put(&device->kref, drbd_destroy_device);
-		rcu_read_lock();
-	}
-	rcu_read_unlock();
+		}
+		dequeue_work_batch(&resource->work, &work_list);
+	} while (!list_empty(&work_list) ||
+		 test_bit(DEVICE_WORK_PENDING, &resource->flags) ||
+		 test_bit(PEER_DEVICE_WORK_PENDING, &resource->flags));
 
 	return 0;
 }
-- 
2.53.0

