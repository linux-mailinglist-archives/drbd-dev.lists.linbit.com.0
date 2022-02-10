Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3374F4B0584
	for <lists+drbd-dev@lfdr.de>; Thu, 10 Feb 2022 06:44:20 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0DD63420BA7;
	Thu, 10 Feb 2022 06:44:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ACBFD420639
	for <drbd-dev@lists.linbit.com>; Thu, 10 Feb 2022 06:42:16 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8D1C9210F6;
	Thu, 10 Feb 2022 05:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1644471706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=zUXE+p4nU0NR3LK33keTKiC3MiGpqHZzDnhCV/FYFVc=;
	b=1iOjcBu6oE+BXqXEFHtabUHK7sZNNAt+F9BXNB5uV7m3v4yti6KzGXBiLv7VLruTI3nEpR
	RzUf48rnigX5xLwZY9cqLSfPrG7m7EbPedvqO83z8P0IJauCacL1yhTk9JKT9feAU1DqJI
	KUpM8T9cgXJ5IztxA4OlP16a8F1IH8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1644471706;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=zUXE+p4nU0NR3LK33keTKiC3MiGpqHZzDnhCV/FYFVc=;
	b=0ZiiWmrlykQukuniHTdmeJDPxTmHcRtiUSrL0vXadFeW3t9RQIDNXluXWa7JinzIWwJ++B
	zkp5vHuwQfZju0DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D113C13519;
	Thu, 10 Feb 2022 05:41:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id wj+/IpKlBGLHOQAAMHmgww
	(envelope-from <neilb@suse.de>); Thu, 10 Feb 2022 05:41:38 +0000
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
Message-ID: <164447147264.23354.2763356897218946255.stgit@noble.brown>
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
Subject: [Drbd-dev] [PATCH 10/11] block/bfq-iosched.c: use "false" rather
 than "BLK_RW_ASYNC"
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

bfq_get_queue() expects a "bool" for the third arg, so pass "false"
rather than "BLK_RW_ASYNC" which will soon be removed.

Acked-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: NeilBrown <neilb@suse.de>
---
 block/bfq-iosched.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
index 0c612a911696..4e645ae1e066 100644
--- a/block/bfq-iosched.c
+++ b/block/bfq-iosched.c
@@ -5448,7 +5448,7 @@ static void bfq_check_ioprio_change(struct bfq_io_cq *bic, struct bio *bio)
 	bfqq = bic_to_bfqq(bic, false);
 	if (bfqq) {
 		bfq_release_process_ref(bfqd, bfqq);
-		bfqq = bfq_get_queue(bfqd, bio, BLK_RW_ASYNC, bic, true);
+		bfqq = bfq_get_queue(bfqd, bio, false, bic, true);
 		bic_set_bfqq(bic, bfqq, false);
 	}
 


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
