Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F16814CC1DE
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 16:44:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D856342179F;
	Thu,  3 Mar 2022 16:44:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3168542179F
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 16:42:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1646322163; x=1677858163;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=TOu+Sr2uU9ch5Iz5ogaqTgVcGjqWHNJ8VTEcyqVIzvf3JJBx0UjHgH4G
	KKBDb4dxXJKbzOTdyp4jggZYYHSTVRvwFuK44rg2sRAjBdXLABANtu+Mh
	iAzDNLTGK8SNVadvsL+dyUCvLFj1ZQxg8xS3FHDGprVzqYc43Zw0oij05
	ppJbsgZCfhfJEnflQAfqEy59dD9is+VwTTyZ2154h0XWYcXk5DnaUG0Hw
	YQKKPGK6sMI5LeJ7o9PbYirEKOlxQqU+q5ZhI8byJj+UqhbRxZT1SMZ94
	xVSa02bzw1lX0plVbvnrdTbm0yCI/XO2S57HD1Jr/qN4Wche/Tb68vXgu w==;
X-IronPort-AV: E=Sophos;i="5.90,151,1643644800"; d="scan'208";a="194399567"
Received: from mail-bn8nam11lp2176.outbound.protection.outlook.com (HELO
	NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.176])
	by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2022 23:35:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=DDZsr0aeZiSzW3SQBfOSZb7FIxrpD+EmEQZlL+M0R3rdc2jQX0IwlwJ4c9u0swct5fiLT7zkvZyx+oDTlntMwqkv4VQmxdFubmeekuxn8ke5mps4Xhl9GAIzQr6+9gKqKKbEK41epEkDCmJ/seULxWb0zapz+EJ0pWRblyLRX/i8B9/CwvhNjarxO26jyawLFS9cvfnq2zB3Pct61KJX9L5vh4z9ZF+zGCzJ414tIVfmHE0gG6h+F8PkH0J3cad0NLQTV7CfRTcL1OfwMAkGqgxQSzDJP1YNjorO2cGdLAe1fjK0JU2tCdUuFXE74ikw60Ni6B0bm10O5N9NIMyGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=mxWjVAOPbktTPuZ55wueUjrWBLIzJKkrhBuD7+CRRu8ilco7pZJwTCD5VBOHsQZ4a7GC/55i5SESFPH803UVRbTehfF6nj2qDWU8Z2joRKsfL3ZJMPNxcqOWqDB4LHwclz52vGysgnLoVsez7oBkyKr/Li/FK+CyITYH17zH18vaTqlrXZDSd6AGMDhnV1NPNpInhKBKt20WHR+uwQZChBAr2WICqkhCcQArhVpX+PD3/uoMDveePa9/3RfAQtntP51tbS2CxkCfrIeat9rWgptyALTa754nyYsqojP7lcMIQcFNoRlTltlTfLoJfI/ZvJ4oHaio85osX7Ln0bXFSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=VUW+9OpfPNccYubRdJaxDWPCWco+rj7xGgCfo00zjxn5i32XRnVcvwBMyFV8WWmHLCPakBZw0I7GgrdYHInZWxyZNZM1VF81pWFwSiE2V3bxeD3ENmn7pNkrJEv9XRWZCZUYVNCIaK8BwUaGY3Zw8+IlfPcnV1glKQ0xIPtJmeE=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
	by BYAPR04MB5031.namprd04.prod.outlook.com (2603:10b6:a03:41::19)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.24;
	Thu, 3 Mar 2022 15:35:01 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::e8b1:ea93:ffce:60f6]) by
	PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::e8b1:ea93:ffce:60f6%4]) with mapi id 15.20.5038.014;
	Thu, 3 Mar 2022 15:35:01 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 5/5] loadpin: stop using bdevname
Thread-Index: AQHYLvK6NVPy64Eup0+y/tCbfkm9Cg==
Date: Thu, 3 Mar 2022 15:35:00 +0000
Message-ID: <PH0PR04MB74160783BD9A583B6C64C3D59B049@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20220303113223.326220-1-hch@lst.de>
	<20220303113223.326220-6-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89cdff9c-19f6-4cc6-4422-08d9fd2b617d
