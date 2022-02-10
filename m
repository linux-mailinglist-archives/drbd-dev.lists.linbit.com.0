Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2F4B0550
	for <lists+drbd-dev@lfdr.de>; Thu, 10 Feb 2022 06:39:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 831654205EB;
	Thu, 10 Feb 2022 06:39:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC339420012
	for <drbd-dev@lists.linbit.com>; Thu, 10 Feb 2022 06:38:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 807BD212BF;
	Thu, 10 Feb 2022 05:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1644471509;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=TNOQTzqXc1dwn0sxVclyo5qS7TsZyCY45jkw8WmjP7o=;
	b=auHoL5UkDA+g+STXd2fTFeL3cTfMH9KQgn4il9BORLboaA+LBd59sP0b5doGLioeVsK7jS
	NShc0YB+A9Hl8fbDJUMCdNeyKFFuCjUVWYjrf+jYzzgjFshprl/gW+8UNyMq+HxYzzky2n
	Df0gmTbPZ1tSdb71oNen1V3bKLmTvAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1644471509;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=TNOQTzqXc1dwn0sxVclyo5qS7TsZyCY45jkw8WmjP7o=;
	b=Kanl6OTnMHXJGXAfirc08l5F/NB5YY6FVkspt6BY1Mm/9aCVURAybuHge0yPu9tXIJs/5P
	A9fVQ05kFoLISgCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C124B13519;
	Thu, 10 Feb 2022 05:38:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id i2fSHs2kBGKsOAAAMHmgww
	(envelope-from <neilb@suse.de>); Thu, 10 Feb 2022 05:38:21 +0000
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
Message-ID: <164447147255.23354.3738954641174277133.stgit@noble.brown>
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
Subject: [Drbd-dev] [PATCH 01/11] DOC: convert 'subsection' to 'section' in
	gfp.h
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

Various DOC: sections in gfp.h have subsection headers (~~~) but the
place where they are included in mm-api.rst does not have section, only
chapters.
So convert to section headers (---) to avoid confusion.  Specifically if
section are added later in mm-api.rst, an error results.

Signed-off-by: NeilBrown <neilb@suse.de>
---
 include/linux/gfp.h |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index 80f63c862be5..20f6fbe12993 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -79,7 +79,7 @@ struct vm_area_struct;
  * DOC: Page mobility and placement hints
  *
  * Page mobility and placement hints
- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * ---------------------------------
  *
  * These flags provide hints about how mobile the page is. Pages with similar
  * mobility are placed within the same pageblocks to minimise problems due
@@ -112,7 +112,7 @@ struct vm_area_struct;
  * DOC: Watermark modifiers
  *
  * Watermark modifiers -- controls access to emergency reserves
- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * ------------------------------------------------------------
  *
  * %__GFP_HIGH indicates that the caller is high-priority and that granting
  * the request is necessary before the system can make forward progress.
@@ -144,7 +144,7 @@ struct vm_area_struct;
  * DOC: Reclaim modifiers
  *
  * Reclaim modifiers
- * ~~~~~~~~~~~~~~~~~
+ * -----------------
  * Please note that all the following flags are only applicable to sleepable
  * allocations (e.g. %GFP_NOWAIT and %GFP_ATOMIC will ignore them).
  *
@@ -224,7 +224,7 @@ struct vm_area_struct;
  * DOC: Action modifiers
  *
  * Action modifiers
- * ~~~~~~~~~~~~~~~~
+ * ----------------
  *
  * %__GFP_NOWARN suppresses allocation failure reports.
  *
@@ -256,7 +256,7 @@ struct vm_area_struct;
  * DOC: Useful GFP flag combinations
  *
  * Useful GFP flag combinations
- * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+ * ----------------------------
  *
  * Useful GFP flag combinations that are commonly used. It is recommended
  * that subsystems start with one of these combinations and then set/clear


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
