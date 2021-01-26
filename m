Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B8B3041D3
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Jan 2021 16:13:25 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 63C7C42062E;
	Tue, 26 Jan 2021 16:13:25 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DC24742062B
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 16:12:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y3ETPQ/J5b9VzWd6gZkaTVXt4OBDcvG3hAbwDlM7Vf4=;
	b=mwJd/045dmJyeWS4zYv9KjfH+B
	uVMvepvUAcMJ2wO2oEm9Vj0hy/6OgYLg2wyYVvQiEp49bLmHzFb7RYP41TAxbPQJk3d0/z0b4wZ5I
	GjH7z3cKjL2XyfrdFxbViextVhLmmgrhFNzkIsiDEh/n5UjIE1U7X4vuFMroMTeTlFcEdMC00xHnu
	j1P/uVY68WPmlmuYjl8Kis/h1pNlis4wblwNZsQRu57JK1/jxVqdb02OpBkO0pBlFfw6fjrGoA+5y
	L7P23xpZ/bUuqlzT+iDWd0gG9GfO5T4JnY/ujfPIedVOLarszLq7aPsQ2C7UTvLF8Z+V9J9PTiQGw
	TelaHqLA==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l4Pmc-005mP7-SH; Tue, 26 Jan 2021 14:58:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:33 +0100
Message-Id: <20210126145247.1964410-4-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210126145247.1964410-1-hch@lst.de>
References: <20210126145247.1964410-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, Naohiro Aota <naohiro.aota@wdc.com>,
	linux-nilfs@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	Chao Yu <chao@kernel.org>, linux-nfs@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] [PATCH 03/17] blk-crypto: use bio_kmalloc in
	blk_crypto_clone_bio
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

Use bio_kmalloc instead of open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-crypto-fallback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-crypto-fallback.c b/block/blk-crypto-fallback.c
index 50c225398e4d60..e8327c50d7c9f4 100644
--- a/block/blk-crypto-fallback.c
+++ b/block/blk-crypto-fallback.c
@@ -164,7 +164,7 @@ static struct bio *blk_crypto_clone_bio(struct bio *bio_src)
 	struct bio_vec bv;
 	struct bio *bio;
 
-	bio = bio_alloc_bioset(GFP_NOIO, bio_segments(bio_src), NULL);
+	bio = bio_kmalloc(GFP_NOIO, bio_segments(bio_src));
 	if (!bio)
 		return NULL;
 	bio->bi_bdev		= bio_src->bi_bdev;
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
