Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 468CE26A90B
	for <lists+drbd-dev@lfdr.de>; Tue, 15 Sep 2020 17:47:14 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22371420C01;
	Tue, 15 Sep 2020 17:47:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 63907420BE8
	for <drbd-dev@lists.linbit.com>; Tue, 15 Sep 2020 17:47:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=u+PjVn2iYv8vGBp3/U/FpUBxU+1ybYDlmuDi1nd7xKA=;
	b=AOe5obOuKb42rxAHU0QIHLXO+M
	B+yvvdR630CDcTRAMzyOtj5AZ4J4J76yA78HlqT0RfDxzHzkigIvUDigf4ZsHOHBfMsgSDtg+i1v1
	RkcAFzt7V/6Ueh/4tkkNM7Rn3k4OnzDTTMLHR/yV1JDlpimjS68tMR02nXOQx6MaAtfm04Rve036y
	3gpt8If62eCLEywi+5r9F3nypWqMGz93UFfiPGr+I9kW4QGbhG7QB14fHEH55wQrsYPwKIzWY2ajV
	+Dw584z0qMAeGzAMDC+Z0RRNa7VuKR8ra3aHpb8PL09A4D0y/8tSXV4arzNlu4tmbgyD7GUjDtKPP
	cIakDnYQ==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
	helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIDAW-0002nn-JP; Tue, 15 Sep 2020 15:46:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 17:18:29 +0200
Message-Id: <20200915151829.1767176-13-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915151829.1767176-1-hch@lst.de>
References: <20200915151829.1767176-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-mm@kvack.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 12/12] bdi: replace BDI_CAP_NO_{WRITEBACK,
	ACCT_DIRTY} with a single flag
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

Replace the two negative flags that are always used together with a
single positive flag that indicates the writeback capability instead
of two related non-capabilities.  Also remove the pointless wrappers
to just check the flag.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/9p/vfs_file.c            |  2 +-
 fs/fs-writeback.c           |  7 +++---
 include/linux/backing-dev.h | 48 ++++++++-----------------------------
 mm/backing-dev.c            |  6 ++---
 mm/filemap.c                |  4 ++--
 mm/memcontrol.c             |  2 +-
 mm/memory-failure.c         |  2 +-
 mm/migrate.c                |  2 +-
 mm/mmap.c                   |  2 +-
 mm/page-writeback.c         | 12 +++++-----
 10 files changed, 29 insertions(+), 58 deletions(-)

diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
index 3576123d82990e..6ecf863bfa2f4b 100644
--- a/fs/9p/vfs_file.c
+++ b/fs/9p/vfs_file.c
@@ -625,7 +625,7 @@ static void v9fs_mmap_vm_close(struct vm_area_struct *vma)
 
 	inode = file_inode(vma->vm_file);
 
-	if (!mapping_cap_writeback_dirty(inode->i_mapping))
+	if (!mapping_can_writeback(inode->i_mapping))
 		wbc.nr_to_write = 0;
 
 	might_sleep();
diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
index 149227160ff0b0..d4f84a2fe0878e 100644
--- a/fs/fs-writeback.c
+++ b/fs/fs-writeback.c
@@ -2321,7 +2321,7 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 
 			wb = locked_inode_to_wb_and_lock_list(inode);
 
-			WARN(bdi_cap_writeback_dirty(wb->bdi) &&
+			WARN((wb->bdi->capabilities & BDI_CAP_WRITEBACK) &&
 			     !test_bit(WB_registered, &wb->state),
 			     "bdi-%s not registered\n", bdi_dev_name(wb->bdi));
 
@@ -2346,7 +2346,8 @@ void __mark_inode_dirty(struct inode *inode, int flags)
 			 * to make sure background write-back happens
 			 * later.
 			 */
-			if (bdi_cap_writeback_dirty(wb->bdi) && wakeup_bdi)
+			if (wakeup_bdi &&
+			    (wb->bdi->capabilities & BDI_CAP_WRITEBACK))
 				wb_wakeup_delayed(wb);
 			return;
 		}
@@ -2581,7 +2582,7 @@ int write_inode_now(struct inode *inode, int sync)
 		.range_end = LLONG_MAX,
 	};
 
-	if (!mapping_cap_writeback_dirty(inode->i_mapping))
+	if (!mapping_can_writeback(inode->i_mapping))
 		wbc.nr_to_write = 0;
 
 	might_sleep();
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index b217344a2c63be..44df4fcef65c1e 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -110,27 +110,14 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
 /*
  * Flags in backing_dev_info::capability
  *
- * The first three flags control whether dirty pages will contribute to the
- * VM's accounting and whether writepages() should be called for dirty pages
- * (something that would not, for example, be appropriate for ramfs)
- *
- * WARNING: these flags are closely related and should not normally be
- * used separately.  The BDI_CAP_NO_ACCT_AND_WRITEBACK combines these
- * three flags into a single convenience macro.
- *
- * BDI_CAP_NO_ACCT_DIRTY:  Dirty pages shouldn't contribute to accounting
- * BDI_CAP_NO_WRITEBACK:   Don't write pages back
- * BDI_CAP_WRITEBACK_ACCT: Automatically account writeback pages
- * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
+ * BDI_CAP_WRITEBACK:		Supports dirty page writeback, and dirty pages
+ *				should contribute to accounting
+ * BDI_CAP_WRITEBACK_ACCT:	Automatically account writeback pages
+ * BDI_CAP_STRICTLIMIT:		Keep number of dirty pages below bdi threshold
  */
