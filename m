Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDFA572F47
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Jul 2022 09:35:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 954D5420FAE;
	Wed, 13 Jul 2022 09:35:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 429 seconds by postgrey-1.31 at mail19;
	Wed, 13 Jul 2022 09:35:03 CEST
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6606D420951
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 09:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1657697703; x=1689233703;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=/kMW6ONtDBqoSd7W/iLPpOsHAIliObM5Zf0xwkGrEac=;
	b=C6ZbrtYYVo8RkoF1ccGS3mFDYVaAP6bWgWwP6nqY86/UiUu5lUbpSYH8
	8luyCw1HMmCtPioBfwQTprw7v3s4EzotIqcDiwNQeQWxupy84ho6sqvy2
	9tSre5PR26xpDZzvY02R0vCrhhKvkKMKrQtqFVN6z8Gq0aMoqwP/8w56E
	ahjrRdAxgF+BQVMmXbr3a5GD4qYpMD1mbcjF6+tRzIdovf3IBKj5eOgOk
	O2RJu7MGOK62SBsFlSFzl/UcPXl5YlEmFqBF6b4n8ELS0R16YtA6gbeXg
	ePo061KoTKdbrffl2OH0G6aP3rbnK7VG/mkwuicb+Wj6FWXxBdwOqXtyf Q==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650902400"; d="scan'208";a="204216986"
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
	NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
	by ob1.hgst.iphmx.com with ESMTP; 13 Jul 2022 15:27:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=EJ2cWGb1PMHfIkefC8PlapLmobkb5ZQqID98TDq2Rx4O4kEukKu92QIyHLZiuAFH/u+PH/ft6wgRRfRJP7oxxCd1SmcTx2EhI2ToCCraK98QWtDemdPNRGGgJfZcYNAC89VnX0QD9WqAZNFy4KZnqTMoELct8VlBWfsZJ1Zu+aHD5R5YXZnoHATS5kQdcy25zMgWqxHpOplHsi8lTIp4whfX9YRiKGxcSTEvly709A+th3SHtlh6tOBGBYcmHXzL+FWuJJdPmqItD3hbs0ChjdCB7kGuijsJWDgnV2eGeYM6QpVCayAiDBsxnWp9hG0uDhuxe9f/tm9Cud8A2dsdmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=/kMW6ONtDBqoSd7W/iLPpOsHAIliObM5Zf0xwkGrEac=;
	b=MDQvzwnJ5XvoeEOP/fFuI1zGKn4l8V9BbbjpuOco6W2RLqPz+dc9x/wf5xaED0nKg+fEA+aN1sYJvo8/dLgtP82/EXZG0aGm90lMqQhe7WqyiTnFsS4o7GSq2PZfUn43hucUuQjUw1WGJ6x8CskRxIn62TaRxldKM2BCIJajNI+aYsuM6A59a3aBLayzB+En+XugisPwvxtbAK9nhn9a3uXRhTgZLb+oLd4pBxjFxPpvQqjApDbouEuVXNgffMp2iQlodFCnicvLz/6X9/E1ya8tZ1zskBULj1YzzyynfqHKvMlFIEzyb0b8e3RS1b7adcXnpSSijb424ga0Df/RbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/kMW6ONtDBqoSd7W/iLPpOsHAIliObM5Zf0xwkGrEac=;
	b=Tm/Bub9PDzQA9j2DbaH6JTqbFjqUvYJoYsarq14QWgUoPlFTLkJRG0RS9ZkgIoQnGGJYVBBG/08iilhJzWmbHXijsA45Zr6Z9+cvidmKzBuwI430E2NjCV1gpUPfSBaQasgtdcShDv+aGvqcktr8p+3KJsuxRA1HxOZd5xQ/G2Q=
Received: from PH0PR04MB7416.namprd04.prod.outlook.com (2603:10b6:510:12::17)
	by CY4PR0401MB3588.namprd04.prod.outlook.com (2603:10b6:910:90::35)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25;
	Wed, 13 Jul 2022 07:27:48 +0000
Received: from PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::d54b:24e1:a45b:ab91]) by
	PH0PR04MB7416.namprd04.prod.outlook.com
	([fe80::d54b:24e1:a45b:ab91%9]) with mapi id 15.20.5417.026;
	Wed, 13 Jul 2022 07:27:48 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: remove bdevname
