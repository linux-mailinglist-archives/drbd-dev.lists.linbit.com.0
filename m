Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF724CC1DC
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 16:43:43 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9CD884217A1;
	Thu,  3 Mar 2022 16:43:43 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5927A4217A6
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 16:42:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1646322162; x=1677858162;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=auzvADbDBs3cswU8MW5kADQ+QCmnz1LJR8Ze68o1SdKDlssK5qfe/Zrq
	V6PrTSoz6UfeomEefL5O2CvDSNg+s8n+/l1AhDBoYDRFUF1U9elLnIzFM
	POLH0Xj1PlJmiOdrx+O/X/OdYJDiMs0jpAFp33YWfSC2O1Vkuk9EkIbiI
	mQZEivYCtwY0Ov225+6Wg0BT1ANROQHRA91+JmkdGTD0kqJBO4Ih3YX7A
	H3E6FXOoUK0a1Msay/lizcZTotXtrKmbN4Z/PBvTU5dmz0bE73awFDUvS
	MnawUhbg1fN/1LFEJrL1KWdfSIgANs569bkigopgRXG+sa+WTji44f3Cf A==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="194399541"
Received: from mail-bn8nam11lp2176.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.176])
	by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 23:34:48 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=fD6XcBMswRGj7ZYJTtYSuv2ehddRkNyhjAH19mmsnbH4kgi3DIDUeSXDIaOSBX4IEfuHRYcjgm7Zq1cI3/tZOAAzcxK2z8c3aU+xLnY2Lkjpl+BF1sHR9xUG1gEt2ikm5oDVydGd2rcAIRXFVlA21BvIGqikqiL5Y+A1w4pyPwZ37Yf3cv3zhYeXz0hQ2dAvXDx2SfHke2/llNACxFf0zhjB62mRuca0I8UC0ZFiM084LhoIGEWYg1NU483yiNlMqgZyK4kYQSy/W6YNI3Ec2Q3eS4CjoUQWRmJ/r52V+Ilg4jB3TNKIP0Qhraome6lVp4W0sbErxjGRXYKJtjSPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=DwVouKYruQDAmsDBIGxD+x0YMS7mH01i06yvJD8gdXXn2/Mue7OICR/gCZ16tpx+K4FtbffQNnvSPykWzyJyTeYIUpC3DCO4hQeATu77DORutwMSrRNJtHHtqEk2maPExx+mvpbnV5moEBn2fbhnt2TuYnDGvyQubJnt4QS9EpEbU/O6i/Ubu82AxyzpG2q1GH5B5WUOYat+mM5aygu2d7K1gPmZ1xelJCgqKKWLYAT+cHOKpB+8jCJxPIfFGyqpJJLFki7RohGQb+/Ev9Jt/2fXH9Xe87V0uglmbmHUDTY3cB8mGnOCoYqEbnK8VRj47++crmPbLzViU9lgTkq1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=J+VvbkD7/eFMaPULxKzLQP+Dx46REbZFNNLxLlGaQWuufD3Uk8U4UJHAKNg3ITTTbiydC36FzTJ1RijJQKERKcLDwjAipBV3/tntNMfzzobu5f6X2n/yiabu6wW5Hp28AfkWUqCj9gX48hOb98iF2hfDo5gczv9fhFhHgiV9ivo=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
	by BYAPR04MB5031.namprd04.prod.outlook.com (2603:10b6:a03:41::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24;
	Thu, 3 Mar 2022 15:34:48 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::e8b1:ea93:ffce:60f6]) by
	PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::e8b1:ea93:ffce:60f6%4]) with mapi id 15.20.5038.014;
	Thu, 3 Mar 2022 15:34:48 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 4/5] pktcdvd: stop using bdevname
Thread-Index: AQHYLvK3CYbi4VLS2kOTk5Zhn7vCAA==
Date: Thu, 3 Mar 2022 15:34:48 +0000
Message-ID: <PH0PR04MB7416CE3ED4D133A687C36F939B049@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20220303113223.326220-1-hch@lst.de>
	<20220303113223.326220-5-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4b8841a-070c-4a48-a5db-08d9fd2b59e0
