Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DB34BFDCB
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Feb 2022 16:54:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 10348421783;
	Tue, 22 Feb 2022 16:54:45 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4FE6C4205A5
	for <drbd-dev@lists.linbit.com>; Tue, 22 Feb 2022 16:52:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=jLxc+k9U5m5jDVU3xzQ+WAktMvinKjuEy4i/XGAkyLM=;
	b=A3Nl2wgEGlsRzwlTl/VpujN/tS
	EbTkiQvce3848TeyGssLHoSl6du0jTmKRzuOK7V1k6DryhmpgEOfrqSuxrOzEb/092+t7DhvL/O7C
	ZzpUNf2qez1X2poRJll7YtOrP5v6odc4tOMtRQh2b75EGzN8MUtXmZEqJLWJ04FNLpHRrI8UaalZM
	+7/u/LUkkpUXxMFQkOv7Vp1QFnAuDewiozc8m9WaFeYl75Ex75dgkyfG5Pq4GfrGd1yI8fvrjM0YZ
	+UrhkhnI2MbeVrKzbebszxpzSwxqUlmDvzv9z12Cpl8kCP/a7NfUCee8EIRXkgSMGFZAhGrSCXJr3
	0YQswS0g==;
Received: from [2001:4bb8:198:f8fc:c22a:ebfc:be8d:63c2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMXSf-00APzl-H6; Tue, 22 Feb 2022 15:52:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Feb 2022 16:51:54 +0100
Message-Id: <20220222155156.597597-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222155156.597597-1-hch@lst.de>
References: <20220222155156.597597-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Chris Zankel <chris@zankel.net>, Justin Sanders <justin@coraid.com>,
	Minchan Kim <minchan@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>,
	linux-xtensa@linux-xtensa.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Denis Efremov <efremov@linux.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
	linux-bcache@vger.kernel.org, nvdimm@lists.linux.dev,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 08/10] drbd: use bvec_kmap_local in drbd_csum_bio
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

Using local kmaps slightly reduces the chances to stray writes, and
the bvec interface cleans up the code a little bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_worker.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index a5e04b38006b6..1b48c8172a077 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -326,9 +326,9 @@ void drbd_csum_bio(struct crypto_shash *tfm, struct bio *bio, void *digest)
 	bio_for_each_segment(bvec, bio, iter) {
 		u8 *src;
 
-		src = kmap_atomic(bvec.bv_page);
-		crypto_shash_update(desc, src + bvec.bv_offset, bvec.bv_len);
-		kunmap_atomic(src);
+		src = bvec_kmap_local(&bvec);
+		crypto_shash_update(desc, src, bvec.bv_len);
+		kunmap_local(src);
 
 		/* REQ_OP_WRITE_SAME has only one segment,
 		 * checksum the payload only once. */
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
