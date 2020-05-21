Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 696CA1F82A0
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:17:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 42A884203FD;
	Sat, 13 Jun 2020 12:17:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1DC13420423
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:29 +0200 (CEST)
Received: by mail-wm1-f68.google.com with SMTP id y20so10155419wmi.2
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=EQm3KwRvgaHxQ5d1Q4EsqwYQDDPz8ESa9iFyt4vvvfU=;
	b=i2pUGpgkK6mJPvQhpFIDtVKm2iGQpD4GA1jxrr/wBA5q566H8fOZBIby6343qfTpcS
	bhzy0I/L84KPiBaM5vNhN1QmtQmlqsfYiTnJdlD+llyOflxuwa5HE0yMxaSl83Z/oDxZ
	f6B1926rq6PKXQA/Ie05WgVhz7EBF/m/L9C1NASIJJOzOi/uOogdZu58u0AcMEYi95O3
	iW5g6YnalHUUZro+ASwLnJYYMNpcArj7Wi0Ym2guaSCFWQE2tFR7ftVyOc/Hl+BNiRnm
	w2heOvRdd89YZeo1S3b1ZWQdjsDLtm+vghm8ie4t59A6MEh8NLQUGhST19b1Hg1OXqNF
	TpfQ==
X-Gm-Message-State: AOAM5308u93FdiwAe+NsGoqb4MXUlmyvL/g8nycDsqKquPhNAoFwQeHU
	VjjR2KRH+oqe2PqTUs7fmD/mwHVBohkKWXbC
X-Google-Smtp-Source: ABdhPJxuiaxjNPOwYHLY4n6iaUQ5u7uvub/plwzXvY5CyxmPKUcdIBkmw+SK+jNrOYYDsE3YCc1CQw==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr2996072wmj.143.1592042308543; 
	Sat, 13 Jun 2020 02:58:28 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	h12sm14232427wro.80.2020.06.13.02.58.27
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:28 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:26 +0200
Resent-Message-ID: <20200613095826.GT4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A2F1A4203BB
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 15:33:52 +0200 (CEST)
Received: by mail-qt1-f196.google.com with SMTP id v4so5458903qte.3
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=EQm3KwRvgaHxQ5d1Q4EsqwYQDDPz8ESa9iFyt4vvvfU=;
	b=A1yY0pcUPS8ck0PV+oiK0L7Xz4/CMf99HFvZLNGUwtkmJl1HZgyPoRsWMMpkPViZh0
	g5zjGf3xBdccjZCBDrDAtY8wQjaBZ20OxMUJOX2ygsAZmQ7FAOTD578Pi8cO/AGsz/0k
	+6GEYqQqrDeTvrPiNG4dFgi17HrIhPWpILlQe2Haz/tBvylaHUHhtLMH1x1JgMBfFxbG
	dVhzC9D5lQnZ9bUPGy2DvBKfUkckuBYamDN1KFet5x5I1KxpS/Xd/0nP+OBlUFjYmTJ3
	d3tseyuZBcS/wV3owA0JIbRvtw028OV+O6ZJMOkqyJt0SMGeOHIN4l7beBYArRlnUqQR
	Cj1Q==
X-Received: by 2002:aed:2bc4:: with SMTP id e62mr11045622qtd.263.1590068031488;
	Thu, 21 May 2020 06:33:51 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.225])
	by smtp.gmail.com with ESMTPSA id
	l184sm4861282qke.115.2020.05.21.06.33.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 May 2020 06:33:50 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 3AF26C0BEB; Thu, 21 May 2020 10:33:48 -0300 (-03)
Date: Thu, 21 May 2020 10:33:48 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200521133348.GX2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-32-hch@lst.de>
	<20200520231001.GU2491@localhost.localdomain>
	<20200520.162355.2212209708127373208.davem@davemloft.net>
	<20200520233913.GV2491@localhost.localdomain>
	<20200521083442.GA7771@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200521083442.GA7771@lst.de>
Cc: edumazet@google.com, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	kuznet@ms2.inr.ac.ru, kuba@kernel.org,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	nhorman@tuxdriver.com, yoshfuji@linux-ipv6.org,
	netdev@vger.kernel.org, vyasevich@gmail.com,
	linux-kernel@vger.kernel.org, jmaloy@redhat.com,
	ying.xue@windriver.com, David Miller <davem@davemloft.net>,
	ocfs2-devel@oss.oracle.com
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

On Thu, May 21, 2020 at 10:34:42AM +0200, Christoph Hellwig wrote:
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
> 
> sctp_setsockopt_nodelay does the following things:
> 
>  - verifies optlen, returns -EINVAL if it doesn't match
>  - calls get_user, returns -EFAULT on error
>  - converts the value from get_user to a boolean and assigns it
>    to sctp_sk(sk)->nodelay
>  - returns 0.
> 
> sctp_sock_set_nodelay does:
> 
>  - call lock_sock
>  - assign true to sctp_sk(sk)->nodelay
>  - call release_sock
>  - does not return an error code

With the patch there are now two ways of enabling nodelay. It may be
just a boolean set today, but if one wants to probe on it or if we
want to extend it with anything, say a debug msg, we have to do it in
two (very different) places.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
