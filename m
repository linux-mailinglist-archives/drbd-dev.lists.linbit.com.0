Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BAA5F4FEB
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:57 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C45504252FD;
	Wed,  5 Oct 2022 08:50:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 992 seconds by postgrey-1.31 at mail19;
	Wed, 05 Oct 2022 07:18:54 CEST
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam04on2058.outbound.protection.outlook.com [40.107.101.58])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7E441420962
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:18:54 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=TF/T8JmGQwesIZUX8Y88nLiA8rGWLGfMxDCdtFqt/qJGoXVjAGf2mEtFctd7AWL0adxpZg2FYdXVyzvQ9AXKbXLQUzcK94a40yE40lRbdFlFTpDMgSm/HdayUhaYwnyKCRptnPNQj8/16h9umyuo51DZ/uSC7H8SzAgKO/ubFw3zGPhATd+7B7CqBXnWu8dK8GrcdM1XrJ345aOb5rVYdHxyYQVCiS7rlfhftzPy5G/N3VMbvpBNATcEtsNj41tAOpfPQpdpqlY2+5a0dKlPpyefwXsGDi+v/Q69mPzC//T1R8LoHt7QaYq/ObKsltPxit688p1vAV5+1EwAJ98cKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=U2jAh01XV3PtRF2YUGgwcEnvTdTLaLPbUTOFMh8xL9I=;
	b=QBJcxCb8qDutAHPI1LkNKYPIMzbxW24ELoVPNLjmVr6dlxhCRYaPcoC/UtY3uDrLggxfnxF1nBziI0dkb9E3HO9pdaTxhUdeqqy78sBTlu4KpP839T5x+XPd8m/BH2C+Sg1YDduSajD6WHScf9fC0hnh37WFWc1JXFXITfVqB3RVUGkUfTpr2KysjLDokXGBPFUcpM4dPmbTH8EP5qVoBGVtWpvjzRp8KFDznHY8jKWif+22bwTqpR97YCh6AbLXyEHQ5tIBzHmcWuiCJdJEcofr9xZq0BkVL2WGlX3s+HRxAnFy7Kol1EsT/e+XzE+V5fJt20BoaYB7rjfEHT3UFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.160) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=U2jAh01XV3PtRF2YUGgwcEnvTdTLaLPbUTOFMh8xL9I=;
	b=CdYwOQVo02T0OQyUkg/eI5IwWIsEQMOxx3RsS3nrZcazD+fqIon/6F7MdjkXY+qmuEiT3Xsl5fgPZhA1lmhuSLu52pBpfya6jTygzZ1lU4UmsuYTxmCC1xv4KJWSh/0R9I4kqjAn7ZTKIEtve5Uxkx/D4wCt9WhgvNsDVH+94UenwQhQ1OnWPcQMPJSTmIdD/qrCItP2sasR+B+eJHEVfD9lTqdbwHzAKxEC8DKI+eokTFcf4dN+dE2724stgwOJuCNZjmsAnukQTe8aJFqWIk1Fda9Jd6kcvbCZcGlyJXvTrukENgsg9uHalBmtE6AzFbBWovLtT6f76mk/2jKCmw==
