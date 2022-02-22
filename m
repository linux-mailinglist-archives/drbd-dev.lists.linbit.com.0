Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 437BD4BFF09
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Feb 2022 17:41:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1B3C642178C;
	Tue, 22 Feb 2022 17:41:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0333F421787
	for <drbd-dev@lists.linbit.com>; Tue, 22 Feb 2022 17:41:17 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gZonWcns22x2gvLEebEDTgomQV1ZOREzQW/XCxAb/Ep7G32HDfqiKBGb/RkGbXBIo4Hp3VjkgWzB71MkW3YAMiuUojBfvlJJy1gJ32FnSYeAoxjsXB+HOfRpEffbGJUmlNE4Vl2z4MQ0CggxG6LUTPgGiyLBXZuWii7uRHqauAiUjeNH5//2bclulv8x+mTO0Rl2sg5Uyr/JkdwDxFYrTyzkO1k4jFsefFRVAOlgvRdCczaaE2ma47kvAoPZ9p7j3WOlPvTLNkNoL+3tLHfY/GLpPnRl5+UC66r4SVWfq76lQ6gKGGC+hQLYX++pawsPh+Rp2Xwun79l5wcc7DMljA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=9y2cIW1mVV6vD7SsOUa7IQKHEQx85R0p3xO7YyIM+ms=;
	b=WzlTSLyb9ciyC6IBrPhDuQQv2v5HiYz3+s1GLvkv00Ts3ziRwbolU2pOaPB7se2X9FrEWwOHd0B67Ptk/40/7iVMQNQIEykzVPksPXAvg2+RQvZDMndQJtI2lSipwABUKd0+1XW4QQ45KuKYXZYKzZ8mhK0RNHIm0dsxrplIsjdzwyeJu5RoNfuXmfvzFy6rKyGkMghsdvn9El+lV85AM7Snr9BWXit3DA2+PxcZGyrzvbwwzgRT1Pf9duDWHyRC9BBJpid04yQ8RNnnRVHbK8n+kLXP23nKMqnqoKeFXd+h6JnKLHbjA7juomKunFQ9+ZWH9+Lhyw5ByUJcDNTIsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
	dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9y2cIW1mVV6vD7SsOUa7IQKHEQx85R0p3xO7YyIM+ms=;
	b=klk77qjM9B0sUWoljOpbRO+QlHuN+kyf0FaupKf0jNn2clce/3EmypmJG+9m/XZ4ADvXZZvNWTYIkgwAPohRHrkaSjBx90oNBQBr0/SepszzTF3ZgoQ3APyiztA/V+egOQb5wcUVtdtA1jzhlBJb9/JhF7hHTgW6Nn3rY8p+rTgP/aSpjRqnO3u+KGKUu+fbwtAkgHLKsl9o1H0i7kC0iJ8zIhDgacWvEV3hniXK4ZpZU4ZUIydJTTzcMpyJfVg8xbqqWW6zgwO2BEyEq0MdsLOr6ctBP/8kY43nTGzi3bTubLgUvXn9M1Q0r3zJLr8YBPQlIihtcFNhYBmV+F/gUQ==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
	by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21;
	Tue, 22 Feb 2022 16:25:07 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::204b:bbcb:d388:64a2]) by
	MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::204b:bbcb:d388:64a2%4]) with mapi id 15.20.4995.027;
	Tue, 22 Feb 2022 16:25:07 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: remove opencoded kmap of bio_vecs
