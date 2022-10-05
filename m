Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 135005F4FDD
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:44 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 67CD5420671;
	Wed,  5 Oct 2022 08:50:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 814 seconds by postgrey-1.31 at mail19;
	Wed, 05 Oct 2022 07:15:21 CEST
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F00D84201A5
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:15:21 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=JBlB8v8MvB2OLvCJFck/ubtBzNA6/0qFSv4xa5ClYvnGm+papciHxd5X8UHVjzbzPCy5EXP5j9WM8KZ0KsIgA9CzkbTOFrdchDmRXqr8EPzSxNVFPWiy8nWPx4uuaRmUnbw9TuEBAa6mkqZYtVa/eCCzfjuECHuE8ZOT03vgF36iyJW27ghhO/PQkapiBa3giMmXpAEj6eYBOEbBLz36iYXVaG4SCSWaeB3/Vy25hj2JXjmq7T7SQqXDJdv/JQz9Swz+61cY+EoyOpHcpQHRUmVFROMT6m7vvrSKh7rzNjA+2dQ0ratKwjpojKFMh1fJD8MWb3h51PhjLGcGmTlyUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=oWZ4g3Nzks+DPTWYEhUVlBTxMG/yhcQVZgaKGwSjVSU=;
	b=ita31/RY7VUxXtLCNQjBHO6RFAV3YhzDi6p3OL3hZrgvj3CKaapxqfDd4qovNCU2c0xQLucRFRPIUkHIjBWWER/HmuxJfxQifM7T7A2g2nAwX+QgvDpeR/2g2EH/9mAtHGBoKiz+pCl1ZbaAqboqNbQRq+a+GcGfxJtHIxWJDWDT9w041Vjn+lylHvz3Y0RvRI9kVJhY6Lu6OuVYfm+DWkdNIO7teQ0WiJuALGG98XrxmqtMy1YL3Lb+vbX1J9ygRq/rF0WyTs2KNGugECtTbnKNZDcpItSK4lBtvHQF0vV9zp/h0wMsqP8ATwlZoCLJuWICV8xlZJXQg7jJvKICZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.160) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=oWZ4g3Nzks+DPTWYEhUVlBTxMG/yhcQVZgaKGwSjVSU=;
	b=qJ0UABMCrjBdzxFxWl5oQ1vZugaeuDXk7NHC5riWblK5lUeqxkM9OQlLf95c5YKyQxO3PNrBYMDZYK4Z3sGxi56FMqb+pQ2HGjJXHL7sueTaT44HI/oYMCoP1v0Nh9v3d8gDSfl1VsF4v28bAXtpodbjuh91kqHVVxeCbKQ3gN2N5pZIFU2nrp6mS17GjX2bAaCcVybPSkHqMVVN4RO0Jt6bdIh/SEOPTHPVhxdoYDfLKGAOJiEnYuWDimW4gxoARsdWh5nS4HKcWBcfemauUfHtbWYdLmvYmP/FygCZssl9iogwkCFVgvqqgrTWPPP2S58fErlYRDQ1gL55HWKgLA==
Received: from MW2PR16CA0028.namprd16.prod.outlook.com (2603:10b6:907::41) by
	MN0PR12MB5714.namprd12.prod.outlook.com (2603:10b6:208:371::7) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5676.24; Wed, 5 Oct 2022 05:00:48 +0000
