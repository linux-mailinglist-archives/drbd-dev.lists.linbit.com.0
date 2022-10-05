Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A96D15F4FEF
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:51:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7D64E4253FF;
	Wed,  5 Oct 2022 08:50:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BA12A420671
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:20:24 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=LCpmbioWARSij48hDHxWLETjLMMmHLguu9p6vy+uK6V5AAtbjUdqGISS4dRk75mtngi3QoVyQrnDHJc47kldN6nDu6DKx2U4uTs0Vinyrc0U4wEbc8xpnjkC8Q+qRcLeE7nYL7jg0pUr9nBs2GSn+HJDxwOEtitSqYUobEMqIDI8zz+ONDXpwr+5PwoNboHoxsQ/4vlwHOjaiyfwHpoMg39aFdxL1uY7zrSjT7H/JIk/fPCfDYOkYAsBx1SAeOzVzDiJ1Gd/Xik4wcPC3NlAJlDYzdZErrCg/o5W0BCwM/ohW0/prXaqrQGJ1cBiTYUDIH7VooRQyWBK/Gl3Teocig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=VqJq9X9tqAo2dMwUgS5ahUWpG0s0I2opXSaHSMh2AbQ=;
	b=M3sP6J/KVHmwTImmF3w5VPNkHq0y+eP62VtSieGymIrypyclSKoFGUSdnCUYtqgCf5VxlXwpf6aSL1Wg/dumvJDfxk76ZyNy2N2IwpgvBU73kFGtv29kVMRgsClaXpP/4UVr0afi6OTvfIi052UFPmuTfc082BnwGxHCktVl0Rnxqp5bnoKhINSHYiKPcJbRFqz3g98vmo0nu2o5EqgBzIZVjKrPiQfziZqu/JHNoQDYE1epuG9b0Qo7b8KiBoKg7YSWq58xjrHg4Iav/JAJHI/L7EICeXQTVxtu8utXkifKq6nE1KM6bYUvbL8doolUStCq7b542aQ445UmRDo2qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.161) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VqJq9X9tqAo2dMwUgS5ahUWpG0s0I2opXSaHSMh2AbQ=;
	b=HU8/1NL9eoXLN+SSVeZsYiH99l8CYhxOVwMgzmPBqtrlUgjshbaVU62ykvsJns3WBpB2CCGd597dmhRtr83E5ykgKhPM2n9EE22fAffwFreIi342IFo9tKshfBKT7dmLP0FOjLtM3TIBuv94kj8d0UEzmZdzKF7odj++eo+bckqTqn4mwEOoJUYqTch4ovnkj+qZzmifCXXt4ydGe5ArQNyStNeh11VOh5ZcSWjxWPsdGz27dSRUSulxHu/qHzhVnGizrh75lYCylqTp3tSprdXz3SSTCojbhI/qyva2M4ytBXj6GsoAJ2+nGIZLKiSF/oqyKACJyhENbFYuXfxlcQ==
Received: from BN9PR03CA0317.namprd03.prod.outlook.com (2603:10b6:408:112::22)
	by CH2PR12MB4053.namprd12.prod.outlook.com (2603:10b6:610:7c::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24;
	Wed, 5 Oct 2022 05:04:25 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
	(2603:10b6:408:112:cafe::bd) by BN9PR03CA0317.outlook.office365.com
	(2603:10b6:408:112::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24 via
	Frontend Transport; Wed, 5 Oct 2022 05:04:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.161 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
	BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:04:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:04:13 -0700
Received: from dev.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:04:11 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:27 -0700
Message-ID: <20221005050027.39591-19-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT033:EE_|CH2PR12MB4053:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d8d60b-e5d1-4050-db8d-08daa68f1276
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bVdH+XWqMGPPWB1/2H3kNLQPismwJd2x3rKmctdDUEn6FYMemnCk8gfzdGSHtQoaKtz4WLpIRHd5Dmuucfu4o5W81SckmwVzL0NFlJD3tvBwVGuwqZKE5NEjg8cWN0fL3/CzgKJfWca4VrI7wqFqKhC67gL2mM55hnahN5c4rvHJCGBWaXh5aFplVqX+fFZ+Py++W1SFyFnMfsYC/wAFGoWeOKVvMX9k3WuHs3nHM66bGBE9HfiZC9Nj/Dvp4IcNpD2qcHrxYwVZtSrRUpvDo2gUBsIzwarOV0nmLl0VYVzB8S7dUgH2qljfOaCKaTrnn5FLlc5QuKzuo57NRDZwpPSvpehxGn3vMS7tzFQXzbmW8UD9drXJ6qxiRuGJU68nWeUTWn8Sv3HwkYMD9g+G9DavHpOUN0cnXTwDy7LTOKuLkVDEUrwriptbflnBGhkf2urbimyFSSna46KTYjtI0qt9yY7L9Eh7YpEZkx2MHhLOnMG/DE9+LiTS4eXsD0i8C99rfpDfCTTFlkno9ewR2C3+fGnzcvi7r/MigpjVL/NamD5Z45+M3f28HsQaMSOxKoCwuPEOdMRIc090HqDdMNmEGBdEL9gB+IDuV7D3fUQiQ0/EBtcvSYcDHuCnKXJhfI9xDd8/DW4m8Ttuye14W5clNvNe5PWjYbG/8UA2iwAWS/p35NnnxPOrJcI3B+68GuKXnULEvX8B/W2eVNxnc5puAJxMSnFya1wuU59h+Xo9lIOdsHPCfOC6oYxG84Wx4jMoXaYts8R+CAbnOkOshGbaxR5nSIStDPkHs7Yj+U4=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(82310400005)(36756003)(6666004)(7696005)(478600001)(40460700003)(36860700001)(83380400001)(26005)(2906002)(316002)(54906003)(110136005)(336012)(16526019)(5660300002)(2616005)(40480700001)(8936002)(7416002)(7636003)(4326008)(70586007)(70206006)(8676002)(82740400003)(41300700001)(1076003)(186003)(426003)(356005)(47076005)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:04:24.4316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d8d60b-e5d1-4050-db8d-08daa68f1276
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.161]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4053
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 18/18] ubi: use init disk helper
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
 drivers/mtd/ubi/block.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
index 4cf67a2a0d04..07c085a5fd52 100644
--- a/drivers/mtd/ubi/block.c
+++ b/drivers/mtd/ubi/block.c
@@ -420,9 +420,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 		goto out_free_tags;
 	}
 
-	gd->fops = &ubiblock_ops;
-	gd->major = ubiblock_major;
-	gd->minors = 1;
+	init_disk(gd, ubiblock_major, 1, 0, disk_capacity, dev, &ubiblock_ops);
 	gd->first_minor = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
 	if (gd->first_minor < 0) {
 		dev_err(disk_to_dev(gd),
@@ -431,9 +429,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
 		goto out_cleanup_disk;
 	}
 	gd->flags |= GENHD_FL_NO_PART;
-	gd->private_data = dev;
 	sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
-	set_capacity(gd, disk_capacity);
 	dev->gd = gd;
 
 	dev->rq = gd->queue;
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
