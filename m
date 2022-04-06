Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 204414F5DE3
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 14:35:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E4AA2420FD3;
	Wed,  6 Apr 2022 14:35:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E3A9C420FD0
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 14:35:43 +0200 (CEST)
Received: by mail-pj1-f47.google.com with SMTP id
	ku13-20020a17090b218d00b001ca8fcd3adeso5627291pjb.2
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 05:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=odt5YKmMJSj5TevCN9iB8kF64NZNPCBBQ6O3JBapXtw=;
	b=jx8rjvkPQdndpWlBqdzNaiU8V7O0L9ryqTK/IFAtQ6YsNXlwRF0w/Uxe1PMQIMGxsa
	92TfmSIsqTSKD2VTxfrJlPBdW7slHAxXzIv8yjCHzh1R2XsoBYgbst+ayNHt8yvhi3/T
	zW0jBz+wDThcMLiIfD2kAXO7b6g/zHbHAiv7BDqwL8+PV4N6c6AnB4lByHBAsuklGmIK
	J8hvEqNTlrE2s80JO0RSSdQCim8Ji9FtQ4P7K83sjSXI9zmjU1mY+GPyeSn0kdFThtZT
	mZHc9kNytXwj9AkF/dVqrgkTodAlyCAAWT9Q7akXeJDC8q4cyrhfDIZFO2SXHZNrtt1w
	5QHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=odt5YKmMJSj5TevCN9iB8kF64NZNPCBBQ6O3JBapXtw=;
	b=k92uG7qycXnQD8UXnISP4oURqhRFZkgqSdAQ0SuYdwiu/VJARiaDto4oKMpwGMblr5
	aNLiWmE4hkz93c1hFvNRgi9WymsjMpTpAldOtTJfZJXoy7RStrpAeCdqRtIIwRkLJtl8
	M4mkgz6LSjezS8jNY7rAEYNrET6A31Yv8QA6111tjL6RYZn5Tk27fUufdvAgr8TxdIr0
	jkvWE3S1XhFC/k3Trh+5NPEM5K6rsrF2R6D8G88x3L60Rj6W5bZSzedGGmGoz82VbPA4
	aTl3GXPhfuMoLcSlOImBqIRlTToTIVBUdv7CfYN7SRVd08p69SxiT1VcmMvR29JtuPb4
	ZQjw==
X-Gm-Message-State: AOAM530hH8AYWyF+YueqlKQur/Hxsi+CIYUE/a/KZHzTP7AMIBN2gSle
	hJ1IS212B9hKooEy7/opmEcjhA==
X-Google-Smtp-Source: ABdhPJxyD2kZKAeDbbyKliugJjKuLxRxQVesGftYslgT++r2Fmts47ksjmG+WYqpO8FPq1c4Lj7qQw==
X-Received: by 2002:a17:902:b696:b0:156:b63:6bed with SMTP id
	c22-20020a170902b69600b001560b636bedmr8461832pls.24.1649248542201;
	Wed, 06 Apr 2022 05:35:42 -0700 (PDT)
Received: from [192.168.1.100] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	q13-20020a056a00088d00b004e1bea9c582sm19356588pfj.43.2022.04.06.05.35.40
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 06 Apr 2022 05:35:41 -0700 (PDT)
Message-ID: <e2035fff-01e2-0df7-2508-82b741615519@kernel.dk>
Date: Wed, 6 Apr 2022 06:35:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
References: <60bf3e8f-9cfb-00d1-5fea-71a72ba93258@linbit.com>
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <60bf3e8f-9cfb-00d1-5fea-71a72ba93258@linbit.com>
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [GIT PULL] DRBD fixes for Linux 5.18
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

On 4/6/22 2:06 AM, Christoph B?hmwalder wrote:
> Hi Jens,
> 
> this is the first batch of DRBD updates, catching up from the last few
> years. These fixes are a bit more substantial, so it would be great if
> they could still go into 5.18.

Thanks for sending these, but you based the repo on my 5.19 branch,
which won't work as pulling your tree will then result in me getting
your 5.18 changes with my 5.19 as well.

As it happens, this is also a problem for your 5.19 based changes. My
for-next branch is not stable, just like linux-next isn't stable. In
terms of shas, not how it runs...

In general, for the block tree, here's what you want to base the changes
on, using 5.18/5.19 as examples as current/next tree.

- If they are bound for 5.18, base them on block-5.18. That branch may
  not exist if nothing is queued up yet, in which case just base them on
  the last -rc1 tag for that series. That'd be 5.18-rc1 in this case.

- If they are bound for 5.19, usually I will have a 5.19 driver and core
  block branch. Base them against for-5.19/drivers. If it doesn't exist,
  previous -rc is a good choice again.

Usually post -rc2 all of the above branches will exist, during merge
window and right after things are a bit more influx and haven't really
settled down yet.

Now, there's also the fact that you're using a non kernel.org git tree.
That's fine, but ideally we'd like you to use signed tags in that case.
But not sure your key has been signed by anyone in the korg ring of
trust? Since I've already seen these patches this isn't a huge concern
for now, but something to get sorted out going forward.

Can you rebase your two pull requests and send them in again? Either
that, or just git send-email the two series, that'll work too. I'm fine
applying series from maintainers like that, it doesn't have to be a git
pull request.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