x-ms-traffictypediagnostic: BYAPR04MB5031:EE_
x-microsoft-antispam-prvs: <BYAPR04MB5031383363B88989021D9E319B049@BYAPR04MB5031.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QTMqdGY3jdRjCxRGqhizh+T81djSVIKvN7ECjGblqPezLT3auv5gLj+UW83sROSDd/W4MucQH6YjlPc7jnxsanO+CXB9bMw9UFajXjCa3VEC4Tx2GgZ035B21G01ejAB34f7Q21RnsPpM0xTUW8R3fE2naVGGXIIm4FBslwz7dNodDWU54Z1vf7MK02npQYH7pdcU+k2DEKX3N0wsgCkxItlqGSfjYHOYkC/R++dinTewZYCuLcCgkXgChp+DtmuA4Y/3UC97aXASAv5TVlcLwpSpoVWasUZir2AAy1ObAhg8ZDRAOAGnKMwye1nor/eTxKUZADqB91MGJaJG0yAUjQO9T4D8M9/8WBQ3XemJ9KRkJeApFhoGNGqvGK3F+dw39SF7jpgWeIQbYMS9F7Pq2yzO1sCvb/N7pJjBUdhh8B9X+7g926Sa/bU+J9lM5RbPPgVaf2FV/5odNUIKJB5AJd7dfzapC8WGRiIaSI4QqHZ8XIVCTcI9hyT+8bJlhyoBV075W97Z+qAOcn2vNq6P6KlZJJM6M+LSje3cJWUXdlZxcLslZwFeS42UQlWZg3bip5IsOcpTjigsuee+t7w5HjIg7t56APo7C/P10bYDf/u7rTNsOqjoXIMRn6Vs2UupVjXrHIpWnUBAByCCfXhf+3Bhky1XHTBan8lVIGnPAGaYLYSHVYeLAzsYyAvroaKLEWznTMnDSs0AhMqcbPAxuJfMm0E+QBSSqABa/qzsEU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(66556008)(66946007)(33656002)(6506007)(558084003)(54906003)(71200400001)(8676002)(76116006)(4326008)(66476007)(316002)(64756008)(66446008)(508600001)(19618925003)(110136005)(2906002)(8936002)(55016003)(91956017)(52536014)(5660300002)(4270600006)(26005)(186003)(86362001)(9686003)(38100700002)(38070700005)(82960400001)(122000001)(7696005)(133343001);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?45Rjic55TjZ1Iom42AOZGyWZis/6cxRKAOIiApaGjoSx9xT6NSkL6iN1Gp1b?=
	=?us-ascii?Q?lLg3syNSSKFqCRl58TvQ2R7+3RGKkNQOpPk0HqrLhmPtY6goX9F0gjy2T6aS?=
	=?us-ascii?Q?Q9CK2sq4EKjqTDOYHvXuj8UERx4hb6QW2NxGS1iIiuZ1RW41RqfHXeVhmrNU?=
	=?us-ascii?Q?F+58dZkJe2ACNW2j8fTMw3g3j5Nb2GHiI/6M9PUf/1rIZGtvjRl/jrKU3LqV?=
	=?us-ascii?Q?mh5q/x3xmmzIZNOg1QPR9/qsqdVTDEy9s+YJMr8x1jzy3O+fMsjr1JJC5Qxr?=
	=?us-ascii?Q?e+Fv+78fUKt64PKu9OtUaz+MkeM9QADoqNyrDW7c85Zr9RtVQh2uGGNCrVyD?=
	=?us-ascii?Q?0WooRfatsZeuNjDPZjpE7NwP1yifCYGDUtOinaXGyj5vN11YOl3CwmD0uh+6?=
	=?us-ascii?Q?heHaGS0Qzvhgu4ITVOOY40O+T/KoSJTto1bVDNAw5bFguqwPrPHVtwbKGlfq?=
	=?us-ascii?Q?FhvMal2NzFKTYbDESK29gpBySqkfoUyE327pE3d9UzPsdiHKZUAcAvNfIWp3?=
	=?us-ascii?Q?W56H4SQy3DY5Zs4G2KXfzG2rK4fJLAAzV0dxCc1O5rxGHDAX+UfbIT4OPtWx?=
	=?us-ascii?Q?WCr+Ik7nt42ZauXQyLaJIMlPvyreziSubMimjWGBx2xkxr7RAQ9iSavSpB5Q?=
	=?us-ascii?Q?qJRPh+xUk1tMl+01Pijp2Uoo6YItGW/wFg8JWWZeil06L8Rtc0xshdeo5noE?=
	=?us-ascii?Q?IlbJcMG8pLOMvhVXbIlHeQaO0/lnI0TAhEncNB4niIjaYZ5egd1MCb7zwo2Z?=
	=?us-ascii?Q?9AelvD43pscQe46MmrG7BXQp+dFWklbgzEvXKknQ6DJfks6kjuWtNX/xuyxb?=
	=?us-ascii?Q?njgf04hUssTuvGDd/G9LigVAlbaSfEcXGa+77MzCaNQzOxaVXbqy8qV93Ld3?=
	=?us-ascii?Q?Zg6gOlJ8SJah9LdWXzif5Hsu+Wh2okjwwGrBbVqV6DuXjtSWZR4xwTdEd2PL?=
	=?us-ascii?Q?cSraGYXWwMDKpYyq1rQmM3OwDbvZFGRa9f2yi8wmmfuJTZBdzK/MNdk8gnDk?=
	=?us-ascii?Q?V4+BeHnoKZlaKNKa9Sn6nT8c8pJ8YnsI5Zw+roOSuANHZR2pe92ssdwV/4Lz?=
	=?us-ascii?Q?voKERWVCPt0C1Ei8MOItZjAIq4J5Moy4uR4+pQUItQdEMxay0GnaeQ3dnjdS?=
	=?us-ascii?Q?9jxhpk2h0GiusiHgEt+TfFUpeM19iqTETxj/SBz0Rrx+gPWgAc1QA5dZGjHO?=
	=?us-ascii?Q?Dbg6IdTy4bNMV8kkWHbKkYIYT+GSwZvx9zbRID2ufsLFFAwzMcWYbb3ihzYl?=
	=?us-ascii?Q?LT5aE5FDM0ufE74utyA94MVK2306l4GrNRtPPFXIqjg1SsePwBT9RmoWEF0s?=
	=?us-ascii?Q?mD9/5bcCQijrNox/yWrOsCP7m+I8AMWUg9BJA73QplkYi99SAWx8GaTQDbZX?=
	=?us-ascii?Q?jBjFjAixpDvr4hoRgTxh6oMwgQ+NfBbQEV2lEGaDW5PoJBP4EuubMy1jgx77?=
	=?us-ascii?Q?qS4pHJw0bygEeg6GDPxS+h4Xzlzig+b9Jr8hmDkXzGJQmV3RwduMFX7O6nKD?=
	=?us-ascii?Q?mFOFofmvY0E14G5SBwGpuL1mfqZ9ByfWML5qaZ9YzKT6BU34c+8jDB89mZ1k?=
	=?us-ascii?Q?ctwFoSZ1bC72KrD0FvpGJ6CwzLAXGj/YGaPQ60ShuoShdfAS/q0amCbvFoLw?=
	=?us-ascii?Q?SiwExWaLAEkiW+0ZQm/mhreHYx48cC6sIrEsv9whvk3/6upkIPZCiCntByyd?=
	=?us-ascii?Q?ldXP3LUrWE1oF2B/OS80QAj0jqg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b8841a-070c-4a48-a5db-08d9fd2b59e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 15:34:48.1389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8nwCk1CF+AjQXk0ydKJskLjrWIhVBXRxbl9xU8kWQnbgeFIMNc9KepiJbYDbavo2HbwoE2Xh+0TpJeklAumIcBLZ5NTg3/1jZLDKvYy8Daw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5031
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-security-module@vger.kernel.org"
	<linux-security-module@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [Drbd-dev] [PATCH 4/5] pktcdvd: stop using bdevname
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

Looks good,
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
