Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AF341A283
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Sep 2021 00:05:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AAE2242095F;
	Tue, 28 Sep 2021 00:05:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 53050420629
	for <drbd-dev@lists.linbit.com>; Tue, 28 Sep 2021 00:01:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=T9eCqOQRvpBijkMagg7pwr5fiJ/Yqy7eE80sQLHpZoI=;
	b=ZxBjWAMOGlsRdtCPxng1cmqC77
	/fYbKL0FSQjiD2CzyehxJ/G7u1sw86YFKN/wN4H5WrQP4Xa+25HZz8VZ0cj5ywdnFWJIlSP+g+Ckl
	mqI9XcqLEldiIEaXPT9u7eRU6SRINslGtabygGz2WOihyoWqib6SHNftpnZdXKcGpWXlTghXXIj4X
	hJQ6s0ENbrCOZPmgkCv4TW1o77PsNl2WZH7f5r8Nrj38o+099lP1p02VjyCotuxPgI4vtLgwjNasg
	AnFT6H9ZnsYBowOLNl8oQe6apTqtJp0sA1dmn0yoA8vQ8WBBIx/YKhw+QytI9PX5OqI/aDvaeICUG
	l+YmIITQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mUygR-004TPQ-Sz; Mon, 27 Sep 2021 22:01:11 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 27 Sep 2021 15:01:01 -0700
Message-Id: <20210927220110.1066271-7-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220110.1066271-1-mcgrof@kernel.org>
References: <20210927220110.1066271-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Luis Chamberlain <mcgrof@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 06/15] xtensa/platforms/iss/simdisk: add error
	handling support for add_disk()
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
 arch/xtensa/platforms/iss/simdisk.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/platforms/iss/simdisk.c b/arch/xtensa/platforms/iss/simdisk.c
index 3cdfa00738e0..ad85c554cd45 100644
--- a/arch/xtensa/platforms/iss/simdisk.c
+++ b/arch/xtensa/platforms/iss/simdisk.c
@@ -259,6 +259,7 @@ static int __init simdisk_setup(struct simdisk *dev, int which,
 		struct proc_dir_entry *procdir)
 {
 	char tmp[2] = { '0' + which, 0 };
+	int err = -ENOMEM;
 
 	dev->fd = -1;
 	dev->filename = NULL;
@@ -267,7 +268,7 @@ static int __init simdisk_setup(struct simdisk *dev, int which,
 
 	dev->gd = blk_alloc_disk(NUMA_NO_NODE);
 	if (!dev->gd)
-		return -ENOMEM;
+		goto out;
 	dev->gd->major = simdisk_major;
 	dev->gd->first_minor = which;
 	dev->gd->minors = SIMDISK_MINORS;
@@ -275,10 +276,18 @@ static int __init simdisk_setup(struct simdisk *dev, int which,
 	dev->gd->private_data = dev;
 	snprintf(dev->gd->disk_name, 32, "simdisk%d", which);
 	set_capacity(dev->gd, 0);
-	add_disk(dev->gd);
+	err = add_disk(dev->gd);
+	if (err)
+		goto out_cleanup_disk;
 
 	dev->procfile = proc_create_data(tmp, 0644, procdir, &simdisk_proc_ops, dev);
+
 	return 0;
+
+out_cleanup_disk:
+	blk_cleanup_disk(dev->gd);
+out:
+	return err;
 }
 
 static int __init simdisk_init(void)
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
