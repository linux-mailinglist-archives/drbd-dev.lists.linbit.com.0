Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAD84BEFFB
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Feb 2022 04:18:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 159044205DD;
	Tue, 22 Feb 2022 04:18:51 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 611A24201FE
	for <drbd-dev@lists.linbit.com>; Tue, 22 Feb 2022 04:18:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4E595210E8;
	Tue, 22 Feb 2022 03:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1645499899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=3OkKqvLyN2IhyRSty9OyAuPcNggTPekSnj8bweppnlI=;
	b=jR/KoIwlb6a3UIr9TrCV5x1JdEiSvjSp64jWgiX6/QBhrvQ3QyWIEyjxgLghsJfBCPxxgD
	DdGdhnsB9Wf59g9oa8zhvS58vIMffM/YaIo1dRAKLasBYhr7J1fAbxZjdvjckRvVKeVEQg
	awA0pHItXie5pbWiNeEJolCy85RKnq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1645499899;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=3OkKqvLyN2IhyRSty9OyAuPcNggTPekSnj8bweppnlI=;
	b=DPgRC/NXf1A2dDURE4U2DmW+Z4JIxwtdK7HAUPmPgIYi3sHRPQol0/VNvqhfFSOPBJC3mp
	qGJzsvqSDhrXvcBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3F53C13BA7;
	Tue, 22 Feb 2022 03:18:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id J95fN/BVFGJvWgAAMHmgww
	(envelope-from <neilb@suse.de>); Tue, 22 Feb 2022 03:18:08 +0000
From: NeilBrown <neilb@suse.de>
To: Andrew Morton <akpm@linux-foundation.org>, Jan Kara <jack@suse.cz>,
	Wu Fengguang <fengguang.wu@intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>, Miklos Szeredi <miklos@szeredi.hu>, 
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Anna Schumaker <anna.schumaker@netapp.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Paolo Valente <paolo.valente@linaro.org>, Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Feb 2022 14:17:17 +1100
Message-ID: <164549983734.9187.11586890887006601405.stgit@noble.brown>
In-Reply-To: <164549971112.9187.16871723439770288255.stgit@noble.brown>
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-ext4@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 02/11] MM: document and polish read-ahead code.
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

Add some "big-picture" documentation for read-ahead and polish the code
to make it fit this documentation.

The meaning of ->async_size is clarified to match its name.
i.e. Any request to ->readahead() has a sync part and an async part.
The caller will wait for the sync pages to complete, but will not wait
for the async pages.  The first async page is still marked PG_readahead

Note that the current function names page_cache_sync_ra() and
page_cache_async_ra() are misleading.  All ra request are partly sync
and partly async, so either part can be empty.
A page_cache_sync_ra() request will usually set ->async_size non-zero,
implying it is not all synchronous.
When a non-zero req_count is passed to page_cache_async_ra(), the
implication is that some prefix of the request is synchronous, though
the calculation made there is incorrect - I haven't tried to fix it.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 Documentation/core-api/mm-api.rst |   19 ++++++-
 Documentation/filesystems/vfs.rst |   16 ++++--
 include/linux/fs.h                |    9 +++
 mm/readahead.c                    |   99 +++++++++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/mm-api.rst b/Documentation/core-api/mm-api.rst
index 395835f9289f..f5b2f92822c8 100644
--- a/Documentation/core-api/mm-api.rst
+++ b/Documentation/core-api/mm-api.rst
@@ -58,15 +58,30 @@ Virtually Contiguous Mappings
 File Mapping and Page Cache
 ===========================
 
-.. kernel-doc:: mm/readahead.c
-   :export:
+Filemap
+-------
 
 .. kernel-doc:: mm/filemap.c
    :export:
 
+Readahead
+---------
+
+.. kernel-doc:: mm/readahead.c
+   :doc: Readahead Overview
+
+.. kernel-doc:: mm/readahead.c
+   :export:
+
+Writeback
+---------
+
 .. kernel-doc:: mm/page-writeback.c
    :export:
 
+Truncate
+--------
+
 .. kernel-doc:: mm/truncate.c
    :export:
 
diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index bf5c48066fac..b4a0baa46dcc 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -806,12 +806,16 @@ cache in your filesystem.  The following members are defined:
 	object.  The pages are consecutive in the page cache and are
 	locked.  The implementation should decrement the page refcount
 	after starting I/O on each page.  Usually the page will be
-	unlocked by the I/O completion handler.  If the filesystem decides
-	to stop attempting I/O before reaching the end of the readahead
-	window, it can simply return.  The caller will decrement the page
-	refcount and unlock the remaining pages for you.  Set PageUptodate
-	if the I/O completes successfully.  Setting PageError on any page
-	will be ignored; simply unlock the page if an I/O error occurs.
+	unlocked by the I/O completion handler.  The set of pages are
+	divided into some sync pages followed by some async pages,
+	rac->ra->async_size gives the number of async pages.  The
+	filesystem should attempt to read all sync pages but may decide
+	to stop once it reaches the async pages.  If it does decide to
+	stop attempting I/O, it can simply return.  The caller will
+	remove the remaining pages from the address space, unlock them
+	and decrement the page refcount.  Set PageUptodate if the I/O
+	completes successfully.  Setting PageError on any page will be
+	ignored; simply unlock the page if an I/O error occurs.
 
 ``readpages``
 	called by the VM to read pages associated with the address_space
