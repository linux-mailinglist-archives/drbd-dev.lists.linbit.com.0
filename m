Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB27B5152C
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Sep 2025 13:13:37 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 558E316274A;
	Wed, 10 Sep 2025 13:13:29 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
	[45.249.212.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A47401626A4
	for <drbd-dev@lists.linbit.com>; Wed, 10 Sep 2025 13:12:25 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4cMJ1j5S0zzYQvPN
	for <drbd-dev@lists.linbit.com>; Wed, 10 Sep 2025 19:12:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 429501A1B49
	for <drbd-dev@lists.linbit.com>; Wed, 10 Sep 2025 19:12:24 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.85.155])
	by APP4 (Coremail) with SMTP id gCh0CgCn8Y0OXcFonCkfCA--.57678S6;
	Wed, 10 Sep 2025 19:12:24 +0800 (CST)
From: Zhang Yi <yi.zhang@huaweicloud.com>
To: linux-block@vger.kernel.org, linux-raid@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [PATCH v2 2/2] drbd: init queue_limits->max_hw_wzeroes_unmap_sectors
	parameter
Date: Wed, 10 Sep 2025 19:11:07 +0800
Message-ID: <20250910111107.3247530-3-yi.zhang@huaweicloud.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20250910111107.3247530-1-yi.zhang@huaweicloud.com>
References: <20250910111107.3247530-1-yi.zhang@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgCn8Y0OXcFonCkfCA--.57678S6
X-Coremail-Antispam: 1UD129KBjvJXoW7uFW7JF1xGFy3KrW7WF18Grg_yoW8XF15pa
	17XFy2qryjgF48Zws8Jw17ZFyrKa95GFy2gayUA3Z8W34Skrn3WF42kayaqa12gr95Ga1F
	q3W2y340k34jqrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
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
	vjDU0xZFpf9x0JUQXo7UUUUU=
X-CM-SenderInfo: d1lo6xhdqjqx5xdzvxpfor3voofrz/
Cc: axboe@kernel.dk, pmenzel@molgen.mpg.de, martin.petersen@oracle.com,
	john.g.garry@oracle.com, yangerkun@huawei.com,
	yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
	yi.zhang@huaweicloud.com, linux-fsdevel@vger.kernel.org,
	yukuai3@huawei.com, hch@lst.de
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
However, when the backend bdev is specified, this parameter is
initialized to UINT_MAX during the call to blk_set_stacking_limits(),
while only max_write_zeroes_sectors is adjusted. Therefore, this
discrepancy triggers a value check failure in blk_validate_limits().

Since the drvd driver doesn't yet support unmap write zeroes, so fix
this failure by explicitly setting max_hw_wzeroes_unmap_sectors to
zero.

Fixes: 0c40d7cb5ef3 ("block: introduce max_{hw|user}_wzeroes_unmap_sectors to queue limits")
Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
Reviewed-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/block/drbd/drbd_nl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index e09930c2b226..91f3b8afb63c 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1330,6 +1330,7 @@ void drbd_reconsider_queue_parameters(struct drbd_device *device,
 		lim.max_write_zeroes_sectors = DRBD_MAX_BBIO_SECTORS;
 	else
 		lim.max_write_zeroes_sectors = 0;
+	lim.max_hw_wzeroes_unmap_sectors = 0;
 
 	if ((lim.discard_granularity >> SECTOR_SHIFT) >
 	    lim.max_hw_discard_sectors) {
-- 
2.46.1

