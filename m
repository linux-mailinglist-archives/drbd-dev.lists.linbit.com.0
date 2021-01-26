Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBE8304235
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Jan 2021 16:21:25 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F2C1C420665;
	Tue, 26 Jan 2021 16:21:24 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E4407420636
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 16:21:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hT6VVHBE+h6JAvE1DToGRa2iclpKhRp2E4jpRU5fhfg=;
	b=a5C/DS8xF1Qgcw0TbOpCyVosGS
	Zrj/lJFI88P49DOf+/Bv7oVHux9xqSc90dqCb+MgQFhiF1iNvcTKtNotsaqaT9GZ5O2lfHYWPU8f9
	MWSyAVCn+XzTVBXvoQFlhs6Nk75UUNAvCFZY8DGZ+OF3VElW6b7AOCAZODHM1g0BPGh6KHJ7SLPKZ
	ldxaH+8wFBz/F2aTXvOIhpfh3/7iT/Vec2zTOjOdaNV8EKhaGb4msUb18JCH4H9nVObBYh45mZ/t7
	Mt7fD5vi0lda03mpky5eT1QtbuYJV5pgTQU/Q9GheLbpEAbrqXTRFm9yHPYEgOqLWBKQ/o7X2nMXc
	I/Ys90sw==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l4Q39-005o7b-JG; Tue, 26 Jan 2021 15:15:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:43 +0100
Message-Id: <20210126145247.1964410-14-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 13/17] md: remove md_bio_alloc_sync
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

md_bio_alloc_sync is never called with a NULL mddev, and ->sync_set is
initialized in md_run, so it always must be initialized as well.  Just
open code the remaining call to bio_alloc_bioset.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/md.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 6a27f52007c871..399c81bddc1ae1 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -340,14 +340,6 @@ static int start_readonly;
  */
 static bool create_on_open = true;
 
-static struct bio *md_bio_alloc_sync(struct mddev *mddev)
-{
-	if (!mddev || !bioset_initialized(&mddev->sync_set))
-		return bio_alloc(GFP_NOIO, 1);
-
-	return bio_alloc_bioset(GFP_NOIO, 1, &mddev->sync_set);
-}
-
 /*
  * We have a system wide 'event count' that is incremented
  * on any 'interesting' event, and readers of /proc/mdstat
@@ -989,7 +981,7 @@ void md_super_write(struct mddev *mddev, struct md_rdev *rdev,
 	if (test_bit(Faulty, &rdev->flags))
 		return;
 
-	bio = md_bio_alloc_sync(mddev);
+	bio = bio_alloc_bioset(GFP_NOIO, 1, &mddev->sync_set);
 
 	atomic_inc(&rdev->nr_pending);
 
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
