Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E984CC1C4
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 16:42:44 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2074D421798;
	Thu,  3 Mar 2022 16:42:43 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 533 seconds by postgrey-1.31 at mail19;
	Thu, 03 Mar 2022 16:42:41 CET
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A6E55421794
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 16:42:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1646322161; x=1677858161;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=CWu+FvsC6c5BcyLPY9zKC5zOgBLfu3dZhkrrdahBOGJb3h1dyGdbgkRG
	GcIe4iXhvsc415zdm1rHkClBxfHR46FyrTBNPvDf6dlsvWfgtOR/BydSk
	wIBxy8dLTzLGxSVctEe2DUv363Co+8+f+HoZFYqIU2mRRkcVENJ8m99jY
	CJIOgo4FwMrG7yIxLwQc9Y5+At0mvECAMzAaWz7a1qK36/UOF31v2ecmD
	dJaeq46IX3VxCj3pEbgwzfcphXcVab/iD7G9SodZl1GVhMmpPZheoqdNv
	hNB95Vf5Q00eYp7PY7Z+JBhnPMr7fkys1EhzJvVqS++ujQyRPdLjE0m5d Q==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="194399479"
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
	by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 23:33:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=dccVaKw3keLH28gKK897WQsD9JwNkveCY13jmWDEdq/Z38epaJUm+8akG1d29mpEInibmygUNmBZV2qCay7C5nWYMLYXHG1oJooIQVJZ5UOcGyaFE7BP0D+MkQI79edWv2PAlgjkIuDd4koUqLOTqOu1TLKvPtZ+iikSEzYHh4r5K16KrxVxYa9T5HaT5VHNmGUj8w2LeELL3QIyZoAnvrpN7A7e83o7VDcgOrc9DMwYLMZ8twI5iFX7AitpVIGBUAzY9Ltm6dRTnMdARuxwaPNF2UMPn1WGjeC9el1oPi44K2wc9u0wYFuKDDxmbsLcnKR0UUIN0yNXum4NprBBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=QJbBystqoGc0LNkhu+S2i2i+eOCN1VejkZFqGBYoIWvn/nrXczx/VuC7hdCVJKnza756HCuOM32UvNM9mm+COePCvu4cMfBdVi4aJC2RMqZKhn8wp7rgBMUWTdXyFfEV5X5dvjlx19V/jjs1m4h6c6rLXNMrV8NEd6gA22CKglufowpvXBUaorNxZWqA5ZSCjpjGf5qIPwAAcMeCZIF0S7MAC5++wsccdWrOuYtD7W+c2Va3Umvigd1B1wPEFWJstvvlfcdiF1mhbW+/3nPmMyUUKv/XPrzXrz6mNn8ODEqmxq26F41aV7RdzrLWQ/yLSgDYhdNTCY6udiQ6QMXsFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=rk5CahfOlhGKWik1USS7Ek+3EmVPsYZis886xqIQCgoYoZVnSxVEX44m7vWdMizfCk1KJrOlVw1BQo2mRzgA09zRbSFUeTF5c452zRxgei1arJR/0I02aIArzdsHmKYA5r2MK7A++kmB7qwlkFI2lnko6vfFOiPg6Wx0zk5MjuY=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
	by MWHPR0401MB3546.namprd04.prod.outlook.com (2603:10b6:301:80::36)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14;
	Thu, 3 Mar 2022 15:33:43 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::e8b1:ea93:ffce:60f6]) by
	PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::e8b1:ea93:ffce:60f6%4]) with mapi id 15.20.5038.014;
	Thu, 3 Mar 2022 15:33:43 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 1/5] block: stop using bdevname in bdev_write_inode
Thread-Index: AQHYLvK7ebT4l4YllEioY1XGjW21GA==
Date: Thu, 3 Mar 2022 15:33:42 +0000
Message-ID: <PH0PR04MB74166E447F589AE236C6F4B89B049@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20220303113223.326220-1-hch@lst.de>
	<20220303113223.326220-2-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 217b0d87-5d31-4062-3d8c-08d9fd2b3306
