Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E9C4CBC95
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 12:33:05 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 688E642179F;
	Thu,  3 Mar 2022 12:33:05 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DBCC742178F
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 12:32:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=pCNCWpfqsCcmh/mmv96Si48HeO0wpOZcENTc8oumegs=;
	b=kvC5S+L1QpodRlpumVDpJ03rIF
	jZDRiLRSozha86xGaSDDUjirEYs1OHF72dgaX7WF9HUqFmD8bIHJcNG81nUu4O/XneoV33Hn1X2hF
	dLYFY5kZm3lzcYkqI9jnNb/yNQ/GPsWsN3qjjPxYLjhMWtgcG87RYRV1gTilRc39M1ifCKkXl+ltQ
	DEPUXZBR+3RNGnzuCTAsoGn02qGnSVC9it6HnWtF9bkAAe7BINg1WYZa4yC7nPvKSgm+bosFHCvC5
	xQlSrbMgujouPiJcDcdQr/JSRQD56mzOMWUGI69bpEuJgBQXKSnnw6i7V6DBXcLRYLxBExneRfJ8n
	GA+dFzag==;
Received: from [91.93.38.115] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPjhA-006DdN-4g; Thu, 03 Mar 2022 11:32:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Mar 2022 14:32:19 +0300
Message-Id: <20220303113223.326220-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303113223.326220-1-hch@lst.de>
References: <20220303113223.326220-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, linux-security-module@vger.kernel.org,
	drbd-dev@lists.linbit.com, Philipp Reisner <philipp.reisner@linbit.com>,
	Kees Cook <keescook@chromium.org>
Subject: [Drbd-dev] [PATCH 1/5] block: stop using bdevname in
	bdev_write_inode
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

Use the %pg format specifier to save on stack consuption and code size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bdev.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/block/bdev.c b/block/bdev.c
index a3632317c8aae..b4389f10ee7de 100644
--- a/block/bdev.c
+++ b/block/bdev.c
@@ -54,12 +54,10 @@ static void bdev_write_inode(struct block_device *bdev)
 	while (inode->i_state & I_DIRTY) {
 		spin_unlock(&inode->i_lock);
 		ret = write_inode_now(inode, true);
-		if (ret) {
-			char name[BDEVNAME_SIZE];
+		if (ret)
 			pr_warn_ratelimited("VFS: Dirty inode writeback failed "
-					    "for block device %s (err=%d).\n",
-					    bdevname(bdev, name), ret);
-		}
+					    "for block device %pg (err=%d).\n",
+					    bdev, ret);
 		spin_lock(&inode->i_lock);
 	}
 	spin_unlock(&inode->i_lock);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
