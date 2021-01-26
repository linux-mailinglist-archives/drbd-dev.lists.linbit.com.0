Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E87303105
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Jan 2021 01:52:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C5FD4205F9;
	Tue, 26 Jan 2021 01:52:18 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5A93A4205EE
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 01:52:16 +0100 (CET)
Received: by mail-pl1-f178.google.com with SMTP id d4so8739183plh.5
	for <drbd-dev@lists.linbit.com>; Mon, 25 Jan 2021 16:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cloud.ionos.com; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=D3jPNTYhrIxrX4H/Bz2CWIz5jRxLbk7blKyKqQ1JDpo=;
	b=LKcUVdvEzOmxeYA3vu7HPUTya6UHwtIgF3ymsagxdFZmQeaDU+yuxvOp72YzfbSWLf
	YVimj9mREiq+GO8RVAMrgGn00N6l4x86MLdnBMfRC8TI/5VISkU02XF+NOh6uvcdqqAJ
	7vVhecU05cWTqxjVRfwZCYJvybHmEAu9RGNiso4G7vKNHZ0fi8DJgGxgdqD9w3f7kNxY
	7vGI8KMv8vlPDj/5s091d/Te9CBP8UWGZNVSrui13kCnSysNn4nSWZS0ZOl+kAe1Lnc1
	zK146/hZpwDsZZcNsOYzof1oyCgLXBFYotdgVd/3kpqz7DFW1B20gVOLIogzs9IydycV
	9V1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=D3jPNTYhrIxrX4H/Bz2CWIz5jRxLbk7blKyKqQ1JDpo=;
	b=YkUyaa0kV9BLU3xrW0xiNL3B+AUzDDYwYwYWLySxpJe4YoqAgkxrhs9lVusZY9/loK
	n7pebn5W6azDkdO7IBoh/tktaybBv4fOyE2ezKDCuMAcOADyCgImTmyRwDEzH/CveNiS
	1MBKBR/TVD+fQBx1+33JxsN4R2av2UQMTljvaSPNGikAUWKo7yL6SIAHq9217bFKPD4D
	ZZm1tvOSBoo9fwTREOC6zToEblOLBaUkIUXT5GSqzebCdOL6KppQbwky8n+PeosW1i7y
	dr3q/YpkjA0hlWX1zC67rM4qs+l+t4M6VMpPRT1HLagHNrsnvlCDgmAgzpiV6HoaqU+D
	fT/g==
X-Gm-Message-State: AOAM5323Zmrmy5mL+u1trP4QdxZc32u7V8NJUDupGmbQ5w99kG/dk131
	oI8IFYP+g34I9R94Tr7KlLXegRwKDHmrNQ==
X-Google-Smtp-Source: ABdhPJzJAJXcVAwbnQsX7li30Ext+hUqlTUC4FsKKHPtCu6xVYdkIktiqvbNpqLznTw0AWEy317+iQ==
X-Received: by 2002:a17:902:d70f:b029:de:b33a:891a with SMTP id
	w15-20020a170902d70fb02900deb33a891amr3098526ply.70.1611622333769;
	Mon, 25 Jan 2021 16:52:13 -0800 (PST)
Received: from [10.8.1.5] ([185.125.207.232]) by smtp.gmail.com with ESMTPSA id
	v2sm16948930pgs.50.2021.01.25.16.52.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 25 Jan 2021 16:52:13 -0800 (PST)
To: axboe@kernel.dk
References: <20210121142150.12998-1-guoqing.jiang@cloud.ionos.com>
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <11599fea-e0e8-f6c8-5931-0c37491ee6d7@cloud.ionos.com>
Date: Tue, 26 Jan 2021 01:52:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210121142150.12998-1-guoqing.jiang@cloud.ionos.com>
Content-Language: en-US
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH RESEND] drbd: remove unused argument from
 drbd_request_prepare and __drbd_make_request
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Ping

