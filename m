Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A002B41A22E
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Sep 2021 00:03:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6BB7B4208A4;
	Tue, 28 Sep 2021 00:03:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 950A44205FC
	for <drbd-dev@lists.linbit.com>; Tue, 28 Sep 2021 00:01:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=agaE6D36LcS3m3yT/hy8ziCroVpqabvNI/EGY/bikug=;
	b=rDrGuHRz4Mi4O2WZ9Vjqozc2xM
	CSr3B1VsRIE9vtSInYTpOIu1qJalD6Q0vH2rQMNi3CwU2tQzdDNESJGwx7O+l/gVpNhJKNyZwI9eB
	YmmTn48w6S0dIZLJDvW6TBlKRWwqsTHZ762pxA03ZfpctLtyj/5rMrvep9ql7yGu+dLv0K9R3kcAb
	mVnaUpxsWZD8jUIT+1rxojGXC7rLv47JGzZ7YU0KvblzGaAfG0s4V/uwSiJUZaz2E7fmDNuvLTJ7P
	5azHIToaMRwuzlbEopQB3a1YJbbXGC/jdVLAkmmCKc2JxSPEgkKIGG3PisxTcjpH/Xz3JnFVxgM9y
	8kdmOM9Q==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mUygR-004TPK-OB; Mon, 27 Sep 2021 22:01:11 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 27 Sep 2021 15:00:58 -0700
Message-Id: <20210927220110.1066271-4-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220110.1066271-1-mcgrof@kernel.org>
References: <20210927220110.1066271-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Luis Chamberlain <mcgrof@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 03/15] m68k/emu/nfblock: add error handling
	support for add_disk()
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

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 arch/m68k/emu/nfblock.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/m68k/emu/nfblock.c b/arch/m68k/emu/nfblock.c
index 9a8394e96388..4de5a6087034 100644
--- a/arch/m68k/emu/nfblock.c
+++ b/arch/m68k/emu/nfblock.c
@@ -100,6 +100,7 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
 {
 	struct nfhd_device *dev;
 	int dev_id = id - NFHD_DEV_OFFSET;
+	int err = -ENOMEM;
 
 	pr_info("nfhd%u: found device with %u blocks (%u bytes)\n", dev_id,
 		blocks, bsize);
@@ -130,16 +131,20 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
 	sprintf(dev->disk->disk_name, "nfhd%u", dev_id);
 	set_capacity(dev->disk, (sector_t)blocks * (bsize / 512));
 	blk_queue_logical_block_size(dev->disk->queue, bsize);
-	add_disk(dev->disk);
+	err = add_disk(dev->disk);
+	if (err)
+		goto out_cleanup_disk;
 
 	list_add_tail(&dev->list, &nfhd_list);
 
 	return 0;
 
+out_cleanup_disk:
+	blk_cleanup_disk(dev->disk);
 free_dev:
 	kfree(dev);
 out:
-	return -ENOMEM;
+	return err;
 }
 
 static int __init nfhd_init(void)
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
