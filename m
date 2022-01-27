Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BB49DB0E
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 07:56:38 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DA7CE42A588;
	Thu, 27 Jan 2022 07:56:38 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4D25242A588
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 07:55:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=StJRsse+37Wokpa/jUXP89uDvoTX9kPzqnz3I3KaGyU=;
	b=yRNodCYDrUwGNfU5xGzvygidGL
	0qM0DMASwCq3VIwq1bxRk9QWXvfGciN0mypolVJcxvm9xMMnB3B/oHp5lI257hsXgNPVzDPtWcsUS
	/b+wlj0+srrD1B9mPu5ML+g1Yji6gK1JhJV66ggvR4c92NH6+GnHQml5Qphul9dIMJWSzVmEdaBw9
	IuxdCWBJj6KHub1GGmpyGsAU4CZ5UiZT7yplolqo85fITBEtD0tKR1pCs/qqKnbKkYds5vZrsiycD
	nqr92QDH6NcB7CLxG4HqzILV8lC4QH74YwYEEQwrKIYl+t2KhWqaEDQLoQAct9p6gkGqtAg9vakEl
	9jkbblWA==;
Received: from 213-225-10-69.nat.highway.a1.net ([213.225.10.69]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCyOV-00EYFd-Ng; Thu, 27 Jan 2022 06:36:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 07:35:44 +0100
Message-Id: <20220127063546.1314111-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127063546.1314111-1-hch@lst.de>
References: <20220127063546.1314111-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 12/14] dm: use bio_clone_fast in alloc_tio
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

Replace an open coded bio_clone_fast with the actual helper.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 5978cb87e9372..984ccafb11ea8 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -558,17 +558,13 @@ static struct bio *alloc_tio(struct clone_info *ci, struct dm_target *ti,
 			return NULL;
 		}
 	} else {
-		struct bio *clone = bio_alloc_bioset(NULL, 0, 0, gfp_mask,
-						     &ci->io->md->bs);
+		struct bio *clone = bio_clone_fast(ci->bio, gfp_mask,
+						   &ci->io->md->bs);
 		if (!clone)
 			return NULL;
 
 		tio = clone_to_tio(clone);
 		tio->inside_dm_io = false;
-		if (__bio_clone_fast(&tio->clone, ci->bio, gfp_mask) < 0) {
-			bio_put(clone);
-			return NULL;
-		}
 	}
 
 	tio->magic = DM_TIO_MAGIC;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
