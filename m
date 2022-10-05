Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E03D5F4FDF
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:45 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B32D4420966;
	Wed,  5 Oct 2022 08:50:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 915 seconds by postgrey-1.31 at mail19;
	Wed, 05 Oct 2022 07:16:29 CEST
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 668674201A5
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:16:29 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=BuBsSGHoSij8DAyIFrB4j4Sx2h+gmAl5kD0oBF5Q4j7PXZI+xjFA+4F8CUbxUPPaOlVE3mdJmkTfV6lv8hOEy7W3nvrlyBUuxxlXOCBfPhPCwE0KpH9sbia1DkI/sfl3MzM+duW9J4AAQu//EaBLqXq+Dbg4HMOWNlpp2ntRXS7Svu0olMKNR3qnKPF9zlMXPAIKK9E5SSxeuvkme9MDhjtFSaNgkUdULN8rCXiKCY5r6oThIY3WR5tnhz+LTlUzvxYRUht6OufjzWaYlKPIxCtHrMptPh0ErVVt4hQ9avGCoKA+jqh49xP6g9YxaRRHhCQzPS1JrIN5fwE+Hrncdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=9+hWFXD7w1pH08kchvxYLyGqOHFyNMvnAWLDOWycxz0=;
	b=hL7pelQR37MKFgwRqZOT2/o4jpsNgcg4H6yxbdxTTSpGcP2Rpa/olXjsTy+G7oYpZfsfDq4XiJaBQD3SYZ4PTzEiUMvNflMgZI08tZowzu4plhSBJzq51QVNB66OEAqiGVLF74+iYNHL2l7APbT48CJYgyoMdE2eav+oo/qgRrydrg3BVTw/5mf16/BDQPb+akZ6LHEqsrPAjbg+pFzUOLUdsFlmdmKy2kpCfo7nTkEvpB2SagRaLgTUW6xcHlzQLA+PkTz48UWFHkL0fzRYuWjoSek6jPyTfhHP4K5Pl3LRm78o5NUBI1LwWvXp1TybHgKh2LOrVWduAsPkBQfYVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.160) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9+hWFXD7w1pH08kchvxYLyGqOHFyNMvnAWLDOWycxz0=;
	b=VU1dG5waPGIbBU3D6Q/akGAZOGDRTPH7cqqAP1pZ5ZlnRPK182n6JhMEZMKLYwG9P5HbwlBH2ay/6ofsfGLDiDnd+OCG6vT11IjLrzndNgQTwogU80+hlVYGwk1mzBDQUeiWMIvuVv1JntA7GOWQmPLCpZGERJqXuPj5KhvG25PfKiF4XSIiggUmxycVaHxiLkDX47gBzFETwmfZHbouXEoWTL3Ni8npVNePtrYDW+OzZt/drGo2vo6+uR/4a/3/tr8W42LM8JHzjdiCoKYSjPGHD4cs9i1V9iQM3Kw2XqVLpqBKmgqr5F78n+6GSfIU2x1QIqm8+QEnwHNJQP0mnQ==
Received: from MW3PR05CA0026.namprd05.prod.outlook.com (2603:10b6:303:2b::31)
	by CH0PR12MB5042.namprd12.prod.outlook.com (2603:10b6:610:e1::24)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17;
	Wed, 5 Oct 2022 05:01:12 +0000
Received: from CO1NAM11FT081.eop-nam11.prod.protection.outlook.com
	(2603:10b6:303:2b:cafe::3e) by MW3PR05CA0026.outlook.office365.com
	(2603:10b6:303:2b::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.7 via
	Frontend Transport; Wed, 5 Oct 2022 05:01:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.160 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
	CO1NAM11FT081.mail.protection.outlook.com (10.13.174.80) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:01:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:01:00 -0700
Received: from dev.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:00:59 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:11 -0700
Message-ID: <20221005050027.39591-3-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT081:EE_|CH0PR12MB5042:EE_
X-MS-Office365-Filtering-Correlation-Id: b3119055-1693-429f-062a-08daa68e9f08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: isFAiDsqSaF/uc9JuNH1VgxatKxFu6KOEDONYfon/AS7I8aJ2xdrs/PuPyz0hD7R3Dmi4fafffg5WB961guBBgyNhidIGnxmJN119WVBsHhNqkQc9KUCUGdxMhf+9g72G4CNsxf0TYIOQt3ChTsjAfz2QkMgHkeS4cMee7hHbenxYKYfzbBy4pTcb4v0U+pe4Zvv+vrVa8wpkR24NHksoRt5/VxX2DiAfDPvbeIxfUjUzQfj4fwCsKlcLifDm2YA6EMhLt1LUdiLNuovjFZnVrZ1fCh2BAXmBdJn1nSSY7Ag1ILUxBpxZGZMU7VQ43yBNPw6DZaqHMefuRXTFdTrGcCxft4fwjGhRw/JdDy/dtxNu7A0XRcF/S5IK36Dxh4raX5GDeCsS/eWRycE/HR5V1FoqrOSBvDtJs4VLz8rF7EEZB9gE6BydW/H5NPX2cHwT1JnUUwwXClDYlg4gQWGxd0Hr0Ar4fjSmF7BmkOSmFxgL+H2AXdvTgtwdXF+GHFSFcheg0D2P2PT8Sx7+XduYgugXu84QOrS+7lZjydIPqEuKNCSdYaLcnCyzbSuNPp4HxesmElhkyduSw94J0HnSyGB057bWDyC3t08YpdgAU7wdVDpZQiBYq6HBi6vX9NcMAZ0urpmIpFs2sbBSjAwBRE0d5L9MHOcrvBFnQfpsbC9Ykp2pMjF8jO3c/D/dA8vJczyo5yVb4QB/wXlgEVN2mHTKuGCTwx2ioYc6+9LofPuw79o5egr6Y09+exwUVH2up1lOp7n1XfgPwufPBGZMvSV5ItVZJj0vDuTh8fvAxE=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(8676002)(36756003)(5660300002)(2906002)(8936002)(70586007)(70206006)(40460700003)(316002)(7416002)(41300700001)(4326008)(26005)(6666004)(7636003)(40480700001)(356005)(110136005)(36860700001)(1076003)(82310400005)(16526019)(54906003)(7696005)(47076005)(2616005)(426003)(478600001)(83380400001)(336012)(82740400003)(186003)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:01:10.9079 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3119055-1693-429f-062a-08daa68e9f08
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.160]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5042
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 02/18] nfblock: use init disk helper
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
 arch/m68k/emu/nfblock.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/m68k/emu/nfblock.c b/arch/m68k/emu/nfblock.c
index a708fbd5a844..81d3d3edace6 100644
--- a/arch/m68k/emu/nfblock.c
+++ b/arch/m68k/emu/nfblock.c
@@ -121,13 +121,9 @@ static int __init nfhd_init_one(int id, u32 blocks, u32 bsize)
 	if (!dev->disk)
 		goto free_dev;
 
-	dev->disk->major = major_num;
-	dev->disk->first_minor = dev_id * 16;
-	dev->disk->minors = 16;
-	dev->disk->fops = &nfhd_ops;
-	dev->disk->private_data = dev;
+	init_disk(dev->disk, major_num, dev_id * 16, 16,
+			(sector_t)blocks * (bsize / 512), dev, &nfhd_ops);
 	sprintf(dev->disk->disk_name, "nfhd%u", dev_id);
-	set_capacity(dev->disk, (sector_t)blocks * (bsize / 512));
 	blk_queue_logical_block_size(dev->disk->queue, bsize);
 	err = add_disk(dev->disk);
 	if (err)
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
