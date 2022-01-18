Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7586449326E
	for <lists+drbd-dev@lfdr.de>; Wed, 19 Jan 2022 02:48:59 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 44A9D420BA8;
	Wed, 19 Jan 2022 02:48:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 10884 seconds by postgrey-1.31 at mail19;
	Wed, 19 Jan 2022 02:48:53 CET
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam08on2051.outbound.protection.outlook.com [40.107.101.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7132142096E
	for <drbd-dev@lists.linbit.com>; Wed, 19 Jan 2022 02:48:53 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=nw/zXXIihkclJzP11XNh412j4BFUW3lkuEID0OIlZi4cFybcp1t9B51WLwBakChWHyZ5P1Y0GWjHjttSPLzLK1dGpiLlJA1WcY1LnchkSKr3mM7zdhLCOG4CkD/hZJgIhEp+iFPGfptCRJo0RPXxoJ9o/txccPb/scORe6mr6KTv/ZV90jNzREtO4MMXAjksVUAQEYtDQ2KdLbAixS6pQDOmiD+pXBOTV56uVoE6A1j89nrY56+zsQ/OTKiEKrVNhR7+8OveGhPfn4o/fpGCnpauZmdBLSSAGN/WvqDJz66BnD3QywVp5ZmX6jCoTu3eLUuVJWMhZLrLpLaobQk3AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=v3XTQo/k3Ao88p0VxQnnj38+oL2wFdpJ5odlYOeRklo=;
	b=BkTjiTyyp9QCUcT+EQcrWMyQfwxnA5tdOl2wQb8RUADvalbAzQZl7xAa7J/kuzvDgELT3TjoewTyAEb/asbDte3NbSxCRlEb2tFs/F/nThzSIVJ6voV4MEXcKV7FC/xN3feCAuzEhB9vivCVp8SONRT6KIHhKyaoOnp1qFbkY+2d3hS+dLUjyGc+tdNgWPUM5JvZYZXFZkCTGLf4bUdbTH3QSCu/bS1FYR9+kClzPynVDdrjpxdwc3tDlfCHBQN7DBD0Zs5PaNighTZy3KewCMkerX8YXSzMVg/icSyxpluS7GGkGJuq3jLiCt4qBuCIOipphQNSGmcXtI2nfDQqVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
	dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=v3XTQo/k3Ao88p0VxQnnj38+oL2wFdpJ5odlYOeRklo=;
	b=tuNHWo5YnOBhbreXH5o6kgeBTwTSKWVhKt52sB2MHhIzF3gkFxyjMZ+AzqNPva3P8nw+u7xEyebuRzaPARZhbCbx2a9Ya6xt+q0itShDJYJEcRV7UrDZrAQvaWm3rvvEaVyzGWX5eOT+FmYrC73eZO1wE6Bx18dXAh96HVcUg1hEzn0GhJ8YKSlFOkjwM7yWr8gJTjdlDPo8KXaTV1oFe5A/NteXnXOJAKnbxclGLZ+lMWPTbzeCHms+uz0NRAPD428lGqg1S7HlP5UcxXfajmvJ2XJ296Bz/I8RoeJx528gKQIfqjklzgIWttoY48LsQ6NHmmTrEQ4UEDQXGx9SUw==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
	by BYAPR12MB2869.namprd12.prod.outlook.com (2603:10b6:a03:132::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12;
	Tue, 18 Jan 2022 22:12:57 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::75e8:6970:bbc9:df6f]) by
	MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::75e8:6970:bbc9:df6f%6]) with mapi id 15.20.4909.007;
	Tue, 18 Jan 2022 22:12:57 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 16/19] block: pass a block_device and opf to
	bio_alloc_kiocb
Thread-Index: AQHYDDwLgxrf9A6iukmI9OhMnvmluaxpWJ+A
Date: Tue, 18 Jan 2022 22:12:57 +0000
Message-ID: <8838ff19-5e17-1d3a-f751-6b1e21d7d799@nvidia.com>
References: <20220118071952.1243143-1-hch@lst.de>
	<20220118071952.1243143-17-hch@lst.de>
