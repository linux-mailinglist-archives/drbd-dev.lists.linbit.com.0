Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C92F45F4FEE
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:51:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5428342535D;
	Wed,  5 Oct 2022 08:50:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam04on2064.outbound.protection.outlook.com [40.107.101.64])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BE9D4202EE
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:20:10 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CAP5d9ZCw3nkL55O2yQBbFGXC4nQ6ccSeuhSeTEgd7gRGswOmVcki6wy6qtCx09fUs+6SDz78bgb8wIEEioCKIeMZxGLomDUh+aNreGalE9Agm69BNr0uosDK76QkX06dEkqRr8jLPo8x0Gt6aPlsHw5vUsQf/eTTQL+NHVBz49WpcEBhyQw8bvA7zeD+VFjUn2VWh79XQiTyvjQjGjTY3jXWrzoHDOALAdDZZ0odDoUmny7cQzEff6ACwNxpDx24mtW87b2AyutNoW8+UseSpbPSv2idyXX2ilaxOzxNi0a+q/2fBjnkotLMiUCAPHjWXA7cbpC1S+PA3XfFSzUQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=rhfj6A9/vtjkP/6TGk0NS4U+K7ntKmNBdm23oSRWgjY=;
	b=bPaB6JiH7pPAuejeJVVpDX/q/PYbgUwG4OCaZjK1JNDNVnH8Pkb8gosa1WNvx7lZG1+/WtLcm58pkn/Itrx5OUPj1hCcizahb4ImlNpGqxP8CJwFzc+ixfWC+SFtljjBNQYL3ABOGUOisgpRui1lskj2LZnLF+/QDMF/l0t8OVugPbag00z/2MfUfvftc8p3Cvig4xqxQqau4jqKENQJPL0NQkomyYU6J0g9bKJ6XL4lXyLtACfClKh+4UeL5P3IDkenL9FBp5mu4H+rCqfrqkKYkSSc4730YMqvqRH0Iw1obwZEn9TYMBbKuFbgW0iQtAwyU7p5zmRFf3VT3DdGZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.160) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rhfj6A9/vtjkP/6TGk0NS4U+K7ntKmNBdm23oSRWgjY=;
	b=FPGXCq7z7AfCLOPolxaci3uTrq0yTBIuSsyn9eicS8CrDOk8lEQQiu8MesrOtHNpvNMUwvh57r/7c08jtKTCiHN/7kCNf4PglpybP23FOVZjb0yReduyMBbFk7l6OGaLMu6CZCtfnhlc5ug6MJPku1lPFs5Hh3n82AmZMuU8PSoHlibdZZLSpyXaq0C+ouSN0tHmmG8/w5mE9yAaTGzkQbxp1T8KwdboUsON+3DXRE+d9JDwpy1LX85SzRl6pVW43p9PbLBDK6+LwxLuXxXUe/gwPHDCtRnTN+afGxkyZuRH2idOlzGrKE+YLb0ky9X6o3Mu6kSOkDakrX0PvUL7NQ==
Received: from MW2PR16CA0016.namprd16.prod.outlook.com (2603:10b6:907::29) by
	DS0PR12MB7702.namprd12.prod.outlook.com (2603:10b6:8:130::13) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5676.32; Wed, 5 Oct 2022 05:04:05 +0000
Received: from CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
	(2603:10b6:907:0:cafe::1b) by MW2PR16CA0016.outlook.office365.com
	(2603:10b6:907::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24 via
	Frontend Transport; Wed, 5 Oct 2022 05:04:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.160 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
	CO1NAM11FT085.mail.protection.outlook.com (10.13.174.137) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:04:04 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:03:49 -0700
Received: from dev.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:03:47 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:25 -0700
Message-ID: <20221005050027.39591-17-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT085:EE_|DS0PR12MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: 97ad017d-57dc-424c-cd56-08daa68f0663
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZSmKvNAkH4UcI0t3D7dOAW8edzC3hayVgBXM3yLBJ3T/6mQlKibMmVUUlw1DHjGmDqZWLu0k2u0VPZsz4Xu26ffB477AVipmlMUkafiCiNbpgF8rmtEvwon2D/3PRbAK2M0/ZvfFMgaMmbXkJvCAylQRBQvsKCF//t06MAwepSokksYH22Sm1Zap6CjAgfP2k0bLsEFcoX+oDBluhZdpZTWf3UfgHhisI56qs8b/PQ0jhMDM+UaCCnCON6yFTB/YEXpYffGsdhvkSX7lkH2p8kIFFErrZXlFPPBgfMLYZkZbY5WF2HVabLwLh/EmIyslbdksEmb49QXmwleTrnh3Ng2dpp4noym0WnziLupNbY8zUqU7GpC+qppSsLSfmJKYKhIjq+zkXAPUg+0l0SpSO35b+RcqXFwnmOXCkEwLehiYeR6zr8dxlo2CCRSHrgSOFDbPqL+PLFF87YJN2PCgnzKM+jiHkT+ADD1yYRBq2LJD0fcLswg8ahTwuNYUudERHEQUrx9IltT2dghrnoGA3eJQ4ak/+fwTKVyOzkG44SjM+B84Q2cdYPQ8Q+OgRN0C9qZF3b9T1hXkChnzLCMiPe4LbGAtfWSQh0Hi0NcmLNtFp/OIkYCSYQsaQVfM+LbPvEETGs0KiHioNlJEUqTr+XFKADQE6fK/44C2PwAc+HEN3zWEFBsuycKEMMaUTYWE06dNJ01rmPAIqN7zA5dVRnMrcNO4igLZykfRZB59PrjpshGmJc7zttBC0dk2fwIFLOpz+jlxc2FVgA0w19OtivXE1cSRfeIJB1eqOikPhC0=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(82310400005)(36756003)(4326008)(8676002)(40480700001)(47076005)(426003)(36860700001)(82740400003)(336012)(2906002)(5660300002)(70586007)(8936002)(70206006)(54906003)(41300700001)(7416002)(110136005)(316002)(16526019)(1076003)(186003)(7636003)(356005)(2616005)(26005)(83380400001)(478600001)(6666004)(40460700003)(7696005)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:04:04.2990 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ad017d-57dc-424c-cd56-08daa68f0663
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.160]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7702
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 16/18] swim3: use init disk helper
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
 drivers/block/swim3.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/block/swim3.c b/drivers/block/swim3.c
index da811a7da03f..3c1b92b464d1 100644
--- a/drivers/block/swim3.c
+++ b/drivers/block/swim3.c
@@ -1221,15 +1221,11 @@ static int swim3_attach(struct macio_dev *mdev,
 	if (rc)
 		goto out_cleanup_disk;
 
-	disk->major = FLOPPY_MAJOR;
-	disk->first_minor = floppy_count;
-	disk->minors = 1;
-	disk->fops = &floppy_fops;
-	disk->private_data = fs;
 	disk->events = DISK_EVENT_MEDIA_CHANGE;
 	disk->flags |= GENHD_FL_REMOVABLE | GENHD_FL_NO_PART;
 	sprintf(disk->disk_name, "fd%d", floppy_count);
-	set_capacity(disk, 2880);
+	init_disk(swd->unit[drive].disk, FLOPPY_MAJOR, floppy_count, 1, 2880,
+			&fs, &floopy_dops);
 	rc = add_disk(disk);
 	if (rc)
 		goto out_cleanup_disk;
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