On 1/21/21 15:21, Guoqing Jiang wrote:
> We can remove start_jif since it is not used by drbd_request_prepare,
> then remove it from __drbd_make_request further.
> 
> Cc: Philipp Reisner <philipp.reisner@linbit.com>
> Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
> Cc: drbd-dev@lists.linbit.com
> Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
> ---
>   drivers/block/drbd/drbd_int.h  |  2 +-
>   drivers/block/drbd/drbd_main.c |  3 +--
>   drivers/block/drbd/drbd_req.c  | 11 ++++-------
>   3 files changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
> index 8f879e5c2f67..8faa31a17b8f 100644
> --- a/drivers/block/drbd/drbd_int.h
> +++ b/drivers/block/drbd/drbd_int.h
> @@ -1449,7 +1449,7 @@ extern void conn_free_crypto(struct drbd_connection *connection);
>   
>   /* drbd_req */
>   extern void do_submit(struct work_struct *ws);
> -extern void __drbd_make_request(struct drbd_device *, struct bio *, unsigned long);
> +extern void __drbd_make_request(struct drbd_device *, struct bio *);
>   extern blk_qc_t drbd_submit_bio(struct bio *bio);
>   extern int drbd_read_remote(struct drbd_device *device, struct drbd_request *req);
>   extern int is_valid_ar_handle(struct drbd_request *, sector_t);
> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
> index 1c8c18b2a25f..7e5fcce812e1 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -2288,7 +2288,6 @@ static void do_retry(struct work_struct *ws)
>   	list_for_each_entry_safe(req, tmp, &writes, tl_requests) {
>   		struct drbd_device *device = req->device;
>   		struct bio *bio = req->master_bio;
> -		unsigned long start_jif = req->start_jif;
>   		bool expected;
>   
>   		expected =
> @@ -2323,7 +2322,7 @@ static void do_retry(struct work_struct *ws)
>   		/* We are not just doing submit_bio_noacct(),
>   		 * as we want to keep the start_time information. */
>   		inc_ap_bio(device);
> -		__drbd_make_request(device, bio, start_jif);
> +		__drbd_make_request(device, bio);
>   	}
>   }
>   
> diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
> index 330f851cb8f0..5e5602af9643 100644
> --- a/drivers/block/drbd/drbd_req.c
> +++ b/drivers/block/drbd/drbd_req.c
> @@ -1188,7 +1188,7 @@ static void drbd_queue_write(struct drbd_device *device, struct drbd_request *re
>    * Returns ERR_PTR(-ENOMEM) if we cannot allocate a drbd_request.
>    */
>   static struct drbd_request *
> -drbd_request_prepare(struct drbd_device *device, struct bio *bio, unsigned long start_jif)
> +drbd_request_prepare(struct drbd_device *device, struct bio *bio)
>   {
>   	const int rw = bio_data_dir(bio);
>   	struct drbd_request *req;
> @@ -1416,9 +1416,9 @@ static void drbd_send_and_submit(struct drbd_device *device, struct drbd_request
>   		complete_master_bio(device, &m);
>   }
>   
> -void __drbd_make_request(struct drbd_device *device, struct bio *bio, unsigned long start_jif)
> +void __drbd_make_request(struct drbd_device *device, struct bio *bio)
>   {
> -	struct drbd_request *req = drbd_request_prepare(device, bio, start_jif);
> +	struct drbd_request *req = drbd_request_prepare(device, bio);
>   	if (IS_ERR_OR_NULL(req))
>   		return;
>   	drbd_send_and_submit(device, req);
> @@ -1596,19 +1596,16 @@ void do_submit(struct work_struct *ws)
>   blk_qc_t drbd_submit_bio(struct bio *bio)
>   {
>   	struct drbd_device *device = bio->bi_disk->private_data;
> -	unsigned long start_jif;
>   
>   	blk_queue_split(&bio);
>   
> -	start_jif = jiffies;
> -
>   	/*
>   	 * what we "blindly" assume:
>   	 */
>   	D_ASSERT(device, IS_ALIGNED(bio->bi_iter.bi_size, 512));
>   
>   	inc_ap_bio(device);
> -	__drbd_make_request(device, bio, start_jif);
> +	__drbd_make_request(device, bio);
>   	return BLK_QC_T_NONE;
>   }
>   
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
