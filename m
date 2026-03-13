Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDeQKLvJumm6bwIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:50:19 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 6A39B2BE9A1
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:50:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E4C8F160904;
	Wed, 18 Mar 2026 16:49:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 426 seconds by postgrey-1.31 at mail19;
	Fri, 13 Mar 2026 14:00:55 CET
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1AA91160904
	for <drbd-dev@lists.linbit.com>; Fri, 13 Mar 2026 14:00:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1773406855; x=1804942855;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=OSRxUttEMuUpdRQdoMv1fvVvc0SNAuAqgAS3jq9J3s8=;
	b=iT9RLsUmeKNulZTOX0ZoNXAuJwOkKodOw1XkD7DPmX1C0EBg/4F29CBl
	IE62LcJ+++sIqh21mquRCXgYaKcdhp2tJAxBorKjNlEEcX54dCgiELcTk
	oEEDw9PNvckWXWm2eT8cUNhQ4z7a334YwTgT/jYT0Ar+6E002+6z4eunX
	kM8C/cXrPVPx7QRSUB5I/jV3R9fwAA1b4BXUAlTZHyTN6S5/plVCQAM/q
	F3J2GxQAFW6mesX4pPVU2d7pqKMLxyYkXJZpZ+U9kvZb/6zoR6ZBMmEO5
	Gwnio1mZSGVZb4ROPuMZUjRanqtZ6yzT/nYV+56gS9LdcMnSsQ7CCJWhg w==;
X-CSE-ConnectionGUID: V0RKry+2TAmeXIgv/5I90g==
X-CSE-MsgGUID: QNkeXV7pRV6EcJ5iQ3Y2PA==
X-IronPort-AV: E=Sophos;i="6.23,118,1770566400"; d="scan'208";a="143604291"
Received: from mail-northcentralusazon11010011.outbound.protection.outlook.com
	(HELO CH1PR05CU001.outbound.protection.outlook.com) ([52.101.193.11])
	by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
	13 Mar 2026 20:53:46 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
	b=iV374MaPmUZQ7jDcohIGF9j5CM7yVsc/sid/jyzeAvaeItS88VVaRbX4ejL4+RgvKNZlFVr7JMmYxXiPmvz7Cc6XG3T5WU6WuGgo0ZmpMSMXSjg6zy4xBYr1r6GYRPj1cdeIRa6N5Xhb+Sm01l9Re2wQJf6if1vuo4x4PVqe/F1Vskg0icEtqYJESgQh/Xj22hUA/nK6N0HqaCOLQBb1el1ivw/L044334leMz6pusHCyCmkOZZsLDh/FBx+KiF1s68z5bhLUCeEjojiyqTToe3VXdAklfRHpb9CArbkA1sRgrhI2vzu3mho61tPVEfM/nt1V0WQX/IyVZ7aNFh1YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector10001;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
	bh=P4Wp8VB6ZOV9c2OJV4mWXvHeKny6mJytYSljZVRyVtM=;
	b=etByHNaRh6glFMPXCoPYjByUclor3vnobOOjwWFkn5mJC1/WszKjK7HMq6ciL7YVvjqNWZXwlAWkXXa/sjIsNtCSup0bCstik4lbmnzCOuQwx/vNXjiF+IGWIMRT6olHnb7LXy1JdgOMumU8PjNTo+OgMQNiitUZU45aVSWm5PVo0gnhvAsfi32d5uIImQZ3ywMO/+tjxSu3vNqrQFs/55xp7PJnd8Iro25/WvsWAPZfFok05SshJhdN8a38ILjoxSjjjwfuzPIuihEccpNBs4sX8WY8D+qd4wK16fjKn7pwM4OAh01eTwizS7aWP01QcEMClVnG0/NbQ6kL7weHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=P4Wp8VB6ZOV9c2OJV4mWXvHeKny6mJytYSljZVRyVtM=;
	b=O+N+5IeHZqAFtcJKnk2wm2RzVyj5lkH+n4IIsFfzF7lDMwlU/V6NHhqVF8J2PnSE6xIYj6/KgS9ZhUphVpn33XyDGvEclNOiW6JFBGNGqxct0P2mkNVdEcT07mYvo62feg2px1dmpNua/a0HfvJ4Kytd93bLNbkNzwbmR0NynzU=
Received: from SN7PR04MB8532.namprd04.prod.outlook.com (2603:10b6:806:350::6)
	by BN0PR04MB8061.namprd04.prod.outlook.com (2603:10b6:408:15c::7)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17;
	Fri, 13 Mar 2026 12:53:42 +0000