diff --git a/include/linux/fs.h b/include/linux/fs.h
index e2d892b201b0..8b5c486bd4a2 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -930,10 +930,15 @@ struct fown_struct {
  * struct file_ra_state - Track a file's readahead state.
  * @start: Where the most recent readahead started.
  * @size: Number of pages read in the most recent readahead.
- * @async_size: Start next readahead when this many pages are left.
- * @ra_pages: Maximum size of a readahead request.
+ * @async_size: Numer of pages that were/are not needed immediately
+ *      and so were/are genuinely "ahead".  Start next readahead when
+ *      the first of these pages is accessed.
+ * @ra_pages: Maximum size of a readahead request, copied from the bdi.
  * @mmap_miss: How many mmap accesses missed in the page cache.
  * @prev_pos: The last byte in the most recent read request.
+ *
+ * When this structure is passed to ->readahead(), the "most recent"
+ * readahead means the current readahead.
  */
 struct file_ra_state {
 	pgoff_t start;
diff --git a/mm/readahead.c b/mm/readahead.c
index cf0dcf89eb69..73b2bc5302e0 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -8,6 +8,105 @@
  *		Initial version.
  */
 
+/**
+ * DOC: Readahead Overview
+ *
+ * Readahead is used to read content into the page cache before it is
+ * explicitly requested by the application.  Readahead only ever
+ * attempts to read pages that are not yet in the page cache.  If a
+ * page is present but not up-to-date, readahead will not try to read
+ * it. In that case a simple ->readpage() will be requested.
+ *
+ * Readahead is triggered when an application read request (whether a
+ * systemcall or a page fault) finds that the requested page is not in
+ * the page cache, or that it is in the page cache and has the
+ * %PG_readahead flag set.  This flag indicates that the page was loaded
+ * as part of a previous read-ahead request and now that it has been
+ * accessed, it is time for the next read-ahead.
+ *
+ * Each readahead request is partly synchronous read, and partly async
+ * read-ahead.  This is reflected in the struct file_ra_state which
+ * contains ->size being to total number of pages, and ->async_size
+ * which is the number of pages in the async section.  The first page in
+ * this async section will have %PG_readahead set as a trigger for a
+ * subsequent read ahead.  Once a series of sequential reads has been
+ * established, there should be no need for a synchronous component and
+ * all read ahead request will be fully asynchronous.
+ *
+ * When either of the triggers causes a readahead, three numbers need to
+ * be determined: the start of the region, the size of the region, and
+ * the size of the async tail.
+ *
+ * The start of the region is simply the first page address at or after
+ * the accessed address, which is not currently populated in the page
+ * cache.  This is found with a simple search in the page cache.
+ *
+ * The size of the async tail is determined by subtracting the size that
+ * was explicitly requested from the determined request size, unless
+ * this would be less than zero - then zero is used.  NOTE THIS
+ * CALCULATION IS WRONG WHEN THE START OF THE REGION IS NOT THE ACCESSED
+ * PAGE.
+ *
+ * The size of the region is normally determined from the size of the
+ * previous readahead which loaded the preceding pages.  This may be
+ * discovered from the struct file_ra_state for simple sequential reads,
+ * or from examining the state of the page cache when multiple
+ * sequential reads are interleaved.  Specifically: where the readahead
+ * was triggered by the %PG_readahead flag, the size of the previous
+ * readahead is assumed to be the number of pages from the triggering
+ * page to the start of the new readahead.  In these cases, the size of
+ * the previous readahead is scaled, often doubled, for the new
+ * readahead, though see get_next_ra_size() for details.
+ *
+ * If the size of the previous read cannot be determined, the number of
+ * preceding pages in the page cache is used to estimate the size of
+ * a previous read.  This estimate could easily be misled by random
+ * reads being coincidentally adjacent, so it is ignored unless it is
+ * larger than the current request, and it is not scaled up, unless it
+ * is at the start of file.
+ *
+ * In general read ahead is accelerated at the start of the file, as
+ * reads from there are often sequential.  There are other minor
+ * adjustments to the read ahead size in various special cases and these
+ * are best discovered by reading the code.
+ *
+ * The above calculation determines the readahead, to which any requested
+ * read size may be added.
+ *
+ * Readahead requests are sent to the filesystem using the ->readahead()
+ * address space operation, for which mpage_readahead() is a canonical
+ * implementation.  ->readahead() should normally initiate reads on all
+ * pages, but may fail to read any or all pages without causing an IO
+ * error.  The page cache reading code will issue a ->readpage() request
+ * for any page which ->readahead() does not provided, and only an error
+ * from this will be final.
+ *
+ * ->readahead() will generally call readahead_page() repeatedly to get
+ * each page from those prepared for read ahead.  It may fail to read a
+ * page by:
+ *
+ * * not calling readahead_page() sufficiently many times, effectively
+ *   ignoring some pages, as might be appropriate if the path to
+ *   storage is congested.
+ *
+ * * failing to actually submit a read request for a given page,
+ *   possibly due to insufficient resources, or
+ *
+ * * getting an error during subsequent processing of a request.
+ *
+ * In the last two cases, the page should be unlocked to indicate that
+ * the read attempt has failed.  In the first case the page will be
+ * unlocked by the caller.
+ *
+ * Those pages not in the final ``async_size`` of the request should be
+ * considered to be important and ->readahead() should not fail them due
+ * to congestion or temporary resource unavailability, but should wait
+ * for necessary resources (e.g.  memory or indexing information) to
+ * become available.  Pages in the final ``async_size`` may be
+ * considered less urgent and failure to read them is more acceptable.
+ * They will eventually be read individually using ->readpage().
+ */
+
 #include <linux/kernel.h>
 #include <linux/dax.h>
 #include <linux/gfp.h>


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
