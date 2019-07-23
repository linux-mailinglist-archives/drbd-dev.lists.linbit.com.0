Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 37ED6719DF
	for <lists+drbd-dev@lfdr.de>; Tue, 23 Jul 2019 16:03:00 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 6873D101AC48;
	Tue, 23 Jul 2019 16:02:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1226 seconds by postgrey-1.31 at mail09;
	Tue, 23 Jul 2019 16:02:56 CEST
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
	[209.85.167.194])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id F16AF101AC45
	for <drbd-dev@lists.linbit.com>; Tue, 23 Jul 2019 16:02:56 +0200 (CEST)
Received: by mail-oi1-f194.google.com with SMTP id s184so32359555oie.9
	for <drbd-dev@lists.linbit.com>; Tue, 23 Jul 2019 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=U/rIdHk59Y26MP5OXK9CvV9HfQIDnItcRiOtBbdSbMQ=;
	b=y4uhVeOBrDTO/fWLGANwFQ5WbdfHqk0C3/9TA4Xqj6oaoxU4upVOcL3Jwc7pOKVpNQ
	jvwpqpGDcfUB/YN5IEPy7WIeXpG//IQCBQCmGghrtYY/EuKSvIevTqGPJtakh0LoO/Tk
	wtaS6ABQOdbx4zCVCvVSpwo4dVKDS2vLDYJq1GOf5e8qDIZy1OLZjP8iZ8+juoa3nbTO
	Ry+rreTVmTnPNGUOdX7PKSil7d1tIGK/Y0WImVn9y2OgmzbzZk9P9Ms0Z8ZkVVA6MXhi
	fgVWNl4lfjsR8SD40LuLvlZ8TXLj7jTpoYttudPDPha42ZNstoa0gF6lXXi6ULka99pT
	ylxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=U/rIdHk59Y26MP5OXK9CvV9HfQIDnItcRiOtBbdSbMQ=;
	b=ATv6CV88FkBYwV8zHQ3GMYFPFt4W4ZM9j9IroLnoseaEph8QY+r9tD9qCPKhUXjTC+
	0sCYwROqscDuryzNmTqNWL+rkQw7hlrFs1/q2Jfyg4sd5vWu/5GskA8ykY6ww2hBF7tr
	eL7c8Y4Kh0L6K0yPlKMUP/NtFRJ/872Jaz8u2yDUMUc4aQfZI5A3NASUPEfuX+qWUBHw
	toNHHbRV9R8PnWj7jaOaJi0TRhQ2jNxrqK2uEpcPLb2Y4fVYexzQhMQ4Af7IWKSSLxn9
	X+a+AMQ50XaeKS8f2fz48l0Gu7p1YQR2vpBnDPJ+HjtyZ/FO1SDUmdHXejtoLIEJatGc
	7INQ==
X-Gm-Message-State: APjAAAWOPTPun2jD+S4ndOZ0D/YA9GMetDmzKnZitW0GNq9VVBNwDmbe
	hdOxQx5a+P4OkKf9cWT8mbFMuNOobFw=
X-Google-Smtp-Source: APXvYqyZXqUqAa7v+mXbcPVtleQm/zArV5YEyo8rLa6bVPAOCH2Ab1hiVN80dUJspZkEVeaO9Om9wg==
X-Received: by 2002:a65:654f:: with SMTP id a15mr74534244pgw.73.1563888945184; 
	Tue, 23 Jul 2019 06:35:45 -0700 (PDT)
Received: from [192.168.1.121] (66.29.164.166.static.utbb.net. [66.29.164.166])
	by smtp.gmail.com with ESMTPSA id
	bo20sm32429908pjb.23.2019.07.23.06.35.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jul 2019 06:35:44 -0700 (PDT)
To: Arnd Bergmann <arnd@arndb.de>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
References: <20190722122647.351002-1-arnd@arndb.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <2675f963-6d67-7802-4f8a-eab423688419@kernel.dk>
Date: Tue, 23 Jul 2019 07:35:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722122647.351002-1-arnd@arndb.de>
Content-Language: en-US
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Kees Cook <keescook@chromium.org>,
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
	Roland Kammerer <roland.kammerer@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] [v2] drbd: dynamically allocate shash
	descriptor
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 7/22/19 6:26 AM, Arnd Bergmann wrote:
> Building with clang and KASAN, we get a warning about an overly large
> stack frame on 32-bit architectures:
> 
> drivers/block/drbd/drbd_receiver.c:921:31: error: stack frame size of 1280 bytes in function 'conn_connect'
>        [-Werror,-Wframe-larger-than=]
> 
> We already allocate other data dynamically in this function, so
> just do the same for the shash descriptor, which makes up most of
> this memory.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
