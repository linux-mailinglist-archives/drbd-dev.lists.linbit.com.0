Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD115F4FDE
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:44 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8DB27420963;
	Wed,  5 Oct 2022 08:50:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 800 seconds by postgrey-1.31 at mail19;
	Wed, 05 Oct 2022 07:16:25 CEST
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam04on2058.outbound.protection.outlook.com [40.107.102.58])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 335744201A5
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:16:24 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=D4mcjGmv1IgKezs1Z72PjAAjz0Za/Yh8ZooZoMcqbfMleh3gaoNEzi95HcChXPjMFqj23JOx3NIO9OC5KFH2MvN4HjmEQPy8rKFG3b73Zu/UZKvgCHYXQGhrmdb/x0JCfbeV2gx9TEJE9lIPKzitNVE6zxnf/KbHqH/McVU8p9RmIop71Z/NCw87E6iQ/1pGLQQUtauxfokVql429u8gnvdHsc8Q4N0cTKNDUwreF/1vOknUP03dWwwImAK6kJ96BxJGhpSLD040fLku1C/1/38XCXTEjZuGY2U9IJexCi82j9MpcOuiUugd03L9H4zvrhe+auyEnPzr4Y3UAdgl3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=AC/dVltCh33t7LB/hHRJPz/aQqcKnUc2LKGWQ1WRrwc=;
	b=N0ID4YwI4t13w7vv8DrKI//xVPK/SGrLHFz9501M/O1CqSNi7ZfcH5/uJWiKzdlZgCQCC8SMUKh22le1HfiCBRRD/ga2O1v2/gpMvJWNAIlKJju1Fcm8dHSGUmLPknDGRGs00JA9gkSSlrqYxGHFVXEWDzMgFpZQkZQdLd2yVtqPmUvDENGrH0i8ovyQlnw6BDWNP/tYMbTsbP7czd6IjYR4ns2tcRzXkpfVkAY4O05rn9E5IGI61lFt3fpJ/EZIczbkMlb28d/2oxzon7BBGqTBGV1n4Pw4AvFz09j9RLo4Lb4xlaW0W3wHKhwtA6jOO3CjQhF0A6v3YlRKCK3h9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.161) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=AC/dVltCh33t7LB/hHRJPz/aQqcKnUc2LKGWQ1WRrwc=;
	b=UG+2BTa22OzmhLWSpJ34Dcx9nodADseYqd8akLnnDJTr5BV9ZluWoHxra5JigCcmc8qy7PpmgzN91Yoj7jbfJveWPy/9aRfJm0Mti0V/TrhUNk8srRoJLM/p1Yobfj+cgn2HriX9eA6+HKR26C3gngG/d9ioHDgXDQ2Lty2n68cPbdSoUkJhDyXBiNUJuFOq2J0xK6uzle/7Z864r2aAx2j3uHVqVFn2FbjA28og3BV1hDpkXHtZUQSTUD6HLSyE/ZWG3NLWV+s1P3Xx/ePXl8j80aQ/Xyuo1iuX5dQchJKBfni97UTPBY7OC3cYSwDWtMqO3JDhov92ANDcWhDx6Q==
Received: from DM6PR07CA0097.namprd07.prod.outlook.com (2603:10b6:5:337::30)
	by MN2PR12MB4271.namprd12.prod.outlook.com (2603:10b6:208:1d7::16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24;
	Wed, 5 Oct 2022 05:02:17 +0000
Received: from DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
	(2603:10b6:5:337:cafe::3b) by DM6PR07CA0097.outlook.office365.com
	(2603:10b6:5:337::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via
	Frontend Transport; Wed, 5 Oct 2022 05:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.161 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
	DM6NAM11FT083.mail.protection.outlook.com (10.13.173.97) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:02:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:02:11 -0700
Received: from dev.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:02:10 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:17 -0700
Message-ID: <20221005050027.39591-9-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT083:EE_|MN2PR12MB4271:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa07d64-048f-491f-a32c-08daa68ec68f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r43Idkm8GFfSaTc7gr6lVrCdxX/uWViJTRKGCAtUMG9WRYbLrTobWmko6Fnkh2rNKQdERSThc2tCRNR5CLiNnhBkPqSjFJ9aMaMJHsGVYy9idWCzBH3tMgjw+9nukIWALps9L2UNoOM/s5xyvkSNLWwM+pzB94Uli9JGbdjTkBkB4CNyJIABDEOn4gxu8ey6QzPUwwK/c0VPGph+8wUPY82PSGC+kVznUxb43kRnFuNFg3TpCA6yLTdaJJT5KxvqNtRkhzwils7QNMBDr0LM/5o+06L05VEq5oP0ceDRfrp9D42v3w8y4P8tJLX7aSk6eJP9L5JX8jf+6pTc2LxHePk7yMgt2J7XlCeb6ZRjc3SfABEFcmq6oTSoyL3WUMr56L9qbXtF7WXJWyPw5KU597j5rkRsSdaNqX+xnngjNTT1hEBwjZNV8VvUTlJ0rpQVLD2UTI/Geb+/GUcG6G1R5PWroJoyzQZSui2CKGt+XRceKHcfsGbP15qhO+wVEkrZFEkvRUiLjH9/ymespdsBNy+pkmaDuD5MhPgklzLQUna2yEw43+FfoogCkgqpy/92pGxnxMedoZcdqco90gmzcdw8SqcITF99mQbU0TuShAgK6jyIM89Q4fM3xnh6D0nhkoRH5BJTfJ4+CS+lNzzKN6ZyBnDXSM1SvvGbiQkpm9iaaTkINIwaemkmv4VirUnOT51R5p0ZWFNmg7mKmsc9IdRuIcVDTl3JTvLN52iJrEGTEn9PPd+TJu67E/hLbq4TBot71r7kaImQdzbYhH1NjgdaUmWpk5E1ZMzQh61FKaY=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(46966006)(36840700001)(40470700004)(7696005)(26005)(2616005)(478600001)(1076003)(186003)(40480700001)(82310400005)(40460700003)(2906002)(8936002)(5660300002)(7416002)(356005)(7636003)(316002)(110136005)(4326008)(41300700001)(54906003)(70586007)(36756003)(8676002)(16526019)(70206006)(36860700001)(82740400003)(47076005)(336012)(83380400001)(426003)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:02:17.1340 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa07d64-048f-491f-a32c-08daa68ec68f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.161]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4271
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 08/18] n64cart: use init disk helper
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
 drivers/block/n64cart.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index d914156db2d8..28b32fbe6586 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -135,14 +135,12 @@ static int __init n64cart_probe(struct platform_device *pdev)
 	if (!disk)
 		goto out;
 
-	disk->first_minor = 0;
 	disk->flags = GENHD_FL_NO_PART;
 	disk->fops = &n64cart_fops;
-	disk->private_data = &pdev->dev;
 	strcpy(disk->disk_name, "n64cart");
 
-	set_capacity(disk, size >> SECTOR_SHIFT);
 	set_disk_ro(disk, 1);
+	init_disk(disk, 0, 0, 0, size >> 9, &pdev->dev, &n64cart_fops);
 
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
 	blk_queue_physical_block_size(disk->queue, 4096);
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
