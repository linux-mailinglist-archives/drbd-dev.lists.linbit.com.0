Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F4C11A5D0
	for <lists+drbd-dev@lfdr.de>; Wed, 11 Dec 2019 09:26:02 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8C486420385;
	Wed, 11 Dec 2019 09:26:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 959 seconds by postgrey-1.31 at mail19;
	Wed, 11 Dec 2019 09:25:58 CET
Received: from m9a0014g.houston.softwaregrp.com
	(m9a0014g.houston.softwaregrp.com [15.124.64.90])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C6E7A420120
	for <drbd-dev@lists.linbit.com>; Wed, 11 Dec 2019 09:25:58 +0100 (CET)
Received: FROM m9a0014g.houston.softwaregrp.com (15.121.0.190) BY
	m9a0014g.houston.softwaregrp.com WITH ESMTP
	FOR drbd-dev@lists.linbit.com; Wed, 11 Dec 2019 08:25:16 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
	M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Wed, 11 Dec 2019 08:06:24 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (15.124.8.12) by
	M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10 via Frontend Transport; Wed, 11 Dec 2019 08:06:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Q3DF88wy48cBkAyE0lsS7ctTZP0fkdAx1wXukrIeosnHmeK3FkzfnpZ7bITiyxS2lDmilNloQJDQ4rJtyvY7KbXsroy62kRNZK/QsuWuACaIVzWO2Tf+9cfQqkRrsBAaeAXrYFgHjKdeJ3cDVkaqsn/m0GnyHUYhz2p6UNj1VSAaECZxS7hOfCPCshxMVdHWqY/pdtFScWQ2Zqn3AtBTmVpllqSap4UhuZNXMXgEm8GHxuF6LwfKQ3p8HNZ2pWl26bezRwH9eQG2vmdgqO+z7w8mngE8GuqqxeHLpvw/CIWPeStoQR/meapCLFXjwBQ8o1FIsfFSj7wHLvDamEsuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0UkyRqwxHRiHMeBXk8HvdXA9nWp7Hb4fFRz4SDWnorw=;
	b=NX8q5ZWBDwTKVzH/+dnIHhjAGAADpxC2erYW52xMm1YnS9a1VvaGjq384R5GbD6tSnNQCopcGK8CJNEjr3KK1Ez/IWsJenMeKGShJv9Fa0Nt0J9xiAayegZImuwiWkhelgR7FLLMJaWQjg3FBBZLhyraYnMjfkIpWGnbN5B2ECym2QMXO7q9F+xpQt5nEtr6JVprTV7tPCdJGWiNfXUSFTYtDBX/dsxZzI7C2Ai3F2GA1U1akAl4px+Xkw9K5hLzTsOKlZ3gPaCeHTvnwO8koYYYt6sf6lAxWdPfneZOLbyTK1epuGLFIkTn/bZOiCHu2tVR+0GNvKRX52O/zuwGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
	dkim=pass header.d=suse.com; arc=none
