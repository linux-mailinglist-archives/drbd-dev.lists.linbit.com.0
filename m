Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA9B6EB2E1
	for <lists+drbd-dev@lfdr.de>; Fri, 21 Apr 2023 22:23:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 38EEA4252CE;
	Fri, 21 Apr 2023 22:23:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 34D674252BC
	for <drbd-dev@lists.linbit.com>; Fri, 21 Apr 2023 22:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=RlYZtMcWmG/W2kDdFWLbtYt9Jiujn88dB6HTCMaouxI=;
	b=qTRjtG4XiiUGR6XLhcw+SFktov
	LoDASQYMHVLj3TTg5Lw0jryhjP4LqtTs5LsbGN8HjKQwWO9XJb2N6gJoJdU2Kbxy3omeTFZdCuvu9
	gYsf5oHp7r0+jNOMXyus067c8U1t8hqR7BaZ7XU9tE5o5lpKgnd7lXd/DLUlJ0pBQsJr0jx9OR/47
	1fBRNIc53lCZDX5v1jMR7xMlrxsp2KBuUX3ZJS59UrN9p8IgGGDnMRpYh9885bwZV49u+cfeaApWm
	7EbwnxAkoRXz2ALy5RYREPDptZqMo4YNQcuh2gLrKyg50PFZ75wR7Mef75Ihe/+CAH3kPwfVf6eN9
	vxETgCxw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
	Hat Linux)) id 1ppwtU-00BlaX-1a; Fri, 21 Apr 2023 19:58:08 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, hch@infradead.org, djwong@kernel.org,
	minchan@kernel.org, senozhatsky@chromium.org
Date: Fri, 21 Apr 2023 12:58:03 -0700
Message-Id: <20230421195807.2804512-2-mcgrof@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230421195807.2804512-1-mcgrof@kernel.org>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: p.raghav@samsung.com, linux-xfs@vger.kernel.org, mcgrof@kernel.org,
	da.gomez@samsung.com, patches@lists.linux.dev,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, hare@suse.de, linux-fsdevel@vger.kernel.org,
	kbusch@kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/5] dm integrity: simplify by using
	PAGE_SECTORS_SHIFT
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

The PAGE_SHIFT - SECTOR_SHIFT constant be replaced with PAGE_SECTORS_SHIFT
defined in linux/blt_types.h, which is included by linux/blkdev.h.

This produces no functional changes.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/md/dm-integrity.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index 31838b13ea54..a179265970dd 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -752,7 +752,7 @@ static void page_list_location(struct dm_integrity_c *ic, unsigned int section,
 
 	sector = section * ic->journal_section_sectors + offset;
 
-	*pl_index = sector >> (PAGE_SHIFT - SECTOR_SHIFT);
+	*pl_index = sector >> (PAGE_SECTORS_SHIFT);
 	*pl_offset = (sector << SECTOR_SHIFT) & (PAGE_SIZE - 1);
 }
 
@@ -1077,7 +1077,7 @@ static void rw_journal_sectors(struct dm_integrity_c *ic, blk_opf_t opf,
 		return;
 	}
 
-	pl_index = sector >> (PAGE_SHIFT - SECTOR_SHIFT);
+	pl_index = sector >> (PAGE_SECTORS_SHIFT);
 	pl_offset = (sector << SECTOR_SHIFT) & (PAGE_SIZE - 1);
 
 	io_req.bi_opf = opf;
@@ -1201,7 +1201,7 @@ static void copy_from_journal(struct dm_integrity_c *ic, unsigned int section, u
 
 	sector = section * ic->journal_section_sectors + JOURNAL_BLOCK_SECTORS + offset;
 
-	pl_index = sector >> (PAGE_SHIFT - SECTOR_SHIFT);
+	pl_index = sector >> (PAGE_SECTORS_SHIFT);
 	pl_offset = (sector << SECTOR_SHIFT) & (PAGE_SIZE - 1);
 
 	io_req.bi_opf = REQ_OP_WRITE;
@@ -3765,7 +3765,7 @@ static int create_journal(struct dm_integrity_c *ic, char **error)
 	ic->commit_ids[3] = cpu_to_le64(0x4444444444444444ULL);
 
 	journal_pages = roundup((__u64)ic->journal_sections * ic->journal_section_sectors,
-				PAGE_SIZE >> SECTOR_SHIFT) >> (PAGE_SHIFT - SECTOR_SHIFT);
+				PAGE_SIZE >> SECTOR_SHIFT) >> (PAGE_SECTORS_SHIFT);
 	journal_desc_size = journal_pages * sizeof(struct page_list);
 	if (journal_pages >= totalram_pages() - totalhigh_pages() || journal_desc_size > ULONG_MAX) {
 		*error = "Journal doesn't fit into memory";
@@ -4542,7 +4542,7 @@ static int dm_integrity_ctr(struct dm_target *ti, unsigned int argc, char **argv
 			spin_lock_init(&bbs->bio_queue_lock);
 
 			sector = i * (BITMAP_BLOCK_SIZE >> SECTOR_SHIFT);
-			pl_index = sector >> (PAGE_SHIFT - SECTOR_SHIFT);
+			pl_index = sector >> (PAGE_SECTORS_SHIFT);
 			pl_offset = (sector << SECTOR_SHIFT) & (PAGE_SIZE - 1);
 
 			bbs->bitmap = lowmem_page_address(ic->journal[pl_index].page) + pl_offset;
-- 
2.39.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
