Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2339B5F4FE9
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 636A64252E9;
	Wed,  5 Oct 2022 08:50:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 25E21420960
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:18:23 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Z5Ms8nlAvTEGYjya39uADbHnZjToOYwUgpk/bgkbrcZSFAdg6Ro53ZGzJEwQFMOdg45AnSbjBA5WyBq4k08l7g3qeRTsVyrmi03DgrQBbs6DKbG3COHBcoPkFKS+hNwSB6aWZi3qIx7uzEfhCEgj4t3hY9pveLjT9p13ZzJTajqZy32MMMTv8Q4x0XdWrDEarjuNgaSQZhFrybiLQAHQ+TOEmLzR11hQSVkYAWqi6/0nLyNQtkum4QYOBv09GB60roGPAZ8pRkPVrdKUs4R8os4M48LezUdZG9wK613EN2Dwx1QRt/Ql6oRg0Ff7MwwI/PQWZPimLaketRkd9qaG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=PblZfXDPT84swuLDCHtey8tDUOOapWOEpa2uAMacvhc=;
	b=I7o9zVTU+rNSbtYndYrdlUfDEkL3FNBgXZJQv34qArFsiHDPgwfJmrWtZpH0uRMyQ8dXzmxtvqRNvUyxspB7DPe/Zq9bjR2asgLfuvzQnPoMT/3FgkzmCmPhiTpANiWEaiPQe7A6v2C6csXKErxl4fthKdZo29yMyWDicdeoIILQi7Wm9tCNizXIsXkRzl4v9xAnanmmAd3vE0qDJwXK4Ytmfyiq6VD/8VECwZdQbFwD8Wf0iH1sJNmgXoqaO7ZRCyfsbvrgsXvlXdM4e/WhFUWOSU+a8/Mn+6fi4KqzjAciQkTpo1PMvihq/TcmWQf/jeOX3RdV6/JVFuimELYRvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.160) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=PblZfXDPT84swuLDCHtey8tDUOOapWOEpa2uAMacvhc=;
	b=owsAdzscqAbBXIiv97g/jyOy6s8NAgiKztWSQTEkyZcBa002jvEPEuvwg8MbW/a6oG6DDZ2tvoSoWtkjrY8u8KhsMtm1Yp2BKQa2VVbEG6rN0XxdA+5eMsZuUu00Yi0N/F7NRz/ruwNNVOK0R5FURE+hTIc6ebxLaY9o8lVdT1ziGlYocEret1gelIq7Y+pepL+FMU76scBrMn037A8pnxon/Tx7Hi/j0+hwj25B8x5OTCh03VBYbscRLvLWBpEgH6my4bzfCoCYIr3K+HU03wXS1+lTR9kVY8CiBjy+7O8QantfgSz6bZtWua8ubT2lJBrKbkM331P/vZWm3J9IYA==
Received: from MW4PR03CA0241.namprd03.prod.outlook.com (2603:10b6:303:b4::6)
	by MW3PR12MB4508.namprd12.prod.outlook.com (2603:10b6:303:5b::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24;
	Wed, 5 Oct 2022 05:03:31 +0000
Received: from CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
	(2603:10b6:303:b4:cafe::5e) by MW4PR03CA0241.outlook.office365.com
	(2603:10b6:303:b4::6) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via
	Frontend Transport; Wed, 5 Oct 2022 05:03:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.160 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
	CO1NAM11FT042.mail.protection.outlook.com (10.13.174.250) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:03:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:03:12 -0700
Received: from dev.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:03:11 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:22 -0700
Message-ID: <20221005050027.39591-14-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT042:EE_|MW3PR12MB4508:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f481e14-9489-4f61-c30c-08daa68ef2a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vatkrtEP4twpK+l8juF6Z87iLJfHuqWi5QQS9OgY6lHdDd/TZFuADk77AK35ctmMrrrIrGciIuZr79vY0k0/uKUgz72stKFIuvxZ0gkAa97ysQyqiDQjo0G+d6hYgATUlJaiBwR6k+obaahKI4VgKWKOzOtMM+BNNUEUcTjo7EsxT0WA9bAf2D8FKTMDSeZr3IIvS+P8o3ktS2QhlrvW3V3gr2IrehM1S1/FmFhtehFJztlm8WwqR3uJwahQ1U/t/wCdv2Xo+OdEc4jeSuYXZ/3DZTT4BiImCeJTzX/cxtfQKJzCi0FvBGIVwyFsAmSzm5Ti0UFqUP8zL+jmq8BuwwRshH9vY7X6gREeqIJ6bvr8LJWuK1q5owodV62H0Yp3+nnKRyB3eXP5Px7COc58Hu5lA3GdQcf180HjpRHKhCEOE1h54cvxNWqFM9lwKOHqC3wCV20l2wzu5LU9wN0AmkCM+kA6HfByzcme80Z3j9xtD8/o2aqoV2KcaB6wwGmACWlbe8wv9J+zun7C2QEWFHiZ3DZLnbgapL54bblmwXIMIzNlB/F1V1mTQqaXs6EWSySZ83yjVXy0b3FkvtHzKG2CATpV57a5+LElCZOLJRJ2vtQsPPL8la+B9x4/QlrvBKlf/qJvviHjVAZ7f97VLAYAwasx835QqRodUlp3Vp8CWChpZmdNgLD+y2AswzNhbf1UIKci8LU+t2D2KFjIqSoQpesT1+BertBfcHYXuI0AKyOnqDXA+kwy8kkna3eO/jpOSQ4e6S5u9gOfGg5/ejf4VjBaufvS2qOT1XAoNBK9k+XA7nKlJYh2FjPIuqoj
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(346002)(396003)(136003)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(2906002)(478600001)(36860700001)(8936002)(83380400001)(54906003)(110136005)(6666004)(316002)(7696005)(356005)(82740400003)(8676002)(82310400005)(41300700001)(2616005)(47076005)(7636003)(16526019)(36756003)(4326008)(7416002)(70586007)(5660300002)(186003)(1076003)(40480700001)(26005)(70206006)(426003)(40460700003)(336012)(133343001)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:03:31.1769 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f481e14-9489-4f61-c30c-08daa68ef2a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.160]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4508
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 13/18] pktcdvd: use init disk helper
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
 drivers/block/pktcdvd.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/block/pktcdvd.c b/drivers/block/pktcdvd.c
index 4cea3b08087e..db8f4ca5c09c 100644
--- a/drivers/block/pktcdvd.c
+++ b/drivers/block/pktcdvd.c
@@ -2698,13 +2698,9 @@ static int pkt_setup_dev(dev_t dev, dev_t* pkt_dev)
 	if (!disk)
 		goto out_mem;
 	pd->disk = disk;
-	disk->major = pktdev_major;
-	disk->first_minor = idx;
-	disk->minors = 1;
-	disk->fops = &pktcdvd_ops;
 	disk->flags = GENHD_FL_REMOVABLE | GENHD_FL_NO_PART;
 	strcpy(disk->disk_name, pd->name);
-	disk->private_data = pd;
+	init_disk(disk, pktdev_major, idx, 1, 0, pd, &pktcdvd_ops);
 
 	pd->pkt_dev = MKDEV(pktdev_major, idx);
 	ret = pkt_new_dev(pd, dev);
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
