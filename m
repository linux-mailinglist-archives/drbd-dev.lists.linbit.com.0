Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 320F74AEF41
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 11:26:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 19F54420949;
	Wed,  9 Feb 2022 11:26:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam08on2084.outbound.protection.outlook.com [40.107.101.84])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7B1AE4206C7
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 11:25:40 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=EU6ki5e8ar2wVbQ1BbkCfElJ38WwWI6ImmLKC4yxetcjA1xGrLsJKxmlb6VfiJiYmRXH78UEScZ4pW4aTvkK/Ii86yeJzWdwsCxvJgfWTimvf1iqUQmGlbfcpiVXYQW+rssjM9udef7CLp7anfcq9pcibJwVlQZHNnqrYydzdupFeM76G+Swk3D5tWMykZvHTYEwijW+qL4O19MM8xTafA2x6JHcCzetNM6S3BJB1pUW9AGM7uqSgPg7/G/uHnZBk3YSwSUHgScP7Ijh3860wmmvxIBllWDyyFef89JYiLWz5G3lzUrnjhOPwi/rRV+VdqzQPaZi6w0qskL6l1qLGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=wEvKEZLBIDL40TKi8A6Z8wrwwD0gbVHApXOswBu19nw=;
	b=ogq5mqaCfiHoXHNrCrtWeERyx9g9zXboW3ypp/ow9+qxx2SCuoORHvaKl4hK7Kpwrg8sOjcaEy6IjEt/id2vnwpXf4/j4TuqFAxAB5XDYJWVT87xOqODG8G3VeFWGuFAqi/K6k6fVL5ISUC5JnQfVo4PHnmgLIgi4pCfIYb8Xbe0ZiXSfgvTTAJrwTVNB9W2/Azf/9Ma5fl94hzmAa/r+d/gc8CFEUo3VHcKNBfsf7RNhzzHwjZx/bUyMGRXtIyI+Y1JIJzo17JGB9HNqqmR/FCl2NQ+Jjg0N1pvYW+O3P99ydHxAxaeXIcl19szQ7Gd8dsyBWQJePyXiccubUO0ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
	dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wEvKEZLBIDL40TKi8A6Z8wrwwD0gbVHApXOswBu19nw=;
	b=ENwHaPLxPNb+5cr8TiSBmmcMA1YPiFl+uucGhhmjeDEdSq4brHk2MOjPZLvnuUjfusJkltKoZXpP6ydw8HNyWWoVCq2u2pc7mEqYyEUaYiXyQPZFf9e6kVE1UfSsIhSYnIypIsiW4anfGjMRmiNEtjsZlVy+Owr8O2F/+AZ/xwjiu+qk4zH3kDU3E/iQRIeZwkXXsSD8RfuDLNWHcJlgdZDzA5xmnQWQbON7HHVdiHKccNqc1dqG8cx2+s+PNpfFT1R9MX6fayuHb/RszCpBqmEU5S2Jr5TnLhbzv0rPsc86x6sX+JcrNToTRKyuUDr2VubEyTGIbrxQVsWKQ/MXVA==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
	by BN6PR12MB1346.namprd12.prod.outlook.com (2603:10b6:404:1e::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14;
	Wed, 9 Feb 2022 08:46:49 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::846c:d3cd:5a30:c35]) by MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::846c:d3cd:5a30:c35%5]) with mapi id 15.20.4951.019;
	Wed, 9 Feb 2022 08:46:49 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, "axboe@kernel.dk" <axboe@kernel.dk>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"philipp.reisner@linbit.com" <philipp.reisner@linbit.com>,
	"lars.ellenberg@linbit.com" <lars.ellenberg@linbit.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"haris.iqbal@ionos.com" <haris.iqbal@ionos.com>, "jinpu.wang@ionos.com"
	<jinpu.wang@ionos.com>, "manoj@linux.ibm.com" <manoj@linux.ibm.com>,
	"mrochs@linux.ibm.com" <mrochs@linux.ibm.com>, "ukrishn@linux.ibm.com"
	<ukrishn@linux.ibm.com>
Thread-Topic: [PATCH 7/7] block: remove REQ_OP_WRITE_SAME support
Thread-Index: AQHYHY8v/Mm6g8yk8UOZgBNqwadMmKyK6AcA
Date: Wed, 9 Feb 2022 08:46:48 +0000
Message-ID: <7205acb7-8973-ffef-9e74-3477370aad4b@nvidia.com>
References: <20220209082828.2629273-1-hch@lst.de>
	<20220209082828.2629273-8-hch@lst.de>
