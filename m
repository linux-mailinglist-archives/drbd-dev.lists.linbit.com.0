Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFA5572EDB
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Jul 2022 09:12:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9A0B8420FAC;
	Wed, 13 Jul 2022 09:12:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E8C7A420F78
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 09:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=+oupOjpjN539hy7C7mOoKBMVZDA7YOt+U1a+XjhL5Ns=;
	b=SppXqYL9lOHjNHJFVIsh0T/5NK
	thTYqttsVuX9ral09ViQiJsG0BqI+m2Y6uMyPhwe2AVn+9jbprGRivJH9ddWe5e2zJpp3Uqj8X/qA
	h/p+Hima0jwo2ow4lUwnJfGygYuJ7ry7o19DW0r5NP0HfYsde0cnH77T5+Ad03RQFoqtOH8QYa4Rp
	KOMLvHbUs0O6xMh7bWvgY6cyW6WS9V9UjUrnbbsUmymRzVqe91SGDWq2itxqUTJXBR7JinVMSDJoA
	d2b+wMFDOmjP0AHja00eSStrbMdsyqy8MDxoDBE0tR8Jembbeu9Acs0rIrPBoHY4FqswpEbh65DTl
	J6OtNZLQ==;
Received: from ip4d15c27d.dynamic.kabel-deutschland.de ([77.21.194.125]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVJN-000NOa-LE; Wed, 13 Jul 2022 05:53:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Jul 2022 07:53:10 +0200
Message-Id: <20220713055317.1888500-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220713055317.1888500-1-hch@lst.de>
References: <20220713055317.1888500-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	Song Liu <song@kernel.org>, Mark Fasheh <mark@fasheh.com>,
	linux-raid@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Joel Becker <jlbec@evilplan.org>, Jan Kara <jack@suse.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	linux-ext4@vger.kernel.org, Jack Wang <jinpu.wang@ionos.com>,
	ocfs2-devel@oss.oracle.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/9] block: stop using bdevname in
	__blkdev_issue_discard
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

Just use the %pg format specifier instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-lib.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/block/blk-lib.c b/block/blk-lib.c
index 09b7e1200c0f4..67e6dbc1ae817 100644
--- a/block/blk-lib.c
+++ b/block/blk-lib.c
@@ -48,10 +48,8 @@ int __blkdev_issue_discard(struct block_device *bdev, sector_t sector,
 
 	/* In case the discard granularity isn't set by buggy device driver */
 	if (WARN_ON_ONCE(!bdev_discard_granularity(bdev))) {
-		char dev_name[BDEVNAME_SIZE];
-
-		bdevname(bdev, dev_name);
-		pr_err_ratelimited("%s: Error: discard_granularity is 0.\n", dev_name);
+		pr_err_ratelimited("%pg: Error: discard_granularity is 0.\n",
+				   bdev);
 		return -EOPNOTSUPP;
 	}
 
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
