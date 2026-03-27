Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO7FNeoIx2kyRwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:47:06 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id B66EE34C1CC
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Mar 2026 23:47:06 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 79A0716316B;
	Fri, 27 Mar 2026 23:46:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1A70C1630E3
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 23:39:19 +0100 (CET)
Received: by mail-wr1-f46.google.com with SMTP id
	ffacd0b85a97d-439b9cf8cb5so2503773f8f.0
	for <drbd-dev@lists.linbit.com>; Fri, 27 Mar 2026 15:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774651159;
	x=1775255959; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=EgxT01DCSXD5Hfxi1NJqVdbN1M6uW04/r/nw/ZPvZnQ=;
	b=NYJyTjV8pAAfSfrRx4WSLUiJsH/hg88wOpAxk2h3NImq+yUnzzrW95Y0T3d0wLwP8/
	PQ2j0rXxXWlnmYt+OCKbfBepKexQi9ifjVmivo1/GvEIiECaZXV3WDMBRVZjjlAOOdR7
	y6r1hIlZmpCH+8K8S9tfM7hSuYO52e/MuIfKIUZ70oYuhg7Sumv1wzslnXCtZsmE1QDo
	a3QsS1Q2YYypQtmlTCZSkguFMj4ciDyQOlAC5Ik8+n1mjLHugG1POKHrAmyloo2n55S8
	PKzXR10il3qgqTtbnViUPAFC5B+2cyZ8mugSMqXXROa8q32S8TS9v1V3XmjXjXYOniyh
	FjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774651159; x=1775255959;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=EgxT01DCSXD5Hfxi1NJqVdbN1M6uW04/r/nw/ZPvZnQ=;
	b=NXwKRYszc/hA2hlWokctxhqN2tQSLIcnEa2/IKmli7mi6H2Ym7E3UdHBjDEMijFdW/
	/xGjArZyj8mtGASWhCOWgPjJayb0mSkVX1mAQLs7eWuXBOgRrEHcGu0A3cvh4sQAIZ6v
	0ANxam3sJdvR+p4eJPXraljPf2f0Sqw9bXJCUMhAYBq5I8/Hd73nX885crJZErsM2A6M
	SJI1s1Ao5pDXEh++W+w7mW+bdmOKYPKluefFQWnU4G0eAsWPHbZaH+t98iR8hGKrmOoa
	QcEF3mDoZPICQGijoSmDZEtZOu1q5Ee20h+T04joeu2/lGG7aKbsMjEtcjKVmvg8PRzx
	yJHg==
X-Gm-Message-State: AOJu0YwMT/cMRtUNAQW98hEWg+eT2S3i1ZvgGZmBSLlvBwnjBxCskc5q
	KF+yscmJWwr7f0XxBHLYtvG8tbC8NnFyfLliUIeRhYSZddyRa5/BdtgcIAm7bQZa7hRzRQ==
X-Gm-Gg: ATEYQzxZRGZRwkRaMMiXrdfHgkSjJrPSyw0NOrg1dyPfetSm3lk055yeYTMC8/29jDb
	aAhNfr2d3B23+XhTvL/WqBCrJ7bbp4D+hHnzFXG4Tzx7fuMbm3bZIGLOub51TqT4Fn0DKTAe6kD
	Lo33UGDGGopbrtpDJKR+4GoGRng3SflmbRMwmeECPN6y9CqgwiGFkGQTQw/NGlw+3YjwCv2D2MM
	C1YTqdkqr2YfvPqyokm2iFEejmTrBLLscB6QXTNMqgcjccUsEwRIXfIS5j8Mr1l4mbKGZOeic8J
	KBebF2UyK8H6B7vxErhMvWD0hnblJAt3hiCvrHpOT3XJLxDYhtfhAe1xdt5qJoPdUyjnJHt0IwS
	+Gdn0ChY1vdChJWuInaajjr9RKQrqsHxvl+sW/gfgVLkMAGTx8sJUyGxOdsRp1iEJVXOHIeON4n
	7D+QunB9q/bVsAKm1xX/Ej8099Mj67cDanyqbRB6/VTgRpnm8TdIE282yjFRTFDXN+ZmCPBW4Ts
	TGWBSwhFbE+JFOhiw5WRw==
X-Received: by 2002:a05:6000:3105:b0:43b:86f7:2ed1 with SMTP id
	ffacd0b85a97d-43b9ea1a1e0mr5958153f8f.8.1774651157448; 
	Fri, 27 Mar 2026 15:39:17 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43cf247079esm998990f8f.25.2026.03.27.15.39.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 27 Mar 2026 15:39:15 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 14/20] drbd: rework activity log and bitmap for multi-peer
	replication
Date: Fri, 27 Mar 2026 23:38:14 +0100
Message-ID: <20260327223820.2244227-15-christoph.boehmwalder@linbit.com>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.779];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:email,linbit.com:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: B66EE34C1CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adapt the activity log and on-disk bitmap from the single-peer
DRBD 8.4 model to the multi-peer DRBD 9 architecture.

Restructure the bitmap from a single flat layout to an interleaved
per-peer format: consecutive words on disk cycle through all configured
peers, so that all peers' bits for the same disk region share a page.
This enables atomic cross-peer operations and is a prerequisite for
coordinated multi-peer resync.

Consolidate all bitmap operations into a single function instead of
many separate ones.

Make the bitmap block size adjustable at runtime rather than being a
compile-time constant.

Introduce a per-peer-slot lock variant so that concurrent operations
on different peer slots no longer need to serialize.

On the activity log side, the resync extent LRU cache and its
associated write-blocking protocol are removed.
In DRBD 9, resync-to-application-write conflict detection is handled
by the sender's interval tree, making the old extent-lock layer
redundant.
Resync progress tracking moves from the device to the per-peer-device
object, enabling independent progress reporting and rate control per
peer.

Co-developed-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Co-developed-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Co-developed-by: Joel Colledge <joel.colledge@linbit.com>
Signed-off-by: Joel Colledge <joel.colledge@linbit.com>
Co-developed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_actlog.c | 1122 +++++++-----------
 drivers/block/drbd/drbd_bitmap.c | 1824 +++++++++++++++---------------
 2 files changed, 1331 insertions(+), 1615 deletions(-)

diff --git a/drivers/block/drbd/drbd_actlog.c b/drivers/block/drbd/drbd_actlog.c
index b3dbf6c76e98..7a69d643560d 100644
--- a/drivers/block/drbd/drbd_actlog.c
+++ b/drivers/block/drbd/drbd_actlog.c
@@ -14,81 +14,41 @@
 #include <linux/slab.h>
 #include <linux/crc32c.h>
 #include <linux/drbd.h>
-#include <linux/drbd_limits.h>
+#include <linux/dynamic_debug.h>
 #include "drbd_int.h"
-
-
-enum al_transaction_types {
-	AL_TR_UPDATE = 0,
-	AL_TR_INITIALIZED = 0xffff
-};
-/* all fields on disc in big endian */
-struct __packed al_transaction_on_disk {
-	/* don't we all like magic */
-	__be32	magic;
-
-	/* to identify the most recent transaction block
-	 * in the on disk ring buffer */
-	__be32	tr_number;
-
-	/* checksum on the full 4k block, with this field set to 0. */
-	__be32	crc32c;
-
-	/* type of transaction, special transaction types like:
-	 * purge-all, set-all-idle, set-all-active, ... to-be-defined
-	 * see also enum al_transaction_types */
-	__be16	transaction_type;
-
-	/* we currently allow only a few thousand extents,
-	 * so 16bit will be enough for the slot number. */
-
-	/* how many updates in this transaction */
-	__be16	n_updates;
-
-	/* maximum slot number, "al-extents" in drbd.conf speak.
-	 * Having this in each transaction should make reconfiguration
-	 * of that parameter easier. */
-	__be16	context_size;
-
-	/* slot number the context starts with */
-	__be16	context_start_slot_nr;
-
-	/* Some reserved bytes.  Expected usage is a 64bit counter of
-	 * sectors-written since device creation, and other data generation tag
-	 * supporting usage */
-	__be32	__reserved[4];
-
-	/* --- 36 byte used --- */
-
-	/* Reserve space for up to AL_UPDATES_PER_TRANSACTION changes
-	 * in one transaction, then use the remaining byte in the 4k block for
-	 * context information.  "Flexible" number of updates per transaction
-	 * does not help, as we have to account for the case when all update
-	 * slots are used anyways, so it would only complicate code without
-	 * additional benefit.
-	 */
-	__be16	update_slot_nr[AL_UPDATES_PER_TRANSACTION];
-
-	/* but the extent number is 32bit, which at an extent size of 4 MiB
-	 * allows to cover device sizes of up to 2**54 Byte (16 PiB) */
-	__be32	update_extent_nr[AL_UPDATES_PER_TRANSACTION];
-
-	/* --- 420 bytes used (36 + 64*6) --- */
-
-	/* 4096 - 420 = 3676 = 919 * 4 */
-	__be32	context[AL_CONTEXT_PER_TRANSACTION];
-};
+#include "drbd_meta_data.h"
+#include "drbd_dax_pmem.h"
 
 void *drbd_md_get_buffer(struct drbd_device *device, const char *intent)
 {
 	int r;
+	long t;
+	unsigned long t0 = jiffies;
+	unsigned int warn_s = 10;
+
+	for (;;) {
+		t = wait_event_timeout(device->misc_wait,
+				(r = atomic_cmpxchg(&device->md_io.in_use, 0, 1)) == 0 ||
+				device->disk_state[NOW] <= D_FAILED,
+				HZ * warn_s);
 
-	wait_event(device->misc_wait,
-		   (r = atomic_cmpxchg(&device->md_io.in_use, 0, 1)) == 0 ||
-		   device->state.disk <= D_FAILED);
+		if (r == 0)
+			break;
+
+		if (t != 0) {
+			drbd_err(device, "Failed to get md_buffer for %s: disk state %s\n",
+				 intent, drbd_disk_str(device->disk_state[NOW]));
+			return NULL;
+		}
 
-	if (r)
-		return NULL;
+		/* r != 0, t == 0: still in use, hit the timeout above.
+		 * Warn, but keep trying.
+		 */
+		drbd_err(device, "Waited %lds on md_buffer for %s; in use by %s; still trying...\n",
+			 (jiffies - t0 + HZ-1)/HZ, intent, device->md_io.current_use);
+		/* reduce warn frequency */
+		warn_s = max(30U, warn_s + 10);
+	}
 
 	device->md_io.current_use = intent;
 	device->md_io.start_jif = jiffies;
@@ -103,7 +63,7 @@ void drbd_md_put_buffer(struct drbd_device *device)
 }
 
 void wait_until_done_or_force_detached(struct drbd_device *device, struct drbd_backing_dev *bdev,
-				     unsigned int *done)
+				       unsigned int *done)
 {
 	long dt;
 
@@ -115,10 +75,14 @@ void wait_until_done_or_force_detached(struct drbd_device *device, struct drbd_b
 		dt = MAX_SCHEDULE_TIMEOUT;
 
 	dt = wait_event_timeout(device->misc_wait,
-			*done || test_bit(FORCE_DETACH, &device->flags), dt);
+			*done ||
+			test_bit(FORCE_DETACH, &device->flags) ||
+			test_bit(ABORT_MDIO, &device->flags),
+			dt);
+
 	if (dt == 0) {
 		drbd_err(device, "meta-data IO operation timed out\n");
-		drbd_chk_io_error(device, 1, DRBD_FORCE_DETACH);
+		drbd_handle_io_error(device, DRBD_FORCE_DETACH);
 	}
 }
 