x-ms-traffictypediagnostic: MWHPR0401MB3546:EE_
x-microsoft-antispam-prvs: <MWHPR0401MB35465C65A6D89FEE078C615D9B049@MWHPR0401MB3546.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cBAvDQxl5rIW9YmliXVobghhbjt+JQoiTJynBBSwzb+Bo3432w7ftow8qmZ4Fu7oGShKbnkqjuqmwErwrNarLu2i8zaPzUomYvuxTrCVHLTkTo0DYJ8Si2Qcwxk1mlCQhO/yWEisIyvOGa2emY6yCBIfT0tj1tTi4p7Y8pTi+1S4hy128bXha6bSy4orNxJNx6UD6XD8z+Z9SFfJDsbiZ100OsPRbkfVGoacUydMZQ11DN251GxL873kgco4eBvIfRPMbHsz5a4MsWcJofnsBb+xnURP+uKAKMbfkPx8HtbVpBq1dYatlZYsIBSc0OAI3kn9XGW8Vj0M9Zc/lGQgLBmTAOoRDP6t9b5ROyGy9zxgPdVcBUeF801shMbFLtSLT4nEPAxh+/lfvANZ13/B8dIKXDNMg2cizbglTPQi+hNew6AZj2HXSTDJinAGYqnlEUwQiNMirzBjOMYrJP1nwokiqhuO0f/uz9jgHijHzo7WzdvY4C1RY3TQQAtGYVRyJJFFvNQUlj7TVROKlBE23atIabLhKk5vkVmgalXrZJWesxBKYZSU65SUeWAeZdD3lOMUR7K5+QpHovl2IheiHz8XpGFuu6LlvlzYujZNBa94WNwNYSafXR/SuG44Iz83YykOQ3d2ucV4ONqejfDTQVCjJnCbQQ0a6avkqpsV/Le+v49sz1Fn816nbAekocfQNXvyc1AVNvm3hJx4+gC0oQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(122000001)(8676002)(66946007)(66476007)(558084003)(6506007)(9686003)(7696005)(66556008)(64756008)(38100700002)(66446008)(82960400001)(55016003)(4326008)(33656002)(5660300002)(19618925003)(26005)(71200400001)(186003)(76116006)(4270600006)(110136005)(316002)(91956017)(38070700005)(508600001)(52536014)(54906003)(2906002)(8936002)(86362001);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j2JD6XHdvjPiBitB9igwIQbjFpJI6OT4QE9xHkWL9Pw3suG5WPbJdzjEdbBD?=
	=?us-ascii?Q?kZVbRP1eHsxOTLdhLDTsJDSlRTaxba9CRe5ypp3do4ETgHZ9XtgTbf10JeJg?=
	=?us-ascii?Q?qZXl808LuKqYiG9iDMqq5w1DRT6jHpJcH6d87LG2GeYbeBxFZeA1SAUFuCMg?=
	=?us-ascii?Q?INY4KtFboOxiTpUMggoYldXgGr47KR0vTiVDIufEYDib2g61T3niaB0wClkl?=
	=?us-ascii?Q?a7l4A0MvgEQePLPcF+4pMxBfJWwVNtVkNqar5btRVHbqehtEjoEujY99SmpB?=
	=?us-ascii?Q?La5vAAv96BzrwtfTlO20NGhjUFu3EyBOVQD7UBRPtOQOG8CiJ25RIiOcg2e8?=
	=?us-ascii?Q?21z5s0LfgWPT5bqAHs0oATASIBc1Fuz9fF0mraQPj3hntnpJ3RsEDvMYRgKE?=
	=?us-ascii?Q?0jOB8apMyY/Z2cGb97m2Cri1ncqNtnR7SqMNMccRMXKJTBeRdEZey3mqzP51?=
	=?us-ascii?Q?QvkSaCv6OrXY9H/M/uazEbfvQqQnRwB1T6/3cxPC0sBWBKtxuOd7lPNEi4FO?=
	=?us-ascii?Q?pkC4pqMhCJK1hrQAE9maOVadaibwRIhVJOBLNuleBCZrJEXVcQjFzS5OWsWd?=
	=?us-ascii?Q?oFyj249ubRmXrUBzAJWtNUrWBXVq5OQ1rcb8z3ln2/SOJHnElHmcaZMRGeDZ?=
	=?us-ascii?Q?ud22Mvr5WISZrBePQ3l8zzkYM7xtlYGHSTpnPFOLLA7o/H+ypBVRtKX0XVBM?=
	=?us-ascii?Q?+whEwC82CquYy3AOY25OZqHGnM3AH8cZj9BMUE7Vutt1w5yxBIGw/B5Vy1br?=
	=?us-ascii?Q?OZRSVx3v99E+ZgoBmvtkU/P2YKL0JCeUnlta9HjOuqJRIep2noODKGcfhBrq?=
	=?us-ascii?Q?E6e+vfaWyPv30H1bLa81MAjv7bWVS+FCIjL7DNhY61ix9vhiy9PZD87U6WaB?=
	=?us-ascii?Q?4/xkOdrW3EsDfkPfxTbgc73ugJx+qLf8IwSWgogQI7J4ysnZfYHx89Hq89a2?=
	=?us-ascii?Q?4Ty5Eek4lPQxJh8zE3krtq62pp4bZouQzY5nH/u3s29OZ+XO1PWxjqXzKTri?=
	=?us-ascii?Q?49sS0BwcLYt8QUT6tX0SVpl++UHfXqiS3iAQuVJLVMP7RuOzN+icbV1zejbw?=
	=?us-ascii?Q?fspwqu98N5/0nQlIfuMGwUcCLSxU/wwSzecDREccg1KAReOPa29/W173OMbi?=
	=?us-ascii?Q?q3l6U2V/Kl2a7gjTlUU8GJV4+27CzibsjNXLREe6tboMneiOyZACHgp39HJY?=
	=?us-ascii?Q?Aqgr6YVKHemWxkASFB/vRkBBUStgj0JzPgHNWFNCPzJwnBtvug+mqXyq+ruK?=
	=?us-ascii?Q?k8hsaPiokB6B57zEDowuqBA3fwSMJ4Rl8tkmfHX1nlD+1HvgAls0ns9Tgv9D?=
	=?us-ascii?Q?aqy3z0Gz+Px0Fjwtf3WIS68gPrJypn0VHWkiyxE7ODxpTPcLyHl2VLhcnQMc?=
	=?us-ascii?Q?DqIi0Daeeu+lvWiXPdZPPLU/HogtQk/p5xX4JO7EJsG6l5DpKFDnetvn99J8?=
	=?us-ascii?Q?c1Kr3zKW72XrnXmMv//UE316Bc6E2VqWRM8BeX/Vucj9Gk9G+MhVV4ytdLuU?=
	=?us-ascii?Q?tLbIknCexBTDPoZsWfrrGUJuwAYVXyUrYaYcPvW2P4vgwMzEV8SuQtk26U5n?=
	=?us-ascii?Q?5nx7y6hvIx5HcZET1C/cZp7tZnEYWM0mq8DnGMu1uOTHots5prAiE+h7lJw3?=
	=?us-ascii?Q?hclmbsnO5R+bEhm1qVzNdFjsyroyCIKpBiMOENo5vecMc8otAopyfXUOV2DR?=
	=?us-ascii?Q?ov9ISG7rTPzuHdsNdCDggr5J3mc=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 217b0d87-5d31-4062-3d8c-08d9fd2b3306
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 15:33:42.9541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fvC59mXSSbUNcaChR1Pgz2aRp5Fk5JKue0Ji1m5m1R0BeLn4KXVJXGhbhCiIu097lf72guCigok1Lg2UvIl/RONJJa7Ywi2OmAr4GzrdCOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0401MB3546
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-security-module@vger.kernel.org"
	<linux-security-module@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [Drbd-dev] [PATCH 1/5] block: stop using bdevname in
	bdev_write_inode
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
