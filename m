Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 916611F8275
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:09:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7C885420403;
	Sat, 13 Jun 2020 12:09:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3B88142040D
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:47 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id c3so12242186wru.12
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:thread-topic:thread-index:date
	:message-id:references:in-reply-to:accept-language:content-language
	:mime-version:content-transfer-encoding;
	bh=PF9gEQSTyRac1aS2oMIdxoWtoYBeE2lIupe1UOJlIv8=;
	b=XPQa3Qb8wCTnl2UhnT1NI4weOsqAJ6E7ldIKsPPhrMsxNIGKAVlfFyhwQYGACDi3vq
	8QhnBvvRWJejDJyHO550TzwstgAzJgUs8GiDwkM/IDk8L5g1vRSNz6L+yU3maJyDDKEC
	guXFXLjLo1xHCtMVOImqvJOGdd7t0K0/Kuceolz7t4biqE+tcLKdCIdx0z6A7ilAV0gr
	nCCIAjKBH0P6hrZ+yx6aeNtVyzDgaoEqW1jmTQ/PfSiZ9w6YPQeLZzgpCz6qMuwyyG63
	usAP9JXVOBow1Pe3g+eScsARsZtuPmm8gseYEyY8s9mIHioYD3W/LFLIiZGhh3fAd8gC
	HJxw==
X-Gm-Message-State: AOAM530oSoSXOHhfqvgiQ49OeRNFCzY6ORETwFAWoHKqoW6BKDIu32Gv
	SKGSKKekBq7Ji4CTC3UffMfVB6vb0n7o/crB
X-Google-Smtp-Source: ABdhPJz5RBU+Bxw1pOIaRD1us1NoXFdYaRmDzqmKpg8vip9DvEBN5CY6mJQG6Xc4gELar5EXppq17w==
X-Received: by 2002:adf:df03:: with SMTP id y3mr18350430wrl.376.1592042266751; 
	Sat, 13 Jun 2020 02:57:46 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	d17sm14926012wrg.75.2020.06.13.02.57.46
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:46 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:44 +0200
Resent-Message-ID: <20200613095744.GD4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from eu-smtp-delivery-151.mimecast.com
	(eu-smtp-delivery-151.mimecast.com [146.101.78.151])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DB0BE4203EA
	for <drbd-dev@lists.linbit.com>; Fri, 15 May 2020 10:14:10 +0200 (CEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	uk-mta-135-kgvmV9-GP7CT7oWXwAS8yw-1; Fri, 15 May 2020 09:14:08 +0100
X-MC-Unique: kgvmV9-GP7CT7oWXwAS8yw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
	AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft
	SMTP Server (TLS) id 15.0.1347.2; Fri, 15 May 2020 09:14:07 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
	AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id
	15.00.1347.000; Fri, 15 May 2020 09:14:07 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'David Miller' <davem@davemloft.net>
Thread-Topic: remove kernel_setsockopt and kernel_getsockopt
Thread-Index: AQHWKU15LJmP4mOGDE2/GHhLszFt9KinP7aQgAAO/ACAABIowIAAkWGAgADbQOA=
Date: Fri, 15 May 2020 08:14:07 +0000
Message-ID: <29428bc7a5344412be9f632bced8888d@AcuMS.aculab.com>
References: <756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
	<20200514101838.GA12548@lst.de>
	<a76440f7305c4653877ff2abff499f4e@AcuMS.aculab.com>
	<20200514.130357.1683454520750761365.davem@davemloft.net>
In-Reply-To: <20200514.130357.1683454520750761365.davem@davemloft.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Cc: "marcelo.leitner@gmail.com" <marcelo.leitner@gmail.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"edumazet@google.com" <edumazet@google.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	"hch@lst.de" <hch@lst.de>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"kuznet@ms2.inr.ac.ru" <kuznet@ms2.inr.ac.ru>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"joe@perches.com" <joe@perches.com>, "kuba@kernel.org" <kuba@kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	"nhorman@tuxdriver.com" <nhorman@tuxdriver.com>,
	"yoshfuji@linux-ipv6.org" <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"vyasevich@gmail.com" <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"jmaloy@redhat.com" <jmaloy@redhat.com>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"ying.xue@windriver.com" <ying.xue@windriver.com>,
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

Looking at __sys_setsockopt() I noticed that the BPF intercept
can also cause set_fs(KERNEL_DS) be set in order to pass a
modified buffer into the actual setsockopt() code.

If that functionality is to be kept then the underlying
protocol specific code needs changing to accept a kernel buffer.

The 32bit compat code would also be a lot simpler if it could
pass an kernel buffer through.
At the moment it copies the modified buffer back out onto the
user stack.

I'm sure there have been suggestions to remove that complete hack.
Fixing the compat code would leave a kernel_[sg]et_sockopt() that
still worked.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