In-Reply-To: <20220118071952.1243143-17-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c6f3e30-efe2-4559-882f-08d9dacfaedf
x-ms-traffictypediagnostic: BYAPR12MB2869:EE_
x-microsoft-antispam-prvs: <BYAPR12MB28693FE86B27FC5F0F66C5AEA3589@BYAPR12MB2869.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sbKOleeczD7PQYPJnEb+ImIz3jxCZLuDbtJcfmJFaPVBgt2LnczGpT/ll+gOsPqNbeDYZ1LshIvLaBSpserfKG3CaXoLrPADfJae8bbk6o089jVDEm7lst0HNLnjzotAn5ChnZBClDy9Xl/65x0zRqJOTApGydVqzC7f80B+2iA/+bJcVO2c5aUCybo7z7vkwn/kA1vXJYxL1uYCQ8djz3BzCuA5sbn+T7jMRqCkvZnqrs/BR1gCKM9yWe5O7IV50RX6C8al+kI7MPxFJaIt9wX9bCOj7ZR7i/B7SsaW3O4G1cPRnAhmMQEON0Kdzbhj+5Tndgyvwzm8LtalNdVoOb0LeHkAWD55D/viV5IeYS3TtZ7gmJDjvkKsVrhlvuNnp3R2AuoXsaSwxxTU8E92MCS418Fn84gkjTPFBfeUeifS0Oa8s4cX0YYt37+Gl7a+mN85/e3dR1Dm53ZdRX1Bx0wFl4tnUzZ8Q0xqmhZpAOtOHvpp0mV0unlt/WNVCXKvkkrNCAxvxxMkHdaKcCQ+YhqdwU5QwpoOnisdeHsf4QMr4cjaY9Vv8hbtwYCYENNHftKPDq+IvFYGb5iDUV4zed7xRC+hHIH43YLyR27+4yynt1D9dMtGx8bKFFZH3CT5aIB7jh6Ffa3Z0y4c8QIlqJvIf95Ak1oG2IE7kBj7XWlsaFrllgO2bJfZAFooXaPI//aSXQNwHszQwo9EtFoHflgKDPTXbPidKfsXL9kdYB069Sna4coimsj6UNcC6+szfYv7GfW3FETlWWspaitDDg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(4636009)(366004)(6512007)(316002)(86362001)(31696002)(8936002)(71200400001)(66556008)(8676002)(64756008)(31686004)(36756003)(38070700005)(558084003)(83380400001)(5660300002)(66946007)(91956017)(2906002)(66446008)(66476007)(186003)(2616005)(6486002)(38100700002)(122000001)(54906003)(508600001)(4326008)(76116006)(110136005)(53546011)(6506007)(7416002)(45980500001)(43740500002);
	DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2FCU2s5M0VrOTVudFFoSnU4S3hvaXU2Y2VWeWw4aXdXdTIvQUs5NDBISVhB?=
	=?utf-8?B?WFZ0elRDdzNPZ1JkeXRoZlFyV1dBcmVwbDZ6WDhiTkIzZ0pxRnlyMXdhb05Q?=
	=?utf-8?B?c3k2MmZwMllJejFXVnpaYWZlTEoyc3k0UkdyVDNqL0lKRTVWdVRBVEFDVlpO?=
	=?utf-8?B?bG1FcHhsTnhKVVRGNllSQjdLZTdSV0t5M1EyRWRMWkVBV2xEV0FMTHV6bStC?=
	=?utf-8?B?eEQvU1pRRTZEd0tTaTZjWGc5aHFsTC9rZ2pqcXlBdW5mK0VJTFVRandMUnV5?=
	=?utf-8?B?YjhKTXpvYTI5RElibkxuQmhYWW0vV1hseEQzY2IyRGNNbjZRU1FtcnRoeWZH?=
	=?utf-8?B?RlR2SzlsS2F2UUZyOVR2K05UOFVKMkxLWjNSUnI0SytuM09HUlFjUkx0SUUw?=
	=?utf-8?B?MVVCNHQwbW1Nc1Y1ZVVod1dscno1anBDRXBEa3Y0c1lMTHhmOWk2SWYydTBi?=
	=?utf-8?B?TUJCdHhiZXFoTVlueDlmb1U0WG0yaVZmSnRlUmxiRmk5SGZxMkVrSEZ4Nm8v?=
	=?utf-8?B?YWJEYy9mRGdTNDhjYVp5a28raUVHOXdYRHhTblV3aW1SR2dGdkNvSGdRQU00?=
	=?utf-8?B?cGdzSlJnZkx2dDhScEt6L0FFZXgwQ3luYUFWMm0vTWtZNy9SbERkekkxOHNM?=
	=?utf-8?B?NGc3QUhCMnFmTTVJNWNMUzZPbFJ1WS9WaHRuU3Vtb1dUM3Fja0R5aXBrblFp?=
	=?utf-8?B?ckdYdmJyY2tnTW0wbUNOQUdzNGRncTY0TEtyMStBZC9TT2NETlg0WEx3OVNB?=
	=?utf-8?B?eXNLaFYwNWJ5b3FQVG5BZ2JMNXduL1VHVmZVL1lhV2Zod2F4SXZZOUlOTGNI?=
	=?utf-8?B?VkhJOTJSZmhLeHpaandFTTZqWjlBbXRkYzBsSHh5SzdJcVNFeU0rbTEzN2Y2?=
	=?utf-8?B?QjNYOUYzTVYyTUFDNHd2eWovVDIvcStmRHVUbkhCbjdSU29jZFJiSE1rakcz?=
	=?utf-8?B?MDFiZnNRQlFPRmlVUmZTRmdaSWNvMXBGLzBtUmkxRlBEa1VUNDlQYk1kL2VH?=
	=?utf-8?B?eDVsVDZ0WHZCYVYxZ2wxTHozM3RjMTNaeDJCTGswL3hHWlp6ZGltOGtwV1V6?=
	=?utf-8?B?U0d3SXB4ZlhJSVNpU1RUdmxWNEw4UWZqQ3pHekxoV1c4NWx1YURSUzQyMXFC?=
	=?utf-8?B?SjQ2aDFJM3FSWHhNVG5nMEYvZUhBK0xLZVZuUEkwQTRKMWl3YTQzVFR1ZTcr?=
	=?utf-8?B?WmRoVnE1NXhpVmliVGRHTHc1WHFvOUxWb1d0cjBSWEFkZmkxMS8wT2tDSGU5?=
	=?utf-8?B?OFJ5T1ljbmVGTjZIV0NxcCs0V0RuZ0gvVGR2QVkvK01nODc4ekZFa1BLTEtL?=
	=?utf-8?B?SFhZL0QybjlFcjRZbHErdzhOYkJDaXhKNXYvam1UZHhHb2dWQ25NSisxWjU4?=
	=?utf-8?B?anVjMTZ1cVI2cnpDS3dLNnRKSGhRN0pBTytuU0YyWnJZVUtrYkwvUDVyQVk1?=
	=?utf-8?B?bUNwdUc3eFNtT3ZqbEdDejh2YS96ai83d3hPTnI2S3BNbVg1NUp2TWdtbEVM?=
	=?utf-8?B?RFA1M1E3ZkpJRHZ0L1R5ZmRCbXEyNk5kb3RaeXlid2R4TEtrNmNSNWdSaERR?=
	=?utf-8?B?bDkvZGxTTkE3Y3hKZ3JGUXJFclhpVmR3WTdOd2FQVHNzbXZjSWk4bXBoU0lL?=
	=?utf-8?B?eDEwY2dDcHNscXZiTDdieHNrOTBBc0RwOWlsZFhLcVBLVUpDb3pUR1oxa29E?=
	=?utf-8?B?Q3ZMMEtrSlBzRUJLV25NZU1lRWJya2dTdnYwRzhVTzlUS0FnNFVmSXZFZWNU?=
	=?utf-8?B?VWdnMTFMdU5oa29hMzg1T0hTZDRLMEtUbEd3ZXZNR2FJYjdnZnZJY0hOeFUr?=
	=?utf-8?B?RE5VOG14alpWb1J4L29XQ0tUYkJvUzJxeVgrV05xSG5Lc0h4YzN6ZTY3c1Vo?=
	=?utf-8?B?N1puRDVQY0F0Q0tGQVZYMVVYUGE3UUYxTEpuRUVkVnR4dW9VdWVrUFk0Y0R4?=
	=?utf-8?B?ZXl2ZGRqZXdzQ2xjYW9MRHZsNWJ0SURVTlVBazZNOVpKcFVDaVRGMDhkMFBK?=
	=?utf-8?B?Ny9lYlBBOGF5WE1EOHFOcmtaM0l3LzVCMlRSdEtQZzZwZHVjcnpqK0lHMUgw?=
	=?utf-8?B?RVljbGJ0MlEzbmE1ekFLc3RWYTVnd0x2MjhLK3FnTTk0WVU4NnZQRk50anEv?=
	=?utf-8?B?czBrdU1ha01qZzBtbzREdUVPcit2NFphN2Mxc294NGUyZjVKcitXei8zNkNq?=
	=?utf-8?Q?VUeNPKVksg5EijULXPb6tqDz9nzl9a+TxVlUt8ToCnzY?=
Content-ID: <2F4563EDE021F847919851EF702ECCC8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6f3e30-efe2-4559-882f-08d9dacfaedf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2022 22:12:57.5981 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YcFKlJkqGI/oYw70LvuZjBLJRQozSkOGF5HC0fPl/L3xvJT+J4npLTDpyaiVGV/6UeNnJwTSC5bs4nTs1XQrDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2869
Cc: Lars@linbit.com,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ellenberg <lars.ellenberg@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Komarov <almaz.alexandrovich@paragon-software.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.co>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>, Jack@linbit.com,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Morton <akpm@linux-foundation.org>, Konstantin@linbit.com,
	Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] [PATCH 16/19] block: pass a block_device and opf to
 bio_alloc_kiocb
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

On 1/17/22 11:19 PM, Christoph Hellwig wrote:
> Pass the block_device and operation that we plan to use this bio for to
> bio_alloc_kiocb to optimize the assigment.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---


Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
