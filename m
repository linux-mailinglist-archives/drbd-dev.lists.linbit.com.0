Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDC45F4FE3
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 620C1421775;
	Wed,  5 Oct 2022 08:50:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8E3BB4201A5
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:17:14 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=lsDtevQ43KutRcnE49bm5lafKJ+XX0jT3godeD2afCo3ftb6yKbJT8hm6GMs9uKVsNquX1HCgCfTYaSWfJtD+IbOsZl/taDUrFcZqlDW13V0YfMhEfLkmM8V4CYUH1IMIcJyRpyHGywanrTKFecLMCHXHGbr8Lc0rA9JEq8MvuMIwZmP58G3UpWv/1zOjRglOqLvWsbP6Pxghh1l1AYDHmnhUS2Vxd+U3Woya+7X49WLRAuYTpB7Q8+JqpjfjC04yeEhunb5cp3ctwqRD/yY1oz0/Zkwu4qQxyGVJa+F16wTrBdoieNyD74i5xbL3ds9VxaU7dgSSXH6lCR6f0dKJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=KKmYNl5ebEs54KRb+rCqpu+4URjeGcZf7KmI7PhATIg=;
	b=G+IrbmKDo63QKDpeNO8w9ki/XJBQhuqhVJbHsy0xLKHaYQY0AgwFpntRpwezDs5DJharXY0m0gskTlBfeHPGAg3D0+yBpqo70FM1qQ/TnaJBjWSEa4AUVixPsUXdNaoNHuBMej5UhajLfb9AEM/267Q3UG7Y+FaZQo8oTQxneKekqQaUHvlGRXkg+8RB4gGv2YA0P36mLBXSa2Bg7vg+UgkRGRXFdcKjICLYBbXwDkLOJdQRnE0D7IgJJXdtZMcUKyzzP/626BRZvzSTN6PyfjO0qdHlztDaAQV8TWLYAIz/52rJUZKzFjpdYdtgsrvVIHHAWg037BtLtOknj+4DQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.161) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KKmYNl5ebEs54KRb+rCqpu+4URjeGcZf7KmI7PhATIg=;
	b=FqkOAGtExIaX78tp1b1ZWsieWiWPeI5lf1Olhhiv5ytdueQBIDuihF0JJAYReOEUBkLor19dEsmKmXXnOeCpO7A7YgZLwjcRJ2nldvqZ09omSwvi1jfuXJKIvh05y17+TcAq0mIdBTMNSO4USXWWva4pAMvvHFfjpnvUGnxwq/FbhluzdqzoCz6gQrgSQa9gio5YC/YgbIgq+pRLzHH7wHMep83C9EbIgqtNZ1HRQuZNgwuPAWTg9FOMtyTv9sG+vs9EDb9R+TpqwSpbPy0SLM/HPMjPgQ5C28rSy+4jcBUYwCIBLBWYGdAmwrWepEUbC9j11XNPLcpJBYsC/zs5Uw==
Received: from DS7PR05CA0046.namprd05.prod.outlook.com (2603:10b6:8:2f::14) by
	MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28;
	Wed, 5 Oct 2022 05:01:57 +0000
Received: from DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
	(2603:10b6:8:2f:cafe::f8) by DS7PR05CA0046.outlook.office365.com
	(2603:10b6:8:2f::14) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.9 via
	Frontend Transport; Wed, 5 Oct 2022 05:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.161 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
	DM6NAM11FT006.mail.protection.outlook.com (10.13.173.104) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:01:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:01:48 -0700
Received: from dev.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:01:46 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:15 -0700
Message-ID: <20221005050027.39591-7-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT006:EE_|MN2PR12MB4319:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f24eb98-307e-420c-5950-08daa68eba48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DDcak8M5rCvBx4mrZ3CWnZBWr+fCg//c5NYq8WvMpNAOYNSITgrXZvcs8h/CtPr9uUOCY5lDsn4dJEndkvD0d9XBDCerdxO7P4gjjPEUM8NbHDMyYQoYLDTDdELRMERnXok6hLnCYOJI1PJEZeaNyjt7UTRvIRjXi+H31Duq2qCiNthesyUsE17X0JR7DI1v1UJAnFUvUsx0tmCH6ok0pmejqsl7vBS13AFbn0DZGElV2/c4yf5DkeYa1VNZ6dUIOKoHefX6TpY5+q5Bwj/wGoWShelb+v/uUk7Mp16DGH0MNf1fZ4L+To80FqcsBe7C2361liZvS0TdSfcU2/6/zI0xRENk5GrR/o6H20S9QRLZQHc06VB9FQP6oEzGx5VUGh39KIHUasOTFaLQ3VMAT/r24ZZwAiCN0IOPmwMO19VjaVvF47GUrNyFG6YZhcytgr3kc81A5aQHMIQDOdBDEGmwvn9Tbt5bTDyuFANfsoXoIvK5KVSolJV5SSbH8VTVXq8lqa80GDfa129HnoTnwJWg4C0GA1U4mXZPhRLLNXcUxv6A2INzNl8GjYo9BSuBUvwFhJuOZE5XZTXzoJRP0PYC4iEwOZCDfo8y9/+K5Vbc5TKL2qcoQMETr+aa7JRIx3qLoDzsDVhRltF40B2E9Djjf6YxmWzj7P2oy4wFAYEAQ2zNKrO3FHsWLP29yhn8zFmC8c5sKz1SjP+Rsn9zdQU134YIrxQaGtgArCKMfPNryaVvTFGaq+Le/QIb3dzDVMnOPDAu+6sV/OddSougNnrU+IZYV9Llm4l7mP+arO8=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(82740400003)(478600001)(47076005)(40480700001)(6666004)(7696005)(2616005)(40460700003)(26005)(83380400001)(426003)(336012)(36756003)(1076003)(16526019)(186003)(5660300002)(8936002)(41300700001)(7416002)(2906002)(4326008)(82310400005)(8676002)(7636003)(316002)(36860700001)(356005)(54906003)(110136005)(70586007)(70206006)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:01:56.5342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f24eb98-307e-420c-5950-08daa68eba48
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.161]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT006.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 06/18] floppy: use init disk helper
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
 drivers/block/floppy.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index ccad3d7b3ddd..7304fd87c038 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4516,18 +4516,14 @@ static int floppy_alloc_disk(unsigned int drive, unsigned int type)
 		return PTR_ERR(disk);
 
 	blk_queue_max_hw_sectors(disk->queue, 64);
-	disk->major = FLOPPY_MAJOR;
-	disk->first_minor = TOMINOR(drive) | (type << 2);
-	disk->minors = 1;
-	disk->fops = &floppy_fops;
 	disk->flags |= GENHD_FL_NO_PART;
 	disk->events = DISK_EVENT_MEDIA_CHANGE;
+	init_disk(disk, FLOPPY_MAJOR, TOMINOR(drive) | (type << 2), 1, 0,
+			(void *)(long)drive, &floppy_fops);
 	if (type)
 		sprintf(disk->disk_name, "fd%d_type%d", drive, type);
 	else
 		sprintf(disk->disk_name, "fd%d", drive);
-	/* to be cleaned up... */
-	disk->private_data = (void *)(long)drive;
 	disk->flags |= GENHD_FL_REMOVABLE;
 
 	disks[drive][type] = disk;
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
