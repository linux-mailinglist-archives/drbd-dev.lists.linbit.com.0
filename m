Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 521211F826D
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:06:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 38BF94203F8;
	Sat, 13 Jun 2020 12:06:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1B1114203FD
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:22 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id t18so12294563wru.6
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:thread-topic:thread-index:date
	:message-id:references:in-reply-to:accept-language:content-language
	:mime-version:content-transfer-encoding;
	bh=r1GnXtRwmT0Sgkbn5u1+7TdKQfdLM7DqMycgovV8SKQ=;
	b=WKfwJVxN77yzBviy8M3ce5f0ZLayO++4mq7qdPo7QFwrBaK3fUbphNr2FsT0UaeyFC
	G8XfMkpuy+P0FBUaU4g8RtrjxG5kCufXya3ycGFfSltNa1Gn4RLNpOiKnwc4xZ3u7zxG
	mvPnx/0zNf6FHOp8QxbvA4XKx+AIzx6/bMTBjU68eFl3gmVaVYOBA8lG4RmGbr7FOLar
	h+a1HiJuWg15Mvsw3QxiBWcCizw3YPnQDRYZH1+Q5RCIUbW9TGIPPzqZ/befgC2paNmw
	4nGUXITgVBYDG30j2tYlmObjtuWPF9RQr5sRa8iB0l95csufpcM0032d0MwWHflRgcl0
	p6Yg==
X-Gm-Message-State: AOAM532wEGtgb3XFtCl4rK3PaVmeb11dqHIosCzl7JH8bHMDLdW+7pGn
	yzrlJFxIHImz5UTSauW/zGk8m2uU5oasCEi7
X-Google-Smtp-Source: ABdhPJzsQY1RiJRQlz6tO8E/1cniD7KVaOrhV2HLkjXDFaKvKtIMIuZ7/UYcSDdOkwyDYvbLmGjb/w==
X-Received: by 2002:a5d:4a0d:: with SMTP id m13mr20236991wrq.12.1592042241598; 
	Sat, 13 Jun 2020 02:57:21 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	a81sm13449773wmd.25.2020.06.13.02.57.20
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:21 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:19 +0200
Resent-Message-ID: <20200613095719.GX4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [207.82.80.151])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C2FE4202B5
	for <drbd-dev@lists.linbit.com>; Thu, 14 May 2020 14:30:20 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-254-IsdhEyj2MaapF7FHDwegSA-1; Thu, 14 May 2020 13:30:18 +0100
X-MC-Unique: IsdhEyj2MaapF7FHDwegSA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May 2020 13:30:17 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Thu, 14 May 2020 13:30:17 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Marcelo Ricardo Leitner' <marcelo.leitner@gmail.com>, 'Christoph Hellwig'
	<hch@lst.de>
Thread-Topic: [PATCH 32/33] sctp: add sctp_sock_get_primary_addr
Thread-Index: AQHWKVDpRRlTTX4YZEat3HB6AYvqqainVRxwgAAtMyA=
Date: Thu, 14 May 2020 12:30:17 +0000
Message-ID: <c66e0309572345f5b0f32d078701f2d7@AcuMS.aculab.com>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-33-hch@lst.de>
	<20200513180302.GC2491@localhost.localdomain>
	<d112e18bfbdd40dfb219ed2c1f2082d4@AcuMS.aculab.com>
In-Reply-To: <d112e18bfbdd40dfb219ed2c1f2082d4@AcuMS.aculab.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Cc: 'Eric Dumazet' <edumazet@google.com>,
	"'linux-nvme@lists.infradead.org'" <linux-nvme@lists.infradead.org>,
	"'linux-sctp@vger.kernel.org'" <linux-sctp@vger.kernel.org>,
	"'target-devel@vger.kernel.org'" <target-devel@vger.kernel.org>,
	"'linux-afs@lists.infradead.org'" <linux-afs@lists.infradead.org>,
	"'drbd-dev@lists.linbit.com'" <drbd-dev@lists.linbit.com>,
	"'linux-cifs@vger.kernel.org'" <linux-cifs@vger.kernel.org>,
	"'rds-devel@oss.oracle.com'" <rds-devel@oss.oracle.com>,
	"'linux-rdma@vger.kernel.org'" <linux-rdma@vger.kernel.org>,
	"'cluster-devel@redhat.com'" <cluster-devel@redhat.com>,
	'Alexey Kuznetsov' <kuznet@ms2.inr.ac.ru>,
	"'linux-block@vger.kernel.org'" <linux-block@vger.kernel.org>,
	'Jakub Kicinski' <kuba@kernel.org>,
	"'ceph-devel@vger.kernel.org'" <ceph-devel@vger.kernel.org>,
	"'linux-nfs@vger.kernel.org'" <linux-nfs@vger.kernel.org>,
	'Neil Horman' <nhorman@tuxdriver.com>,
	'Hideaki YOSHIFUJI' <yoshfuji@linux-ipv6.org>,
	"'netdev@vger.kernel.org'" <netdev@vger.kernel.org>, 'Vlad
	Yasevich' <vyasevich@gmail.com>,
	"'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>,
	'Jon Maloy' <jmaloy@redhat.com>, 'Ying Xue' <ying.xue@windriver.com>,
	"'David S. Miller'" <davem@davemloft.net>,
	"'ocfs2-devel@oss.oracle.com'" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Drbd-dev] [PATCH 32/33] sctp: add sctp_sock_get_primary_addr
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

From: David Laight
> Sent: 14 May 2020 10:51
> From: Marcelo Ricardo Leitner
> > Sent: 13 May 2020 19:03
> >
> > On Wed, May 13, 2020 at 08:26:47AM +0200, Christoph Hellwig wrote:
> > > Add a helper to directly get the SCTP_PRIMARY_ADDR sockopt from kernel
> > > space without going through a fake uaccess.
> >
> > Same comment as on the other dlm/sctp patch.
> 
> Wouldn't it be best to write sctp_[gs]etsockotp() that
> use a kernel buffer and then implement the user-space
> calls using a wrapper that does the copies to an on-stack
> (or malloced if big) buffer.

Actually looking at __sys_setsockopt() it calls
BPF_CGROUP_RUN_PROG_SETSOCKOPT() which (by the look of it)
can copy the user buffer into malloc()ed memory and
cause set_fs(KERNEL_DS) be called.

The only way to get rid of that set_fs() is to always
have the buffer in kernel memory when the underlying
setsockopt() code is called.

The comment above __sys_[sg]etsockopt() about not knowing
the length is just wrong.
It probably applied to getsockopt() in the dim and distant
past before it was made read-update.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
