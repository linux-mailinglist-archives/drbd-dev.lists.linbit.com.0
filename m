Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2540FACEDD9
	for <lists+drbd-dev@lfdr.de>; Thu,  5 Jun 2025 12:39:10 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BD4E416B825;
	Thu,  5 Jun 2025 12:39:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 32E9616B825
	for <drbd-dev@lists.linbit.com>; Thu,  5 Jun 2025 12:38:55 +0200 (CEST)
Received: by mail-ed1-f51.google.com with SMTP id
	4fb4d7f45d1cf-601f278369bso1613279a12.1
	for <drbd-dev@lists.linbit.com>; Thu, 05 Jun 2025 03:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1749119935;
	x=1749724735; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=L1VKVgPyDTD7FcC13I4CKc8IjBxTy3Bp73Mc+aF8JhY=;
	b=EYZiGu03/1pDYX8VcZ5mhhlUU1VkTijWN6v0flP+am8mSsCJ+9F65xlfkFws5awn86
	QvCAeiew2yEhl5oUnXQPWEgBRQSZX9ce6PmP1p61rgWbpihASp4T3WwITtxH0RnFi1yv
	79JhkI8HNCDV7JFLVNDcyjsrZqdHKfhp2De1YB00THgAmdioEUoQQjMWdx08rbt61183
	IM2SBnMk9J0BzNGloeQDNAkcsUMfs4Int7NcFJkrm8lGLrdiNzoHSTSFolwQYB+SD7/i
	F/XGNRNZuYUhpAsS49NV4/3mphHFwWtirQljGcE/Klt0woPyw+k7S5xfXVxWsv5/IzCk
	x+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1749119935; x=1749724735;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=L1VKVgPyDTD7FcC13I4CKc8IjBxTy3Bp73Mc+aF8JhY=;
	b=hiKXYSBc6keg95CFs+/bgm5fVWi3a8HW09OyiJfp4P0McRzoXaAdilN6hD8V1aImGZ
	H/hRXzDUIAiqu3nqMuiw9QBbvwsT6TgOZblps/h43es6ksDm2lmrCS7viV7vgzXXJSNH
	OhWcVVrmt0IcdhqffYHYj1+8rd1TjgMLPqsxCcSB6Tqsz7ciEWwTT8Al0raIrb0DDgBD
	B4TvdStwJUSQRrIMkMvrJW1VE+UkupDHZSNmR3hXlmLUIN6cp+5B72WqK8VaofccA6u9
	Tx68UdrmZem+8xK8YhGyVrV6hfTiZE1RVnTB9e2PMUF6XA0bkWVqh2wKcgeBPa0d1FVo
	lZ2Q==
X-Gm-Message-State: AOJu0YxDjWGVZvfbYpvoq9VpprhTthg1n25DJBuDCml6rRjMhunkiaTg
	nN06nqo0GSIgSb0sU1KJdLaxauP4RcA7CApet+v9EnIZkoaDWZ1wSzfHG2buVJd6Qo9l0w==
X-Gm-Gg: ASbGncvg5sN5PFak82kwVwBNvJcXeKlupg+7Ue3Zk+qTSSPClgTKftPm8rWHZpv2QKL
	5QEhggI2qDx+XgEgEPUktpJvARN/HnFOgo4bhLkzLT8wxOFdbNto5+yAK0njolr+qHYFwYHY9D+
	oHiThp4BqdfSygrzG9k1TFApcwLiPisYoJ+rKxF3Is9oli4U1gowIh4uSMoG757+0WEdo0zDReu
	5xx+mgf6yhbPTT/JIze7oz84IuyjOcZv+2oRX27Q9rj7FxQ71nMLk4K4p7xC1320o+xOvw75CSN
	ALkNKjQIJ+me4SHizX+jv5iBh5O8IRvqrMZrH+Kb9twkUUAFMrpR4skLsDpx/+gcxuf6yMbCUD3
	9ix41o8C3h1jdW3XbGPEqCKR9p8Y1vy1GXvE=
X-Google-Smtp-Source: AGHT+IGclUS1k1su+f50C6wj0i365j7X82QoNxAP8m/+UNr7j/+6qGJjOKZSDyUiJpKR/oUHOHZRew==
X-Received: by 2002:a17:907:9688:b0:ad5:74cd:1824 with SMTP id
	a640c23a62f3a-addf8e3ecfbmr553565566b.38.1749119934953; 
	Thu, 05 Jun 2025 03:38:54 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	a640c23a62f3a-ada6ad6ac6bsm1234670866b.169.2025.06.05.03.38.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Jun 2025 03:38:54 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] drbd: Remove the open-coded page pool
