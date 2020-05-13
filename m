Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A81F8264
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:02:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 320B8420410;
	Sat, 13 Jun 2020 12:02:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 28FA84203F9
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:56:52 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id x13so12286258wrv.4
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=3rJSQfC8qhqPgAdT7p7uqG4zYxw0cOP69JvDMu+AmoU=;
	b=jcBFD5KErs+/0UyZpUnW1mp5ojOfA2Hg1r+/Jd193DUTXhXPYcKnCTAjEUdZTr1uym
	/lLunfO0u9RsO6LRU/ywrc5OXiHU3OY/nFPH6ZbSTujKT/Y4koqSO/KnuCXNyEHTFX0M
	j5/dtFoFaaAa7GTOhq+XIZ3lMdj/uHHiYLpca9RpT9Ss5lBNjOZl6sALGw8xK08tvtxK
	u0jrBMtN6lil9yFEy52KRI2Axk6haIQGBhvTzSiHNcZmG9QHGhxwPo39vcF7AEjJ4yS5
	3Is36Ykq4x0pF/BGHTk4Rcjes2D/PI+T2h9cunnn+LloC5J2l0T3yLhrOhbyyoXFwGOz
	6fgw==
X-Gm-Message-State: AOAM530HeehMZVgbE+SEiXo7mj67EUJ2/s9AFajDH2uhRcWbahis6ZBI
	TSEsjd5Se4M8RKC9AgvAFQrECp8dikah9hUR
X-Google-Smtp-Source: ABdhPJwuBqFewbAieeg4dRyyIjFHoVOqez0xK4DSlXxolvYx6/1iBsw0t/wnrVKugOetRzXtliIZxQ==
X-Received: by 2002:adf:fecc:: with SMTP id q12mr19683891wrs.135.1592042212327;
	Sat, 13 Jun 2020 02:56:52 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	c81sm13256259wmd.42.2020.06.13.02.56.51
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:51 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:50 +0200
Resent-Message-ID: <20200613095650.GO4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9AD91420317
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 20:04:06 +0200 (CEST)
Received: by mail-qt1-f193.google.com with SMTP id b1so605234qtt.1
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 11:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=3rJSQfC8qhqPgAdT7p7uqG4zYxw0cOP69JvDMu+AmoU=;
	b=rgheQSt1YItEgWJaK+D0bGz+/qHfNOAGsXjdVRWwUQiGqsFIGS1wvoYG+aGTafU+PV
	/Wam8diPaOgVXFRqoqZXtgZpq5ZoS7P+w+jAXFzuJRlWX6AXxlicjH1KtuahsCm7X1oB
	1KM/eHxvJqcmXNEYPF4b+olwDLqfGRmRJKuO8mBihqp1FZjIXqkKRuN4K2fkmkt1KR4y
	BY4TuAPJr9Fm34DqlaEou7vS5F0NmzH1lmiODzJGQ+/eBluPCt8Nwyn9o9iFlcChI8ne
	mr8KP8dnkN8R85f07cGwIMBpujRbjafuA86KSdBGJqLxAx2+yPjgt33/gw2dY8MXvXik
	E3ww==
X-Received: by 2002:ac8:67cf:: with SMTP id r15mr355571qtp.258.1589392985891; 
	Wed, 13 May 2020 11:03:05 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.228])
	by smtp.gmail.com with ESMTPSA id f68sm476350qke.74.2020.05.13.11.03.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 May 2020 11:03:05 -0700 (PDT)
Received: by localhost.localdomain (Postfix, from userid 1000)
	id 8AE9BC08DA; Wed, 13 May 2020 15:03:02 -0300 (-03)
Date: Wed, 13 May 2020 15:03:02 -0300
From: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200513180302.GC2491@localhost.localdomain>
References: <20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-33-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513062649.2100053-33-hch@lst.de>
Cc: Eric Dumazet <edumazet@google.com>, linux-nvme@lists.infradead.org,
	linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, "David S. Miller" <davem@davemloft.net>,
	ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH 32/33] sctp: add sctp_sock_get_primary_addr
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

On Wed, May 13, 2020 at 08:26:47AM +0200, Christoph Hellwig wrote:
> Add a helper to directly get the SCTP_PRIMARY_ADDR sockopt from kernel
> space without going through a fake uaccess.

