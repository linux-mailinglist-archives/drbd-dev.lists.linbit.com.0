Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 716D05F5914
	for <lists+drbd-dev@lfdr.de>; Wed,  5 Oct 2022 19:24:31 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E0A95420960;
	Wed,  5 Oct 2022 19:24:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 57EC7420668
	for <drbd-dev@lists.linbit.com>; Wed,  5 Oct 2022 19:24:25 +0200 (CEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=F6BjE1eOubhSUK9Sc/0jmQZA1Tuaria6c4kdux8eBRyvVg7xKyjxAkWknX4LqRqybYsoQrMakl3J9k1KMrdQW0+L3titcB49aPTxthC/+XTzu3/HaLL9W4Dy5USXNYb2mUUuz3i90qI33bNAF0JDONpFtaEffdfsJRlIgGCCcsTt/6dfXhkJIyhFR0wRoLMD+gsOIABEXzUQxljsCVChOUkmdGTwVK/MOhT0+3Zt7JUq5Dm34TQkunCPXzBMG2AsgqZdDa07N/r+a6RDHzT+qE1rgELS2uirMRQGbtcNzH3GU0zQ5f9AyMS/sSPMmg7qcR1Jo4IyNzUQu/8b58jYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=zzcgaJirpEkuBcxGm2rUhD5N/PV5cICTvdp996ZPewg=;
	b=VT3cnr69EM3wGbxOllfZ0Z2wY30udir7oBqTpxSNK+6ik05+4Vqz+zi7I7eR1ioLEXadP/cvAGxNptLu8+ag17xNiqMlLhQ7vUQ+acVigWZJTVHJAR+Mb+O7ZEwOcb94/iVH+v3uM/T/EojH0ABzuoA1+jGZG8d2I9+m4U9xoEkw2v3nMqmGY8OU8kuxiISCQN2IK2k0XlvRUXlTLmxRokfHWFpFj7L4qPNwLy4lE4w9vitG9xrsVJ2nHMe46xiui0DqRm1vqYETyvM8TxI9AbQ7WpWXd3Px/D8NJHnEGMeq77wJlDqmNo/86jbfkKdhlmXH4PDpfaB1+2kx9SMBzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
	dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zzcgaJirpEkuBcxGm2rUhD5N/PV5cICTvdp996ZPewg=;
	b=OGF5OidVGqsiHcH5OLWxnGdqYu5qxJKRWTyTBMijLamibUVLDtRKjRdqMt6u8he1eBacJmWsJ8Vi17wExf05v4tI1B4ra1ZfZgjrWXwk5k8XZ6zp+A5X79OPeJppMG8c50Nxa/w4cqc36UmTR8QsyEL/FFiKAt6rrHoyTAam9pe2B+VNHjs/70mKEZm17jG1VcjACtUUtstBduTfh+39G4cat5MLaz5IM9NBVTUEGpgjV75ifCR1nuSHgJ2kJET4Uhuqf1xi/bSujY9H/l2LFvuZREHGPga0ZPBPNrayQHAZCj1713KNluJsZ40hhtsT+5/z7HIot8KkPeqrIM7Z1w==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
	by IA1PR12MB7543.namprd12.prod.outlook.com (2603:10b6:208:42d::11)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20;
	Wed, 5 Oct 2022 17:24:22 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::3d10:f869:d83:c266]) by MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::3d10:f869:d83:c266%4]) with mapi id 15.20.5676.032;
	Wed, 5 Oct 2022 17:24:22 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: =?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?=
	<christoph.boehmwalder@linbit.com>, Chaitanya Kulkarni
	<chaitanyak@nvidia.com>
Thread-Topic: [RFC PATCH 05/18] drbd: use init disk helper
Thread-Index: AQHY2HeQezp2ej+qC02v2lxKPd/Sr63/lCOAgAB5ioA=
Date: Wed, 5 Oct 2022 17:24:22 +0000
Message-ID: <1e2cbfd0-6136-df9e-58fb-60f1375b2e79@nvidia.com>
References: <20221005050027.39591-1-kch@nvidia.com>
	<20221005050027.39591-6-kch@nvidia.com>
	<e23e94f8-13ad-4a10-62de-33e63a62831f@linbit.com>
