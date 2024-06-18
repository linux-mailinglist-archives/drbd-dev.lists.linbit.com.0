Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F82090C1BD
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Jun 2024 04:14:12 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5D19E42010D;
	Tue, 18 Jun 2024 04:14:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1202 seconds by postgrey-1.31 at mail19;
	Tue, 18 Jun 2024 04:14:05 CEST
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
	(mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 600A142010D
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jun 2024 04:14:04 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=XAAiTyEijMTi1pqi6OQZ9E7fo/FrAMCRmGyOhMSoQ9T0szq603SqkEbmZ3abOt5/cdvPvM93TUuAk078DCHKPtZrZB+6zedhGfql7HDA8HXqQME08nP76PuxRsvJybHu+y6LVUarqtFX72aLCiZ52r2mMBS8TUSzV/2yKSLjEJKYXDyIIAbiuZulPdjNRc47TShOtLJKfJoh7/bpX81PCMJ3g5KTOcAMotLp5FrP/blYUzTtDTA9LMtFaRoU8GeML6Qkd8ROVsRsaM2DiG5Te6f2MqpmS4QpiQWbSTMSe2BO51MNIYG4aBqPDhUIQCL1AssHt34v6+mOTUs0Sdy28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=p+4N1S30rum21qkQT06ApcKDgx92UXru4uX9+/mhiOU=;
	b=VxkNS3sCVR7rNGAOGkWfAvVTZQ5YgLErIftcgFOK6exMbD6PKHWpMeapBzaV73ltwRV1MJV9JvzUEa238InZF/fmCv0Iy4nrkgof6Ov0/S+eF2QFTbaNmhATrhQtvryzcwMMlh5Af1C6eiMAPbK3mJpxS6KoEphm3iBDzsH69tuxwWkT7A9FNxRwiURexpdsAH2QOYvACdaS6Nta3tNpIAZM6AOTKNkMONdjphxoiydOqvTfTLV4PQOHNEO/w9kobZ1nyz1cpK4/ciX64t8/vtJGlUnRcXzVsBiQQC2NotEYBHrxaGVIe39AKJq8k3E6mWFUX6S7FLKGD2Q4zbmKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
	dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=p+4N1S30rum21qkQT06ApcKDgx92UXru4uX9+/mhiOU=;
	b=m1c+7rH9cmDdMCNSxBcnPUD/on6ZNGVQ1KRzDnAt/sk23sKsRIvrJ/TrLRg5TaF5oTqx0Hs39BnWhisunIvqRmuYCaEm/Rsl3nsrQb+DfgZ0UXJ+VPZox1MFV7Se6nxLAiL9OOCTmkx7TXByw5IC9xNNtBOTiVbbSt7KGJVUsAQWkN8zHy4XKuIAD4k7skHsWCOlSCGaIj3jGAkRPwCQurVpAzqjsMqo7wUAfKA9UpbffVtZVggzRAef5tm13cDTwQkacw3b7Xv2XEdfbCG1xR8B3vAT4zrxXTo5WdNAJcLWI+38SLCYUNaK5sIjD7gdxEtKNdjzo/9bADT9DMGIjA==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
	by LV3PR12MB9143.namprd12.prod.outlook.com (2603:10b6:408:19e::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31;
	Tue, 18 Jun 2024 01:41:36 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
	([fe80::57ac:82e6:1ec5:f40b]) by
	LV3PR12MB9404.namprd12.prod.outlook.com
	([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.7677.030;
	Tue, 18 Jun 2024 01:41:36 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 11/26] block: freeze the queue in queue_attr_store
Thread-Topic: [PATCH 11/26] block: freeze the queue in queue_attr_store
Thread-Index: AQHawHztZf+US5g9EkKLFc+wTLOrGbHMwFUA
Date: Tue, 18 Jun 2024 01:41:36 +0000
Message-ID: <d0d47735-ca4d-4744-bb8a-607d59c67315@nvidia.com>
References: <20240617060532.127975-1-hch@lst.de>
	<20240617060532.127975-12-hch@lst.de>
In-Reply-To: <20240617060532.127975-12-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|LV3PR12MB9143:EE_
x-ms-office365-filtering-correlation-id: 4c152403-08d1-47d7-1138-08dc8f37ca9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|376011|7416011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: =?utf-8?B?eEhxVE5BUktkU2hReldpbFpRMjdOWXlzeG5zZDROWFRHTFNOSDIzeExQV1M5?=
	=?utf-8?B?OUdrb0paT3J0K3JzelEvSk5EQWd0YnkzaXJEbVdweUdKdjBtazJoZEN0QUY2?=
	=?utf-8?B?Q3B3S0JMUGVoa2lSRXRxM3plaU0zeU1Hc3ZyNmlDcmhzeHFkdGh4bFFia2VG?=
	=?utf-8?B?dE5rbVpPTzA4RjhlaFdpUlk0M1Zoc21MaGoyM0h6NklxMzIwanIxTWM2QnF1?=
	=?utf-8?B?Yk92bHJkdmtlQmVzQ1NJN1R3TlJHK0hjZk9GVVlqaWU4VWFvV3A4WGZtVDI3?=
	=?utf-8?B?K0dKVnk3eDNtZ1FWNjRqUHEzMDBNTm5kbUlIWXBxZExXUHFIY0QyVkswQVpk?=
	=?utf-8?B?QlBvUEpQVW1lQldIQ0F3dWJ3blVDdVFCTWZ5cUdpcVBJd3pFcUlmaEpIanJn?=
	=?utf-8?B?REE1T3pFeU9GdXIvRDkvYUorUnRLbmFDTXpobVR4VXdDbzJCOUMxc2R0b3NC?=
	=?utf-8?B?aVFyTWxDV2dOaTBqYnlkeWVSQnJramoyd08xc1ZOSmVwUGxMNnMreVlLK1dI?=
	=?utf-8?B?bTZ6aGtTanhkT0VsaXEvQTJmZG40UkJKVThkdG1uL1IyR3ZlaE1BRGxjUXBr?=
	=?utf-8?B?azNHRFFQaUxpTWZJcFh5SVpDU2tab2YzbzE1UHJOOTlVSUp5OUxZUnVJQ3Fi?=
	=?utf-8?B?QnU1dVQ5SUcwTU11K1d0MWhnSXZqRFo4Mi85UWpJS1VQcTI0Z2hkbUVna2xM?=
	=?utf-8?B?eVZ2bHQxQS9UMStOOXpVbU1iUEU2cGZqRmRCZU9aOG14anBOMkRZRXRJL282?=
	=?utf-8?B?bjIyVWFaOHVRN0pMWU0yUDJhVy9GaVdEOGM5SkYyZnhWTzZwV0xtMmIxS01q?=
	=?utf-8?B?WVJIWDlvenRpYmFMUmgrME1SZ012VnZPbWpIT014eW4za0JhWjNXT212TlJq?=
	=?utf-8?B?MDI0bEZYak01Y2pPUnJnN28yeUhTZDcvb2NYYkFZck5KZmJ2dWZrSEJMaVNY?=
	=?utf-8?B?WmxlNmVRVGFheHdOMVNid0NMVkcrWWpUNk95VzZLVUVpYm5ZWGNKdE5kVTgz?=
	=?utf-8?B?YXlvdy80NTI2bnRyWFBNRCtvOCtrbEJLWlBQU2hoRm9yeHU0R2crU21vN29v?=
	=?utf-8?B?Tyt5V3BIV2ZYZHp1UXJKeHQzYVplYUM5SFZ0L0RoN3BLcHlJangyN29Jdml6?=
	=?utf-8?B?OG0vWUhzeUdTZStxLyt3NHR4aUZxODhxWXZISUp2U0JUMms5SFd2ME1IRVhh?=
	=?utf-8?B?K0UrQVZtNFE2a0VjamJ6T2lYb3BxVXZLRnQ3Mzl3dzg3ZWlwaU1CL1U1VVg4?=
	=?utf-8?B?c3IyOEcyb3RZQUJ4SWJmU1I4VFJiZldZSEJCZEhwa1dDbi9Jc3JXRVg0SjVW?=
	=?utf-8?B?dHRCT1hPdndOSmNZQUlKUVM1ODV2MkxPWjRMdDQwellWTGEwVHZSSHZhNlhL?=
	=?utf-8?B?Wm5KQmd0YjJ3akdVeTBoSDYxT21PdUR6RkFsZkxFUGVkRzlOUHhFOE95WTVj?=
	=?utf-8?B?MDJqa1FObnpSSjNHRkUyY2gyKzJoUnp3NExXclE0eDRJS21NZlZDcnFETjA1?=
	=?utf-8?B?c2svc3NzajVtdDcvUHhUT2FwRjNuWUU4SlBKT25UeW5UeStHeXI5Q3MwcEll?=
	=?utf-8?B?RnlUZnJSYlhxczVxUFpkSyszN0dWbHlYYndDOXlBNDZScytmTy9rMk9oQkhP?=
	=?utf-8?B?Tk44RUh3VmZMRktqblk0SnhWWlFHSTVXVFVtallFb0N4azhKaFRIa3UzRSt6?=
	=?utf-8?B?TklDSE5GbzFaMUxSK2lScnk0Qng0MmJhWWtzS1c2eUxlMlY4NVFOVG9oNnhB?=
	=?utf-8?B?QS9pN29EKzZDQjFzZFFCZmE4M3ZvZ3g1eTVjK01LN09hLy9DVnpwVitselA4?=
	=?utf-8?Q?yDaYv2cPpCpg0IUjKcHimjy+oHUBvt5whOaCE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:LV3PR12MB9404.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230037)(376011)(7416011)(1800799021)(366013)(38070700015);
	DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dFFUZUxPTDNtMWVpUDludzVjc1hkOENZdlRjUGZRWU4vZDlnSTlGMlpNWkZL?=
	=?utf-8?B?enVJU1MzS1FRaFNPcGdHMU1jbjRPNjZ1U0o2bXRaWjNpREFBaTFwRkZ2SXY1?=
	=?utf-8?B?M0NaTDVSaEQxYk1uQm9pWTQyc0hidmdtdysrN1A2eVp1YkFEUm4yOE9MV2wz?=
	=?utf-8?B?Y3NSNXpuWXMrN1hYeGVoaGx3YUdrczZzTUEwWml4dit3cWt5aW4xWkJLRnNH?=
	=?utf-8?B?K2ZFRXQ1SW53VEc0cC95NjVSZmZ6SnpuTzRaOEtmaUlSeVdiS0NRTS95dzJQ?=
	=?utf-8?B?VU80UmRCdjUvOUVXMVEvc09qdy9CeUNxd2k5MjZnSnVUVUd5a3haWmdQRXBH?=
	=?utf-8?B?aFJPbWZXMUphQ3MvL2ZhM3NIOWY3NnJLOTVUZHBSc21Cc2dZTWdJSlViSEVa?=
	=?utf-8?B?T3lpWDk3MjRnQjYxdUNZNUt0b2RKSlY0ZGhQcHh0M1RxZGtiOFdNTytVWjJB?=
	=?utf-8?B?S1h2UjJCeUc4S3FpZ1BkZVREQjY1aUt1MUIyRndQZFR3b1BmZHlWVzJpNVkv?=
	=?utf-8?B?a0s0ckZ5T0NXYU00eEVrTFBqRVV1L1BITEtQMW5Ld3BuY1B4RThjSnhnM0gx?=
	=?utf-8?B?NTJiSHpabU5wclBUZFFRVjJaNERodTgzT0NML0hwbyszMDZ6aXNjWXN1S3R4?=
	=?utf-8?B?QWUxTHRXdSsvcStPYnF2eTBpdkcwamdna2hIRm8rQTdTRDlpME5Cd3hjUVo1?=
	=?utf-8?B?VUQ4Z2dJdFRUc215NFhtUTBxZlVOOGwxTUhSMUw4NHg3YlU5bDVYbzZiYkRX?=
	=?utf-8?B?YXhBak1POC84NVJUc2FlWTZJalZhaitZYVhEY2o0cXlVVGU4eGNFaXpjSzhI?=
	=?utf-8?B?eHdnNDc2V2pzb2tNRlI3WWE5VjYwYWFmNTJnbWpZNmJiUkYwbWhlTFdaMXNz?=
	=?utf-8?B?TlRxSEpzd1Q2cUd4OXIyOHV3Z2RiU3lSVjQ0eEFramlPNDZLUXFjandEN1Y2?=
	=?utf-8?B?ZU5COXpGSFdKeUxJRWVBaFZVcnZWOWNNalZUak10OC92UDJuOVdVVUxoaXJJ?=
	=?utf-8?B?amNxaUQ4bXRXTWNuTDNNSjNPRk9meS9SMEN6ZW1GbGowT3Vka1BFM240cUhE?=
	=?utf-8?B?SjF0MytHTGcra0hOK21jbGpkWEV0UDdOa1BxMGpWTVFVNVhLVXNQb2tTWnRC?=
	=?utf-8?B?dEttNlFuNVlhWnZhSk1wdlFMRUVramsrMGlLS3A2dGJpZDZCTXh1Vk5tUTYy?=
	=?utf-8?B?VkJwai9MaGRrVG0rL2hwbEtPeHJTNzhGYWUvTFhMYm4rbDR6YXVDU3Q1RDN3?=
	=?utf-8?B?aUw1WHhQSEluclNtVE01eXVrNkszZW1Od2cyNlRIUGJKL1RNeGxYUk1adzNX?=
	=?utf-8?B?bDZxUVpEQytVTi9HbWVnQlZpWHJCeWZtR1d3MG1JSWxRSlp3ZUhXRVFRMHNj?=
	=?utf-8?B?RnN6V2RkVUFXWkMwZHFxWXkrQ0ZwVFdpS2dLS0pqRlRRNzlJTGdqWjYyZktq?=
	=?utf-8?B?ZFJiT0FBY3FNcDVRVDNCV3lUNTdvM0ptclQrOWxIWHlyaXBNTTdMNTdwaW45?=
	=?utf-8?B?RUR1dkpWdDFGd3I5aE9Sam1IRW1kYUpOU1dzbjJRWnpUaEJBMlM4ZmJFeHlM?=
	=?utf-8?B?RzY2UzMzSkFTSURpMmMvVTVJZ3pBanJvT2xqL2ppUlhSdStLQkRkRFdxTys5?=
	=?utf-8?B?OVdlemRsNlovVUhmam1ZWmtYVEVDOW16bTBHeVZBWjMvdFErcWxkYUVBQnY4?=
	=?utf-8?B?blJMaDJOT09kNWxjZDF4UVd0cnBsbytONERubWVORGxUSElzNkdPVkt5RURv?=
	=?utf-8?B?b0VhWFNXNmR0WE9JT1BNM2VxbzZEekV1d2NTMSsxSmhoQklnV2JTZnVZMFRY?=
	=?utf-8?B?em9yWUJKeXRsNXhuRE5WVkc0TWh6SEFmSHlQRkM5Z21jY2ZxUTFpNXBFR1Z4?=
	=?utf-8?B?b3pBL2U2S2lZcDFib1BQTzk5ME1wa3RnR3pwSjdjVTBCcWV1eFliMnFBdm5s?=
	=?utf-8?B?Vjk1RW8yUVF1dmFNL0ZHaDBtWkprTHRoT1k1clNqalc0cEFpeW5kU2RoaG11?=
	=?utf-8?B?TkF5YUI3TTlJK2xwTUJneU4zdHVxdFY4dyt5VjZXaDUxWnNuMStLQ253Yi8x?=
	=?utf-8?B?UUQzc1ZOemZxanFuYXg2cGhmSHQ0S3FwTlNXbVFGZk9XT0JkbC8rbUU1Q3ls?=
	=?utf-8?B?ZDl1cHM1d2FMV2Q3NmNpY3NycW85ZFRwOEZ2Q1lTblZWbERkWnNyRC9GWEVt?=
	=?utf-8?Q?jyBU2G9AYkAY6ICQoFyf7aMkk3wiXDwKEcgM4OEMKwMP?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0E393A774C60C469B0101BC1E571406@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c152403-08d1-47d7-1138-08dc8f37ca9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 01:41:36.4521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRLy+uAERJ1P0hWsb9WWiPJU0Nl7a1j1bdEqUClZSeVr7v3i2pq/EX+cPq+Qu3jBm86xyl8mWbPMkGpOs1cK5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9143
Cc: Lars@linbit.com,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"Michael  S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Song Liu <song@kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Alasdair Kergon <agk@redhat.com>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>,
	"dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
	"linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
	Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Hannes Reinecke <hare@suse.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	Ming Lei <ming.lei@redhat.com>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"Martin K.  Petersen" <martin.petersen@oracle.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
	Ellenberg <lars.ellenberg@linbit.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

T24gNi8xNi8yNCAyMzowNCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IHF1ZXVlX2F0dHJf
c3RvcmUgdXBkYXRlcyBhdHRyaWJ1dGVzIHVzZWQgdG8gY29udHJvbCBnZW5lcmF0aW5nIEkvTywg
YW5kDQo+IGNhbiBjYXVzZSBtYWxmb3JtZWQgYmlvcyBpZiBjaGFuZ2VkIHdpdGggSS9PIGluIGZs
aWdodC4gIEZyZWV6ZSB0aGUgcXVldWUNCj4gaW4gY29tbW9uIGNvZGUgaW5zdGVhZCBvZiBhZGRp
bmcgaXQgdG8gYWxtb3N0IGV2ZXJ5IGF0dHJpYnV0ZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWc8aGNoQGxzdC5kZT4NCj4gUmV2aWV3ZWQtYnk6IEJhcnQgVmFuIEFzc2No
ZTxidmFuYXNzY2hlQGFjbS5vcmc+DQo+IFJldmlld2VkLWJ5OiBEYW1pZW4gTGUgTW9hbDxkbGVt
b2FsQGtlcm5lbC5vcmc+DQo+IFJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2U8aGFyZUBzdXNl
LmRlPg0KDQpMb29rcyBnb29kLg0KDQpSZXZpZXdlZC1ieTogQ2hhaXRhbnlhIEt1bGthcm5pIDxr
Y2hAbnZpZGlhLmNvbT4NCg0KLWNrDQoNCg0K
