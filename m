Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B77572E95
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Jul 2022 08:57:12 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0066F420F79;
	Wed, 13 Jul 2022 08:57:11 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A2299420BA2
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 08:57:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=oVF8muBFUtxIxMWHnxdNoSfRx8q8DedDPDTnq4wy7CA=;
	b=MdHLRRAgbOCH6r9SSIyh7sgJY5
	T1Gfr+3Gk0ySNEQiUYRfL3WBQhq6b31TOb9e9r39b90ECAT0QBlJKrsFL/omMn+LQXbfMfT4ZL8/H
	V65/qxfGC1sfiJndzayottsrq2w/DI4ZOHR3UjTWv7gEHh7+ZSqVe7TytGhqbRaStUZC9ZYlALqx7
	lVXL8jVVEqleTBzMql1idapQKcnqGoRwgDKZI+aV1ztO2bJXl/4I28HNmt9JW1JAUcheWocyYstB/
	nz6ClRZuxPpErxcz3ntiP4NR0F+596gfewyQFWirqW7bk5tF4k37QcqwhAWli8lJB4A4ksPftKtko
	WsPXawgA==;
Received: from ip4d15c27d.dynamic.kabel-deutschland.de ([77.21.194.125]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVJW-000NT2-I1; Wed, 13 Jul 2022 05:53:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Jul 2022 07:53:13 +0200
Message-Id: <20220713055317.1888500-6-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 5/9] pktcdvd: stop using bdevname in pkt_new_dev
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
 drivers/block/pktcdvd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index a7016ffce9a43..01a15dbd9cde2 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -2519,7 +2519,6 @@ static int pkt_seq_show(struct seq_file *m, void *p)
 static int pkt_new_dev(struct pktcdvd_device *pd, dev_t dev)
 {
 	int i;
-	char b[BDEVNAME_SIZE];
 	struct block_device *bdev;
 	struct scsi_device *sdev;
 
@@ -2532,8 +2531,7 @@ static int pkt_new_dev(struct pktcdvd_device *pd, dev_t dev)
 		if (!pd2)
 			continue;
 		if (pd2->bdev->bd_dev == dev) {
-			pkt_err(pd, "%s already setup\n",
-				bdevname(pd2->bdev, b));
+			pkt_err(pd, "%pg already setup\n", pd2->bdev);
 			return -EBUSY;
 		}
 		if (pd2->pkt_dev == dev) {
@@ -2568,7 +2566,7 @@ static int pkt_new_dev(struct pktcdvd_device *pd, dev_t dev)
 	}
 
 	proc_create_single_data(pd->name, 0, pkt_proc, pkt_seq_show, pd);
-	pkt_dbg(1, pd, "writer mapped to %s\n", bdevname(bdev, b));
+	pkt_dbg(1, pd, "writer mapped to %pg\n", bdev);
 	return 0;
 
 out_mem:
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