Thread-Index: AQHYKARP/4AaGcphpU2sqhal5oA3NayfwXmA
Date: Tue, 22 Feb 2022 16:25:07 +0000
Message-ID: <9f289490-f8f9-d8da-15d5-f2eaa81bd4df@nvidia.com>
References: <20220222155156.597597-1-hch@lst.de>
In-Reply-To: <20220222155156.597597-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.3.0
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8cc21d85-faa9-486c-5ce1-08d9f61fe3e0
x-ms-traffictypediagnostic: BL1PR12MB5804:EE_
x-microsoft-antispam-prvs: <BL1PR12MB580477A75875350ED4A66601A33B9@BL1PR12MB5804.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hORsHvfUz1o7EWigO+vOOfCOIiKBhPwmlT52qcQtyaQuMMlFkSAinSYvf88GiEHaY6q29edDJVTD7rccPxW+JFM5LkYIM6S8Ty+KBW7wiQwMSiB8QRlVRPxD2tA8PaxKIzWIH6F14shVMLF2RdYld1q6Njl0X9RWj6fyr/6NvoXCCgZZxuLCJHFG4s3ajHpP9weu3e0fcsRxTpa1BmBgYE97Fa4pBpZh5VkVHtfct5N2kmndnFQYyM/KWr8kqvtr+VWz3DbwDD8ENeXKxO4dFuVB312wcURdGTEecy+wQkKBOiKlu9NbzN/UEIc336NMcHMG0tYLtCd2EXMHXaz69oNIPlOpodA6OHGR/PO+sln84wzvHh0aNhTneCNvGmgD9pAtBNkh9/ERVy+vlleOgNOGY3VGepIroScwTFz4qcEEkL1PvsCP6+LPFKYHjJ1fjUYR6ON8VXNSKa4RgAcIC7S0kme6T1IolUjpPTdJeOuttSv3G14T2aPGos+odNOjhOwSDgLEZH6J+Ve26plzGpOltzmSieR1A3sMk2yzIyTa0kMu+j++mBzlfEvkHliLgT82qlNnv2xARJU49sGhizRqZ6hsXriXuzgVY59+9l8dwMuMFY6XV0tsoksNqWurBWywx1srWD+cj9e9nNAdu8alPpLO0V2ov1gFURqAQYFwSmU9/aimcy28wgeQHQGnB7BfwK0gu96AWHQ0N2py6uhxrZQS42JdA2vnWep1sr/QLodou0ROqUGo2ILRSMbxewPPoZU6U8qsGAc/mUTiFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(508600001)(31686004)(6486002)(122000001)(110136005)(4326008)(8676002)(64756008)(91956017)(66556008)(66446008)(76116006)(66946007)(66476007)(38100700002)(5660300002)(6512007)(6506007)(54906003)(316002)(53546011)(86362001)(186003)(36756003)(2616005)(71200400001)(7416002)(558084003)(38070700005)(2906002)(8936002)(31696002)(45980500001)(43740500002);
	DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QW1SUjJiMnFjQ3IrOG1zbU96QnRwaGE5QVhFTkRmTlpUZFVJdXhwcFc2aFNW?=
	=?utf-8?B?WFJyRGEyYklNcFNvL1RRSEtCcUhiWVZ5N21SNC8yRHZLOHhyWWxlejZMcENJ?=
	=?utf-8?B?bjVFTkZtT2hjVnA3QVU5allGVWt2YzRTbHZmSGhNWmFaU3A2U2FJSjMwMlZS?=
	=?utf-8?B?dlJkenNkUzR3anFrbnF1aEthM0dHaDVRNlVXeWI0VU1pNnJ4dUtYUERKdG9w?=
	=?utf-8?B?U1p6a0tlclB2cUxtWUIrNER4ZHRsNHBMUUV5Tmc3M2RGT1U4K2ZVdDhlZk5S?=
	=?utf-8?B?aUk3YkdMeFI2VXAyRndUaGtnZkNIcDVvYjJ4RGF2cGdqeVdPMzdUc0xsVUZa?=
	=?utf-8?B?d1M4a2JUaDJmMGVaVW9UcENnbVNZbnc2TWlCNmZzNm1SeVlwcWZBbnNBNTJQ?=
	=?utf-8?B?ckpSaW5FQ1hOcno2V2lJU3pUWkw2aXpFa2lkVFNRTHkwVmxNQzZqM2d4VmlJ?=
	=?utf-8?B?bjl0SE90S3IzdWdubGVkQjFPMFBLbm9IWTMzdVgzbGZsU3VIazFlcnVsZ0Fa?=
	=?utf-8?B?bXN2dWJyMFRoaTVxaGl5Ly9KYm5WanlDTFVFRWZZU1hYWTRTV3hxejZhcFl2?=
	=?utf-8?B?VnJkQ2hGRWRCUkpXdUZ1b1NISWtYWC8wdkFmWGZXRjhuQ1FITTAzK1ZPVWdr?=
	=?utf-8?B?SldwbndvRTk5M2V0M05WSVd3T3JoRzdhNXZvMWZHam12TDVrejJLdGhlZC9o?=
	=?utf-8?B?SEZHSEJDMDY0R0lwOGI0cCttY244TFU5WDA3M0FNeGwzMTFiWStPTWVmYWR6?=
	=?utf-8?B?Z1FrNDdNWE9DclNad2lOR3ZoSkFiOW42bmRtL2hoRTFST1FCL0F3Z0prRFRu?=
	=?utf-8?B?K3BUMHkyMHIrNmFSSGtqRE1Kc205UHN0MzRJWE8zbGFPb2Yzam1La1ptZXYv?=
	=?utf-8?B?eDc0WGpVakN0NlpEOUtObWZCNEFEY3FqMVdjc1pCNkdRMFJYMXhDTDJydjB1?=
	=?utf-8?B?NGNNNWNsc1U4WGdEeG1yMEJ0blhCc3ZscWdkOFQzWFYwc294T1E4M21tQzVV?=
	=?utf-8?B?clVJc2Q1THY0NXlOeDhhSmFwZkF3MFVyb1htMzlKcVBnVS9RVStGL0hlNDUr?=
	=?utf-8?B?Q2lxV3VOMGdSblRJSWpnZWNQbWdPZXN1VGs1bTNEdjBDOG1oU0o5RndIbGd4?=
	=?utf-8?B?R2FwNkdIWG44VzBZOGxhTzdIYi9LdTRHV3hZMGFFWTJEbTN4U05PMDEvdWtj?=
	=?utf-8?B?TzFiS3pjU2VxdVpKcFNSSnh6YjdickdlMlJTZ1F0K2FnWFVWZWJNaVhDSWtz?=
	=?utf-8?B?R3F3WlZSWHdjeStqL21kWVFKQ0hPTmgxN2orRi9HV1IweWNFV3MrSW84Uk5y?=
	=?utf-8?B?a0ZqZ3BWbTV4T3EyQzNPK3V5RUNpSjJBVXVNTlFQZklocWJicDY2QlpQTEVk?=
	=?utf-8?B?V2FLb1FaczdPdUVJYUpGNko1eXY5RDNEZERyYnlYeFgwMTFGUUlRT09mdW9Y?=
	=?utf-8?B?anh3dzNTcnh2RFp2c0VsL2ZzRTNiM0dkaVJlaHlFOXdwbjJxandjNUd5OFVX?=
	=?utf-8?B?bjZBcURIZktYUnpWK0pLbzA2Y0o2RUFRQ2lVMWEzdXZ1MU83am5RSjArUEJJ?=
	=?utf-8?B?d2lYYXE1b3E3blJmc0RJcHIvNkJld2REeGNHbUFNRUxCSGdNbC9VbklUcEY2?=
	=?utf-8?B?R05rd1lkSnRPSjNmMWl0R3BwVXFyV3cwZlg3UFk2NEdLT3JnQXlsQzQxZXFr?=
	=?utf-8?B?YnBsanJPVjZhYk1CVFIyUWRPdm83QnpqNEMwVUVRMDJSTmxFOGsvTWIzL3Jr?=
	=?utf-8?B?YWMrajdzcDJqUTE4a1RPbmYwZFQ3UlpMYU9mZFd6eW5pOW5hQU1hMmFrcy9X?=
	=?utf-8?B?TGtTazF0ei9jdUtlcnVnTkRLazM3aHlCTE9Fa1pEYzhxY3JEUm9OR3ErRUxL?=
	=?utf-8?B?aVpadXh6ZWViNEUyWGpmMk1mY0twYW51M3lIdGNnNDVkRjUrRDFGa0xlelVN?=
	=?utf-8?B?b1dUV253V1MxQlErMk1NeDhhWDNmYlhhUE5ka01GVmxYem96M2c2V1gzUUp2?=
	=?utf-8?B?VE9rd09maG5TeVN1bnVRamhQd1N3ZnhXNWhocVpBYnBWeE43ZzJ4Mml6bkMw?=
	=?utf-8?B?czhKV0g4MUdJeC9SS0VIUWRiMUZqajkvUktXa2o0VmtMbnlEZnNUdlZZRUhl?=
	=?utf-8?B?MkkrOENScmQ5VjRpZU1Pa0wxOE9ZbnFqTm1iNWYybE16WnpTZHRNMVNEMjcy?=
	=?utf-8?B?T3RELzI1aTNWVlpINGJKTFBhWjdNVHZHYmtlNDBxQzlLUnZuaFlvTEVxNk9O?=
	=?utf-8?B?VENmZ1VySXAwRkpBVk1qSHpJRHh3PT0=?=
Content-ID: <8544CB4F6678C24E9021B7BB2E8D7853@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cc21d85-faa9-486c-5ce1-08d9f61fe3e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2022 16:25:07.5780 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rVAolM2ihrgvgqECTmmv4a8dtN/1Pqfn4NOWmZBTC1R9KVJhtlW9S88mXF/PWDdOysRCaYh9mGKFkoeHh5MBdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
Cc: Chris Zankel <chris@zankel.net>, Sanders <justin@coraid.com>,
	Justin@linbit.com, Minchan Kim <minchan@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	"linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Denis Efremov <efremov@linux.com>, Coly Li <colyli@suse.de>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Nitin Gupta <ngupta@vflare.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] remove opencoded kmap of bio_vecs
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

On 2/22/22 07:51, Christoph Hellwig wrote:
> Hi all,
> 
> this series replaces various open coded kmaps of bio_vecs with higher
> level helpers that use kmap_local_page underneath.
> 


this series looks good to me, looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
