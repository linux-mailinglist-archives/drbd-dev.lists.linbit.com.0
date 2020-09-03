Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF4125BACA
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Sep 2020 08:03:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D5518425364;
	Thu,  3 Sep 2020 08:03:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7B8E24250D4
	for <drbd-dev@lists.linbit.com>; Thu,  3 Sep 2020 08:02:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JQnCJBON1sn/4yitAjO2mH+MoAGoHyOFDo8QjS0s8n0=;
	b=j0Hqh/k47lPTcKRnhzTR7dphUz
	AGTjjNl88wFEfqT9P9PN+5atuOJW9p+ZEqU13dNQtha13ugy3vn+qgbwIzJHiXCoHaDaHwkvom7PH
	mtizJ6vHdenvwyo2L3nvaxFlSa5sNGKbs9rshDqjFWNZJdYXJ/sy9zzcdpqTHpzoKsBGZ1b9SgFEi
	S2ugmd+WP+Nwk+NBBgqJ5JI/vgFbH9ht2AdJLC9EPl10N+NkYQvuQ6IquTFxaRF3QXiqatcS82VZR
	qbYdRywI+ZDGnH2XVz4xS5pLDYeiMmx7fWETkKM4LGkiZW9AEiSRklSmG26NIkOIasK2Wjrswn+VY
	ODfMFaoQ==;
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhzl-0007Ox-8y; Thu, 03 Sep 2020 05:41:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Sep 2020 07:41:02 +0200
Message-Id: <20200903054104.228829-8-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903054104.228829-1-hch@lst.de>
References: <20200903054104.228829-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 7/9] target/iblock: fix holder printing in
	iblock_show_configfs_dev_params
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

bd_contains is never NULL for an open block device.  In addition ibd_bd
is always set to a block device that was exclusively opened by the
target code, so the holder is guranteed to be ib_dev as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/target/target_core_iblock.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/target/target_core_iblock.c b/drivers/target/target_core_iblock.c
index 1c181d31f4c872..f2bd2e207e0b36 100644
--- a/drivers/target/target_core_iblock.c
+++ b/drivers/target/target_core_iblock.c
@@ -611,9 +611,8 @@ static ssize_t iblock_show_configfs_dev_params(struct se_device *dev, char *b)
 	bl += sprintf(b + bl, "        ");
 	if (bd) {
 		bl += sprintf(b + bl, "Major: %d Minor: %d  %s\n",
-			MAJOR(bd->bd_dev), MINOR(bd->bd_dev), (!bd->bd_contains) ?
-			"" : (bd->bd_holder == ib_dev) ?
-			"CLAIMED: IBLOCK" : "CLAIMED: OS");
+			MAJOR(bd->bd_dev), MINOR(bd->bd_dev),
+			"CLAIMED: IBLOCK");
 	} else {
 		bl += sprintf(b + bl, "Major: 0 Minor: 0\n");
 	}
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