Date: Thu,  5 Jun 2025 12:38:52 +0200
Message-ID: <20250605103852.23029-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

From: Philipp Reisner <philipp.reisner@linbit.com>

If the network stack keeps a reference for too long, DRBD keeps
references on a higher number of pages as a consequence.

Fix all that by no longer relying on page reference counts dropping to
an expected value. Instead, DRBD gives up its reference and lets the
system handle everything else. While at it, remove the open-coded
custom page pool mechanism and use the page_pool included in the
kernel.

Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_int.h      |  39 +----
 drivers/block/drbd/drbd_main.c     |  59 ++-----
 drivers/block/drbd/drbd_receiver.c | 264 ++++-------------------------
 drivers/block/drbd/drbd_worker.c   |  56 ++----
 4 files changed, 71 insertions(+), 347 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index e21492981f7d..f6d6276974ee 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -380,6 +380,9 @@ enum {
 	/* this is/was a write request */
 	__EE_WRITE,
 
+	/* hand back using mempool_free(e, drbd_buffer_page_pool) */
+	__EE_RELEASE_TO_MEMPOOL,
+
 	/* this is/was a write same request */
 	__EE_WRITE_SAME,
 
@@ -402,6 +405,7 @@ enum {
 #define EE_IN_INTERVAL_TREE	(1<<__EE_IN_INTERVAL_TREE)
 #define EE_SUBMITTED		(1<<__EE_SUBMITTED)
 #define EE_WRITE		(1<<__EE_WRITE)
+#define EE_RELEASE_TO_MEMPOOL	(1<<__EE_RELEASE_TO_MEMPOOL)
 #define EE_WRITE_SAME		(1<<__EE_WRITE_SAME)
 #define EE_APPLICATION		(1<<__EE_APPLICATION)
 #define EE_RS_THIN_REQ		(1<<__EE_RS_THIN_REQ)
@@ -858,7 +862,6 @@ struct drbd_device {
 	struct list_head sync_ee;   /* IO in progress (P_RS_DATA_REPLY gets written to disk) */
 	struct list_head done_ee;   /* need to send P_WRITE_ACK */
 	struct list_head read_ee;   /* [RS]P_DATA_REQUEST being read */
-	struct list_head net_ee;    /* zero-copy network send in progress */
 
 	struct list_head resync_reads;
 	atomic_t pp_in_use;		/* allocated from page pool */
@@ -1329,24 +1332,6 @@ extern struct kmem_cache *drbd_al_ext_cache;	/* activity log extents */
 extern mempool_t drbd_request_mempool;
 extern mempool_t drbd_ee_mempool;
 
-/* drbd's page pool, used to buffer data received from the peer,
- * or data requested by the peer.
- *
- * This does not have an emergency reserve.
- *
- * When allocating from this pool, it first takes pages from the pool.
- * Only if the pool is depleted will try to allocate from the system.
- *
- * The assumption is that pages taken from this pool will be processed,
- * and given back, "quickly", and then can be recycled, so we can avoid
- * frequent calls to alloc_page(), and still will be able to make progress even
- * under memory pressure.
- */
-extern struct page *drbd_pp_pool;
-extern spinlock_t   drbd_pp_lock;
-extern int	    drbd_pp_vacant;
-extern wait_queue_head_t drbd_pp_wait;
-
 /* We also need a standard (emergency-reserve backed) page pool
  * for meta data IO (activity log, bitmap).
  * We can keep it global, as long as it is used as "N pages at a time".
@@ -1354,6 +1339,7 @@ extern wait_queue_head_t drbd_pp_wait;
  */
 #define DRBD_MIN_POOL_PAGES	128
 extern mempool_t drbd_md_io_page_pool;
+extern mempool_t drbd_buffer_page_pool;
 
 /* We also need to make sure we get a bio
  * when we need it for housekeeping purposes */
@@ -1488,10 +1474,7 @@ extern struct drbd_peer_request *drbd_alloc_peer_req(struct drbd_peer_device *,
 						     sector_t, unsigned int,
 						     unsigned int,
 						     gfp_t) __must_hold(local);
-extern void __drbd_free_peer_req(struct drbd_device *, struct drbd_peer_request *,
-				 int);
-#define drbd_free_peer_req(m,e) __drbd_free_peer_req(m, e, 0)
-#define drbd_free_net_peer_req(m,e) __drbd_free_peer_req(m, e, 1)
+extern void drbd_free_peer_req(struct drbd_device *device, struct drbd_peer_request *req);
 extern struct page *drbd_alloc_pages(struct drbd_peer_device *, unsigned int, bool);
 extern void _drbd_clear_done_ee(struct drbd_device *device, struct list_head *to_be_freed);
 extern int drbd_connected(struct drbd_peer_device *);
@@ -1610,16 +1593,6 @@ static inline struct page *page_chain_next(struct page *page)
 	for (; page && ({ n = page_chain_next(page); 1; }); page = n)
 
 
-static inline int drbd_peer_req_has_active_page(struct drbd_peer_request *peer_req)
-{
-	struct page *page = peer_req->pages;
-	page_chain_for_each(page) {
-		if (page_count(page) > 1)
-			return 1;
-	}
-	return 0;
-}
-
 static inline union drbd_state drbd_read_state(struct drbd_device *device)
 {
 	struct drbd_resource *resource = device->resource;
diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index ced2cc5f46f2..96ab63896e90 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -114,20 +114,10 @@ struct kmem_cache *drbd_al_ext_cache;	/* activity log extents */
 mempool_t drbd_request_mempool;
 mempool_t drbd_ee_mempool;
 mempool_t drbd_md_io_page_pool;
+mempool_t drbd_buffer_page_pool;
 struct bio_set drbd_md_io_bio_set;
 struct bio_set drbd_io_bio_set;
 
-/* I do not use a standard mempool, because:
-   1) I want to hand out the pre-allocated objects first.
-   2) I want to be able to interrupt sleeping allocation with a signal.
-   Note: This is a single linked list, the next pointer is the private
-	 member of struct page.
- */
-struct page *drbd_pp_pool;
-DEFINE_SPINLOCK(drbd_pp_lock);
-int          drbd_pp_vacant;
-wait_queue_head_t drbd_pp_wait;
-
 DEFINE_RATELIMIT_STATE(drbd_ratelimit_state, 5 * HZ, 5);
 
 static const struct block_device_operations drbd_ops = {
@@ -1611,6 +1601,7 @@ static int _drbd_send_zc_bio(struct drbd_peer_device *peer_device, struct bio *b
 static int _drbd_send_zc_ee(struct drbd_peer_device *peer_device,
 			    struct drbd_peer_request *peer_req)
 {
+	bool use_sendpage = !(peer_req->flags & EE_RELEASE_TO_MEMPOOL);
 	struct page *page = peer_req->pages;
 	unsigned len = peer_req->i.size;
 	int err;
@@ -1619,8 +1610,13 @@ static int _drbd_send_zc_ee(struct drbd_peer_device *peer_device,
 	page_chain_for_each(page) {
 		unsigned l = min_t(unsigned, len, PAGE_SIZE);
 
-		err = _drbd_send_page(peer_device, page, 0, l,
-				      page_chain_next(page) ? MSG_MORE : 0);
+		if (likely(use_sendpage))
+			err = _drbd_send_page(peer_device, page, 0, l,
+					      page_chain_next(page) ? MSG_MORE : 0);
+		else
+			err = _drbd_no_send_page(peer_device, page, 0, l,
+						 page_chain_next(page) ? MSG_MORE : 0);
+
 		if (err)
 			return err;
 		len -= l;
@@ -1962,7 +1958,6 @@ void drbd_init_set_defaults(struct drbd_device *device)
 	INIT_LIST_HEAD(&device->sync_ee);
 	INIT_LIST_HEAD(&device->done_ee);
 	INIT_LIST_HEAD(&device->read_ee);
-	INIT_LIST_HEAD(&device->net_ee);
 	INIT_LIST_HEAD(&device->resync_reads);
 	INIT_LIST_HEAD(&device->resync_work.list);
 	INIT_LIST_HEAD(&device->unplug_work.list);
@@ -2043,7 +2038,6 @@ void drbd_device_cleanup(struct drbd_device *device)
 	D_ASSERT(device, list_empty(&device->sync_ee));
 	D_ASSERT(device, list_empty(&device->done_ee));
 	D_ASSERT(device, list_empty(&device->read_ee));
-	D_ASSERT(device, list_empty(&device->net_ee));
 	D_ASSERT(device, list_empty(&device->resync_reads));
 	D_ASSERT(device, list_empty(&first_peer_device(device)->connection->sender_work.q));
 	D_ASSERT(device, list_empty(&device->resync_work.list));
@@ -2055,19 +2049,11 @@ void drbd_device_cleanup(struct drbd_device *device)
 
 static void drbd_destroy_mempools(void)
 {
-	struct page *page;
-
-	while (drbd_pp_pool) {
-		page = drbd_pp_pool;
-		drbd_pp_pool = (struct page *)page_private(page);
-		__free_page(page);
-		drbd_pp_vacant--;
-	}
-
 	/* D_ASSERT(device, atomic_read(&drbd_pp_vacant)==0); */
 
 	bioset_exit(&drbd_io_bio_set);
 	bioset_exit(&drbd_md_io_bio_set);
+	mempool_exit(&drbd_buffer_page_pool);
 	mempool_exit(&drbd_md_io_page_pool);
 	mempool_exit(&drbd_ee_mempool);
 	mempool_exit(&drbd_request_mempool);
@@ -2086,9 +2072,8 @@ static void drbd_destroy_mempools(void)
 
 static int drbd_create_mempools(void)
 {
-	struct page *page;
 	const int number = (DRBD_MAX_BIO_SIZE/PAGE_SIZE) * drbd_minor_count;
-	int i, ret;
+	int ret;
 
 	/* caches */
 	drbd_request_cache = kmem_cache_create(
@@ -2125,6 +2110,10 @@ static int drbd_create_mempools(void)
 	if (ret)
 		goto Enomem;
 
+	ret = mempool_init_page_pool(&drbd_buffer_page_pool, number, 0);
+	if (ret)
+		goto Enomem;
+
 	ret = mempool_init_slab_pool(&drbd_request_mempool, number,
 				     drbd_request_cache);
 	if (ret)
@@ -2134,15 +2123,6 @@ static int drbd_create_mempools(void)
 	if (ret)
 		goto Enomem;
 
-	for (i = 0; i < number; i++) {
-		page = alloc_page(GFP_HIGHUSER);
-		if (!page)
-			goto Enomem;
-		set_page_private(page, (unsigned long)drbd_pp_pool);
-		drbd_pp_pool = page;
-	}
-	drbd_pp_vacant = number;
-
 	return 0;
 
 Enomem:
@@ -2169,10 +2149,6 @@ static void drbd_release_all_peer_reqs(struct drbd_device *device)
 	rr = drbd_free_peer_reqs(device, &device->done_ee);
 	if (rr)
 		drbd_err(device, "%d EEs in done list found!\n", rr);
-
-	rr = drbd_free_peer_reqs(device, &device->net_ee);
-	if (rr)
-		drbd_err(device, "%d EEs in net list found!\n", rr);
 }
 
 /* caution. no locking. */
@@ -2863,11 +2839,6 @@ static int __init drbd_init(void)
 		return err;
 	}
 
-	/*
-	 * allocate all necessary structs
-	 */
-	init_waitqueue_head(&drbd_pp_wait);
-
 	drbd_proc = NULL; /* play safe for drbd_cleanup */
 	idr_init(&drbd_devices);
 
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index e5a2e5f7887b..fe3d0521de0b 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -33,6 +33,7 @@
 #include <linux/string.h>
 #include <linux/scatterlist.h>
 #include <linux/part_stat.h>
+#include <linux/mempool.h>
 #include "drbd_int.h"
 #include "drbd_protocol.h"
 #include "drbd_req.h"
@@ -63,182 +64,31 @@ static int e_end_block(struct drbd_work *, int);
 
 #define GFP_TRY	(__GFP_HIGHMEM | __GFP_NOWARN)
 
-/*
- * some helper functions to deal with single linked page lists,
- * page->private being our "next" pointer.
- */
-
-/* If at least n pages are linked at head, get n pages off.
- * Otherwise, don't modify head, and return NULL.
- * Locking is the responsibility of the caller.
- */
-static struct page *page_chain_del(struct page **head, int n)
-{
-	struct page *page;
-	struct page *tmp;
-
-	BUG_ON(!n);
-	BUG_ON(!head);
-
-	page = *head;
-
-	if (!page)
-		return NULL;
-
-	while (page) {
-		tmp = page_chain_next(page);
-		if (--n == 0)
-			break; /* found sufficient pages */
-		if (tmp == NULL)
-			/* insufficient pages, don't use any of them. */
-			return NULL;
-		page = tmp;
-	}
-
-	/* add end of list marker for the returned list */
-	set_page_private(page, 0);
-	/* actual return value, and adjustment of head */
-	page = *head;
-	*head = tmp;
-	return page;
-}
-
-/* may be used outside of locks to find the tail of a (usually short)
- * "private" page chain, before adding it back to a global chain head
- * with page_chain_add() under a spinlock. */
-static struct page *page_chain_tail(struct page *page, int *len)
-{
-	struct page *tmp;
-	int i = 1;
-	while ((tmp = page_chain_next(page))) {
-		++i;
-		page = tmp;
-	}
-	if (len)
-		*len = i;
-	return page;
-}
-
-static int page_chain_free(struct page *page)
-{
-	struct page *tmp;
-	int i = 0;
-	page_chain_for_each_safe(page, tmp) {
-		put_page(page);
-		++i;
-	}
-	return i;
-}
-
-static void page_chain_add(struct page **head,
-		struct page *chain_first, struct page *chain_last)
-{
-#if 1
-	struct page *tmp;
-	tmp = page_chain_tail(chain_first, NULL);
-	BUG_ON(tmp != chain_last);
-#endif
-
-	/* add chain to head */
-	set_page_private(chain_last, (unsigned long)*head);
-	*head = chain_first;
-}
-
-static struct page *__drbd_alloc_pages(struct drbd_device *device,
-				       unsigned int number)
+static struct page *__drbd_alloc_pages(unsigned int number)
 {
 	struct page *page = NULL;
 	struct page *tmp = NULL;
 	unsigned int i = 0;
 
-	/* Yes, testing drbd_pp_vacant outside the lock is racy.
-	 * So what. It saves a spin_lock. */
-	if (drbd_pp_vacant >= number) {
-		spin_lock(&drbd_pp_lock);
-		page = page_chain_del(&drbd_pp_pool, number);
-		if (page)
-			drbd_pp_vacant -= number;
-		spin_unlock(&drbd_pp_lock);
-		if (page)
-			return page;
-	}
-
 	/* GFP_TRY, because we must not cause arbitrary write-out: in a DRBD
 	 * "criss-cross" setup, that might cause write-out on some other DRBD,
 	 * which in turn might block on the other node at this very place.  */
 	for (i = 0; i < number; i++) {
-		tmp = alloc_page(GFP_TRY);
+		tmp = mempool_alloc(&drbd_buffer_page_pool, GFP_TRY);
 		if (!tmp)
-			break;
+			goto fail;
 		set_page_private(tmp, (unsigned long)page);
 		page = tmp;
 	}
-
-	if (i == number)
-		return page;
-
-	/* Not enough pages immediately available this time.
-	 * No need to jump around here, drbd_alloc_pages will retry this
-	 * function "soon". */
-	if (page) {
-		tmp = page_chain_tail(page, NULL);
-		spin_lock(&drbd_pp_lock);
-		page_chain_add(&drbd_pp_pool, page, tmp);
-		drbd_pp_vacant += i;
-		spin_unlock(&drbd_pp_lock);
+	return page;
+fail:
+	page_chain_for_each_safe(page, tmp) {
+		set_page_private(page, 0);
+		mempool_free(page, &drbd_buffer_page_pool);
 	}
 	return NULL;
 }
 
-static void reclaim_finished_net_peer_reqs(struct drbd_device *device,
-					   struct list_head *to_be_freed)
-{
-	struct drbd_peer_request *peer_req, *tmp;
-
-	/* The EEs are always appended to the end of the list. Since
-	   they are sent in order over the wire, they have to finish
-	   in order. As soon as we see the first not finished we can
-	   stop to examine the list... */
-
-	list_for_each_entry_safe(peer_req, tmp, &device->net_ee, w.list) {
-		if (drbd_peer_req_has_active_page(peer_req))
-			break;
-		list_move(&peer_req->w.list, to_be_freed);
-	}
-}
-
-static void drbd_reclaim_net_peer_reqs(struct drbd_device *device)
-{
-	LIST_HEAD(reclaimed);
-	struct drbd_peer_request *peer_req, *t;
-
-	spin_lock_irq(&device->resource->req_lock);
-	reclaim_finished_net_peer_reqs(device, &reclaimed);
-	spin_unlock_irq(&device->resource->req_lock);
-	list_for_each_entry_safe(peer_req, t, &reclaimed, w.list)
-		drbd_free_net_peer_req(device, peer_req);
-}
-
-static void conn_reclaim_net_peer_reqs(struct drbd_connection *connection)
-{
-	struct drbd_peer_device *peer_device;
-	int vnr;
-
-	rcu_read_lock();
-	idr_for_each_entry(&connection->peer_devices, peer_device, vnr) {
-		struct drbd_device *device = peer_device->device;
-		if (!atomic_read(&device->pp_in_use_by_net))
-			continue;
-
-		kref_get(&device->kref);
-		rcu_read_unlock();
-		drbd_reclaim_net_peer_reqs(device);
-		kref_put(&device->kref, drbd_destroy_device);
-		rcu_read_lock();
-	}
-	rcu_read_unlock();
-}
-
 /**
  * drbd_alloc_pages() - Returns @number pages, retries forever (or until signalled)
  * @peer_device:	DRBD device.
@@ -263,9 +113,8 @@ struct page *drbd_alloc_pages(struct drbd_peer_device *peer_device, unsigned int
 			      bool retry)
 {
 	struct drbd_device *device = peer_device->device;
-	struct page *page = NULL;
+	struct page *page;
 	struct net_conf *nc;
-	DEFINE_WAIT(wait);
 	unsigned int mxb;
 
 	rcu_read_lock();
@@ -273,37 +122,9 @@ struct page *drbd_alloc_pages(struct drbd_peer_device *peer_device, unsigned int
 	mxb = nc ? nc->max_buffers : 1000000;
 	rcu_read_unlock();
 
-	if (atomic_read(&device->pp_in_use) < mxb)
-		page = __drbd_alloc_pages(device, number);
-
-	/* Try to keep the fast path fast, but occasionally we need
-	 * to reclaim the pages we lended to the network stack. */
-	if (page && atomic_read(&device->pp_in_use_by_net) > 512)
-		drbd_reclaim_net_peer_reqs(device);
-
-	while (page == NULL) {
-		prepare_to_wait(&drbd_pp_wait, &wait, TASK_INTERRUPTIBLE);
-
-		drbd_reclaim_net_peer_reqs(device);
-
-		if (atomic_read(&device->pp_in_use) < mxb) {
-			page = __drbd_alloc_pages(device, number);
-			if (page)
-				break;
-		}
-
-		if (!retry)
-			break;
-
-		if (signal_pending(current)) {
-			drbd_warn(device, "drbd_alloc_pages interrupted!\n");
-			break;
-		}
-
-		if (schedule_timeout(HZ/10) == 0)
-			mxb = UINT_MAX;
-	}
-	finish_wait(&drbd_pp_wait, &wait);
+	if (atomic_read(&device->pp_in_use) >= mxb)
+		schedule_timeout_interruptible(HZ / 10);
+	page = __drbd_alloc_pages(number);
 
 	if (page)
 		atomic_add(number, &device->pp_in_use);
@@ -314,29 +135,25 @@ struct page *drbd_alloc_pages(struct drbd_peer_device *peer_device, unsigned int
  * Is also used from inside an other spin_lock_irq(&resource->req_lock);
  * Either links the page chain back to the global pool,
  * or returns all pages to the system. */
-static void drbd_free_pages(struct drbd_device *device, struct page *page, int is_net)
+static void drbd_free_pages(struct drbd_device *device, struct page *page)
 {
-	atomic_t *a = is_net ? &device->pp_in_use_by_net : &device->pp_in_use;
-	int i;
+	struct page *tmp;
+	int i = 0;
 
 	if (page == NULL)
 		return;
 
-	if (drbd_pp_vacant > (DRBD_MAX_BIO_SIZE/PAGE_SIZE) * drbd_minor_count)
-		i = page_chain_free(page);
-	else {
-		struct page *tmp;
-		tmp = page_chain_tail(page, &i);
-		spin_lock(&drbd_pp_lock);
-		page_chain_add(&drbd_pp_pool, page, tmp);
-		drbd_pp_vacant += i;
-		spin_unlock(&drbd_pp_lock);
-	}
-	i = atomic_sub_return(i, a);
+	page_chain_for_each_safe(page, tmp) {
+		set_page_private(page, 0);
+		if (page_count(page) == 1)
+			mempool_free(page, &drbd_buffer_page_pool);
+		else
+			put_page(page);
+		i++;
+	}
+	i = atomic_sub_return(i, &device->pp_in_use);
 	if (i < 0)
-		drbd_warn(device, "ASSERTION FAILED: %s: %d < 0\n",
-			is_net ? "pp_in_use_by_net" : "pp_in_use", i);
-	wake_up(&drbd_pp_wait);
+		drbd_warn(device, "ASSERTION FAILED: pp_in_use: %d < 0\n", i);
 }
 
 /*
@@ -380,6 +197,8 @@ drbd_alloc_peer_req(struct drbd_peer_device *peer_device, u64 id, sector_t secto
 					gfpflags_allow_blocking(gfp_mask));
 		if (!page)
 			goto fail;
+		if (!mempool_is_saturated(&drbd_buffer_page_pool))
+			peer_req->flags |= EE_RELEASE_TO_MEMPOOL;
 	}
 
 	memset(peer_req, 0, sizeof(*peer_req));
@@ -403,13 +222,12 @@ drbd_alloc_peer_req(struct drbd_peer_device *peer_device, u64 id, sector_t secto
 	return NULL;
 }
 
-void __drbd_free_peer_req(struct drbd_device *device, struct drbd_peer_request *peer_req,
-		       int is_net)
+void drbd_free_peer_req(struct drbd_device *device, struct drbd_peer_request *peer_req)
 {
 	might_sleep();
 	if (peer_req->flags & EE_HAS_DIGEST)
 		kfree(peer_req->digest);
-	drbd_free_pages(device, peer_req->pages, is_net);
+	drbd_free_pages(device, peer_req->pages);
 	D_ASSERT(device, atomic_read(&peer_req->pending_bios) == 0);
 	D_ASSERT(device, drbd_interval_empty(&peer_req->i));
 	if (!expect(device, !(peer_req->flags & EE_CALL_AL_COMPLETE_IO))) {
@@ -424,14 +242,13 @@ int drbd_free_peer_reqs(struct drbd_device *device, struct list_head *list)
 	LIST_HEAD(work_list);
 	struct drbd_peer_request *peer_req, *t;
 	int count = 0;
-	int is_net = list == &device->net_ee;
 
 	spin_lock_irq(&device->resource->req_lock);
 	list_splice_init(list, &work_list);
 	spin_unlock_irq(&device->resource->req_lock);
 
 	list_for_each_entry_safe(peer_req, t, &work_list, w.list) {
-		__drbd_free_peer_req(device, peer_req, is_net);
+		drbd_free_peer_req(device, peer_req);
 		count++;
 	}
 	return count;
@@ -443,18 +260,13 @@ int drbd_free_peer_reqs(struct drbd_device *device, struct list_head *list)
 static int drbd_finish_peer_reqs(struct drbd_device *device)
 {
 	LIST_HEAD(work_list);
-	LIST_HEAD(reclaimed);
 	struct drbd_peer_request *peer_req, *t;
 	int err = 0;
 
 	spin_lock_irq(&device->resource->req_lock);
-	reclaim_finished_net_peer_reqs(device, &reclaimed);
 	list_splice_init(&device->done_ee, &work_list);
 	spin_unlock_irq(&device->resource->req_lock);
 
-	list_for_each_entry_safe(peer_req, t, &reclaimed, w.list)
-		drbd_free_net_peer_req(device, peer_req);
-
 	/* possible callbacks here:
 	 * e_end_block, and e_end_resync_block, e_send_superseded.
 	 * all ignore the last argument.
@@ -1975,7 +1787,7 @@ static int drbd_drain_block(struct drbd_peer_device *peer_device, int data_size)
 		data_size -= len;
 	}
 	kunmap(page);
-	drbd_free_pages(peer_device->device, page, 0);
+	drbd_free_pages(peer_device->device, page);
 	return err;
 }
 
@@ -5220,16 +5032,6 @@ static int drbd_disconnected(struct drbd_peer_device *peer_device)
 		put_ldev(device);
 	}
 
-	/* tcp_close and release of sendpage pages can be deferred.  I don't
-	 * want to use SO_LINGER, because apparently it can be deferred for
-	 * more than 20 seconds (longest time I checked).
-	 *
-	 * Actually we don't care for exactly when the network stack does its
-	 * put_page(), but release our reference on these pages right here.
-	 */
-	i = drbd_free_peer_reqs(device, &device->net_ee);
-	if (i)
-		drbd_info(device, "net_ee not empty, killed %u entries\n", i);
 	i = atomic_read(&device->pp_in_use_by_net);
 	if (i)
 		drbd_info(device, "pp_in_use_by_net = %d, expected 0\n", i);
@@ -5976,8 +5778,6 @@ int drbd_ack_receiver(struct drbd_thread *thi)
 	while (get_t_state(thi) == RUNNING) {
 		drbd_thread_current_set_cpu(thi);
 
-		conn_reclaim_net_peer_reqs(connection);
-
 		if (test_and_clear_bit(SEND_PING, &connection->flags)) {
 			if (drbd_send_ping(connection)) {
 				drbd_err(connection, "drbd_send_ping has failed\n");
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 4352a50fbb3f..d74064bb64be 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -1029,22 +1029,6 @@ int drbd_resync_finished(struct drbd_peer_device *peer_device)
 	return 1;
 }
 
-/* helper */
-static void move_to_net_ee_or_free(struct drbd_device *device, struct drbd_peer_request *peer_req)
-{
-	if (drbd_peer_req_has_active_page(peer_req)) {
-		/* This might happen if sendpage() has not finished */
-		int i = PFN_UP(peer_req->i.size);
-		atomic_add(i, &device->pp_in_use_by_net);
-		atomic_sub(i, &device->pp_in_use);
-		spin_lock_irq(&device->resource->req_lock);
-		list_add_tail(&peer_req->w.list, &device->net_ee);
-		spin_unlock_irq(&device->resource->req_lock);
-		wake_up(&drbd_pp_wait);
-	} else
-		drbd_free_peer_req(device, peer_req);
-}
-
 /**
  * w_e_end_data_req() - Worker callback, to send a P_DATA_REPLY packet in response to a P_DATA_REQUEST
  * @w:		work object.
@@ -1058,9 +1042,8 @@ int w_e_end_data_req(struct drbd_work *w, int cancel)
 	int err;
 
 	if (unlikely(cancel)) {
-		drbd_free_peer_req(device, peer_req);
-		dec_unacked(device);
-		return 0;
+		err = 0;
+		goto out;
 	}
 
 	if (likely((peer_req->flags & EE_WAS_ERROR) == 0)) {
@@ -1073,12 +1056,12 @@ int w_e_end_data_req(struct drbd_work *w, int cancel)
 		err = drbd_send_ack(peer_device, P_NEG_DREPLY, peer_req);
 	}
 
-	dec_unacked(device);
-
-	move_to_net_ee_or_free(device, peer_req);
-
 	if (unlikely(err))
 		drbd_err(device, "drbd_send_block() failed\n");
+out:
+	dec_unacked(device);
+	drbd_free_peer_req(device, peer_req);
+
 	return err;
 }
 
@@ -1119,9 +1102,8 @@ int w_e_end_rsdata_req(struct drbd_work *w, int cancel)
 	int err;
 
 	if (unlikely(cancel)) {
-		drbd_free_peer_req(device, peer_req);
-		dec_unacked(device);
-		return 0;
+		err = 0;
+		goto out;
 	}
 
 	if (get_ldev_if_state(device, D_FAILED)) {
@@ -1154,13 +1136,12 @@ int w_e_end_rsdata_req(struct drbd_work *w, int cancel)
 		/* update resync data with failure */
 		drbd_rs_failed_io(peer_device, peer_req->i.sector, peer_req->i.size);
 	}
-
-	dec_unacked(device);
-
-	move_to_net_ee_or_free(device, peer_req);
-
 	if (unlikely(err))
 		drbd_err(device, "drbd_send_block() failed\n");
+out:
+	dec_unacked(device);
+	drbd_free_peer_req(device, peer_req);
+
 	return err;
 }
 
@@ -1175,9 +1156,8 @@ int w_e_end_csum_rs_req(struct drbd_work *w, int cancel)
 	int err, eq = 0;
 
 	if (unlikely(cancel)) {
-		drbd_free_peer_req(device, peer_req);
-		dec_unacked(device);
-		return 0;
+		err = 0;
+		goto out;
 	}
 
 	if (get_ldev(device)) {
@@ -1219,12 +1199,12 @@ int w_e_end_csum_rs_req(struct drbd_work *w, int cancel)
 		if (drbd_ratelimit())
 			drbd_err(device, "Sending NegDReply. I guess it gets messy.\n");
 	}
-
-	dec_unacked(device);
-	move_to_net_ee_or_free(device, peer_req);
-
 	if (unlikely(err))
 		drbd_err(device, "drbd_send_block/ack() failed\n");
+out:
+	dec_unacked(device);
+	drbd_free_peer_req(device, peer_req);
+
 	return err;
 }
 

base-commit: b02f5eedbcabe6e1982fdd7ff3f0ac5d1fddc68f
-- 
2.49.0