x-ms-traffictypediagnostic: BYAPR04MB5031:EE_
x-microsoft-antispam-prvs: <BYAPR04MB503112C6160B858B3F41DD1B9B049@BYAPR04MB5031.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c7aSxmFwjRhbQWqRyZViRsWPqbbk091snvzi905tVUgG4pIU3gI1iR2s45vUktvkqDj2WiGXtet/AVH5/gVW7apRz6olqlWC2D2bulZ/0pT0n2M2RmuZ9Nv9/uOrgx6x0o4puY/uXCDO9v9qiWn54bfJS+TFyLK797mfGYM7uAwngxw8Iul7GcG50wsss4MmC3QDLCTYMj2J3ez8y1am3owpjL9wP/n2WEPwEoy0GI1RLQ1KawE/ooqN7xtHjFwpwbg6Dxbowf/8D1QjlFQ21wQdAWVz1T65+7vLVMjjXgLje8IeNfJPx2pw5tlkG5NO05OqRbVy+uKopGqgp5xRwb7ucE0rE1O0kyEeQEmr9pk2tbJfF4m53+pFIeiWzwcc7idVr73mZOtw2+9wpFbBEbeNbn8Q+FONUs11aH/vErpFPViQw0P4VY4F5dvGqkCL3JwktDAKq5QZsi3GUlesrewJ1hTnSAAn0Uu3ejofmrbsvQCf74ojTz5/bXFEVaaakXtxmWdXhtjskMMcLPBNdAJq8Krr+oKKFD4MYM019cexAkd5IR/LQDOwxOgco+4LsVd83HmNN80+ejxpSghvPA8QiQC0Y/djYkgDSRVZYK9Go2ykiu/bRUYob+T9Ci5g2DGX781Ne4FQRZEA5QNN3AukaTGUMG2RshWJtqty+TW72EdqcOrqp1up1ucDhWkbs62+BWdAJVIvOXZzCiTLag==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230001)(4636009)(366004)(66556008)(66946007)(33656002)(6506007)(558084003)(54906003)(71200400001)(8676002)(76116006)(4326008)(66476007)(316002)(64756008)(66446008)(508600001)(19618925003)(110136005)(2906002)(8936002)(55016003)(91956017)(52536014)(5660300002)(4270600006)(26005)(186003)(86362001)(9686003)(38100700002)(38070700005)(82960400001)(122000001)(7696005);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qwBK+Fpi0/gUXOeWPF6+26HaKuN5yhawRjdjub0+nXAOI/5XZDwrCYbcRSHM?=
	=?us-ascii?Q?kOVwhoNlpdjr5sWgHVIqdBfv3kJrK1RdcOY0mEQtsp6una1YabLnw/vA4VU+?=
	=?us-ascii?Q?pZPcztipXuMHsYmM/IjhUmc45RrccPC+TUdw6H6jdyQhLoj0EgyZdixfuxus?=
	=?us-ascii?Q?VDi98Tq4gJ8W/SgYl7011HN8KQ/2/hQhH8ZbiASemcaIb5eUQb3b3t0kSxD4?=
	=?us-ascii?Q?jTzbxz5gCy+K6fwObNmKdOBwo5PO9lR7wavhSj+C5XTdvz3L3eqno82EUTCD?=
	=?us-ascii?Q?YShI/J9tt5Wob9ayVt2TiB9teNen8vU26uZfnKXrO6Qg2yLNLLw8V1lyF7dd?=
	=?us-ascii?Q?36ouNY58g7n/JlA+83zvxVtT6+wx8u9JZ6/uKukDc9Rcg5dkf6c5v2zTQnST?=
	=?us-ascii?Q?5BBjlalj1jBv1jqSbdMvCKY7/FyaXbc1DVe2zU5cGLWd4I8L3Xhfta0ZrvGz?=
	=?us-ascii?Q?YSTMHL2mAqLmBfYfbFWnTm8FBDQP0lWcS2IF+pUyE0hZ3nPUerWUdx4jMETQ?=
	=?us-ascii?Q?khTTGVRBDdcUiXuhvqRicAkaHbtNJBfCRuXI0VBcBDS4MetV3Lyb9NDaSP/c?=
	=?us-ascii?Q?azkXmvX8KZeUydjE2rPttkKJowGwc0uQWc1RQ5/5JSgpDdI2W7w/0VmI+B0I?=
	=?us-ascii?Q?91mjwrMyB7AKh7gxa5um+BErD4fs3HURre+fLAD7XBGL5LOBIN2qKEQhg/Sa?=
	=?us-ascii?Q?bsXDvbHXGPC0QoO6bk104/6Dtmpi6EO/qx6v3o+Wc3d5g43i3z9HlBpKCuA1?=
	=?us-ascii?Q?kMZsIBKAmhG8e6JLpGZ6FRJYCxVIjPX+kCs9Y6W6uTfktnTOZLbq71GZNETa?=
	=?us-ascii?Q?t/fOlTygrCD/q6FR1KmQrvUYUyZQZgn/3kXcBNKYbOTyBEUYupEtWECxDr7h?=
	=?us-ascii?Q?ywP59TZp2tI0IIk3SWR7ClTUJFC5P3H/b73E4nWhD8ZzatqvfW1nCGcKG8Z4?=
	=?us-ascii?Q?PwGMehYg3Er7nKMwxLMUGHDw5RFGYZRGF/CLgU4XTryHN0RB7tOwubr+4GvB?=
	=?us-ascii?Q?S+rAoU571ZlyQrvdsgVXHcGTB+Vs3nowZvHlWfatc2QpztrjdnWEZkfB2OUh?=
	=?us-ascii?Q?GB9a4OqUDMfiYZRH4WyS+UfgMYsMetFtsJ7wCclGLNg54nOa/9K9kKTTEIiX?=
	=?us-ascii?Q?QZMrhvZglGRFCCsIxG2l/k1Q+Y31n/fqOC37qSNothn5V4wTCorPoL9ZKpvZ?=
	=?us-ascii?Q?NX751gATHuqZP+2Bi6HhIO/bL2H3BekEwg5bkPS9IuWUAHh9qg3oteDn45Nj?=
	=?us-ascii?Q?zXoraJAH3RhnKALjHX2x1Vl4uRxtJYy9to8CVJl0xABIUWktOrAASuONFCUH?=
	=?us-ascii?Q?0o5oz3DPpcA4/f7P6fuYODFBO0m9B87hfxOqYviPVZxlkWutDr1fH6d3/FVM?=
	=?us-ascii?Q?tQJW/UYPSg2jWmT77W9NUmcqzlGuQHxADqpVCdqOcLGWcdBROWeEh/4U4xXQ?=
	=?us-ascii?Q?cNqPDsYqw6b+pbKZ9wmHeUoZUD81dr5ChEFQYL6VaqKJSAfPscghlSlkMosg?=
	=?us-ascii?Q?Bt7Kd177oYAvIIGbEsQbyL/zEzfu+2P6yJvETiqHf37FBkYuY2RmJ6PtlHnP?=
	=?us-ascii?Q?iLP6bJSInMs/KwNNtsko0vX5KG9hPPGd5NM2s6ejMcnFM+HftHPsUBnbUY78?=
	=?us-ascii?Q?bjgBZ1tyEXpeCFkVDQFIywJJ9Gw3OWcWLccBijwkCqJXE15oXRPvGsXpKd/L?=
	=?us-ascii?Q?ZxyVLxO6o/YD4YUU/OdUXSPEveE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89cdff9c-19f6-4cc6-4422-08d9fd2b617d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 15:35:00.9562 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agZFhi87kS61SdQh408ybxxqIPOfVSzTj7BXe1/9pL9V7gaekDmLp2bNz6NIwPeJ7KrqMycPzDTuIRTlnubuRY+WhUeohI8SnsPYf4wP39s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5031
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-security-module@vger.kernel.org"
	<linux-security-module@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Kees Cook <keescook@chromium.org>
Subject: Re: [Drbd-dev] [PATCH 5/5] loadpin: stop using bdevname
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
