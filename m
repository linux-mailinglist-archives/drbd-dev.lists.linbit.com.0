Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0834EB0E3
	for <lists+drbd-dev@lfdr.de>; Tue, 29 Mar 2022 17:44:18 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2EFDD4205EF;
	Tue, 29 Mar 2022 17:44:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com
	[209.85.221.171])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BC38E420192
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 17:44:15 +0200 (CEST)
Received: by mail-vk1-f171.google.com with SMTP id n135so9985943vkf.6
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 08:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cFXlp32xQw7/OjMn3uGU844211qFMDFeLujMZW6rFtE=;
	b=JqKDQ8MKvspOvGXGqMIk6wdMVNm2l+b4NyGw6XjLHvS4btBEqsAfnlyweRKHI4yMJG
	ghyNvZ3eYnf2Zor1uhlE1bG1HzDFRUTP7PMo7n3K63z+CtY6PMp+ACAjJZfIbgzqFp90
	dgEixgbPzK/xbL2DhnDrF0A+GFWKW9kK5u5AiazLqE+YSJHzqmcTH/kU2+j0gmpSo/K+
	tzBUrvWpmsdBIMHKH+y1Y7W42wYDLHBvBmnbvUvRxmd7Lr7PrD3kr+k+USKm9anB8Kbh
	icgrwgZdiP1VOnpV3IhtWS9kmwb6OgSbkglXY/R7vfdcXfv2gdQA86buPDgejlP+0TIA
	jNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cFXlp32xQw7/OjMn3uGU844211qFMDFeLujMZW6rFtE=;
	b=hWgH+D/sYcb6NyAayLcE79I/EZV5D3LSH6tZgCcLjgTn7TAQ0XdmkCentmFhlzM4LL
	8/yLaRkeZqomFV/HAioB5rNAPnn2Hk4l+FwKk7vu5EZuVuioch1vxvQaGE26b+XPEIYP
	7FteIYs3SNLbbuodOXXTWylC9xeRjcCS8Wx4kmcrQg9Li6DDELW9ssH9EYNzYCmnOpIE
	PmqJPRmsEZ2NiIsTc03tf99JAwikHvvbOq6dbydOmPJlTpEkavTPi8ZQgGcMlCjS352a
	8k/e4ENSPtvFaCAb8cooUez50+ZXbnkmDL8OYAwx2pN1wGnyGc6L0EK7P4ORgWeSPn5K
	bVcA==
X-Gm-Message-State: AOAM530aVhGo7so8m5klURd3EXkO6g/HsmhvNHX1sg+ftU5U4slErpMx
	XIIIl4ACiWhWC9xQhyxjC6eLEOE28iXhBYpnPPltaqoc
X-Google-Smtp-Source: ABdhPJyW12LjVa8kn/B0znyep6GosCNAp/KjjP9BVBaJg4O8d/25oaPhxtDrGS8yhBe02srwIag4mfxCnCj/FF/ECuM=
X-Received: by 2002:a1f:6a82:0:b0:33f:7eeb:5989 with SMTP id
	f124-20020a1f6a82000000b0033f7eeb5989mr17894292vkc.29.1648568654813;
	Tue, 29 Mar 2022 08:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220329070618.GA20396@lst.de>
	<CADGDV=UgjZAbmAN-2bO1nyDvA=XCC9Lf2dxWHZ0BwxF12nnztQ@mail.gmail.com>
	<20220329073254.GA20691@lst.de>
	<CADGDV=U5jwe0CZ12174cMahfD_h-GsBswWaA1VOJbHaC1nsrUw@mail.gmail.com>
	<f9d89282-3a67-ad97-149f-52325e23607c@kernel.dk>
In-Reply-To: <f9d89282-3a67-ad97-149f-52325e23607c@kernel.dk>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Tue, 29 Mar 2022 17:44:03 +0200
Message-ID: <CADGDV=WN2TFR6dO7ZdiQ2ijPjs+7HSsvk0ZCHsHj6ZG5t-oEdA@mail.gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] state of drbd in mainline
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

Jens, my intention is to keep it in-tree, and at some point update it.
Regarding your questions:

[...]

> - Why aren't the drbd maintainers responding to posted patches? They seem
>   to simply be ignored, and I'm left to pickup the trivial ones that look
>   fine to me. In-kernel drbd appears largely unmaintained, and has been for
>   years.

The team here has grown, we are busy. Since you started to pick up the
trivial patches yourself, I thought it is not necessary that I collect them and
send a pull request in merge-window time.

> - Even if out-of-band communication is used for in-kernel users of drbd,
>   that doesn't result in any patches or fixes that should go upstream?

This one:
https://patchwork.kernel.org/project/linux-block/patch/20210426163032.3454129-1-christoph.boehmwalder@linbit.com/
(relevant to users that have DRBD on top of md raid)

> - If there's zero activity for in-kernel drbd, all users are using the
>   out-of-tree version?

There are users of the in-tree version, some with huge fleets.
Some do not need the newer out-of-tree DRBD, and the in-tree version is a
lot easier to compile. You need coccinelle for the out-of-tree version,
and that can already be a hindering barrier for some.

> As far as I can tell, drbd upstream is stone cold dead, and has been for
> years. Why shouldn't it just get removed?

Because there are users.

> Is it just bait to get people to use an out-of-tree version?

No.

> --
> Jens Axboe
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
