Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7850E1F8279
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:11:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 63C9E420407;
	Sat, 13 Jun 2020 12:11:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8B9A8420414
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:57 +0200 (CEST)
Received: by mail-wm1-f67.google.com with SMTP id r9so10050994wmh.2
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:thread-topic:thread-index:date
	:message-id:references:in-reply-to:accept-language:content-language
	:mime-version:content-transfer-encoding;
	bh=U2L/1oehuZXNm/3X1Uc3ekgzLjNn8n4NGw37R5px3J8=;
	b=JqVVLy8YvTID1HQ62kGhF5/JoY4iA5BC9UYYWR2kHIMKzAF+VmUTtJftFW+KRkRWDK
	fRt44ZXpAMtAP3A5CDhaRe2lIg5YsVLz8esseMcsU4F2WJcUc3QizO7jeUS+OZE6dDnF
	N6ZJtbcuBMsmJ4gHKh8CfJw8p8Xj3EDLlovqIJxnGKKOiz7bgtlJ4q/xZ0yoLztfFVqh
	ldf0lyZGJ1rwOEkZpqudblEUL4ZYN1ahtm8aCssqPYUnNwoNuqgumcUOHrnI5ys8OIgB
	nilpFjU1Xg2zm3jOhg090gkC1tg4KEoUmMF6+prt8+OPLcH2XcQ4QIxILpXFLkgR44Z0
	fXzg==
X-Gm-Message-State: AOAM530/46b92wUT5U46A2GzVTKOsNscZ9tdfZuLWO42Qt01k38eYBAy
	ZlLDhvUg+NuTJW4IH6A3jnRHqy3Rv02jD90D
X-Google-Smtp-Source: ABdhPJxbyimfUnPGalTei4GnNckUz88urD3h0Xr3EjFtr34579axKTK75VCFmChI7ZEZk3lLfq/bxg==
X-Received: by 2002:a05:600c:28e:: with SMTP id
	14mr3100979wmk.167.1592042276961; 
	Sat, 13 Jun 2020 02:57:56 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	o10sm14082833wrq.40.2020.06.13.02.57.56
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:56 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:54 +0200
Resent-Message-ID: <20200613095754.GH4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [207.82.80.151])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC6184202B6
	for <drbd-dev@lists.linbit.com>; Sat, 16 May 2020 17:11:43 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-182-psAgggZzN62zzCab8iGYhQ-1; Sat, 16 May 2020 16:11:41 +0100
X-MC-Unique: psAgggZzN62zzCab8iGYhQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Sat, 16 May 2020 16:11:40 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Sat, 16 May 2020 16:11:40 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'David Howells' <dhowells@redhat.com>, Christoph Hellwig <hch@lst.de>
Thread-Topic: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
Thread-Index: AQHWKsxNyiOODFVfBEqdWGEpseVc56iq0duQ
Date: Sat, 16 May 2020 15:11:40 +0000
Message-ID: <05d946ae948946158dbfcbc07939b799@AcuMS.aculab.com>
References: <20200514062820.GC8564@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-28-hch@lst.de>
	<20200513180058.GB2491@localhost.localdomain>
	<129070.1589556002@warthog.procyon.org.uk>
In-Reply-To: <129070.1589556002@warthog.procyon.org.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>, Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Drbd-dev] [PATCH 27/33] sctp: export sctp_setsockopt_bindx
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

From: David Howells
> Sent: 15 May 2020 16:20
> Christoph Hellwig <hch@lst.de> wrote:
> 
> > > The advantage on using kernel_setsockopt here is that sctp module will
> > > only be loaded if dlm actually creates a SCTP socket.  With this
> > > change, sctp will be loaded on setups that may not be actually using
> > > it. It's a quite big module and might expose the system.
> >
> > True.  Not that the intent is to kill kernel space callers of setsockopt,
> > as I plan to remove the set_fs address space override used for it.
> 
> For getsockopt, does it make sense to have the core kernel load optval/optlen
> into a buffer before calling the protocol driver?  Then the driver need not
> see the userspace pointer at all.
> 
> Similar could be done for setsockopt - allocate a buffer of the size requested
> by the user inside the kernel and pass it into the driver, then copy the data
> back afterwards.

Yes, it also simplifies all the compat code.
And there is a BPF test in setsockopt that also wants to
pass on a kernel buffer.

I'm willing to sit and write the patch.
Quoting from a post I made later on Friday.

Basically:

This patch sequence (to be written) does the following:

Patch 1: Change __sys_setsockopt() to allocate a kernel buffer,
         copy the data into it then call set_fs(KERNEL_DS).
         An on-stack buffer (say 64 bytes) will be used for
         small transfers.

Patch 2: The same for __sys_getsockopt().

Patch 3: Compat setsockopt.

Patch 4: Compat getsockopt.

Patch 5: Remove the user copies from the global socket options code.

Patches 6 to n-1; Remove the user copies from the per-protocol code.

Patch n: Remove the set_fs(KERNEL_DS) from the entry points.

This should be bisectable.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
