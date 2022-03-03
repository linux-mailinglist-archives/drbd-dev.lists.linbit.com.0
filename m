Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9320D4CC1C9
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 16:43:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6C9A24217A0;
	Thu,  3 Mar 2022 16:43:14 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 801B9421794
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 16:42:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1646322161; x=1677858161;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=OgrnFag3EP3KhGum8Ms5k9Rn6Feuf22HR4aRHVz2NkJHG8nQidYPpcG2
	6tA9kDA6wWlc53bHuL75l3pHp1VUEo64EntyJ7Wdhl7TD+YPF0GOc9Zbx
	rp3ONj1wPnyaD/nREeMx/si9RDjqiSc5UykIofW8en11AvVw05StK0P96
	pdWEfNXEqYQQE4tPMQec9mMVZO2mAwrpyXZq0MNClNOvY0Z5MpBbsvvJE
	F3Dky2ryAaoJOFWEAPKz8o7V81KPP9rVqM+3A0jwMQSzK7bbhlQ/UUd3w
	YXF+5ooorvgsCYK7A3u58Q0siZ0V+ruRr3JzaSmGDqpm7aeYvEFekU5hD g==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="194399520"
Received: from mail-bn8nam11lp2173.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.173])
	by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 23:34:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=XSAhWHAgfAw/acwvv524RZLrZMNys05kJ4Dejq7+Ob9Ipz0AuoqCyJTB5VX5STajwN8rKT0/oQOKjjcf/zMVLzdpM+R/XUw3IOYPK7T6kk0du58Ywz1cBLdaqaQyDm94Dx6dtJa/hwCapQhdejowZyPOIiAeykdinBDmNFzLCyeCDznaGz3QCmPumSeYcukRE9cellVd245r5GRPXuUTdjJxqXdrQpy1eQpPRUf+QCAhrX+QrWqjKJnFRIgocK2AosHMEFErC7M9AR8Mu2ILWiTgR716mInsLFmXRqbeOZuAs2xZQCt2cXwfu32J5LqpqWJasYvT3pFsKwCaqPxahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=YF8PJozZcd39yRf/HvH3/Oy9LMDG8PvJImuQlhGU6VaxetHjNsjgIB3YuC8uj56LMYc+rXGlj4NrZy+R50d+j8j+V9snQkxtvoxnSD0Bfenk5DmMhg3CIT7sAgghIVpSo0lJDChB/PAGOh2Ma1F25ajsP3SEP3nyb43c6Nu8QqvdeWqvLR5QCDrLUmSahLHXYl+iRlEDDPT+fie6Lpxd0t2bnGxFV8E+GH1Uo65HukH3szFt/GqQXGlIwlgacE7/tW4qDTowr4OQDeHhcLyKwgUmcU3k6DxCcZEhgy+t5JXe1Bm2RMutwkjgltGf3NezlaDEdFVlTpvvW48fDV/HuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=w3kupD+vyJ1HNFOVwdn318xLemdnACEkp7oLS4oIUqEfMQ5vuTIG3D/mqQ0kWhLO+4chPSB4OfPSB4Jet5nXasuDqL9hKJ7okO29Lno1UkjJ/1KeXc3Bz8XOtKsN4INFAgZGItE4UT/MAOecOUAXwpisMIORj0XgjcTsx/Q4/Fs=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
	by BYAPR04MB5031.namprd04.prod.outlook.com (2603:10b6:a03:41::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24;
	Thu, 3 Mar 2022 15:34:31 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::e8b1:ea93:ffce:60f6]) by
	PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::e8b1:ea93:ffce:60f6%4]) with mapi id 15.20.5038.014;
	Thu, 3 Mar 2022 15:34:30 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 3/5] block: stop using bdevname in drbd_report_io_error
Thread-Index: AQHYLvK5l13KzPyj0EKtrunNIACZMw==
Date: Thu, 3 Mar 2022 15:34:30 +0000
Message-ID: <PH0PR04MB741628FB8D41B42794A9E17F9B049@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20220303113223.326220-1-hch@lst.de>
	<20220303113223.326220-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65d82d88-764a-416b-df52-08d9fd2b4f8b