Received: from CO1NAM11FT095.eop-nam11.prod.protection.outlook.com
	(2603:10b6:907:0:cafe::38) by MW2PR16CA0028.outlook.office365.com
	(2603:10b6:907::41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via
	Frontend Transport; Wed, 5 Oct 2022 05:00:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.160 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
	CO1NAM11FT095.mail.protection.outlook.com (10.13.174.179) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:00:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:00:37 -0700
Received: from dev.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:00:36 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:09 -0700
Message-ID: <20221005050027.39591-1-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT095:EE_|MN0PR12MB5714:EE_
X-MS-Office365-Filtering-Correlation-Id: 99d23086-9198-4ac6-46ef-08daa68e9144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5s7pu54P8aV1skv3l4/6V409OMbS9JLn3hoDy/ter+2h7fkAO875SMGgCmDOrXxLihxCHnE2nN6vPPq6NuKwz5+YPAuk9jCyKWHuhKpetUggABEsV8wZJEuLzYy1g0CMTD9EZPbsW4bfT34pPPMFag+eVLwSOUVow5Go/P0AgjqP6sxBF8RmrZ/jrdU30op3m7c6Dy+AMVmusJ2ZGSKRA5RtuRd2jYmzjGKE3euhSjwQ+dlxnuFJ2TP67es0yzvK8gxxBvJT7KTxmpxk1C4J8Ja95nvNJVgp6vLTbFC0Y+2MJ61/r6FSvIgVJI0x5+ZoLf0shRd0CpP0gM0VYqY29k9pDnE7krCw1jog7/jKsVZuaQO0ei5OKr5dcvsiJLd6ylrt0J3hNRjFEYnCF14YjxUFxPovn8bVBSGoF+MxqVJZuVO2m3CG6qYa3b8CZMLPWwLVsYEv1fYUz+GTJJmH0dZ1iehM7vi9AsKzK+9zqmJEhhGPgC0N+tREcg1ODWlpvIQZDN+fhNlOggSQ59A55F5gUOVLELxjQ1yOC+pxOkWiSxaSP+HcApl9GfUf4cQfrUNMAyTZYXX0uEUoV12YLY6BnbIrPZA3UmhGGz1Ex5hYhTyai941GUEayT4016piq9Q6RVYVM/ZJgbyN7fGu3q40EpJ5iPwx5ChBwpInWEAFcX5fgB/HA5CouI5nA8FuESlxkqHQC0JWHMICZp6+aPGNYfPWD424p89DDjaj/Ix0/eml0/v1szP7b8LbtplLfwcsSARWVc0cwgtyy5FufHle8Rzy8q/V+sPtHciXDz8=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(110136005)(4326008)(8676002)(356005)(41300700001)(40480700001)(426003)(36860700001)(5660300002)(478600001)(7416002)(47076005)(82310400005)(36756003)(70206006)(54906003)(70586007)(336012)(2906002)(2616005)(26005)(83380400001)(16526019)(7696005)(8936002)(1076003)(186003)(316002)(6666004)(7636003)(40460700003)(82740400003)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:00:47.8146 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99d23086-9198-4ac6-46ef-08daa68e9144
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.160]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5714
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 00/18] block: add and use init disk helper
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

Hi,

Add and use the helper to initialize the common fields of struct gendisk
such as major, first_minor, minors, disk_name, private_data, and ops.
This initialization is spread all over the block drivers. This avoids
code repetation of inialization code of gendisk in current block drivers
and any future ones.

-ck

Chaitanya Kulkarni (18):
  block: add and use init disk helper
  nfblock: use init disk helper
  amiflop: use init disk helper
  brd: use init disk helper
  drbd: use init disk helper
  floppy: use init disk helper
  loop: use init disk helper
  n64cart: use init disk helper
  nbd: use init disk helper
  pcd: use init disk helper
  pd: use init disk helper
  pf: use init disk helper
  pktcdvd: use init disk helper
  rnbd-clt: use init disk helper
  swim: use init disk helper
  swim3: use init disk helper
  z2ram: use init disk helper
  ubi: use init disk helper

 arch/m68k/emu/nfblock.c        |  8 ++------
 block/genhd.c                  | 13 +++++++++++++
 drivers/block/amiflop.c        |  8 ++------
 drivers/block/ataflop.c        |  8 ++------
 drivers/block/brd.c            |  9 ++-------
 drivers/block/drbd/drbd_main.c |  6 +-----
 drivers/block/floppy.c         |  8 ++------
 drivers/block/loop.c           |  7 ++-----
 drivers/block/n64cart.c        |  4 +---
 drivers/block/nbd.c            |  7 ++-----
 drivers/block/null_blk/main.c  | 12 ++++--------
 drivers/block/paride/pcd.c     |  5 +----
 drivers/block/paride/pd.c      |  8 ++------
 drivers/block/paride/pf.c      |  6 +-----
 drivers/block/pktcdvd.c        |  6 +-----
 drivers/block/rnbd/rnbd-clt.c  |  9 +++------
 drivers/block/swim.c           |  7 ++-----
 drivers/block/swim3.c          |  8 ++------
 drivers/block/z2ram.c          |  5 +----
 drivers/mtd/ubi/block.c        |  6 +-----
 include/linux/blkdev.h         |  5 +++++
 21 files changed, 52 insertions(+), 103 deletions(-)

-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