In-Reply-To: <e23e94f8-13ad-4a10-62de-33e63a62831f@linbit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.9.0
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW2PR12MB4667:EE_|IA1PR12MB7543:EE_
x-ms-office365-filtering-correlation-id: 2e103ab3-0995-41ef-f45a-08daa6f67171
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fNsgKS1KrAK4rDKnODQmw4lT8LX1x64ANj7qz4N7d8l46tKAdYOBOip6oR2oG9MhbwD+nFQYSePCdem/TdJXYDqazIV5ihMp1ISGU/U/Tqf4dCIePjXEgQPS0ZOkLjl15+5CDO+2ZSYNoQoY4OpjudDsVJt2upcSw+VDjBs1bYr6YIPDkqgSIqXtmhDwf9Uxd6ao6KiAblZLO74amvxaxmFe5mbuorwlhSK3n4W35dCAIL9ZIpCRyWoRZNjB7TXBfV0WSBOQlUUYKLzais+jv1cG44yS1ot4NBGCVLygsZxEeHryJeillXT9tsjkxB4m0F+DHmZehnnOaReBLawDjaqPhVDCWTk3vS+pD3AY2jvRpJgTAkE5LtuP17Byu7kd+M48dUuLcqnaFN+9P9zBnzF+4DNh4yaZwjZtwcC3DXjHPIskQO/6GR/Z8HdSygogYCtbIXABXuHnC8cG52hBb+7swWnLY0663lku1okxhXjL8cInBOCAB5SR7hvBTaqDc/4XxDZVvXf48xSEIz7ryGZ4Ry4319MAYqfo9SdaRjDL4ImjoCA3GoTJ4YnJUJfDg1VdldI5S1H+sU9Wc+kWBBNM+XDn58G74fjiA9QFmCuVKCJz+t6O8uyRlwQ0tMjsj/CZxXl141BGTqe9/7tf3ImyCb+HfSb9zxDe1AzPUAJFGRRlCvwKq3L8eN+sIYSSvLQrspj6wXeRygOi9CKb1BBZjs3Yp6qxY2r6JVCwKcQw+KbhwINvu7CVycQiOSFYdDk1onjBpjzEzVGv3Hv9vdk3acXUTNjam2rG06ZgFmfIY5UYKqSzI9S40N/bn67q52JKua6En25JofgMnz9u/Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230022)(4636009)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199015)(31686004)(66476007)(66946007)(64756008)(8676002)(4326008)(66556008)(66446008)(54906003)(6486002)(86362001)(38070700005)(31696002)(7416002)(2906002)(38100700002)(110136005)(5660300002)(71200400001)(122000001)(6506007)(186003)(91956017)(2616005)(316002)(8936002)(76116006)(6512007)(36756003)(41300700001)(83380400001)(478600001)(45980500001)(43740500002);
	DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cW50NEcrbHR3UXNCQ2RyY0Z6N2FMZGlmakRwV3JGQzgvR051NThWY1NsUFJy?=
	=?utf-8?B?RC94c0FNdVkyRDhGWVQwUmR6YWNkT3VQcHF0UXJsSWlxNkRFdk44eEIyU2pG?=
	=?utf-8?B?VnVDVS9EdThUek00YTdtemNnOUpzNGJjbVVlV1dlODBXc2Z6cm83eTRzcnNt?=
	=?utf-8?B?TVFXd1UwUklpU25Jem9KZzdkekNUVVZDZHVKNjJYY0VORmhrYWo1QVBSMHhF?=
	=?utf-8?B?Q251Ky9UcGdQTmZ2L2NUNGxjZVhKRlNubWJ4NGNJYUN5VEc1VVdLbmRXMmR6?=
	=?utf-8?B?ZzlXRVVPMGEvTS9pT24wbzZHalVCa05iR3lSVVZ3Y0F2Q2VENkpKNVhUSFN2?=
	=?utf-8?B?L3hMZVRxYlJ1UjRRN0ptRklxWWQ2dnJjVUdTL2RNOTd3K3ZSQmwweUJWY29t?=
	=?utf-8?B?bVZuQ3hGdWY5UzFWZGEzbXVWTHBwK3hNSStpNkphaHU3YWpLeVFZbk4yQ1BV?=
	=?utf-8?B?aG82SVFvaVEyQXg3cllPY1RpTjlubHFLNW9MYWlIY2xoZlExWWw4ZDVFQ2pT?=
	=?utf-8?B?Zmt3SXdqRFFHWjhETnRYUEVPZzlpT2NCclZ0UVI3dXZ0c1pYV2srNGd4UTVr?=
	=?utf-8?B?NzR1S1FITDdKU3VFQnk2NWR1VGNZUHpGSHk1NGFEWXYzVjNTYnBSL05OYy9W?=
	=?utf-8?B?bGJNdjRMczNOUmZ5NWhkeGJzTFljMUN4ejlXZXZEb09UbnUyaVhjWUFUOFJh?=
	=?utf-8?B?ZmpUOTNhamxTNjlzSWR4SStQeHp2RjBMd0FVMmtZbnRaTUY0UHB3MWNJclhC?=
	=?utf-8?B?bE5DTTc5aCtWMVpyTzZIYks4SGwyUUdLclVFVEo2VXVubGM0cSt4dHhjM3BL?=
	=?utf-8?B?NGRlVGJaZWNSQ2hQUDRReG42V09QQ0R5OWRVNlU4Z2RYZGNCSmxxS1pMTjV0?=
	=?utf-8?B?dVJpQUVGbEVxMWx0QlFMdWU3YUxrZDZoTDYvWmFneXFxR1pFYVR0UXgrTFJ2?=
	=?utf-8?B?eDE0TzBYeWkvODB6eFdFcXhUYU5EVCtGN0RWMUNzQW1YN3dSVDl5bE1oVi9G?=
	=?utf-8?B?RFFMZVNSTXArbk5mMjFMeEgxQjhYTnc1SG5oeExBVTB5NVFjRjlITTlxWTZT?=
	=?utf-8?B?L1VacTQzTWNkb1o2K3J0eitjQ1R3Y3BPWmZOd3ROakRCYVhUOGxmMnFCSEJN?=
	=?utf-8?B?ajBFd1BhZTY2MWdqN0RXeldOUUJ3MVcxMk9yZE5ta0oyTkVGY3pUSDdiZFh2?=
	=?utf-8?B?US96MVc1UzRNanFXZHhwcWlmYVp3UURGakt3VkNlcjIwZC9XaTMrdGtjVEQ0?=
	=?utf-8?B?c3lwNFdrRXZvemYyRHNJR3lzZkZEUENXcmJBdGpPc016d1hBcGIwd1BmTzlK?=
	=?utf-8?B?bWhXL2ZabTlXNkp2bUF5czNKOStWNjZLOGMwMkQzQjN4emZpZlZOSUJQSHVk?=
	=?utf-8?B?VUFlaldiWE5sR3dVZHBMcXFlaVZvM014bmxxUGtUVmw5N2lDNC9OVE4wU3ZP?=
	=?utf-8?B?a2R0eU9LWk1VdStkcFBtSjlBZ2FUUXRzYnlOQTVMaWY0SFpMMFlGVGRXTjZl?=
	=?utf-8?B?UytwTW8vNXVFUkdIeWJTQ08rTERnd25nSytTZEp4K3dLc1FHT01ncG5LY3NJ?=
	=?utf-8?B?dDlkdUtYYldXKzBvcklwSGVCOE91MVNGaWduQU8vOVpyWTkzdjBueU51Z2hs?=
	=?utf-8?B?cDMvb2F1VXRhU3RYM0hzejFwWGtlY0NLQjEwa0RDWEhzRGpPaWRaT3kvY0xr?=
	=?utf-8?B?cUlBYldmaHJzdG1oamU0TFdRQjVHZVl5T0JxMW1SdG81YXZ0bzVBMTQ3RVBK?=
	=?utf-8?B?ODg0ckJKNVNpaVoxdUMyK2JWUVBTaHdZTVBqdFQ2RHJvdExyNXZzd2NsTFRH?=
	=?utf-8?B?YVVxSzRsNUNsaEZGMTE3V0dYQnRVeFdsRSt3UHh1d0VyK21rZnJ0MHMzQzhH?=
	=?utf-8?B?MU01OS9zS2RyNVJnQks5UzN2NmQzSDJXU2ZsQUJEQzhWMjVMazZMa2p1Y28v?=
	=?utf-8?B?dlVzS05heTFXSUoyMUttdTVWdXZKN0JDOVBnblo2NnlncFJPazVLRUdkWDh2?=
	=?utf-8?B?c0E4TGt6ZTc5YWxOeXEyRWQ0TDg0eFdJcTFKeGhhUERVekVGM25scnczR3R5?=
	=?utf-8?B?a2FoYmxuVStMb0hGWk9jZFE3OEs3S2dwMkpZNDI4WEFQY25Xa0RaeTJwY2Yz?=
	=?utf-8?B?aWQyU0lFWjdWV2VlWFVvRFRNZjNyTTRyUVVrYlV0ZkZDNGltT3p1UEtuUHlE?=
	=?utf-8?Q?02FkTo/MXZW32y5k5qlVV42s7EeFWGwizzHwHiuwlUIi?=
