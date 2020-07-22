Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EE928BCD9
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:46:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 12F594207CE;
	Mon, 12 Oct 2020 17:46:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 860AD4207B4
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:45:12 +0200 (CEST)
Received: by mail-ed1-f66.google.com with SMTP id l24so17484949edj.8
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:45:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:ironport-sdr:dkim-signature:from:to:cc
	:subject:thread-topic:thread-index:date:message-id:references
	:accept-language:content-language:wdcipoutbound
	:content-transfer-encoding:mime-version;
	bh=5yNciJ0MaHm33mYwu8p1ho4mWYWj3E5JhuQT3rAgcYw=;
	b=QAyqL+IZQ4wOw0K3Zn4F27QVqkzADd0iYwqdOjLLmclaeGHW3FybNSBZt3dglrWj5h
	1qs1ka8tLAB3WP9/EWzvVo6CSwqrOSqNtm0EN/ppZ/rI1cXEXmMNvoCUf8jVjsO0ALCI
	njr6E2Js3VIIHEWzxTXnUm1r0QXWzlpodk12h7shb14809GePGSd+RXkcILMjWBKbIJp
	m7PpnFKIZwPn9/iaFx05Wpie8ajqFdENiOwwKHnuLDHa9RzY4Ie2tdIy7Ggs2pH3m/F0
	ENJKVRFgwIr+blhK/o4ol0V3MjUKP7Jr4RIJ28uNlliofWD4v89yM+l3O2kToE+SI6BT
	arRA==
X-Gm-Message-State: AOAM533fku4LkcDI7Q0RpCtXbWF4CJ4er7HuQQwr6zpUMuc3ClJuEaIb
	EWapKJiC308s5OzYzAYubQibgVeODLngK6j3hLc=
X-Google-Smtp-Source: ABdhPJzBGzN85g9Nn8faqe3kvwyon8ybJVrmXbdI+S2ivu2BSV32HXhzbF9ohzSzvqon8XSk6MoQhQ==
X-Received: by 2002:a50:a693:: with SMTP id e19mr15246926edc.333.1602517511627;
	Mon, 12 Oct 2020 08:45:11 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	le12sm10918688ejb.1.2020.10.12.08.45.11
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:45:11 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:45:09 +0200
Resent-Message-ID: <20201012154509.GB2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 363 seconds by postgrey-1.31 at mail19;
	Wed, 22 Jul 2020 09:09:31 CEST
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6EC354204C3
	for <drbd-dev@lists.linbit.com>; Wed, 22 Jul 2020 09:09:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1595401774; x=1626937774;
	h=from:to:cc:subject:date:message-id:references:
	content-transfer-encoding:mime-version;
	bh=ZqCO4R8P2m+FkHvzzK+0WLPWNYU1gTTyLCkQh9L/ClY=;
	b=oBdmILoBHcrUtiBU7aBP4Rrihi7Pp/B01iW+7+o/Qex0gYuadY7yxZAF
	cYtALKTDuLASxvl6Bd2kv1lkEGqMWzVKd8kBq6oYt+QuqDQa06SD9pRbd
	nl0og2t+GtR0L6M3B0fCcVEN4/+VO9WdRKWFB3PoHD5JtOmzBZwuFehff
	x1uWUjo5L8Cl7rvdxcsEZ1s94vSKiG5mYomS/V7AeiA2LqEUs+UqmkEte
	DZqFoa/lnUQPuUVcUYs4GlrFRRT6jWWVgsR0piQZ+BMVsA4ZHT1UWvzwM
	RdpN1K7LltGFJBvDSeUGzW92C7obm0Jf7wi5ej8iZ+o5ufbk5mnwkjH5D w==;
