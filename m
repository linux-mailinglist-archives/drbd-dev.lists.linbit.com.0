Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ADE5F4FE5
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 08:50:52 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BFA7A4252B9;
	Wed,  5 Oct 2022 08:50:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 791 seconds by postgrey-1.31 at mail19;
	Wed, 05 Oct 2022 07:17:38 CEST
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 09A91420671
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 07:17:36 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=NdCvXFhwBwPUruZ1FeBVgVQfJ1bWLZ7Olp4OSEWp7yHSnUS9OrQwUoPy9XWRAxT2K7IZ1lXZyllXCoJbjTHv9WWvHBehDnTsn7JohiMP4YFMXWf6aVVh3h4vbyM3I/IMLfE/3OMXQ6MpJx3zWS4V0vzvZf+71JfzKdAanOs1O1MpgHfp3YDo2Ce5cFXjB+HzB/8IRPgD9dKXqAGicEltImMytMf1Bbn+790Yjf7ReWaEEeJSkkLA8aOkSiOV8a8hgC9YfU2S1CXAc5ZNxm4t1B1iIGbFbCtv36MC1sXWrudvtDIoNGYmte6jPqpF/bdrrTV6+HfAQbF2bubEqBjgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=NLbJqCQUdN0O3ArWCvxCEMQtaJqsn/oqqbAVsX4p5pQ=;
	b=C00X05327iufzFi1oFvAou4naqSKQ0u88aTeMwI7NPKwuyTzewO+YreHD/c1eS1W7TDRDxAVm8qt7uxKJfJ6lAMuvq5ZrZHo35K0pcm1bByn3JlRHRxY+PwbjHXA44DKa0UEohuSfBvOwu7yWKjhLGs11yiE3VOGpy0u/kxEBTQJY6CN5bd2I3G5+HjH9HqhEFLd2EqyHDcNQkawnzs/QQNnQFls83xiEOn74ofxtcTLNaPPpkauzCZE/lZKsxbQqACo3sPd3yqLukg1rACXTSvoORRBY7Y7x9p9/SxqiJyD67vVS6jr5MkbwvMwfxAw62+lHGSV+w7dCriFyMZfVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	216.228.117.160) smtp.rcpttodomain=linux-m68k.org
	smtp.mailfrom=nvidia.com; 
	dmarc=pass (p=reject sp=reject pct=100) action=none
	header.from=nvidia.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=NLbJqCQUdN0O3ArWCvxCEMQtaJqsn/oqqbAVsX4p5pQ=;
	b=lubrSpBg8JsSB8jZjg1v5IQnqsU/Vzu3lmU65xT+UdByYpJC5LFPVyyP1NTLc4r+GBt/ZsKsc4JXyMgpryOIAo7mTcCpxQglOtmlk/G/QAAAfolvF+RzFkuiEifxVZ56FWSlXgeILmelMx4a9zJkdEJuwAOgf4k1lCRh+umR3vSRkDk2YtmK4Bn2fegrG9LKi5WwpGUve8ATP6mfDcX4JN9lXvBjePTMNBhTDw4ZCJ/LuxkXAHpwC2dE9AfM8ajFP1ZTJ8owPjma78ldziq7CCLqcqrSxHdXPHCXIuPL3LgW/awBso17/AP+Vo1JlLM6dNFh3F7pIZTk63+wBLSitQ==
Received: from MW4PR03CA0003.namprd03.prod.outlook.com (2603:10b6:303:8f::8)
	by CH2PR12MB4246.namprd12.prod.outlook.com (2603:10b6:610:a9::18) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24;
	Wed, 5 Oct 2022 05:02:36 +0000
