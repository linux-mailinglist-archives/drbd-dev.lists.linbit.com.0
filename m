Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3764920DA
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Jan 2022 09:03:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 36481420602;
	Tue, 18 Jan 2022 09:03:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 43415420602
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jan 2022 09:00:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=EcXfe+QJLbyEaBSYcI8IdLx+VpwVU+Twsx7L0heUO1Q=;
	b=Crht+UUgONjGH1v8HmgHBuR0Pw
	3+FhXNSZnyjRNWPG58Wm2G5KNvvpy1aGmBMUIrUK1u4m17TdekCh3eo0S2wKQYJJCbvDqXQsRo2wK
	voVwIithhKd6AwW1XgXVCGDM2qY6luEVdRs+f8pN0VmiQubGiTFrLb9HST+OMYWI2ooLOR0H3H2W4
	vveuXxxHUHwA+40YbvmOhhsxe1wU4IgQ9dJEnKgPFvwGnegPrJbbGgCJPHOwX/k9PMvLPupdzEJoQ
	dshYui2V9dLVx8Ag4GNgYySKuflXOClHoN9+HnAX1vSgCn5EnBRDfedOUMh6tHzNLJ5kJKsxDwFUO
	XkKnK+AQ==;
Received: from [2001:4bb8:184:72a4:a4a9:19c0:5242:7768] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9imk-000ZPF-0i; Tue, 18 Jan 2022 07:20:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 18 Jan 2022 08:19:37 +0100
Message-Id: <20220118071952.1243143-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118071952.1243143-1-hch@lst.de>
References: <20220118071952.1243143-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.co>,
	dm-devel@redhat.com, "Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 04/19] ntfs3: remove ntfs_alloc_bio
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

bio_alloc will never fail if it is allowed to sleep, so there is no
need for this loop.  Also remove the __GFP_HIGH specifier as it doesn't
make sense here given that we'll always fall back to the mempool anyway.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ntfs3/fsntfs.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/fs/ntfs3/fsntfs.c b/fs/ntfs3/fsntfs.c
index 4de9acb169689..4a255e21ecf5f 100644
--- a/fs/ntfs3/fsntfs.c
+++ b/fs/ntfs3/fsntfs.c
@@ -1443,17 +1443,6 @@ int ntfs_write_bh(struct ntfs_sb_info *sbi, struct NTFS_RECORD_HEADER *rhdr,
 	return err;
 }
 
-static inline struct bio *ntfs_alloc_bio(u32 nr_vecs)
-{
-	struct bio *bio = bio_alloc(GFP_NOFS | __GFP_HIGH, nr_vecs);
-
-	if (!bio && (current->flags & PF_MEMALLOC)) {
-		while (!bio && (nr_vecs /= 2))
-			bio = bio_alloc(GFP_NOFS | __GFP_HIGH, nr_vecs);
-	}
-	return bio;
-}
-
 /*
  * ntfs_bio_pages - Read/write pages from/to disk.
  */
@@ -1496,11 +1485,7 @@ int ntfs_bio_pages(struct ntfs_sb_info *sbi, const struct runs_tree *run,
 		lbo = ((u64)lcn << cluster_bits) + off;
 		len = ((u64)clen << cluster_bits) - off;
 new_bio:
-		new = ntfs_alloc_bio(nr_pages - page_idx);
-		if (!new) {
-			err = -ENOMEM;
-			goto out;
-		}
+		new = bio_alloc(GFP_NOFS, nr_pages - page_idx);
 		if (bio) {
 			bio_chain(bio, new);
 			submit_bio(bio);
@@ -1599,11 +1584,7 @@ int ntfs_bio_fill_1(struct ntfs_sb_info *sbi, const struct runs_tree *run)
 		lbo = (u64)lcn << cluster_bits;
 		len = (u64)clen << cluster_bits;
 new_bio:
-		new = ntfs_alloc_bio(BIO_MAX_VECS);
-		if (!new) {
-			err = -ENOMEM;
-			break;
-		}
+		new = bio_alloc(GFP_NOFS, BIO_MAX_VECS);
 		if (bio) {
 			bio_chain(bio, new);
 			submit_bio(bio);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