-#define BDI_CAP_NO_ACCT_DIRTY	0x00000001
-#define BDI_CAP_NO_WRITEBACK	0x00000002
-#define BDI_CAP_WRITEBACK_ACCT	0x00000004
-#define BDI_CAP_STRICTLIMIT	0x00000010
-#define BDI_CAP_CGROUP_WRITEBACK 0x00000020
-
-#define BDI_CAP_NO_ACCT_AND_WRITEBACK \
-	(BDI_CAP_NO_WRITEBACK | BDI_CAP_NO_ACCT_DIRTY)
+#define BDI_CAP_WRITEBACK		(1 << 0)
+#define BDI_CAP_WRITEBACK_ACCT		(1 << 1)
+#define BDI_CAP_STRICTLIMIT		(1 << 2)
 
 extern struct backing_dev_info noop_backing_dev_info;
 
@@ -169,24 +156,9 @@ static inline int wb_congested(struct bdi_writeback *wb, int cong_bits)
 long congestion_wait(int sync, long timeout);
 long wait_iff_congested(int sync, long timeout);
 
-static inline bool bdi_cap_writeback_dirty(struct backing_dev_info *bdi)
-{
-	return !(bdi->capabilities & BDI_CAP_NO_WRITEBACK);
-}
-
-static inline bool bdi_cap_account_dirty(struct backing_dev_info *bdi)
-{
-	return !(bdi->capabilities & BDI_CAP_NO_ACCT_DIRTY);
-}
-
-static inline bool mapping_cap_writeback_dirty(struct address_space *mapping)
-{
-	return bdi_cap_writeback_dirty(inode_to_bdi(mapping->host));
-}
-
-static inline bool mapping_cap_account_dirty(struct address_space *mapping)
+static inline bool mapping_can_writeback(struct address_space *mapping)
 {
-	return bdi_cap_account_dirty(inode_to_bdi(mapping->host));
+	return inode_to_bdi(mapping->host)->capabilities & BDI_CAP_WRITEBACK;
 }
 
 static inline int bdi_sched_wait(void *word)
@@ -223,7 +195,7 @@ static inline bool inode_cgwb_enabled(struct inode *inode)
 
 	return cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
 		cgroup_subsys_on_dfl(io_cgrp_subsys) &&
-		bdi_cap_account_dirty(bdi) &&
+		(bdi->capabilities & BDI_CAP_WRITEBACK) &&
 		(inode->i_sb->s_iflags & SB_I_CGROUPWB);
 }
 
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index ab0415dde5c66c..5d0991e75ca337 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -14,9 +14,7 @@
 #include <linux/device.h>
 #include <trace/events/writeback.h>
 
-struct backing_dev_info noop_backing_dev_info = {
-	.capabilities	= BDI_CAP_NO_ACCT_AND_WRITEBACK,
-};
+struct backing_dev_info noop_backing_dev_info;
 EXPORT_SYMBOL_GPL(noop_backing_dev_info);
 
 static struct class *bdi_class;
@@ -744,7 +742,7 @@ struct backing_dev_info *bdi_alloc(int node_id)
 		kfree(bdi);
 		return NULL;
 	}
-	bdi->capabilities = BDI_CAP_WRITEBACK_ACCT;
+	bdi->capabilities = BDI_CAP_WRITEBACK | BDI_CAP_WRITEBACK_ACCT;
 	bdi->ra_pages = VM_READAHEAD_PAGES;
 	bdi->io_pages = VM_READAHEAD_PAGES;
 	return bdi;
diff --git a/mm/filemap.c b/mm/filemap.c
index 1aaea26556cc7e..6c2a0139e22fa3 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -414,7 +414,7 @@ int __filemap_fdatawrite_range(struct address_space *mapping, loff_t start,
 		.range_end = end,
 	};
 
