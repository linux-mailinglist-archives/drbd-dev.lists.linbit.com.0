Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 363BC5F4FE7
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 154BD4252D0;
	Wed,  5 Oct 2022 08:50:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 40F0042095F
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:17:55 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=OZkon10G9HObOjoHj+/E8j0jCFQTCb11I15ptCW7jqk+H97MQRl2NfuLqJkPDDqdExW+70Zv/P1hSYjJCSDS0tWFQgTfiGL6KaLRP6jl0hINnh6YnJgZTaflm3wjD0pddfyQZyeXeHLrh/4nRZ9N6zVqCTrjMH2a+GQwbA54JDwdy+5REgyUgu2YcG86vDcbMTpCkkK2BvDBDaDLHyWDV32iKo6DSe3W2/D4457SfEQjvsu6ovIuNNskVdYHVWRjnlbOz96zFffX+LlgXpJ7CVHqNflm9DdEi+LDzK1kKUytcC9hp1pEsRWLre/nY0T1IBDHlXZATM4AZY2bnj7Cfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=gpi5pI0qiowRU05AtGhtX9GMgKdhyP0p67bdNrYfLTs=;
	b=VVvqIfYKZR14ZZgXTQf7m5/Zt81DeQ8Zw/iHloXEpw0NyzN/eD2AMsPX/sWXbRHO/xVErM/i3CKxS0+e37zRijK2MbO93OCfrswfyLF5hCOAhvmczi1GyymanKmdHAmO8Enfcel2jnunRkQwFi6j8IFmf+X0alNsMu+yWi/aih4F3SycdPmMl0+Ca8bWcJB2MtSI33lDmiYJxjbmQJAo3/PVTKTnesBsNt8+UxJN0vEScyOiiy/Zn7mMyGVIykrRH60tDk6Art3rSLrDZzpuYhQcpHrGModNLdATPtzaAtESMr48Vp4h+3JyQ7m+XWqUXVn2zSZpkr0z4CXxsb31iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.161) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=gpi5pI0qiowRU05AtGhtX9GMgKdhyP0p67bdNrYfLTs=;
	b=GkGhxDyleND/SVZ7qAuPFCKTkBvhjK6oBtCDYnL52reXXTHtUR3wyAn03nSRnN1uFBQHS4ImG30Zyiykj33NyHOxDCFmw7klj1myPCMdrRDdHMzMxgyhFbLCxEn9Wt0RNWtuX2DC5ebkJ32O4JjC6M1vqG6+hqphVwgvJuXGdav21UVlYv06Q7ljR5ezTcezAK4BQMzV0OH4Lcda9TIIH5LQ/3xZK+H4IZcM33pbEs9fmJEE3qkPpiQXjkF7o4F3rOw5guOjlm3bEudrw28MmSs40V1NDMvfLHUCHWzRd/8m1RHUzc9XdHYPRLoDSglJtxo1X0Q2UYmRsitecMgAug==
Received: from DM6PR18CA0031.namprd18.prod.outlook.com (2603:10b6:5:15b::44)
	by DM4PR12MB5071.namprd12.prod.outlook.com (2603:10b6:5:38a::6) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24;
	Wed, 5 Oct 2022 05:03:03 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
	(2603:10b6:5:15b:cafe::24) by DM6PR18CA0031.outlook.office365.com
	(2603:10b6:5:15b::44) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31 via
	Frontend Transport; Wed, 5 Oct 2022 05:03:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.161 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
	DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:03:02 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:02:48 -0700
Received: from dev.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:02:46 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:20 -0700
Message-ID: <20221005050027.39591-12-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT016:EE_|DM4PR12MB5071:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b3a64d-d3dd-4c96-200e-08daa68ee1b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xulZF+xkfqutS19v8Q1wkLUOdxZ5qS1T1zBcNnfIpXJCy9dj/y1QRn5tfcqZjASzD0lqTud7k+fdOYtIi/YppOkhyXG/aEbOBAiadrho+VdMfBhf9zfBoMp3Xf0LUkr2R5gykPEpx9oiz3JtMSM95H+vEPoLkwzi+tmySQ70xHPRxHQWtrHErcFHUJ61ywzG3YUieBhfRgz1cnqluA7CZBIqjZqU/Sep6Ry5KNgtg19HMMFWzbf/tM0UvCRgPAq82tuO+sJXmQJfMW9ZziSMbF68ERGnn5Dm/36a+auZd3iK1+OG0+Ym4ipbgPWbkg5lytX1P46m2VYb1m9Udcqtud3aI4MAfbx9ZW7h9KN7BjYR+pcpx7fxeDLhagkk0wghHI7nHP6Hr4bmcrS8i+5e0k0RCdjh3hmqNnScttiwpJJ8ccQ1DQb3UO++/dGg9hN/8oOSFMQOsgUBRB8PLixntcy09ksRUyCwoiYsn3834ZC3qbPLHDKSr3AedY254/eCM65n7PlWEuPVXnCPdLxsCij+ET0QZHlRcouyQ4TTwL59W/KE+7dJaFpD8ahVe42pNfIg8dB2DVGqH+uVxAsjXW0M6CeWlG8qyC+h3AIMtQCVXW6OLQpDruoelSXBZlZ2t+eraOFFuGJ/2PY3aiz3gutyQQUt4zKz9QSrjiJos1Ct7+7KifArfL2jmyTPhNeN2llzbW6qFpvwePcTbvef4bjZj+vNnwU2DURgtO4mouAy7rvZ209TRBd3IM9bVNk7g1bH3KsMyGVkM2Ojs5MsVt1i1bM0AKkcTyhxKxv/3ms=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(47076005)(1076003)(16526019)(336012)(186003)(83380400001)(426003)(356005)(7636003)(40480700001)(82740400003)(70206006)(70586007)(4326008)(8676002)(316002)(54906003)(7416002)(2906002)(41300700001)(5660300002)(8936002)(110136005)(7696005)(6666004)(40460700003)(26005)(478600001)(2616005)(36756003)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:03:02.6585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b3a64d-d3dd-4c96-200e-08daa68ee1b2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.161]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5071
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 11/18] pd: use init disk helper
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
 drivers/block/paride/pd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/block/paride/pd.c b/drivers/block/paride/pd.c
index f8a75bc90f70..9457ad0cc25f 100644
--- a/drivers/block/paride/pd.c
+++ b/drivers/block/paride/pd.c
@@ -919,12 +919,7 @@ static int pd_probe_drive(struct pd_unit *disk, int autoprobe, int port,
 	disk->gd = p;
 
 	strcpy(p->disk_name, disk->name);
-	p->fops = &pd_fops;
-	p->major = major;
-	p->first_minor = (disk - pd) << PD_BITS;
-	p->minors = 1 << PD_BITS;
 	p->events = DISK_EVENT_MEDIA_CHANGE;
-	p->private_data = disk;
 	blk_queue_max_hw_sectors(p->queue, cluster);
 	blk_queue_bounce_limit(p->queue, BLK_BOUNCE_HIGH);
 
@@ -939,7 +934,8 @@ static int pd_probe_drive(struct pd_unit *disk, int autoprobe, int port,
 	}
 	if (ret)
 		goto put_disk;
-	set_capacity(disk->gd, disk->capacity);
+	init_disk(disk, major, (disk - pd) << PD_BITS, 1 << PD_BITS,
+			disk->capacity, disk, *pd_fops);
 	ret = add_disk(disk->gd);
 	if (ret)
 		goto cleanup_disk;
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