In-Reply-To: <20220209082828.2629273-8-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42bbde97-5d71-4adf-aa0b-08d9eba8b602
x-ms-traffictypediagnostic: BN6PR12MB1346:EE_
x-microsoft-antispam-prvs: <BN6PR12MB1346D63AF4D605E3BEA77FA6A32E9@BN6PR12MB1346.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:213;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: osiJ5j7OPnE6XtyYG2Mj5bcu9OlCi7pOYICyCSBdlELQD7fvzYu7vAGaCC7qo8SZZNSgarLQAykGq7M1gCrFRX+BT9mHxxqzoLVcDLgosSvVWc3S9e9Taj4VWpEnr0g/mkLi7L08ds34ArUsfGKLssiujh2t2dWbuWufVgnWeTdrY2nKPeGn/zkHBNBEs6/+leNm8sJVAfj0XYv6fRwtKQxUJ7iRkfz9XFmJy7vpNZ7vICtboAV2UMzjY/UYpcwqezqcOYN5ldTTZktyLFX7VLQOkKpeTDRWDw1NfqLQcbq33IOuGR65muotoiPC70J9VKCjpbPN/IVU/Xi+tT/2VhnigPMlbmOf8N8SNoer6yRcGKXV2DXrI9+Y+Mfogy5hKHTegP7DEohOLzLUQBmdAK4ZgZhieq7M/NlW2/bdkuT/61yDTtRR1kwhM6guN1JI4KLqxzBWGbtLui2FLfNfMft+taFZW5v44sMCxou3ah/DRB5BwPQayNYfNPV4lSIQQWithciyaBwHi5OsnGh7MXXBIqGs5DnxSs4lG51XEqoV6bRRHjTHZfYFGQkwMIGQgP+6io4cgzTLLIU4s2BUBpxHp69I7kO6yH5e80OGCDnF02U9qvvegqgEgwcN+xN780LLU7Qr+UbwnUtNYHrKuuAUE16HH6mMF7WMx1ma33tM+ZVb4BzaUGcKYz2LgDeLNzZBmAbLQCMmR5fGTNhCBNRLlCeZw3iL//D+rNsZ4np16AKfIaNlwa36SruRFjY8+tLWhoRZocuXaUGJsstiHfm52kI4RgHuwGTf1Ll3NxI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(54906003)(110136005)(122000001)(31696002)(38100700002)(921005)(6506007)(2616005)(8936002)(66446008)(8676002)(66946007)(76116006)(66556008)(66476007)(31686004)(316002)(64756008)(186003)(91956017)(6512007)(6486002)(508600001)(4326008)(36756003)(38070700005)(5660300002)(7416002)(53546011)(2906002)(558084003)(86362001)(71200400001)(45980500001)(43740500002);
	DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UW1BYlBTYURtR2pBRWdTWVZVaEZ0Rk5Hdzd2cU9uVmRVeEdOSFUvZmFmbWdq?=
	=?utf-8?B?WmhVQnl3R2Z2aGRnM3kvc3p5WG4zdHg1UEZVQUxTUGM3S1dIQm9NQmhRUU5Q?=
	=?utf-8?B?NEpMZTVwdGVPZzdqUHVDdmRBZ0c2NFc4NEY1QTBiZ3djci9hWnFDVm1HR24z?=
	=?utf-8?B?Ym96UVNFdFNnNlVqbmh1a2s4a3JWU29WcDJnV0svLzN0WHUwRXU1TWhUMUdW?=
	=?utf-8?B?K0c3VGg4Sy9pYlpCZXRXTXVUNlB2OEN6N3NrSXJZSU5DTTdpTFo5QnpNTVpv?=
	=?utf-8?B?d0N3VDkzMTBVZUFwUE5RK3VmOWVsL3huVE1XaGFmYXhJZVAveHFDV20zQTUr?=
	=?utf-8?B?SEJXNVlZT0RsVzNDeDMzb2c5ZllHdVI5UHF4ckpWaFdZZzUwZ1FuaHNKOGh5?=
	=?utf-8?B?cHNGWlI3aW9zaG8wZGNubkwxcFI5ZWpabnFmUmlrZjhseDJtY2huVmIrdEt1?=
	=?utf-8?B?RDhuVWVYeHJ3RFBwbSt6aExTNWJVNElaM3Y2THhRTFdjdW1BcVhjNWQvSDlj?=
	=?utf-8?B?c2JNT1A1dnhJeWc0MlA1NmlhL0g4eXRSTGY1VkN3SndlMkFnOW9RY0grR05R?=
	=?utf-8?B?OVFNZ2ZHTHlGWlNHOTBQdXdwd0JIY2RzYXdsRWsxdnBLc2pseUVWb251TDBZ?=
	=?utf-8?B?NjNCRVRYM3pzb2VvVHRIVkphLzkwVlNsSmxGMjFXMk9HMUlYMk0wRTA1Q2Vr?=
	=?utf-8?B?Z2dHRWJSSG9uajN6KzVNTU9MTFVMbUR2SUhqdG16S2E5ZHEvZ0dXRnRwalRP?=
	=?utf-8?B?bDBpNDZyMkdoRlZHcld6MmVGVmlJekdZT2U0TTZZQnZVaVlGdnp5dGMrT29j?=
	=?utf-8?B?ajVGRk1abG5iYTdhMkd0VzEvQlQrcXlLN2M0MXN6T3NWdmVDRUlKWHV4NjZF?=
	=?utf-8?B?KzVrRXV2VitacCtnVlJFL2ZHeWtrL0pwQzFIRENUdmZIdTB6enZjYTcvWGpM?=
	=?utf-8?B?REJ1Q0dQRjFMMVRvUUF4TXdzMGE4aFpWanJYdmJIRFlvWXgzRG1LZlVmWkxY?=
	=?utf-8?B?TVFlOHFYalNwWGdzcnJoQzBwNDJwblhWb0t1bUZDVUhLNzZWUkJuMVF5M1J1?=
	=?utf-8?B?R0pqUE1EQ3Ixc0N2QTdlY003SkNJZVYrV3dKTW9Ubm4vRmtZK21acmdiUU5T?=
	=?utf-8?B?N2lBQXkvUTNUYmFkMko2RGRnOVJlZllRcUszbkpmekR4bk5yUW1RYk94T1BU?=
	=?utf-8?B?UVJLSmltcDhwcy9zaVM3QVppclc1aENHRFMvbXllSFJ6ajA4WFgzTnNlTnJV?=
	=?utf-8?B?OWU2Tm5xVnkvVHJaQThOZGRiYTF2V01UNlVZUVhTR0pWdWRxeGREdmxzOHJ0?=
	=?utf-8?B?LzJXbk5KY2NNSUxHZXI4YVdZQ0R4bEdLWUNPRDdkTC96VVZOT3FWajcvWHAv?=
	=?utf-8?B?YkpDdkFaVDBDbzU1Mm5FdnJHQkxTNExkQUNsL1NxY2k5VG44Z2hTdlRmeEc2?=
	=?utf-8?B?ajEwaWk3RGRYdWFuUWl1RTJCN2FMekFVZlZmUnIyekswWmpmckF0OERSRW43?=
	=?utf-8?B?RWFQaUZOVG51MGd0VGRIWlpQNWtUb1lIeFB4ZTVvc09ISU5zSEllckRkeGtJ?=
	=?utf-8?B?ZDRaK09NSDVNUnJFcm5pMWU1RzFUdTZHOTVsdXRzNWd1c2Y1SlErc0htOW93?=
	=?utf-8?B?QzZFOEFXTnIrL3JXUlBmemd4TStqcnhDaEZYZlZXa1doZkFFc3Y2eEt3QkJ4?=
	=?utf-8?B?a25DS05OQWRoZ0VnUGZRLzA5S09OamRwcFJQTHdNUTV4UTBLeU9xK0xaTXdw?=
	=?utf-8?B?VHlwSkVzQXVUdGFsZGpiSHVDTml5c2tzS2lzbWhOdjJVd2U1ZlZzZjFKdlRQ?=
	=?utf-8?B?ZXJPcmhBYXhoMno4dEtmWThkNmhxakFWc1pHOTcxVEJQVi9GYlBUYUQ0dzlQ?=
	=?utf-8?B?clZ6dzAwZ2Q3UU5GUy9HRHppK3RkNDBranFyKzFrQ3Y2Mm1vTU00TmRhTGdi?=
	=?utf-8?B?d1NUUlpBZFQxVXdlLzN0UmJYdXY2WjFrYk45SXZkcUgxejE1NUFVaDFWaW9Q?=
	=?utf-8?B?K3BrQjh1cExrOVZscmp4Sm5Lb2kzNkFsdzlLbVlHOFhpOXh0NDBiUjAzTkcy?=
	=?utf-8?B?RXZNeVRnUGRwajdLNE1zZCtvK3BUWS9ISnNqOGxYdEUvN1N1eS93R2NVWW05?=
	=?utf-8?B?NzNFWGFWdHFSNHNydThDblFKdmI1SmRRRzd2ZEZ1OGNTRXZjdTI1QmxkTnFW?=
	=?utf-8?Q?y6z/1PX4b9ATvRswo+S4L97WIF5jERV2c0/D4KldlFX0?=
Content-ID: <180381D39E6E5C498FD0D7B1DAEA46CC@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42bbde97-5d71-4adf-aa0b-08d9eba8b602
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 08:46:48.9203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g/YebAzPwVXerkf4hwvIB1WQlElBzaMp58eLekTy8HuMVAQF58Vggu7CcU7d1f9Ysobqd+NE6cp1MkKopQsmsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1346
X-OriginatorOrg: Nvidia.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] [PATCH 7/7] block: remove REQ_OP_WRITE_SAME support
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

On 2/9/22 12:28 AM, Christoph Hellwig wrote:
> No more users of REQ_OP_WRITE_SAME or drivers implementing it are left,
> so remove the infrastructure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
