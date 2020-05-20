Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D591F8282
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:15:18 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1CFA64203F8;
	Sat, 13 Jun 2020 12:15:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5992742041F
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:16 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id l10so12263371wrr.10
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=usgVE9wGsTmR3Ul4KmzuJXmMmNEoxcCV+K4pKCDDnEw=;
	b=pOXSA1TBpymkmuuLb9r2Kx5CqwgpS7GQucK8QyiQIxeAusP7ebJsyrO4vXQxjaR01b
	kfIJhYk2QM7jM1x+Jk/SDJKErQbVk/81O1RPp5GgVAgGR11OQMniOpEc3DG+DFDm0Y0i
	tXLcbBFdJPgy1Ni7sNMcQt/inYDa8bUAQvaL9D3QMqnhEJ2uzrYYyrfPQZy7YHSQhnZ4
	YKGGNDijHMRldtGgqh5D+M7zoeIhgUAWROgIH0BO5YliYx2CNOCaG2x2uYwn2hsgm8/B
	eBb22dN42RF4h9G9z3RQIO1p/4Gw3sNlxQaWONEVHstUOAO75/Jj8fs5v2ikQgWDn8l7
	BlZQ==
X-Gm-Message-State: AOAM532tkua5ZofYwLiCv54dpOYDFFVSirMKGfnaSrgMxmqlf+LexG3n
	dC5yEWAFuw7eokhn9lObMTEEg3E0+K7eyTDX
X-Google-Smtp-Source: ABdhPJyGgt22N1lLfGtJq4VdkGdK9LQ7Eu8CZkrM99ieOXMovuBh03MKTUhJHKGg2kcg55cciWt4LQ==
X-Received: by 2002:a5d:44cf:: with SMTP id z15mr20279949wrr.164.1592042295854;
	Sat, 13 Jun 2020 02:58:15 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	b132sm12742537wmh.3.2020.06.13.02.58.15
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:15 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:13 +0200
Resent-Message-ID: <20200613095813.GO4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8714D420309
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 01:39:17 +0200 (CEST)
Received: by mail-qt1-f194.google.com with SMTP id v4so4126621qte.3
	for <drbd-dev@lists.linbit.com>; Wed, 20 May 2020 16:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=usgVE9wGsTmR3Ul4KmzuJXmMmNEoxcCV+K4pKCDDnEw=;
	b=FsipvN1GuGM9UbR7VsW4XkubLiUqC8Dqtu7L937s2qadx/bxbgPsMl9fWYiJlizujH
	c9qxkVWOxpVMlAT7nNkHzdOL6XRXbCOpar1C4DQC47Sws3swXaaqI9YAuQyLubSZ0OK0
	rRko/wzRAKCkIy15w/nWQBRVBLwMvtGjJCE2gisIPTfPY2zdgnpj1FMzVNCnVI10QH79
	YBAX7tezDRj2K0TOr70GJg9yP9kYgu14VxvOjzih8uvep1FVSB5EojcU0QtKwd0T+IdB
	hjRKTNxmgJ9liw0vUGr1peJpzaW/R/f+lsktCjxXTndLxOoBi3/frCJqvNi3QaPXR6GX
	kpaA==
X-Received: by 2002:ac8:1af3:: with SMTP id h48mr7625941qtk.371.1590017956516; 
	Wed, 20 May 2020 16:39:16 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.225])
	by smtp.gmail.com with ESMTPSA id
	z10sm3685208qtu.22.2020.05.20.16.39.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 May 2020 16:39:15 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 43E1FC0DAC; Wed, 20 May 2020 20:39:13 -0300 (-03)
Date: Wed, 20 May 2020 20:39:13 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: David Miller <davem@davemloft.net>
Message-ID: <20200520233913.GV2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-32-hch@lst.de>
	<20200520231001.GU2491@localhost.localdomain>
	<20200520.162355.2212209708127373208.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520.162355.2212209708127373208.davem@davemloft.net>
Cc: edumazet@google.com, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, hch@lst.de, cluster-devel@redhat.com,
	kuznet@ms2.inr.ac.ru, kuba@kernel.org,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	nhorman@tuxdriver.com, yoshfuji@linux-ipv6.org,
	netdev@vger.kernel.org, vyasevich@gmail.com,
	linux-kernel@vger.kernel.org, jmaloy@redhat.com,
	ying.xue@windriver.com, ocfs2-devel@oss.oracle.com
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

On Wed, May 20, 2020 at 04:23:55PM -0700, David Miller wrote:
> From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
> Date: Wed, 20 May 2020 20:10:01 -0300
> 
> > The duplication with sctp_setsockopt_nodelay() is quite silly/bad.
> > Also, why have the 'true' hardcoded? It's what dlm uses, yes, but the
> > API could be a bit more complete than that.
> 
> The APIs are being designed based upon what in-tree users actually
> make use of.  We can expand things later if necessary.

Sometimes expanding things later can be though, thus why the worry.
But ok, I get it. Thanks.

The comment still applies, though. (re the duplication)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
