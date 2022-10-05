Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D372C5F4FED
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:59 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2930F425311;
	Wed,  5 Oct 2022 08:50:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 978 seconds by postgrey-1.31 at mail19;
	Wed, 05 Oct 2022 07:19:53 CEST
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EF8EA4201C4
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:19:52 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=mOUjt34p26zOOQaRS/pjhGTvFG5NArjL18PMUilpQqkpfW8Lv2Hv0XhNrekzZ4A449HXnwQdDxYUMDLHnhgjhbE0gjfzrZ2Y2ByeNe4Qvx8yLVoZCwiEUL8Ujn0ZCTIrUIfbQStQsm0z5hUaKeMgWKrQk7Vh0QAorVQ8ta2IwOTE4+1NIAgbsGeMleQc9qs4TKR7LsP0gL0bvwMpjrYtgXesVYBdDWoT5Ezytuacgx9Cnv7u4lMQQ0tGVhyjnTDYbJqAyrc5LOO3kpE8KvmU7dslwD62xRk4wJ7v/9A4dIAjlnaeJZpdeCeb8VrrPNLL++mis+lPi2cHXqTyKVE97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=spAFhx8+nXp+zmgqn6QXTxIEAJQfg+OdNZF6Az9P92I=;
	b=Q0rb0G5jrWIluy3/5jsoBnCq9bzmKGqNf9oA/oJ0JulVaf2Uvwat+fGxh0e2jhy2+ktu1q0dlRremomF4bib9B9SSciT6hTY+Wm/2PhqOxgDYhnll5K8pyGV3ivBqLXC/CbsTL2i+FYApUW8uheFjwfupu4wR2WPBoNe+q54YutYvzNXYLOY6PaP84y8LoArqpq9v9I8tngojYvG+UIucZGMD48nymoYEQH1MvNJnYA1GiY9xDh3YT4V11BRd8Ep4mMAbK1ycgJ4aCNusvGRvOzzuEEwfpogeJWUJGZRauykCw+j0GBGC4oT0tsPAbE6XHpuAUAw7DR4nyj1ZwL/jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.161) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=spAFhx8+nXp+zmgqn6QXTxIEAJQfg+OdNZF6Az9P92I=;
	b=Fk4Ej6wEEUNFktGQkqpFkvRCzLJk6yeDdYt9+duOEl9NO3b0wi2f9skUNlxkv5+OanSqoWJc+u0YHxD/AWPusQcs7KB9T01yj4re3d5gBb7R9po8tVoRyt2glFgHF69MwYD1W91hEjFm2G2TqKaHENPqS1H52nAcogezfA/sgF2upE0oH7fZRJRUqd+R+XutlDf5+FDo3ClN73ynrjzsx0vQJF0PUGAn+KsKCAZEm2FugKeVLh1lavRzXmn4sMGhL/GCM8T4wFDqFsWfopvdFKPSDGMrRZH3NUK4vxZ+qfZ5xjmFP7Y1lrddCPCX9VMV1i9819MQiFQ9XL/3MAvMZg==
Received: from BN9P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::27)
	by BN9PR12MB5178.namprd12.prod.outlook.com (2603:10b6:408:11b::12)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24;
	Wed, 5 Oct 2022 05:03:56 +0000
