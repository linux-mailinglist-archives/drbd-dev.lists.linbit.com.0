Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3A0578BF7
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Jul 2022 22:43:12 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CD9EE420620;
	Mon, 18 Jul 2022 22:43:11 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 507 seconds by postgrey-1.31 at mail19;
	Mon, 18 Jul 2022 22:43:09 CEST
Received: from aragorn.cowesettanimalhospital.com
	(wsip-72-215-235-61.ri.ri.cox.net [72.215.235.61])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F07DF4202D6
	for <drbd-dev@lists.linbit.com>; Mon, 18 Jul 2022 22:43:09 +0200 (CEST)
Received: by aragorn.cowesettanimalhospital.com (Postfix, from userid 1200)
	id 29EB31407A0; Mon, 18 Jul 2022 16:34:41 -0400 (EDT)
From: Michael D Labriola <veggiemike@sourceruckus.org>
To: drbd-dev@lists.linbit.com
Date: Mon, 18 Jul 2022 16:34:21 -0400
Message-Id: <20220718203421.963-1-veggiemike@sourceruckus.org>
X-Mailer: git-send-email 2.17.1
Subject: [Drbd-dev] [PATCH] compat: actually, bio_alloc now has 4 params
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

The original compat check for this got a bit wrapped around the axle.
Both bio_alloc() and bio_alloc_bioset() grew 2 more arguments.  All
the comments and filenames from b6d4d588597 say "bio_alloc has 5
params", but it was actually bio_alloc_bioset() that now has 5 params.
And the test takes the 5 params now required for bio_alloc_bioset()
and passed them into bio_alloc()... which causes the correct code for
5.17 kernels to get patched back out erroneously.

Signed-off-by: Michael D Labriola <veggiemike@sourceruckus.org>
---
 ...no_has_5_params.cocci => bio_alloc__no_has_4_params.cocci} | 0
 drbd/drbd-kernel-compat/gen_patch_names.c                     | 2 +-
 .../{bio_alloc_has_5_params.c => bio_alloc_has_4_params.c}    | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename drbd/drbd-kernel-compat/cocci/{bio_alloc__no_has_5_params.cocci => bio_alloc__no_has_4_params.cocci} (100%)
 rename drbd/drbd-kernel-compat/tests/{bio_alloc_has_5_params.c => bio_alloc_has_4_params.c} (80%)

diff --git a/drbd/drbd-kernel-compat/cocci/bio_alloc__no_has_5_params.cocci b/drbd/drbd-kernel-compat/cocci/bio_alloc__no_has_4_params.cocci
similarity index 100%
rename from drbd/drbd-kernel-compat/cocci/bio_alloc__no_has_5_params.cocci
rename to drbd/drbd-kernel-compat/cocci/bio_alloc__no_has_4_params.cocci
diff --git a/drbd/drbd-kernel-compat/gen_patch_names.c b/drbd/drbd-kernel-compat/gen_patch_names.c
index e98c3d44..1074bb12 100644
--- a/drbd/drbd-kernel-compat/gen_patch_names.c
+++ b/drbd/drbd-kernel-compat/gen_patch_names.c
@@ -102,7 +102,7 @@ int main(int argc, char **argv)
 #endif
 
 	patch(1, "bio_alloc", true, false,
-	      COMPAT_BIO_ALLOC_HAS_5_PARAMS, "has_5_params");
+	      COMPAT_BIO_ALLOC_HAS_4_PARAMS, "has_4_params");
 
 #if !defined(COMPAT_HAVE_BIO_SET_DEV)
 	patch(1, "bio_set_dev", true, false,
diff --git a/drbd/drbd-kernel-compat/tests/bio_alloc_has_5_params.c b/drbd/drbd-kernel-compat/tests/bio_alloc_has_4_params.c
similarity index 80%
rename from drbd/drbd-kernel-compat/tests/bio_alloc_has_5_params.c
rename to drbd/drbd-kernel-compat/tests/bio_alloc_has_4_params.c
index 1c28f049..6000e101 100644
--- a/drbd/drbd-kernel-compat/tests/bio_alloc_has_5_params.c
+++ b/drbd/drbd-kernel-compat/tests/bio_alloc_has_4_params.c
@@ -6,7 +6,7 @@
 #include <linux/bio.h>
 
 struct bio *foo(struct block_device *bdev, unsigned short nr_vecs,
-		unsigned int opf, gfp_t gfp_mask, struct bio_set *bs)
+		unsigned int opf, gfp_t gfp_mask)
 {
-	return bio_alloc(bdev, nr_vecs, opf, gfp_mask, bs);
+	return bio_alloc(bdev, nr_vecs, opf, gfp_mask);
 }
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