IronPort-SDR: M11R3nnCHYvP6eLcDVDQ7lvFZuWGlt7OxOcsv8q+8ZkPvcEL6hUQJU1I+aN3i2RfgfWpZGQFqC
	4eYoAApKszoFbzO3wQoqpfN/0O78U1AzVyvYRn9xUNKpLoaB2QivOEc49KN3DXKGgDJcUTS44v
	ytxNLH5NkqXRsd4Ro6VfP6Q8ddeTk11Wyn/IXwYA4ypK9v0Tlfa5WFnVqIc/c0SEQKTfOXzCve
	ivd/NtSWCV+6Fzem4XKhDo9XTt2iDhHoBEw+ZfbEL8z9zlfdjEFFm3lyLHqk71hMAaNBemz2dX
	XwU=
X-IronPort-AV: E=Sophos;i="5.75,381,1589212800"; d="scan'208";a="246134845"
Received: from mail-mw2nam10lp2109.outbound.protection.outlook.com (HELO
	NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.109])
	by ob1.hgst.iphmx.com with ESMTP; 22 Jul 2020 15:03:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=hEfNLJYacGgFOBnORUv6uHIBj6mOnyQV+XLN6jq7E4wlHxxeGJTRGy0iKyLaieFNCvvaHRs22b8yuAt9SW5yGtqK18C2wzSl7gFz4BVEtq0+fOiiGqsK5SI6Skf9H5tUr1fSC8uFllLsE8IfJT8Q/aTtSL28K5bYTyL2CvCx3IYXKvR1cEYMdUPdV1xrWlCjE2ulnnkLPXuGV1nKy2fwUVJ7uOEZW2LIaS0528nXi5sSgSjk/tpWcSnN0ahPNJLQjeur7rVKkcVeTLC479ubtYEBcaQ4LJaWSasSQAP58Guj7okzq9Qe8rLOao1eFnPVxTVgQCUe6Logj0HyoNZq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5yNciJ0MaHm33mYwu8p1ho4mWYWj3E5JhuQT3rAgcYw=;
	b=e50Y+R/3zvr0VNBRA4FVD7aC/1cit5lpMXsseChLBQ1yzbrMeZpoy992OMkgoT5cWDYL+X1sxJoro94dOHhqLZgS5KtQmsGQHbHpYY0FrBPnH9GKlRkwwAKw/K5odJvuOeNYaUdHoHpgG9Ff/h5IHDZ2tQqStLgnm68a55yR2xY9bvpGO5jPIgggvdU/NkJb5VSpfNvwxISiM0PL5b1v8HbC30owLxz5Hctv/huGkRwgLyDGcN4oBG8D4CqraYcIYEkAKvFy81BAT0+IR/vpBcWNNN9Gi7bM9iEGjRV0l2dtXHAZpRJGJhPIZNtAjM1n6V65l2kjLH/l3QJ9pON3Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com;
	dkim=pass header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5yNciJ0MaHm33mYwu8p1ho4mWYWj3E5JhuQT3rAgcYw=;
	b=riN3AATdn2VdnUvTtx+Jxsa8oOVx2L47gR+4ErUs73lb/BQkjxGpdrh3G5/19MNGVR5G3IVbBiEUPge+wCVtYtBmNkGYpjsth1C6XV423KU8zY3ZrxAJiKesB3ytaQpnlI1qITX/MR66s1WobqyWp/TJciC7t/XRpAnnQCV9+SQ=
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	(2603:10b6:803:47::21) by SN2PR04MB2239.namprd04.prod.outlook.com
	(2603:10b6:804:15::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22;
	Wed, 22 Jul 2020 07:03:21 +0000
Received: from SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2]) by
	SN4PR0401MB3598.namprd04.prod.outlook.com
	([fe80::1447:186c:326e:30b2%7]) with mapi id 15.20.3195.026;
	Wed, 22 Jul 2020 07:03:21 +0000
