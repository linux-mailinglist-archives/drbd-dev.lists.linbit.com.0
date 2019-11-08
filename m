Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F8AF4DB0
	for <lists+drbd-dev@lfdr.de>; Fri,  8 Nov 2019 15:04:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 852454203D7;
	Fri,  8 Nov 2019 15:04:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 519 seconds by postgrey-1.31 at mail19;
	Fri, 08 Nov 2019 15:04:25 CET
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 306B5420347
	for <drbd-dev@lists.linbit.com>; Fri,  8 Nov 2019 15:04:24 +0100 (CET)
Received: by mail-io1-f68.google.com with SMTP id g15so6457416iob.9
	for <drbd-dev@lists.linbit.com>; Fri, 08 Nov 2019 06:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qhj0pYG/xfb9ZXayAFQZBmgKNwxw6I0CpoVt3iCpB1E=;
	b=SlnJ0kzDnF+zUVdem+qMS9wPqFOmE4StE78W5pCkwNeQbv3pcDv/6wbvF9Wzsyej6a
	mVp7dDiaYBiGAGozWrA6DxU2eqJdpfSno8KXt6N44vL8mUfNvXdzzYobLagSEhGYPhrs
	mzyYec6kzQhLmNdjY3HpzPswzummUVIV45W7ewSXze6ksqYRjkIb1DF+8/l6g8hTmj2v
	fIX6tTXrTKWoCMPy1kBumphFKsg9wM5PQsZUGEbNAeOy7ZCati+IAS6/F2UO+ZcMlhPY
	PGiFXKKj/j2YC08ktmwhITccWfmu87EX9XndOE3MVtY2nXzWQpsFSPja6+o5cvtUHFrd
	VSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qhj0pYG/xfb9ZXayAFQZBmgKNwxw6I0CpoVt3iCpB1E=;
	b=X1Xa9AOUsGi0AQPpMIUgEU4GnNU0gMbdkaxDQ6WrzfT69Az/vXpmhlYBdWqri/8Jex
	b7+RFxneiGghoA5uqKoSZAyupJO7jxQeNRCogVN3HGEtUS6T2H+7THsnJb8gJabJGlFO
	DX4gEWkZTM7Znpx2JnPSan3tUVQrrNApE8x+QNkMXZZ8CubImDNmp4+L2SH3DujldE7i
	2eFO35ptYipNOTXQeFuw1qVCkiWUwY7ItY25vMPJO+J/Mxgywq1DYSR5MTy6Gm2Dh8E9
	U0SIenhfUcxiC9oZiSjybc78fUL3mGIgUI336p1Gk4ncNi9miSj97pPzQiam/OKSeNT6
	ktOA==
X-Gm-Message-State: APjAAAUzfc2eMVMUAgGKXBc70sAWPtf2hyA0yCtblEY3IQWo7CPkwchn
	fpjKydlsX/kRe8FzRoWUnTPwLKYneT8=
X-Google-Smtp-Source: APXvYqxT7wKu6Rb3KLuV8PJsLUA7DGTaBKo+K+FqKHR5/THatlVz8nZOFOdzmcrdjerSlYdgOa+70A==
X-Received: by 2002:a05:6602:198:: with SMTP id
	m24mr9909819ioo.34.1573221285861; 
	Fri, 08 Nov 2019 05:54:45 -0800 (PST)
Received: from [192.168.1.159] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id p19sm776620ili.56.2019.11.08.05.54.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Nov 2019 05:54:45 -0800 (PST)
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
References: <20191107074847.GA11695@mwanda> <6906816.cRlsrm7Sor@fat-tyre>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <17fea9d1-39f8-1d91-5509-5f520009b9c9@kernel.dk>
Date: Fri, 8 Nov 2019 06:54:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6906816.cRlsrm7Sor@fat-tyre>
Content-Language: en-US
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block: drbd: remove a stay unlock in
 __drbd_send_protocol()
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

On 11/8/19 3:46 AM, Philipp Reisner wrote:
> Hi Dan,
> 
> yes, your patch it obviously correct. The comment you are
> referring to is badly worded. We will remove it.
> 
> Jens,
> 
> are you taking this patch as it is?

Yep, I'll queue it up.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
