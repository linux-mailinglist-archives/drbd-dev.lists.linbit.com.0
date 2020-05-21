Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8848E1F82B4
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:18:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 70EA24203F9;
	Sat, 13 Jun 2020 12:18:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 59BB8420424
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:38 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id x6so12245022wrm.13
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=4AWH1AUEd7Au/qvsJAY3f3OpE4viRwDzW+yF47F593Y=;
	b=DEwEouY3CpjGZW6Lbpm2CXKvJDkMiIW/HpI1Y1C4xHG1fkFQbWaQDdR8awky3AfTu1
	r0lf3UXd5EEdebT+fk7QJQWone93I2kI5cXj6YiFpNUWaeEi+GSNIzH9ebqi3LBJsi8r
	eHJKMdpZvaniGIksw1bGtqyBe/PreaLXEfr1XK7liBfP42da75DRcRo5jkpl/W8F7UxE
	Ga0zsu41w0OeymKd+S609ZdfwszsY8or89je0fIofNVQS4QRDGud3DhD4w1iW58GGSBg
	KZqnv8i6yhaV5GdkLB3BcoECzp95/SeBHBSahrCuH4V+YUrRWz8hhRrGa3T9XMIgXPKY
	lcAQ==
X-Gm-Message-State: AOAM530VH4qAks8ABlV5Shk74+qlFFarTu9dhUtCvzLFUkcQ45PZoCl/
	Th7nZc9y/Z7RNkoDM8QXRiT+BI2mge15IFj7
X-Google-Smtp-Source: ABdhPJymB8kXrPD2vVdpg2V+126ZeDuEUv0QpBSlxIm0f0wVdsCaavGdK3odV9kFmLpOWX90cV7L2A==
X-Received: by 2002:a5d:428e:: with SMTP id k14mr19020760wrq.21.1592042317803; 
	Sat, 13 Jun 2020 02:58:37 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	i8sm13403726wru.30.2020.06.13.02.58.37
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:37 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:35 +0200
Resent-Message-ID: <20200613095835.GU4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E33974203D6
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 15:54:47 +0200 (CEST)
Received: by mail-qt1-f193.google.com with SMTP id v4so5517538qte.3
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=4AWH1AUEd7Au/qvsJAY3f3OpE4viRwDzW+yF47F593Y=;
	b=MadH9FDDGvoxe4fUbjh7p4mwB3ng32aoog6jBUA4hFSZAKoaWEKqesMpS8Mdgd0nR2
	mDTgZteXtTpdXw8EluT3/45VBYy3VnVHtEsyutIuba5pFOT1ONq06EfpFZxfbAM+uqBt
	ivy6cbOcjc9wKcedTtgupAWJ4hGHRK6MDbC5Mf63igyieBqM3YqmiNMYpXIlyth7uy+c
	dK6YjZCUy66fZodoZfuNm2c+b7Jy5HP8GX2o3qqoiVU9U/KOnqcAZfrpq9vj9G7eqhyl
	9Xb6Y7o7onhxN0YVZPLVzb6piACyAq9ppSHsg5oJrX7hlGZSAgGYua7uGRRSN/cVwcZH
	Oc1g==
X-Received: by 2002:ac8:4c8b:: with SMTP id j11mr10385232qtv.58.1590069286825; 
	Thu, 21 May 2020 06:54:46 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.225])
	by smtp.gmail.com with ESMTPSA id
	n85sm1682417qkn.31.2020.05.21.06.54.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 May 2020 06:54:46 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 7AEDAC0BEB; Thu, 21 May 2020 10:54:43 -0300 (-03)
Date: Thu, 21 May 2020 10:54:43 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200521135443.GY2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-33-hch@lst.de>
	<20200520230025.GT2491@localhost.localdomain>
	<20200521084224.GA7859@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521084224.GA7859@lst.de>
Cc: Eric Dumazet <edumazet@google.com>, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	Jakub Kicinski <kuba@kernel.org>, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH 32/33] net: add a new bind_add method
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

On Thu, May 21, 2020 at 10:42:24AM +0200, Christoph Hellwig wrote:
> On Wed, May 20, 2020 at 08:00:25PM -0300, Marcelo Ricardo Leitner wrote:
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	lock_sock(sk);
> > > +	err = sctp_do_bind(sk, (union sctp_addr *)addr, af->sockaddr_len);
> > > +	if (!err)
> > > +		err = sctp_send_asconf_add_ip(sk, addr, 1);
> > 
> > Some problems here.
> > - addr may contain a list of addresses
> > - the addresses, then, are not being validated
> > - sctp_do_bind may fail, on which it requires some undoing
> >   (like sctp_bindx_add does)
> > - code duplication with sctp_setsockopt_bindx.
> 
> sctp_do_bind and thus this function only support a single address, as
> that is the only thing that the DLM code requires.  I could move the

I see.

> user copy out of sctp_setsockopt_bindx and reuse that, but it is a
> rather rcane API.

Yes. With David's patch, which is doing that, it can be as simple as:

static int sctp_bind_add(struct sock *sk, struct sockaddr *addr,
               int addrlen)
{
	int ret;
	lock_sock(sk);
	ret = sctp_setsockopt_bindx(sk, addr, addrlen, SCTP_BINDX_ADD_ADDR);
	release_sock(sk);
	return ret;
}

and then dlm would be using code that we can test through sctp-only tests as
well.

> 
> > 
> > This patch will conflict with David's one,
> > [PATCH net-next] sctp: Pull the user copies out of the individual sockopt functions.
> 
> Do you have a link?  A quick google search just finds your mail that
> I'm replying to.

https://lore.kernel.org/netdev/fd94b5e41a7c4edc8f743c56a04ed2c9%40AcuMS.aculab.com/T/

> 
> > (I'll finish reviewing it in the sequence)
> > 
> > AFAICT, this patch could reuse/build on his work in there. The goal is
> > pretty much the same and would avoid the issues above.
> > 
> > This patch could, then, point the new bind_add proto op to the updated
> > sctp_setsockopt_bindx almost directly.
> > 
> > Question then is: dlm never removes an addr from the bind list. Do we
> > want to add ops for both? Or one that handles both operations?
> > Anyhow, having the add operation but not the del seems very weird to
> > me.
> 
> We generally only add operations for things that we actually use.
> bind_del is another logical op, but we can trivially add that when we
> need it.

Right, okay.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
