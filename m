Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEE8304161
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Jan 2021 16:04:47 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CA37F4203D0;
	Tue, 26 Jan 2021 16:04:46 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 363 seconds by postgrey-1.31 at mail19;
	Tue, 26 Jan 2021 16:04:44 CET
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BC2314202F8
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 16:04:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nvbz5iYtrf14To4xrwKMIwRiNRZctL670kk4gnUD88w=;
	b=JoPiLXDSpvjKkodegpd/9Ki4eY
	+Xdf/GZ8NV/UcLDXZzZtEKsp27c7jZGL9XRkRoIjfSyaWrDECY/eM9d9EbW3hXiTfEZtMMSfbBElv
	gxIVvRv7JpUfBVu5HVmbC3V6jeIbpcuVLSOs+QAFB4JLCdJmf6UjhHo8cMfMWB6QtuEojK2aE4Zs4
	0EGwmh02yAfrn/3WhiiWW7P8cSoEUgeZK/uRN5Lli1a73a/4gQNDmMn9/nUDRCLyehO8q38TrrVt2
	Zp6tMS6WW0vuepmGDzOzrMfYXxlrsWqTSndYRyd8M3WUvaX0Wj1qAjSBNOpkRcDMl8FKs9wfJKhsN
	NNqeQ+0g==;
Received: from [2001:4bb8:191:e347:5918:ac86:61cb:8801] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l4PjX-005m4E-5t; Tue, 26 Jan 2021 14:54:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>,
	Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 15:52:31 +0100
Message-Id: <20210126145247.1964410-2-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 01/17] zonefs: use bio_alloc in
	zonefs_file_dio_append
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

Use bio_alloc instead of open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/zonefs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
index bec47f2d074beb..faea2ed34b4a37 100644
--- a/fs/zonefs/super.c
+++ b/fs/zonefs/super.c
@@ -678,7 +678,7 @@ static ssize_t zonefs_file_dio_append(struct kiocb *iocb, struct iov_iter *from)
 	if (!nr_pages)
 		return 0;
 
-	bio = bio_alloc_bioset(GFP_NOFS, nr_pages, &fs_bio_set);
+	bio = bio_alloc(GFP_NOFS, nr_pages);
 	if (!bio)
 		return -ENOMEM;
 
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
