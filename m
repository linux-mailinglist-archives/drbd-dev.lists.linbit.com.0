Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 876FA4A7565
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Feb 2022 17:05:20 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6B93242020D;
	Wed,  2 Feb 2022 17:05:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF3E74201BB
	for <drbd-dev@lists.linbit.com>; Wed,  2 Feb 2022 17:01:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6nB4XCyNV0lLp4O7TLKt17coILi7UbFBfUYhwbdKt70=;
	b=DBLAljdEvNjT1ULi0WBmTfAend
	BUZVo07tqMGN+j/ue6vbsm0P0gfzIQR7DYDkjlUH0KrHTPp5PBPtgQ0+jGocgtMDJtwyTI3r5kccv
	18Bx6laYf60iQxFUPOKAbwLyBsLpiUcvxnr0NiiXDav2qSauvr1eF703KEvINVlUThORtbBDQDB/t
	Aq2pOrVaymC1bs65nNw03OXxhwHmaNx5SqopgmTUlKV21cQovhVEWunDuD2qM6MBayrs3P1shOY0N
	M+dXqqhxnH3KNC+CrEbtHK9CV1e8mzw0sp4MTw+AHo22JxeQglaUZ17YG1yrHbk+Z2Xv/D8Qymwax
	MK/0outg==;
Received: from [2001:4bb8:191:327d:b3e5:1ccd:eaac:6609] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFI4a-00G85F-Ue; Wed, 02 Feb 2022 16:01:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  2 Feb 2022 17:01:04 +0100
Message-Id: <20220202160109.108149-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202160109.108149-1-hch@lst.de>
References: <20220202160109.108149-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 08/13] dm: simplify the single bio fast path in
	__send_duplicate_bios
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

Most targets just need a single flush bio.  Open code that case in
__send_duplicate_bios without the need to add the bio to a list.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 26 ++++++++++++++------------
 1 file changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index c05b6ff1bb957..78df75f57288b 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1241,15 +1241,6 @@ static void alloc_multiple_bios(struct bio_list *blist, struct clone_info *ci,
 	struct bio *bio;
 	int try;
 
-	if (!num_bios)
-		return;
-
-	if (num_bios == 1) {
-		bio = alloc_tio(ci, ti, 0, len, GFP_NOIO);
-		bio_list_add(blist, bio);
-		return;
-	}
-
 	for (try = 0; try < 2; try++) {
 		int bio_nr;
 
@@ -1279,12 +1270,23 @@ static void __send_duplicate_bios(struct clone_info *ci, struct dm_target *ti,
 	struct bio_list blist = BIO_EMPTY_LIST;
 	struct bio *clone;
 
-	alloc_multiple_bios(&blist, ci, ti, num_bios, len);
-
-	while ((clone = bio_list_pop(&blist))) {
+	switch (num_bios) {
+	case 0:
+		break;
+	case 1:
+		clone = alloc_tio(ci, ti, 0, len, GFP_NOIO);
 		if (len)
 			bio_setup_sector(clone, ci->sector, *len);
 		__map_bio(clone);
+		break;
+	default:
+		alloc_multiple_bios(&blist, ci, ti, num_bios, len);
+		while ((clone = bio_list_pop(&blist))) {
+			if (len)
+				bio_setup_sector(clone, ci->sector, *len);
+			__map_bio(clone);
+		}
+		break;
 	}
 }
 
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
