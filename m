Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EEE5F4FE4
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9332242177C;
	Wed,  5 Oct 2022 08:50:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam11on2048.outbound.protection.outlook.com [40.107.223.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3D3D04202EE
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:17:35 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ZlmVp8xMMiR6xNUPYXVZx0V33pYiLtmHWi+xrxmf82dVV2l+yFandfLGGdWtQg5QXd+liTVDQkUG5FxbzNjGb72pRNi10/0rPUdFj0GJvj//kHrKAZLeN9R6dGWzMCNBLrlfDFmQpsMG4ebtgqfzqyRtgopllqX12kpdFmiMgaU4ZOrqzFLWqm+QdWIi9PToaimxbm5D2D87vFfo3VJBGC1nLSvsdp+oK5jFEJ4WKu0g0oGhwtureqE+dw43BL8WOd2P6z+z5zqMT6irKBBRQ89pGHx0Lr+mMMeAdtQYGkY/v8+5afavTBNxAg8TUXow2/q+Uch4qTGzEIZmSgKfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=ZxfbJRt2BKtuidsfyYK1/83azNXpZLxlDE6e54jzQ/o=;
	b=XfQC6x/xLYCn9zACQVuog5fc2poI/JkXjbvHQyUa68TcjyNCZHjoj2UM3p5qvTWtv8fT30/Jtv9e2p6HO0d2/wYHapTQQ2L6tFJoJzs8Uw/dIhhFDoUzt2Fg7iHFuBavpY1/UilbbFSxZaq5CJ802lE3YSk4o7u9eh7QaLANCmUtYJLrZzZTwFwW+GJV8Z/6neTABsVl6RitirRJ+yUbdHLdYXx4eZFO0BRujddSuwRMIW0tB/sSafTWlQL8f6rjHQ2hZ1ZP9TyFVY51U/czcaytvZy2M86fy4pgiWTh0UxBZVNWaqbzfBX6PfVVFg6FTPkvOWPf6WISO+h6oOMuUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.161) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ZxfbJRt2BKtuidsfyYK1/83azNXpZLxlDE6e54jzQ/o=;
	b=d2Rtnn2P5Xuxbb7wtpPYIs2Vvg0ZFXqtpoVdiJj7Qqgnh12wNsdiDsfimtB8IdLRNmxVCe49dXH9zll17+3hextRZwfev72QpxnLuOWBd5YlJvQk+oeM9jzYsvYmn9KP+Lps/hIEzqzco9zEsD9fD63zcXDCx3pr8gdQo86Db7Gt5J8K87iSFSPc7nMARXgG6Zmc1HV8MJQGn7gGfjWbVxSDBkr/xz0VQz1PnxYIfrI9RVkjuEV4YJdtl6RRp+M1YopQVCKlxRkDSMslLwYpBrn13p+yHmcTpH2RTi+I+UuFBsu8DwoAZ+sh1FeaEe2k6YZt6t2Aa+qrqegurFs8lw==
Received: from DM6PR03CA0092.namprd03.prod.outlook.com (2603:10b6:5:333::25)
	by SN7PR12MB7449.namprd12.prod.outlook.com (2603:10b6:806:299::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28;
	Wed, 5 Oct 2022 05:01:43 +0000
Received: from DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
	(2603:10b6:5:333:cafe::cd) by DM6PR03CA0092.outlook.office365.com
	(2603:10b6:5:333::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28 via
	Frontend Transport; Wed, 5 Oct 2022 05:01:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.161 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
	DM6NAM11FT035.mail.protection.outlook.com (10.13.172.100) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:01:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:01:36 -0700
Received: from dev.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:01:34 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:14 -0700
Message-ID: <20221005050027.39591-6-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT035:EE_|SN7PR12MB7449:EE_
X-MS-Office365-Filtering-Correlation-Id: b18ee13e-dd62-465d-442c-08daa68eb1fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o1RG+PviX+SAr504ahLHHbhYY+N/OAg4Kb3/b51ApVh5WbH5RLNaWdrhF1RtU4WqvFYT5qk/Vo649OoUpZhPvyHl8ty9uRyu7diANc7AIdw8pl/cfBcBqdsISSMH7kwVjChs5ysWEgWGJ4Fok37/kTThJ2wdh7Jbjk0cUazieIWnpHNNCtkifZH6LX2vqhDbHpxQP+/56tPpicoCBNBpwhfS9lQv2r02ofDeTHwquMvQ3yHDbcHc8ijH4H3RVrBed6gq9Rf/cjhVR3yiKYGiUwedlSv5Fjoi6p4dofecCnxlb/8R54909JQHGfzj4VofxcnL5DutScGnvYsRltY8caLu504968wCusjFHjKoQ3iBRn6B4TdMIYhSp5ILjS8nDenxr/vRVqRFYyBo12JkyNQOrMFvnomYQ4zM5lpH4R/fLKHBlpFZLq5gmYkQiEo9e3od8Ohd4pS7ywJkkm9FeH/kf0bi9hXjZzTJBM56aG9vBjXgU8zu1T3yjT2JedVDA0wQXLrwazZQLW+6aa+S58VoL78rv5nSBkEZCCeATvQ3UOHtwHuYHetQALh6tMuN2ndsN0/gQRHen9oFgDIuMXct+JHvCGHJ9FPPEQR+QTgZQNuUs0zTVN989pTqHQGbjHZadBokA5kxqXEEfBk2UCkQbU+7lPB/qMWoZ6XsgqWduLMAbCfKMmjpw8QfnwRAj+/g5WgpRvZvGcwyMbcOedlLdbv/I84ZaZFubtNRcOnJSzB7iqdDasrNxGLfMsnUcrOAZ1lDo3LE9cptq0GVwmylVv7qOsDg3f1BZ3Os7sU=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(186003)(16526019)(336012)(426003)(47076005)(356005)(7636003)(82310400005)(36860700001)(82740400003)(41300700001)(8936002)(5660300002)(7416002)(316002)(54906003)(110136005)(40480700001)(8676002)(70586007)(70206006)(4326008)(26005)(7696005)(6666004)(40460700003)(2616005)(1076003)(2906002)(478600001)(36756003)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:01:42.6007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b18ee13e-dd62-465d-442c-08daa68eb1fa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.161]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7449
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 05/18] drbd: use init disk helper
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
 drivers/block/drbd/drbd_main.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index f3e4db16fd07..58fae122de16 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2706,13 +2706,9 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
 
 	set_disk_ro(disk, true);
 
-	disk->major = DRBD_MAJOR;
-	disk->first_minor = minor;
-	disk->minors = 1;
-	disk->fops = &drbd_ops;
 	disk->flags |= GENHD_FL_NO_PART;
 	sprintf(disk->disk_name, "drbd%d", minor);
-	disk->private_data = device;
+	init_disk(disk, DRBD_MAJOR, minor, 1, 0, device, &drbd_ops);
 
 	blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, disk->queue);
 	blk_queue_write_cache(disk->queue, true, true);
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
