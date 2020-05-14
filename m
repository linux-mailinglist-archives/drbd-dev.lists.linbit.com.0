Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E12531F826B
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:05:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C8EB14203F1;
	Sat, 13 Jun 2020 12:05:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 44558420408
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:16 +0200 (CEST)
Received: by mail-wm1-f49.google.com with SMTP id d128so10159028wmc.1
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:thread-topic:thread-index:date
	:message-id:references:in-reply-to:accept-language:content-language
	:mime-version:content-transfer-encoding;
	bh=5ZRB2kKSVaRsmpau01yZmZ18zPbqSizpiIVw1i19lLs=;
	b=rWFOew3eEPRvAWzmWjaqewc7PvrXGNF531SJk7XqQeLJ+C41v2GhmnOc8nfNXZnUaa
	SHQr64WrF9NPZpdg/gU5VYhD5rJCN7eeTff/xRxkWuHx9LbCxDpeecGdOskmRhO7WrnN
	5dynKKNEinGo4ovwGLl8YUPqXikX79TN+JM8DwZoSfd9TqtXbMFhTOgjrQiIBDIHeupa
	GEx8e5Ez3txi+IeivzrMy0QhByXqsqf4w/NJedNa7qBdduBJw0bkeG2V9AmKVQE/cB+I
	rmI1V6Lfp17nB5DK4LaW2lqZVPENb32TgBL3M91ErW603Pug4cGwfSEn6WnYjTfN33vl
	kKZw==
X-Gm-Message-State: AOAM530B9yJ19Gl4AEfp2ymxoZN8Q1l+KR2KJ1+SRM0VdfVzyXWrPJX9
	rWKcFIfcvV/RV7X5n4SkU1z+amsYkE0wEfQy
X-Google-Smtp-Source: ABdhPJwnv4kupsOGjo5SZXPhWJQ90AoTv34VF8VpKXvcN/1PZsaN8HGsCXew0tUwba6lKlG1vrivdg==
X-Received: by 2002:a1c:810a:: with SMTP id c10mr3222657wmd.107.1592042236433; 
	Sat, 13 Jun 2020 02:57:16 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	c70sm12134011wme.32.2020.06.13.02.57.15
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:15 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:14 +0200
Resent-Message-ID: <20200613095714.GV4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [146.101.78.151])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 48DDC4202B5
	for <drbd-dev@lists.linbit.com>; Thu, 14 May 2020 12:26:44 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-129-mzoWMat6PF2wNz8vgiMclw-1; Thu, 14 May 2020 11:26:43 +0100
X-MC-Unique: mzoWMat6PF2wNz8vgiMclw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Thu, 14 May 2020 11:26:41 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Thu, 14 May 2020 11:26:41 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christoph Hellwig' <hch@lst.de>
Thread-Topic: remove kernel_setsockopt and kernel_getsockopt
Thread-Index: AQHWKU15LJmP4mOGDE2/GHhLszFt9KinP7aQgAAO/ACAABIowA==
Date: Thu, 14 May 2020 10:26:41 +0000
Message-ID: <a76440f7305c4653877ff2abff499f4e@AcuMS.aculab.com>
References: <20200513062649.2100053-1-hch@lst.de>
	<ecc165c33962d964d518c80de605af632eee0474.camel@perches.com>
	<756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
	<20200514101838.GA12548@lst.de>
In-Reply-To: <20200514101838.GA12548@lst.de>
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
	Eric Dumazet <edumazet@google.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>, Alexey
	Kuznetsov <kuznet@ms2.inr.ac.ru>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	'Joe Perches' <joe@perches.com>, Jakub Kicinski <kuba@kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jon Maloy <jmaloy@redhat.com>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Drbd-dev] remove kernel_setsockopt and kernel_getsockopt
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
> Only for those were we have users, and all those are covered.

What do we tell all our users when our kernel SCTP code
no longer works?

It uses SO_REUSADDR, SCTP_EVENTS, SCTP_NODELAY,
SCTP_STATUS, SCTP_INITMSG, IPV6_ONLY, SCTP_SOCKOPT_BINDX_ADD
and SO_LINGER.
We should probably use the CONNECTX function as well.

I doubt we are the one company with out-of-tree drivers
that use the kernel_socket interface.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