Thread-Index: AQHYlnzqMl5ChJweqEC+p/d22IGEHQ==
Date: Wed, 13 Jul 2022 07:27:47 +0000
Message-ID: <PH0PR04MB74168A262A3A77D111C21B5D9B899@PH0PR04MB7416.namprd04.prod.outlook.com>
References: <20220713055317.1888500-1-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83e20a89-8b28-44f8-85e5-08da64a12fc0
x-ms-traffictypediagnostic: CY4PR0401MB3588:EE_
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 74QtiK2VztPyb+2yguS0HZ6jxKV62fTo3E7PygBFrfxeyY4F8W7CKaTcqTVS4HcO0+RVSjWbSEWQtx6+Eeh4isAtG/TjmCbsCF6TWKlrJhOl4qkx77K4h9ILqEgJdQAhPVydWuJx1ZsXsVZlpQ6Lz+kNzWkwIhcqKijWiWzX/NQzY7QWrA752ZJyVim98tDhD7neU/5fNPOF+YeTZhTxTOGF5LMtHijk6BeliBmx38Yk+xP7OwaliACCnXnstrxsJFoBG+eCzEQH6s7yQoGszRof6Eki7pE80fR8gqJ8eh3RCx0ExRI46tkHw5P3Y9e3rlESDDCo/HsJZJ2nYQlEnhLYoHvs168sr+P3Uri1TJVF1nzxjlLcglwf57PJv4f5tIIGALJxyNsiaRnxWr6FmV0wb9umlUKFuFW2UuFTpt7JQqteWBy5UhGVJqk888yR+PoJzshkc35eDtL5e7PkVOrRd8Pn77T5MgjMZD/A0ADImi3ml2QR/ih5swe+8QWX1gmuQkPBU8WGVMYD7qvtaZhDJcv/b2tjGPs3SUp0nZx9De1bARprZHoNP6Mew9OA6gGX5GSyawSOWY71aNyUMv/lX8Y0SWfdFEk9gGO4i+4rC2IhmjbXegR1oakfWdN7EmznZGHCrJja/QN4MnM5u7hiNAsJQ23qy6Y+FFM+TJXJ+gCQZqznAbPPsOkUAqfk6eYLf6QX3GROzhMnv718AU3nvZRCo4cJeI5nJ8SAhYaYwPw7GFn/GFgwTaZLrKOykkOsoL8sgBSOPGJ3xcMYxmhmcni3ysuJEf0aQfhZehGyUcr9fCT72GQCPluJsatT
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:PH0PR04MB7416.namprd04.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230016)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(52536014)(4270600006)(33656002)(8936002)(19618925003)(558084003)(2906002)(64756008)(8676002)(55016003)(5660300002)(86362001)(110136005)(66556008)(91956017)(7416002)(66476007)(316002)(54906003)(4326008)(186003)(26005)(66946007)(122000001)(7116003)(76116006)(478600001)(41300700001)(82960400001)(3480700007)(71200400001)(38100700002)(6506007)(66446008)(38070700005)(7696005)(9686003);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3NdEf3BkWP4mPQ2KR0lCV9HNC8EhII1+/cneh4Y7+O9d14AG13/dLZpoq7?=
	=?iso-8859-1?Q?EBBJMXi9NXp/SkoUK9xpAp92jHZtRoxQs842PMjt8svbdzxpzi76RClRUH?=
	=?iso-8859-1?Q?Ofq14zTqNQ3GZW89G/Vqxcpe5Qz0pH6zUQUHyEdk+1giqEJB1ZdmSWmWPu?=
	=?iso-8859-1?Q?wek51Bd89QGBPHc9TuGqT7IBC6qauBn6XlD4sv3jREDL2Za7umQSXR4l9X?=
	=?iso-8859-1?Q?3PKbrumA7NtI7TPM/51j51ZG007gp38erZ702cyjvJTO0V3PUp4rPRbk3Y?=
	=?iso-8859-1?Q?qORajEkPZurJyKISPwij4zGpOpjLYgpppwxmh3E40lZGN9MkAEoSTd5SZc?=
	=?iso-8859-1?Q?G6nOZCIDyQWMJWRiVBEnNJoRyRwIxPOfP+F6Nf/cLgMoRP64HHumjuokKM?=
	=?iso-8859-1?Q?Dwy2Gyt0qbifvuDPyAcg36eIu251hfDpB7hugi03NkbhGOL3NLKcYJSn49?=
	=?iso-8859-1?Q?z4byfM05bnuAOS+d6jy5FBtTdm+G9VzZYIUhWkp89EsZaZbyc4o6hp3gOD?=
	=?iso-8859-1?Q?jeQzJA0pG7oqDudky7Q5j/kDYl3TzptvBT+vHG/2qQBVdmNtDC2q04Pnqg?=
	=?iso-8859-1?Q?pdkme60H4CWVnj0j75nqeIN+Lb097DlU7FQ56Mov7ezL+MIRyFswtgBTr6?=
	=?iso-8859-1?Q?4ZJtJO0p2WZwPoqiBbibmYJ4L3aBZvENATXS/+5cifDNacub0dp+t6yCsT?=
	=?iso-8859-1?Q?sMmVQKdW9PuNjQJ67fE78Tk5PalLxnqhepPIj2sKonhMYYlTwsAQ0BGYjZ?=
	=?iso-8859-1?Q?pvSABGtoySsgAL0JGL9gKpsn89azjvU8ClQN/lVJr0kcXTbwxWHzUU5l6Y?=
	=?iso-8859-1?Q?yHfvBNfRbQ7OioPSuV/dPgwfdVQdknkot363s/+bF8G9SGgJ1C3p2OzsIf?=
	=?iso-8859-1?Q?q4vi4oGGnDnATr5XZitBPNY2C9TqlFJrNMiQgheBFDVDV/PQY0goeJIsQJ?=
	=?iso-8859-1?Q?0esTcqwkPb+aPywmZyAtJCXLWCjm73YlOHQsLUwoQeNPgL5eHLriIBFfIb?=
	=?iso-8859-1?Q?SDoY2sY/8MfAp4dCym5GA9WmRdsjU0poFnAiChJITpPjP+hvDYFnxxKN2x?=
	=?iso-8859-1?Q?6R4rwCdpmRsGCpeHUcvmwxsPGbcapQb0Co6VMSDpnJFvKdp3Hy6SKu9Np6?=
	=?iso-8859-1?Q?oYFd4XjfP9+yBXXBjl89w2wk3rV3JG3KaNFX6LqpCJ6kaFvMjplcPZSTmo?=
	=?iso-8859-1?Q?XrB5q5A702IfCEdS2ZS3AbNNf+KUtxELrl9QU8AnJeKgStbSWfnOXTB2E4?=
	=?iso-8859-1?Q?SiUadUTF/Lz2F8bd/+7mbvF3lniyHY3PIN2qk261nV0PFvY3lxOVOTI4ug?=
	=?iso-8859-1?Q?vS2v2V36y0MYJfmwQXolSdTiixmqcTej7AIMd4im6SenyFMbV2cOrr5FBy?=
	=?iso-8859-1?Q?Ox1Zz1KaOxV96d0kLEpwyYrSRwY8WmBduwgj/w+tXUo54/6tTdg09NE6Iv?=
	=?iso-8859-1?Q?ydoWzKihZX50z+2X+pxLZY/j7aVehDq+6KKfZZIHa4eeEQ2jz8zPuwyIPX?=
	=?iso-8859-1?Q?A57H6rJYw3THMQ1xpCs1zhMhMmuzgMcKgVPgRjVs2IphrxP0M0iEODoOAO?=
	=?iso-8859-1?Q?S8/WVLB810IfVbFKc3qSciQbjo/IXF/orhmDCjz4GtjJCPilP9HTndu/hU?=
	=?iso-8859-1?Q?y21l3Wp5dTnjo4GaysDiXxvsu4psqIIg7I61LW/JxP57ixI8dSe9JvtruL?=
	=?iso-8859-1?Q?IOlfNPY+yjDADGcNV1c=3D?=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR04MB7416.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83e20a89-8b28-44f8-85e5-08da64a12fc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 07:27:47.9693 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W1USNg0u3m1sc/+bXfjQI5YyC5Lj2XibBhghmEgwW7vFv8K1dG6Z2h2ZIiUMNYMbT4NqHwtZrjkhnbGNcT0tI6ppFcg04XxTMXtFOZjpjDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0401MB3588
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, Song Liu <song@kernel.org>,
	Mark Fasheh <mark@fasheh.com>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Joel Becker <jlbec@evilplan.org>, Jan Kara <jack@suse.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	Jack Wang <jinpu.wang@ionos.com>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] remove bdevname
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

For the series:

Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
