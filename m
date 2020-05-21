Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 330891F8292
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:17:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1005C4203FC;
	Sat, 13 Jun 2020 12:17:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D1AAC420421
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:26 +0200 (CEST)
Received: by mail-wr1-f41.google.com with SMTP id l11so12301602wru.0
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:thread-topic:thread-index:date
	:message-id:references:in-reply-to:accept-language:content-language
	:mime-version:content-transfer-encoding;
	bh=vu0w9oq9KsVDEJPE5CIIhWhjuV3kpDCP0yt42Fd9jEM=;
	b=rpi5VK8K3WSyB3PsFLGXkA7TocWfG6JMH5Zt2fYqwOwYm2tTJfTRjIryi7TL0EV6KV
	3c3/a/xXFmfDqRotVywNM8CAZmn72ETmObxElMukYhY5wGE9L5kgmTMWyqGDbZVdT9OG
	w2CN2oqWQnpkC7Z545VbIkLy6M99AgmWoF8UNyQa+SSE+0N00uaond5WT0jI6j1hc+y8
	gzsn+ehHHlzjzwxQ8IiAyXOQwYYRT9gofF61HkctHMUDJ5q9iiGM9EvTeHmv+yQ4RjZA
	iSnp/vrfMAmzXPHN43i3I8gT/boEB8s6H1m3h9eEKC4lM5KYbfFT+HA0D/JMPc6c+/x/
	44lg==
X-Gm-Message-State: AOAM530+z5GV4kBoQTRafGptLKgCZqLmU+MbywxHM5AQ3C6bDYCwkSTw
	fOxg5hOybpPe25gznlAxTE4sjOZeq8w1Z0mB
X-Google-Smtp-Source: ABdhPJw1Iqy5BpYwRHamO2L+vBdjJJ3oa8J+NvY5FXkMW4eKNHtLhGwYG5s1d2m78Uz7KTEPfD9P6A==
X-Received: by 2002:adf:ecc2:: with SMTP id s2mr21049678wro.60.1592042306034; 
	Sat, 13 Jun 2020 02:58:26 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	p7sm14383155wro.26.2020.06.13.02.58.25
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:25 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:23 +0200
Resent-Message-ID: <20200613095823.GS4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [146.101.78.151])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87C674203D6
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 12:46:36 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-221-qFd0NAKZNGeARFK-F-oKaQ-1; Thu, 21 May 2020 11:46:34 +0100
X-MC-Unique: qFd0NAKZNGeARFK-F-oKaQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Thu, 21 May 2020 11:46:33 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Thu, 21 May 2020 11:46:33 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>
Thread-Topic: remove kernel_setsockopt and kernel_getsockopt v2
Thread-Index: AQHWL0EWFDRlmpM/90uRt9jvD36P/KiyKtMAgAAFoACAACnvQA==
Date: Thu, 21 May 2020 10:46:33 +0000
Message-ID: <b7c7cf98999f4167b821f4425896e4e8@AcuMS.aculab.com>
References: <20200520195509.2215098-1-hch@lst.de>
	<138a17dfff244c089b95f129e4ea2f66@AcuMS.aculab.com>
	<20200521091150.GA8401@lst.de>
In-Reply-To: <20200521091150.GA8401@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Cc: Marcelo Ricardo
	Leitner <marcelo.leitner@gmail.com>, Eric Dumazet <edumazet@google.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Jakub Kicinski <kuba@kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Drbd-dev] remove kernel_setsockopt and kernel_getsockopt v2
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

From: 'Christoph Hellwig'
> Sent: 21 May 2020 10:12
...
> > I worried about whether getsockopt() should read the entire
> > user buffer first. SCTP needs the some of it often (including a
> > sockaddr_storage in one case), TCP needs it once.
> > However the cost of reading a few words is small, and a big
> > buffer probably needs setting to avoid leaking kernel
> > memory if the structure has holes or fields that don't get set.
> > Reading from userspace solves both issues.
> 
> As mention in the thread on the last series:  That was my first idea, but
> we have way to many sockopts, especially in obscure protocols that just
> hard code the size.  The chance of breaking userspace in a way that can't
> be fixed without going back to passing user pointers to get/setsockopt
> is way to high to commit to such a change unfortunately.

Right the syscall stubs probably can't do it.
But the per-protocol ones can for the main protocols.

I posted a patch for SCTP yesterday that removes 800 lines
of source and 8k of object code.
Even that needs a horrid bodge for one request where the
length returned has to be less than the data copied!

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