From: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 02/14] drbd: remove dead code in device_to_statistics
Thread-Index: AQHWX/FEcddsN2HZWUefz5cntVZ8LA==
Date: Wed, 22 Jul 2020 07:03:21 +0000
Message-ID: <SN4PR0401MB3598495DA5AF46CAF019BDC69B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lst.de; dkim=none (message not signed)
	header.d=none;lst.de; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.240.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f03f427f-96e1-4bfc-9150-08d82e0d51eb
x-ms-traffictypediagnostic: SN2PR04MB2239:
x-microsoft-antispam-prvs: <SN2PR04MB2239054EBC0DF37D3B353C339B790@SN2PR04MB2239.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ur+KZmKpBcIPSPWe6QDshqRorQKKgiz4i4dCc2w/Mgbz7W2X8PzWs1JO/Ez/ayfUEGw7CHVyXvb51qPcJ/kYmyK6xIPgf2SVdVkkEstU8iam13w0F19SCf+eRj8nVQ7ykmFe7EozElGPGGESfemi2PLGcEgC0mVW4fTDIhGyMZgyGwP4zS1wKMeg3C57CvkDQFN7jyuHN+vgk3urX8A/Wi8gCKLZQZrgjx14F3Zx1SW48pdzZRYPdlQGi9tBKYXg5C8HGeWUW9xIE3kfLD9WBGjMYnHQrmpbQ8aVDTfpr2TSjasQN8B5kkmY1HTqdVzR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:; IPV:NLI; SFV:NSPM;
	H:SN4PR0401MB3598.namprd04.prod.outlook.com; PTR:; CAT:NONE;
	SFTY:;
	SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(52536014)(4326008)(478600001)(9686003)(7416002)(55016002)(5660300002)(83380400001)(33656002)(558084003)(8676002)(8936002)(76116006)(66476007)(64756008)(66446008)(66556008)(66946007)(26005)(54906003)(86362001)(6506007)(53546011)(316002)(2906002)(71200400001)(110136005)(91956017)(7696005)(186003);
	DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: KbceinDNyzPx6xtboINYdGToiwTAz1b1sqcy4JMns4vDK+CdiytP5ixaX99sg79HGXhTLQN3MRmxAwmHKIEG38IzyJGlFE8ozXaaL1e/+m0CGSTRzMP8kMAtzmhmMVJKgysTJbuOKs/MeLW8PsA3hEQ+IEE7fVp/RLmjBbyUk0CCYT8Xqfwoerkk3t/Zv+Ihqxe/EOSksfJnc18Bo3nq4COV2/J4z1nf96a8H9OJulfoicgWRWF9wAQ8u7c1qV4qTgcYRNOW4NpwdG0errMx/hEziY6zvUYvbNdMl6J0zw5/FH5HTLIiajqWMa33TvanO0rqZP5WYz1GE2mJmvA0L9Atb71q48ThckFf1X+YiTdWkUHaXhBEDPbByN2TTEd5o/HTdEWbUmGwnUWQ9ZoSYbuFckiZEPmEPMgfsAIXg3WwNYyQqUuTL155JwDDs3jxbQPmU5eqmHnqvSVjUejd7JnbKGgslKZGcM4upqYN/jjEKVBuuWS7oAnYQCIuw4MI
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0401MB3598.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03f427f-96e1-4bfc-9150-08d82e0d51eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 07:03:21.5601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n/WE4dczctIGgSYMUR9eZ1R2NyNqbmbwZ/KCyUEJyhcSUO1QWSOT8jiIfxsQMNl1m8YItrC0n0JPgZFdEJWubhU05Q4/a2Blj9MUKK38nfM=
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
Subject: Re: [Drbd-dev] [PATCH 02/14] drbd: remove dead code in
	device_to_statistics
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

On 22/07/2020 08:28, Christoph Hellwig wrote:
> Ever since the switch to blk-mq, a lower device not use by VM
                                           in-use/used? ~^

Also this looks like the last user of 'dev_lower_blocked' so it could
be removed from device_statistics if it's not an ABI (not sure with this
netlink stuff).
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