Content-ID: <6FBCCCB66932BD4F8A146135657B57AC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e103ab3-0995-41ef-f45a-08daa6f67171
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2022 17:24:22.1493 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c/PFNki8YtMyBByxfRyE4R2EXbUvoH51Je6G4lvlPqx9oufb7MhOUX8yPbPSYaP0zhtvnyz1BmTLifFh7sqfwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7543
Cc: "vincent.fu@samsung.com" <vincent.fu@samsung.com>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"philipp.reisner@linbit.com" <philipp.reisner@linbit.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"jinpu.wang@ionos.com" <jinpu.wang@ionos.com>,
	"tim@cyberelk.net" <tim@cyberelk.net>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"bvanassche@acm.org" <bvanassche@acm.org>,
	"richard@nod.at" <richard@nod.at>,
	"damien.lemoal@opensource.wdc.com" <damien.lemoal@opensource.wdc.com>,
	"shinichiro.kawasaki@wdc.com" <shinichiro.kawasaki@wdc.com>,
	"ogeert@linux-m68k.org" <ogeert@linux-m68k.org>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"efremov@linux.com" <efremov@linux.com>,
	"nbd@other.debian.org" <nbd@other.debian.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
	"hare@suse.de" <hare@suse.de>, "ming.lei@redhat.com" <ming.lei@redhat.com>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	"johannes.thumshirn@wdc.com" <johannes.thumshirn@wdc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mcgrof@kernel.org" <mcgrof@kernel.org>,
	"haris.iqbal@ionos.com" <haris.iqbal@ionos.com>,
	"lars.ellenberg@linbit.com" <lars.ellenberg@linbit.com>
