Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C77B71F827F
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:14:18 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AD7644203EF;
	Sat, 13 Jun 2020 12:14:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 33D90420419
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:11 +0200 (CEST)
Received: by mail-wm1-f68.google.com with SMTP id o8so538462wmh.4
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=/qygMQEHgAHnXXlcBf3bWz8hekZtO5JE6hUpY/E6MlI=;
	b=l91j76LPs0ca9WUAYZxaZ7P/ZbNvnUXcDBA+Oe4ziaFu1Ns8wZ1mWjnQKAliT3y+4O
	cJNWTaznFuN7NBKCqY9/g5kscT2kSqvpDJ6B0JZeVQDed7bM2qPyJiYlSyusd5ODXYjp
	EvAIHAC3WAW9qDCLfdXxdS3987+JbUsWPM8WUKO+Ofc0REzK0/9+vkDGbgZCO/FC5fnW
	Z+AUOtBKvNW8BRZf7famTHYkebrxR3wmtm5ykxeEcA9U/vUeKPBM/XzMLE0CQMxQa0bC
	WHX4rFx7vW+AKJp7Yr0Fu/wWCibFzA8c0fVI7Tr8mCaDYUftERo5uJWP85dwjB0kiT21
	NiQA==
X-Gm-Message-State: AOAM531Zc+52yrFlv9a0dsobl5EuilOIxJYsx3W6/s5eNFuCmBWbQ+xC
	hk5kuVxrBD+87AGApmm/DENR9SEhaJZkDfQu
X-Google-Smtp-Source: ABdhPJwa9RlhQ6N3i0pAY9OodhnFNMcFok4Es2q3r1AJKsO0RfXaFmZYZ3GC+db2LNUDd3UE2iWvxw==
X-Received: by 2002:a1c:2002:: with SMTP id g2mr3133431wmg.132.1592042290614; 
	Sat, 13 Jun 2020 02:58:10 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	k12sm14328836wrn.42.2020.06.13.02.58.09
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:10 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:08 +0200
Resent-Message-ID: <20200613095808.GM4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 739EF42041F
	for <drbd-dev@lists.linbit.com>; Thu, 21 May 2020 01:10:04 +0200 (CEST)
Received: by mail-qt1-f195.google.com with SMTP id v4so4076418qte.3
	for <drbd-dev@lists.linbit.com>; Wed, 20 May 2020 16:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=/qygMQEHgAHnXXlcBf3bWz8hekZtO5JE6hUpY/E6MlI=;
	b=P6nrdRt7oaMJFGVn8tdcieLX1Y0jzSKCiVAEYNtArrwifpga+dN5v83cMRIKerr4lw
	S6tkBAkA2pzBZjc0nUkbiuQyYHvOajF4yI1Q6trOeI35JHSiPIaxzZCbG3Qtsy2IBEa3
	0u/0e0g7iT4mi/FhVlpzyBQ3hBLshkLlZGHWrVd+CnnFjHpAgBIE+8ymdFvfsvnw6oP1
	vrswReGAc6hPcqUAp+cE2FXwLqOAkzyS//X9yOiiedFgThmSWHlqXdSgAkTBcBgd7wGx
	VhCZmmEUAtG955eDuUNmBsKKkyJTq5OMaHqmy6az6aQ6f3SohaWpveT0RKHmFyEz+bny
	g7MA==
X-Received: by 2002:aed:3f7b:: with SMTP id q56mr7818149qtf.152.1590016204171; 
	Wed, 20 May 2020 16:10:04 -0700 (PDT)
Received: from localhost.localdomain
	([2001:1284:f013:b7f5:289f:a703:e466:2a27])
	by smtp.gmail.com with ESMTPSA id
	e28sm3451287qkn.17.2020.05.20.16.10.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 May 2020 16:10:03 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 2EE17C0DAC; Wed, 20 May 2020 20:10:01 -0300 (-03)
Date: Wed, 20 May 2020 20:10:01 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200520231001.GU2491@localhost.localdomain>
References: <20200520195509.2215098-1-hch@lst.de>
	<20200520195509.2215098-32-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520195509.2215098-32-hch@lst.de>
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

On Wed, May 20, 2020 at 09:55:07PM +0200, Christoph Hellwig wrote:
> Add a helper to directly set the SCTP_NODELAY sockopt from kernel space
> without going through a fake uaccess.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/dlm/lowcomms.c       | 10 ++--------
>  include/net/sctp/sctp.h |  7 +++++++
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index 69333728d871b..9f1c3cdc9d653 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -914,7 +914,6 @@ static int sctp_bind_addrs(struct connection *con, uint16_t port)
>  static void sctp_connect_to_sock(struct connection *con)
>  {
>  	struct sockaddr_storage daddr;
> -	int one = 1;
>  	int result;
>  	int addr_len;
>  	struct socket *sock;
> @@ -961,8 +960,7 @@ static void sctp_connect_to_sock(struct connection *con)
>  	log_print("connecting to %d", con->nodeid);
>  
>  	/* Turn off Nagle's algorithm */
> -	kernel_setsockopt(sock, SOL_SCTP, SCTP_NODELAY, (char *)&one,
> -			  sizeof(one));
> +	sctp_sock_set_nodelay(sock->sk);
>  
>  	/*
>  	 * Make sock->ops->connect() function return in specified time,
> @@ -1176,7 +1174,6 @@ static int sctp_listen_for_all(void)
>  	struct socket *sock = NULL;
>  	int result = -EINVAL;
>  	struct connection *con = nodeid2con(0, GFP_NOFS);
> -	int one = 1;
>  
>  	if (!con)
>  		return -ENOMEM;
> @@ -1191,10 +1188,7 @@ static int sctp_listen_for_all(void)
>  	}
>  
>  	sock_set_rcvbuf(sock->sk, NEEDED_RMEM);
> -	result = kernel_setsockopt(sock, SOL_SCTP, SCTP_NODELAY, (char *)&one,
> -				   sizeof(one));
> -	if (result < 0)
> -		log_print("Could not set SCTP NODELAY error %d\n", result);
> +	sctp_sock_set_nodelay(sock->sk);
>  
>  	write_lock_bh(&sock->sk->sk_callback_lock);
>  	/* Init con struct */
> diff --git a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
> index 3ab5c6bbb90bd..f8bcb75bb0448 100644
> --- a/include/net/sctp/sctp.h
> +++ b/include/net/sctp/sctp.h
> @@ -615,4 +615,11 @@ static inline bool sctp_newsk_ready(const struct sock *sk)
>  	return sock_flag(sk, SOCK_DEAD) || sk->sk_socket;
>  }
>  
> +static inline void sctp_sock_set_nodelay(struct sock *sk)
> +{
> +	lock_sock(sk);
> +	sctp_sk(sk)->nodelay = true;
> +	release_sock(sk);
> +}
> +

The duplication with sctp_setsockopt_nodelay() is quite silly/bad.
Also, why have the 'true' hardcoded? It's what dlm uses, yes, but the
API could be a bit more complete than that.

Like for the other patch, this one could build on David's patch, do
the ternary check before calling sctp_setsockopt_nodelay and then move
sctp_setsockopt_nodelay to the header, or something like that.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