x-ms-traffictypediagnostic: BYAPR04MB5031:EE_
x-microsoft-antispam-prvs: <BYAPR04MB5031E61E51F5677AFCC886F59B049@BYAPR04MB5031.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PoLeXSZulWw6h45gcB3xQb33W2ur62umlNRwRFkWM3Q7oSbIttQTWz27xzTkzg1wvYeRNE0j+96kiD+QZmLH2QDj3rtzo9c48SGQEAbWN/RxwWkeN58u36olKgQ9NDXO+ZzudB3Paon9ApzET/RMV9O+He30WabqMZqUqcKrs6wjR2QRUX09fZGcMHN5vsr4HImEOvGkt/IWpAcx9jK8zTFF6oeaKDEpZh9vDS2YqChChF5gvee8bA486xNMQbZsWOub28dxUhLE6x7qYmiJgLStZGnMHvIS7hto4YyCvN0aDVQypDGpQX/IVv26e1n4Xpb3mBtTiIJHhX0YTZ6NOtd/YeukXugyQalBnmvgteBifndtwYSl95KWNhGOtUFIdFie7ZMyQr4YotAWNFfcW+wwoqv2ri+TTzpricCVHu+QeauSd82S5vSYJswzfvkfGZQGYoDBoK8ODi6IBgn1FkxM36k7eU1MGOFagBn8G9KwMyRLsLPI8QBaoZ8qqNHKreQQccKn00N2pK/AEP64GtYxtYzvdBFiP7YgScxI3McGU9h2eIhfeviV+x0y2K8+oODC4xGc+3kNS3FMGaeYl6/5xQMEtWNqiK0jFtJxF5qxtcQ65qtJnojVekkpdt8DRCmdGw0KjXk36iZRiE/aSXeVdra5eFIj296qjaseLNww27wGqq/PbM1nrUDiJ62BbFDzqNrjUxJ+vRtW+1Lb9g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(66556008)(66946007)(33656002)(6506007)(558084003)(54906003)(71200400001)(8676002)(76116006)(4326008)(66476007)(316002)(64756008)(66446008)(508600001)(19618925003)(110136005)(2906002)(8936002)(55016003)(91956017)(52536014)(5660300002)(4270600006)(26005)(186003)(86362001)(9686003)(38100700002)(38070700005)(82960400001)(122000001)(7696005);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l2MR7kTqXiJ4HWXTnmDoXCT4n9hcGT8l+APLXoSoHuOyXAy87162zQQtd4ur?=
	=?us-ascii?Q?eWoOIsBGrClhwOia4C4NHPZ0k7HM9foRQ0D1vJr48I1M6e5vJd8YYLo5B49V?=
	=?us-ascii?Q?Y55hAyVXFr+Qu8Q24u4oNdz/UbZFJYsBTBCDJCjNA5UjEsiaHSbfmI4IR/19?=
	=?us-ascii?Q?EJg/36HrjDP+79ayl9ubn8wHrig1ZuCyU2JuaJYgEk4FnWcEPCk6rK97mafy?=
	=?us-ascii?Q?o8ChjIZ5Lfdcl9wDjLlHZfthb9EgFG1wq36V3dUfQVv5PmuJhBg2vIXA9+MY?=
	=?us-ascii?Q?Snm8BltANtgmammO/m4BJLLgNaB/m6lo5uA05nU24UY0NQc+wXDBbrWBUxid?=
	=?us-ascii?Q?m34GUgNyGqug7+47IUJ7XSpSQo4A3Y/+mf8mqHGNH9nSZjwbp2M65k8KGVey?=
	=?us-ascii?Q?JN3FOw099eRtNcsQXJuufFNprnaBVdvhFz4jBpf2DdC6PKKCqNkX18vONRzD?=
	=?us-ascii?Q?fco2lGtBvLV28ETK3glb6mT+UTA2a4zQYiI25Zzw9K7n4jQWqPGsBWWJEh/C?=
	=?us-ascii?Q?WQtk2A4TYnOIjusiNjchVZDKl9zVaiRFNisI6ZOW1fq2go2QbElfarz87gjT?=
	=?us-ascii?Q?zTfIHHICXXRlw0g3uqOOT05R2BzJzmZikTSvn/KKt5dh9gPTQ5yPmlP7u2hU?=
	=?us-ascii?Q?zpoqrFV4JfRhIWBjHULKCSJrXdTV76n6IE66oaykhYe6dZZ0ljxE1bETL5ev?=
	=?us-ascii?Q?SHoXCbrRTaWBUNiABHztbOwg92H2zF9tfYUMahSPhlNznx5WfhR5S7oUr9d9?=
	=?us-ascii?Q?MK1ykeYGMYhbS5GAj/eVc0MgJ6dOrYMg0ZlWN4vLPCJOIEeMVowRf6XKlQ4g?=
	=?us-ascii?Q?tgOjCOeqV9Ci0TdWYW39FJqvEBJAvRlA9fs++uKQwIwZPYUPlQG3eFC+MLAH?=
	=?us-ascii?Q?ZNXEtU6+emPfpyZnxvqb3a9xWmxT61+mgn6Pi5oLXgJJVHBhbHxwAaL0CmHR?=
	=?us-ascii?Q?qyOWdiG5H3JXX10518mgw0OalVfUJxa8Mrws92vqhUdY7aCwbBf8aiULh5gH?=
	=?us-ascii?Q?wl5A7wHg0maws7svz/1bfpw0MIfaO4yGiaSrNhLJTgH3gw9rUxeT/pEd3IeY?=
	=?us-ascii?Q?9MwCAwR1JUX3xkm6dwZ6FZ+OQ2cqXqYvAO8oxUf9ENptH20dEh6r4lhqv0TB?=
	=?us-ascii?Q?bGlktUyrUrwAg1P7RHPL6Rhw1WkGIZ/5FVSbVskREC3Q3rnvuxFGIEt2x8VT?=
	=?us-ascii?Q?5MGdi888wNPlNvnNLidQDnWj/UiL1WW6SF540bC4o8wpamdnoPzsMPBAbNl/?=
	=?us-ascii?Q?vAaoTWSMwZrWk6U+xds8+XccF7oui97SM9oiJHKAQ8CHL8Zb0NXFQHK4+YxM?=
	=?us-ascii?Q?eEbMuGKnszhK/UZ5nEoxwmmYkMt8Yol059FU8k2mz87j1CNxyefku8deAQQz?=
	=?us-ascii?Q?abs+K7r0mOYrfDuA08r+Pq6bh0B2PDD8bjFWwjkf9AQDjlx+wr8W5ClmBvF5?=
	=?us-ascii?Q?7U/SMh6W5PqLUDxyw6bx0ZfGQX4JlWREtceytzjgd3OQq6ew0H/MAtaiuKGf?=
	=?us-ascii?Q?sbiWI/r9+vcIBISDzYMgfejn2x4dctWHTp+8v6DOwxD79jc+ZByc9SEZT3Eh?=
	=?us-ascii?Q?no6PVi0YCBVQyChRwCvgKUHpvsZM9Of9cDMwM8B7QN0Imq3hi7BIqES84Z37?=
	=?us-ascii?Q?BzjnrXjBbXBGwh4yVFX0wRGm+3X3cWvD/MXQiWki0bSRcxesrKACK2Me8Jld?=
	=?us-ascii?Q?QR0Z8JJzlDWcM3Qb8kzvS/6dAL0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d82d88-764a-416b-df52-08d9fd2b4f8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 15:34:30.8217 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZCr8TWYWcOp1KW3c4bY96g/VNgJB0urUDssmDxpirv14IS15NIMossLfI1DGQBy+7XA+5rXhEFMrMpInMMIHg5VezFDG9T2BxFvwPOOIJOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5031
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-security-module@vger.kernel.org"
	<linux-security-module@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [Drbd-dev] [PATCH 3/5] block: stop using bdevname in
	drbd_report_io_error
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
