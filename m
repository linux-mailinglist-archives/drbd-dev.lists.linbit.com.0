Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6B0C68EA0
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Nov 2025 11:51:47 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 21FF91627A6;
	Tue, 18 Nov 2025 11:51:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BD159162276
	for <drbd-dev@lists.linbit.com>; Tue, 18 Nov 2025 11:51:04 +0100 (CET)
Received: by mail-ed1-f50.google.com with SMTP id
	4fb4d7f45d1cf-64175dfc338so10022409a12.0
	for <drbd-dev@lists.linbit.com>; Tue, 18 Nov 2025 02:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1763463064;
	x=1764067864; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=jGdM1wJoXGQz7bm128xRbuaPqwpiMtIqZbrUwM7E1+I=;
	b=EZC56sLc32rnnioPcVa4gDIM9ZAQzTDDOLJ5QYxsd1xuKjy6l1cotm2USFVWCJmlBc
	ND38ZLmTD3RbtjM+HQYva0Eva2STDrIp7cRiJHPJu8DLNbCuEiXPNvHnsOvbX9qn6pHG
	ITcz/s1/ZB6KXeYqQRkJzp8prJvaw6wGhv3ie1Ez1wZUpXa0GhxINjah7YSNVFTL6BVK
	8x5ieSk87BRK3DKS9OMZbZIN4KLDPXdPSajqfuqsxILjnj3C466ULF0xfMjk7H3Bhk+v
	UBW10hZpD5939fQviXnnXVjb2e0V/KahTs04Fl3eFLRXsJE4EltJjo+e8h7px1AAW34b
	2u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1763463064; x=1764067864;
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=jGdM1wJoXGQz7bm128xRbuaPqwpiMtIqZbrUwM7E1+I=;
	b=KCXV5oRqKMaa2a+UcoVLySJzZlBQHm6TKvDohGNFI8c9eFtFuyA8oz84sbSUzFLEDA
	zmuhevA3o/StzsmFy8VcKzkRHt+YzqDEzXRBO4nP+IcoOM4lF8lRL8HLL+qojsHskJm9
	mnD8wBCOuUQODCcQzCLaGMpVqjoxpeqkctGDHaErldJc09WFvwfOBcezNvH/ldinlvC+
	HLXMT0qLD7fLZ9mO7PB3gTH6tjcQQarWJ0k9u5/dErNh/LOiy4iuaVIgPOyTlIYMPYq8
	lwHfWe9kF4XGOubaF6Kn4V9PVjg5e5a/F/MYb65OTZODahW3feP8f3L4QboQiUOIq2FS
	XP0w==
X-Forwarded-Encrypted: i=1;
	AJvYcCW5xfKJNuc1TPM++mLkSTZKyZu4MrLLzfXQKlUPF7x4xrtGCjJ0AboHFs0jderCBzGERXGSPW3Dfw==@lists.linbit.com
X-Gm-Message-State: AOJu0YxcoyfJsETWrQL+XUv4Zb+zZ7UqLS0wRnlRT60L4HWHB8AkiWat
	rkQsWp9wWn74ovGePEx1zu3xNTTj0gsAVl1tpc8TUeXSaLVJAIduAuOR1owEBCBCw6Qdtw==
X-Gm-Gg: ASbGncu9jhyh3J9uXlWP/REY+PVlFvCuPmCHnYmdKewvMQdkTB4d00Axe4rE7CVSXKp
	zTfSEFvBrdoriF9pyK6pucUsPKEsD+PO0X6OYABgszFWA3H05xDGbw9JMb2z9B7BYHrJtxc5OYK
	jQ2Y916Z24x4S/HdlvGpIytLaI69FQLmA4j0QXf7IuVKLEWAak3C+L6x13wPqSyhlerwJ3/aSTM
	YXgMf5ocPRu3ciI9C9A904ObXvfGoSizoLvz9iMFHQtfqpWXNFdPhhlnFJ2ArpHRQ41r+hQripj
	EpJLmpUcv1dR5CKCSrpzgy0xLOAO/TMkzyEcwHd0yeXi9ruQRuWu2i4bMpyQGzbi5EHWG6pxcvL
	VN6dwc4TZ83w0LdMUgzLms64MZzsfe8tttnactp/htx8q6YHRZsbZW8cyCvgTTYOILc2Ba0Cu8X
	SfVr0KMLgG80YrMzjMtiqhBj5BSRyoTjbFhVo+oTgJrP0QN07pafY4CT31T3E12KGKOEz/XPXW4
	kzNEOTE6Ewgfw==
X-Google-Smtp-Source: AGHT+IEWZK62eDgqge0iEYvyjOKSQ1p48XfRz0kdjUFIlAsN6sWTmoc4BYjlcjTS9bPeI5jtRT4qFw==
X-Received: by 2002:a17:907:3d52:b0:b72:d9f1:75e5 with SMTP id
	a640c23a62f3a-b73678d9a41mr1737837266b.20.1763463063991; 
	Tue, 18 Nov 2025 02:51:03 -0800 (PST)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	a640c23a62f3a-b734fad456bsm1351037766b.21.2025.11.18.02.51.03
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Nov 2025 02:51:03 -0800 (PST)
Message-ID: <11f8aaaa-b5de-44dc-9263-5bdb506923ac@linbit.com>
Date: Tue, 18 Nov 2025 11:51:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drbd: turn bitmap I/O comments into regular block comments
To: Sukrut Heroorkar <hsukrut3@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	"open list:DRBD DRIVER" <drbd-dev@lists.linbit.com>,
	"open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20251118090753.390818-1-hsukrut3@gmail.com>
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
In-Reply-To: <20251118090753.390818-1-hsukrut3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: shuah@kernel.org, david.hunter.linux@gmail.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Am 18.11.25 um 10:07 schrieb Sukrut Heroorkar:
> W=1 build warns because the bitmap I/O comments use '/**', which
> marks them as kernel-doc comments even though these functions do not
> document an external API.
> 
> Convert these comments to regular block comments so kernel-doc no
> longer parses them.
> 
> Signed-off-by: Sukrut Heroorkar <hsukrut3@gmail.com>
> ---
> See: https://lore.kernel.org/all/20251117172557.355797-1-hsukrut3@gmail.com/t/
> 
>  drivers/block/drbd/drbd_bitmap.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Thanks.

Acked-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

