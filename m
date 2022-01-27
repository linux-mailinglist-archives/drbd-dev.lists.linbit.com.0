Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A2C49DAED
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 07:40:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DE39D42A583;
	Thu, 27 Jan 2022 07:40:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 88C964298F1
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 07:36:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=J0izfstJSb8vQvi0Ea8HUHUJbIppOAU4XEVoB7P8WkI=;
	b=LbRjZZCjN9rTLJ9pYRBdrXdGzV
	2bYyGRkWsSWdR7fD9JQYzIBTlwiehszpdhDudZK1LN1nISK+tLwEL8vLqYLlvi5SArw1bWQ2sqWqz
	ZgRZfzXqzcX4k1HdD/U2m6AqJqnvktgmmI18S9abyOkA49wjm6C6cRXJqXvNanaL23btqyZIzE8UT
	VbtR+wb08M5AAXbo4nFQcUdxaG+58FOChzo6uEp6TEsqSwDLEPLuYgZDJV6yubnlD8fYYbcAFT2Jr
	wW7KR8mvKRAzcuAG3Oz5m6JUyo9QjkGxkdxTDYQ1i75TI9c7993UCttP+OBDHDPKA0GOn5tOQVrzP
	w38MUF/g==;
Received: from 213-225-10-69.nat.highway.a1.net ([213.225.10.69]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCyOM-00EYBP-08; Thu, 27 Jan 2022 06:36:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 07:35:41 +0100
Message-Id: <20220127063546.1314111-10-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 09/14] dm: add a missing bio initialization to
	alloc_tio
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

The bio in the tio embedded into the clone_info structure is never
initialized.  This is harmless as bio_init only zeroes the structure
and assigns the vectors, but add the initialization to prepare for
refactoring the bio cloning logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index ee2d92ec7c9fc..57f44d3a4d747 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -552,6 +552,7 @@ static struct bio *alloc_tio(struct clone_info *ci, struct dm_target *ti,
 	if (!ci->io->tio.io) {
 		/* the dm_target_io embedded in ci->io is available */
 		tio = &ci->io->tio;
+		bio_init(&tio->clone, NULL, NULL, 0, 0);
 	} else {
 		struct bio *clone = bio_alloc_bioset(NULL, 0, 0, gfp_mask,
 						     &ci->io->md->bs);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