Subject: Re: [Drbd-dev] [RFC PATCH 05/18] drbd: use init disk helper
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


>> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
>> index f3e4db16fd07..58fae122de16 100644
>> --- a/drivers/block/drbd/drbd_main.c
>> +++ b/drivers/block/drbd/drbd_main.c
>> @@ -2706,13 +2706,9 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
>>   
>>   	set_disk_ro(disk, true);
>>   
>> -	disk->major = DRBD_MAJOR;
>> -	disk->first_minor = minor;
>> -	disk->minors = 1;
>> -	disk->fops = &drbd_ops;
>>   	disk->flags |= GENHD_FL_NO_PART;
>>   	sprintf(disk->disk_name, "drbd%d", minor);
>> -	disk->private_data = device;
>> +	init_disk(disk, DRBD_MAJOR, minor, 1, 0, device, &drbd_ops);
>>   
>>   	blk_queue_flag_set(QUEUE_FLAG_STABLE_WRITES, disk->queue);
>>   	blk_queue_write_cache(disk->queue, true, true);
> 
> This now does a set_capacity(..., 0), which it did not do before.
> I'm guessing this does not have any side effects as the capacity should
> already be initialized to 0? Do you know this for sure?
> 

I think I'll move  the call to set_capcity out of the caller,
Will resend the series shortly.

-ck

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
