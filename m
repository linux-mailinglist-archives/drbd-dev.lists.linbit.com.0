Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE83FC29F
	for <lists+drbd-dev@lfdr.de>; Tue, 31 Aug 2021 08:16:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DC1FB420965;
	Tue, 31 Aug 2021 08:16:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 57ED4420629
	for <drbd-dev@lists.linbit.com>; Tue, 31 Aug 2021 00:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=hQpc9Bt96A8NsIGsTZlgxwf8NGt2COgjAu8WZh0eqQI=;
	b=lqZjOsvPpbo3iaqwzw0Xf0z3LB
	QuVCHBK7Vo83UWNG4DG1RW5uvFpqNfELCzxwf/I0pysV1KiUs6dTOkmAt97Iyhp34pP/6v/B5hh3Q
	ikdYvQdQicXlWig6OZqWuTavl1aL8qOhNq5JoxxHg5crCwspmjqwynessQjuBaOwE9sq4XroFKOUK
	eTCI0zxZfhr7VKdS5LB2/xVvHxAvUElGLp7U2EgH9PXH168I9vZBD7MCHcs6HyOsxhLI9uHMpuHDn
	gQgjliWZrsnWziSE5bCNMqJL+Ueu5h/3SNH96cbQk1TXbBRhdj2WhVU7ctuPd18k10YL5j3aWs9n1
	W+MueH8Q==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mKpTj-000khE-Jv; Mon, 30 Aug 2021 22:10:07 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 30 Aug 2021 15:09:46 -0700
Message-Id: <20210830221000.179369-2-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830221000.179369-1-mcgrof@kernel.org>
References: <20210830221000.179369-1-mcgrof@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Aug 2021 08:16:44 +0200
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Luis Chamberlain <mcgrof@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 01/15] z2ram: add error handling support for
	add_disk()
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
error handling. Only the disk is cleaned up inside
z2ram_register_disk() as the caller deals with the rest.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/z2ram.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
index 4eef218108c6..6648bbc87c30 100644
--- a/drivers/block/z2ram.c
+++ b/drivers/block/z2ram.c
@@ -318,6 +318,7 @@ static const struct blk_mq_ops z2_mq_ops = {
 static int z2ram_register_disk(int minor)
 {
 	struct gendisk *disk;
+	int err;
 
 	disk = blk_mq_alloc_disk(&tag_set, NULL);
 	if (IS_ERR(disk))
@@ -333,8 +334,10 @@ static int z2ram_register_disk(int minor)
 		sprintf(disk->disk_name, "z2ram");
 
 	z2ram_gendisk[minor] = disk;
-	add_disk(disk);
-	return 0;
+	err = add_disk(disk);
+	if (err)
+		blk_cleaup_disk(disk);
+	return err;
 }
 
 static int __init z2_init(void)
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