Received: from CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
	(2603:10b6:303:8f:cafe::6c) by MW4PR03CA0003.outlook.office365.com
	(2603:10b6:303:8f::8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24 via
	Frontend Transport; Wed, 5 Oct 2022 05:02:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
	smtp.mailfrom=nvidia.com;
	dkim=none (message not signed)
	header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
	216.228.117.160 as permitted sender) receiver=protection.outlook.com;
	client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
	CO1NAM11FT107.mail.protection.outlook.com (10.13.175.97) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.5709.10 via Frontend Transport; Wed, 5 Oct 2022 05:02:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
	(10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26;
	Tue, 4 Oct 2022 22:02:23 -0700
Received: from dev.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
	(10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29;
	Tue, 4 Oct 2022 22:02:22 -0700
From: Chaitanya Kulkarni <kch@nvidia.com>
To: <ogeert@linux-m68k.org>, <linux-block@vger.kernel.org>,
	<linux-m68k@lists.linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<drbd-dev@lists.linbit.com>, <nbd@other.debian.org>,
	<linux-mtd@lists.infradead.org>
Date: Tue, 4 Oct 2022 22:00:18 -0700
Message-ID: <20221005050027.39591-10-kch@nvidia.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20221005050027.39591-1-kch@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
MIME-Version: 1.0
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
	rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT107:EE_|CH2PR12MB4246:EE_
X-MS-Office365-Filtering-Correlation-Id: 01b1848f-a9ad-48c4-ae06-08daa68ed176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2tnV1e9Ex/BhoGXm5h/c69xf2Uwfo1eUMAelCyvXPD4OGaeGFdoBtIQCcHyIhRy1kGD7GQdsT5aUQ63IVeQEnzPlurWMZOOr55+7Ps5yazUaQQoy/dnjyQ1YZYSMREl/Uc5R/v17y+ujs3IkaMkoh/csosIIJLLIobRLPDihRwyDbUElH5V8BOKVxXrGtY3fFqnZPGV9TYVPJCeBGd6OvPUbwkfbYJ+vBmyKfRkZ4njW3fNFDdlRHGJUq2ogRTNyMDSlFrIrwKpeewShaINc4FVpTeIhW8f58BTa6QCRNMVdgx6k1krpV4hne3s95t9L+Y6Vf+1OKO+zlwM5/XKvdYwu8eTz334t+BKdHuKMaFcGcM1AWbtybnmVb+F7tZZ1OP2PtzkGBwfT4AQ5NIHZQkcYsT2h7km9PM2W24pr/2XlDneHjJfQmeDcfFWMhPZifyAS0jnM1Wrx2AVSr3vPVXCCg5N7LAEX3tozzA/2PyAJVZHQY0bv5qT/3nuR/UMMj3RupkCVidq5f3VBoiuM02iSAkZjMQiwx6NG0S6lOjXolj8BENQWZaaXEs1Y+9A5xQA2ajzY5nEgZfRstJSqjlKXdasR04xELAEqhvi08FgyWg2wa5/QiQXed77oy8k7UTD1KRKlpCVT7mDUTdl+3b/zFzKZ7L0fJfi29VwXPyeQ1eQi5SFUer/k2z2NEa+OpP6A34NI3SWeqzemUqBurrSD6ByMyRtASZYr3FSJr1QSITO3VXht/ResdLeOiqJ9IceVAIedzsL3eRIlzgzk/cGP9u8wPh+tsw32GxWCWVo=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
	SFS:(13230022)(4636009)(396003)(346002)(39860400002)(376002)(136003)(451199015)(46966006)(36840700001)(40470700004)(40480700001)(36860700001)(478600001)(110136005)(54906003)(316002)(8936002)(7636003)(5660300002)(70586007)(70206006)(186003)(82740400003)(356005)(26005)(36756003)(83380400001)(7416002)(8676002)(82310400005)(41300700001)(1076003)(2616005)(7696005)(2906002)(336012)(6666004)(4326008)(47076005)(16526019)(426003)(40460700003)(2101003);
	DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2022 05:02:35.5191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01b1848f-a9ad-48c4-ae06-08daa68ed176
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	Ip=[216.228.117.160]; Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4246
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:50:41 +0200
Cc: axboe@kernel.dk, vincent.fu@samsung.com, ming.lei@redhat.com,
	kch@nvidia.com, vigneshr@ti.com, richard@nod.at,
	damien.lemoal@opensource.wdc.com, philipp.reisner@linbit.com,
	efremov@linux.com, josef@toxicpanda.com, mcgrof@kernel.org,
	haris.iqbal@ionos.com, hare@suse.de, miquel.raynal@bootlin.com,
	shinichiro.kawasaki@wdc.com, lars.ellenberg@linbit.com,
	johannes.thumshirn@wdc.com, jinpu.wang@ionos.com,
	tim@cyberelk.net, bvanassche@acm.org
Subject: [Drbd-dev] [RFC PATCH 09/18] nbd: use init disk helper
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
 drivers/block/nbd.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 2a2a1d996a57..b4f2d7e1be89 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -1816,12 +1816,9 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
 	 */
 	refcount_set(&nbd->refs, 0);
 	INIT_LIST_HEAD(&nbd->list);
-	disk->major = NBD_MAJOR;
-	disk->first_minor = index << part_shift;
-	disk->minors = 1 << part_shift;
-	disk->fops = &nbd_fops;
-	disk->private_data = nbd;
 	sprintf(disk->disk_name, "nbd%d", index);
+	init_disk(disk, NBD_MAJOR, index << part_shift, 1 << part_shift, 0,
+			nbd, &nbd_fops);
 	err = add_disk(disk);
 	if (err)
 		goto out_free_work;
-- 
2.29.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
