Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E78C41A2DE
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Sep 2021 00:24:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7D672420950;
	Tue, 28 Sep 2021 00:24:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 88D15420950
	for <drbd-dev@lists.linbit.com>; Tue, 28 Sep 2021 00:22:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8Tqj5TdypJFI9LKCX1GYcX8SMXGQKJv6MnhgBe11KFw=;
	b=mzs3LZQa/W+/kFjAVDF2BntjfL
	PZjeTLtE7vD4VHrvKk12WqIjPIkdNzWkdRxHe9pzEFQOBs9JLDVJTk0h8oEvECSLdYuCeL6EYHCz/
	F63qAuwhJrIvKlVPT9Ekp9vi8B4CJz5gX9/F9r6rfdskHPMHSs2hxpQOVZyksJOuA6R35xeQadBua
	nR0n+PkjEzzjVunTdZGw8qirchD3uQ73eLPSp7TGeQy9lO+jLtGXu0jRtXqpfVLtpz9WZbWilltyq
	wTZDY4U5UMhtjlic8pV3eaHBYf/47UYExbcFDQmhE5zO/I2HzzBt90ikAf+Kpxrwc52vZ5THOvWes
	0mHDoFNg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mUygS-004TPi-8D; Mon, 27 Sep 2021 22:01:12 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 27 Sep 2021 15:01:08 -0700
Message-Id: <20210927220110.1066271-14-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220110.1066271-1-mcgrof@kernel.org>
References: <20210927220110.1066271-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Luis Chamberlain <mcgrof@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 13/15] pcd: fix ordering of unregister_cdrom()
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

We first register cdrom and then we add_disk() and
so we we should likewise unregister the cdrom first and
then del_gendisk().

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/paride/pcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
index a7fab3830d7b..82a654fc4db8 100644
--- a/drivers/block/paride/pcd.c
+++ b/drivers/block/paride/pcd.c
@@ -1021,9 +1021,9 @@ static void __exit pcd_exit(void)
 		if (!cd->present)
 			continue;
 
+		unregister_cdrom(&cd->info);
 		del_gendisk(cd->disk);
 		pi_release(cd->pi);
-		unregister_cdrom(&cd->info);
 		blk_cleanup_disk(cd->disk);
 
 		blk_mq_free_tag_set(&cd->tag_set);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
