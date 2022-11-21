Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B0A6325D3
	for <lists+drbd-dev@lfdr.de>; Mon, 21 Nov 2022 15:30:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0156242096D;
	Mon, 21 Nov 2022 15:30:51 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8C3F94203A1
	for <drbd-dev@lists.linbit.com>; Mon, 21 Nov 2022 15:30:47 +0100 (CET)
Received: by mail-pl1-f175.google.com with SMTP id 4so10776276pli.0
	for <drbd-dev@lists.linbit.com>; Mon, 21 Nov 2022 06:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=fKdPBgf4F1DbPho+543ze8p/JJM5iKRRHyH33ew0++Y=;
	b=jrZpJYDRNZTvL91G/bFgw/1STzMW33rYKTqBLYy3vYffZlw43RahxhV6wxQRpWZIxX
	x6HipJ6s1wVjbg2BH9m2MwYh8gKj0JTDaxUmGi1o5nakjAaUciEROc15usDK0vKqyhOl
	9L7usg5AghzAPNpNNYrHDerJTUfeA1BB08UKuRUzfDCVZWX65+0/8j9Y54d4vjEVy8vJ
	921jD7JwFe6auLnSeXFhtVGp8RvIuE0XdQmcpeaEyKdtvhjB40A7Ef/vjR69OgPMAtrt
	HqjR+34LdHESiPMp+x6DE+vgGi2UGolxpohdnwzGLJ6mkV/cPANuyPR+RgqjiZKvK7Ll
	MXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=fKdPBgf4F1DbPho+543ze8p/JJM5iKRRHyH33ew0++Y=;
	b=MOvRsoEv4rp85nUQwukFI3LVJVeS3CPTL3WCnza8gOq/yC2KJXG407pDUNAUWjgA3T
	EuIRZXNhhNEcm5AbhG1ao3zJEuGb7mPuy754mSyJcId23c4CtksG2Q+/HJwD5ZAD4u+n
	nyQddJA8xMkpbR7eWT13m2dtstvHsHLNmhj0iwG07QG9mPIIraPXIeuyahejsibIGsEQ
	BxuJ/VrzrTUmM9nWxpRr39ItmALJUP5Q603FElkBWrj/0FkYHiXAh5Iub/YZ3v10g5Zu
	E4CbVCj/0NKTHK3kQaNYEdbW/oyBD7VUJdbIE4gUiupAWkxz9MjgMICl7y1fAFFH6H2E
	rbvg==
X-Gm-Message-State: ANoB5pmw2zNGBhby0dD3r+u4XY2Z5SuuDMnXLY5wThu+hCUURq2hR1BM
	ZWSXTOMfx/GfwRNHHe9m0pGtCg==
X-Google-Smtp-Source: AA0mqf6/+g7r5XsHDkk4PBUMLfIhfGYA2phFatP0/v3K1w6nUxS3oOR1xEvbfvt5d9rob8XbgwhAWw==
X-Received: by 2002:a17:90a:8c96:b0:218:7e9d:8d0a with SMTP id
	b22-20020a17090a8c9600b002187e9d8d0amr17088134pjo.41.1669041046463;
	Mon, 21 Nov 2022 06:30:46 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	z2-20020a626502000000b0057255b7c8easm8776251pfb.33.2022.11.21.06.30.45
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 21 Nov 2022 06:30:46 -0800 (PST)
Message-ID: <c0e639ea-caa0-f76c-c369-0d22a49047ca@kernel.dk>
Date: Mon, 21 Nov 2022 07:30:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.4.1
Content-Language: en-US
To: Wang ShaoBo <bobo.shaobowang@huawei.com>
References: <20221121115047.3828385-1-bobo.shaobowang@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20221121115047.3828385-1-bobo.shaobowang@huawei.com>
Cc: linux-block@vger.kernel.org, liwei391@huawei.com, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [RESEND PATCH] drbd: destroy workqueue when drbd
	device was freed
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

On 11/21/22 4:50 AM, Wang ShaoBo wrote:
> A submitter workqueue is dynamically allocated by init_submitter()
> called by drbd_create_device(), we should destroy it when this
> device is not needed or destroyed.
> 
> Fixes: 113fef9e20e0 ("drbd: prepare to queue write requests on a submit worker")
> Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
> ---
> 
> Changes in RESEND:
>   put destroy_workqueue() before memset(device, ...)
> 
>  drivers/block/drbd/drbd_main.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
> index 8532b839a343..082bc34cd317 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -2217,7 +2217,12 @@ void drbd_destroy_device(struct kref *kref)
>  		kref_put(&peer_device->connection->kref, drbd_destroy_connection);
>  		kfree(peer_device);
>  	}
> +
> +	if (device->submit.wq)
> +		destroy_workqueue(device->submit.wq);
> +
>  	memset(device, 0xfd, sizeof(*device));
> +
>  	kfree(device);

Maybe you can send a separate patch killing that very odd (and useless)
memset as well?

-- 
Jens Axboe


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
