Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AD39E473897
	for <lists+drbd-dev@lfdr.de>; Tue, 14 Dec 2021 00:32:24 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8DC2F4205FF;
	Tue, 14 Dec 2021 00:32:24 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 555 seconds by postgrey-1.31 at mail19;
	Tue, 14 Dec 2021 00:32:06 CET
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 877854203DB
	for <drbd-dev@lists.linbit.com>;
	Tue, 14 Dec 2021 00:32:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EC77E6101C;
	Mon, 13 Dec 2021 23:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BABC8C34601;
	Mon, 13 Dec 2021 23:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639437770;
	bh=u7Kel0+0ccO1Da8cNlI1rybWn6ykZj9EAsVVNG6GBDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkMAiGXcQjVPohxFUWXmZU4qt/FQxzeoBUMhTKM0zFWCesiFmdvg8OqTZB8umgLcU
	0MIASMr4trRABy5lXotJp2JZdXYl5PuU2CaotpKaXA85qDJG/Bm67+Er6rEXKK6FT3
	MTXiWZ/sQSus+J298YMe1TxwV0tY08ZlCCfCon39A9DYErBIwDtAKeBekW2pVd8gOl
	Ru4jrrS5Exqx0QFY41+CWahrb7Hfn8jSweseQDDFMfeM0V7L88g08n0ZErECf/lWdz
	YWbdsVjBF5dXR1DDlwIyQqwVxz+cCXGxc30zkWy+Yz/pZncOrjmEvxkrhECdx1DkGd
	7XZinRD++8wQg==
Date: Mon, 13 Dec 2021 17:28:28 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20211213232828.GC60133@embeddedor>
References: <20211118203712.1288866-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211118203712.1288866-1-keescook@chromium.org>
Cc: Jens Axboe <axboe@kernel.dk>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: Use struct_group() to zero algs
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

On Thu, Nov 18, 2021 at 12:37:12PM -0800, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memset(), avoid intentionally writing across
> neighboring fields.
> 
> Add a struct_group() for the algs so that memset() can correctly reason
> about the size.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>  drivers/block/drbd/drbd_main.c     | 3 ++-
>  drivers/block/drbd/drbd_protocol.h | 6 ++++--
>  drivers/block/drbd/drbd_receiver.c | 3 ++-
>  3 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
> index 53ba2dddba6e..feac72e323bd 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -729,7 +729,8 @@ int drbd_send_sync_param(struct drbd_peer_device *peer_device)
>  	cmd = apv >= 89 ? P_SYNC_PARAM89 : P_SYNC_PARAM;
>  
>  	/* initialize verify_alg and csums_alg */
> -	memset(p->verify_alg, 0, 2 * SHARED_SECRET_MAX);
> +	BUILD_BUG_ON(sizeof(p->algs) != 2 * SHARED_SECRET_MAX);
> +	memset(&p->algs, 0, sizeof(p->algs));
>  
>  	if (get_ldev(peer_device->device)) {
>  		dc = rcu_dereference(peer_device->device->ldev->disk_conf);
> diff --git a/drivers/block/drbd/drbd_protocol.h b/drivers/block/drbd/drbd_protocol.h
> index dea59c92ecc1..a882b65ab5d2 100644
> --- a/drivers/block/drbd/drbd_protocol.h
> +++ b/drivers/block/drbd/drbd_protocol.h
> @@ -283,8 +283,10 @@ struct p_rs_param_89 {
>  
>  struct p_rs_param_95 {
>  	u32 resync_rate;
> -	char verify_alg[SHARED_SECRET_MAX];
> -	char csums_alg[SHARED_SECRET_MAX];
> +	struct_group(algs,
> +		char verify_alg[SHARED_SECRET_MAX];
> +		char csums_alg[SHARED_SECRET_MAX];
> +	);
>  	u32 c_plan_ahead;
>  	u32 c_delay_target;
>  	u32 c_fill_target;
> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
> index 1f740e42e457..6df2539e215b 100644
> --- a/drivers/block/drbd/drbd_receiver.c
> +++ b/drivers/block/drbd/drbd_receiver.c
> @@ -3921,7 +3921,8 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
>  
>  	/* initialize verify_alg and csums_alg */
>  	p = pi->data;
> -	memset(p->verify_alg, 0, 2 * SHARED_SECRET_MAX);
> +	BUILD_BUG_ON(sizeof(p->algs) != 2 * SHARED_SECRET_MAX);
> +	memset(&p->algs, 0, sizeof(p->algs));
>  
>  	err = drbd_recv_all(peer_device->connection, p, header_size);
>  	if (err)
> -- 
> 2.30.2
> 
> 
> 
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
