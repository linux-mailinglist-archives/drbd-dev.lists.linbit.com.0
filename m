Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F17FC366122
	for <lists+drbd-dev@lfdr.de>; Tue, 20 Apr 2021 22:48:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E06D34205C6;
	Tue, 20 Apr 2021 22:48:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1370 seconds by postgrey-1.31 at mail19;
	Tue, 20 Apr 2021 22:48:31 CEST
Received: from gateway34.websitewelcome.com (gateway34.websitewelcome.com
	[192.185.148.142])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A1BB64204A7
	for <drbd-dev@lists.linbit.com>; Tue, 20 Apr 2021 22:48:31 +0200 (CEST)
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
	by gateway34.websitewelcome.com (Postfix) with ESMTP id 6DFC5A9141
	for <drbd-dev@lists.linbit.com>; Tue, 20 Apr 2021 15:25:39 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
	id YwwElH5iyL7DmYwwFlPAC1; Tue, 20 Apr 2021 15:25:39 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8WaJQOvWa34W2/gjggyjuGAo/HlnLHnW/HqDi/mf0Ak=;
	b=eNcKq1DbSrH6iad9NpTT715XoL
	UOHtRjGXWfBSB3vZTlFwpdFTYakeCFG3Z8gQnrL1ET4SKUjNX+EsHncYdkaBI8clEU05gYod2Ulmq
	00fce/NgsxUK9VmqWZXPra54/8+xHSdDER5yHv64uzPH/rCOdR5fDoc4wPfzMfSwXErcW+9ZpOvBg
	3FUKSjrXmv/2IhuxVH2OxW8MPI9unKaC2V1WehajcleSLqfcVHO6MqWFfjloI6Zo+xiplnhowAi6E
	fD8qdbyDo5mdnfEYSlzT7HislARTeHLTHNnSCXXjaqPJyR2XXxZcOPQcDtdL/PR+2UxqtzuWm94Y1
	auTPDUNQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:49052
	helo=[192.168.15.8])
	by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
	(envelope-from <gustavo@embeddedor.com>)
	id 1lYwwB-0034SB-AG; Tue, 20 Apr 2021 15:25:35 -0500
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<44663f18fb12e39c53b0e69039c98505b7c6d5da.1605896059.git.gustavoars@kernel.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <ba77fcbe-8770-d234-509b-7dc5ac079319@embeddedor.com>
Date: Tue, 20 Apr 2021 15:25:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <44663f18fb12e39c53b0e69039c98505b7c6d5da.1605896059.git.gustavoars@kernel.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linbit.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lYwwB-0034SB-AG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
	[187.162.31.110]:49052
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 182
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: linux-block@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 027/141] drbd: Fix fall-through warnings for
	Clang
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

Hi all,

Friendly ping: who can take this, please?

Thanks
--
Gustavo

On 11/20/20 12:28, Gustavo A. R. Silva wrote:
> In preparation to enable -Wimplicit-fallthrough for Clang, fix a couple
> of warnings by explicitly adding a break statement instead of just
> letting the code fall through to the next, and by adding a fallthrough
> pseudo-keyword in places whre the code is intended to fall through.
> 
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  drivers/block/drbd/drbd_receiver.c | 1 +
>  drivers/block/drbd/drbd_req.c      | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
> index dc333dbe5232..c19bb74ac935 100644
> --- a/drivers/block/drbd/drbd_receiver.c
> +++ b/drivers/block/drbd/drbd_receiver.c
> @@ -5863,6 +5863,7 @@ static int got_NegRSDReply(struct drbd_connection *connection, struct packet_inf
>  		switch (pi->cmd) {
>  		case P_NEG_RS_DREPLY:
>  			drbd_rs_failed_io(device, sector, size);
> +			break;
>  		case P_RS_CANCEL:
>  			break;
>  		default:
> diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
> index 330f851cb8f0..9f212a923a3c 100644
> --- a/drivers/block/drbd/drbd_req.c
> +++ b/drivers/block/drbd/drbd_req.c
> @@ -750,6 +750,7 @@ int __req_mod(struct drbd_request *req, enum drbd_req_event what,
>  
>  	case WRITE_ACKED_BY_PEER_AND_SIS:
>  		req->rq_state |= RQ_NET_SIS;
> +		fallthrough;
>  	case WRITE_ACKED_BY_PEER:
>  		/* Normal operation protocol C: successfully written on peer.
>  		 * During resync, even in protocol != C,
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