@@ -132,15 +96,15 @@ static int _drbd_md_sync_page_io(struct drbd_device *device,
 	int err;
 	blk_opf_t op_flags = 0;
 
-	device->md_io.done = 0;
-	device->md_io.error = -ENODEV;
-
 	if ((op == REQ_OP_WRITE) && !test_bit(MD_NO_FUA, &device->flags))
 		op_flags |= REQ_FUA | REQ_PREFLUSH;
-	op_flags |= REQ_SYNC;
+	op_flags |= REQ_META | REQ_SYNC;
+
+	device->md_io.done = 0;
+	device->md_io.error = -ENODEV;
 
-	bio = bio_alloc_bioset(bdev->md_bdev, 1, op | op_flags, GFP_NOIO,
-			       &drbd_md_io_bio_set);
+	bio = bio_alloc_bioset(bdev->md_bdev, 1, op | op_flags,
+		GFP_NOIO, &drbd_md_io_bio_set);
 	bio->bi_iter.bi_sector = sector;
 	err = -EIO;
 	if (bio_add_page(bio, device->md_io.page, size, 0) != size)
@@ -148,7 +112,7 @@ static int _drbd_md_sync_page_io(struct drbd_device *device,
 	bio->bi_private = device;
 	bio->bi_end_io = drbd_md_endio;
 
-	if (op != REQ_OP_WRITE && device->state.disk == D_DISKLESS && device->ldev == NULL)
+	if (op != REQ_OP_WRITE && device->disk_state[NOW] == D_DISKLESS && device->ldev == NULL)
 		/* special case, drbd_md_read() during drbd_adm_attach(): no get_ldev */
 		;
 	else if (!get_ldev_if_state(device, D_ATTACHING)) {
@@ -161,14 +125,14 @@ static int _drbd_md_sync_page_io(struct drbd_device *device,
 	bio_get(bio); /* one bio_put() is in the completion handler */
 	atomic_inc(&device->md_io.in_use); /* drbd_md_put_buffer() is in the completion handler */
 	device->md_io.submit_jif = jiffies;
-	if (drbd_insert_fault(device, (op == REQ_OP_WRITE) ? DRBD_FAULT_MD_WR : DRBD_FAULT_MD_RD))
-		bio_io_error(bio);
-	else
+	if (drbd_insert_fault(device, (op == REQ_OP_WRITE) ? DRBD_FAULT_MD_WR : DRBD_FAULT_MD_RD)) {
+		bio->bi_status = BLK_STS_IOERR;
+		bio_endio(bio);
+	} else {
 		submit_bio(bio);
+	}
 	wait_until_done_or_force_detached(device, bdev, &device->md_io.done);
-	if (!bio->bi_status)
-		err = device->md_io.error;
-
+	err = device->md_io.error;
  out:
 	bio_put(bio);
 	return err;
@@ -180,7 +144,10 @@ int drbd_md_sync_page_io(struct drbd_device *device, struct drbd_backing_dev *bd
 	int err;
 	D_ASSERT(device, atomic_read(&device->md_io.in_use) == 1);
 
-	BUG_ON(!bdev->md_bdev);
+	if (!bdev->md_bdev) {
+		drbd_err_ratelimit(device, "bdev->md_bdev==NULL\n");
+		return -EIO;
+	}
 
 	dynamic_drbd_dbg(device, "meta_data io: %s [%d]:%s(,%llus,%s) %pS\n",
 	     current->comm, current->pid, __func__,
@@ -203,96 +170,142 @@ int drbd_md_sync_page_io(struct drbd_device *device, struct drbd_backing_dev *bd
 	return err;
 }
 
-static struct bm_extent *find_active_resync_extent(struct drbd_device *device, unsigned int enr)
+bool drbd_al_active(struct drbd_device *device, sector_t sector, unsigned int size)
 {
-	struct lc_element *tmp;
-	tmp = lc_find(device->resync, enr/AL_EXT_PER_BM_SECT);
-	if (unlikely(tmp != NULL)) {
-		struct bm_extent  *bm_ext = lc_entry(tmp, struct bm_extent, lce);
-		if (test_bit(BME_NO_WRITES, &bm_ext->flags))
-			return bm_ext;
+	unsigned first = sector >> (AL_EXTENT_SHIFT-9);
+	unsigned last = size == 0 ? first : (sector + (size >> 9) - 1) >> (AL_EXTENT_SHIFT-9);
+	unsigned enr;
+	bool active = false;
+
+	spin_lock_irq(&device->al_lock);
+	for (enr = first; enr <= last; enr++) {
+		struct lc_element *al_ext;
+		al_ext = lc_find(device->act_log, enr);
+		if (al_ext && al_ext->refcnt > 0) {
+			active = true;
+			break;
+		}
 	}
-	return NULL;
+	spin_unlock_irq(&device->al_lock);
+
+	return active;
 }
 
-static struct lc_element *_al_get(struct drbd_device *device, unsigned int enr, bool nonblock)
+static
+struct lc_element *_al_get_nonblock(struct drbd_device *device, unsigned int enr)
 {
 	struct lc_element *al_ext;
-	struct bm_extent *bm_ext;
-	int wake;
 
 	spin_lock_irq(&device->al_lock);
-	bm_ext = find_active_resync_extent(device, enr);
-	if (bm_ext) {
-		wake = !test_and_set_bit(BME_PRIORITY, &bm_ext->flags);
-		spin_unlock_irq(&device->al_lock);
-		if (wake)
-			wake_up(&device->al_wait);
-		return NULL;
-	}
-	if (nonblock)
-		al_ext = lc_try_get(device->act_log, enr);
-	else
-		al_ext = lc_get(device->act_log, enr);
+	al_ext = lc_try_get(device->act_log, enr);
 	spin_unlock_irq(&device->al_lock);
+
 	return al_ext;
 }
 
-bool drbd_al_begin_io_fastpath(struct drbd_device *device, struct drbd_interval *i)
+#if IS_ENABLED(CONFIG_DEV_DAX_PMEM)
+static
+struct lc_element *_al_get(struct drbd_device *device, unsigned int enr)
 {
-	/* for bios crossing activity log extent boundaries,
-	 * we may need to activate two extents in one go */
-	unsigned first = i->sector >> (AL_EXTENT_SHIFT-9);
-	unsigned last = i->size == 0 ? first : (i->sector + (i->size >> 9) - 1) >> (AL_EXTENT_SHIFT-9);
+	struct lc_element *al_ext;
 
-	D_ASSERT(device, first <= last);
-	D_ASSERT(device, atomic_read(&device->local_cnt) > 0);
+	spin_lock_irq(&device->al_lock);
+	al_ext = lc_get(device->act_log, enr);
+	spin_unlock_irq(&device->al_lock);
 
-	/* FIXME figure out a fast path for bios crossing AL extent boundaries */
-	if (first != last)
-		return false;
+	return al_ext;
+}
+
+static bool
+drbd_dax_begin_io_fp(struct drbd_device *device, unsigned int first, unsigned int last)
+{
+	struct lc_element *al_ext;
+	unsigned long flags;
+	unsigned int enr;
+	unsigned int abort_enr;
+	bool wake = 0;
 
-	return _al_get(device, first, true);
+	for (enr = first; enr <= last; enr++) {
+		al_ext = _al_get(device, enr);
+		if (!al_ext)
+			goto abort;
+
+		if (al_ext->lc_number != enr) {
+			spin_lock_irqsave(&device->al_lock, flags);
+			drbd_dax_al_update(device, al_ext);
+			lc_committed(device->act_log);
+			spin_unlock_irqrestore(&device->al_lock, flags);
+		}
+	}
+	return true;
+abort:
+	abort_enr = enr;
+	for (enr = first; enr < abort_enr; enr++) {
+		spin_lock_irqsave(&device->al_lock, flags);
+		al_ext = lc_find(device->act_log, enr);
+		wake |= lc_put(device->act_log, al_ext) == 0;
+		spin_unlock_irqrestore(&device->al_lock, flags);
+	}
+	if (wake)
+		wake_up(&device->al_wait);
+	return false;
 }
+#else
+static bool
+drbd_dax_begin_io_fp(struct drbd_device *device, unsigned int first, unsigned int last)
+{
+	return false;
+}
+#endif
 
-bool drbd_al_begin_io_prepare(struct drbd_device *device, struct drbd_interval *i)
+bool drbd_al_begin_io_fastpath(struct drbd_device *device, struct drbd_interval *i)
 {
 	/* for bios crossing activity log extent boundaries,
 	 * we may need to activate two extents in one go */
 	unsigned first = i->sector >> (AL_EXTENT_SHIFT-9);
 	unsigned last = i->size == 0 ? first : (i->sector + (i->size >> 9) - 1) >> (AL_EXTENT_SHIFT-9);
-	unsigned enr;
-	bool need_transaction = false;
 
 	D_ASSERT(device, first <= last);
 	D_ASSERT(device, atomic_read(&device->local_cnt) > 0);
 
-	for (enr = first; enr <= last; enr++) {
-		struct lc_element *al_ext;
-		wait_event(device->al_wait,
-				(al_ext = _al_get(device, enr, false)) != NULL);
-		if (al_ext->lc_number != enr)
-			need_transaction = true;
-	}
-	return need_transaction;
+	if (drbd_md_dax_active(device->ldev))
+		return drbd_dax_begin_io_fp(device, first, last);
+
+	/* FIXME figure out a fast path for bios crossing AL extent boundaries */
+	if (first != last)
+		return false;
+
+	return _al_get_nonblock(device, first) != NULL;
 }
 
-#if (PAGE_SHIFT + 3) < (AL_EXTENT_SHIFT - BM_BLOCK_SHIFT)
-/* Currently BM_BLOCK_SHIFT, BM_EXT_SHIFT and AL_EXTENT_SHIFT
+#if AL_EXTENT_SHIFT > 27
+/* Condition used to be:
+ * (PAGE_SHIFT + 3) < (AL_EXTENT_SHIFT - BM_BLOCK_SHIFT)
+ * """
+ * Currently BM_BLOCK_SHIFT and AL_EXTENT_SHIFT
  * are still coupled, or assume too much about their relation.
  * Code below will not work if this is violated.
- * Will be cleaned up with some followup patch.
+ * """
+ *
+ * We want configurable bitmap granularity now.
+ * We only allow bytes per bit >= 4k, though: BM_BLOCK_SHIFT >= 12,
+ * increasing it will only make the right side smaller,
+ * not changing the boolean result.
+ * PAGE_SHIFT is 12 or larger (may be 14,16,18 for some architectures).
+ * That will increase the left side, so won't change the boolean result.
+ *
+ * Unfortunately I don't remember the specifics of which simplifications
+ * below this is supposed to protect.
+ * But assuming it is still relevant,
+ * we keep AL_EXTENT_SHIFT at 22, and must not increase it above 27
+ * without proving the code below to still work.
  */
 # error FIXME
 #endif
 
-static unsigned int al_extent_to_bm_page(unsigned int al_enr)
+static unsigned long al_extent_to_bm_bit(const struct drbd_bitmap *bm, unsigned int al_enr)
 {
-	return al_enr >>
-		/* bit to page */
-		((PAGE_SHIFT + 3) -
-		/* al extent number to bit */
-		 (AL_EXTENT_SHIFT - BM_BLOCK_SHIFT));
+	return (unsigned long)al_enr << (AL_EXTENT_SHIFT - bm->bm_block_shift);
 }
 
 static sector_t al_tr_number_to_on_disk_sector(struct drbd_device *device)
@@ -315,12 +328,14 @@ static sector_t al_tr_number_to_on_disk_sector(struct drbd_device *device)
 
 static int __al_write_transaction(struct drbd_device *device, struct al_transaction_on_disk *buffer)
 {
+	struct drbd_bitmap *bm = device->bitmap;
 	struct lc_element *e;
 	sector_t sector;
 	int i, mx;
 	unsigned extent_nr;
 	unsigned crc = 0;
 	int err = 0;
+	ktime_var_for_accounting(start_kt);
 
 	memset(buffer, 0, sizeof(*buffer));
 	buffer->magic = cpu_to_be32(DRBD_AL_MAGIC);
@@ -342,9 +357,13 @@ static int __al_write_transaction(struct drbd_device *device, struct al_transact
 		}
 		buffer->update_slot_nr[i] = cpu_to_be16(e->lc_index);
 		buffer->update_extent_nr[i] = cpu_to_be32(e->lc_new_number);
-		if (e->lc_number != LC_FREE)
-			drbd_bm_mark_for_writeout(device,
-					al_extent_to_bm_page(e->lc_number));
+		if (e->lc_number != LC_FREE) {
+			unsigned long start, end;
+
+			start = al_extent_to_bm_bit(bm, e->lc_number);
+			end = al_extent_to_bm_bit(bm, e->lc_number + 1) - 1;
+			drbd_bm_mark_range_for_writeout(device, start, end);
+		}
 		i++;
 	}
 	spin_unlock_irq(&device->al_lock);
@@ -378,22 +397,21 @@ static int __al_write_transaction(struct drbd_device *device, struct al_transact
 	crc = crc32c(0, buffer, 4096);
 	buffer->crc32c = cpu_to_be32(crc);
 
-	if (drbd_bm_write_hinted(device))
-		err = -EIO;
-	else {
-		bool write_al_updates;
-		rcu_read_lock();
-		write_al_updates = rcu_dereference(device->ldev->disk_conf)->al_updates;
-		rcu_read_unlock();
-		if (write_al_updates) {
-			if (drbd_md_sync_page_io(device, device->ldev, sector, REQ_OP_WRITE)) {
-				err = -EIO;
-				drbd_chk_io_error(device, 1, DRBD_META_IO_ERROR);
-			} else {
-				device->al_tr_number++;
-				device->al_writ_cnt++;
-			}
+	ktime_aggregate_delta(device, start_kt, al_before_bm_write_hinted_kt);
+	err = drbd_bm_write_hinted(device);
+	if (!err) {
+		ktime_aggregate_delta(device, start_kt, al_mid_kt);
+		if (drbd_md_sync_page_io(device, device->ldev, sector, REQ_OP_WRITE)) {
+			err = -EIO;
+			drbd_handle_io_error(device, DRBD_META_IO_ERROR);
+		} else {
+			device->al_tr_number++;
+			device->al_writ_cnt++;
+			device->al_histogram[min_t(unsigned int,
+					device->act_log->pending_changes,
+					AL_UPDATES_PER_TRANSACTION)]++;
 		}
+		ktime_aggregate_delta(device, start_kt, al_after_sync_page_kt);
 	}
 
 	return err;
@@ -406,15 +424,15 @@ static int al_write_transaction(struct drbd_device *device)
 
 	if (!get_ldev(device)) {
 		drbd_err(device, "disk is %s, cannot start al transaction\n",
-			drbd_disk_str(device->state.disk));
+			drbd_disk_str(device->disk_state[NOW]));
 		return -EIO;
 	}
 
 	/* The bitmap write may have failed, causing a state change. */
-	if (device->state.disk < D_INCONSISTENT) {
+	if (device->disk_state[NOW] < D_INCONSISTENT) {
 		drbd_err(device,
 			"disk is %s, cannot write al transaction\n",
-			drbd_disk_str(device->state.disk));
+			drbd_disk_str(device->disk_state[NOW]));
 		put_ldev(device);
 		return -EIO;
 	}
@@ -435,27 +453,47 @@ static int al_write_transaction(struct drbd_device *device)
 	return err;
 }
 
+bool drbd_al_try_lock(struct drbd_device *device)
+{
+	bool locked;
+
+	spin_lock_irq(&device->al_lock);
+	locked = lc_try_lock(device->act_log);
+	spin_unlock_irq(&device->al_lock);
+
+	return locked;
+}
+
+bool drbd_al_try_lock_for_transaction(struct drbd_device *device)
+{
+	bool locked;
+
+	spin_lock_irq(&device->al_lock);
+	locked = lc_try_lock_for_transaction(device->act_log);
+	spin_unlock_irq(&device->al_lock);
+
+	return locked;
+}
 
 void drbd_al_begin_io_commit(struct drbd_device *device)
 {
 	bool locked = false;
 
-	/* Serialize multiple transactions.
-	 * This uses test_and_set_bit, memory barrier is implicit.
-	 */
+
+	if (drbd_md_dax_active(device->ldev)) {
+		drbd_dax_al_begin_io_commit(device);
+		return;
+	}
+
 	wait_event(device->al_wait,
 			device->act_log->pending_changes == 0 ||
-			(locked = lc_try_lock_for_transaction(device->act_log)));
+			(locked = drbd_al_try_lock_for_transaction(device)));
 
 	if (locked) {
-		/* Double check: it may have been committed by someone else,
-		 * while we have been waiting for the lock. */
+		/* Double check: it may have been committed by someone else
+		 * while we were waiting for the lock. */
 		if (device->act_log->pending_changes) {
-			bool write_al_updates;
-
-			rcu_read_lock();
-			write_al_updates = rcu_dereference(device->ldev->disk_conf)->al_updates;
-			rcu_read_unlock();
+			bool write_al_updates = !(device->ldev->md.flags & MDF_AL_DISABLED);
 
 			if (write_al_updates)
 				al_write_transaction(device);
@@ -472,13 +510,32 @@ void drbd_al_begin_io_commit(struct drbd_device *device)
 	}
 }
 
-/*
- * @delegate:   delegate activity log I/O to the worker thread
- */
-void drbd_al_begin_io(struct drbd_device *device, struct drbd_interval *i)
+static bool put_actlog(struct drbd_device *device, unsigned int first, unsigned int last)
 {
-	if (drbd_al_begin_io_prepare(device, i))
-		drbd_al_begin_io_commit(device);
+	struct lc_element *extent;
+	unsigned long flags;
+	unsigned int enr;
+	bool wake = false;
+
+	D_ASSERT(device, first <= last);
+	spin_lock_irqsave(&device->al_lock, flags);
+	for (enr = first; enr <= last; enr++) {
+		extent = lc_find(device->act_log, enr);
+		/* Yes, this masks a bug elsewhere.  However, during normal
+		 * operation this is harmless, so no need to crash the kernel
+		 * by the BUG_ON(refcount == 0) in lc_put().
+		 */
+		if (!extent || extent->refcnt == 0) {
+			drbd_err(device, "al_complete_io() called on inactive extent %u\n", enr);
+			continue;
+		}
+		if (lc_put(device->act_log, extent) == 0)
+			wake = true;
+	}
+	spin_unlock_irqrestore(&device->al_lock, flags);
+	if (wake)
+		wake_up(&device->al_wait);
+	return wake;
 }
 
 int drbd_al_begin_io_nonblock(struct drbd_device *device, struct drbd_interval *i)
@@ -497,20 +554,6 @@ int drbd_al_begin_io_nonblock(struct drbd_device *device, struct drbd_interval *
 
 	D_ASSERT(device, first <= last);
 
-	/* Is resync active in this area? */
-	for (enr = first; enr <= last; enr++) {
-		struct lc_element *tmp;
-		tmp = lc_find(device->resync, enr/AL_EXT_PER_BM_SECT);
-		if (unlikely(tmp != NULL)) {
-			struct bm_extent  *bm_ext = lc_entry(tmp, struct bm_extent, lce);
-			if (test_bit(BME_NO_WRITES, &bm_ext->flags)) {
-				if (!test_and_set_bit(BME_PRIORITY, &bm_ext->flags))
-					return -EBUSY;
-				return -EWOULDBLOCK;
-			}
-		}
-	}
-
 	/* Try to checkout the refcounts. */
 	for (enr = first; enr <= last; enr++) {
 		struct lc_element *al_ext;
@@ -530,33 +573,18 @@ int drbd_al_begin_io_nonblock(struct drbd_device *device, struct drbd_interval *
 	return 0;
 }
 
-void drbd_al_complete_io(struct drbd_device *device, struct drbd_interval *i)
+/* put activity log extent references corresponding to interval i, return true
+ * if at least one extent is now unreferenced. */
+bool drbd_al_complete_io(struct drbd_device *device, struct drbd_interval *i)
 {
 	/* for bios crossing activity log extent boundaries,
 	 * we may need to activate two extents in one go */
 	unsigned first = i->sector >> (AL_EXTENT_SHIFT-9);
 	unsigned last = i->size == 0 ? first : (i->sector + (i->size >> 9) - 1) >> (AL_EXTENT_SHIFT-9);
-	unsigned enr;
-	struct lc_element *extent;
-	unsigned long flags;
 
 	D_ASSERT(device, first <= last);
-	spin_lock_irqsave(&device->al_lock, flags);
 
-	for (enr = first; enr <= last; enr++) {
-		extent = lc_find(device->act_log, enr);
-		/* Yes, this masks a bug elsewhere.  However, during normal
-		 * operation this is harmless, so no need to crash the kernel
-		 * by the BUG_ON(refcount == 0) in lc_put().
-		 */
-		if (!extent || extent->refcnt == 0) {
-			drbd_err(device, "al_complete_io() called on inactive extent %u\n", enr);
-			continue;
-		}
-		lc_put(device->act_log, extent);
-	}
-	spin_unlock_irqrestore(&device->al_lock, flags);
-	wake_up(&device->al_wait);
+	return put_actlog(device, first, last);
 }
 
 static int _try_lc_del(struct drbd_device *device, struct lc_element *al_ext)
@@ -605,6 +633,9 @@ int drbd_al_initialize(struct drbd_device *device, void *buffer)
 	int al_size_4k = md->al_stripes * md->al_stripe_size_4k;
 	int i;
 
+	if (drbd_md_dax_active(device->ldev))
+		return drbd_dax_al_initialize(device);
+
 	__al_write_transaction(device, al);
 	/* There may or may not have been a pending transaction. */
 	spin_lock_irq(&device->al_lock);
@@ -622,219 +653,91 @@ int drbd_al_initialize(struct drbd_device *device, void *buffer)
 	return 0;
 }
 
-static const char *drbd_change_sync_fname[] = {
-	[RECORD_RS_FAILED] = "drbd_rs_failed_io",
-	[SET_IN_SYNC] = "drbd_set_in_sync",
-	[SET_OUT_OF_SYNC] = "drbd_set_out_of_sync"
-};
-
-/* ATTENTION. The AL's extents are 4MB each, while the extents in the
- * resync LRU-cache are 16MB each.
- * The caller of this function has to hold an get_ldev() reference.
- *
- * Adjusts the caching members ->rs_left (success) or ->rs_failed (!success),
- * potentially pulling in (and recounting the corresponding bits)
- * this resync extent into the resync extent lru cache.
- *
- * Returns whether all bits have been cleared for this resync extent,
- * precisely: (rs_left <= rs_failed)
- *
- * TODO will be obsoleted once we have a caching lru of the on disk bitmap
- */
-static bool update_rs_extent(struct drbd_device *device,
-		unsigned int enr, int count,
-		enum update_sync_bits_mode mode)
+void drbd_advance_rs_marks(struct drbd_peer_device *peer_device, unsigned long still_to_go)
 {
-	struct lc_element *e;
+	unsigned long now;
+	int next;
 
-	D_ASSERT(device, atomic_read(&device->local_cnt));
-
-	/* When setting out-of-sync bits,
-	 * we don't need it cached (lc_find).
-	 * But if it is present in the cache,
-	 * we should update the cached bit count.
-	 * Otherwise, that extent should be in the resync extent lru cache
-	 * already -- or we want to pull it in if necessary -- (lc_get),
-	 * then update and check rs_left and rs_failed. */
-	if (mode == SET_OUT_OF_SYNC)
-		e = lc_find(device->resync, enr);
-	else
-		e = lc_get(device->resync, enr);
-	if (e) {
-		struct bm_extent *ext = lc_entry(e, struct bm_extent, lce);
-		if (ext->lce.lc_number == enr) {
-			if (mode == SET_IN_SYNC)
-				ext->rs_left -= count;
-			else if (mode == SET_OUT_OF_SYNC)
-				ext->rs_left += count;
-			else
-				ext->rs_failed += count;
-			if (ext->rs_left < ext->rs_failed) {
-				drbd_warn(device, "BAD! enr=%u rs_left=%d "
-				    "rs_failed=%d count=%d cstate=%s\n",
-				     ext->lce.lc_number, ext->rs_left,
-				     ext->rs_failed, count,
-				     drbd_conn_str(device->state.conn));
-
-				/* We don't expect to be able to clear more bits
-				 * than have been set when we originally counted
-				 * the set bits to cache that value in ext->rs_left.
-				 * Whatever the reason (disconnect during resync,
-				 * delayed local completion of an application write),
-				 * try to fix it up by recounting here. */
-				ext->rs_left = drbd_bm_e_weight(device, enr);
-			}
-		} else {
-			/* Normally this element should be in the cache,
-			 * since drbd_rs_begin_io() pulled it already in.
-			 *
-			 * But maybe an application write finished, and we set
-			 * something outside the resync lru_cache in sync.
-			 */
-			int rs_left = drbd_bm_e_weight(device, enr);
-			if (ext->flags != 0) {
-				drbd_warn(device, "changing resync lce: %d[%u;%02lx]"
-				     " -> %d[%u;00]\n",
-				     ext->lce.lc_number, ext->rs_left,
-				     ext->flags, enr, rs_left);
-				ext->flags = 0;
-			}
-			if (ext->rs_failed) {
-				drbd_warn(device, "Kicking resync_lru element enr=%u "
-				     "out with rs_failed=%d\n",
-				     ext->lce.lc_number, ext->rs_failed);
-			}
-			ext->rs_left = rs_left;
-			ext->rs_failed = (mode == RECORD_RS_FAILED) ? count : 0;
-			/* we don't keep a persistent log of the resync lru,
-			 * we can commit any change right away. */
-			lc_committed(device->resync);
-		}
-		if (mode != SET_OUT_OF_SYNC)
-			lc_put(device->resync, &ext->lce);
-		/* no race, we are within the al_lock! */
+	/* report progress and advance marks only if we made progress */
+	if (peer_device->rs_mark_left[peer_device->rs_last_mark] == still_to_go)
+		return;
 
-		if (ext->rs_left <= ext->rs_failed) {
-			ext->rs_failed = 0;
-			return true;
-		}
-	} else if (mode != SET_OUT_OF_SYNC) {
-		/* be quiet if lc_find() did not find it. */
-		drbd_err(device, "lc_get() failed! locked=%d/%d flags=%lu\n",
-		    device->resync_locked,
-		    device->resync->nr_elements,
-		    device->resync->flags);
-	}
-	return false;
-}
+	/* report progress and advance marks at most once every DRBD_SYNC_MARK_STEP (3 seconds) */
+	now = jiffies;
+	if (!time_after_eq(now, peer_device->rs_last_progress_report_ts + DRBD_SYNC_MARK_STEP))
+		return;
 
-void drbd_advance_rs_marks(struct drbd_peer_device *peer_device, unsigned long still_to_go)
-{
-	struct drbd_device *device = peer_device->device;
-	unsigned long now = jiffies;
-	unsigned long last = device->rs_mark_time[device->rs_last_mark];
-	int next = (device->rs_last_mark + 1) % DRBD_SYNC_MARKS;
-	if (time_after_eq(now, last + DRBD_SYNC_MARK_STEP)) {
-		if (device->rs_mark_left[device->rs_last_mark] != still_to_go &&
-		    device->state.conn != C_PAUSED_SYNC_T &&
-		    device->state.conn != C_PAUSED_SYNC_S) {
-			device->rs_mark_time[next] = now;
-			device->rs_mark_left[next] = still_to_go;
-			device->rs_last_mark = next;
-		}
+	/* Do not advance marks if we are "paused" */
+	if (peer_device->repl_state[NOW] != L_PAUSED_SYNC_T &&
+	    peer_device->repl_state[NOW] != L_PAUSED_SYNC_S) {
+		next = (peer_device->rs_last_mark + 1) % DRBD_SYNC_MARKS;
+		peer_device->rs_mark_time[next] = now;
+		peer_device->rs_mark_left[next] = still_to_go;
+		peer_device->rs_last_mark = next;
 	}
-}
 
-/* It is called lazy update, so don't do write-out too often. */
-static bool lazy_bitmap_update_due(struct drbd_device *device)
-{
-	return time_after(jiffies, device->rs_last_bcast + 2*HZ);
+	/* But still report progress even if paused. */
+	peer_device->rs_last_progress_report_ts = now;
+	drbd_peer_device_post_work(peer_device, RS_PROGRESS);
 }
 
-static void maybe_schedule_on_disk_bitmap_update(struct drbd_device *device, bool rs_done)
+/* It is called lazy update, so don't do write-out too often. */
+bool drbd_lazy_bitmap_update_due(struct drbd_peer_device *peer_device)
 {
-	if (rs_done) {
-		struct drbd_connection *connection = first_peer_device(device)->connection;
-		if (connection->agreed_pro_version <= 95 ||
-		    is_sync_target_state(device->state.conn))
-			set_bit(RS_DONE, &device->flags);
-			/* and also set RS_PROGRESS below */
-
-		/* Else: rather wait for explicit notification via receive_state,
-		 * to avoid uuids-rotated-too-fast causing full resync
-		 * in next handshake, in case the replication link breaks
-		 * at the most unfortunate time... */
-	} else if (!lazy_bitmap_update_due(device))
-		return;
-
-	drbd_device_post_work(device, RS_PROGRESS);
+	return time_after(jiffies, peer_device->rs_last_writeout + 2*HZ);
 }
 
-static int update_sync_bits(struct drbd_device *device,
+static int update_sync_bits(struct drbd_peer_device *peer_device,
 		unsigned long sbnr, unsigned long ebnr,
 		enum update_sync_bits_mode mode)
 {
-	/*
-	 * We keep a count of set bits per resync-extent in the ->rs_left
-	 * caching member, so we need to loop and work within the resync extent
-	 * alignment. Typically this loop will execute exactly once.
-	 */
-	unsigned long flags;
+	struct drbd_device *device = peer_device->device;
 	unsigned long count = 0;
-	unsigned int cleared = 0;
-	while (sbnr <= ebnr) {
-		/* set temporary boundary bit number to last bit number within
-		 * the resync extent of the current start bit number,
-		 * but cap at provided end bit number */
-		unsigned long tbnr = min(ebnr, sbnr | BM_BLOCKS_PER_BM_EXT_MASK);
-		unsigned long c;
-
-		if (mode == RECORD_RS_FAILED)
-			/* Only called from drbd_rs_failed_io(), bits
-			 * supposedly still set.  Recount, maybe some
-			 * of the bits have been successfully cleared
-			 * by application IO meanwhile.
-			 */
-			c = drbd_bm_count_bits(device, sbnr, tbnr);
-		else if (mode == SET_IN_SYNC)
-			c = drbd_bm_clear_bits(device, sbnr, tbnr);
-		else /* if (mode == SET_OUT_OF_SYNC) */
-			c = drbd_bm_set_bits(device, sbnr, tbnr);
+	int bmi = peer_device->bitmap_index;
+
+	if (mode == RECORD_RS_FAILED)
+		/* Only called from drbd_rs_failed_io(), bits
+		 * supposedly still set.  Recount, maybe some
+		 * of the bits have been successfully cleared
+		 * by application IO meanwhile.
+		 */
+		count = drbd_bm_count_bits(device, bmi, sbnr, ebnr);
+	else if (mode == SET_IN_SYNC)
+		count = drbd_bm_clear_bits(device, bmi, sbnr, ebnr);
+	else /* if (mode == SET_OUT_OF_SYNC) */
+		count = drbd_bm_set_bits(device, bmi, sbnr, ebnr);
 
-		if (c) {
-			spin_lock_irqsave(&device->al_lock, flags);
-			cleared += update_rs_extent(device, BM_BIT_TO_EXT(sbnr), c, mode);
-			spin_unlock_irqrestore(&device->al_lock, flags);
-			count += c;
-		}
-		sbnr = tbnr + 1;
-	}
 	if (count) {
 		if (mode == SET_IN_SYNC) {
-			unsigned long still_to_go = drbd_bm_total_weight(device);
-			bool rs_is_done = (still_to_go <= device->rs_failed);
-			drbd_advance_rs_marks(first_peer_device(device), still_to_go);
-			if (cleared || rs_is_done)
-				maybe_schedule_on_disk_bitmap_update(device, rs_is_done);
-		} else if (mode == RECORD_RS_FAILED)
-			device->rs_failed += count;
+			unsigned long still_to_go = drbd_bm_total_weight(peer_device);
+
+			drbd_advance_rs_marks(peer_device, still_to_go);
+
+			if (drbd_lazy_bitmap_update_due(peer_device))
+				drbd_peer_device_post_work(peer_device, RS_LAZY_BM_WRITE);
+
+			if (peer_device->connection->agreed_pro_version <= 95 &&
+					still_to_go <= peer_device->rs_failed &&
+					is_sync_source_state(peer_device, NOW))
+				drbd_peer_device_post_work(peer_device, RS_DONE);
+		} else if (mode == RECORD_RS_FAILED) {
+			peer_device->rs_failed += count;
+		} else /* if (mode == SET_OUT_OF_SYNC) */ {
+			enum drbd_repl_state repl_state = peer_device->repl_state[NOW];
+			if (repl_state >= L_SYNC_SOURCE && repl_state <= L_PAUSED_SYNC_T)
+				peer_device->rs_total += count;
+		}
 		wake_up(&device->al_wait);
 	}
 	return count;
 }
 
-static bool plausible_request_size(int size)
-{
-	return size > 0
-		&& size <= DRBD_MAX_BATCH_BIO_SIZE
-		&& IS_ALIGNED(size, 512);
-}
-
-/* clear the bit corresponding to the piece of storage in question:
- * size byte of data starting from sector.  Only clear bits of the affected
- * one or more _aligned_ BM_BLOCK_SIZE blocks.
+/* Change bits corresponding to the piece of storage in question:
+ * size byte of data starting from sector.
+ * Only clear bits for fully affected _aligned_ BM_BLOCK_SIZE blocks.
+ * Set bits even for partially affected blocks.
  *
- * called by worker on C_SYNC_TARGET and receiver on SyncSource.
+ * called by worker on L_SYNC_TARGET and receiver on SyncSource.
  *
  */
 int __drbd_change_sync(struct drbd_peer_device *peer_device, sector_t sector, int size,
@@ -842,395 +745,152 @@ int __drbd_change_sync(struct drbd_peer_device *peer_device, sector_t sector, in
 {
 	/* Is called from worker and receiver context _only_ */
 	struct drbd_device *device = peer_device->device;
+	struct drbd_bitmap *bm;
 	unsigned long sbnr, ebnr, lbnr;
 	unsigned long count = 0;
 	sector_t esector, nr_sectors;
 
-	/* This would be an empty REQ_PREFLUSH, be silent. */
+	/* This would be an empty REQ_OP_FLUSH, be silent. */
 	if ((mode == SET_OUT_OF_SYNC) && size == 0)
 		return 0;
 
-	if (!plausible_request_size(size)) {
-		drbd_err(device, "%s: sector=%llus size=%d nonsense!\n",
-				drbd_change_sync_fname[mode],
-				(unsigned long long)sector, size);
+	if (peer_device->bitmap_index == -1) /* no bitmap... */
 		return 0;
-	}
 
 	if (!get_ldev(device))
 		return 0; /* no disk, no metadata, no bitmap to manipulate bits in */
 
+	bm = device->bitmap;
+
 	nr_sectors = get_capacity(device->vdisk);
 	esector = sector + (size >> 9) - 1;
 
-	if (!expect(device, sector < nr_sectors))
+	if (!expect(peer_device, sector < nr_sectors))
 		goto out;
-	if (!expect(device, esector < nr_sectors))
+	if (!expect(peer_device, esector < nr_sectors))
 		esector = nr_sectors - 1;
 
-	lbnr = BM_SECT_TO_BIT(nr_sectors-1);
+	lbnr = bm_sect_to_bit(bm, nr_sectors-1);
 
 	if (mode == SET_IN_SYNC) {
 		/* Round up start sector, round down end sector.  We make sure
 		 * we only clear full, aligned, BM_BLOCK_SIZE blocks. */
-		if (unlikely(esector < BM_SECT_PER_BIT-1))
+		if (unlikely(esector < bm_sect_per_bit(bm)-1))
 			goto out;
 		if (unlikely(esector == (nr_sectors-1)))
 			ebnr = lbnr;
 		else
-			ebnr = BM_SECT_TO_BIT(esector - (BM_SECT_PER_BIT-1));
-		sbnr = BM_SECT_TO_BIT(sector + BM_SECT_PER_BIT-1);
+			ebnr = bm_sect_to_bit(bm, esector - (bm_sect_per_bit(bm)-1));
+		sbnr = bm_sect_to_bit(bm, sector + bm_sect_per_bit(bm)-1);
 	} else {
 		/* We set it out of sync, or record resync failure.
 		 * Should not round anything here. */
-		sbnr = BM_SECT_TO_BIT(sector);
-		ebnr = BM_SECT_TO_BIT(esector);
+		sbnr = bm_sect_to_bit(bm, sector);
+		ebnr = bm_sect_to_bit(bm, esector);
 	}
 
-	count = update_sync_bits(device, sbnr, ebnr, mode);
+	count = update_sync_bits(peer_device, sbnr, ebnr, mode);
 out:
 	put_ldev(device);
 	return count;
 }
 
-static
-struct bm_extent *_bme_get(struct drbd_device *device, unsigned int enr)
-{
-	struct lc_element *e;
-	struct bm_extent *bm_ext;
-	int wakeup = 0;
-	unsigned long rs_flags;
-
-	spin_lock_irq(&device->al_lock);
-	if (device->resync_locked > device->resync->nr_elements/2) {
-		spin_unlock_irq(&device->al_lock);
-		return NULL;
-	}
-	e = lc_get(device->resync, enr);
-	bm_ext = e ? lc_entry(e, struct bm_extent, lce) : NULL;
-	if (bm_ext) {
-		if (bm_ext->lce.lc_number != enr) {
-			bm_ext->rs_left = drbd_bm_e_weight(device, enr);
-			bm_ext->rs_failed = 0;
-			lc_committed(device->resync);
-			wakeup = 1;
-		}
-		if (bm_ext->lce.refcnt == 1)
-			device->resync_locked++;
-		set_bit(BME_NO_WRITES, &bm_ext->flags);
-	}
-	rs_flags = device->resync->flags;
-	spin_unlock_irq(&device->al_lock);
-	if (wakeup)
-		wake_up(&device->al_wait);
-
-	if (!bm_ext) {
-		if (rs_flags & LC_STARVING)
-			drbd_warn(device, "Have to wait for element"
-			     " (resync LRU too small?)\n");
-		BUG_ON(rs_flags & LC_LOCKED);
-	}
-
-	return bm_ext;
-}
-
-static int _is_in_al(struct drbd_device *device, unsigned int enr)
+unsigned long drbd_set_all_out_of_sync(struct drbd_device *device, sector_t sector, int size)
 {
-	int rv;
-
-	spin_lock_irq(&device->al_lock);
-	rv = lc_is_used(device->act_log, enr);
-	spin_unlock_irq(&device->al_lock);
-
-	return rv;
+	return drbd_set_sync(device, sector, size, -1, -1);
 }
 
 /**
- * drbd_rs_begin_io() - Gets an extent in the resync LRU cache and sets it to BME_LOCKED
- * @device:	DRBD device.
- * @sector:	The sector number.
+ * drbd_set_sync  -  Set a disk range in or out of sync
+ * @device:	DRBD device
+ * @sector:	start sector of disk range
+ * @size:	size of disk range in bytes
+ * @bits:	bit values to use by bitmap index
+ * @mask:	bitmap indexes to modify (mask set)
  *
- * This functions sleeps on al_wait.
- *
- * Returns: %0 on success, -EINTR if interrupted.
+ * Returns a mask of the bitmap indexes which were modified.
  */
-int drbd_rs_begin_io(struct drbd_device *device, sector_t sector)
+unsigned long drbd_set_sync(struct drbd_device *device, sector_t sector, int size,
+		   unsigned long bits, unsigned long mask)
 {
-	unsigned int enr = BM_SECT_TO_EXT(sector);
-	struct bm_extent *bm_ext;
-	int i, sig;
-	bool sa;
-
-retry:
-	sig = wait_event_interruptible(device->al_wait,
-			(bm_ext = _bme_get(device, enr)));
-	if (sig)
-		return -EINTR;
-
-	if (test_bit(BME_LOCKED, &bm_ext->flags))
-		return 0;
-
-	/* step aside only while we are above c-min-rate; unless disabled. */
-	sa = drbd_rs_c_min_rate_throttle(device);
-
-	for (i = 0; i < AL_EXT_PER_BM_SECT; i++) {
-		sig = wait_event_interruptible(device->al_wait,
-					       !_is_in_al(device, enr * AL_EXT_PER_BM_SECT + i) ||
-					       (sa && test_bit(BME_PRIORITY, &bm_ext->flags)));
+	long set_start, set_end, clear_start, clear_end;
+	struct drbd_peer_device *peer_device;
+	struct drbd_bitmap *bm;
+	sector_t esector, nr_sectors;
+	unsigned long irq_flags;
+	unsigned long modified = 0;
 
-		if (sig || (sa && test_bit(BME_PRIORITY, &bm_ext->flags))) {
-			spin_lock_irq(&device->al_lock);
-			if (lc_put(device->resync, &bm_ext->lce) == 0) {
-				bm_ext->flags = 0; /* clears BME_NO_WRITES and eventually BME_PRIORITY */
-				device->resync_locked--;
-				wake_up(&device->al_wait);
-			}
-			spin_unlock_irq(&device->al_lock);
-			if (sig)
-				return -EINTR;
-			if (schedule_timeout_interruptible(HZ/10))
-				return -EINTR;
-			goto retry;
-		}
+	if (size <= 0 || !IS_ALIGNED(size, 512)) {
+		drbd_err(device, "%s sector: %llus, size: %d\n",
+			 __func__, (unsigned long long)sector, size);
+		return 0;
 	}
-	set_bit(BME_LOCKED, &bm_ext->flags);
-	return 0;
-}
-
-/**
- * drbd_try_rs_begin_io() - Gets an extent in the resync LRU cache, does not sleep
- * @peer_device: DRBD device.
- * @sector:	The sector number.
- *
- * Gets an extent in the resync LRU cache, sets it to BME_NO_WRITES, then
- * tries to set it to BME_LOCKED.
- *
- * Returns: %0 upon success, and -EAGAIN
- * if there is still application IO going on in this area.
- */
-int drbd_try_rs_begin_io(struct drbd_peer_device *peer_device, sector_t sector)
-{
-	struct drbd_device *device = peer_device->device;
-	unsigned int enr = BM_SECT_TO_EXT(sector);
-	const unsigned int al_enr = enr*AL_EXT_PER_BM_SECT;
-	struct lc_element *e;
-	struct bm_extent *bm_ext;
-	int i;
-	bool throttle = drbd_rs_should_slow_down(peer_device, sector, true);
 
-	/* If we need to throttle, a half-locked (only marked BME_NO_WRITES,
-	 * not yet BME_LOCKED) extent needs to be kicked out explicitly if we
-	 * need to throttle. There is at most one such half-locked extent,
-	 * which is remembered in resync_wenr. */
-
-	if (throttle && device->resync_wenr != enr)
-		return -EAGAIN;
-
-	spin_lock_irq(&device->al_lock);
-	if (device->resync_wenr != LC_FREE && device->resync_wenr != enr) {
-		/* in case you have very heavy scattered io, it may
-		 * stall the syncer undefined if we give up the ref count
-		 * when we try again and requeue.
-		 *
-		 * if we don't give up the refcount, but the next time
-		 * we are scheduled this extent has been "synced" by new
-		 * application writes, we'd miss the lc_put on the
-		 * extent we keep the refcount on.
-		 * so we remembered which extent we had to try again, and
-		 * if the next requested one is something else, we do
-		 * the lc_put here...
-		 * we also have to wake_up
-		 */
-		e = lc_find(device->resync, device->resync_wenr);
-		bm_ext = e ? lc_entry(e, struct bm_extent, lce) : NULL;
-		if (bm_ext) {
-			D_ASSERT(device, !test_bit(BME_LOCKED, &bm_ext->flags));
-			D_ASSERT(device, test_bit(BME_NO_WRITES, &bm_ext->flags));
-			clear_bit(BME_NO_WRITES, &bm_ext->flags);
-			device->resync_wenr = LC_FREE;
-			if (lc_put(device->resync, &bm_ext->lce) == 0) {
-				bm_ext->flags = 0;
-				device->resync_locked--;
-			}
-			wake_up(&device->al_wait);
-		} else {
-			drbd_alert(device, "LOGIC BUG\n");
-		}
-	}
-	/* TRY. */
-	e = lc_try_get(device->resync, enr);
-	bm_ext = e ? lc_entry(e, struct bm_extent, lce) : NULL;
-	if (bm_ext) {
-		if (test_bit(BME_LOCKED, &bm_ext->flags))
-			goto proceed;
-		if (!test_and_set_bit(BME_NO_WRITES, &bm_ext->flags)) {
-			device->resync_locked++;
-		} else {
-			/* we did set the BME_NO_WRITES,
-			 * but then could not set BME_LOCKED,
-			 * so we tried again.
-			 * drop the extra reference. */
-			bm_ext->lce.refcnt--;
-			D_ASSERT(device, bm_ext->lce.refcnt > 0);
-		}
-		goto check_al;
-	} else {
-		/* do we rather want to try later? */
-		if (device->resync_locked > device->resync->nr_elements-3)
-			goto try_again;
-		/* Do or do not. There is no try. -- Yoda */
-		e = lc_get(device->resync, enr);
-		bm_ext = e ? lc_entry(e, struct bm_extent, lce) : NULL;
-		if (!bm_ext) {
-			const unsigned long rs_flags = device->resync->flags;
-			if (rs_flags & LC_STARVING)
-				drbd_warn(device, "Have to wait for element"
-				     " (resync LRU too small?)\n");
-			BUG_ON(rs_flags & LC_LOCKED);
-			goto try_again;
-		}
-		if (bm_ext->lce.lc_number != enr) {
-			bm_ext->rs_left = drbd_bm_e_weight(device, enr);
-			bm_ext->rs_failed = 0;
-			lc_committed(device->resync);
-			wake_up(&device->al_wait);
-			D_ASSERT(device, test_bit(BME_LOCKED, &bm_ext->flags) == 0);
-		}
-		set_bit(BME_NO_WRITES, &bm_ext->flags);
-		D_ASSERT(device, bm_ext->lce.refcnt == 1);
-		device->resync_locked++;
-		goto check_al;
-	}
-check_al:
-	for (i = 0; i < AL_EXT_PER_BM_SECT; i++) {
-		if (lc_is_used(device->act_log, al_enr+i))
-			goto try_again;
-	}
-	set_bit(BME_LOCKED, &bm_ext->flags);
-proceed:
-	device->resync_wenr = LC_FREE;
-	spin_unlock_irq(&device->al_lock);
-	return 0;
+	if (!get_ldev(device))
+		return 0; /* no disk, no metadata, no bitmap to set bits in */
 
-try_again:
-	if (bm_ext) {
-		if (throttle) {
-			D_ASSERT(device, !test_bit(BME_LOCKED, &bm_ext->flags));
-			D_ASSERT(device, test_bit(BME_NO_WRITES, &bm_ext->flags));
-			clear_bit(BME_NO_WRITES, &bm_ext->flags);
-			device->resync_wenr = LC_FREE;
-			if (lc_put(device->resync, &bm_ext->lce) == 0) {
-				bm_ext->flags = 0;
-				device->resync_locked--;
-			}
-			wake_up(&device->al_wait);
-		} else
-			device->resync_wenr = enr;
-	}
-	spin_unlock_irq(&device->al_lock);
-	return -EAGAIN;
-}
+	bm = device->bitmap;
+	mask &= (1 << bm->bm_max_peers) - 1;
 
-void drbd_rs_complete_io(struct drbd_device *device, sector_t sector)
-{
-	unsigned int enr = BM_SECT_TO_EXT(sector);
-	struct lc_element *e;
-	struct bm_extent *bm_ext;
-	unsigned long flags;
+	nr_sectors = get_capacity(device->vdisk);
+	esector = sector + (size >> 9) - 1;
 
-	spin_lock_irqsave(&device->al_lock, flags);
-	e = lc_find(device->resync, enr);
-	bm_ext = e ? lc_entry(e, struct bm_extent, lce) : NULL;
-	if (!bm_ext) {
-		spin_unlock_irqrestore(&device->al_lock, flags);
-		if (drbd_ratelimit())
-			drbd_err(device, "drbd_rs_complete_io() called, but extent not found\n");
-		return;
-	}
+	if (!expect(device, sector < nr_sectors))
+		goto out;
+	if (!expect(device, esector < nr_sectors))
+		esector = nr_sectors - 1;
 
-	if (bm_ext->lce.refcnt == 0) {
-		spin_unlock_irqrestore(&device->al_lock, flags);
-		drbd_err(device, "drbd_rs_complete_io(,%llu [=%u]) called, "
-		    "but refcnt is 0!?\n",
-		    (unsigned long long)sector, enr);
-		return;
-	}
+	/* For marking sectors as out of sync, we need to round up. */
+	set_start = bm_sect_to_bit(bm, sector);
+	set_end = bm_sect_to_bit(bm, esector);
+
+	/* For marking sectors as in sync, we need to round down except when we
+	 * reach the end of the device: The last bit in the bitmap does not
+	 * account for sectors past the end of the device.
+	 * CLEAR_END can become negative here. */
+	clear_start = bm_sect_to_bit(bm, sector + bm_sect_per_bit(bm) - 1);
+	if (esector == nr_sectors - 1)
+		clear_end = bm_sect_to_bit(bm, esector);
+	else
+		clear_end = bm_sect_to_bit(bm, esector + 1) - 1;
 
-	if (lc_put(device->resync, &bm_ext->lce) == 0) {
-		bm_ext->flags = 0; /* clear BME_LOCKED, BME_NO_WRITES and BME_PRIORITY */
-		device->resync_locked--;
-		wake_up(&device->al_wait);
-	}
+	spin_lock_irqsave(&bm->bm_all_slots_lock, irq_flags);
+	rcu_read_lock();
+	for_each_peer_device_rcu(peer_device, device) {
+		int bitmap_index = peer_device->bitmap_index;
 
-	spin_unlock_irqrestore(&device->al_lock, flags);
-}
+		if (bitmap_index == -1)
+			continue;
 
-/**
- * drbd_rs_cancel_all() - Removes all extents from the resync LRU (even BME_LOCKED)
- * @device:	DRBD device.
- */
-void drbd_rs_cancel_all(struct drbd_device *device)
-{
-	spin_lock_irq(&device->al_lock);
+		if (!test_and_clear_bit(bitmap_index, &mask))
+			continue;
 
-	if (get_ldev_if_state(device, D_FAILED)) { /* Makes sure ->resync is there. */
-		lc_reset(device->resync);
-		put_ldev(device);
+		if (test_bit(bitmap_index, &bits)) {
+			if (update_sync_bits(peer_device, set_start, set_end, SET_OUT_OF_SYNC))
+				__set_bit(bitmap_index, &modified);
+		} else if (clear_start <= clear_end) {
+			if (update_sync_bits(peer_device, clear_start, clear_end, SET_IN_SYNC))
+				__set_bit(bitmap_index, &modified);
+		}
 	}
-	device->resync_locked = 0;
-	device->resync_wenr = LC_FREE;
-	spin_unlock_irq(&device->al_lock);
-	wake_up(&device->al_wait);
-}
-
-/**
- * drbd_rs_del_all() - Gracefully remove all extents from the resync LRU
- * @device:	DRBD device.
- *
- * Returns: %0 upon success, -EAGAIN if at least one reference count was
- * not zero.
- */
-int drbd_rs_del_all(struct drbd_device *device)
-{
-	struct lc_element *e;
-	struct bm_extent *bm_ext;
-	int i;
-
-	spin_lock_irq(&device->al_lock);
-
-	if (get_ldev_if_state(device, D_FAILED)) {
-		/* ok, ->resync is there. */
-		for (i = 0; i < device->resync->nr_elements; i++) {
-			e = lc_element_by_index(device->resync, i);
-			bm_ext = lc_entry(e, struct bm_extent, lce);
-			if (bm_ext->lce.lc_number == LC_FREE)
-				continue;
-			if (bm_ext->lce.lc_number == device->resync_wenr) {
-				drbd_info(device, "dropping %u in drbd_rs_del_all, apparently"
-				     " got 'synced' by application io\n",
-				     device->resync_wenr);
-				D_ASSERT(device, !test_bit(BME_LOCKED, &bm_ext->flags));
-				D_ASSERT(device, test_bit(BME_NO_WRITES, &bm_ext->flags));
-				clear_bit(BME_NO_WRITES, &bm_ext->flags);
-				device->resync_wenr = LC_FREE;
-				lc_put(device->resync, &bm_ext->lce);
-			}
-			if (bm_ext->lce.refcnt != 0) {
-				drbd_info(device, "Retrying drbd_rs_del_all() later. "
-				     "refcnt=%d\n", bm_ext->lce.refcnt);
-				put_ldev(device);
-				spin_unlock_irq(&device->al_lock);
-				return -EAGAIN;
+	rcu_read_unlock();
+	if (mask) {
+		int bitmap_index;
+
+		for_each_set_bit(bitmap_index, &mask, BITS_PER_LONG) {
+			if (test_bit(bitmap_index, &bits)) {
+				if (drbd_bm_set_bits(device, bitmap_index, set_start, set_end))
+					__set_bit(bitmap_index, &modified);
+			} else if (clear_start <= clear_end) {
+				if (drbd_bm_clear_bits(device, bitmap_index,
+							clear_start, clear_end))
+					__set_bit(bitmap_index, &modified);
 			}
-			D_ASSERT(device, !test_bit(BME_LOCKED, &bm_ext->flags));
-			D_ASSERT(device, !test_bit(BME_NO_WRITES, &bm_ext->flags));
-			lc_del(device->resync, &bm_ext->lce);
 		}
-		D_ASSERT(device, device->resync->used == 0);
-		put_ldev(device);
 	}
-	spin_unlock_irq(&device->al_lock);
-	wake_up(&device->al_wait);
+	spin_unlock_irqrestore(&bm->bm_all_slots_lock, irq_flags);
+out:
+	put_ldev(device);
 
-	return 0;
+	return modified;
 }
diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drbd_bitmap.c
index 65ea6ec66bfd..24fc9489b7ec 100644
--- a/drivers/block/drbd/drbd_bitmap.c
+++ b/drivers/block/drbd/drbd_bitmap.c
@@ -12,15 +12,27 @@
 
 #define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
 
-#include <linux/bitmap.h>
+#include <linux/bitops.h>
 #include <linux/vmalloc.h>
 #include <linux/string.h>
 #include <linux/drbd.h>
 #include <linux/slab.h>
-#include <linux/highmem.h>
+#include <linux/dynamic_debug.h>
+#include <linux/libnvdimm.h>
 
 #include "drbd_int.h"
+#include "drbd_meta_data.h"
+#include "drbd_dax_pmem.h"
 
+#ifndef BITS_PER_PAGE
+#define BITS_PER_PAGE		(1UL << (PAGE_SHIFT + 3))
+#else
+# if BITS_PER_PAGE != (1UL << (PAGE_SHIFT + 3))
+#  error "ambiguous BITS_PER_PAGE"
+# endif
+#endif
+
+#define PAGES_TO_KIB(pages) (((unsigned long long) (pages)) * (PAGE_SIZE / 1024))
 
 /* OPAQUE outside this file!
  * interface defined in drbd_int.h
@@ -80,48 +92,57 @@
  *  so we need spin_lock_irqsave().
  *  And we need the kmap_atomic.
  */
-struct drbd_bitmap {
-	struct page **bm_pages;
-	spinlock_t bm_lock;
 
-	/* exclusively to be used by __al_write_transaction(),
-	 * drbd_bm_mark_for_writeout() and
-	 * and drbd_bm_write_hinted() -> bm_rw() called from there.
-	 */
-	unsigned int n_bitmap_hints;
-	unsigned int al_bitmap_hints[AL_UPDATES_PER_TRANSACTION];
-
-	/* see LIMITATIONS: above */
-
-	unsigned long bm_set;       /* nr of set bits; THINK maybe atomic_t? */
-	unsigned long bm_bits;
-	size_t   bm_words;
-	size_t   bm_number_of_pages;
-	sector_t bm_dev_capacity;
-	struct mutex bm_change; /* serializes resize operations */
-
-	wait_queue_head_t bm_io_wait; /* used to serialize IO of single pages */
-
-	enum bm_flag bm_flags;
-
-	/* debugging aid, in case we are still racy somewhere */
-	char          *bm_why;
-	struct task_struct *bm_task;
+enum bitmap_operations {
+	BM_OP_CLEAR,
+	BM_OP_SET,
+	BM_OP_TEST,
+	BM_OP_COUNT,
+	BM_OP_MERGE,
+	BM_OP_EXTRACT,
+	BM_OP_FIND_BIT,
+	BM_OP_FIND_ZERO_BIT,
 };
 
-#define bm_print_lock_info(m) __bm_print_lock_info(m, __func__)
-static void __bm_print_lock_info(struct drbd_device *device, const char *func)
-{
+static void
+bm_print_lock_info(struct drbd_device *device, unsigned int bitmap_index, enum bitmap_operations op)
+{
+	static const char *op_names[] = {
+		[BM_OP_CLEAR] = "clear",
+		[BM_OP_SET] = "set",
+		[BM_OP_TEST] = "test",
+		[BM_OP_COUNT] = "count",
+		[BM_OP_MERGE] = "merge",
+		[BM_OP_EXTRACT] = "extract",
+		[BM_OP_FIND_BIT] = "find_bit",
+		[BM_OP_FIND_ZERO_BIT] = "find_zero_bit",
+	};
+
 	struct drbd_bitmap *b = device->bitmap;
-	if (!drbd_ratelimit())
+	if (!drbd_device_ratelimit(device, GENERIC))
 		return;
-	drbd_err(device, "FIXME %s[%d] in %s, bitmap locked for '%s' by %s[%d]\n",
+	drbd_err(device, "FIXME %s[%d] op %s, bitmap locked for '%s' by %s[%d]\n",
 		 current->comm, task_pid_nr(current),
-		 func, b->bm_why ?: "?",
-		 b->bm_task->comm, task_pid_nr(b->bm_task));
+		 op_names[op], b->bm_why ?: "?",
+		 b->bm_task_comm, b->bm_task_pid);
 }
 
-void drbd_bm_lock(struct drbd_device *device, char *why, enum bm_flag flags)
+/* drbd_bm_lock() was introduced before drbd-9.0 to ensure that access to
+   bitmap is locked out by other means (states, etc..). If a needed lock was
+   not acquired or already taken a warning gets logged, and the critical
+   sections get serialized on a mutex.
+
+   Since drbd-9.0 actions on the bitmap could happen in parallel (e.g. "receive
+   bitmap").
+   The cheap solution taken right now, is to completely serialize bitmap
+   operations but do not warn if they operate on different bitmap slots.
+
+   The real solution is to make the locking more fine grained (one lock per
+   bitmap slot) and to allow those operations to happen parallel.
+ */
+static void
+_drbd_bm_lock(struct drbd_device *device, struct drbd_peer_device *peer_device,
+	      const char *why, enum bm_flag flags)
 {
 	struct drbd_bitmap *b = device->bitmap;
 	int trylock_failed;
@@ -133,19 +154,36 @@ void drbd_bm_lock(struct drbd_device *device, char *why, enum bm_flag flags)
 
 	trylock_failed = !mutex_trylock(&b->bm_change);
 
+	if (trylock_failed && peer_device && b->bm_locked_peer != peer_device) {
+		mutex_lock(&b->bm_change);
+		trylock_failed = 0;
+	}
+
 	if (trylock_failed) {
 		drbd_warn(device, "%s[%d] going to '%s' but bitmap already locked for '%s' by %s[%d]\n",
 			  current->comm, task_pid_nr(current),
 			  why, b->bm_why ?: "?",
-			  b->bm_task->comm, task_pid_nr(b->bm_task));
+			  b->bm_task_comm, b->bm_task_pid);
 		mutex_lock(&b->bm_change);
 	}
-	if (BM_LOCKED_MASK & b->bm_flags)
+	if (b->bm_flags & BM_LOCK_ALL)
 		drbd_err(device, "FIXME bitmap already locked in bm_lock\n");
-	b->bm_flags |= flags & BM_LOCKED_MASK;
+	b->bm_flags |= flags & BM_LOCK_ALL;
 
 	b->bm_why  = why;
-	b->bm_task = current;
+	strscpy(b->bm_task_comm, current->comm);
+	b->bm_task_pid = task_pid_nr(current);
+	b->bm_locked_peer = peer_device;
+}
+
+void drbd_bm_lock(struct drbd_device *device, const char *why, enum bm_flag flags)
+{
+	_drbd_bm_lock(device, NULL, why, flags);
+}
+
+void drbd_bm_slot_lock(struct drbd_peer_device *peer_device, char *why, enum bm_flag flags)
+{
+	_drbd_bm_lock(peer_device->device, peer_device, why, flags);
 }
 
 void drbd_bm_unlock(struct drbd_device *device)
@@ -156,15 +194,22 @@ void drbd_bm_unlock(struct drbd_device *device)
 		return;
 	}
 
-	if (!(BM_LOCKED_MASK & device->bitmap->bm_flags))
+	if (!(b->bm_flags & BM_LOCK_ALL))
 		drbd_err(device, "FIXME bitmap not locked in bm_unlock\n");
 
-	b->bm_flags &= ~BM_LOCKED_MASK;
+	b->bm_flags &= ~BM_LOCK_ALL;
 	b->bm_why  = NULL;
-	b->bm_task = NULL;
+	b->bm_task_comm[0] = 0;
+	b->bm_task_pid = 0;
+	b->bm_locked_peer = NULL;
 	mutex_unlock(&b->bm_change);
 }
 
+void drbd_bm_slot_unlock(struct drbd_peer_device *peer_device)
+{
+	drbd_bm_unlock(peer_device->device);
+}
+
 /* we store some "meta" info about our pages in page->private */
 /* at a granularity of 4k storage per bitmap bit:
  * one peta byte storage: 1<<50 byte, 1<<38 * 4k storage blocks
@@ -220,7 +265,7 @@ static void bm_page_unlock_io(struct drbd_device *device, int page_nr)
 	struct drbd_bitmap *b = device->bitmap;
 	void *addr = &page_private(b->bm_pages[page_nr]);
 	clear_bit_unlock(BM_PAGE_IO_LOCK, addr);
-	wake_up(&device->bitmap->bm_io_wait);
+	wake_up(&b->bm_io_wait);
 }
 
 /* set _before_ submit_io, so it may be reset due to being changed
@@ -232,9 +277,12 @@ static void bm_set_page_unchanged(struct page *page)
 	clear_bit(BM_PAGE_LAZY_WRITEOUT, &page_private(page));
 }
 
-static void bm_set_page_need_writeout(struct page *page)
+static void bm_set_page_need_writeout(struct drbd_bitmap *bitmap, unsigned int page_nr)
 {
-	set_bit(BM_PAGE_NEED_WRITEOUT, &page_private(page));
+	if (!(bitmap->bm_flags & BM_ON_DAX_PMEM)) {
+		struct page *page = bitmap->bm_pages[page_nr];
+		set_bit(BM_PAGE_NEED_WRITEOUT, &page_private(page));
+	}
 }
 
 void drbd_bm_reset_al_hints(struct drbd_device *device)
@@ -242,30 +290,6 @@ void drbd_bm_reset_al_hints(struct drbd_device *device)
 	device->bitmap->n_bitmap_hints = 0;
 }
 
-/**
- * drbd_bm_mark_for_writeout() - mark a page with a "hint" to be considered for writeout
- * @device:	DRBD device.
- * @page_nr:	the bitmap page to mark with the "hint" flag
- *
- * From within an activity log transaction, we mark a few pages with these
- * hints, then call drbd_bm_write_hinted(), which will only write out changed
- * pages which are flagged with this mark.
- */
-void drbd_bm_mark_for_writeout(struct drbd_device *device, int page_nr)
-{
-	struct drbd_bitmap *b = device->bitmap;
-	struct page *page;
-	if (page_nr >= device->bitmap->bm_number_of_pages) {
-		drbd_warn(device, "BAD: page_nr: %u, number_of_pages: %u\n",
-			 page_nr, (int)device->bitmap->bm_number_of_pages);
-		return;
-	}
-	page = device->bitmap->bm_pages[page_nr];
-	BUG_ON(b->n_bitmap_hints >= ARRAY_SIZE(b->al_bitmap_hints));
-	if (!test_and_set_bit(BM_PAGE_HINT_WRITEOUT, &page_private(page)))
-		b->al_bitmap_hints[b->n_bitmap_hints++] = page_nr;
-}
-
 static int bm_test_page_unchanged(struct page *page)
 {
 	volatile const unsigned long *addr = &page_private(page);
@@ -282,9 +306,12 @@ static void bm_clear_page_io_err(struct page *page)
 	clear_bit(BM_PAGE_IO_ERROR, &page_private(page));
 }
 
-static void bm_set_page_lazy_writeout(struct page *page)
+static void bm_set_page_lazy_writeout(struct drbd_bitmap *bitmap, unsigned int page_nr)
 {
-	set_bit(BM_PAGE_LAZY_WRITEOUT, &page_private(page));
+	if (!(bitmap->bm_flags & BM_ON_DAX_PMEM)) {
+		struct page *page = bitmap->bm_pages[page_nr];
+		set_bit(BM_PAGE_LAZY_WRITEOUT, &page_private(page));
+	}
 }
 
 static int bm_test_page_lazy_writeout(struct page *page)
@@ -292,57 +319,6 @@ static int bm_test_page_lazy_writeout(struct page *page)
 	return test_bit(BM_PAGE_LAZY_WRITEOUT, &page_private(page));
 }
 
-/* on a 32bit box, this would allow for exactly (2<<38) bits. */
-static unsigned int bm_word_to_page_idx(struct drbd_bitmap *b, unsigned long long_nr)
-{
-	/* page_nr = (word*sizeof(long)) >> PAGE_SHIFT; */
-	unsigned int page_nr = long_nr >> (PAGE_SHIFT - LN2_BPL + 3);
-	BUG_ON(page_nr >= b->bm_number_of_pages);
-	return page_nr;
-}
-
-static unsigned int bm_bit_to_page_idx(struct drbd_bitmap *b, u64 bitnr)
-{
-	/* page_nr = (bitnr/8) >> PAGE_SHIFT; */
-	unsigned int page_nr = bitnr >> (PAGE_SHIFT + 3);
-	BUG_ON(page_nr >= b->bm_number_of_pages);
-	return page_nr;
-}
-
-static unsigned long *__bm_map_pidx(struct drbd_bitmap *b, unsigned int idx)
-{
-	struct page *page = b->bm_pages[idx];
-	return (unsigned long *) kmap_atomic(page);
-}
-
-static unsigned long *bm_map_pidx(struct drbd_bitmap *b, unsigned int idx)
-{
-	return __bm_map_pidx(b, idx);
-}
-
-static void __bm_unmap(unsigned long *p_addr)
-{
-	kunmap_atomic(p_addr);
-};
-
-static void bm_unmap(unsigned long *p_addr)
-{
-	return __bm_unmap(p_addr);
-}
-
-/* long word offset of _bitmap_ sector */
-#define S2W(s)	((s)<<(BM_EXT_SHIFT-BM_BLOCK_SHIFT-LN2_BPL))
-/* word offset from start of bitmap to word number _in_page_
- * modulo longs per page
-#define MLPP(X) ((X) % (PAGE_SIZE/sizeof(long))
- hm, well, Philipp thinks gcc might not optimize the % into & (... - 1)
- so do it explicitly:
- */
-#define MLPP(X) ((X) & ((PAGE_SIZE/sizeof(long))-1))
-
-/* Long words per page */
-#define LWPP (PAGE_SIZE/sizeof(long))
-
 /*
  * actually most functions herein should take a struct drbd_bitmap*, not a
  * struct drbd_device*, but for the debug macros I like to have the device around
@@ -367,16 +343,12 @@ static void bm_free_pages(struct page **pages, unsigned long number)
 	}
 }
 
-static inline void bm_vk_free(void *ptr)
-{
-	kvfree(ptr);
-}
-
 /*
  * "have" and "want" are NUMBER OF PAGES.
  */
-static struct page **bm_realloc_pages(struct drbd_bitmap *b, unsigned long want)
+static struct page **bm_realloc_pages(struct drbd_device *device, unsigned long want)
 {
+	struct drbd_bitmap *b = device->bitmap;
 	struct page **old_pages = b->bm_pages;
 	struct page **new_pages, *page;
 	unsigned int i, bytes;
@@ -388,15 +360,18 @@ static struct page **bm_realloc_pages(struct drbd_bitmap *b, unsigned long want)
 	if (have == want)
 		return old_pages;
 
-	/* Trying kmalloc first, falling back to vmalloc.
+	/*
+	 * Trying kmalloc first, falling back to vmalloc.
 	 * GFP_NOIO, as this is called while drbd IO is "suspended",
 	 * and during resize or attach on diskless Primary,
 	 * we must not block on IO to ourselves.
-	 * Context is receiver thread or dmsetup. */
+	 * Context is receiver thread or drbdsetup.
+	 */
 	bytes = sizeof(struct page *)*want;
 	new_pages = kzalloc(bytes, GFP_NOIO | __GFP_NOWARN);
 	if (!new_pages) {
-		new_pages = __vmalloc(bytes, GFP_NOIO | __GFP_ZERO);
+		new_pages = __vmalloc(bytes,
+				GFP_NOIO | __GFP_HIGHMEM | __GFP_ZERO);
 		if (!new_pages)
 			return NULL;
 	}
@@ -405,10 +380,14 @@ static struct page **bm_realloc_pages(struct drbd_bitmap *b, unsigned long want)
 		for (i = 0; i < have; i++)
 			new_pages[i] = old_pages[i];
 		for (; i < want; i++) {
-			page = alloc_page(GFP_NOIO | __GFP_HIGHMEM);
+			page = alloc_page(GFP_NOIO | __GFP_HIGHMEM | __GFP_RETRY_MAYFAIL |
+					__GFP_NOWARN | __GFP_ZERO);
 			if (!page) {
 				bm_free_pages(new_pages + have, i - have);
-				bm_vk_free(new_pages);
+				kvfree(new_pages);
+				drbd_err(device, "Failed to allocate bitmap; allocated %lu KiB / %lu KiB\n",
+						(unsigned long) i << (PAGE_SHIFT - 10),
+						want << (PAGE_SHIFT - 10));
 				return NULL;
 			}
 			/* we want to know which page it is
@@ -423,27 +402,32 @@ static struct page **bm_realloc_pages(struct drbd_bitmap *b, unsigned long want)
 		bm_free_pages(old_pages + want, have - want);
 		*/
 	}
-
 	return new_pages;
 }
 
-/*
- * allocates the drbd_bitmap and stores it in device->bitmap.
- */
-int drbd_bm_init(struct drbd_device *device)
+struct drbd_bitmap *drbd_bm_alloc(unsigned int max_peers, unsigned int bm_block_shift)
 {
-	struct drbd_bitmap *b = device->bitmap;
-	WARN_ON(b != NULL);
+	struct drbd_bitmap *b;
+
+	if (bm_block_shift < BM_BLOCK_SHIFT_MIN
+	||  bm_block_shift > BM_BLOCK_SIZE_MAX)
+		return NULL;
+	if (max_peers < 1 || max_peers > DRBD_PEERS_MAX)
+		return NULL;
+
 	b = kzalloc_obj(struct drbd_bitmap);
 	if (!b)
-		return -ENOMEM;
+		return NULL;
+
 	spin_lock_init(&b->bm_lock);
+	spin_lock_init(&b->bm_all_slots_lock);
 	mutex_init(&b->bm_change);
 	init_waitqueue_head(&b->bm_io_wait);
 
-	device->bitmap = b;
+	b->bm_max_peers = max_peers;
+	b->bm_block_shift = bm_block_shift;
 
-	return 0;
+	return b;
 }
 
 sector_t drbd_bm_capacity(struct drbd_device *device)
@@ -453,170 +437,454 @@ sector_t drbd_bm_capacity(struct drbd_device *device)
 	return device->bitmap->bm_dev_capacity;
 }
 
-/* called on driver unload. TODO: call when a device is destroyed.
- */
-void drbd_bm_cleanup(struct drbd_device *device)
+void drbd_bm_free(struct drbd_device *device)
 {
-	if (!expect(device, device->bitmap))
+	/* ldev_safe: explicit NULL check below */
+	struct drbd_bitmap *bitmap = device->bitmap;
+
+	if (bitmap == NULL)
 		return;
-	bm_free_pages(device->bitmap->bm_pages, device->bitmap->bm_number_of_pages);
-	bm_vk_free(device->bitmap->bm_pages);
-	kfree(device->bitmap);
+
+	/* ldev_safe: explicit NULL check above */
+	drbd_bm_resize(device, 0, 0);
+
+	kfree(bitmap);
+
+	/* ldev_safe: clearing pointer */
 	device->bitmap = NULL;
 }
 
+static inline unsigned long interleaved_word32(struct drbd_bitmap *bitmap,
+					       unsigned int bitmap_index,
+					       unsigned long bit)
+{
+	return (bit >> 5) * bitmap->bm_max_peers + bitmap_index;
+}
+
+static inline unsigned long word32_to_page(unsigned long word)
+{
+	return word >> (PAGE_SHIFT - 2);
+}
+
+static inline unsigned int word32_in_page(unsigned long word)
+{
+	return word & ((1 << (PAGE_SHIFT - 2)) - 1);
+}
+
+static inline unsigned long last_bit_on_page(struct drbd_bitmap *bitmap,
+					     unsigned int bitmap_index,
+					     unsigned long bit)
+{
+	unsigned long word = interleaved_word32(bitmap, bitmap_index, bit);
+
+	return (bit | 31) + ((word32_in_page(-(word + 1)) / bitmap->bm_max_peers) << 5);
+}
+
+static inline unsigned long bit_to_page_interleaved(struct drbd_bitmap *bitmap,
+						    unsigned int bitmap_index,
+						    unsigned long bit)
+{
+	return word32_to_page(interleaved_word32(bitmap, bitmap_index, bit));
+}
+
+static void *bm_map(struct drbd_bitmap *bitmap, unsigned int page)
+{
+	if (!(bitmap->bm_flags & BM_ON_DAX_PMEM))
+		return kmap_atomic(bitmap->bm_pages[page]);
+
+	return ((unsigned char *)bitmap->bm_on_pmem) + (unsigned long)page * PAGE_SIZE;
+}
+
+static void bm_unmap(struct drbd_bitmap *bitmap, void *addr)
+{
+	if (!(bitmap->bm_flags & BM_ON_DAX_PMEM))
+		kunmap_atomic(addr);
+}
+
+
 /*
- * since (b->bm_bits % BITS_PER_LONG) != 0,
- * this masks out the remaining bits.
- * Returns the number of bits cleared.
+ * find_next_bit() and find_next_zero_bit() expect an (unsigned long *),
+ * and will dereference it.
+ * When scanning our bitmap, we are interested in 32bit words of it.
+ * The "current 32 bit word pointer" may point to the last 32 bits in a page.
+ * For 64bit long, if the page after the current page is not mapped,
+ * this causes "page fault - not-present page".
+ * Duplicate the "fast path" of these functions,
+ * simplified for "size: 32, offset: 0".
+ * Little endian arch: le32_to_cpu is a no-op.
+ * Big endian arch: le32_to_cpu moves the least significant 32 bits around.
+ * __ffs / ffz do an implicit cast to (unsignd long). On 64bit, that fills up
+ * the most significant bits with 0; we are not interested in those anyways.
  */
-#ifndef BITS_PER_PAGE
-#define BITS_PER_PAGE		(1UL << (PAGE_SHIFT + 3))
-#define BITS_PER_PAGE_MASK	(BITS_PER_PAGE - 1)
-#else
-# if BITS_PER_PAGE != (1UL << (PAGE_SHIFT + 3))
-#  error "ambiguous BITS_PER_PAGE"
-# endif
-#endif
-#define BITS_PER_LONG_MASK	(BITS_PER_LONG - 1)
-static int bm_clear_surplus(struct drbd_bitmap *b)
-{
-	unsigned long mask;
-	unsigned long *p_addr, *bm;
-	int tmp;
-	int cleared = 0;
-
-	/* number of bits modulo bits per page */
-	tmp = (b->bm_bits & BITS_PER_PAGE_MASK);
-	/* mask the used bits of the word containing the last bit */
-	mask = (1UL << (tmp & BITS_PER_LONG_MASK)) -1;
-	/* bitmap is always stored little endian,
-	 * on disk and in core memory alike */
-	mask = cpu_to_lel(mask);
-
-	p_addr = bm_map_pidx(b, b->bm_number_of_pages - 1);
-	bm = p_addr + (tmp/BITS_PER_LONG);
-	if (mask) {
-		/* If mask != 0, we are not exactly aligned, so bm now points
-		 * to the long containing the last bit.
-		 * If mask == 0, bm already points to the word immediately
-		 * after the last (long word aligned) bit. */
-		cleared = hweight_long(*bm & ~mask);
-		*bm &= mask;
-		bm++;
-	}
+static inline unsigned long find_next_bit_le32(const __le32 *addr)
+{
+	uint32_t val = *addr;
+
+	return val ? __ffs(le32_to_cpu(val)) : 32;
+}
+
+static inline unsigned long find_next_zero_bit_le32(const __le32 *addr)
+{
+	uint32_t val = *addr;
+
+	return val == ~0U ? 32 : ffz(le32_to_cpu(val));
+}
+
+
+static __always_inline unsigned long
+____bm_op(struct drbd_device *device, unsigned int bitmap_index, unsigned long start, unsigned long end,
+	 enum bitmap_operations op, __le32 *buffer)
+{
+	struct drbd_bitmap *bitmap = device->bitmap;
+	unsigned int word32_skip = 32 * bitmap->bm_max_peers;
+	unsigned long total = 0;
+	unsigned long word;
+	unsigned int page, bit_in_page;
+
+	if (end >= bitmap->bm_bits)
+		end = bitmap->bm_bits - 1;
+
+	word = interleaved_word32(bitmap, bitmap_index, start);
+	page = word32_to_page(word);
+	bit_in_page = (word32_in_page(word) << 5) | (start & 31);
+
+	for (; start <= end; page++) {
+		unsigned int count = 0;
+		void *addr;
+
+		addr = bm_map(bitmap, page);
+		if (((start & 31) && (start | 31) <= end) || op == BM_OP_TEST) {
+			unsigned int last = bit_in_page | 31;
+
+			switch (op) {
+			default:
+				do {
+					switch (op) {
+					case BM_OP_CLEAR:
+						if (__test_and_clear_bit_le(bit_in_page, addr))
+							count++;
+						break;
+					case BM_OP_SET:
+						if (!__test_and_set_bit_le(bit_in_page, addr))
+							count++;
+						break;
+					case BM_OP_COUNT:
+						if (test_bit_le(bit_in_page, addr))
+							total++;
+						break;
+					case BM_OP_TEST:
+						total = !!test_bit_le(bit_in_page, addr);
+						bm_unmap(bitmap, addr);
+						return total;
+					default:
+						break;
+					}
+					bit_in_page++;
+				} while (bit_in_page <= last);
+				break;
+			case BM_OP_MERGE:
+			case BM_OP_EXTRACT:
+				BUG();
+				break;
+			case BM_OP_FIND_BIT:
+				count = find_next_bit_le(addr, last + 1, bit_in_page);
+				if (count < last + 1)
+					goto found;
+				bit_in_page = last + 1;
+				break;
+			case BM_OP_FIND_ZERO_BIT:
+				count = find_next_zero_bit_le(addr, last + 1, bit_in_page);
+				if (count < last + 1)
+					goto found;
+				bit_in_page = last + 1;
+				break;
+			}
+			start = (start | 31) + 1;
+			bit_in_page += word32_skip - 32;
+			if (bit_in_page >= BITS_PER_PAGE)
+				goto next_page;
+		}
+
+		while (start + 31 <= end) {
+			__le32 *p = (__le32 *)addr + (bit_in_page >> 5);
+
+			switch (op) {
+			case BM_OP_CLEAR:
+				count += hweight32(*p);
+				*p = 0;
+				break;
+			case BM_OP_SET:
+				count += hweight32(~*p);
+				*p = -1;
+				break;
+			case BM_OP_TEST:
+				BUG();
+				break;
+			case BM_OP_COUNT:
+				total += hweight32(*p);
+				break;
+			case BM_OP_MERGE:
+				count += hweight32(~*p & *buffer);
+				*p |= *buffer++;
+				break;
+			case BM_OP_EXTRACT:
+				*buffer++ = *p;
+				break;
+			case BM_OP_FIND_BIT:
+				count = find_next_bit_le32(p);
+				if (count < 32) {
+					count += bit_in_page;
+					goto found;
+				}
+				break;
+			case BM_OP_FIND_ZERO_BIT:
+				count = find_next_zero_bit_le32(p);
+				if (count < 32) {
+					count += bit_in_page;
+					goto found;
+				}
+				break;
+			}
+			start += 32;
+			bit_in_page += word32_skip;
+			if (bit_in_page >= BITS_PER_PAGE)
+				goto next_page;
+		}
 
-	if (BITS_PER_LONG == 32 && ((bm - p_addr) & 1) == 1) {
-		/* on a 32bit arch, we may need to zero out
-		 * a padding long to align with a 64bit remote */
-		cleared += hweight_long(*bm);
-		*bm = 0;
+		/* don't overrun buffers with MERGE or EXTRACT,
+		 * jump to the kunmap and then out... */
+		if (start > end)
+			goto next_page;
+
+		switch (op) {
+		default:
+			while (start <= end) {
+				switch (op) {
+				case BM_OP_CLEAR:
+					if (__test_and_clear_bit_le(bit_in_page, addr))
+						count++;
+					break;
+				case BM_OP_SET:
+					if (!__test_and_set_bit_le(bit_in_page, addr))
+						count++;
+					break;
+				case BM_OP_COUNT:
+					if (test_bit_le(bit_in_page, addr))
+						total++;
+					break;
+				default:
+					break;
+				}
+				start++;
+				bit_in_page++;
+			}
+			break;
+		case BM_OP_MERGE:
+			{
+				__le32 *p = (__le32 *)addr + (bit_in_page >> 5);
+				__le32 b = *buffer++ & cpu_to_le32((1 << (end - start + 1)) - 1);
+
+				count += hweight32(~*p & b);
+				*p |= b;
+
+				start = end + 1;
+			}
+			break;
+		case BM_OP_EXTRACT:
+			{
+				__le32 *p = (__le32 *)addr + (bit_in_page >> 5);
+
+				*buffer++ = *p & cpu_to_le32((1 << (end - start + 1)) - 1);
+				start = end + 1;
+			}
+			break;
+		case BM_OP_FIND_BIT:
+			{
+				unsigned int last = bit_in_page + (end - start);
+
+				count = find_next_bit_le(addr, last + 1, bit_in_page);
+				if (count < last + 1)
+					goto found;
+				start = end + 1;
+			}
+			break;
+		case BM_OP_FIND_ZERO_BIT:
+			{
+				unsigned int last = bit_in_page + (end - start);
+				count = find_next_zero_bit_le(addr, last + 1, bit_in_page);
+				if (count < last + 1)
+					goto found;
+				start = end + 1;
+			}
+			break;
+		}
+
+	    next_page:
+		bm_unmap(bitmap, addr);
+		bit_in_page -= BITS_PER_PAGE;
+		switch (op) {
+		case BM_OP_CLEAR:
+			if (count) {
+				bm_set_page_lazy_writeout(bitmap, page);
+				total += count;
+			}
+			break;
+		case BM_OP_SET:
+		case BM_OP_MERGE:
+			if (count) {
+				bm_set_page_need_writeout(bitmap, page);
+				total += count;
+			}
+			break;
+		default:
+			break;
+		}
+		continue;
+
+	    found:
+		bm_unmap(bitmap, addr);
+		return start + count - bit_in_page;
 	}
-	bm_unmap(p_addr);
-	return cleared;
-}
-
-static void bm_set_surplus(struct drbd_bitmap *b)
-{
-	unsigned long mask;
-	unsigned long *p_addr, *bm;
-	int tmp;
-
-	/* number of bits modulo bits per page */
-	tmp = (b->bm_bits & BITS_PER_PAGE_MASK);
-	/* mask the used bits of the word containing the last bit */
-	mask = (1UL << (tmp & BITS_PER_LONG_MASK)) -1;
-	/* bitmap is always stored little endian,
-	 * on disk and in core memory alike */
-	mask = cpu_to_lel(mask);
-
-	p_addr = bm_map_pidx(b, b->bm_number_of_pages - 1);
-	bm = p_addr + (tmp/BITS_PER_LONG);
-	if (mask) {
-		/* If mask != 0, we are not exactly aligned, so bm now points
-		 * to the long containing the last bit.
-		 * If mask == 0, bm already points to the word immediately
-		 * after the last (long word aligned) bit. */
-		*bm |= ~mask;
-		bm++;
+	switch (op) {
+	case BM_OP_CLEAR:
+		if (total)
+			bitmap->bm_set[bitmap_index] -= total;
+		break;
+	case BM_OP_SET:
+	case BM_OP_MERGE:
+		if (total)
+			bitmap->bm_set[bitmap_index] += total;
+		break;
+	case BM_OP_FIND_BIT:
+	case BM_OP_FIND_ZERO_BIT:
+		total = DRBD_END_OF_BITMAP;
+		break;
+	default:
+		break;
 	}
+	return total;
+}
+
+/* Returns the number of bits changed.  */
+static __always_inline unsigned long
+__bm_op(struct drbd_device *device, unsigned int bitmap_index, unsigned long start, unsigned long end,
+	enum bitmap_operations op, __le32 *buffer)
+{
+	struct drbd_bitmap *bitmap = device->bitmap;
 
-	if (BITS_PER_LONG == 32 && ((bm - p_addr) & 1) == 1) {
-		/* on a 32bit arch, we may need to zero out
-		 * a padding long to align with a 64bit remote */
-		*bm = ~0UL;
+	if (!expect(device, bitmap))
+		return 1;
+	if (!expect(device, bitmap->bm_pages))
+		return 0;
+
+	if (!bitmap->bm_bits)
+		return 0;
+
+	if (bitmap->bm_task_pid != task_pid_nr(current)) {
+		switch (op) {
+		case BM_OP_CLEAR:
+			if (bitmap->bm_flags & BM_LOCK_CLEAR)
+				bm_print_lock_info(device, bitmap_index, op);
+			break;
+		case BM_OP_SET:
+		case BM_OP_MERGE:
+			if (bitmap->bm_flags & BM_LOCK_SET)
+				bm_print_lock_info(device, bitmap_index, op);
+			break;
+		case BM_OP_TEST:
+		case BM_OP_COUNT:
+		case BM_OP_EXTRACT:
+		case BM_OP_FIND_BIT:
+		case BM_OP_FIND_ZERO_BIT:
+			if (bitmap->bm_flags & BM_LOCK_TEST)
+				bm_print_lock_info(device, bitmap_index, op);
+			break;
+		}
 	}
-	bm_unmap(p_addr);
+	return ____bm_op(device, bitmap_index, start, end, op, buffer);
 }
 
+static __always_inline unsigned long
+bm_op(struct drbd_device *device, unsigned int bitmap_index, unsigned long start, unsigned long end,
+      enum bitmap_operations op, __le32 *buffer)
+{
+	struct drbd_bitmap *bitmap = device->bitmap;
+	unsigned long irq_flags;
+	unsigned long count;
+
+	spin_lock_irqsave(&bitmap->bm_lock, irq_flags);
+	count = __bm_op(device, bitmap_index, start, end, op, buffer);
+	spin_unlock_irqrestore(&bitmap->bm_lock, irq_flags);
+	return count;
+}
+
+#ifdef BITMAP_DEBUG
+#define bm_op(device, bitmap_index, start, end, op, buffer) \
+	({ unsigned long ret; \
+	   drbd_info(device, "%s: bm_op(..., %u, %lu, %lu, %u, %p)\n", \
+		     __func__, bitmap_index, start, end, op, buffer); \
+	   ret = bm_op(device, bitmap_index, start, end, op, buffer); \
+	   drbd_info(device, "= %lu\n", ret); \
+	   ret; })
+
+#define __bm_op(device, bitmap_index, start, end, op, buffer) \
+	({ unsigned long ret; \
+	   drbd_info(device, "%s: __bm_op(..., %u, %lu, %lu, %u, %p)\n", \
+		     __func__, bitmap_index, start, end, op, buffer); \
+	   ret = __bm_op(device, bitmap_index, start, end, op, buffer); \
+	   drbd_info(device, "= %lu\n", ret); \
+	   ret; })
+#endif
+
+#ifdef BITMAP_DEBUG
+#define ___bm_op(device, bitmap_index, start, end, op, buffer) \
+	({ unsigned long ret; \
+	   drbd_info(device, "%s: ___bm_op(..., %u, %lu, %lu, %u, %p)\n", \
+		     __func__, bitmap_index, start, end, op, buffer); \
+	   ret = ____bm_op(device, bitmap_index, start, end, op, buffer); \
+	   drbd_info(device, "= %lu\n", ret); \
+	   ret; })
+#else
+#define ___bm_op(device, bitmap_index, start, end, op, buffer) \
+	____bm_op(device, bitmap_index, start, end, op, buffer)
+#endif
+
 /* you better not modify the bitmap while this is running,
  * or its results will be stale */
-static unsigned long bm_count_bits(struct drbd_bitmap *b)
-{
-	unsigned long *p_addr;
-	unsigned long bits = 0;
-	unsigned long mask = (1UL << (b->bm_bits & BITS_PER_LONG_MASK)) -1;
-	int idx, last_word;
-
-	/* all but last page */
-	for (idx = 0; idx < b->bm_number_of_pages - 1; idx++) {
-		p_addr = __bm_map_pidx(b, idx);
-		bits += bitmap_weight(p_addr, BITS_PER_PAGE);
-		__bm_unmap(p_addr);
-		cond_resched();
-	}
-	/* last (or only) page */
-	last_word = ((b->bm_bits - 1) & BITS_PER_PAGE_MASK) >> LN2_BPL;
-	p_addr = __bm_map_pidx(b, idx);
-	bits += bitmap_weight(p_addr, last_word * BITS_PER_LONG);
-	p_addr[last_word] &= cpu_to_lel(mask);
-	bits += hweight_long(p_addr[last_word]);
-	/* 32bit arch, may have an unused padding long */
-	if (BITS_PER_LONG == 32 && (last_word & 1) == 0)
-		p_addr[last_word+1] = 0;
-	__bm_unmap(p_addr);
-	return bits;
-}
-
-/* offset and len in long words.*/
-static void bm_memset(struct drbd_bitmap *b, size_t offset, int c, size_t len)
-{
-	unsigned long *p_addr, *bm;
-	unsigned int idx;
-	size_t do_now, end;
-
-	end = offset + len;
-
-	if (end > b->bm_words) {
-		pr_alert("bm_memset end > bm_words\n");
-		return;
-	}
+static void bm_count_bits(struct drbd_device *device)
+{
+	struct drbd_bitmap *bitmap = device->bitmap;
+	unsigned int bitmap_index;
+
+	for (bitmap_index = 0; bitmap_index < bitmap->bm_max_peers; bitmap_index++) {
+		unsigned long bit = 0, bits_set = 0;
 
-	while (offset < end) {
-		do_now = min_t(size_t, ALIGN(offset + 1, LWPP), end) - offset;
-		idx = bm_word_to_page_idx(b, offset);
-		p_addr = bm_map_pidx(b, idx);
-		bm = p_addr + MLPP(offset);
-		if (bm+do_now > p_addr + LWPP) {
-			pr_alert("BUG BUG BUG! p_addr:%p bm:%p do_now:%d\n",
-			       p_addr, bm, (int)do_now);
-		} else
-			memset(bm, c, do_now * sizeof(long));
-		bm_unmap(p_addr);
-		bm_set_page_need_writeout(b->bm_pages[idx]);
-		offset += do_now;
+		while (bit < bitmap->bm_bits) {
+			unsigned long last_bit = last_bit_on_page(bitmap, bitmap_index, bit);
+
+			bits_set += ___bm_op(device, bitmap_index, bit, last_bit, BM_OP_COUNT, NULL);
+			bit = last_bit + 1;
+			cond_resched();
+		}
+		bitmap->bm_set[bitmap_index] = bits_set;
 	}
 }
 
 /* For the layout, see comment above drbd_md_set_sector_offsets(). */
-static u64 drbd_md_on_disk_bits(struct drbd_backing_dev *ldev)
+static u64 drbd_md_on_disk_bits(struct drbd_device *device)
 {
-	u64 bitmap_sectors;
+	struct drbd_backing_dev *ldev = device->ldev;
+	u64 bitmap_sectors, word64_on_disk;
 	if (ldev->md.al_offset == 8)
 		bitmap_sectors = ldev->md.md_size_sect - ldev->md.bm_offset;
 	else
 		bitmap_sectors = ldev->md.al_offset - ldev->md.bm_offset;
-	return bitmap_sectors << (9 + 3);
+
+	/* for interoperability between 32bit and 64bit architectures,
+	 * we round on 64bit words.  FIXME do we still need this? */
+	word64_on_disk = bitmap_sectors << (9 - 3); /* x * (512/8) */
+	do_div(word64_on_disk, ldev->md.max_peers);
+	return word64_on_disk << 6; /* x * 64 */;
 }
 
 /*
@@ -627,116 +895,151 @@ static u64 drbd_md_on_disk_bits(struct drbd_backing_dev *ldev)
  * In case this is actually a resize, we copy the old bitmap into the new one.
  * Otherwise, the bitmap is initialized to all bits set.
  */
-int drbd_bm_resize(struct drbd_device *device, sector_t capacity, int set_new_bits)
+int drbd_bm_resize(struct drbd_device *device, sector_t capacity, bool set_new_bits)
 {
 	struct drbd_bitmap *b = device->bitmap;
-	unsigned long bits, words, owords, obits;
+	unsigned long bits, words, obits;
 	unsigned long want, have, onpages; /* number of pages */
-	struct page **npages, **opages = NULL;
+	struct page **npages = NULL, **opages = NULL;
+	void *bm_on_pmem = NULL;
 	int err = 0;
 	bool growing;
 
-	if (!expect(device, b))
-		return -ENOMEM;
-
-	drbd_bm_lock(device, "resize", BM_LOCKED_MASK);
-
-	drbd_info(device, "drbd_bm_resize called with capacity == %llu\n",
-			(unsigned long long)capacity);
+	drbd_bm_lock(device, "resize", BM_LOCK_ALL);
 
 	if (capacity == b->bm_dev_capacity)
 		goto out;
 
 	if (capacity == 0) {
+		unsigned int bitmap_index;
+
 		spin_lock_irq(&b->bm_lock);
 		opages = b->bm_pages;
 		onpages = b->bm_number_of_pages;
-		owords = b->bm_words;
+		drbd_info(device, "Freeing bitmap of size %llu KiB\n", PAGES_TO_KIB(onpages));
 		b->bm_pages = NULL;
-		b->bm_number_of_pages =
-		b->bm_set   =
-		b->bm_bits  =
-		b->bm_words =
+		b->bm_number_of_pages = 0;
+		for (bitmap_index = 0; bitmap_index < b->bm_max_peers; bitmap_index++)
+			b->bm_set[bitmap_index] = 0;
+		b->bm_bits = 0;
+		b->bm_bits_4k = 0;
+		b->bm_words = 0;
 		b->bm_dev_capacity = 0;
 		spin_unlock_irq(&b->bm_lock);
-		bm_free_pages(opages, onpages);
-		bm_vk_free(opages);
+		if (!(b->bm_flags & BM_ON_DAX_PMEM)) {
+			bm_free_pages(opages, onpages);
+			kvfree(opages);
+		}
 		goto out;
 	}
-	bits  = BM_SECT_TO_BIT(ALIGN(capacity, BM_SECT_PER_BIT));
-
-	/* if we would use
-	   words = ALIGN(bits,BITS_PER_LONG) >> LN2_BPL;
-	   a 32bit host could present the wrong number of words
-	   to a 64bit host.
-	*/
-	words = ALIGN(bits, 64) >> LN2_BPL;
+	bits  = bm_sect_to_bit(b, ALIGN(capacity, bm_sect_per_bit(b)));
+	words = (ALIGN(bits, 64) * b->bm_max_peers) / BITS_PER_LONG;
 
+	want = PFN_UP(words * sizeof(long));
+	have = b->bm_number_of_pages;
 	if (get_ldev(device)) {
-		u64 bits_on_disk = drbd_md_on_disk_bits(device->ldev);
-		put_ldev(device);
+		u64 bits_on_disk = drbd_md_on_disk_bits(device);
 		if (bits > bits_on_disk) {
-			drbd_info(device, "bits = %lu\n", bits);
-			drbd_info(device, "bits_on_disk = %llu\n", bits_on_disk);
+			put_ldev(device);
+			drbd_err(device, "Not enough space for bitmap: %lu > %lu\n",
+				(unsigned long)bits, (unsigned long)bits_on_disk);
 			err = -ENOSPC;
 			goto out;
 		}
+		if (drbd_md_dax_active(device->ldev)) {
+			drbd_info(device, "DAX/PMEM bitmap has size %llu KiB\n",
+				  PAGES_TO_KIB(want));
+			bm_on_pmem = drbd_dax_bitmap(device, want);
+		}
+		put_ldev(device);
 	}
 
-	want = PFN_UP(words*sizeof(long));
-	have = b->bm_number_of_pages;
-	if (want == have) {
-		D_ASSERT(device, b->bm_pages != NULL);
-		npages = b->bm_pages;
-	} else {
-		if (drbd_insert_fault(device, DRBD_FAULT_BM_ALLOC))
-			npages = NULL;
-		else
-			npages = bm_realloc_pages(b, want);
-	}
+	if (!bm_on_pmem) {
+		if (want == have) {
+			D_ASSERT(device, b->bm_pages != NULL);
+			drbd_info(device, "Bitmap size remains %llu KiB\n", PAGES_TO_KIB(have));
+			npages = b->bm_pages;
+		} else {
+			if (have == 0) {
+				drbd_info(device, "Allocating %llu KiB for new bitmap\n",
+						PAGES_TO_KIB(want));
+			} else if (want > have) {
+				drbd_info(device, "Allocating %llu KiB for bitmap, new size %llu KiB\n",
+						PAGES_TO_KIB(want - have), PAGES_TO_KIB(want));
+			}
 
-	if (!npages) {
-		err = -ENOMEM;
-		goto out;
+			if (drbd_insert_fault(device, DRBD_FAULT_BM_ALLOC))
+				npages = NULL;
+			else
+				npages = bm_realloc_pages(device, want);
+		}
+
+		if (!npages) {
+			err = -ENOMEM;
+			goto out;
+		}
 	}
 
 	spin_lock_irq(&b->bm_lock);
-	opages = b->bm_pages;
-	owords = b->bm_words;
 	obits  = b->bm_bits;
 
 	growing = bits > obits;
-	if (opages && growing && set_new_bits)
-		bm_set_surplus(b);
 
-	b->bm_pages = npages;
+	if (bm_on_pmem) {
+		if (b->bm_on_pmem) {
+			void *src = b->bm_on_pmem;
+			memmove(bm_on_pmem, src, b->bm_words * sizeof(long));
+			arch_wb_cache_pmem(bm_on_pmem, b->bm_words * sizeof(long));
+		} else {
+			/* We are attaching a bitmap on PMEM. Since the memory
+			 * is persistent, the bitmap is still valid. Do not
+			 * overwrite it. */
+			growing = false;
+		}
+		b->bm_on_pmem = bm_on_pmem;
+		b->bm_flags |= BM_ON_DAX_PMEM;
+	} else {
+		opages = b->bm_pages;
+		b->bm_pages = npages;
+	}
 	b->bm_number_of_pages = want;
-	b->bm_bits  = bits;
+	b->bm_bits = bits;
+	b->bm_bits_4k = sect_to_bit(ALIGN(capacity, sect_per_bit(BM_BLOCK_SHIFT_4k)),
+				BM_BLOCK_SHIFT_4k);
 	b->bm_words = words;
 	b->bm_dev_capacity = capacity;
 
 	if (growing) {
-		if (set_new_bits) {
-			bm_memset(b, owords, 0xff, words-owords);
-			b->bm_set += bits - obits;
-		} else
-			bm_memset(b, owords, 0x00, words-owords);
+		unsigned int bitmap_index;
 
+		for (bitmap_index = 0; bitmap_index < b->bm_max_peers; bitmap_index++) {
+			unsigned long bm_set = b->bm_set[bitmap_index];
+
+			if (set_new_bits) {
+				___bm_op(device, bitmap_index, obits, -1UL, BM_OP_SET, NULL);
+				bm_set += bits - obits;
+			} else {
+				___bm_op(device, bitmap_index, obits, -1UL, BM_OP_CLEAR, NULL);
+			}
+
+			b->bm_set[bitmap_index] = bm_set;
+		}
 	}
 
-	if (want < have) {
+	if (want < have && !(b->bm_flags & BM_ON_DAX_PMEM)) {
 		/* implicit: (opages != NULL) && (opages != npages) */
+		drbd_info(device, "Freeing %llu KiB from bitmap, new size %llu KiB\n",
+				PAGES_TO_KIB(have - want), PAGES_TO_KIB(want));
 		bm_free_pages(opages + want, have - want);
 	}
 
-	(void)bm_clear_surplus(b);
-
 	spin_unlock_irq(&b->bm_lock);
 	if (opages != npages)
-		bm_vk_free(opages);
+		kvfree(opages);
 	if (!growing)
-		b->bm_set = bm_count_bits(b);
-	drbd_info(device, "resync bitmap: bits=%lu words=%lu pages=%lu\n", bits, words, want);
+		bm_count_bits(device);
+	drbd_info(device, "resync bitmap: bits=%lu bits_4k=%lu words=%lu pages=%lu\n",
+			bits, b->bm_bits_4k, words, want);
 
  out:
 	drbd_bm_unlock(device);
@@ -748,10 +1051,8 @@ int drbd_bm_resize(struct drbd_device *device, sector_t capacity, int set_new_bi
  * leaving this function...
  * we still need to lock it, since it is important that this returns
  * bm_set == 0 precisely.
- *
- * maybe bm_set should be atomic_t ?
  */
-unsigned long _drbd_bm_total_weight(struct drbd_device *device)
+unsigned long _drbd_bm_total_weight(struct drbd_device *device, int bitmap_index)
 {
 	struct drbd_bitmap *b = device->bitmap;
 	unsigned long s;
@@ -763,172 +1064,98 @@ unsigned long _drbd_bm_total_weight(struct drbd_device *device)
 		return 0;
 
 	spin_lock_irqsave(&b->bm_lock, flags);
-	s = b->bm_set;
+	s = b->bm_set[bitmap_index];
 	spin_unlock_irqrestore(&b->bm_lock, flags);
 
 	return s;
 }
 
-unsigned long drbd_bm_total_weight(struct drbd_device *device)
+unsigned long drbd_bm_total_weight(struct drbd_peer_device *peer_device)
 {
+	struct drbd_device *device = peer_device->device;
 	unsigned long s;
+
+	if (peer_device->bitmap_index == -1)
+		return 0;
+
 	/* if I don't have a disk, I don't know about out-of-sync status */
 	if (!get_ldev_if_state(device, D_NEGOTIATING))
 		return 0;
-	s = _drbd_bm_total_weight(device);
+	s = _drbd_bm_total_weight(device, peer_device->bitmap_index);
 	put_ldev(device);
 	return s;
 }
 
+/* Returns the number of unsigned long words per peer */
 size_t drbd_bm_words(struct drbd_device *device)
 {
 	struct drbd_bitmap *b = device->bitmap;
+
 	if (!expect(device, b))
 		return 0;
 	if (!expect(device, b->bm_pages))
 		return 0;
 
-	return b->bm_words;
+	return b->bm_words / b->bm_max_peers;
 }
 
 unsigned long drbd_bm_bits(struct drbd_device *device)
 {
 	struct drbd_bitmap *b = device->bitmap;
+
 	if (!expect(device, b))
 		return 0;
 
 	return b->bm_bits;
 }
 
+unsigned long drbd_bm_bits_4k(struct drbd_device *device)
+{
+	struct drbd_bitmap *b = device->bitmap;
+
+	if (!expect(device, b))
+		return 0;
+
+	return b->bm_bits_4k;
+}
+
 /* merge number words from buffer into the bitmap starting at offset.
  * buffer[i] is expected to be little endian unsigned long.
  * bitmap must be locked by drbd_bm_lock.
  * currently only used from receive_bitmap.
  */
-void drbd_bm_merge_lel(struct drbd_device *device, size_t offset, size_t number,
+void drbd_bm_merge_lel(struct drbd_peer_device *peer_device, size_t offset, size_t number,
 			unsigned long *buffer)
 {
-	struct drbd_bitmap *b = device->bitmap;
-	unsigned long *p_addr, *bm;
-	unsigned long word, bits;
-	unsigned int idx;
-	size_t end, do_now;
-
-	end = offset + number;
-
-	if (!expect(device, b))
-		return;
-	if (!expect(device, b->bm_pages))
-		return;
-	if (number == 0)
-		return;
-	WARN_ON(offset >= b->bm_words);
-	WARN_ON(end    >  b->bm_words);
+	unsigned long start, end;
 
-	spin_lock_irq(&b->bm_lock);
-	while (offset < end) {
-		do_now = min_t(size_t, ALIGN(offset+1, LWPP), end) - offset;
-		idx = bm_word_to_page_idx(b, offset);
-		p_addr = bm_map_pidx(b, idx);
-		bm = p_addr + MLPP(offset);
-		offset += do_now;
-		while (do_now--) {
-			bits = hweight_long(*bm);
-			word = *bm | *buffer++;
-			*bm++ = word;
-			b->bm_set += hweight_long(word) - bits;
-		}
-		bm_unmap(p_addr);
-		bm_set_page_need_writeout(b->bm_pages[idx]);
-	}
-	/* with 32bit <-> 64bit cross-platform connect
-	 * this is only correct for current usage,
-	 * where we _know_ that we are 64 bit aligned,
-	 * and know that this function is used in this way, too...
-	 */
-	if (end == b->bm_words)
-		b->bm_set -= bm_clear_surplus(b);
-	spin_unlock_irq(&b->bm_lock);
+	start = offset * BITS_PER_LONG;
+	end = start + number * BITS_PER_LONG - 1;
+	bm_op(peer_device->device, peer_device->bitmap_index, start, end, BM_OP_MERGE, (__le32 *)buffer);
 }
 
 /* copy number words from the bitmap starting at offset into the buffer.
  * buffer[i] will be little endian unsigned long.
  */
-void drbd_bm_get_lel(struct drbd_device *device, size_t offset, size_t number,
+void drbd_bm_get_lel(struct drbd_peer_device *peer_device, size_t offset, size_t number,
 		     unsigned long *buffer)
 {
-	struct drbd_bitmap *b = device->bitmap;
-	unsigned long *p_addr, *bm;
-	size_t end, do_now;
-
-	end = offset + number;
+	unsigned long start, end;
 
-	if (!expect(device, b))
-		return;
-	if (!expect(device, b->bm_pages))
-		return;
-
-	spin_lock_irq(&b->bm_lock);
-	if ((offset >= b->bm_words) ||
-	    (end    >  b->bm_words) ||
-	    (number <= 0))
-		drbd_err(device, "offset=%lu number=%lu bm_words=%lu\n",
-			(unsigned long)	offset,
-			(unsigned long)	number,
-			(unsigned long) b->bm_words);
-	else {
-		while (offset < end) {
-			do_now = min_t(size_t, ALIGN(offset+1, LWPP), end) - offset;
-			p_addr = bm_map_pidx(b, bm_word_to_page_idx(b, offset));
-			bm = p_addr + MLPP(offset);
-			offset += do_now;
-			while (do_now--)
-				*buffer++ = *bm++;
-			bm_unmap(p_addr);
-		}
-	}
-	spin_unlock_irq(&b->bm_lock);
-}
-
-/* set all bits in the bitmap */
-void drbd_bm_set_all(struct drbd_device *device)
-{
-	struct drbd_bitmap *b = device->bitmap;
-	if (!expect(device, b))
-		return;
-	if (!expect(device, b->bm_pages))
-		return;
-
-	spin_lock_irq(&b->bm_lock);
-	bm_memset(b, 0, 0xff, b->bm_words);
-	(void)bm_clear_surplus(b);
-	b->bm_set = b->bm_bits;
-	spin_unlock_irq(&b->bm_lock);
+	start = offset * BITS_PER_LONG;
+	end = start + number * BITS_PER_LONG - 1;
+	bm_op(peer_device->device, peer_device->bitmap_index, start, end, BM_OP_EXTRACT, (__le32 *)buffer);
 }
 
-/* clear all bits in the bitmap */
-void drbd_bm_clear_all(struct drbd_device *device)
-{
-	struct drbd_bitmap *b = device->bitmap;
-	if (!expect(device, b))
-		return;
-	if (!expect(device, b->bm_pages))
-		return;
-
-	spin_lock_irq(&b->bm_lock);
-	bm_memset(b, 0, 0, b->bm_words);
-	b->bm_set = 0;
-	spin_unlock_irq(&b->bm_lock);
-}
 
 static void drbd_bm_aio_ctx_destroy(struct kref *kref)
 {
 	struct drbd_bm_aio_ctx *ctx = container_of(kref, struct drbd_bm_aio_ctx, kref);
 	unsigned long flags;
 
-	spin_lock_irqsave(&ctx->device->resource->req_lock, flags);
+	spin_lock_irqsave(&ctx->device->pending_bmio_lock, flags);
 	list_del(&ctx->list);
-	spin_unlock_irqrestore(&ctx->device->resource->req_lock, flags);
+	spin_unlock_irqrestore(&ctx->device->pending_bmio_lock, flags);
 	put_ldev(ctx->device);
 	kfree(ctx);
 }
@@ -936,25 +1163,28 @@ static void drbd_bm_aio_ctx_destroy(struct kref *kref)
 /* bv_page may be a copy, or may be the original */
 static void drbd_bm_endio(struct bio *bio)
 {
+	/* ldev_ref_transfer: ldev ref from bio submit in bitmap I/O path */
 	struct drbd_bm_aio_ctx *ctx = bio->bi_private;
 	struct drbd_device *device = ctx->device;
 	struct drbd_bitmap *b = device->bitmap;
-	unsigned int idx = bm_page_to_idx(bio_first_page_all(bio));
+	unsigned int idx = bm_page_to_idx(bio->bi_io_vec[0].bv_page);
+
+	blk_status_t status = bio->bi_status;
 
 	if ((ctx->flags & BM_AIO_COPY_PAGES) == 0 &&
 	    !bm_test_page_unchanged(b->bm_pages[idx]))
 		drbd_warn(device, "bitmap page idx %u changed during IO!\n", idx);
 
-	if (bio->bi_status) {
+	if (status) {
 		/* ctx error will hold the completed-last non-zero error code,
 		 * in case error codes differ. */
-		ctx->error = blk_status_to_errno(bio->bi_status);
+		ctx->error = blk_status_to_errno(status);
 		bm_set_page_io_err(b->bm_pages[idx]);
 		/* Not identical to on disk version of it.
 		 * Is BM_PAGE_IO_ERROR enough? */
-		if (drbd_ratelimit())
+		if (drbd_device_ratelimit(device, BACKEND))
 			drbd_err(device, "IO ERROR %d on bitmap page idx %u\n",
-					bio->bi_status, idx);
+				 status, idx);
 	} else {
 		bm_clear_page_io_err(b->bm_pages[idx]);
 		dynamic_drbd_dbg(device, "bitmap page idx %u completed\n", idx);
@@ -987,17 +1217,17 @@ static inline sector_t drbd_md_last_bitmap_sector(struct drbd_backing_dev *bdev)
 	}
 }
 
-static void bm_page_io_async(struct drbd_bm_aio_ctx *ctx, int page_nr) __must_hold(local)
+static void bm_page_io_async(struct drbd_bm_aio_ctx *ctx, int page_nr)
 {
+	struct bio *bio;
 	struct drbd_device *device = ctx->device;
-	enum req_op op = ctx->flags & BM_AIO_READ ? REQ_OP_READ : REQ_OP_WRITE;
 	struct drbd_bitmap *b = device->bitmap;
-	struct bio *bio;
 	struct page *page;
 	sector_t last_bm_sect;
 	sector_t first_bm_sect;
 	sector_t on_disk_sector;
 	unsigned int len;
+	enum req_op op = ctx->flags & BM_AIO_READ ? REQ_OP_READ : REQ_OP_WRITE;
 
 	first_bm_sect = device->ldev->md.md_offset + device->ldev->md.bm_offset;
 	on_disk_sector = first_bm_sect + (((sector_t)page_nr) << (PAGE_SHIFT-SECTOR_SHIFT));
@@ -1013,9 +1243,9 @@ static void bm_page_io_async(struct drbd_bm_aio_ctx *ctx, int page_nr) __must_ho
 		else
 			len = PAGE_SIZE;
 	} else {
-		if (drbd_ratelimit()) {
+		if (drbd_device_ratelimit(device, METADATA)) {
 			drbd_err(device, "Invalid offset during on-disk bitmap access: "
-				 "page idx %u, sector %llu\n", page_nr, on_disk_sector);
+				 "page idx %u, sector %llu\n", page_nr, (unsigned long long) on_disk_sector);
 		}
 		ctx->error = -EIO;
 		bm_set_page_io_err(b->bm_pages[page_nr]);
@@ -1040,35 +1270,57 @@ static void bm_page_io_async(struct drbd_bm_aio_ctx *ctx, int page_nr) __must_ho
 		bm_store_page_idx(page, page_nr);
 	} else
 		page = b->bm_pages[page_nr];
+
 	bio = bio_alloc_bioset(device->ldev->md_bdev, 1, op, GFP_NOIO,
-			&drbd_md_io_bio_set);
+		&drbd_md_io_bio_set);
 	bio->bi_iter.bi_sector = on_disk_sector;
 	__bio_add_page(bio, page, len, 0);
 	bio->bi_private = ctx;
 	bio->bi_end_io = drbd_bm_endio;
 
 	if (drbd_insert_fault(device, (op == REQ_OP_WRITE) ? DRBD_FAULT_MD_WR : DRBD_FAULT_MD_RD)) {
-		bio_io_error(bio);
+		bio->bi_status = BLK_STS_IOERR;
+		bio_endio(bio);
 	} else {
 		submit_bio(bio);
+		if (op == REQ_OP_WRITE)
+			device->bm_writ_cnt++;
 		/* this should not count as user activity and cause the
 		 * resync to throttle -- see drbd_rs_should_slow_down(). */
 		atomic_add(len >> 9, &device->rs_sect_ev);
 	}
 }
 
-/*
- * bm_rw: read/write the whole bitmap from/to its on disk location.
+/**
+ * bm_rw_range() - read/write the specified range of bitmap pages
+ * @device: drbd device this bitmap is associated with
+ * @start_page: start of bitmap page indices to process
+ * @end_page: end of bitmap page indices to process
+ * @flags: BM_AIO_*, see struct bm_aio_ctx.
+ *
+ * Silently limits end_page to the current bitmap size.
+ *
+ * We don't want to special case on logical_block_size of the backend device,
+ * so we submit PAGE_SIZE aligned pieces.
+ * Note that on "most" systems, PAGE_SIZE is 4k.
+ *
+ * In case this becomes an issue on systems with larger PAGE_SIZE,
+ * we may want to change this again to do 4k aligned 4k pieces.
  */
-static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned lazy_writeout_upper_idx) __must_hold(local)
+static int bm_rw_range(struct drbd_device *device, unsigned int start_page, unsigned int end_page,
+		       unsigned int flags)
 {
 	struct drbd_bm_aio_ctx *ctx;
 	struct drbd_bitmap *b = device->bitmap;
-	unsigned int num_pages, i, count = 0;
+	unsigned int i, count = 0;
 	unsigned long now;
-	char ppb[10];
 	int err = 0;
 
+	if (b->bm_flags & BM_ON_DAX_PMEM) {
+		if (flags & (BM_AIO_WRITE_HINTED | BM_AIO_WRITE_ALL_PAGES | BM_AIO_WRITE_LAZY))
+			arch_wb_cache_pmem(b->bm_on_pmem, b->bm_words * sizeof(long));
+		return 0;
+	}
 	/*
 	 * We are protected against bitmap disappearing/resizing by holding an
 	 * ldev reference (caller must have called get_ldev()).
@@ -1078,6 +1330,10 @@ static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned
 	 * as we submit copies of pages anyways.
 	 */
 
+	/* if we reach this, we should have at least *some* bitmap pages. */
+	if (!expect(device, b->bm_number_of_pages))
+		return -ENODEV;
+
 	ctx = kmalloc_obj(struct drbd_bm_aio_ctx, GFP_NOIO);
 	if (!ctx)
 		return -ENOMEM;
@@ -1092,29 +1348,33 @@ static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned
 		.kref = KREF_INIT(2),
 	};
 
-	if (!get_ldev_if_state(device, D_ATTACHING)) {  /* put is in drbd_bm_aio_ctx_destroy() */
-		drbd_err(device, "ASSERT FAILED: get_ldev_if_state() == 1 in bm_rw()\n");
+	if (!expect(device, get_ldev_if_state(device, D_ATTACHING))) {  /* put is in drbd_bm_aio_ctx_destroy() */
 		kfree(ctx);
 		return -ENODEV;
 	}
-	/* Here D_ATTACHING is sufficient since drbd_bm_read() is called only from
-	   drbd_adm_attach(), after device->ldev was assigned. */
+	/* Here, D_ATTACHING is sufficient because drbd_bm_read() is only
+	 * called from drbd_adm_attach(), after device->ldev has been assigned.
+	 *
+	 * The corresponding put_ldev() happens in bm_aio_ctx_destroy().
+	 */
 
 	if (0 == (ctx->flags & ~BM_AIO_READ))
-		WARN_ON(!(BM_LOCKED_MASK & b->bm_flags));
+		WARN_ON(!(b->bm_flags & BM_LOCK_ALL));
 
-	spin_lock_irq(&device->resource->req_lock);
-	list_add_tail(&ctx->list, &device->pending_bitmap_io);
-	spin_unlock_irq(&device->resource->req_lock);
+	if (end_page >= b->bm_number_of_pages)
+		end_page = b->bm_number_of_pages - 1;
 
-	num_pages = b->bm_number_of_pages;
+	spin_lock_irq(&device->pending_bmio_lock);
+	list_add_tail(&ctx->list, &device->pending_bitmap_io);
+	spin_unlock_irq(&device->pending_bmio_lock);
 
 	now = jiffies;
 
-	/* let the layers below us try to merge these bios... */
+	blk_start_plug(&ctx->bm_aio_plug);
+	/* implicit unplug if scheduled for whatever reason */
 
 	if (flags & BM_AIO_READ) {
-		for (i = 0; i < num_pages; i++) {
+		for (i = start_page; i <= end_page; i++) {
 			atomic_inc(&ctx->in_flight);
 			bm_page_io_async(ctx, i);
 			++count;
@@ -1125,7 +1385,7 @@ static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned
 		unsigned int hint;
 		for (hint = 0; hint < b->n_bitmap_hints; hint++) {
 			i = b->al_bitmap_hints[hint];
-			if (i >= num_pages) /* == -1U: no hint here. */
+			if (i > end_page)
 				continue;
 			/* Several AL-extents may point to the same page. */
 			if (!test_and_clear_bit(BM_PAGE_HINT_WRITEOUT,
@@ -1139,10 +1399,9 @@ static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned
 			++count;
 		}
 	} else {
-		for (i = 0; i < num_pages; i++) {
-			/* ignore completely unchanged pages */
-			if (lazy_writeout_upper_idx && i == lazy_writeout_upper_idx)
-				break;
+		for (i = start_page; i <= end_page; i++) {
+			/* ignore completely unchanged pages,
+			 * unless specifically requested to write ALL pages */
 			if (!(flags & BM_AIO_WRITE_ALL_PAGES) &&
 			    bm_test_page_unchanged(b->bm_pages[i])) {
 				dynamic_drbd_dbg(device, "skipped bm write for idx %u\n", i);
@@ -1150,7 +1409,7 @@ static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned
 			}
 			/* during lazy writeout,
 			 * ignore those pages not marked for lazy writeout. */
-			if (lazy_writeout_upper_idx &&
+			if ((flags & BM_AIO_WRITE_LAZY) &&
 			    !bm_test_page_lazy_writeout(b->bm_pages[i])) {
 				dynamic_drbd_dbg(device, "skipped bm lazy write for idx %u\n", i);
 				continue;
@@ -1161,6 +1420,8 @@ static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned
 			cond_resched();
 		}
 	}
+	/* explicit unplug, we are done submitting */
+	blk_finish_plug(&ctx->bm_aio_plug);
 
 	/*
 	 * We initialize ctx->in_flight to one to make sure drbd_bm_endio
@@ -1170,13 +1431,14 @@ static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned
 	 * no need to wait.  Still, we need to put the kref associated with the
 	 * "in_flight reached zero, all done" event.
 	 */
-	if (!atomic_dec_and_test(&ctx->in_flight))
+	if (!atomic_dec_and_test(&ctx->in_flight)) {
+		/* ldev_safe: get_ldev_if_state() above, put_ldev in drbd_bm_aio_ctx_destroy() */
 		wait_until_done_or_force_detached(device, device->ldev, &ctx->done);
-	else
+	} else
 		kref_put(&ctx->kref, &drbd_bm_aio_ctx_destroy);
 
-	/* summary for global bitmap IO */
-	if (flags == 0) {
+	/* summary stats for global bitmap IO */
+	if ((flags & BM_AIO_NO_STATS) == 0 && count) {
 		unsigned int ms = jiffies_to_msecs(jiffies - now);
 		if (ms > 5) {
 			drbd_info(device, "bitmap %s of %u pages took %u ms\n",
@@ -1186,63 +1448,106 @@ static int bm_rw(struct drbd_device *device, const unsigned int flags, unsigned
 	}
 
 	if (ctx->error) {
-		drbd_alert(device, "we had at least one MD IO ERROR during bitmap IO\n");
-		drbd_chk_io_error(device, 1, DRBD_META_IO_ERROR);
+		drbd_err(device, "we had at least one MD IO ERROR during bitmap IO\n");
+		drbd_handle_io_error(device, DRBD_META_IO_ERROR);
 		err = -EIO; /* ctx->error ? */
 	}
 
 	if (atomic_read(&ctx->in_flight))
 		err = -EIO; /* Disk timeout/force-detach during IO... */
 
-	now = jiffies;
 	if (flags & BM_AIO_READ) {
-		b->bm_set = bm_count_bits(b);
-		drbd_info(device, "recounting of set bits took additional %lu jiffies\n",
-		     jiffies - now);
+		unsigned int ms;
+		now = jiffies;
+		bm_count_bits(device);
+		ms = jiffies_to_msecs(jiffies - now);
+		/* If we can count quickly, there is no need to report this either */
+		if (ms > 3)
+			drbd_info(device, "recounting of set bits took additional %ums\n", ms);
 	}
-	now = b->bm_set;
-
-	if ((flags & ~BM_AIO_READ) == 0)
-		drbd_info(device, "%s (%lu bits) marked out-of-sync by on disk bit-map.\n",
-		     ppsize(ppb, now << (BM_BLOCK_SHIFT-10)), now);
 
 	kref_put(&ctx->kref, &drbd_bm_aio_ctx_destroy);
 	return err;
 }
 
+static int bm_rw(struct drbd_device *device, unsigned flags)
+{
+	return bm_rw_range(device, 0, -1U, flags);
+}
+
 /*
  * drbd_bm_read() - Read the whole bitmap from its on disk location.
  * @device:	DRBD device.
+ * @peer_device: parameter ignored
  */
 int drbd_bm_read(struct drbd_device *device,
-		 struct drbd_peer_device *peer_device) __must_hold(local)
+		 struct drbd_peer_device *peer_device)
+{
+	return bm_rw(device, BM_AIO_READ);
+}
 
+static void push_al_bitmap_hint(struct drbd_device *device, unsigned int page_nr)
 {
-	return bm_rw(device, BM_AIO_READ, 0);
+	struct drbd_bitmap *b = device->bitmap;
+	struct page *page = b->bm_pages[page_nr];
+	BUG_ON(b->n_bitmap_hints >= ARRAY_SIZE(b->al_bitmap_hints));
+	if (!test_and_set_bit(BM_PAGE_HINT_WRITEOUT, &page_private(page)))
+		b->al_bitmap_hints[b->n_bitmap_hints++] = page_nr;
+}
+
+/**
+ * drbd_bm_mark_range_for_writeout() - mark with a "hint" to be considered for writeout
+ * @device:	DRBD device.
+ * @start: 	Start index of the range to mark.
+ * @end:	End index of the range to mark.
+ *
+ * From within an activity log transaction, we mark a few pages with these
+ * hints, then call drbd_bm_write_hinted(), which will only write out changed
+ * pages which are flagged with this mark.
+ */
+void drbd_bm_mark_range_for_writeout(struct drbd_device *device, unsigned long start, unsigned long end)
+{
+	struct drbd_bitmap *bitmap = device->bitmap;
+	unsigned int page_nr, last_page;
+
+	if (bitmap->bm_flags & BM_ON_DAX_PMEM)
+		return;
+
+	if (end >= bitmap->bm_bits)
+		end = bitmap->bm_bits - 1;
+
+	page_nr = bit_to_page_interleaved(bitmap, 0, start);
+	last_page = bit_to_page_interleaved(bitmap, bitmap->bm_max_peers - 1, end);
+	for (; page_nr <= last_page; page_nr++)
+		push_al_bitmap_hint(device, page_nr);
 }
 
+
 /*
  * drbd_bm_write() - Write the whole bitmap to its on disk location.
  * @device:	DRBD device.
+ * @peer_device: parameter ignored
  *
  * Will only write pages that have changed since last IO.
  */
 int drbd_bm_write(struct drbd_device *device,
-		 struct drbd_peer_device *peer_device) __must_hold(local)
+		  struct drbd_peer_device *peer_device)
 {
-	return bm_rw(device, 0, 0);
+	return bm_rw(device, 0);
 }
 
 /*
  * drbd_bm_write_all() - Write the whole bitmap to its on disk location.
- * @device:	DRBD device.
+ * @device:	 DRBD device.
+ * @peer_device: parameter ignored
  *
- * Will write all pages.
+ * Will write all pages. Is used for online resize operations. The
+ * whole bitmap should be written into its new position.
  */
 int drbd_bm_write_all(struct drbd_device *device,
-		struct drbd_peer_device *peer_device) __must_hold(local)
+		      struct drbd_peer_device *peer_device)
 {
-	return bm_rw(device, BM_AIO_WRITE_ALL_PAGES, 0);
+	return bm_rw(device, BM_AIO_WRITE_ALL_PAGES);
 }
 
 /**
@@ -1250,14 +1555,15 @@ int drbd_bm_write_all(struct drbd_device *device,
  * @device:	DRBD device.
  * @upper_idx:	0: write all changed pages; +ve: page index to stop scanning for changed pages
  */
-int drbd_bm_write_lazy(struct drbd_device *device, unsigned upper_idx) __must_hold(local)
+int drbd_bm_write_lazy(struct drbd_device *device, unsigned int upper_idx)
 {
-	return bm_rw(device, BM_AIO_COPY_PAGES, upper_idx);
+	return bm_rw_range(device, 0, upper_idx - 1, BM_AIO_COPY_PAGES | BM_AIO_WRITE_LAZY);
 }
 
 /*
  * drbd_bm_write_copy_pages() - Write the whole bitmap to its on disk location.
  * @device:	DRBD device.
+ * @peer_device: parameter ignored
  *
  * Will only write pages that have changed since last IO.
  * In contrast to drbd_bm_write(), this will copy the bitmap pages
@@ -1267,431 +1573,181 @@ int drbd_bm_write_lazy(struct drbd_device *device, unsigned upper_idx) __must_ho
  * pending resync acks are still being processed.
  */
 int drbd_bm_write_copy_pages(struct drbd_device *device,
-		struct drbd_peer_device *peer_device) __must_hold(local)
+			     struct drbd_peer_device *peer_device)
 {
-	return bm_rw(device, BM_AIO_COPY_PAGES, 0);
+	return bm_rw(device, BM_AIO_COPY_PAGES);
 }
 
 /*
  * drbd_bm_write_hinted() - Write bitmap pages with "hint" marks, if they have changed.
  * @device:	DRBD device.
  */
-int drbd_bm_write_hinted(struct drbd_device *device) __must_hold(local)
-{
-	return bm_rw(device, BM_AIO_WRITE_HINTED | BM_AIO_COPY_PAGES, 0);
-}
-
-/* NOTE
- * find_first_bit returns int, we return unsigned long.
- * For this to work on 32bit arch with bitnumbers > (1<<32),
- * we'd need to return u64, and get a whole lot of other places
- * fixed where we still use unsigned long.
- *
- * this returns a bit number, NOT a sector!
- */
-static unsigned long __bm_find_next(struct drbd_device *device, unsigned long bm_fo,
-	const int find_zero_bit)
+int drbd_bm_write_hinted(struct drbd_device *device)
 {
-	struct drbd_bitmap *b = device->bitmap;
-	unsigned long *p_addr;
-	unsigned long bit_offset;
-	unsigned i;
-
-
-	if (bm_fo > b->bm_bits) {
-		drbd_err(device, "bm_fo=%lu bm_bits=%lu\n", bm_fo, b->bm_bits);
-		bm_fo = DRBD_END_OF_BITMAP;
-	} else {
-		while (bm_fo < b->bm_bits) {
-			/* bit offset of the first bit in the page */
-			bit_offset = bm_fo & ~BITS_PER_PAGE_MASK;
-			p_addr = __bm_map_pidx(b, bm_bit_to_page_idx(b, bm_fo));
-
-			if (find_zero_bit)
-				i = find_next_zero_bit_le(p_addr,
-						PAGE_SIZE*8, bm_fo & BITS_PER_PAGE_MASK);
-			else
-				i = find_next_bit_le(p_addr,
-						PAGE_SIZE*8, bm_fo & BITS_PER_PAGE_MASK);
-
-			__bm_unmap(p_addr);
-			if (i < PAGE_SIZE*8) {
-				bm_fo = bit_offset + i;
-				if (bm_fo >= b->bm_bits)
-					break;
-				goto found;
-			}
-			bm_fo = bit_offset + PAGE_SIZE*8;
-		}
-		bm_fo = DRBD_END_OF_BITMAP;
-	}
- found:
-	return bm_fo;
+	return bm_rw(device, BM_AIO_WRITE_HINTED | BM_AIO_COPY_PAGES);
 }
 
-static unsigned long bm_find_next(struct drbd_device *device,
-	unsigned long bm_fo, const int find_zero_bit)
+unsigned long drbd_bm_find_next(struct drbd_peer_device *peer_device, unsigned long start)
 {
-	struct drbd_bitmap *b = device->bitmap;
-	unsigned long i = DRBD_END_OF_BITMAP;
-
-	if (!expect(device, b))
-		return i;
-	if (!expect(device, b->bm_pages))
-		return i;
-
-	spin_lock_irq(&b->bm_lock);
-	if (BM_DONT_TEST & b->bm_flags)
-		bm_print_lock_info(device);
-
-	i = __bm_find_next(device, bm_fo, find_zero_bit);
-
-	spin_unlock_irq(&b->bm_lock);
-	return i;
+	return bm_op(peer_device->device, peer_device->bitmap_index, start, -1UL,
+		     BM_OP_FIND_BIT, NULL);
 }
 
-unsigned long drbd_bm_find_next(struct drbd_device *device, unsigned long bm_fo)
+/* does not spin_lock_irqsave.
+ * you must take drbd_bm_lock() first */
+unsigned long _drbd_bm_find_next(struct drbd_peer_device *peer_device, unsigned long start)
 {
-	return bm_find_next(device, bm_fo, 0);
+	/* WARN_ON(!(device->b->bm_flags & BM_LOCK_SET)); */
+	return ____bm_op(peer_device->device, peer_device->bitmap_index, start, -1UL,
+		    BM_OP_FIND_BIT, NULL);
 }
 
-#if 0
-/* not yet needed for anything. */
-unsigned long drbd_bm_find_next_zero(struct drbd_device *device, unsigned long bm_fo)
+unsigned long _drbd_bm_find_next_zero(struct drbd_peer_device *peer_device, unsigned long start)
 {
-	return bm_find_next(device, bm_fo, 1);
+	/* WARN_ON(!(device->b->bm_flags & BM_LOCK_SET)); */
+	return ____bm_op(peer_device->device, peer_device->bitmap_index, start, -1UL,
+		    BM_OP_FIND_ZERO_BIT, NULL);
 }
-#endif
 
-/* does not spin_lock_irqsave.
- * you must take drbd_bm_lock() first */
-unsigned long _drbd_bm_find_next(struct drbd_device *device, unsigned long bm_fo)
+unsigned int drbd_bm_set_bits(struct drbd_device *device, unsigned int bitmap_index,
+			      unsigned long start, unsigned long end)
 {
-	/* WARN_ON(!(BM_DONT_SET & device->b->bm_flags)); */
-	return __bm_find_next(device, bm_fo, 0);
+	return bm_op(device, bitmap_index, start, end, BM_OP_SET, NULL);
 }
 
-unsigned long _drbd_bm_find_next_zero(struct drbd_device *device, unsigned long bm_fo)
+static __always_inline void
+__bm_many_bits_op(struct drbd_device *device, unsigned int bitmap_index, unsigned long start, unsigned long end,
+		  enum bitmap_operations op)
 {
-	/* WARN_ON(!(BM_DONT_SET & device->b->bm_flags)); */
-	return __bm_find_next(device, bm_fo, 1);
-}
+	struct drbd_bitmap *bitmap = device->bitmap;
+	unsigned long bit = start;
 
-/* returns number of bits actually changed.
- * for val != 0, we change 0 -> 1, return code positive
- * for val == 0, we change 1 -> 0, return code negative
- * wants bitnr, not sector.
- * expected to be called for only a few bits (e - s about BITS_PER_LONG).
- * Must hold bitmap lock already. */
-static int __bm_change_bits_to(struct drbd_device *device, const unsigned long s,
-	unsigned long e, int val)
-{
-	struct drbd_bitmap *b = device->bitmap;
-	unsigned long *p_addr = NULL;
-	unsigned long bitnr;
-	unsigned int last_page_nr = -1U;
-	int c = 0;
-	int changed_total = 0;
-
-	if (e >= b->bm_bits) {
-		drbd_err(device, "ASSERT FAILED: bit_s=%lu bit_e=%lu bm_bits=%lu\n",
-				s, e, b->bm_bits);
-		e = b->bm_bits ? b->bm_bits -1 : 0;
-	}
-	for (bitnr = s; bitnr <= e; bitnr++) {
-		unsigned int page_nr = bm_bit_to_page_idx(b, bitnr);
-		if (page_nr != last_page_nr) {
-			if (p_addr)
-				__bm_unmap(p_addr);
-			if (c < 0)
-				bm_set_page_lazy_writeout(b->bm_pages[last_page_nr]);
-			else if (c > 0)
-				bm_set_page_need_writeout(b->bm_pages[last_page_nr]);
-			changed_total += c;
-			c = 0;
-			p_addr = __bm_map_pidx(b, page_nr);
-			last_page_nr = page_nr;
-		}
-		if (val)
-			c += (0 == __test_and_set_bit_le(bitnr & BITS_PER_PAGE_MASK, p_addr));
-		else
-			c -= (0 != __test_and_clear_bit_le(bitnr & BITS_PER_PAGE_MASK, p_addr));
-	}
-	if (p_addr)
-		__bm_unmap(p_addr);
-	if (c < 0)
-		bm_set_page_lazy_writeout(b->bm_pages[last_page_nr]);
-	else if (c > 0)
-		bm_set_page_need_writeout(b->bm_pages[last_page_nr]);
-	changed_total += c;
-	b->bm_set += changed_total;
-	return changed_total;
-}
-
-/* returns number of bits actually changed.
- * for val != 0, we change 0 -> 1, return code positive
- * for val == 0, we change 1 -> 0, return code negative
- * wants bitnr, not sector */
-static int bm_change_bits_to(struct drbd_device *device, const unsigned long s,
-	const unsigned long e, int val)
-{
-	unsigned long flags;
-	struct drbd_bitmap *b = device->bitmap;
-	int c = 0;
+	spin_lock_irq(&bitmap->bm_lock);
 
-	if (!expect(device, b))
-		return 1;
-	if (!expect(device, b->bm_pages))
-		return 0;
+	if (end >= bitmap->bm_bits)
+		end = bitmap->bm_bits - 1;
 
-	spin_lock_irqsave(&b->bm_lock, flags);
-	if ((val ? BM_DONT_SET : BM_DONT_CLEAR) & b->bm_flags)
-		bm_print_lock_info(device);
+	while (bit <= end) {
+		unsigned long last_bit = last_bit_on_page(bitmap, bitmap_index, bit);
 
-	c = __bm_change_bits_to(device, s, e, val);
+		if (end < last_bit)
+			last_bit = end;
 
-	spin_unlock_irqrestore(&b->bm_lock, flags);
-	return c;
+		__bm_op(device, bitmap_index, bit, last_bit, op, NULL);
+		bit = last_bit + 1;
+		spin_unlock_irq(&bitmap->bm_lock);
+		if (need_resched())
+			cond_resched();
+		spin_lock_irq(&bitmap->bm_lock);
+	}
+	spin_unlock_irq(&bitmap->bm_lock);
 }
 
-/* returns number of bits changed 0 -> 1 */
-int drbd_bm_set_bits(struct drbd_device *device, const unsigned long s, const unsigned long e)
+void drbd_bm_set_many_bits(struct drbd_peer_device *peer_device, unsigned long start, unsigned long end)
 {
-	return bm_change_bits_to(device, s, e, 1);
+	if (peer_device->bitmap_index == -1)
+		return;
+	__bm_many_bits_op(peer_device->device, peer_device->bitmap_index, start, end, BM_OP_SET);
 }
 
-/* returns number of bits changed 1 -> 0 */
-int drbd_bm_clear_bits(struct drbd_device *device, const unsigned long s, const unsigned long e)
+void drbd_bm_clear_many_bits(struct drbd_peer_device *peer_device, unsigned long start, unsigned long end)
 {
-	return -bm_change_bits_to(device, s, e, 0);
+	if (peer_device->bitmap_index == -1)
+		return;
+	__bm_many_bits_op(peer_device->device, peer_device->bitmap_index, start, end, BM_OP_CLEAR);
 }
 
-/* sets all bits in full words,
- * from first_word up to, but not including, last_word */
-static inline void bm_set_full_words_within_one_page(struct drbd_bitmap *b,
-		int page_nr, int first_word, int last_word)
+void
+_drbd_bm_clear_many_bits(struct drbd_device *device, int bitmap_index, unsigned long start, unsigned long end)
 {
-	int i;
-	int bits;
-	int changed = 0;
-	unsigned long *paddr = kmap_atomic(b->bm_pages[page_nr]);
-
-	/* I think it is more cache line friendly to hweight_long then set to ~0UL,
-	 * than to first bitmap_weight() all words, then bitmap_fill() all words */
-	for (i = first_word; i < last_word; i++) {
-		bits = hweight_long(paddr[i]);
-		paddr[i] = ~0UL;
-		changed += BITS_PER_LONG - bits;
-	}
-	kunmap_atomic(paddr);
-	if (changed) {
-		/* We only need lazy writeout, the information is still in the
-		 * remote bitmap as well, and is reconstructed during the next
-		 * bitmap exchange, if lost locally due to a crash. */
-		bm_set_page_lazy_writeout(b->bm_pages[page_nr]);
-		b->bm_set += changed;
-	}
+	__bm_many_bits_op(device, bitmap_index, start, end, BM_OP_CLEAR);
 }
 
-/* Same thing as drbd_bm_set_bits,
- * but more efficient for a large bit range.
- * You must first drbd_bm_lock().
- * Can be called to set the whole bitmap in one go.
- * Sets bits from s to e _inclusive_. */
-void _drbd_bm_set_bits(struct drbd_device *device, const unsigned long s, const unsigned long e)
+void
+_drbd_bm_set_many_bits(struct drbd_device *device, int bitmap_index, unsigned long start, unsigned long end)
 {
-	/* First set_bit from the first bit (s)
-	 * up to the next long boundary (sl),
-	 * then assign full words up to the last long boundary (el),
-	 * then set_bit up to and including the last bit (e).
-	 *
-	 * Do not use memset, because we must account for changes,
-	 * so we need to loop over the words with hweight() anyways.
-	 */
-	struct drbd_bitmap *b = device->bitmap;
-	unsigned long sl = ALIGN(s,BITS_PER_LONG);
-	unsigned long el = (e+1) & ~((unsigned long)BITS_PER_LONG-1);
-	int first_page;
-	int last_page;
-	int page_nr;
-	int first_word;
-	int last_word;
-
-	if (e - s <= 3*BITS_PER_LONG) {
-		/* don't bother; el and sl may even be wrong. */
-		spin_lock_irq(&b->bm_lock);
-		__bm_change_bits_to(device, s, e, 1);
-		spin_unlock_irq(&b->bm_lock);
-		return;
-	}
-
-	/* difference is large enough that we can trust sl and el */
-
-	spin_lock_irq(&b->bm_lock);
-
-	/* bits filling the current long */
-	if (sl)
-		__bm_change_bits_to(device, s, sl-1, 1);
-
-	first_page = sl >> (3 + PAGE_SHIFT);
-	last_page = el >> (3 + PAGE_SHIFT);
-
-	/* MLPP: modulo longs per page */
-	/* LWPP: long words per page */
-	first_word = MLPP(sl >> LN2_BPL);
-	last_word = LWPP;
-
-	/* first and full pages, unless first page == last page */
-	for (page_nr = first_page; page_nr < last_page; page_nr++) {
-		bm_set_full_words_within_one_page(device->bitmap, page_nr, first_word, last_word);
-		spin_unlock_irq(&b->bm_lock);
-		cond_resched();
-		first_word = 0;
-		spin_lock_irq(&b->bm_lock);
-	}
-	/* last page (respectively only page, for first page == last page) */
-	last_word = MLPP(el >> LN2_BPL);
-
-	/* consider bitmap->bm_bits = 32768, bitmap->bm_number_of_pages = 1. (or multiples).
-	 * ==> e = 32767, el = 32768, last_page = 2,
-	 * and now last_word = 0.
-	 * We do not want to touch last_page in this case,
-	 * as we did not allocate it, it is not present in bitmap->bm_pages.
-	 */
-	if (last_word)
-		bm_set_full_words_within_one_page(device->bitmap, last_page, first_word, last_word);
-
-	/* possibly trailing bits.
-	 * example: (e & 63) == 63, el will be e+1.
-	 * if that even was the very last bit,
-	 * it would trigger an assert in __bm_change_bits_to()
-	 */
-	if (el <= e)
-		__bm_change_bits_to(device, el, e, 1);
-	spin_unlock_irq(&b->bm_lock);
+	__bm_many_bits_op(device, bitmap_index, start, end, BM_OP_SET);
 }
 
-/* returns bit state
- * wants bitnr, NOT sector.
- * inherently racy... area needs to be locked by means of {al,rs}_lru
- *  1 ... bit set
- *  0 ... bit not set
- * -1 ... first out of bounds access, stop testing for bits!
- */
-int drbd_bm_test_bit(struct drbd_device *device, const unsigned long bitnr)
+/* set all bits in the bitmap */
+void drbd_bm_set_all(struct drbd_device *device)
 {
-	unsigned long flags;
-	struct drbd_bitmap *b = device->bitmap;
-	unsigned long *p_addr;
-	int i;
+	struct drbd_bitmap *bitmap = device->bitmap;
+	unsigned int bitmap_index;
 
-	if (!expect(device, b))
-		return 0;
-	if (!expect(device, b->bm_pages))
-		return 0;
+	for (bitmap_index = 0; bitmap_index < bitmap->bm_max_peers; bitmap_index++)
+		__bm_many_bits_op(device, bitmap_index, 0, -1, BM_OP_SET);
+}
 
-	spin_lock_irqsave(&b->bm_lock, flags);
-	if (BM_DONT_TEST & b->bm_flags)
-		bm_print_lock_info(device);
-	if (bitnr < b->bm_bits) {
-		p_addr = bm_map_pidx(b, bm_bit_to_page_idx(b, bitnr));
-		i = test_bit_le(bitnr & BITS_PER_PAGE_MASK, p_addr) ? 1 : 0;
-		bm_unmap(p_addr);
-	} else if (bitnr == b->bm_bits) {
-		i = -1;
-	} else { /* (bitnr > b->bm_bits) */
-		drbd_err(device, "bitnr=%lu > bm_bits=%lu\n", bitnr, b->bm_bits);
-		i = 0;
-	}
+/* clear all bits in the bitmap */
+void drbd_bm_clear_all(struct drbd_device *device)
+{
+	struct drbd_bitmap *bitmap = device->bitmap;
+	unsigned int bitmap_index;
 
-	spin_unlock_irqrestore(&b->bm_lock, flags);
-	return i;
+	for (bitmap_index = 0; bitmap_index < bitmap->bm_max_peers; bitmap_index++)
+		__bm_many_bits_op(device, bitmap_index, 0, -1, BM_OP_CLEAR);
 }
 
-/* returns number of bits set in the range [s, e] */
-int drbd_bm_count_bits(struct drbd_device *device, const unsigned long s, const unsigned long e)
+unsigned int drbd_bm_clear_bits(struct drbd_device *device, unsigned int bitmap_index,
+				unsigned long start, unsigned long end)
 {
-	unsigned long flags;
-	struct drbd_bitmap *b = device->bitmap;
-	unsigned long *p_addr = NULL;
-	unsigned long bitnr;
-	unsigned int page_nr = -1U;
-	int c = 0;
-
-	/* If this is called without a bitmap, that is a bug.  But just to be
-	 * robust in case we screwed up elsewhere, in that case pretend there
-	 * was one dirty bit in the requested area, so we won't try to do a
-	 * local read there (no bitmap probably implies no disk) */
-	if (!expect(device, b))
-		return 1;
-	if (!expect(device, b->bm_pages))
-		return 1;
-
-	spin_lock_irqsave(&b->bm_lock, flags);
-	if (BM_DONT_TEST & b->bm_flags)
-		bm_print_lock_info(device);
-	for (bitnr = s; bitnr <= e; bitnr++) {
-		unsigned int idx = bm_bit_to_page_idx(b, bitnr);
-		if (page_nr != idx) {
-			page_nr = idx;
-			if (p_addr)
-				bm_unmap(p_addr);
-			p_addr = bm_map_pidx(b, idx);
-		}
-		if (expect(device, bitnr < b->bm_bits))
-			c += (0 != test_bit_le(bitnr - (page_nr << (PAGE_SHIFT+3)), p_addr));
-		else
-			drbd_err(device, "bitnr=%lu bm_bits=%lu\n", bitnr, b->bm_bits);
-	}
-	if (p_addr)
-		bm_unmap(p_addr);
-	spin_unlock_irqrestore(&b->bm_lock, flags);
-	return c;
+	return bm_op(device, bitmap_index, start, end, BM_OP_CLEAR, NULL);
 }
 
 
-/* inherently racy...
- * return value may be already out-of-date when this function returns.
- * but the general usage is that this is only use during a cstate when bits are
- * only cleared, not set, and typically only care for the case when the return
- * value is zero, or we already "locked" this "bitmap extent" by other means.
- *
- * enr is bm-extent number, since we chose to name one sector (512 bytes)
- * worth of the bitmap a "bitmap extent".
- *
- * TODO
- * I think since we use it like a reference count, we should use the real
- * reference count of some bitmap extent element from some lru instead...
- *
- */
-int drbd_bm_e_weight(struct drbd_device *device, unsigned long enr)
-{
-	struct drbd_bitmap *b = device->bitmap;
-	int count, s, e;
-	unsigned long flags;
-	unsigned long *p_addr, *bm;
+/* returns number of bits set in the range [s, e] */
+int drbd_bm_count_bits(struct drbd_device *device, unsigned int bitmap_index, unsigned long s, unsigned long e)
+{
+	return bm_op(device, bitmap_index, s, e, BM_OP_COUNT, NULL);
+}
+
+void drbd_bm_copy_slot(struct drbd_device *device, unsigned int from_index, unsigned int to_index)
+{
+	struct drbd_bitmap *bitmap = device->bitmap;
+	unsigned long word_nr, from_word_nr, to_word_nr, words32_total;
+	unsigned int from_page_nr, to_page_nr, current_page_nr;
+	u32 data_word, *addr;
+
+	words32_total = bitmap->bm_words * sizeof(unsigned long) / sizeof(u32);
+	spin_lock_irq(&bitmap->bm_all_slots_lock);
+	spin_lock(&bitmap->bm_lock);
+
+	bitmap->bm_set[to_index] = 0;
+	current_page_nr = 0;
+	addr = bm_map(bitmap, current_page_nr);
+	for (word_nr = 0; word_nr < words32_total; word_nr += bitmap->bm_max_peers) {
+		from_word_nr = word_nr + from_index;
+		from_page_nr = word32_to_page(from_word_nr);
+		to_word_nr = word_nr + to_index;
+		to_page_nr = word32_to_page(to_word_nr);
+
+		if (current_page_nr != from_page_nr) {
+			bm_unmap(bitmap, addr);
+			spin_unlock(&bitmap->bm_lock);
+			spin_unlock_irq(&bitmap->bm_all_slots_lock);
+			if (need_resched())
+				cond_resched();
+			spin_lock_irq(&bitmap->bm_all_slots_lock);
+			spin_lock(&bitmap->bm_lock);
+			current_page_nr = from_page_nr;
+			addr = bm_map(bitmap, current_page_nr);
+		}
+		data_word = addr[word32_in_page(from_word_nr)];
 
-	if (!expect(device, b))
-		return 0;
-	if (!expect(device, b->bm_pages))
-		return 0;
+		if (current_page_nr != to_page_nr) {
+			bm_unmap(bitmap, addr);
+			current_page_nr = to_page_nr;
+			addr = bm_map(bitmap, current_page_nr);
+		}
 
-	spin_lock_irqsave(&b->bm_lock, flags);
-	if (BM_DONT_TEST & b->bm_flags)
-		bm_print_lock_info(device);
-
-	s = S2W(enr);
-	e = min((size_t)S2W(enr+1), b->bm_words);
-	count = 0;
-	if (s < b->bm_words) {
-		int n = e-s;
-		p_addr = bm_map_pidx(b, bm_word_to_page_idx(b, s));
-		bm = p_addr + MLPP(s);
-		count += bitmap_weight(bm, n * BITS_PER_LONG);
-		bm_unmap(p_addr);
-	} else {
-		drbd_err(device, "start offset (%d) too large in drbd_bm_e_weight\n", s);
+		if (addr[word32_in_page(to_word_nr)] != data_word)
+			bm_set_page_need_writeout(bitmap, current_page_nr);
+		addr[word32_in_page(to_word_nr)] = data_word;
+		bitmap->bm_set[to_index] += hweight32(data_word);
 	}
-	spin_unlock_irqrestore(&b->bm_lock, flags);
-	return count;
+	bm_unmap(bitmap, addr);
+
+	spin_unlock(&bitmap->bm_lock);
+	spin_unlock_irq(&bitmap->bm_all_slots_lock);
 }
-- 
2.53.0

