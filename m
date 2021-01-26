Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B70A30417D
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Jan 2021 16:06:46 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DA49242060D;
	Tue, 26 Jan 2021 16:06:45 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 545014202F8
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 16:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Tvv/hngq/dBU/TVoa7iwWv/YX1vhiuaE4wP7JKrNMhk=;
	b=k+FYANNOZNSV7d80UmzTAyJIKL
	sjR3uLRaK2TwHcBUsVcl9IndBEPxYkEu006OvPkkzK4tvMff5Z+dVhL0IjaUHx8BBuZ0yyw0kvg4G
	U3KPy3sIpICR9kG1TUy5jK8QjcY8sM8tPsbnAwnAg6bU60/F72Zv6QiuZCxnnZ+olHIVHWG6zEu9H
	vbj18B9ZyF73S0P0GskthCvFSLA42B1MNOQoLGT1DCJY5RV9hIWsDq7qtgSf3bFvuu11dMCIUC78m
	O5PhvXXW4p1xsC37+azC3ghr00JUxWPW0MIn1botrn443lpgRWINUt2FYChxfCgxAeBHpwqT6P5I5
	ybwQ3v+w==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l4Pl3-005mG9-Rr; Tue, 26 Jan 2021 14:56:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:32 +0100
Message-Id: <20210126145247.1964410-3-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 02/17] btrfs: use bio_kmalloc in __alloc_device
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
 fs/btrfs/volumes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 0a6de859eb2226..584ba093cf4966 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -421,7 +421,7 @@ static struct btrfs_device *__alloc_device(struct btrfs_fs_info *fs_info)
 	 * Preallocate a bio that's always going to be used for flushing device
 	 * barriers and matches the device lifespan
 	 */
-	dev->flush_bio = bio_alloc_bioset(GFP_KERNEL, 0, NULL);
+	dev->flush_bio = bio_kmalloc(GFP_KERNEL, 0);
 	if (!dev->flush_bio) {
 		kfree(dev);
 		return ERR_PTR(-ENOMEM);
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
