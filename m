Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE5F5B2874
	for <lists+drbd-dev@lfdr.de>; Thu,  8 Sep 2022 23:22:02 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2F0D542177D;
	Thu,  8 Sep 2022 23:22:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from aragorn.cowesettanimalhospital.com
	(wsip-72-215-235-61.ri.ri.cox.net [72.215.235.61])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 05AFD420FB8
	for <drbd-dev@lists.linbit.com>; Thu,  8 Sep 2022 23:21:24 +0200 (CEST)
Received: by aragorn.cowesettanimalhospital.com (Postfix, from userid 1200)
	id 4737A1407BD; Thu,  8 Sep 2022 17:13:53 -0400 (EDT)
From: Michael D Labriola <veggiemike@sourceruckus.org>
To: drbd-dev@lists.linbit.com
Date: Thu,  8 Sep 2022 17:13:37 -0400
Message-Id: <20220908211337.17090-4-veggiemike@sourceruckus.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220908211337.17090-1-veggiemike@sourceruckus.org>
References: <20220908211337.17090-1-veggiemike@sourceruckus.org>
Subject: [Drbd-dev] [PATCH 3/3] drbd: use bio_alloc_clone() instead of
	bio_clone_fast()
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

Between 5.17 and 5.18, bio_clone_fast() was modified to take a
block_device and the function was renamed.  This commit migrates to
the new usage.

Upstream commits:
abfc426d block: pass a block_device to bio_clone_fast

Signed-off-by: Michael D Labriola <veggiemike@sourceruckus.org>
---
 drbd/drbd_req.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drbd/drbd_req.c b/drbd/drbd_req.c
index fc7dfb8d..06ba8ce8 100644
--- a/drbd/drbd_req.c
+++ b/drbd/drbd_req.c
@@ -1715,7 +1715,7 @@ drbd_request_prepare(struct drbd_device *device, struct bio *bio,
 	req->start_jif = bio_start_io_acct(req->master_bio);
 
 	if (get_ldev(device)) {
-		req->private_bio  = bio_clone_fast(bio, GFP_NOIO, &drbd_io_bio_set);
+		req->private_bio  = bio_alloc_clone(bio->bi_bdev, bio, GFP_NOIO, &drbd_io_bio_set);
 		req->private_bio->bi_private = req;
 		req->private_bio->bi_end_io = drbd_request_endio;
 	}
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
