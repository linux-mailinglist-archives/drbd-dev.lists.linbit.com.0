Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2268714AB3D
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Jan 2020 21:43:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ABA99420343;
	Mon, 27 Jan 2020 21:43:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 505 seconds by postgrey-1.31 at mail19;
	Mon, 27 Jan 2020 21:43:18 CET
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C4C0B4202F4
	for <drbd-dev@lists.linbit.com>; Mon, 27 Jan 2020 21:43:18 +0100 (CET)
Received: by mail-wm1-f66.google.com with SMTP id t14so8663640wmi.5
	for <drbd-dev@lists.linbit.com>; Mon, 27 Jan 2020 12:43:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=1EpH8LoV2wKCDxmGEvKAlzcq+d1bdGaTLz6SBk7EsoA=;
	b=ZVxh4PmVAO681XvXzvUY+joQXNqhAF3JIIJbsWeWPHfnaDKANVASI8kBwOtC/gLYge
	8W52XhHober7+4zmMATqzk2riFFOpykxtvGnoynVUjsffbO+ZpzzYbV688PriROoFOw+
	D3FmHnxFB6qJyKIvCuXvlW/Ua18gbjBl89oRk9fAOcElJfjFFfkrsCRxRVwVdRQmYLst
	qdX4Kbtkhh26muDsKKUsLuKDwlfxHPPATouiOutRFL3qE1aOMdRZdOlhJjuciE3r0Ti+
	aoFM53/lSe3akvmf+YcPdEwh5+BABg0hms1js42Y24J5UA0I4MI3nkMEqL1ljJ2xzyCL
	WHdQ==
X-Gm-Message-State: APjAAAVfNHPRJdbra8kk6A4pkJCIJz0AHTyFY6KEc4KIX3tHGXVxLdjx
	kAt59pxKfzUDZvbmDIFve4H/9C/qgtEUxPZk
X-Google-Smtp-Source: APXvYqwbw13cFSZhxXJW57ei3mzA5OcJ1hp4nuELT5lmw8l6zhDkOZQ1wK1cGGfGs0A6WcKgTrTUSw==
X-Received: by 2002:a7b:c183:: with SMTP id y3mr487788wmi.0.1580157232389;
	Mon, 27 Jan 2020 12:33:52 -0800 (PST)
Received: from grappa.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	w22sm19350222wmk.34.2020.01.27.12.33.51
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 27 Jan 2020 12:33:52 -0800 (PST)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 27 Jan 2020 21:33:50 +0100
Resent-Message-ID: <20200127203350.GH26861@grappa.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1276 seconds by postgrey-1.31 at mail19;
	Fri, 24 Jan 2020 22:32:13 CET
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
	[192.185.160.12])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87B594203C5
	for <drbd-dev@lists.linbit.com>; Fri, 24 Jan 2020 22:32:13 +0100 (CET)
Received: from cm11.websitewelcome.com (cm11.websitewelcome.com [100.42.49.5])
	by gateway30.websitewelcome.com (Postfix) with ESMTP id 245B1C1B0
	for <drbd-dev@lists.linbit.com>; Fri, 24 Jan 2020 15:10:56 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
	id v6EBiySihiJ43v6ECiBZph; Fri, 24 Jan 2020 15:10:56 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1EpH8LoV2wKCDxmGEvKAlzcq+d1bdGaTLz6SBk7EsoA=;
	b=Zhqc3Oc2s9jnh7Gj4BALhfaPFG
	B4vX/BUf9Nk3wzOtLdOt9kxZXSKhaLG03cHatyCg9VUf4uIaGZOxFR6P1B/miQ4WxfIHEsIVk95au
	ol1pV7iI+9Gav6L+F0cR8EzpcS4Q1oCm2UTW/Hi1X+OpMi0zcaptzizCrgWSTQ1GBii56FX/o6cxG
	pEvA/TF4t53F3/KJZObRoZ3qr3agLf0NaNda/+sm3MogW7qHwtkd6/QeBfysQblAhLytp/8QsQuOf
	RwlfLJXJL3dqY48PlnmujZjwo4iC22LtQ2ZiN+Z/m5/C9aMN2l6VxzLh2e5PcY9TsSKf/uTMp3iGp
	PcUF4SMw==;
