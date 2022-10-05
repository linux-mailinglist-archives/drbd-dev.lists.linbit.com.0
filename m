Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B01375F4FEC
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:58 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F30D9425307;
	Wed,  5 Oct 2022 08:50:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F8784201A5
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:19:10 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VQnNarfyEFfJyR9KMhgRcWp3Ap6KKNzyuMWIxUAb1ypLDpxpzFnkxSN4WFzGwFanOB9LVwsrA7DUDHOhQ5ACPiWVZQ47rC/V17CuSzFq4pcHMg6QXsR1OjHlWLtSYcKSnd8qAsL7OqQiFUl8/tGB5P3365Pqk3a5rQYMoYJytkQ8hFNymmKhonYg70t7JLVSR20d1w9Ca65/YUUBgIcdTRyfj8/hjVj/WzdikDthvILZrsT/Mg9N802L5lLNiKenjej6hc7KEzn3YyJpP1fW/2aM2Kbp0VadfUp/ZJ43HD5NH/P6GRFIQ4fsFzsHO9Uwvhjj8vhu7xqHuTBkhd4p5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=VUGnMeKXYhsQ4I9OJx4wnJ3fbX8ZcYbAOImg9h0puEU=;
	b=nUtUJATaPQxIobsWDzq0XfCc6YR3REFQ8jAxjPufvMGFXlbQp+uwII2mhOuRG31pZQ3P27mGQTbIN2EsO+TWeFWbEXatz5d5qs3RiCBnEXcFdfNdJekGpprRF78AcRJwYsW1K4rfl7x0fmUnFT0d5FXG6LnafRDVXrwSl34sbUM8MGhkx52vYSA0p7+hvePoS5DJcTcEDjsbj6j3M4UaECpknmBbW14srEON3C8HS5xXppT/vhQADhl8XCh2APvcUjD0pAOVg77iV/uhsD+9SsTLxfV2qLGJvTQSUQ1ylK2Q54a81wgK7lFejJ1DY4RO71er8rQ7/axEogvuMyS8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.160) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VUGnMeKXYhsQ4I9OJx4wnJ3fbX8ZcYbAOImg9h0puEU=;
	b=gF7CqEfrTRTmGE536cLpTGvv1cT1SbVVlLhHFGNpJZSM1USYzij5JYUMjQnB2H3JUDxzEjrHtzexjhWkv6QWjlLHjNeGW54mDix6L8AYSxw6W696nwx/7klaXRHEhCw/xEPZKS6Vhb4X9S/hBdUXf00KdUozLU6LVqBpD/oDTvSO36EDGKep/F19J2VcnumdIUcmDOC3NtNMxigGHQH0gnLOHOHRouxPMD70ZISOrgCn28pjhn0pKkoLpND+09skx+/waAqi+Ai/Dm7w3AjTVrAdJ1gL/zGbXOM7iCwTkSd69NDJy8wPbYIclXbEPf1dVFArhj/q0U5I0LOlbD1zgg==
Received: from MW4PR03CA0085.namprd03.prod.outlook.com (2603:10b6:303:b6::30)
	by MW3PR12MB4411.namprd12.prod.outlook.com (2603:10b6:303:5e::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24;
	Wed, 5 Oct 2022 05:04:21 +0000
Received: from CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
	(2603:10b6:303:b6:cafe::aa) by MW4PR03CA0085.outlook.office365.com
	(2603:10b6:303:b6::30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.29 via
	Frontend Transport; Wed, 5 Oct 2022 05:04:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.160 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
	CO1NAM11FT028.mail.protection.outlook.com (10.13.175.214) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:04:21 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:04:01 -0700
Received: from dev.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:03:59 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:26 -0700
Message-ID: <20221005050027.39591-18-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT028:EE_|MW3PR12MB4411:EE_
X-MS-Office365-Filtering-Correlation-Id: 05c2da29-eca7-4174-a926-08daa68f105f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jeWij9BSR+ld5x3cRQK7XJOwVQ+x+XDGyITyRqUSjvo5nps2uSnWQ+3iGIG2W2qQIFYkS3eLmafAVndcWjZKvay17CERvXztVJhPgRtHr+NkIu+OloUyx4q6CEh3MGxKLYRlPiX1mR4vZtwE9tvz88yx3KE0+PQRX9J72EMiNnZFtb0DQERSEFpRa9uOvIODAMCjGZTI8GFxuikZSyCm1IGr/+BzTOhXXImuiKGbVLciZdWetQKEbiQ2h02z4ouLmMm6czEFQoROqCpPGa7FTkAvyBZamMNpXb13zXPZKlJmYdg3ZciLVCCTaMMUPRoCYte9w273S8U8Lf96h5ofR4XbCp6xD1eFuOqfAUY1hC1UGiIEhxCqxCGdbIcATvKgsp+VUZzyhRnQPs7USVe7ZeDunylwfTnoAxmndzrhgmhygbz7w7DMny9TUCYbuVnscP9vh/SJKDaS2L2TdvlRBgos9ipW4aSs7zav8Rmdt3GQmZk8IxqAMX8GVM6jUVI/4jvmI+MLpy9DHm0KnwWs+m2Td61xJx3MQb5sNi4u3JWs2oP0AwUbk9e/dDNDyp1Re3OGsDluZy4EjRwUNDcLBw14kvETyc9xn1Uh7joDEyoAhjB4XtenAbuc/HfisBUSLqkcJdVxSzZ3Tr0r1Jr7oIf4gv0GKOf0D0e3gACKp73pGnz5nDhaPE7tqeGs7IcaH0B1Wd8Gc9pXDoVm5ZSGeiKSsLFj60NyFB+KeU/N7RnsN3W7XzSIMpxIvmw7VNeJXgiCm05sGebiLmp3Ck+hAVXW5xxCGayCLr66OM4lCRY=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(478600001)(41300700001)(110136005)(8676002)(54906003)(4326008)(6666004)(40460700003)(70586007)(70206006)(7416002)(36756003)(82740400003)(47076005)(426003)(7636003)(83380400001)(36860700001)(4744005)(7696005)(40480700001)(26005)(8936002)(5660300002)(336012)(316002)(2906002)(356005)(2616005)(186003)(1076003)(16526019)(82310400005)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:04:21.0491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05c2da29-eca7-4174-a926-08daa68f105f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.160]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT028.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4411
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 17/18] z2ram: use init disk helper
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
 drivers/block/z2ram.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/block/z2ram.c b/drivers/block/z2ram.c
index c1e85f356e4d..74432fbfe42c 100644
--- a/drivers/block/z2ram.c
+++ b/drivers/block/z2ram.c
@@ -324,11 +324,8 @@ static int z2ram_register_disk(int minor)
 	if (IS_ERR(disk))
 		return PTR_ERR(disk);
 
-	disk->major = Z2RAM_MAJOR;
-	disk->first_minor = minor;
-	disk->minors = 1;
 	disk->flags |= GENHD_FL_NO_PART;
-	disk->fops = &z2_fops;
+	init_disk(disk, Z2RAM_MAJOR, minor, 1, 0, NULL, &z2_fops);
 	if (minor)
 		sprintf(disk->disk_name, "z2ram%d", minor);
 	else
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
