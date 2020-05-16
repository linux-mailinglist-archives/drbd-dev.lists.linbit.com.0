Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DB21F827A
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:12:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 92E14420407;
	Sat, 13 Jun 2020 12:12:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0A7AD420415
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:00 +0200 (CEST)
Received: by mail-wm1-f66.google.com with SMTP id f185so10150222wmf.3
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:thread-topic:thread-index:date
	:message-id:references:in-reply-to:accept-language:content-language
	:mime-version:content-transfer-encoding;
	bh=L0NmxDIFDQ6MNNCKR40z04jFss36vdF8ZmRoX0KRxMU=;
	b=QCwYDfmJCdMGlpRFFNhs3MHUBjVSnGLC9kbghMa/ktCW/vXjQa/FDOV2bbmWQDuEYS
	lErKFIdC7AZ7O5LLyEoHJ95JJzgEMA+v4vlaoALQH1xFzYS4+AKwo8ZLiN2rAt8hyT1u
	bFqyrha7oQlfHusEWGAhFbLqq6Y6oUFc1WGfGERb3lYtxLE7RSkciwDWClG83i4RFJfd
	vpRJ2W5jQX2VosWy2XWWH9VlJwew3lCNMb3l3fYlM1QPwPwFeh2nLwxPuFCAR0Y4qT7O
	FUZuD27vmC4jd2/yBLDV5wu4rg+JYrBr793EbEmdMldLCU7urCd5WYR7yMbn/FropmwQ
	RpTg==
X-Gm-Message-State: AOAM532C3dVEFqViqLgpc1uA4VQ74SP65rLfuT0LVN2KJ90y9PdUH7Tq
	XVAAbSBMh9jFrQR6dL+km6bML5YXWGGHDHju
X-Google-Smtp-Source: ABdhPJwuXOKQsh+h/BEhvmiDqV5BGmeyXHDnV0FnS3LSdX7c7vo3WT7wDfRHtXIn6EdoEtTH1QEx4g==
X-Received: by 2002:a1c:6056:: with SMTP id u83mr3090079wmb.138.1592042279479; 
	Sat, 13 Jun 2020 02:57:59 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	d16sm12639222wmd.42.2020.06.13.02.57.58
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:59 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:57 +0200
Resent-Message-ID: <20200613095757.GI4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [207.82.80.151])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87CED420105
	for <drbd-dev@lists.linbit.com>; Sat, 16 May 2020 17:21:18 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-2-M-or8IPqO3ut6gEkeJwgCw-1; Sat, 16 May 2020 16:21:16 +0100
X-MC-Unique: M-or8IPqO3ut6gEkeJwgCw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Sat, 16 May 2020 16:21:15 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Sat, 16 May 2020 16:21:15 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>, David Howells <dhowells@redhat.com>
Thread-Topic: [PATCH 27/33] sctp: export sctp_setsockopt_bindx
Thread-Index: AQHWKsz+yiOODFVfBEqdWGEpseVc56iq0wgA
Date: Sat, 16 May 2020 15:21:15 +0000
Message-ID: <c23030de384747ae83c6c0813bd4f1c0@AcuMS.aculab.com>
References: <20200514062820.GC8564@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-28-hch@lst.de>
	<20200513180058.GB2491@localhost.localdomain>
	<129070.1589556002@warthog.procyon.org.uk>
	<20200515152459.GA28995@lst.de>
In-Reply-To: <20200515152459.GA28995@lst.de>
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

From: Christoph Hellwig
> Sent: 15 May 2020 16:25
> On Fri, May 15, 2020 at 04:20:02PM +0100, David Howells wrote:
> > Christoph Hellwig <hch@lst.de> wrote:
> >
> > > > The advantage on using kernel_setsockopt here is that sctp module will
> > > > only be loaded if dlm actually creates a SCTP socket.  With this
> > > > change, sctp will be loaded on setups that may not be actually using
> > > > it. It's a quite big module and might expose the system.
> > >
> > > True.  Not that the intent is to kill kernel space callers of setsockopt,
> > > as I plan to remove the set_fs address space override used for it.
> >
> > For getsockopt, does it make sense to have the core kernel load optval/optlen
> > into a buffer before calling the protocol driver?  Then the driver need not
> > see the userspace pointer at all.
> >
> > Similar could be done for setsockopt - allocate a buffer of the size requested
> > by the user inside the kernel and pass it into the driver, then copy the data
> > back afterwards.
> 
> I did look into that initially.  The problem is that tons of sockopts
> entirely ignore optlen and just use a fixed size.  So I fear that there
> could be tons of breakage if we suddently respect it.  Otherwise that
> would be a pretty nice way to handle the situation.

I'd guess that most application use the correct size for setsockopt().
(Well, apart from using 4 instead of 1.)

It is certainly possible to always try to read in 64 bytes
regardless of the supplied length, but handle the EFAULT case
by shortening the buffer.

Historically getsockopt() only wrote the length back.
Treating 0 and garbage as (say) 4k and letting the protocol
code set a shorten the copy to user might work.
All short transfers would want to use an on-stack buffer,
so slight oversizes could also be allowed for.

OTOH if i did a getsockopt() with too short a length I wouldn't
want the kernel to trash my program memory.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