Received: from [201.162.161.199] (port=60838 helo=[192.168.43.131])
	by gator4166.hostgator.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <gustavo@embeddedor.com>)
	id 1iv6EB-001MCI-B1; Fri, 24 Jan 2020 15:10:55 -0600
To: Stephen Kitt <steve@sk2.org>, Philipp Reisner
	<philipp.reisner@linbit.com>, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linbit.com
References: <20200124200307.1808593-1-steve@sk2.org>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Autocrypt: addr=gustavo@embeddedor.com; keydata=
	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
	VtSixD1uOgytAP7RWS474w==
Message-ID: <6016329a-4dac-ac23-9e6f-5da3dd3fefa0@embeddedor.com>
Date: Fri, 24 Jan 2020 15:12:59 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124200307.1808593-1-steve@sk2.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linbit.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.162.161.199
X-Source-L: No
X-Exim-ID: 1iv6EB-001MCI-B1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.43.131]) [201.162.161.199]:60838
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 5
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH] drbd fifo_alloc: use struct_size
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



On 1/24/20 14:03, Stephen Kitt wrote:
> Switching to struct_size for the allocation in fifo_alloc avoids
> hard-coding the type of fifo_buffer.values in fifo_alloc. It also
> provides overflow protection; to avoid pessimistic code being
> generated by the compiler as a result, this patch also switches
> fifo_size to unsigned, propagating the change as appropriate.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Reviewed-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Thanks
--
Gustavo

> ---
>  drivers/block/drbd/drbd_int.h      | 2 +-
>  drivers/block/drbd/drbd_nl.c       | 3 ++-
>  drivers/block/drbd/drbd_receiver.c | 2 +-
>  drivers/block/drbd/drbd_worker.c   | 4 ++--
>  4 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
> index ddbf56014c51..aae99a2d7bd4 100644
> --- a/drivers/block/drbd/drbd_int.h
> +++ b/drivers/block/drbd/drbd_int.h
> @@ -622,7 +622,7 @@ struct fifo_buffer {
>  	int total; /* sum of all values */
>  	int values[0];
>  };
> -extern struct fifo_buffer *fifo_alloc(int fifo_size);
> +extern struct fifo_buffer *fifo_alloc(unsigned int fifo_size);
>  
>  /* flag bits per connection */
>  enum {
> diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
> index de2f94d0103a..da4a3ebe04ef 100644
> --- a/drivers/block/drbd/drbd_nl.c
> +++ b/drivers/block/drbd/drbd_nl.c
> @@ -1575,7 +1575,8 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
>  	struct drbd_device *device;
>  	struct disk_conf *new_disk_conf, *old_disk_conf;
>  	struct fifo_buffer *old_plan = NULL, *new_plan = NULL;
> -	int err, fifo_size;
> +	int err;
> +	unsigned int fifo_size;
>  
>  	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
>  	if (!adm_ctx.reply_skb)
> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
> index 2b3103c30857..79e216446030 100644
> --- a/drivers/block/drbd/drbd_receiver.c
> +++ b/drivers/block/drbd/drbd_receiver.c
> @@ -3887,7 +3887,7 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
>  	struct disk_conf *old_disk_conf = NULL, *new_disk_conf = NULL;
>  	const int apv = connection->agreed_pro_version;
>  	struct fifo_buffer *old_plan = NULL, *new_plan = NULL;
> -	int fifo_size = 0;
> +	unsigned int fifo_size = 0;
>  	int err;
>  
>  	peer_device = conn_peer_device(connection, pi->vnr);
> diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
> index 5bdcc70ad589..b7f605c6e231 100644
> --- a/drivers/block/drbd/drbd_worker.c
> +++ b/drivers/block/drbd/drbd_worker.c
> @@ -482,11 +482,11 @@ static void fifo_add_val(struct fifo_buffer *fb, int value)
>  		fb->values[i] += value;
>  }
>  
> -struct fifo_buffer *fifo_alloc(int fifo_size)
> +struct fifo_buffer *fifo_alloc(unsigned int fifo_size)
>  {
>  	struct fifo_buffer *fb;
>  
> -	fb = kzalloc(sizeof(struct fifo_buffer) + sizeof(int) * fifo_size, GFP_NOIO);
> +	fb = kzalloc(struct_size(fb, values, fifo_size), GFP_NOIO);
>  	if (!fb)
>  		return NULL;
>  
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
