Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D016E5F4FE0
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DC36642096B;
	Wed,  5 Oct 2022 08:50:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 956 seconds by postgrey-1.31 at mail19;
	Wed, 05 Oct 2022 07:16:47 CEST
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 361744202F3
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:16:46 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=dFLQLYfurYo3DxshNkpVRZLnN3G0PPT/t5fQij1gXlwAPAw2L8x5yAw4wdoQ4hNgxvGZWu1RYTh0TdJA2MunyjztJBjNQO2MdKBt5gy5UNmfQEDlAtHicy1Y9XgQ7AuCE8PzMdujXrwasd5BPmkqZKNVH3WPYuqJgmhNWb+vnjuoYEjteB5wTf6AXz1N6lDuLUPQ5521eBBykSxylRDCQZzVOz1MzpxlJDGlPG0mFN4jxKje3mjmqg7mEqwQ3URfQ716qLCOFro1Am6EWH1mJ9d8CaWCQFdjnstRtjN7PBTuesPVg2waIDy/kutKO0bBIoTnClePr3ovoHAMp/zeGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=scnW2Xsya/kBm3v46oGlai56SM3aaT0CZqakUx7jxug=;
	b=TM+OYENpvbptB6MfzTxSYPzBcbPijqN5NZTdxKyTZehreyF7ql0Ird/kfPMFWaNAEd8iPgVvfZOy5VZfLeI8SlizGASg6gkQn+JGz5dR3lk7Pb6fPM3qB7k1SlyBRmtTvaSpH7E7BQAjb8GzRztwIKiNJoJhvFszMj7JvDf3YTtqoa9twySDB9Yf+PnPeklPiPPbFlmvY4cQ6VFsEvHie8tUE/zdZs4cYLDn+3stBwVH1BcZvm/yUgev3e/NTK/CI4UZUKYj628rNeshmaU52iRRHXlnAiDWZDDVHLjQCzaTkLQ3qR3TmIyVhmItooaCI91WpqlgYulfTdzKPvFE9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.161) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=scnW2Xsya/kBm3v46oGlai56SM3aaT0CZqakUx7jxug=;
	b=SrU5ZOdoC+LFehnJGhvPgKNqP8Hfi4/mMqKnHlZ/FI4JVWhXMW2+SVTuAV+BbZvPBqVbqMS5lH5vDyLvuxzyXxEgGkjLVk4AbQOTsVd5eatDMv9ng4WAATWlLuFlAiHeJQS5QQ/rjPuWsIGzO/ockd6JWzdQfaUdUIyisJBpN546VsoyzyYKfWqvKeX96duU/81/lXCNp5HDZHXLPjXPnSvGrkpXcuGStzeJMEo6rVzM1spKhccl7P+/l3oFhByQp6Ra6KnpPlICNKa/Qt7fxaZtY7o+snZy6PJEpdIcRZkIytBS+bNOhfV7vAxBC17ZlmJJsdeKzt5fRFiFeQkkKw==
Received: from DS7PR05CA0047.namprd05.prod.outlook.com (2603:10b6:8:2f::26) by
	SJ0PR12MB5405.namprd12.prod.outlook.com (2603:10b6:a03:3af::11) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20;
	Wed, 5 Oct 2022 05:01:00 +0000
