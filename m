Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 106188672FC
	for <lists+drbd-dev@lfdr.de>; Mon, 26 Feb 2024 12:26:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0ECD6420221;
	Mon, 26 Feb 2024 12:26:11 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 3348 seconds by postgrey-1.31 at mail19;
	Mon, 26 Feb 2024 12:26:06 CET
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8076842010D
	for <drbd-dev@lists.linbit.com>; Mon, 26 Feb 2024 12:26:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=58hQxzCOBh09HYswQ4p4ZVLnJZqyofksZjan/0dqSg4=;
	b=aGlUIGI+A60ujJC00FlheS2EJM
	3Q5lRJ1gs46mcAW771vCLA0jCcjBFqdJwpOMNtJ/OcKlJxk1NTlg9DXwyqLRAiAv8cu7+P1jn+tW6
	618kRbozhUwQi8XTiyW7Lcf8QhLOPU8JunLuqDegmYa5NcpBOVXqQSSSU/MalH2YVRSCjbcUpb4F3
	Pc1yBa0ktz3xBkNFNeLILR1Fhu1mdsPxoxad5m9uPLzT2a7MTD4HtK4T5/31cTc27CXL5/Qzz5Pzt
	5aKtfx9HAJUsL/C9QICWiZL+SQ4OvuGJmqsgUJGOVaeSe4SeBBPSgwRGmBEcPPu0w9HLSEGPYtX5W
	o3slJx2A==;
Received: from 213-147-167-65.nat.highway.webapn.at ([213.147.167.65]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYFi-000000004ep-11yj; Mon, 26 Feb 2024 10:30:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH 04/16] md: add queue limit helpers
Date: Mon, 26 Feb 2024 11:29:52 +0100
Message-Id: <20240226103004.281412-5-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226103004.281412-1-hch@lst.de>
References: <20240226103004.281412-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: dm-devel@lists.linux.dev, linux-block@vger.kernel.org,
	linux-raid@vger.kernel.org, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Add a few helpers that wrap the block queue limits API for use in MD.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/md.c | 37 +++++++++++++++++++++++++++++++++++++
 drivers/md/md.h |  3 +++
 2 files changed, 40 insertions(+)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 75266c34b1f99b..23823823f80c6b 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -5699,6 +5699,43 @@ static const struct kobj_type md_ktype = {
 
 int mdp_major = 0;
 
+/* stack the limit for all rdevs into lim */
+void mddev_stack_rdev_limits(struct mddev *mddev, struct queue_limits *lim)
+{
+	struct md_rdev *rdev;
+
+	rdev_for_each(rdev, mddev) {
+		queue_limits_stack_bdev(lim, rdev->bdev, rdev->data_offset,
+					mddev->gendisk->disk_name);
+	}
+}
+EXPORT_SYMBOL_GPL(mddev_stack_rdev_limits);
+
+/* apply the extra stacking limits from a new rdev into mddev */
+int mddev_stack_new_rdev(struct mddev *mddev, struct md_rdev *rdev)
+{
+	struct queue_limits lim = queue_limits_start_update(mddev->queue);
+
+	queue_limits_stack_bdev(&lim, rdev->bdev, rdev->data_offset,
+				mddev->gendisk->disk_name);
+	return queue_limits_commit_update(mddev->queue, &lim);
+}
+EXPORT_SYMBOL_GPL(mddev_stack_new_rdev);
+
+/* update the optimal I/O size after a reshape */
+void mddev_update_io_opt(struct mddev *mddev, unsigned int nr_stripes)
+{
+	struct queue_limits lim;
+	int ret;
+
+	blk_mq_freeze_queue(mddev->queue);
+	lim = queue_limits_start_update(mddev->queue);
+	lim.io_opt = lim.io_min * nr_stripes;
+	ret = queue_limits_commit_update(mddev->queue, &lim);
+	blk_mq_unfreeze_queue(mddev->queue);
+}
+EXPORT_SYMBOL_GPL(mddev_update_io_opt);
+
 static void mddev_delayed_delete(struct work_struct *ws)
 {
 	struct mddev *mddev = container_of(ws, struct mddev, del_work);
diff --git a/drivers/md/md.h b/drivers/md/md.h
index 8d881cc597992f..25b19614aa3239 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -860,6 +860,9 @@ void md_autostart_arrays(int part);
 int md_set_array_info(struct mddev *mddev, struct mdu_array_info_s *info);
 int md_add_new_disk(struct mddev *mddev, struct mdu_disk_info_s *info);
 int do_md_run(struct mddev *mddev);
+void mddev_stack_rdev_limits(struct mddev *mddev, struct queue_limits *lim);
+int mddev_stack_new_rdev(struct mddev *mddev, struct md_rdev *rdev);
+void mddev_update_io_opt(struct mddev *mddev, unsigned int nr_stripes);
 
 extern const struct block_device_operations md_fops;
 
-- 
2.39.2