Received: from MW4PR04CA0292.namprd04.prod.outlook.com (2603:10b6:303:89::27)
	by CO6PR12MB5442.namprd12.prod.outlook.com (2603:10b6:5:35b::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24;
	Wed, 5 Oct 2022 05:02:48 +0000
Received: from CO1NAM11FT089.eop-nam11.prod.protection.outlook.com
	(2603:10b6:303:89:cafe::f1) by MW4PR04CA0292.outlook.office365.com
	(2603:10b6:303:89::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.29 via
	Frontend Transport; Wed, 5 Oct 2022 05:02:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.160 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
	CO1NAM11FT089.mail.protection.outlook.com (10.13.175.179) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:02:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:02:36 -0700
Received: from dev.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:02:34 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:19 -0700
Message-ID: <20221005050027.39591-11-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT089:EE_|CO6PR12MB5442:EE_
X-MS-Office365-Filtering-Correlation-Id: 586daa79-3566-4a94-4f0e-08daa68ed8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XXg5ewE4NWTTQOn/ILlBdYZL5NmhkgZ6oOt1VNz1G8E59UDACFlQ90nuphpLA6hZSWSY9jneBr+2SCsEi2mNcuPT2rDt/DOe7KZ/iR0Jaa+giqL31STYnkF1XNnj5v+s1yYlmX2p0r2ETS237Us15o4naUU2/S6XQrDagQCcJZI6931MA+BuZjgCQ6/nqYkA54rpCprub5Kxkd49h7W7367tVMO0VoK6dFYw5KhX5rtuPKpP/oGJ9oCWp4Ur7F1DVC2YDvdYY40juU7SzqN66XUp1InB7w3pZBi/ZS72J08XRsmDBVSG2+jcqLVRFwUCaMZHJbN9DXEpiFUo+ojVlCFThpTI8YLOxJTWoEDBsIJXpAlOspFrs7Fco+8FwWoFmcPg2C63JQF9W8mnPO3QW5QRJErs4Dst20UMuNCbGJwcMyc22uuPxVPQFdVB4LTqba0ZwCPOjDIav6LwSnsvXTIeSajFUfL7bc6uuOdHPKxPZhzwTjOpaRAzu9STkpInPsvyoDuFDblR3ZuatlqaJ/CsfCucuq8YyEdSreU9fjNKWHZYYIINa5sfe1GyUnjC2B0aFB/w8lFT9PFoaK88LAmOVqP7fqQvNY7feRWds/pXRYvycvwzudEOyJRmGHKtsjsMXVQ8PaOIcN/5VyUPtdJ/MHdsdxou06mmWRrYe1/luwXqzMhIeiRjUTMDAKC2mvUZgpEfGQNV33d2M4WZXIj+sgddTU+YDgAJdiD2O0TMmxDxMEzEkyWojMs1GGdiL1Aa9puly5Zi4+nq12An2P7j1iW6LxQr80kOC3zrGlM=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199015)(36840700001)(40470700004)(46966006)(70206006)(6666004)(8676002)(26005)(16526019)(336012)(426003)(70586007)(316002)(7696005)(47076005)(4326008)(54906003)(36756003)(2616005)(8936002)(1076003)(186003)(2906002)(5660300002)(356005)(7636003)(7416002)(82740400003)(40460700003)(41300700001)(36860700001)(40480700001)(83380400001)(82310400005)(478600001)(110136005)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:02:47.8612 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 586daa79-3566-4a94-4f0e-08daa68ed8d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.160]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5442
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 10/18] pcd: use init disk helper
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
 drivers/block/paride/pcd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
index a5ab40784119..4474fd28a6de 100644
--- a/drivers/block/paride/pcd.c
+++ b/drivers/block/paride/pcd.c
@@ -923,15 +923,12 @@ static int pcd_init_unit(struct pcd_unit *cd, bool autoprobe, int port,
 	cd->info.speed = 0;
 	cd->info.capacity = 1;
 	cd->info.mask = 0;
-	disk->major = major;
-	disk->first_minor = unit;
-	disk->minors = 1;
 	strcpy(disk->disk_name, cd->name);	/* umm... */
-	disk->fops = &pcd_bdops;
 	disk->flags |= GENHD_FL_NO_PART;
 	disk->events = DISK_EVENT_MEDIA_CHANGE;
 	disk->event_flags = DISK_EVENT_FLAG_BLOCK_ON_EXCL_WRITE;
 
+	init_disk(disk, major, unit, 1, 0, NULL, &pcd_bdops);
 	if (!pi_init(cd->pi, autoprobe, port, mode, unit, protocol, delay,
 			pcd_buffer, PI_PCD, verbose, cd->name)) {
 		ret = -ENODEV;
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
