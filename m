Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D10AF1F82C8
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:18:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE29C4203FD;
	Sat, 13 Jun 2020 12:18:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8D4DB420425
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:40 +0200 (CEST)
Received: by mail-wr1-f65.google.com with SMTP id j10so12280800wrw.8
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ai4SFAnq/6nSINx/FBKSEuSs6VEDwe9CKXW2LSyg3rA=;
	b=gIZwGrL4fsyrGJL76hJKHNR+XiGBo2CRt7zhu3dZSjVkHlSqo7h9QqmKg8aVmPO4wz
	efPN7G1VbVinKG4XcToGPwxdTMOnKA5Um/rgBE2YZ1YPnLYoNHjTi6TMbiSa6mOccD0n
	wMGIlnhv7VyL7tmbKaQ9JbZh7h6PFbvkwj2e5lrMhqBUGAX4tLL+IdpIsgPkpOeYfxuu
	YQL0KP6629VbPQt2P2+2QfpmsEx+ELJLZS+WKNFPlK5ggUbhGtZf6UWExznArwOHIFa7
	2rkGg4Hp+ITwtK8IlmhklHFH3gOXFAsrxe/6ofl0ackRwL5joesQs4mQErKvoqalx9ED
	Y5gA==
X-Gm-Message-State: AOAM533beb+Kw5fOG8L21JTR7n844Drcfqriz/VxaloRurLTwyJ9eQ2a
	O+mK7APTk7HCIXC67K+ArBMfJOSoWFiu1w==
X-Google-Smtp-Source: ABdhPJwfHKZq3O5Q8joif5+OwCTZH56ouNyqj6HGkHf77vqL3ubPyAGQpGezxRTPPv5gS2NGeV5spA==
X-Received: by 2002:a5d:6144:: with SMTP id y4mr19833692wrt.185.1592042320090; 
	Sat, 13 Jun 2020 02:58:40 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	m129sm13899319wmf.2.2020.06.13.02.58.39
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:39 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:58:38 +0200
Resent-Message-ID: <20200613095838.GV4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 374 seconds by postgrey-1.31 at mail19;
	Mon, 25 May 2020 14:34:24 CEST
Received: from forwardcorp1j.mail.yandex.net (forwardcorp1j.mail.yandex.net
	[5.45.199.163])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1E6574202C3
	for <drbd-dev@lists.linbit.com>; Mon, 25 May 2020 14:34:24 +0200 (CEST)
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
	[IPv6:2a02:6b8:0:1619::162])
	by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id C52572E1499;
	Mon, 25 May 2020 15:34:23 +0300 (MSK)
Received: from iva8-88b7aa9dc799.qloud-c.yandex.net
	(iva8-88b7aa9dc799.qloud-c.yandex.net
	[2a02:6b8:c0c:77a0:0:640:88b7:aa9d])
	by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
	ZJIXPPS6z9-YLTi9Z9T; Mon, 25 May 2020 15:34:23 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; 
	t=1590410063; bh=ai4SFAnq/6nSINx/FBKSEuSs6VEDwe9CKXW2LSyg3rA=;
	h=In-Reply-To:Message-ID:From:Date:References:To:Subject:Cc;
	b=yMuAin8OkKoPyA6fM61Kd5gq/kMQik8QtpCqmqv1ySlA0gbKNgjehnM/Avo4jesLA
	1NJfntE9wrGKJwo4Sk3LwQYzT/Ut83m1kxlcVbmccuRAiCW947q9+smxOC+ZIq8b+K
	PGM0Lk7vsx2iw92s7aN1ayw2f6hxBIH5GbKWN1pU=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
	dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
	[2a02:6b8:b081:603::1:c])
	by iva8-88b7aa9dc799.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA
	id O3BMKGQlP9-YLXqqoTf; Mon, 25 May 2020 15:34:21 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20200525113014.345997-1-hch@lst.de>
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Message-ID: <81f4057b-124a-d0e7-94af-15a198d48d50@yandex-team.ru>
Date: Mon, 25 May 2020 15:34:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200525113014.345997-1-hch@lst.de>
Content-Language: en-CA
Cc: linux-nvdimm@lists.01.org, linux-bcache@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Minchan Kim <minchan@kernel.org>, dm-devel@redhat.com,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] block I/O accounting improvements
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

On 25/05/2020 14.29, Christoph Hellwig wrote:
> Hi Jens,
> 
> they series contains various improvement for block I/O accounting.  The
> first bunch of patches switch the bio based drivers to better accounting
> helpers compared to the current mess.  The end contains a fix and various
> performanc improvements.  Most of this comes from a series Konstantin
> sent a few weeks ago, rebased on changes that landed in your tree since
> and my change to always use the percpu version of the disk stats.
> 

Thanks for picking this up.

One note about possible further improvement in reply to first patch.

Reviewed-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
