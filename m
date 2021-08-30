Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4813FC29E
	for <lists+drbd-dev@lfdr.de>; Tue, 31 Aug 2021 08:16:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BC479420960;
	Tue, 31 Aug 2021 08:16:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D4412420626
	for <drbd-dev@lists.linbit.com>; Tue, 31 Aug 2021 00:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=W3apyDTfrtDGuXTYQK+OmSU4FGgmy/H9wfwEpLs5rqk=;
	b=eRxwtnbOuCjq+GOlqRFAWmB6hM
	R1QtaWHhBn6o1goiAkeIQjjq4UUHDgwkh3ATvomJcleMeqo/01kIBIp8CBD4jrzkyyvCc7cCtiAyM
	87eGsFeLkTxqfg0u+IJXTtRC+jCdE168Em0kaDvuRLkEjebgSLssu3s0uchhlPmj92BVW/eSwHKzn
	BuOhaVd48gWDAWHxdGD8LxPPHo9XM79rF11HPb5DrRoai65XB4pOmJ9Qf9D8fMnTe9OX3IfcZo60V
	6M1/PwcsrBS+Btgag4ox1yca3wRZJS+uAAgJm6aT1CrYjV8NGuuOvuKqtymJ18zfmC+YDV4txPYZo
	qRuRL77g==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mKpTj-000khI-OU; Mon, 30 Aug 2021 22:10:07 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 30 Aug 2021 15:09:48 -0700
Message-Id: <20210830221000.179369-4-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830221000.179369-1-mcgrof@kernel.org>
References: <20210830221000.179369-1-mcgrof@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Aug 2021 08:16:44 +0200
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Luis Chamberlain <mcgrof@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 03/15] m68k/emu/nfblock: add error handling
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
