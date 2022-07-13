Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F6B572DE8
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Jul 2022 08:10:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 03FFD42097C;
	Wed, 13 Jul 2022 08:10:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2944D42097C
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 08:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Y2m5n2ywVdorzEoaFVlEdw3M6b4Binlg2HpluXfaIZg=;
	b=aY8PUpMOr3XL4OGdcJC3oZLePj
	U2Fpy5CT1WtNvKl+Uh2jm9+2lBXEu/Jso/1cholqbux8jzHP3uQ/4/wImvAQ3GuR2SrEuZ/gSB7He
	57CgDQLolbdY00Dzuwwr2vNEIgrxp2tIoBknZFSKaduvhaGj1E1fBPc/THzPcVj1eroIl7hMQUprV
	/QynO1qrDenogR8CfOhS4ukxm0TgzTd0/AGa4IQnrUaIWlT77XHIsNONx0aYZP5hsMoueapQNk0Nw
	RtbEUPKVuSWup65o3wgXLZUx7fXmOIh7e5sk0ewAprdrhvV1K3tdjHdt7+zkT4HxaLTkBXvHvlDwz
	OM73TuRg==;
Received: from ip4d15c27d.dynamic.kabel-deutschland.de ([77.21.194.125]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVJK-000NNd-M0; Wed, 13 Jul 2022 05:53:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Jul 2022 07:53:09 +0200
Message-Id: <20220713055317.1888500-2-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 1/9] block: stop using bdevname in
	bdev_write_inode
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

Just use the %pg format specifier instead.  Also reformat the
printk statement to be more readable.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bdev.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index 5fe06c1f2def4..ce05175e71cea 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -54,12 +54,10 @@ static void bdev_write_inode(struct block_device *bdev)
 	while (inode->i_state & I_DIRTY) {
 		spin_unlock(&inode->i_lock);
 		ret = write_inode_now(inode, true);
-		if (ret) {
-			char name[BDEVNAME_SIZE];
-			pr_warn_ratelimited("VFS: Dirty inode writeback failed "
-					    "for block device %s (err=%d).\n",
-					    bdevname(bdev, name), ret);
-		}
+		if (ret)
+			pr_warn_ratelimited(
+	"VFS: Dirty inode writeback failed for block device %pg (err=%d).\n",
+				bdev, ret);
 		spin_lock(&inode->i_lock);
 	}
 	spin_unlock(&inode->i_lock);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
