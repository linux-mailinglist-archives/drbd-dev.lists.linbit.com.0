Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F35C41F8285
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:16:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CFBC14203F9;
	Sat, 13 Jun 2020 12:16:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 440A1420420
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:23 +0200 (CEST)
Received: by mail-wm1-f44.google.com with SMTP id g10so10027067wmh.4
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:thread-topic:thread-index:date
	:message-id:references:in-reply-to:accept-language:content-language
	:mime-version:content-transfer-encoding;
	bh=svAX+iT8Xbgbyyn9slOKAkzLu+x5YmCHKil6oOR+8/g=;
	b=XqAljCrTTJ7XamIOkWKtVwjWIpajYmMRa2IBeheQ//H+xNwrMoeHcNwHHeKmyPZ6Q6
	JgFUkVEUe4hY6ue4173NYUPiOYFglhtLygkBkWR56arCwHXUawqQmZMYixyZRYj5QLpL
	OimYfS6W+92GxsFA5XrGRbusdkVuDR6t7AjV7ceA/l5Pb0OUTaUrEbnlgfe+24//8MZ2
	4Os8jDgRAdCL8DkDxy8f6FNa4uaT1C+1iD0hM6AE8igQlGO/PcJzK9CNPxPe3uOMfMXP
	XWXzRsShwz4p/U0bMxOX6/P6GtADoXaWrK6F9F5Wp1YPextpZ2MxGFlu0k2nMg/Ru7mS
	XC6A==
X-Gm-Message-State: AOAM530Jt8NKVk0AlWNTmknMVvU+5W0uTa82gM262w1FSOIMO5O4paNk
	79RywkLE1hAtAP4XkXN3k2HUZSs0YOjipHDo
X-Google-Smtp-Source: ABdhPJzM9UL3aCiuyMtOSbqmLmbPKU/FHEccUUuQ3ap5gE0SKHP5FemovPfOTz52CjfB8u744eFNvg==
X-Received: by 2002:a7b:c0cc:: with SMTP id s12mr3323810wmh.111.1592042303441; 
	Sat, 13 Jun 2020 02:58:23 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	s72sm12345254wme.35.2020.06.13.02.58.22
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:22 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:21 +0200
Resent-Message-ID: <20200613095821.GR4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [207.82.80.151])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 91CBD4203D6
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 11:06:23 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mtapsc-2-5zY-0iRdNzGaTxwUZDYv5A-1; Thu, 21 May 2020 10:06:20 +0100
X-MC-Unique: 5zY-0iRdNzGaTxwUZDYv5A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Thu, 21 May 2020 10:06:19 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Thu, 21 May 2020 10:06:19 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, Marcelo Ricardo Leitner
	<marcelo.leitner@gmail.com>
Thread-Topic: [PATCH 31/33] sctp: add sctp_sock_set_nodelay
Thread-Index: AQHWL0qynFLZF0CI80WcvwAESh6D26iyPrKg
Date: Thu, 21 May 2020 09:06:19 +0000
Message-ID: <0a6839ab0ba04fcf9b9c92784c9564aa@AcuMS.aculab.com>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-32-hch@lst.de>
	<20200520231001.GU2491@localhost.localdomain>
	<20200520.162355.2212209708127373208.davem@davemloft.net>
	<20200520233913.GV2491@localhost.localdomain>
	<20200521083442.GA7771@lst.de>
In-Reply-To: <20200521083442.GA7771@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Cc: "edumazet@google.com" <edumazet@google.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"kuznet@ms2.inr.ac.ru" <kuznet@ms2.inr.ac.ru>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"nhorman@tuxdriver.com" <nhorman@tuxdriver.com>,
	"yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"vyasevich@gmail.com" <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jmaloy@redhat.com" <jmaloy@redhat.com>,
	"ying.xue@windriver.com" <ying.xue@windriver.com>,
	David Miller <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Drbd-dev] [PATCH 31/33] sctp: add sctp_sock_set_nodelay
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

From: Christoph Hellwig
> Sent: 21 May 2020 09:35
> On Wed, May 20, 2020 at 08:39:13PM -0300, Marcelo Ricardo Leitner wrote:
> > On Wed, May 20, 2020 at 04:23:55PM -0700, David Miller wrote:
> > > From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
> > > Date: Wed, 20 May 2020 20:10:01 -0300
> > >
> > > > The duplication with sctp_setsockopt_nodelay() is quite silly/bad.
> > > > Also, why have the 'true' hardcoded? It's what dlm uses, yes, but the
> > > > API could be a bit more complete than that.
> > >
> > > The APIs are being designed based upon what in-tree users actually
> > > make use of.  We can expand things later if necessary.
> >
> > Sometimes expanding things later can be though, thus why the worry.
> > But ok, I get it. Thanks.
> >
> > The comment still applies, though. (re the duplication)
> 
> Where do you see duplication?

The whole thing just doesn't scale.

As soon as you get to the slightly more complex requests
like SCTP_INITMSG (which should probably be called to
set the required number of data streams) you've either
got replicated code or nested wrappers.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