Received: from BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
	(2603:10b6:408:10c::4) by BN9P222CA0022.outlook.office365.com
	(2603:10b6:408:10c::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32 via
	Frontend Transport; Wed, 5 Oct 2022 05:03:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.161 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
	BN8NAM11FT010.mail.protection.outlook.com (10.13.177.53) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:03:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:03:36 -0700
Received: from dev.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:03:35 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:24 -0700
Message-ID: <20221005050027.39591-16-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT010:EE_|BN9PR12MB5178:EE_
X-MS-Office365-Filtering-Correlation-Id: 27bdaf33-8ad9-45c6-8550-08daa68f0153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TP1PsmvwUIkAlkxp0zEbjTRPeacRaYyqWMF4RiIJzFUZMwv1SfHmXOlGV3ZzfGZFCZIWJVu1YZt/wR3wjwKpAzWAVDjs9H2RK5mP5ROhgfhs6ZisiXZkwxNJ84pdy8A6SUbVOEW0IjwzH8gmwUJeqbUzreTXnANXi+5zS+0YWbOpHCde/QKPkNgqT8/dkvJDa2lqprSfIVhmNKt1VoxSihKhoVr2AbtMh9lqxROX+c/G+vK0gmCL3NyCdjZTX1LdGqGCiIIUQcjK+8SQTVZvfUAlwaL7ZLojTshjnBFXJEivoM7SnCaz7Toik/yMBAT4PE9zt6NXooPCD7H/Nsqw+65C0GbOs1hnK/rZMDYgI9C/yFIlTZr8T1baiTQ2olNuqnnNrNevRNzCbNJxUp9aALalaQ1c39rtn7m7hnzBeAT2LvTxruQisea1WQ3B5Cnuy7LTj7/ub1u6/cxoOUSAo6v2AXV0a0flj6QY1g3UpoFQ9ISe83oouseiGfJ1R3PTFcH4VJX/TzNVGe+aEqz1PjZqODKc/aazovmOQ2b/TVbrMQr0ujxA8VLQMkjl8zTAH2lAJk5ILdHAbxMq1gVGkwSV5mhB3ymAo/gJ1SxezJv0ibddbdl510/D1gNB/OKqAoqAqnuDHTMgLit7AXCd1V28gzDRxcDo5aCO2OMw+h51GxBAFvnwrpYcrSLAgZpeRrfAIchlM8TIGBerhkxVknvEd9cH9hsUsUPM0kxbh4INI7cNyh/YKgtI+lImmT2dpXFxJim4hlgd3OgezxvilL5vr+BP/bDlqan0kvmw+hk=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(36860700001)(26005)(54906003)(316002)(110136005)(2906002)(7696005)(478600001)(40460700003)(82740400003)(41300700001)(4326008)(7636003)(8676002)(70206006)(70586007)(47076005)(356005)(426003)(1076003)(186003)(40480700001)(2616005)(7416002)(8936002)(16526019)(336012)(5660300002)(82310400005)(6666004)(36756003)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:03:55.6787 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27bdaf33-8ad9-45c6-8550-08daa68f0153
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.161]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT010.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5178
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 15/18] swim: use init disk helper
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
 drivers/block/swim.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/block/swim.c b/drivers/block/swim.c
index 42b4b6828690..7fa4b2766367 100644
--- a/drivers/block/swim.c
+++ b/drivers/block/swim.c
@@ -835,15 +835,12 @@ static int swim_floppy_init(struct swim_priv *swd)
 
 	for (drive = 0; drive < swd->floppy_count; drive++) {
 		swd->unit[drive].disk->flags = GENHD_FL_REMOVABLE;
-		swd->unit[drive].disk->major = FLOPPY_MAJOR;
-		swd->unit[drive].disk->first_minor = drive;
-		swd->unit[drive].disk->minors = 1;
 		sprintf(swd->unit[drive].disk->disk_name, "fd%d", drive);
-		swd->unit[drive].disk->fops = &floppy_fops;
 		swd->unit[drive].disk->flags |= GENHD_FL_NO_PART;
 		swd->unit[drive].disk->events = DISK_EVENT_MEDIA_CHANGE;
 		swd->unit[drive].disk->private_data = &swd->unit[drive];
-		set_capacity(swd->unit[drive].disk, 2880);
+		init_disk(swd->unit[drive].disk, FLOPPY_MAJOR, drive, 1, 2880,
+				&swd->unit[drive], &floopy_dops);
 		err = add_disk(swd->unit[drive].disk);
 		if (err)
 			goto exit_put_disks;
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
