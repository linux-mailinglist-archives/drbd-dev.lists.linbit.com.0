Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5694AEF3C
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 11:25:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C0912420660;
	Wed,  9 Feb 2022 11:25:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam08on2084.outbound.protection.outlook.com [40.107.101.84])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4D4704205DE
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 11:25:37 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=mbNYbYZsku4bcPLxRovqeQ4JSyIBY5gGeAxJL8ZjYsGk59RZlRYAbBhzWTHx6pQHACDqbxiu+SqJIQMD/bVK7siSGBqeXi7giif7NycR1udu3c+fl74S6+/RfErugLr62NfKt1TNIi9uuDAp90dsyUrx2aZQDTKBo0yR2ESbpEQtLQooSHFA0GVdCLWAFOmsg3Wb8j6vHtCLp/drLajtmd3b3sm94g/0Zk55LwXvlwWsL46jjfRXm218qmNQoFYfpuM/IA+cTY6qjlOj4b8IuE47OefyZD5VECXS7e0PrUjDmU54hVLLDTXisw8SxxTphXrU9uNaP1Vif0jFhGeEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=LWO61xM2BtrN8C41xc/VKatyiyOqzWau81b+SdkRpXI=;
	b=PYRdlzUa+kWxcas770VSJG6b0R6daVmo7+BObAhNc7Pu+CVLHz/2V7YMa1MjvXkBVNfpqv0+azTvXHy/gzti8R9gMfyALsTbwn7t8zB4PkcbaxEbsDsUkIPDOhS0zElxuboavOlo6WpnaN8MWdv8AzZtVq1i919ZW/DU4AIvhkr0tKIW8XNZgkkGT+f7MLwN6KLI7XfclLauIIkrwTyeZTr7nFXO41AmdNOQMn2rXX5wO+1tLAxFLHTWpldvkVvZUbHH3YUfHHEmEb3TvqXL+aUXgutmNsVAN2MhLmkl5a2SwjCFqw5yxv9HSmnWXXoauEbbEBthCa0r4iPxLgOskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
	dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LWO61xM2BtrN8C41xc/VKatyiyOqzWau81b+SdkRpXI=;
	b=Qh5j5u1Cs0vRrK/rCI1uGwPKSt6dBeHzAlsQ7s6xDiSRYEsfVcFQoQ6pRDXnOCQGa43IsWSe95dmYdgXuLO0IeeK94KooIL4IkhQR72NO8ApvlmeZbbtCHLIStqyL90S/AjUXxm5+Qory7tAObm+owuYMGqDFyyE+/1je7k7vPVAyecGPY17+GwfRwAXtKo6djJatJ6cy4hkpGDebccsA0XFjLMXEKvDQiACVCTnvMeBcyYffTPqcA1LSLasuVfX6iX9r6cWWBkrMUj3sctYizsj1seF4wshIwZtqGcsRwCR313ksD8WRyLOTAPVaaJjB1yVzLxNl3arN9xmSXpSoA==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
	by BN6PR12MB1346.namprd12.prod.outlook.com (2603:10b6:404:1e::16)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14;
	Wed, 9 Feb 2022 08:45:18 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::846c:d3cd:5a30:c35]) by MW2PR12MB4667.namprd12.prod.outlook.com
	([fe80::846c:d3cd:5a30:c35%5]) with mapi id 15.20.4951.019;
	Wed, 9 Feb 2022 08:45:18 +0000
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
Thread-Topic: [PATCH 4/7] sd: remove write same support
Thread-Index: AQHYHY8T9jYrDC5SwEqmFQpmV/XMQ6yK55wA
Date: Wed, 9 Feb 2022 08:45:18 +0000
Message-ID: <b38fb139-7c66-d69d-1194-d07ddf6daee9@nvidia.com>
References: <20220209082828.2629273-1-hch@lst.de>
	<20220209082828.2629273-5-hch@lst.de>