-	if (!mapping_cap_writeback_dirty(mapping) ||
+	if (!mapping_can_writeback(mapping) ||
 	    !mapping_tagged(mapping, PAGECACHE_TAG_DIRTY))
 		return 0;
 
@@ -1702,7 +1702,7 @@ struct page *pagecache_get_page(struct address_space *mapping, pgoff_t index,
 no_page:
 	if (!page && (fgp_flags & FGP_CREAT)) {
 		int err;
-		if ((fgp_flags & FGP_WRITE) && mapping_cap_account_dirty(mapping))
+		if ((fgp_flags & FGP_WRITE) && mapping_can_writeback(mapping))
 			gfp_mask |= __GFP_WRITE;
 		if (fgp_flags & FGP_NOFS)
 			gfp_mask &= ~__GFP_FS;
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index b807952b4d431b..d2352f76d6519f 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5643,7 +5643,7 @@ static int mem_cgroup_move_account(struct page *page,
 		if (PageDirty(page)) {
 			struct address_space *mapping = page_mapping(page);
 
-			if (mapping_cap_account_dirty(mapping)) {
+			if (mapping_can_writeback(mapping)) {
 				__mod_lruvec_state(from_vec, NR_FILE_DIRTY,
 						   -nr_pages);
 				__mod_lruvec_state(to_vec, NR_FILE_DIRTY,
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index f1aa6433f40416..a1e73943445e77 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1006,7 +1006,7 @@ static bool hwpoison_user_mappings(struct page *p, unsigned long pfn,
 	 */
 	mapping = page_mapping(hpage);
 	if (!(flags & MF_MUST_KILL) && !PageDirty(hpage) && mapping &&
-	    mapping_cap_writeback_dirty(mapping)) {
+	    mapping_can_writeback(mapping)) {
 		if (page_mkclean(hpage)) {
 			SetPageDirty(hpage);
 		} else {
diff --git a/mm/migrate.c b/mm/migrate.c
index 34a842a8eb6a7b..9d2f42a3a16294 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -503,7 +503,7 @@ int migrate_page_move_mapping(struct address_space *mapping,
 			__dec_lruvec_state(old_lruvec, NR_SHMEM);
 			__inc_lruvec_state(new_lruvec, NR_SHMEM);
 		}
-		if (dirty && mapping_cap_account_dirty(mapping)) {
+		if (dirty && mapping_can_writeback(mapping)) {
 			__dec_node_state(oldzone->zone_pgdat, NR_FILE_DIRTY);
 			__dec_zone_state(oldzone, NR_ZONE_WRITE_PENDING);
 			__inc_node_state(newzone->zone_pgdat, NR_FILE_DIRTY);
diff --git a/mm/mmap.c b/mm/mmap.c
index 40248d84ad5fbd..1fc0e92be4ba9b 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1666,7 +1666,7 @@ int vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot)
 
 	/* Can the mapping track the dirty pages? */
 	return vma->vm_file && vma->vm_file->f_mapping &&
-		mapping_cap_account_dirty(vma->vm_file->f_mapping);
+		mapping_can_writeback(vma->vm_file->f_mapping);
 }
 
 /*
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index 0139f9622a92da..358d6f28c627b7 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -1882,7 +1882,7 @@ void balance_dirty_pages_ratelimited(struct address_space *mapping)
 	int ratelimit;
 	int *p;
 
-	if (!bdi_cap_account_dirty(bdi))
+	if (!(bdi->capabilities & BDI_CAP_WRITEBACK))
 		return;
 
 	if (inode_cgwb_enabled(inode))
@@ -2423,7 +2423,7 @@ void account_page_dirtied(struct page *page, struct address_space *mapping)
 
 	trace_writeback_dirty_page(page, mapping);
 
-	if (mapping_cap_account_dirty(mapping)) {
+	if (mapping_can_writeback(mapping)) {
 		struct bdi_writeback *wb;
 
 		inode_attach_wb(inode, page);
@@ -2450,7 +2450,7 @@ void account_page_dirtied(struct page *page, struct address_space *mapping)
 void account_page_cleaned(struct page *page, struct address_space *mapping,
 			  struct bdi_writeback *wb)
 {
-	if (mapping_cap_account_dirty(mapping)) {
+	if (mapping_can_writeback(mapping)) {
 		dec_lruvec_page_state(page, NR_FILE_DIRTY);
 		dec_zone_page_state(page, NR_ZONE_WRITE_PENDING);
 		dec_wb_stat(wb, WB_RECLAIMABLE);
@@ -2513,7 +2513,7 @@ void account_page_redirty(struct page *page)
 {
 	struct address_space *mapping = page->mapping;
 
-	if (mapping && mapping_cap_account_dirty(mapping)) {
+	if (mapping && mapping_can_writeback(mapping)) {
 		struct inode *inode = mapping->host;
 		struct bdi_writeback *wb;
 		struct wb_lock_cookie cookie = {};
@@ -2625,7 +2625,7 @@ void __cancel_dirty_page(struct page *page)
 {
 	struct address_space *mapping = page_mapping(page);
 
-	if (mapping_cap_account_dirty(mapping)) {
+	if (mapping_can_writeback(mapping)) {
 		struct inode *inode = mapping->host;
 		struct bdi_writeback *wb;
 		struct wb_lock_cookie cookie = {};
@@ -2665,7 +2665,7 @@ int clear_page_dirty_for_io(struct page *page)
 
 	VM_BUG_ON_PAGE(!PageLocked(page), page);
 
-	if (mapping && mapping_cap_account_dirty(mapping)) {
+	if (mapping && mapping_can_writeback(mapping)) {
 		struct inode *inode = mapping->host;
 		struct bdi_writeback *wb;
 		struct wb_lock_cookie cookie = {};
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
