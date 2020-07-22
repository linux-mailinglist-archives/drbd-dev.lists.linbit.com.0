Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 804A728BCDA
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:47:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 66EF94207C7;
	Mon, 12 Oct 2020 17:47:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
	[209.85.218.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 579044207C3
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:46:10 +0200 (CEST)
Received: by mail-ej1-f50.google.com with SMTP id c22so23887739ejx.0
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:46:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:ironport-sdr:dkim-signature:from:to:cc
	:subject:thread-topic:thread-index:date:message-id:references
	:accept-language:content-language:wdcipoutbound
	:content-transfer-encoding:mime-version;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=OtX8LknMqXL7p+kS1O8LwPmiLwwThMYPO+TG/NmssOQnn8IN6ikN0Mo8iIiZBJ+bGF
	P83Ye4bavBc+17I3A4qmi/anwZ69UJF3/ObQdb0xnFVdxHW0uCCpc9lNMYyWXWRgZ4jp
	6KvTYisnj4c0IVS68NzQRBGGQhJPKCldMrwY2AHx4ITEeHXhq0WZrqCrQAmqFwq89pfk
	NMG9dIk1muJ9YwWNC6Vq2raeRs8fUo+3aQfm/vne9+HyAh412lpY1vjsOpVnH2Mb9YAw
	O8PypQMaQU/5QRTmQ2x9BW59cxtn5SPGFs9WABhvMmsvqabX+7Uwl+9JsQyt1X5m2acU
	SqQQ==
X-Gm-Message-State: AOAM533iwnrKZnRci4qmLqBLaxxBbCYGunXALxkkygnbKPHo4pgDiVR8
	ArUm6RLKzevICCtBQEj/cIp2UtF5K2SMimYjS6o=
X-Google-Smtp-Source: ABdhPJwMKO8XnEDvi3QSmjqOGsL9/o+vFeRYES7cUkSaPeYkR0to/OTw01sWzLLSat/vFSeIHgJVNw==
X-Received: by 2002:a17:906:bfc8:: with SMTP id
	us8mr29910121ejb.282.1602517509676; 
	Mon, 12 Oct 2020 08:45:09 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	b6sm11480999edu.21.2020.10.12.08.45.09
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:45:09 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:45:07 +0200
Resent-Message-ID: <20201012154507.GA2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 386914204C3
	for <drbd-dev@lists.linbit.com>; Wed, 22 Jul 2020 09:07:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1595401665; x=1626937665;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=gviHbS2lLJ5ted3ERD8dLVhQdsj/kY1FB8wdY8CX2F4HOsupSREalXAB
	64hantpe59l1RPItTD523rtaIgI5eb82hfEwJDW1BOtQfKXHz9OFvXaW4
	v2J4gUt9mzZfOjqqQD9DP+t86EekBjXRoFJMukaGC6AHBiKBssDI8Xmch
	FUOQQwRrfW9fbJl8VKXzCeognU+xRVaorsmcAYbOwjrIXokEesf3nqdya
	1/5c5YBPyxNZGSfdFpimVmD92f11R4/yapz7ncgPq48yedsuT4tsaMsrN
	fjKsaMQ/Z12BAChz5w2JsngYttPvVvtu5+BPN/bnBd+3GuOimBXlOs3Dz w==;
IronPort-SDR: 1cC/ZmCXw2L7KZN7j+3FnZb6iD/zGOdmDPw2wC+8afPlAXyrtfLqQ0IHxiR6NTt3NyAY2OcsYh
	CE9ypca0AV3xIyIR0/BhLD3mCOK0eEJO0/nOcDXTrSOIDcyRbaMgUNWQAnBitZO841K6T1vHmU
	+/GmrA8sZCEMCGZJd3fdri1/Ko5X1D0WtFD4LOZLyBj0YGT+0Hr7yDdv+b9iuS4SiHyZU21jP5
	XOygclq9wl1W+l3z5n5DatFGrUzpkbKrKWRQJ4HXUTaEamXSwfzd7KuO4kD3NSlz1vAz7CLb5F
	Oug=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="252374963"
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
	NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 15:06:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=f6sb+2WL8QHWnTUYL2ym8sVhds+28a4IzNJCV1ZVBsuAAVyRvct2eWrgyMWsvMIolp47PUVyPWU/2BGQoj34mY9++hO7EcKvB485ko0RrFUg0ulkfmkL7z6XDmmWPHPrcqoGzAjM3lus07EQrz5VeKg/OClQQIJtCsm0cpaQu4WLBmscODUuWpmtrnG+O/IwIXOBePhNSZO2hp69IZNkh8JadVNcmeXMJ4UHMDIfdcKtwVrjXhsWib0rBILQgPulgD3MbPFvIUC94ioiowwrr0/ffFHOfNABByFlQfxfJuyBYhMlCaXtbAnqzNVrbkSAMtM+EyNrRuKNFl5rzIHFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=U66On1cmLp6jxJ+efAXN7XXMbx1V81dXwgfnitcx+a2JucSWEjwLPmXPrnoLpH/CcpcwDnEQY/id/2dTP2eOvyqRsLeDiou8hVBMd9os31XjHTZg5VMc0EwHYY+xrnY2W29JMkHjHMGtEURdv1OnKpmSW45CvcyPj47QeuAX853nKufyvAHovONf6tWRsiOY8SdgHge1vYvHJwPjMBaF8/iHS3/de289FD+HGOoYmYx4gNJDZaTJMUd4P9865xceiwTdBiOn6ShdScD7jQXaYLvDykJ9KphQA14jykqVN8oDrpzxairfCeNm6dHMY9I+68UN+pA4vBI+XwuH8QLa0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G8FZ0D3PP/OudJ5uuxCAz/C/vBHo8wESZoPwxTWqVEI=;
	b=VhccjgxcMqxTYFrTPoOjhbaOQpxVFAq+3p5QqnNYWWJ+eMMAjzOg2m1lGB0S9AHARlQyQLvO6/dfREW8V9YhgXHwvogx7EqjutHZucjVzCtOY3Dxtsd1wFgcDErv3G+i0WVgwkFueqfIVljSiFFOOow0I6bhnzfRngeaOsNGZ+g=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN2PR04MB2239.namprd04.prod.outlook.com
	(2603:10b6:804:15::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22;
	Wed, 22 Jul 2020 07:06:41 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026;
	Wed, 22 Jul 2020 07:06:40 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 03/14] drbd: remove RB_CONGESTED_REMOTE
Thread-Index: AQHWX/EU/Gp+h3cxdEuFDKhh6e2P/A==
Date: Wed, 22 Jul 2020 07:06:40 +0000
Message-ID: <SN4PR0401MB359858B7C65ADC19A58680B89B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-4-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
	header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 423529e9-2d25-48fd-271c-08d82e0dc8b8
x-ms-traffictypediagnostic: SN2PR04MB2239:
x-microsoft-antispam-prvs: <SN2PR04MB22399BE18885C4555C49EF769B790@SN2PR04MB2239.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CZ2WBoKTjUiCRczBINJPXt8slJKCWaB7VG2GIiU/jcWAzvPUpQHTcqy72iURil34lyAyUTsk7iDbehuJYJWDmFoOxwxnoKpMhoL2FFiy+o15O8Fn/xzk+W0qDZfZq9rqy6Ku8CNhZMo2YhhqDHMWhQRFhPf0otxV5YIJ7SwOqcrzvf6wA1TJxVpK3uDp68xMKG2A5lfT9IgHGmx8r0tcsqbVepSMNX7wkNAC1VRjxP5YCrteQ1NJvasmnqz9bqBg9fLQlMAl4tIX6wztxcBtC52S8ey9WOwdVwSCwTjDGkZvIJX9uLcEhLWk4P94LReVU6hUp2F8/uPmtIzAPAaIZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
	SFTY:;
	SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(52536014)(4326008)(478600001)(9686003)(7416002)(55016002)(5660300002)(33656002)(558084003)(8676002)(8936002)(76116006)(66476007)(64756008)(4270600006)(66446008)(66556008)(66946007)(26005)(54906003)(86362001)(6506007)(316002)(2906002)(71200400001)(110136005)(91956017)(7696005)(19618925003)(186003);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: lF+WLkAW1iTv8GTT+lrWQKEw/9YFv0A2vLwi8HFMpNw2MSBWI+PnWVEZGtIeJd9hKwwQRy/HZHxu2Bfn7Sn4KsOEpudZ0WQH7wQzHmuOuPzxYIyPfNp8GlKnGk1MpDHa1qNRt42kk/Uo/RBv704eC2E2jZiY2o+bOVn8Sh9l/domlQ9896gTFJVBjan3vlqHgAYA/i6t9FIxB02qKwq2akOmkLrjsC+VwS0VIFtR59y/iUfEYYYUQjwencUfqY//y/UYcONBlWatvTTFF/OsIWCoUnulDa/oTPPdvotwB1ryB4XisFUZ2pBdUPDjG0wU7jTWywaaboZTDf9dOR1qc0/zg4jP5DRIgDN9OKil/jzIps4OsPRGaH9vjS9wwCelgBbkIR8V9Va8En/ZFPMVPcxEsw1TXOtTU3yzmcNti2d2s2vZ9qr+CZgfssA4frMB3uTF+B0CmIMZI/avQ8Vua+Cwp2suY9K0pbvHuugm122kMzlJ4n/ZzhXKyZSPGLwN
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 423529e9-2d25-48fd-271c-08d82e0dc8b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:06:40.9030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 69clVlzfq5RK22/6bqsJwMAzhrFxun4DqnADjbPPMnMgSFFvB/DDmpxjSlrTkxFvCJ8XY7liRo80WXv/vIV97xHvradsQ9JdYVBFdz5AZWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR04MB2239
Cc: "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, Richard@linbit.com,
	Minchan Kim <minchan@kernel.org>, Weinberger <richard@nod.at>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <song@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] [PATCH 03/14] drbd: remove RB_CONGESTED_REMOTE
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
