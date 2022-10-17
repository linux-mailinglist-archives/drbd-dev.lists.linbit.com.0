Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1272A601104
	for <lists+drbd-dev@lfdr.de>; Mon, 17 Oct 2022 16:22:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 69184420643;
	Mon, 17 Oct 2022 16:22:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
	[209.85.216.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CAC1D4201A5
	for <drbd-dev@lists.linbit.com>; Mon, 17 Oct 2022 16:22:44 +0200 (CEST)
Received: by mail-pj1-f42.google.com with SMTP id
	o17-20020a17090aac1100b0020d98b0c0f4so13007855pjq.4
	for <drbd-dev@lists.linbit.com>; Mon, 17 Oct 2022 07:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=jRSby5zhVSUVlEq+bbR1NcNPmHFAP8cNa88Q45JNK3g=;
	b=HQhY+g88ZnIP+kH7iqiHbNxB7iaeCzxhQZR0j13oHGBfzT+oMoWpvcv2pX9S/VPL/A
	S3IfylQ9P8lH4s2NLQ6QEyk+PmoG/OgF24tZNp+2q8C+J6Y9RiAS2lKD5Ijl4w0kq8Hu
	uD2/0f0FfaFuVj4xm1ax/Su0ic+/3BVra7XEFbyws588cK+JC6n2U1NoRl8Enlix0JX+
	1csPc4RcLXmMKF61/HV1PogJseiRW9MSf03i/7JAx0AHAeJwoTGjQZiTmel4tSoED3iJ
	DeceZsBmI2PtBtzqCVGYUw4eMHCfEOlu9rKS5KYDsV7SdiDxhGPVOSlv/Hqs07HTeEBK
	aPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=jRSby5zhVSUVlEq+bbR1NcNPmHFAP8cNa88Q45JNK3g=;
	b=0GOryGXbWYkpm2c5pb6I0npcR5q48om7bwuh9mAoRaOVAtM6B379CiQmlLYzYRXjR+
	T3zefUCLVbjozdDZc5aL1+QPQBEcFEGAa2Fh5S/MikoZaLdeegamVAYc/zZo8zXfIZlB
	CSkMy9JEP5GzMMDKtpMaAsKNULrXuE+ulUa/O3G9L43Y8x1nu6O/fEj+SDaqT2+YX9Qp
	d5xACblFFlGkeblMdZUxtz3CMrKtfdJObTlK4hXYe/FbWntoqLNfukvBG4YRjeW17pf/
	qCGeWhb8Gui3UfHU4Dtq8HrJLP1TqQQ/JyM2g/t+/9BAamk7rwU7Az/rkIFHXHSekUJM
	QSJw==
X-Gm-Message-State: ACrzQf2TIarvdb2u0gETinJIMU8sMDd3Jqj8tfstasYEM48kSYGqWLYH
	IQyAMWxTrJTpMhOYmwbPKbsM8A==
X-Google-Smtp-Source: AMsMyM50KWzgYIMmz7/3yb4h+y0bnJI6wCzK2l2zIpYBnb278tJXu3bJkMqOsgQoWoygRDsU6P8zZg==
X-Received: by 2002:a17:90b:e0e:b0:20d:ac00:d261 with SMTP id
	ge14-20020a17090b0e0e00b0020dac00d261mr13485859pjb.214.1666016563651;
	Mon, 17 Oct 2022 07:22:43 -0700 (PDT)
Received: from [192.168.4.201] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
	by smtp.gmail.com with ESMTPSA id
	f131-20020a623889000000b00561382a5a25sm7182627pfa.26.2022.10.17.07.22.42
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 17 Oct 2022 07:22:43 -0700 (PDT)
Message-ID: <79b12322-4298-2a2f-c126-a00071e31f1d@kernel.dk>
Date: Mon, 17 Oct 2022 08:22:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.3.2
To: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
References: <20221017090154.15696-1-christoph.boehmwalder@linbit.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20221017090154.15696-1-christoph.boehmwalder@linbit.com>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: Store op in drbd_peer_request
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

On 10/17/22 3:01 AM, Christoph B?hmwalder wrote:
> diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
> index 4d661282ff41..0f8e3b94a635 100644
> --- a/drivers/block/drbd/drbd_int.h
> +++ b/drivers/block/drbd/drbd_int.h
> @@ -395,6 +395,7 @@ struct drbd_peer_request {
>  	struct drbd_peer_device *peer_device;
>  	struct drbd_epoch *epoch; /* for writes */
>  	struct page *pages;
> +	unsigned int opf; /* to be used as bi_opf */

Why isn't this blk_opf_t?

-- 
Jens Axboe
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