Received: from DM6PR18MB3370.namprd18.prod.outlook.com (10.255.174.147) by
	DM6PR18MB3274.namprd18.prod.outlook.com (10.255.173.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2516.14; Wed, 11 Dec 2019 08:06:24 +0000
Received: from DM6PR18MB3370.namprd18.prod.outlook.com
	([fe80::30cc:b3b6:50d2:6b0c]) by
	DM6PR18MB3370.namprd18.prod.outlook.com
	([fe80::30cc:b3b6:50d2:6b0c%2]) with mapi id 15.20.2516.018;
	Wed, 11 Dec 2019 08:06:23 +0000
From: Nick Wang <NWang@suse.com>
To: "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Thread-Topic: [PATCH] drbd: fix zero metadata limit by misaligned with page
	size
Thread-Index: AQHVr/nhMu8ycB5SvESZAi8Vr8L5vA==
Date: Wed, 11 Dec 2019 08:06:23 +0000
Message-ID: <20191211080601.32276-1-nwang@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0064.INDPRD01.PROD.OUTLOOK.COM
	(2603:1096:a00:e::26) To DM6PR18MB3370.namprd18.prod.outlook.com
	(2603:10b6:5:1cb::19)
authentication-results: spf=none (sender IP is ) smtp.mailfrom=NWang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.16.4
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6463f620-2eae-4636-05a5-08d77e11035e
x-ms-traffictypediagnostic: DM6PR18MB3274:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR18MB3274A374004D0692F527910AD45A0@DM6PR18MB3274.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 024847EE92
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(189003)(199004)(4326008)(1076003)(186003)(64756008)(66476007)(6506007)(8936002)(6512007)(66556008)(8676002)(6916009)(6486002)(107886003)(26005)(52116002)(2906002)(2616005)(36756003)(86362001)(5660300002)(316002)(66946007)(71200400001)(81166006)(66446008)(478600001)(81156014);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3274;
	H:DM6PR18MB3370.namprd18.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gzWGRIor1qkkMJep+gxrJg+pAy2NmPGASlN5B+cS9ilibwoV4Wuuf1mzmvBWaVvQCYjfGwiaV2Rlq4XfS6uOgHBBzDZ1suWry1otAD74uZAj1OP55ph01c2sHPlukfMLZDl4y5+W6J1lqGcCQds3oTn/mYZ9PK76KREoyR4maEbC51xHYAmeTiXOVrCtjGR+7yT0it3yPCX0nlZWWfmnfwLL7q+8WhoqmerYzSOiWTHksznUkCbxWFxoqGGpn7hKuUR+z4tKMo3llqQa3AUpXbZc3N3k3UQhGAAJwH2PTwdvrxsDfmtLDx89z/G82q5VjP0APcJ3PM+GfQ4EOMsrg9A7o0X3YH0jmcp0IvaL0h7OajKXhpEYcuVZJYOzVQHJFKlS/cr4zImKzKGNGZ10YKcW5SXnrtcgyv1gm6A9Hf8TuvkxQNSGkNLzHGfusFaj
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6463f620-2eae-4636-05a5-08d77e11035e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2019 08:06:23.8288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kifqEjRh7bzGB9tqqE1CWJgetyVX3Tf1N9nJno1a5zTh9udhrUVFKs7w0m5NHJE8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3274
X-OriginatorOrg: suse.com
Cc: Nick Wang <NWang@suse.com>
Subject: [Drbd-dev] [PATCH] drbd: fix zero metadata limit by misaligned with
	page size
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

Metadata is aligned on 4k blocks, which is ok for x86 platform.
But may cause a result of zero page with PPC64LE or ARM with
64k page size.

And calculate effective bytes directly from sector size.

Error log:
...
drbd0: Device size clipped from 2097016s to 0s due to metadata size
...

Signed-off-by: Nick Wang <nwang@suse.com>

CC: drbd-dev@lists.linbit.com

---
 drbd/drbd_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drbd/drbd_main.c b/drbd/drbd_main.c
index a7294639..336a4177 100644
--- a/drbd/drbd_main.c
+++ b/drbd/drbd_main.c
@@ -5589,8 +5589,7 @@ u64 directly_connected_nodes(struct drbd_resource *resource, enum which_state wh
 
 static sector_t bm_sect_to_max_capacity(unsigned int bm_max_peers, sector_t bm_sect)
 {
-	u64 bm_pages = bm_sect >> (PAGE_SHIFT - SECTOR_SHIFT);
-	u64 bm_bytes = bm_pages << PAGE_SHIFT;
+	u64 bm_bytes = bm_sect << SECTOR_SHIFT;
 	u64 bm_bytes_per_peer = div_u64(bm_bytes, bm_max_peers);
 	u64 bm_bits_per_peer = bm_bytes_per_peer * BITS_PER_BYTE;
 	return BM_BIT_TO_SECT(bm_bits_per_peer);
-- 
2.16.4

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
