Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CA23FC29D
	for <lists+drbd-dev@lfdr.de>; Tue, 31 Aug 2021 08:16:53 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9A86642095A;
	Tue, 31 Aug 2021 08:16:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 24B39420625
	for <drbd-dev@lists.linbit.com>; Tue, 31 Aug 2021 00:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=8Tqj5TdypJFI9LKCX1GYcX8SMXGQKJv6MnhgBe11KFw=;
	b=s2mRwTN9A0ayu3FLnaCaRM2c2O
	2FWBh6vzZHYtgRmh76EyjTtWzXh2kQ9FFa60d6x5SAImBhBj+YRqHg7yA7RD93ODV5eWnIo9v+1TE
	GLc9R75Q5HI6Fp/LOmUNOZkyyeuBEAlUHDguBEP5vTKBNyo0xOOXkUYhGv8e6LCrHlCyu8FzKEUem
	AnUY7M86GN0BWDjYGKT2GFQ6HpJXa2aoh3Zj7ny2ZiOKWJxSeTydFgIICno9j0gq37CNAKsNsARSw
	ogYjb1A/XK+wuHTf1FhZnInJPOjCva+/yOJyMIL9Wipztb/LFOvE5FsJQziBMIYbvjHq1Uy31kKR8
	IUBB5zMg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mKpTk-000khg-AZ; Mon, 30 Aug 2021 22:10:08 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 30 Aug 2021 15:09:58 -0700
Message-Id: <20210830221000.179369-14-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830221000.179369-1-mcgrof@kernel.org>
References: <20210830221000.179369-1-mcgrof@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Aug 2021 08:16:44 +0200
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Luis Chamberlain <mcgrof@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 13/15] pcd: fix ordering of unregister_cdrom()
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
