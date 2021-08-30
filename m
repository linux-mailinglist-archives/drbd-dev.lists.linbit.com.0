Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F16B3FC29C
	for <lists+drbd-dev@lfdr.de>; Tue, 31 Aug 2021 08:16:52 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 81EB9420955;
	Tue, 31 Aug 2021 08:16:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7E270420621
	for <drbd-dev@lists.linbit.com>; Tue, 31 Aug 2021 00:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=USXvhbRCxERAyh/lmGR9Fl4mrHzKV90ugeqiIsioc48=;
	b=hct/qvJvbyLNLIeUzs1hESxsqy
	dsG5KX/2NuM4tcVggxsBGSS4l5EmQx45dJlzr4pFEzZWqDEZyLAolRwXHa3mmukZRbZd9TJyYiUJX
	BpCU8zTJva+L3uomzVi3C7WTCgqVhM4lGPchRtQxmp1FSZqSbf7HWpv4dMxGeFGhAqU4F6jUznbBS
	PeQkoOqgM99h4NlleYRgduJFM0FTaFoUV8h0jBCi03DqrefkeYtc47QnUw+/K8/CPrG7ih0nvD4+U
	vYtDk60Q7KSO0CLLZLkAJcEfTyuLY1mRLEj2jh+MTKTUXHgIoxiXZwCOyjdwz9w54hPzf5GhoRREG
	89o7fnVw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mKpTj-000khO-To; Mon, 30 Aug 2021 22:10:07 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 30 Aug 2021 15:09:50 -0700
Message-Id: <20210830221000.179369-6-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830221000.179369-1-mcgrof@kernel.org>
References: <20210830221000.179369-1-mcgrof@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Aug 2021 08:16:44 +0200
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Luis Chamberlain <mcgrof@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 05/15] um/drivers/ubd_kern: add error handling
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

ubd_disk_register() never returned an error, so just fix
that now and let the caller handle the error condition.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 arch/um/drivers/ubd_kern.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/um/drivers/ubd_kern.c b/arch/um/drivers/ubd_kern.c
index cd9dc0556e91..81045c199c30 100644
--- a/arch/um/drivers/ubd_kern.c
+++ b/arch/um/drivers/ubd_kern.c
@@ -854,8 +854,8 @@ static const struct attribute_group *ubd_attr_groups[] = {
 	NULL,
 };
 
-static void ubd_disk_register(int major, u64 size, int unit,
-			      struct gendisk *disk)
+static int ubd_disk_register(int major, u64 size, int unit,
+			     struct gendisk *disk)
 {
 	disk->major = major;
 	disk->first_minor = unit << UBD_SHIFT;
@@ -872,7 +872,7 @@ static void ubd_disk_register(int major, u64 size, int unit,
 
 	disk->private_data = &ubd_devs[unit];
 	disk->queue = ubd_devs[unit].queue;
-	device_add_disk(&ubd_devs[unit].pdev.dev, disk, ubd_attr_groups);
+	return device_add_disk(&ubd_devs[unit].pdev.dev, disk, ubd_attr_groups);
 }
 
 #define ROUND_BLOCK(n) ((n + (SECTOR_SIZE - 1)) & (-SECTOR_SIZE))
@@ -919,10 +919,15 @@ static int ubd_add(int n, char **error_out)
 	blk_queue_write_cache(ubd_dev->queue, true, false);
 	blk_queue_max_segments(ubd_dev->queue, MAX_SG);
 	blk_queue_segment_boundary(ubd_dev->queue, PAGE_SIZE - 1);
-	ubd_disk_register(UBD_MAJOR, ubd_dev->size, n, disk);
+	err = ubd_disk_register(UBD_MAJOR, ubd_dev->size, n, disk);
+	if (err)
+		goto out_cleanup_disk;
+
 	ubd_gendisk[n] = disk;
 	return 0;
 
+out_cleanup_disk:
+	blk_cleanup_disk(disk);
 out_cleanup_tags:
 	blk_mq_free_tag_set(&ubd_dev->tag_set);
 out:
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
