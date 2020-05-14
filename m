Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 375B61F8271
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:08:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22F73420403;
	Sat, 13 Jun 2020 12:08:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3357042040B
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:42 +0200 (CEST)
Received: by mail-wm1-f65.google.com with SMTP id b82so1525389wmb.1
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=2cAIpvlCjeek2UlOhaJLhP9ft/jEX+ktFmYjxRqXe+8=;
	b=Tn7mx6C6hnSaI276oP9M2ioZCWQ1UWl28iaweBuAOzcnA1GgJFeaVeFjTzELkvjMRP
	C0IrywXTAqD3gdlqM4rS82RfBK8vjeOZ8eYekNRwbUVO+suO87FSjzUcgNkjbSXCNIUB
	1w4s7uF8qBOicNV4yQwlg7E/my9ZT+8aRWChxKDvBgRwTVg0Dly2sbQZndSm2VDUxs1r
	d1THNb8+LlD1OGQkdIdQiCl3Wn1LCAvv+E/VjHJbUd4bvNHqcNGZseDcrbjVXTbwKQ7Q
	OlaXC/F6BClRYae7/YkHW4eIaLk89d1PmHkyaB0VUQzwCBejJga6r+7VM9FdFTL1g0/r
	yz/g==
X-Gm-Message-State: AOAM531GYinmlVQAaQ5wCzti/ndOROSwOgN3jcD6R9+s9/w9hxS6eUPP
	+VfOz1iD4NhOs9dfw+jEk0HAlDU8Tz1E3Q+U
X-Google-Smtp-Source: ABdhPJw1Vmbb8PFEf2Jmys3uqvW+pAO7bRpYlybrSXCIYVphNqQp2VYLG31ch4TxbsCK8Hi5TSr7MQ==
X-Received: by 2002:a1c:451:: with SMTP id 78mr3430182wme.83.1592042261662;
	Sat, 13 Jun 2020 02:57:41 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	u13sm14042018wrp.53.2020.06.13.02.57.40
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:41 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:39 +0200
Resent-Message-ID: <20200613095739.GB4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1343 seconds by postgrey-1.31 at mail19;
	Thu, 14 May 2020 22:00:10 CEST
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A209A4202B5
	for <drbd-dev@lists.linbit.com>; Thu, 14 May 2020 22:00:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2cAIpvlCjeek2UlOhaJLhP9ft/jEX+ktFmYjxRqXe+8=;
	b=VKrUJVLC1QZKeaeXa89WwIPrud
	xWN6tLhwKrf0IpJKq477Gsgmnmh5IAspTgAHgDcohLeDdrarSFbeKBc4Rw2VutH7Wdqvp+u4GJ57w
	S0xlexgFqHGVwvMQi6/gLdhHcd2BhEAtEJoKic/a9cMDbNfSZrkHXscgCV9WUJWrinXP0EAaolivK
	hCE8IgM4uAPNE59ZVrZ32j3gM0r62sSoSbqGvAOLM1yqh1PJXDV7uEOvyuE6GKFQZHwxYJw4fajs3
	Axa1m0R1dUG8mD1OUgFnasRlFQOsu7tu4NrpejMq4uvEZ+5h/r1+/qUH0gkhEmZ3YbfFR3xYXvB1l
	kED1vgQw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jZJdf-0003fM-JH; Thu, 14 May 2020 19:35:27 +0000
Date: Thu, 14 May 2020 12:35:27 -0700
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <David.Laight@aculab.com>
Message-ID: <20200514193527.GB16070@bombadil.infradead.org>
References: <20200513062649.2100053-1-hch@lst.de>
	<ecc165c33962d964d518c80de605af632eee0474.camel@perches.com>
	<756758e8f0e34e2e97db470609f5fbba@AcuMS.aculab.com>
	<20200514101838.GA12548@lst.de>
	<a76440f7305c4653877ff2abff499f4e@AcuMS.aculab.com>
	<20200514103450.GA12901@lst.de>
	<c2034daa0a23454abb5e5c5714807735@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2034daa0a23454abb5e5c5714807735@AcuMS.aculab.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Eric Dumazet <edumazet@google.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	'Christoph Hellwig' <hch@lst.de>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Ying Xue <ying.xue@windriver.com>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jon Maloy <jmaloy@redhat.com>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	'Joe Perches' <joe@perches.com>, "David S. Miller" <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Drbd-dev] [Ocfs2-devel] remove kernel_setsockopt and
	kernel_getsockopt
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

On Thu, May 14, 2020 at 11:11:34AM +0000, David Laight wrote:
> From: 'Christoph Hellwig'
> > Sent: 14 May 2020 11:35
> > On Thu, May 14, 2020 at 10:26:41AM +0000, David Laight wrote:
> > > From: Christoph Hellwig
> > > > Only for those were we have users, and all those are covered.
> > >
> > > What do we tell all our users when our kernel SCTP code
> > > no longer works?
> > 
> > We only care about in-tree modules, just like for every other interface
> > in the kernel.
> 
> Even if our management agreed to release the code and the code
> layout matched the kernel guidelines you still wouldn't want
> two large drivers that implement telephony functionality
> for hardware that very few people actually have.

Oh, good point, we'll change the policy for all modules and make every
interface in the kernel stable from now on to cater to your special case.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
