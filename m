Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 438ED1E3FC4
	for <lists+drbd-dev@lfdr.de>; Wed, 27 May 2020 13:22:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0A039420383;
	Wed, 27 May 2020 13:22:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C25F342000B
	for <drbd-dev@lists.linbit.com>; Wed, 27 May 2020 13:22:07 +0200 (CEST)
Received: by mail-pl1-f173.google.com with SMTP id x11so9038290plv.9
	for <drbd-dev@lists.linbit.com>; Wed, 27 May 2020 04:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7gJxdvCpfrIue0RzTQk7obMxzbW3P/jexa322JS6jTk=;
	b=qmgUq0I63dQ2fxzbhTuUO1HPoFuKTJDCCKA0uUwXHJ02CVggXfImEsCyjOw5g1M/B6
	7uy1TbpqSl35DbJJihbShNSfLZWbB5jnC1Q1PHaGWrWF6b3dqqaamxAu8bWXgvdpgeG/
	vGqr7Bh47yvhhjrMyN7G8WxeAZvNQTAkGbFMiMxL304wcD/RlC2ouNW9QkIfbjmT9NG6
	HNDCRMhO+sl+dvr3KX0ePD7uimis7UAIGumlrG7i2AhQ2gF6HpcMYe/fkUJBrA8y8l2f
	hl8lGM/7kjKwl/LsGgfh/4F/KON7ZiAbCb0V/K4votERrdvFnmbuwtmnVkXRCyro4/+p
	YcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7gJxdvCpfrIue0RzTQk7obMxzbW3P/jexa322JS6jTk=;
	b=rF1Il1uiqoJrTb8bLszPYroGqfM82ISBF7l3aJzIN+kdxzLpnnqGCckBwg16jDr7d2
	XOjAzAyNdaoqEm+ad/S8kdtbdZXEWOEdDy09TD4Fm5+BQIKqpWH0eQj9IvBnZpKBnr8n
	c7exKy15VIj1zE5U1r2/eJOo2C2kld7hIehnJwIgx0jplxVhYkX95u3B5nNME+VsuTZY
	IqiuHHaskp7fF+imisF8p/kpf0ZGV/oj3rIy5DnOI2AAMGPddHhX68LsHDVMCbJVNjvF
	FfRpv/dMkdR7J1hqeKJ727Nc3B0MJpe04lBTewrkipe2IrKqMwCbGPs4pf4JColm63NL
	Odhw==
X-Gm-Message-State: AOAM530+n3OKoZZT6Oq7KlnAQlA7FFxszL7fIz0LyPYa+JVXgRmpXxdj
	QIc1LtjBnu62TetcgVYs6gyu4w==
X-Google-Smtp-Source: ABdhPJy6PZ//6S2JWbZAJxsDE8wE3cmlRBZk4jwdGJuMizvUypFmxI08dabu3vfsUXeWFY3+3DUfDA==
X-Received: by 2002:a17:902:d3d4:: with SMTP id
	w20mr5510652plb.3.1590578526110; 
	Wed, 27 May 2020 04:22:06 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:2cc3:8599:f649:862c?
	([2605:e000:100e:8c61:2cc3:8599:f649:862c])
	by smtp.gmail.com with ESMTPSA id
	a16sm2317879pjs.23.2020.05.27.04.22.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 27 May 2020 04:22:05 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>
References: <20200527052419.403583-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <e807976c-4a6a-ac93-17b4-a6a7dfc438be@kernel.dk>
Date: Wed, 27 May 2020 05:22:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527052419.403583-1-hch@lst.de>
Content-Language: en-US
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, Nitin Gupta <ngupta@vflare.org>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] block I/O accounting improvements v2
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

On 5/26/20 11:24 PM, Christoph Hellwig wrote:
> Hi Jens,
> 
> they series contains various improvement for block I/O accounting.  The
> first bunch of patches switch the bio based drivers to better accounting
> helpers compared to the current mess.  The end contains a fix and various
> performanc improvements.  Most of this comes from a series Konstantin
> sent a few weeks ago, rebased on changes that landed in your tree since
> and my change to always use the percpu version of the disk stats.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