In-Reply-To: <20220209082828.2629273-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 826949be-8ff3-42dd-970c-08d9eba8803f
x-ms-traffictypediagnostic: BN6PR12MB1346:EE_
x-microsoft-antispam-prvs: <BN6PR12MB1346F8C9DA348D81164BCD2CA32E9@BN6PR12MB1346.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:205;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jfriHkzZbGtwr+prq/sQ2TTFy1CDsfFaiUGoLyGFcVQWrcFaQ4TtjFEccdMlqsvYYX7w/vuJSsKLhZZTw300AEsautWmGwPEigCpIfwxNmJSy4e6PyCZyCZjWZAw76NuBK6mlTyFS0A36YCZEq69NiOJRzEBlF5tjnRfZ5Ul1IpfRUU30h3yv6r+7+l3InubTxCgVQ0FEPCtfNzHYsYoJ0LPlAncAiXpQgxVi2NKPwQSGHQlAv34v/IQC8gFQ71A7ZO1clBfwr0OdkmDJTtO10dlvRypWalDuENdcs+wjzxMLsacA6oohdE0LXK9giBuyV/aEaG9aCqF6RZPwyZhRB2MyQc0RKYIIPSpjBmlRQBM9ElAFpsLNjWNnbQVlJuVieiiH8fvLrjWleLQrX1xTvfD1bF3PuB3MBg9aSTCaz+P+fiOMNb1znclWCL4K2tJuacp7Xj0MftaVzRHc/VQgxz4hA5lVQLemeMPwygjieDPpl1NGwiTxbveNv+nR0UPzRw3rfZg2+FZFBAuAWkzf1g0/L1g4F27eOAjIOGIrX/NkpISyka0ueJzvTEZON/oPXoxpK6eHJa1OcUGK5+GQ24nek/4RKD1ZTWaiYkrVPF2K38Nu5fsmJj5xzZ2gRno5TsUc64lAUQeh0vb4TpdDUVkBDT3vTTOhMyJFqCAGVJDCZfclgwmdD75ifCJVLkp+fBrcDttSuRxUKE4pmwUWpHOEIP1F8rEq2MncSvSeW30hI2x4ECiIOo2d/cA2YSmZbfZEHcqgvpBSJrcz/UuMPxwdBKU4CqsugrNuBBsVfA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(54906003)(110136005)(122000001)(31696002)(38100700002)(921005)(6506007)(2616005)(8936002)(66446008)(8676002)(66946007)(76116006)(66556008)(66476007)(31686004)(316002)(64756008)(186003)(91956017)(6512007)(6486002)(508600001)(4326008)(36756003)(38070700005)(5660300002)(7416002)(53546011)(2906002)(558084003)(86362001)(71200400001)(45980500001)(43740500002);
	DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXpWVHBPSTVJRDZwV2Q1M2pFTitKV1JqMHFtU21Fd1RGZjEzSllvK3lwR1kr?=
	=?utf-8?B?SXBJekV6WjRoNHpwTU5ZT2pBQlgzNE1lWm9NOG1wenU5ajRGK28vSzNTQjdS?=
	=?utf-8?B?dTJqMW50WE15Qk5QRE5EVEhIRGFYN2ZMejlPZWZ6bnpLM3U5dHloQStscjBF?=
	=?utf-8?B?b25PKzBSN2tpMGIzWElEdXJWd2JJaGNzbFFjdm9IVlhRYjV4bmh2bVJxdFZq?=
	=?utf-8?B?b29BZEdjUk85Q0Rwd3N3UmxzeVh5eGJscnI4QWhrSGZhcUthL0xmTFRFM29q?=
	=?utf-8?B?Z09FWWJwRmhnWlcyTnFFUnFERlN2T0N6YUlheFFVdzNHa0d1V3poOU9rdnVM?=
	=?utf-8?B?OUEvNmJxVzVkL0dySTIwZjIrbFFrSlFuS1p6bk9LOHJGMUIvSGRsdFFpMHpn?=
	=?utf-8?B?Rk5kSHNDUW8rZVNseTljalBuczZnY0w1THhoYkpkbG1jNCtuRzBWWVFqRFZF?=
	=?utf-8?B?dFlmbGpYK3kreGdQSHFqTzJQRTdZeHpZN0V2bHRHWnVCVFhvY0tVQ0VVS3RN?=
	=?utf-8?B?aUtOaXRDdFV4dVVzRE9MTjh1d0lWUU9jcWp0UkhpdTVGUTB3QTc5YjNqSGxF?=
	=?utf-8?B?aUo4bC9FeC9wZWZhYU4wMHpVVHBMN0YvNUNFM2U3WjU2ZGZvM3praUE5ZnEr?=
	=?utf-8?B?dUdKNnlCOWpmem1RUWx6ckFmT0laNzZMVGZnSnJ4QzlraGZQVitBVWtHd0pL?=
	=?utf-8?B?WnFGUmRNMW9NbXUxcldKajdwNDJRZnYrTldpd0QzZlZBblRVcUNRR0grbXRz?=
	=?utf-8?B?V2hnWlhjcUVBbTRvblZOZ3QyN0Zib2cxRnhuTTVSQWk2LzFORk5Va2FGazNx?=
	=?utf-8?B?UERHQVlmWnZUd1VkcjI3VVhXLy9qUW9rSy95dTVFaURubmhvRUR2RHJNankw?=
	=?utf-8?B?Q2JpYTZ3UXQvL2FsU0hZZzhmQmtySjhwd0hDUjRpRDl0ZzFqZWh4aHRaMEox?=
	=?utf-8?B?L0ZUTnhBMWtCblZ6VjdqMnE4T2s1eWowVW9FbVN6dFk1dFdzbzFRL1lGbEZE?=
	=?utf-8?B?b2RvdVFjMFpxbSttZXp4VlNBWU5CTG1MMnRIMm4xVkxwaVRpejFxTlBSV2sw?=
	=?utf-8?B?TTNIdzlRVlM5aGhQMUpGUnRIYUUxcmhBT0VKUjF0UUw3NTExWVJyZm9IMUNh?=
	=?utf-8?B?YVZiQS9RTzcxTHJTWU5IVVhLdTNzSUFWUUd2dWtFMVhraFpqbTNwckdtcm1T?=
	=?utf-8?B?b1VLUmRJdVA3czBRT2k1aTkxQy9ZM3RTczhXbFhGcEFwbDFQelJxaWtPQ3Ri?=
	=?utf-8?B?dlE2T25NN0RKak9mbzdVZlgrWGdDYlpOdnFOMCtrVzA4cXdCMllmT2xTVTNZ?=
	=?utf-8?B?aityRVVVODlSTExUSXljb1BaUFBJa3VxUElTdE1POGZDdTVJNHNvdjhJNjRp?=
	=?utf-8?B?dnE3RWJGdFRGMGVVenBRYUVUODZ2Y3ZxOUJCa3JqNVNvVXhraVhrWk1Sa2ox?=
	=?utf-8?B?aWt6ZS9nRkphWUxHbzI5STJyRlVjb25jV24wSGxwcTBsTFNDMi9sdnFyMnRo?=
	=?utf-8?B?dGExazZNVE1aNzdMbW1aSURYaDU0NHU3SUlwSzI3bDcwdzZKdlpCRUVxWkR5?=
	=?utf-8?B?TjBDYm9sQXRqaUxESzR1cWdlaFRqUm5FeGxyQ1RtZ1NvUzU2b0R0UWhVcGJM?=
	=?utf-8?B?WG5qR1NCMU9UTkpHUGpmbDNmQ1dwUiszejFsSHZMUUhoZjVveWVDTjNnWHlC?=
	=?utf-8?B?bzJuNk1rUkZjU0NiOUQ3cWFhYnEwRGVxejR6TjNDSFVDbHByOXJhQThQc0lr?=
	=?utf-8?B?NHpkSlpkM3RZTkk0dW5oQ1BDUXUwWXM2T2l5aithMVdKYjVMTDBNY1kxVktC?=
	=?utf-8?B?TFY4WVAvZmozK1lYN0dmbG9DS0pUUGlWUDhrcVpDZWVjakJBalVtTUtLUWxk?=
	=?utf-8?B?WlE5alpjSW92b1dOMWxybjBEZnJIaW1HWVVuMXdHRW1FZ1AxRDlxR0RJOTI5?=
	=?utf-8?B?MkZyVllDTld1L0dQa0xxWDc4dTlpWVlsdlRac3JvcnhUL2ZLMVVibytNa29p?=
	=?utf-8?B?bUVLc0FNN2RteGpIdnFQcVBIMjAvN1F4UXRCZGR4ZzZORjcwY0Z4c3pYeDE2?=
	=?utf-8?B?TXcxUnViNERWL2l1YUJZenBzMTFFR2RlZTZDaEZmTVZJaHhheGNoRjl5b0xt?=
	=?utf-8?B?YVlvQVRLM3l6cUtaYzZnVmxWQld5MHhPckE4SlRDWUk0YkEzYkNWdVBUdVA0?=
	=?utf-8?Q?sVw5/MjX0QyD+ZelM8xMazC+vJogGd0q8SkgYJcoC/9D?=
Content-ID: <728216C443012546948E7B66E8FB6572@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 826949be-8ff3-42dd-970c-08d9eba8803f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 08:45:18.7695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M53i3zyy9ZKJzV2SQm+PXGStGdDSJotsDny5mqo4xq4eSqwLkZvXDnE0s05MSDUqiAk67utBaFDTSVGa+RvhOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1346
X-OriginatorOrg: Nvidia.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] [PATCH 4/7] sd: remove write same support
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
> There are no more end-users of REQ_OP_WRITE_SAME left, so we can start
> deleting it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---


Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>



_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
