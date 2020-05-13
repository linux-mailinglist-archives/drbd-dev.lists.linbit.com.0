Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F91F8250
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 11:58:45 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B0FA64203F4;
	Sat, 13 Jun 2020 11:58:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 177AE4203F4
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:56:31 +0200 (CEST)
Received: by mail-wr1-f65.google.com with SMTP id e1so12304106wrt.5
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=I21hL7AkwUgdNPUI4l7KTQwvXQoa/NOyWUo4IiS5Zaw=;
	b=Rr2/kitOPAXUUCcA5ksnVUHtsd3Y1BDVkrPsnrTGoJOZf41ggj1RHD9OfuxRCD5BNF
	mQqOsUauUD1gW0uxHcouqAK03movd2+zxLBcTVAXY40Swd1106/JK+08ftzCVl/rotDC
	tvPT3QeMkwNBGTFOS7CNDVYkjBAguYH+d9gET+nX5m3f3ypSlrUmHt3cikPa/QrkVSow
	UeHVpjDHgI44Q5d40pXmWOLjYkwcm6ULLuMWvxRL0m31PMbsmoR6y81wEHXFnEkWfwjU
	d+buZiixcxcEtWdOYYOQ63K8PC8xjvxzQquCYB9Q4zXmHyu4VJnucdXz1LAoH/5Kk/Ce
	WIKg==
X-Gm-Message-State: AOAM530yUci5QaVrSou3QxhTGNTgpNfcLaOBMED5s8ou7iDwWEmBeEGj
	dujMtZDfe7pP9AX/eSWDSfBaP3qrj/4neDFh
X-Google-Smtp-Source: ABdhPJwusBSFxDr+hxCKvdmNbaJdadKrR8nRoQR2y5NZwbGg2EMfUg68axKq6aAWFWDb+dpOSpuqWw==
X-Received: by 2002:a05:6000:1083:: with SMTP id
	y3mr18583202wrw.425.1592042190572; 
	Sat, 13 Jun 2020 02:56:30 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	u9sm13365604wme.16.2020.06.13.02.56.29
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:30 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:28 +0200
Resent-Message-ID: <20200613095628.GH4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7CEFA4202F0
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 14:52:46 +0200 (CEST)
Received: by mail-qk1-f195.google.com with SMTP id i5so915559qkl.12
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 05:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=I21hL7AkwUgdNPUI4l7KTQwvXQoa/NOyWUo4IiS5Zaw=;
	b=m6ad7mNkFXWQP2LAar13cizth8P3iKliOem15ctBmD+RRB5NWWGZ4hVFaLb43OUHF4
	dEfbKyHnbdTPvph0NO3q6QQG3feEsDR1NN/aDJiylAVOx6elqA7EySRBy4zgPJs7Fz0/
	Wh3NuXdccvtT3AKlZIUnJi/oe7DjFVTOpq20lvPm5ktnPdoP012Lk/9j/pUDGJCnQSsG
	TmFagaUtz3vbm20kiJmFo0AhIIm3asYdCe/QXnsQdcQLCh91UXycsxj5M4FwgjK5Th4v
	OuuA5GD8cz9mUhRoZ9e54BvWpbbFTnY1KxAJWQ9Fh7pEfNmqL/JrbXuEeLjTtGaJiHKf
	PtmA==
X-Received: by 2002:a37:61d8:: with SMTP id
	v207mr26564281qkb.146.1589374305465; 
	Wed, 13 May 2020 05:51:45 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.48.30]) by smtp.gmail.com with ESMTPSA id
	t67sm13779002qka.17.2020.05.13.05.51.44
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 May 2020 05:51:44 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1jYqrQ-0008K6-D9; Wed, 13 May 2020 09:51:44 -0300
Date: Wed, 13 May 2020 09:51:44 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200513125144.GC29989@ziepe.ca>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513062649.2100053-12-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	linux-nvme@lists.infradead.org, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH 11/33] tcp: tcp_sock_set_nodelay
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

On Wed, May 13, 2020 at 08:26:26AM +0200, Christoph Hellwig wrote:
> Add a helper to directly set the TCP_NODELAY sockopt from kernel space
> without going through a fake uaccess.  Cleanup the callers to avoid
> pointless wrappers now that this is a simple function call.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/drbd/drbd_int.h             |  7 ----
>  drivers/block/drbd/drbd_main.c            |  2 +-
>  drivers/block/drbd/drbd_receiver.c        |  4 +--
>  drivers/infiniband/sw/siw/siw_cm.c        | 24 +++-----------
>  drivers/nvme/host/tcp.c                   |  9 +-----
>  drivers/nvme/target/tcp.c                 | 12 ++-----
>  drivers/target/iscsi/iscsi_target_login.c | 15 ++-------
>  fs/cifs/connect.c                         | 10 ++----
>  fs/dlm/lowcomms.c                         |  8 ++---
>  fs/ocfs2/cluster/tcp.c                    | 20 ++----------
>  include/linux/tcp.h                       |  1 +
>  net/ceph/messenger.c                      | 11 ++-----
>  net/ipv4/tcp.c                            | 39 +++++++++++++++--------
>  net/rds/tcp.c                             | 11 +------
>  net/rds/tcp.h                             |  1 -
>  net/rds/tcp_listen.c                      |  2 +-
>  16 files changed, 49 insertions(+), 127 deletions(-)

No problem with the siw change

Acked-by: Jason Gunthorpe <jgg@mellanox.com>

Jason
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