Same comment as on the other dlm/sctp patch.

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/dlm/lowcomms.c       | 11 +++-----
>  include/net/sctp/sctp.h |  1 +
>  net/sctp/socket.c       | 57 +++++++++++++++++++++++++----------------
>  3 files changed, 39 insertions(+), 30 deletions(-)
> 
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index 6fa45365666a8..46d2d71b62c57 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -855,10 +855,9 @@ static int tcp_accept_from_sock(struct connection *con)
>  static int sctp_accept_from_sock(struct connection *con)
>  {
>  	/* Check that the new node is in the lockspace */
> -	struct sctp_prim prim;
> +	struct sctp_prim prim = { };
>  	int nodeid;
> -	int prim_len, ret;
> -	int addr_len;
> +	int addr_len, ret;
>  	struct connection *newcon;
>  	struct connection *addcon;
>  	struct socket *newsock;
> @@ -876,11 +875,7 @@ static int sctp_accept_from_sock(struct connection *con)
>  	if (ret < 0)
>  		goto accept_err;
>  
> -	memset(&prim, 0, sizeof(struct sctp_prim));
> -	prim_len = sizeof(struct sctp_prim);
> -
> -	ret = kernel_getsockopt(newsock, IPPROTO_SCTP, SCTP_PRIMARY_ADDR,
> -				(char *)&prim, &prim_len);
> +	ret = sctp_sock_get_primary_addr(con->sock->sk, &prim);
>  	if (ret < 0) {
>  		log_print("getsockopt/sctp_primary_addr failed: %d", ret);
>  		goto accept_err;
> diff --git a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
> index b505fa082f254..c98b1d14db853 100644
> --- a/include/net/sctp/sctp.h
> +++ b/include/net/sctp/sctp.h
> @@ -618,5 +618,6 @@ static inline bool sctp_newsk_ready(const struct sock *sk)
>  int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
>  		int addrs_size, int op);
>  void sctp_sock_set_nodelay(struct sock *sk, bool val);
> +int sctp_sock_get_primary_addr(struct sock *sk, struct sctp_prim *prim);
>  
>  #endif /* __net_sctp_h__ */
> diff --git a/net/sctp/socket.c b/net/sctp/socket.c
> index 64c395f7a86d5..39bf8090dbe1e 100644
> --- a/net/sctp/socket.c
> +++ b/net/sctp/socket.c
> @@ -6411,6 +6411,35 @@ static int sctp_getsockopt_local_addrs(struct sock *sk, int len,
>  	return err;
>  }
>  
> +static int __sctp_sock_get_primary_addr(struct sock *sk, struct sctp_prim *prim)
> +{
> +	struct sctp_association *asoc;
> +
> +	asoc = sctp_id2assoc(sk, prim->ssp_assoc_id);
> +	if (!asoc)
> +		return -EINVAL;
> +	if (!asoc->peer.primary_path)
> +		return -ENOTCONN;
> +
> +	memcpy(&prim->ssp_addr, &asoc->peer.primary_path->ipaddr,
> +		asoc->peer.primary_path->af_specific->sockaddr_len);
> +
> +	sctp_get_pf_specific(sk->sk_family)->addr_to_user(sctp_sk(sk),
> +			(union sctp_addr *)&prim->ssp_addr);
> +	return 0;
> +}
> +
> +int sctp_sock_get_primary_addr(struct sock *sk, struct sctp_prim *prim)
> +{
> +	int ret;
> +
> +	lock_sock(sk);
> +	ret = __sctp_sock_get_primary_addr(sk, prim);
> +	release_sock(sk);
> +	return ret;
> +}
> +EXPORT_SYMBOL(sctp_sock_get_primary_addr);
> +
>  /* 7.1.10 Set Primary Address (SCTP_PRIMARY_ADDR)
>   *
>   * Requests that the local SCTP stack use the enclosed peer address as
> @@ -6421,35 +6450,19 @@ static int sctp_getsockopt_primary_addr(struct sock *sk, int len,
>  					char __user *optval, int __user *optlen)
>  {
>  	struct sctp_prim prim;
> -	struct sctp_association *asoc;
> -	struct sctp_sock *sp = sctp_sk(sk);
> +	int ret;
>  
>  	if (len < sizeof(struct sctp_prim))
>  		return -EINVAL;
> -
> -	len = sizeof(struct sctp_prim);
> -
> -	if (copy_from_user(&prim, optval, len))
> +	if (copy_from_user(&prim, optval, sizeof(struct sctp_prim)))
>  		return -EFAULT;
>  
> -	asoc = sctp_id2assoc(sk, prim.ssp_assoc_id);
> -	if (!asoc)
> -		return -EINVAL;
> -
> -	if (!asoc->peer.primary_path)
> -		return -ENOTCONN;
> -
> -	memcpy(&prim.ssp_addr, &asoc->peer.primary_path->ipaddr,
> -		asoc->peer.primary_path->af_specific->sockaddr_len);
> -
> -	sctp_get_pf_specific(sk->sk_family)->addr_to_user(sp,
> -			(union sctp_addr *)&prim.ssp_addr);
> +	ret = __sctp_sock_get_primary_addr(sk, &prim);
> +	if (ret)
> +		return ret;
>  
> -	if (put_user(len, optlen))
> +	if (put_user(len, optlen) || copy_to_user(optval, &prim, len))
>  		return -EFAULT;
> -	if (copy_to_user(optval, &prim, len))
> -		return -EFAULT;
> -
>  	return 0;
>  }
>  
> -- 
> 2.26.2
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