Received: from SN7PR04MB8532.namprd04.prod.outlook.com
	([fe80::ce42:7775:2df8:8729]) by
	SN7PR04MB8532.namprd04.prod.outlook.com
	([fe80::ce42:7775:2df8:8729%6]) with mapi id 15.20.9700.010;
	Fri, 13 Mar 2026 12:53:44 +0000
From: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: [PATCH 0/4] simple bio cleanups
Thread-Topic: [PATCH 0/4] simple bio cleanups
Thread-Index: AQHcsuhsoJvODmFvWUyW0LwJxHdHcg==
Date: Fri, 13 Mar 2026 12:53:43 +0000
Message-ID: <abQHNzJ0FR1EF0NX@shinmob>
References: <20260304190424.291743-1-agruenba@redhat.com>
In-Reply-To: <20260304190424.291743-1-agruenba@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
	header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR04MB8532:EE_|BN0PR04MB8061:EE_
x-ms-office365-filtering-correlation-id: 35011969-5713-4a72-d719-08de80ff8f32
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
	ARA:13230040|376014|19092799006|1800799024|366016|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: 33/Jw8w7AJ/NIiTIGhTuIG+TPZNmZUow0R1374sWUl1Xicc+KcIIBCZm/vNJlDE+S5cySLNTpm1bCuZS1TUNmLItwIoJn4Zee1NRFPI8CwAD50ykSYp28BD1fjApWtWefkyr03ciqs4QQqsOThCWCqQvYipPp/K7F9wfdPR9tQTqkV63KQGtE42hLHUDAlxaW+QqGLL+FcYPaExpTcQfmmVfoB8AWUZbTOPFGs1zaV3N/q072C1XU4EGhte+AjLpk/mURqc4OWQqKCrfGbStIbimhmimnHk2vL9pB3Z1fv1z77K57nnvZEsmHQPf1911kOfXb2C0Qj4pLGcQPxXwm2gTTqYBYvrrAol3BRKpi+/8TmiB/NesBASlkbPZldacrHHwvDg/WcTnvLJo8IrsbEWUlbhGLuoMD0zjwOPEbxufcPtd+tYyI7fPlB87uQTbPMiaebmKGbtcFRpSqGIf3PMbcJZpvyYzw36MS1KNzfqZONJyENBBsvYayGevrfwmm7FONlHXU8gogQjUiMvkGyc+adtV443icAFc3iT3XCp0lPyPhgj8bvpBnigrKOCTFkqA6p+p3lgISXvbGtpc0fnlixFbTlYJSg+m7YVKH1SSfn3CejHrBxLcm5juY9g3h9jM0zbW/de97oW9YfZj8zZI0dnifExQ+XYp3Smjlr7uw5H9cHRWnEbfrtn4FYs4m8TKxUdIxShHgE1sTqTOdO9KzwBnAA9d02xiTMht1/6wyXBoSSq5wFSzIE2orMqhOGF5WT65S0sSRbF+LIScMtfCYbm1lUsQFtru9e06QRk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:SN7PR04MB8532.namprd04.prod.outlook.com; PTR:; CAT:NONE;
	SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700021)(22082099003)(18002099003)(56012099003);
	DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OmT9HW1si4ppo+MmnO1pFgvFHa/1UGQJfE2reai+YNsxmOGDUnZ+0DYIo6xT?=
	=?us-ascii?Q?vwyirICyrnfQiMNGxw9MiJqR23sT1Wj1dpgoiBU4MVlN3+vA1/o4qAibqqOA?=
	=?us-ascii?Q?t04jYnUne3/O7Wh9NiNqkasPk7x9aQ31yLdghtpNJGUxfJDWJ3BUmGf0WHkr?=
	=?us-ascii?Q?idI3KQalNnTeuYlLkhf3gyrkPDD0vUBf6ZHfn9OsnbKTuEyu+CeKs6qy/g/A?=
	=?us-ascii?Q?rI3hRt0iri4ySQsDKxu5hVaORSGZBVwgvZwXRv6eyVXZVXBeFprHqT/n7pbg?=
	=?us-ascii?Q?K7Yga+EbmyI1CSoTHKk9aYl9b+nwtFBAG4Tnt8+FEISCODooKuMW5rHhwpWW?=
	=?us-ascii?Q?1pgSEMiFz5ftWytMygq8+tBjFg92k6bR/FiKsK4VsvY06M9PHgA4CscVmf1l?=
	=?us-ascii?Q?ef8HJLS7HCIrrebYcYWVIXk1jbQ3SHGz1+wQ4w13Br3mK5/6TPrZhoAg89Yf?=
	=?us-ascii?Q?9QzdcvH32a2NOkUrRj2qcr3cMhDSsvWEGwlXno72KSIDES5KBYS2angN1RcI?=
	=?us-ascii?Q?ruRV/1Or3aiZIRXYRzjYUhV9eYUzgY5iOzdFNKYK/QL4Tcced+qOqH6wo7uI?=
	=?us-ascii?Q?Hji6jeVEY6lcg5uUWqpwMBhLZb7kNC1kkCS6I8YGtzJZs3Dqm3N5hHdhBe5s?=
	=?us-ascii?Q?buIbvtPN/UwtShOj8u2wV5cRNv4GSkpDCvt7wbC5MnXZHxeRhdfnefyy2rjC?=
	=?us-ascii?Q?2hhc99nmTKc6hK1Qotyurh/WEZ5Gca33RLDuBNj/vNNvFVxBy6N/L5B0fOSc?=
	=?us-ascii?Q?DMsKzvfYyNGh5Ksbkbe+FIXGKwK/GgrP6Y1pGV2KpWXvCrA1SiAXutPXi095?=
	=?us-ascii?Q?+hvey8HfL+elVYLh4ZZOGuwq4auKY90ArWNnE+ABye4zlWAdW4RstZnbUP/u?=
	=?us-ascii?Q?Ps8LQPaTKjxCHp+v0byEOaSVE6Injg5fWCeBkoLh5/3bLT2yz8l/ix7l1s1W?=
	=?us-ascii?Q?gpZGT2Oct+MO3r08gC8w2KMAOiFXos6RxMFhoBQbfC7jpzDia8wRzUJJVnAL?=
	=?us-ascii?Q?UEebf2UOjZmUCF2Fq16tiC++7zXa0n7fUU9O4AMsJ0aewCatQ26owD1bwhnI?=
	=?us-ascii?Q?ohYxjU/iIcILl9xOr7LnWjGq5OA780ZgvPeoicZkkSWX/SQL4Scd4LXf/ClA?=
	=?us-ascii?Q?+HsPZeW4QevR1caI6+UUnifaOYHgMxpPZhdIkGoBzRGVcpTZD9352fNlUGet?=
	=?us-ascii?Q?PndJl3D/DW/dkinA6LRRjjp2aDPZQBF+rH2o6wbnjeZdUkHh4RKveLWKxF3f?=
	=?us-ascii?Q?7LYaRjlCpVHoF8UTjr7U34nCvvoaVMBpsTuYCG19O7NC3FLVn6Kk+A88DAZu?=
	=?us-ascii?Q?M5nVA1p3NOCH7jJXZy6V7qqU8yQn4sRwjJ0I2xUxw+9TMB5rv3aepzO/JuOh?=
	=?us-ascii?Q?yEx5g1v0/JZ/AfkoKhiUTCE3U6Q91BR0/o7YhYWGFF5GMJGHG7ukkm62d/Va?=
	=?us-ascii?Q?41GZ/FJYMdKNzL5kY1NbW4CSGGLeTv3hs6NWvYjeLhJYJeovsDsnU8S1h8s5?=
	=?us-ascii?Q?zWxAOtIIJxlWUhFriDwNk9oyzaIek4FuE8UO2CZ2Y+SQR+5R65OZmCJO07JT?=
	=?us-ascii?Q?uH3NgEvB0NtXG3UGrCgpRbcno6AZZCl5CfeCPAqvQHgN//C1GD01cG9VCLMB?=
	=?us-ascii?Q?Yf6+CLKj6IXv6mcnnkLxlUqCc8v2raTXxiopvbWfpUK0Mplp+3u6cO2F958f?=
	=?us-ascii?Q?Tb/f3OVNeouGF5twHuRlASd6RhU+SVOEbNzW+Avs85wJXp32YHupe0Cm466M?=
	=?us-ascii?Q?QbCaN0wwddoR1iX1IpUj+SyJ/sc92GU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <04660C2DADAC4542B63210B46696291C@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: YMDbipa23e0SEK6sBNA38ZThVz/LzADS1lwEyYN491T/gK4LjElqfZzwA7Pb+cJ8tu7jqGRqaQRABMEIq8exUaunoOfBi/ILPpweJyRI7rClBRvxmbimAnEDaI7R7B9Zup5BiGj1KUKs9QVAj8F9h49MjVcnK+NIQS21DATIwjvH4TmmTO5Dj9BP4OnKJbwd9MutzLYnoY+lANp2VLmJ0I6f4Z+Irhakavn0wRDdWgW/CeQcgaTwdkJOrFxGw9rzFCwPfOyKSgJ5JFpgmGJh/9k6d9pbZ5petYjc6uKAzljrQHlgXfyw8xxoM6TrjR2qeYkzl/J0GDUzE2qER4TjOQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9J81tR7Ih9aVdFJHSqFLByzGz9xkxLC+R2gifdendXqa+TDfdUZEvLqwcjm8nREetNVx2w5pijjl4+OceHOg3JqwZsMjY9emPX7gldNPYX7IQ+5XoQDakT/OPZXxNzObtGegCP6x9//A95qlhOSM6c7/57hGZykY5al+YXfgIHv7jMYKDAUs+g/zzqLWCGIpL9Ijop2EX7H9iGZ0uebyG4gjSyHQvVleqtdRonsIWpZHguXDazZK+zAieqyPlehfbYFzAp/PcPSfVgeQxUc2SpuFVo64ZUiNPjTOLWNfUsVt9RkeeP0w9UhHxoBLTKFhEOCRDE9RyutLJJ1NUCT2zWNq425pbMp+ZsCvJk9YxuKyzCDf5hlT7otj6qir5bhPIztwU8nTRPKzM2NhQEEqLzSdbRZEKdacpTFoZI6CfdRUetC90adhZvk9+FaUIg4YcivTUIwxc46ywed2flWZhIoPfbsD8OXoskbGUOcG6CriZgGNOo+W9YKYUUHoga6jzFUa7NNFZ99P5jwEN3QjpBo2CkjUDHzHuuTCF7f00zAF9xx5YXweSKcaf8IZlUAW3kgwwNFp5nxfGDgG5TbVVV8NenHVxe4z7LuanjpJeu8FSKa3McawIQz+S45cYupO
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR04MB8532.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35011969-5713-4a72-d719-08de80ff8f32
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2026 12:53:44.0239 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wttaWsSFM2hmm3SW43PZrMEnNsh6Kzcv0vrRmC2F8yvBtHptSJMVvA9nO21sShCT5Q7rGanukvMzyJawKgswYMoc9aT+3ccF2yPvoW9t8hU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR04MB8061
X-Mailman-Approved-At: Wed, 18 Mar 2026 16:49:43 +0100
Cc: Jens Axboe <axboe@kernel.dk>,
	"dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-f2fs-devel@lists.sourceforge.net"
	<linux-f2fs-devel@lists.sourceforge.net>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Spamd-Result: default: False [1.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[wdc.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),quarantine];
	DATE_IN_PAST(1.00)[122];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[sharedspace.onmicrosoft.com:s=selector2-sharedspace-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+a:c];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[wdc.com:s=dkim.wdc.com];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:agruenba@redhat.com,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[shinichiro.kawasaki@wdc.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[wdc.com:-,sharedspace.onmicrosoft.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shinichiro.kawasaki@wdc.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,sharedspace.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 6A39B2BE9A1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mar 04, 2026 / 20:04, Andreas Gruenbacher wrote:
> Jens,
>=20
> here are some simple bio related cleanups.  Any thoughts?  Can those go
> in via your tree?
>=20
> Thanks,
> Andreas
>=20
> Andreas Gruenbacher (4):
>   block: consecutive blk_status_t error codes
>   block: get rid of blk_status_to_{errno,str} inconsistency
>   bio: rename bio_chain arguments
>   bio: use bio_io_error more often

Hello Andreas, during blktests CI trial runs, I noticed that this patch ser=
ies
triggered failures of three blktests test cases: scsi/004, scsi/007 and
throtl/004. Do you see which patch triggered these failures?


scsi/004 (ensure repeated TASK SET FULL results in EIO on timing out comman=
d) [failed]
    runtime    ...  3.855s
    --- tests/scsi/004.out	2026-03-12 15:23:54.664435639 +0000
    +++ /home/fedora/blktests/results/nodev/scsi/004.out.bad	2026-03-12 18:=
13:40.059747989 +0000
    @@ -1,3 +1,2 @@
     Running scsi/004
    -Input/output error
     Test complete

scsi/007 (Trigger the SCSI error handler)                    [failed]
    runtime    ...  115.385s
    --- tests/scsi/007.out	2026-03-12 15:23:54.668435644 +0000
    +++ /home/fedora/blktests/results/nodev/scsi/007.out.bad	2026-03-12 18:=
15:55.054944537 +0000
    @@ -1,3 +1,3 @@
     Running scsi/007
    -Reading from scsi_debug failed
    +Reading from scsi_debug succeeded
     Test complete

throtl/004 (nullb) (delete disk while IO is throttled)       [failed]
    runtime    ...  1.643s
    --- tests/throtl/004.out	2026-03-12 15:23:54.710435695 +0000
    +++ /home/fedora/blktests/results/nodev_nullb/throtl/004.out.bad	2026-0=
3-12 18:20:46.314368581 +0000
    @@ -1,3 +1,2 @@
     Running throtl/004
    -Input/output error
     Test complete=
