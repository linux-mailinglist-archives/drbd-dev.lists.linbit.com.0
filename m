Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2703A19F8
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Jun 2021 17:42:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 27AF342060D;
	Wed,  9 Jun 2021 17:42:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 770454205D7
	for <drbd-dev@lists.linbit.com>; Wed,  9 Jun 2021 17:42:31 +0200 (CEST)
Received: by mail-pj1-f53.google.com with SMTP id k7so1566134pjf.5
	for <drbd-dev@lists.linbit.com>; Wed, 09 Jun 2021 08:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=Z+kgbcTthKkRaTLerI5LIt6g96eR6yyPJbyK3XBw3oU=;
	b=h60acMdnntT8zv6JMmqModd/J93zqAuVPxGRVBgALmvY3TyZQfVmb9+Fcr6CUWePjU
	oJbw7fe78PBe8M+JQ+2cLcBiXtOD0dyG7c9hvh0WHJJueT4kybrq4RiEaCvAtqdEL/Vb
	Prj7uhAkqoSE2LLYJJntt3IPg8qQHJ8lBDfIN5vY9MS10iotcj2BuagXHhkTfKhFbhXM
	iT9InmJeOQpgDS+f/pywkFdOkKUKStlh1uFv+DF7qMUWolcLPDyFbec/2Xn8wkoNV5w2
	gAXaUHi9O/O9DW8EprS8om8twyMCX2bu281slztLMGf6PTG8ntiYgEkyP13U78zUkAYa
	BAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Z+kgbcTthKkRaTLerI5LIt6g96eR6yyPJbyK3XBw3oU=;
	b=b6NdtxoR8ZPZY6QokW1JffWTUbrRF5WMNI0RM6Jj2mCFSodhaV5aj0lALiEzSWXYP+
	jFb5KAH1RRhklq535rOYeb0dFs0PTED0Pxjyi/OUREi1LLIr+QRzujEF7khOQj10o6vE
	/d0g+BR+S0GLwzjix6pHciJr7mN2bTqAmQlWEsLTy9tvZTcG0lXUBDsT1p//0iWdtMgQ
	GBtCt+ujdctc/UGReI6FHhaCo/i2KIczGjrXksiRjBtGtwPF7nemyCrQq9u48j0Q9qlw
	ccwc2lfHKyC7IkgDWuWxHKm1dxF1tyVt6XB3RjbygfWS5PN9uAV76Ib4uylVQIMx56jv
	RsCA==
X-Gm-Message-State: AOAM5316t/kxXMDkCwcjatz02xaKHjyo8VxUpEecFtjg+FEROP28kdTe
	YXDTEAJHqVcvbQb9GbfGErOvQQ==
X-Google-Smtp-Source: ABdhPJwQ9FRzOk3nVmVPhkujmABcn64QD25jQWXFfZeJB8P/CBSyiQIZWrINGKD7uv2O5zl4kOT2Lg==
X-Received: by 2002:a17:90a:4e4a:: with SMTP id
	t10mr124420pjl.173.1623253350154; 
	Wed, 09 Jun 2021 08:42:30 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
	by smtp.gmail.com with ESMTPSA id
	x33sm45811pfh.108.2021.06.09.08.42.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 09 Jun 2021 08:42:29 -0700 (PDT)
To: Zhen Lei <thunder.leizhen@huawei.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev <drbd-dev@lists.linbit.com>,
	linux-block <linux-block@vger.kernel.org>
References: <20210609121426.13936-1-thunder.leizhen@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <aefad024-73b0-26b2-f02c-fe534df16bbb@kernel.dk>
Date: Wed, 9 Jun 2021 09:42:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210609121426.13936-1-thunder.leizhen@huawei.com>
Content-Language: en-US
Subject: Re: [Drbd-dev] [PATCH 1/1] drbd: remove unnecessary oom message
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

On 6/9/21 6:14 AM, Zhen Lei wrote:
> Fixes scripts/checkpatch.pl warning:
> WARNING: Possible unnecessary 'out of memory' message
> 
> Remove it can help us save a bit of memory.

Applied, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
