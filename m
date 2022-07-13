Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2741D572DF6
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Jul 2022 08:12:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0F3EF420F75;
	Wed, 13 Jul 2022 08:12:01 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D6E45420F75
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 08:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=sCd4pbkyY76kB5kRbEUIIVS/ktv4lAdW2tnsAdV7rEE=;
	b=O6xNWaW8HbWiChDktFR+OY8u54
	W8lPIx5ZCjCQr1c6VL1F+qjFQqwsUKOllIOSL+U/ve3wCfuvj34DH1wRzojJaQmcjPvwXPJjwiU8h
	44TkYtkJKga28CH19bQKNPA7u7ejjmg5eAHNiaoFGX9SbUGGWNY7hOiJGSN6h4vKc5FqZW3LbHXu6
	QOxiM0mQ2KtC6Kpp539lrnzoynAjOH74GPfvmuktkzokhzc6qujVIw+MbkrwZYp6nIzg3K4cWcLce
	gPWYoU2k2D0wmXTwYMNMB8KAzHold+GaGPsnTERHD0N0W9/TnESglWTqhRRcBR/C1YIlpTRAk3dLe
	w++9ecOw==;
Received: from ip4d15c27d.dynamic.kabel-deutschland.de ([77.21.194.125]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVJZ-000NUG-H2; Wed, 13 Jul 2022 05:53:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Jul 2022 07:53:14 +0200
Message-Id: <20220713055317.1888500-7-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220713055317.1888500-1-hch@lst.de>
References: <20220713055317.1888500-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	Song Liu <song@kernel.org>, Mark Fasheh <mark@fasheh.com>,
	linux-raid@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Joel Becker <jlbec@evilplan.org>, Jan Kara <jack@suse.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	linux-ext4@vger.kernel.org, Jack Wang <jinpu.wang@ionos.com>,
	ocfs2-devel@oss.oracle.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 6/9] rnbd-srv: remove the name field from struct
	rnbd_dev
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

Just print the block device name directly using the %pg format specifier.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rnbd/rnbd-srv-dev.c   | 1 -
 drivers/block/rnbd/rnbd-srv-dev.h   | 1 -
 drivers/block/rnbd/rnbd-srv-sysfs.c | 5 ++---
 drivers/block/rnbd/rnbd-srv.c       | 9 ++++-----
 drivers/block/rnbd/rnbd-srv.h       | 3 +--
 5 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-srv-dev.c b/drivers/block/rnbd/rnbd-srv-dev.c
index c5d0a03911659..c63017f6e4214 100644
--- a/drivers/block/rnbd/rnbd-srv-dev.c
+++ b/drivers/block/rnbd/rnbd-srv-dev.c
@@ -28,7 +28,6 @@ struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags)
 		goto err;
 
 	dev->blk_open_flags = flags;
-	bdevname(dev->bdev, dev->name);
 
 	return dev;
 
diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
index 4309e52524691..8407d12f70afe 100644
--- a/drivers/block/rnbd/rnbd-srv-dev.h
+++ b/drivers/block/rnbd/rnbd-srv-dev.h
@@ -15,7 +15,6 @@
 struct rnbd_dev {
 	struct block_device	*bdev;
 	fmode_t			blk_open_flags;
-	char			name[BDEVNAME_SIZE];
 };
 
 /**
diff --git a/drivers/block/rnbd/rnbd-srv-sysfs.c b/drivers/block/rnbd/rnbd-srv-sysfs.c
index feaa76c5a3423..297a6924ff4e2 100644
--- a/drivers/block/rnbd/rnbd-srv-sysfs.c
+++ b/drivers/block/rnbd/rnbd-srv-sysfs.c
@@ -38,14 +38,13 @@ static struct kobj_type dev_ktype = {
 };
 
 int rnbd_srv_create_dev_sysfs(struct rnbd_srv_dev *dev,
-			       struct block_device *bdev,
-			       const char *dev_name)
+			       struct block_device *bdev)
 {
 	struct kobject *bdev_kobj;
 	int ret;
 
 	ret = kobject_init_and_add(&dev->dev_kobj, &dev_ktype,
-				   rnbd_devs_kobj, dev_name);
+				   rnbd_devs_kobj, "%pg", bdev);
 	if (ret) {
 		kobject_put(&dev->dev_kobj);
 		return ret;
diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index beaef43a67b9d..0713014bf423f 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -419,7 +419,7 @@ static struct rnbd_srv_sess_dev
 	return sess_dev;
 }
 
-static struct rnbd_srv_dev *rnbd_srv_init_srv_dev(const char *id)
+static struct rnbd_srv_dev *rnbd_srv_init_srv_dev(struct block_device *bdev)
 {
 	struct rnbd_srv_dev *dev;
 
@@ -427,7 +427,7 @@ static struct rnbd_srv_dev *rnbd_srv_init_srv_dev(const char *id)
 	if (!dev)
 		return ERR_PTR(-ENOMEM);
 
-	strscpy(dev->id, id, sizeof(dev->id));
+	snprintf(dev->id, sizeof(dev->id), "%pg", bdev);
 	kref_init(&dev->kref);
 	INIT_LIST_HEAD(&dev->sess_dev_list);
 	mutex_init(&dev->lock);
@@ -512,7 +512,7 @@ rnbd_srv_get_or_create_srv_dev(struct rnbd_dev *rnbd_dev,
 	int ret;
 	struct rnbd_srv_dev *new_dev, *dev;
 
-	new_dev = rnbd_srv_init_srv_dev(rnbd_dev->name);
+	new_dev = rnbd_srv_init_srv_dev(rnbd_dev->bdev);
 	if (IS_ERR(new_dev))
 		return new_dev;
 
@@ -758,8 +758,7 @@ static int process_msg_open(struct rnbd_srv_session *srv_sess,
 	 */
 	mutex_lock(&srv_dev->lock);
 	if (!srv_dev->dev_kobj.state_in_sysfs) {
-		ret = rnbd_srv_create_dev_sysfs(srv_dev, rnbd_dev->bdev,
-						 rnbd_dev->name);
+		ret = rnbd_srv_create_dev_sysfs(srv_dev, rnbd_dev->bdev);
 		if (ret) {
 			mutex_unlock(&srv_dev->lock);
 			rnbd_srv_err(srv_sess_dev,
diff --git a/drivers/block/rnbd/rnbd-srv.h b/drivers/block/rnbd/rnbd-srv.h
index be2ae486d407e..6926f9069dc4b 100644
--- a/drivers/block/rnbd/rnbd-srv.h
+++ b/drivers/block/rnbd/rnbd-srv.h
@@ -68,8 +68,7 @@ void rnbd_srv_sess_dev_force_close(struct rnbd_srv_sess_dev *sess_dev,
 /* rnbd-srv-sysfs.c */
 
 int rnbd_srv_create_dev_sysfs(struct rnbd_srv_dev *dev,
-			      struct block_device *bdev,
-			      const char *dir_name);
+			      struct block_device *bdev);
 void rnbd_srv_destroy_dev_sysfs(struct rnbd_srv_dev *dev);
 int rnbd_srv_create_dev_session_sysfs(struct rnbd_srv_sess_dev *sess_dev);
 void rnbd_srv_destroy_dev_session_sysfs(struct rnbd_srv_sess_dev *sess_dev);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
