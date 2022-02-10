Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 023D44B0545
	for <lists+drbd-dev@lfdr.de>; Thu, 10 Feb 2022 06:39:20 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DC92342032B;
	Thu, 10 Feb 2022 06:39:19 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 31DA54202C4
	for <drbd-dev@lists.linbit.com>; Thu, 10 Feb 2022 06:38:53 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D576F1F43F;
	Thu, 10 Feb 2022 05:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1644471532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Tft3SoinWu7UxepEf8WEuD+UlaGfn26eHEwniJocVAs=;
	b=AZtdCcwJujZVCHcdXkKOM6szi0SH98wyFfZVUIfLZbgfuKnWcUV9h+nOyBGfZYHb4fgg9q
	0bzK8zlrysy2kvIK7aPM5QM5vklJlDnFMRJyEFrhh2ywPGPQAZRjcJ0eaWwg/TWCT1jT1c
	Y7P/mxpVQ0jyTZnT5empOfYlfVQmIKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1644471532;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Tft3SoinWu7UxepEf8WEuD+UlaGfn26eHEwniJocVAs=;
	b=yNiRicVz0d7OW6BOtosPuVbsxI1wCRGRy4fi5NKnYLY2dFaJO1i8uBQffBceecqdSDIthz
	JkyQL6tOSv8newBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4058513519;
	Thu, 10 Feb 2022 05:38:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id AC9zO+SkBGLMOAAAMHmgww
	(envelope-from <neilb@suse.de>); Thu, 10 Feb 2022 05:38:44 +0000
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
Date: Thu, 10 Feb 2022 16:37:52 +1100
Message-ID: <164447147258.23354.15753542879688740872.stgit@noble.brown>
In-Reply-To: <164447124918.23354.17858831070003318849.stgit@noble.brown>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>
User-Agent: StGit/0.23
MIME-Version: 1.0
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-ext4@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 03/11] MM: improve cleanup when ->readpages
 doesn't process all pages.
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

If ->readpages doesn't process all the pages, then it is best to act as
though they weren't requested so that a subsequent readahead can try
again.
So:
  - remove any 'ahead' pages from the page cache so they can be loaded
    with ->readahead() rather then multiple ->read()s
  - update the file_ra_state to reflect the reads that were actually
    submitted.

This allows ->readpages() to abort early due e.g.  to congestion, which
will then allow us to remove the inode_read_congested() test from
page_Cache_async_ra().

Signed-off-by: NeilBrown <neilb@suse.de>
---
 mm/readahead.c |   19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index c44b2957f59f..35a7ebfcb504 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -104,7 +104,13 @@
  * for necessary resources (e.g.  memory or indexing information) to
  * become available.  Pages in the final ``async_size`` may be
  * considered less urgent and failure to read them is more acceptable.
- * They will eventually be read individually using ->readpage().
+ * In this case it is best to use delete_from_page_cache() to remove the
+ * pages from the page cache as is automatically done for pages that
+ * were not fetched with readahead_page().  This will allow a
+ * subsequent synchronous read ahead request to try them again.  If they
+ * are left in the page cache, then they will be read individually using
+ * ->readpage().
+ *
  */
 
 #include <linux/kernel.h>
@@ -226,8 +232,17 @@ static void read_pages(struct readahead_control *rac, struct list_head *pages,
 
 	if (aops->readahead) {
 		aops->readahead(rac);
-		/* Clean up the remaining pages */
+		/*
+		 * Clean up the remaining pages.  The sizes in ->ra
+		 * maybe be used to size next read-ahead, so make sure
+		 * they accurately reflect what happened.
+		 */
 		while ((page = readahead_page(rac))) {
+			rac->ra->size -= 1;
+			if (rac->ra->async_size > 0) {
+				rac->ra->async_size -= 1;
+				delete_from_page_cache(page);
+			}
 			unlock_page(page);
 			put_page(page);
 		}


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