Received: from DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
	(2603:10b6:8:2f:cafe::91) by DS7PR05CA0047.outlook.office365.com
	(2603:10b6:8:2f::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.11 via
	Frontend Transport; Wed, 5 Oct 2022 05:01:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.161 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
	DM6NAM11FT100.mail.protection.outlook.com (10.13.172.247) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:00:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:00:49 -0700
Received: from dev.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:00:47 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:10 -0700
Message-ID: <20221005050027.39591-2-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT100:EE_|SJ0PR12MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: 47961f58-4358-45fe-167a-08daa68e9853
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QbIrNtqlfhAbf/gf03oLsqVoqKo753H703gSw1lUPUiXt7oaSI6ree+VIpCOMvdAqE94vQyoxnuUyXSC0s/FqYjkWuToCT19jSTxar1Qvr8Ek6Ij6QFOcqE/Y+u7iQZB1Pu6p+f4ruhKo8EYd5GBEroFyi4KCFQU682x3r3SaEa97yBYXaXnJrEUnJIG5/G+EDd6BSdtN65TDdPoJ8oEvOQ8VnLLFTptkgDm5FUAjEuYlXEpLu2QA23LK6ojILRQNly3zBZdU503+gI7uitx+1519lMJGyebhyvdOKxfVGJjILaEdcHDCCxllTImovuynxaDw68qgz+3rb557CbBNUSnVHFBjPlB9AgmKcLxWFwHJR4d2bmf/FlBRSsBsDptwk5BfV9mCswCiJXGFDwV1GN+hNcdwb2ioi2NxXvTCUl52wRPfMWxZo+yw6BOICSewAm0K3PMo+QZrvvB7MH8900dXeOTeHXs140ngBW4fDu3xh5p0QJnquL8Deb9yv4kOZs6cDEW1deIQ7WzwOb2oxImzqStP+3gX1EJoxE0ARWlT5NiV58Ixmb98I2M1saoWNNNdD1FxBCGfYbb9hf9YcTwA57DT3Rde4zzOYO+OtlGXe918REc1Y/jlB4i29txIz7MlstcYoGc2lwh+PY74BawL9q9QFzk/CtPy/RcIaAeSYqDABSFD2nKSPcNd869j+Z8AJam+RN1LbEfqUa+659mKaPD5S/ixOV88/uUo4UrD+DDl2QUXNblb6VejE+N/WHZg0eao3jBRXRa95asVS+zYITuTknQDXsAvneR3kQ=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(6666004)(36756003)(426003)(7696005)(478600001)(26005)(7636003)(4326008)(8676002)(47076005)(36860700001)(83380400001)(2616005)(40460700003)(2906002)(356005)(336012)(16526019)(316002)(110136005)(186003)(1076003)(41300700001)(40480700001)(70206006)(82740400003)(8936002)(70586007)(7416002)(5660300002)(54906003)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:00:59.5620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47961f58-4358-45fe-167a-08daa68e9853
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.161]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5405
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 01/18] block: add and use init disk helper
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

Add and use the helper to initialize the common fields of struct gendisk
such as major, first_minor, minors, disk_name, private_data, and ops.
This initialization is spread all over the block drivers. This avoids
code repetation of inialization code of gendisk in current block drivers
and any future ones.

Signed-off-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 block/genhd.c                 | 13 +++++++++++++
 drivers/block/null_blk/main.c | 12 ++++--------
 include/linux/blkdev.h        |  5 +++++
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 514395361d7c..701309a7388e 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1470,3 +1470,16 @@ void inc_diskseq(struct gendisk *disk)
 {
 	disk->diskseq = atomic64_inc_return(&diskseq);
 }
+
+void init_disk(struct gendisk *disk, int major, int first_minor,
+		int minors, sector_t sectors, void *private_data,
+		const struct block_device_operations *fops)
+{
+	disk->major = major;
+	disk->first_minor = first_minor;
+	disk->minors = minors;
+	set_capacity(disk, sectors);
+	disk->private_data = private_data;
+	disk->fops = fops;
+}
+EXPORT_SYMBOL_GPL(init_disk);
diff --git a/drivers/block/null_blk/main.c b/drivers/block/null_blk/main.c
index 1f154f92f4c2..d31085c94fd3 100644
--- a/drivers/block/null_blk/main.c
+++ b/drivers/block/null_blk/main.c
@@ -1871,18 +1871,14 @@ static int init_driver_queues(struct nullb *nullb)
 static int null_gendisk_register(struct nullb *nullb)
 {
 	sector_t size = ((sector_t)nullb->dev->size * SZ_1M) >> SECTOR_SHIFT;
+	const struct block_device_operations *fops;
 	struct gendisk *disk = nullb->disk;
 
-	set_capacity(disk, size);
-
-	disk->major		= null_major;
-	disk->first_minor	= nullb->index;
-	disk->minors		= 1;
 	if (queue_is_mq(nullb->q))
-		disk->fops		= &null_rq_ops;
+		fops		= &null_rq_ops;
 	else
-		disk->fops		= &null_bio_ops;
-	disk->private_data	= nullb;
+		fops		= &null_bio_ops;
+	init_disk(disk, null_major, nullb->index, 1, size, nullb, fops);
 	strncpy(disk->disk_name, nullb->disk_name, DISK_NAME_LEN);
 
 	if (nullb->dev->zoned) {
diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
index 49373d002631..cb9db857f890 100644
--- a/include/linux/blkdev.h
+++ b/include/linux/blkdev.h
@@ -757,6 +757,11 @@ static inline int __must_check add_disk(struct gendisk *disk)
 {
 	return device_add_disk(NULL, disk, NULL);
 }
+
+void init_disk(struct gendisk *disk, int major, int first_minor,
+		int minors, sector_t sectors, void *private_data,
+		const struct block_device_operations *fops);
+
 void del_gendisk(struct gendisk *gp);
 void invalidate_disk(struct gendisk *disk);
 void set_disk_ro(struct gendisk *disk, bool read_only);
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
