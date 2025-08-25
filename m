Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFC8B4AC11
	for <lists+drbd-dev@lfdr.de>; Tue,  9 Sep 2025 13:32:25 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2FDA816274F;
	Tue,  9 Sep 2025 13:32:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
	[45.249.212.56])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1F8E1162279
	for <drbd-dev@lists.linbit.com>; Mon, 25 Aug 2025 10:50:53 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4c9PG02vZdzKHNkD
	for <drbd-dev@lists.linbit.com>; Mon, 25 Aug 2025 16:33:44 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 0557F1A06D7
	for <drbd-dev@lists.linbit.com>; Mon, 25 Aug 2025 16:33:44 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP4 (Coremail) with SMTP id gCh0CgAncIzcH6xoZc7rAA--.43322S5;
	Mon, 25 Aug 2025 16:33:41 +0800 (CST)
From: Zhang Yi <yi.zhang@huaweicloud.com>
To: linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [PATCH 1/2] md: init queue_limits->max_hw_wzeroes_unmap_sectors
	parameter
Date: Mon, 25 Aug 2025 16:33:19 +0800
Message-ID: <20250825083320.797165-2-yi.zhang@huaweicloud.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20250825083320.797165-1-yi.zhang@huaweicloud.com>
References: <20250825083320.797165-1-yi.zhang@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgAncIzcH6xoZc7rAA--.43322S5
X-Coremail-Antispam: 1UD129KBjvJXoWxXFWUXw1rJryrXw4rXw48Crg_yoWrGr48p3
	y7XFySvryUJayxAaykJ347uF4Fq345KrW2kFy3Zws5uFy7ur9xXF4Sqa98XrsrXw15Ja43
	t3W0k3yDu3WjgrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
	0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
	IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
	Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
	xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
	kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
	6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JU4OJ5UUUUU=
X-CM-SenderInfo: d1lo6xhdqjqx5xdzvxpfor3voofrz/
X-Mailman-Approved-At: Tue, 09 Sep 2025 13:31:43 +0200
Cc: axboe@kernel.dk, martin.petersen@oracle.com, john.g.garry@oracle.com,
	yangerkun@huawei.com, yi.zhang@huawei.com,
	linux-kernel@vger.kernel.org, yi.zhang@huaweicloud.com,
	linux-fsdevel@vger.kernel.org, yukuai3@huawei.com, hch@lst.de
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

From: Zhang Yi <yi.zhang@huawei.com>

The parameter max_hw_wzeroes_unmap_sectors in queue_limits should be
equal to max_write_zeroes_sectors if it is set to a non-zero value.
However, the stacked md drivers call md_init_stacking_limits() to
initialize this parameter to UINT_MAX but only adjust
max_write_zeroes_sectors when setting limits. Therefore, this
discrepancy triggers a value check failure in blk_validate_limits().

Fix this failure by explicitly setting max_hw_wzeroes_unmap_sectors to
zero.

Fixes: 0c40d7cb5ef3 ("block: introduce max_{hw|user}_wzeroes_unmap_sectors to queue limits")
Reported-by: John Garry <john.g.garry@oracle.com>
Closes: https://lore.kernel.org/linux-block/803a2183-a0bb-4b7a-92f1-afc5097630d2@oracle.com/
Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
---
 drivers/md/md-linear.c | 1 +
 drivers/md/raid0.c     | 1 +
 drivers/md/raid1.c     | 1 +
 drivers/md/raid10.c    | 1 +
 drivers/md/raid5.c     | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/md/md-linear.c b/drivers/md/md-linear.c
index 5d9b08115375..3e1f165c2d20 100644
--- a/drivers/md/md-linear.c
+++ b/drivers/md/md-linear.c
@@ -73,6 +73,7 @@ static int linear_set_limits(struct mddev *mddev)
 	md_init_stacking_limits(&lim);
 	lim.max_hw_sectors = mddev->chunk_sectors;
 	lim.max_write_zeroes_sectors = mddev->chunk_sectors;
+	lim.max_hw_wzeroes_unmap_sectors = mddev->chunk_sectors;
 	lim.io_min = mddev->chunk_sectors << 9;
 	err = mddev_stack_rdev_limits(mddev, &lim, MDDEV_STACK_INTEGRITY);
 	if (err)
diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
index f1d8811a542a..419139ad7663 100644
--- a/drivers/md/raid0.c
+++ b/drivers/md/raid0.c
@@ -382,6 +382,7 @@ static int raid0_set_limits(struct mddev *mddev)
 	md_init_stacking_limits(&lim);
 	lim.max_hw_sectors = mddev->chunk_sectors;
 	lim.max_write_zeroes_sectors = mddev->chunk_sectors;
+	lim.max_hw_wzeroes_unmap_sectors = mddev->chunk_sectors;
 	lim.io_min = mddev->chunk_sectors << 9;
 	lim.io_opt = lim.io_min * mddev->raid_disks;
 	lim.chunk_sectors = mddev->chunk_sectors;
diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
index 408c26398321..35c6498b4917 100644
--- a/drivers/md/raid1.c
+++ b/drivers/md/raid1.c
@@ -3211,6 +3211,7 @@ static int raid1_set_limits(struct mddev *mddev)
 
 	md_init_stacking_limits(&lim);
 	lim.max_write_zeroes_sectors = 0;
+	lim.max_hw_wzeroes_unmap_sectors = 0;
 	lim.features |= BLK_FEAT_ATOMIC_WRITES;
 	err = mddev_stack_rdev_limits(mddev, &lim, MDDEV_STACK_INTEGRITY);
 	if (err)
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index b60c30bfb6c7..9832eefb2f15 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -4008,6 +4008,7 @@ static int raid10_set_queue_limits(struct mddev *mddev)
 
 	md_init_stacking_limits(&lim);
 	lim.max_write_zeroes_sectors = 0;
+	lim.max_hw_wzeroes_unmap_sectors = 0;
 	lim.io_min = mddev->chunk_sectors << 9;
 	lim.chunk_sectors = mddev->chunk_sectors;
 	lim.io_opt = lim.io_min * raid10_nr_stripes(conf);
diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 023649fe2476..e385ef1355e8 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7732,6 +7732,7 @@ static int raid5_set_limits(struct mddev *mddev)
 	lim.features |= BLK_FEAT_RAID_PARTIAL_STRIPES_EXPENSIVE;
 	lim.discard_granularity = stripe;
 	lim.max_write_zeroes_sectors = 0;
+	lim.max_hw_wzeroes_unmap_sectors = 0;
 	mddev_stack_rdev_limits(mddev, &lim, 0);
 	rdev_for_each(rdev, mddev)
 		queue_limits_stack_bdev(&lim, rdev->bdev, rdev->new_data_offset,
-- 
2.46.1

