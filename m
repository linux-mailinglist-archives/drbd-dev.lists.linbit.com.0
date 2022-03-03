Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E69534CC3C0
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 18:30:26 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DD42C421788;
	Thu,  3 Mar 2022 18:30:25 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5EA60420060
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 18:30:24 +0100 (CET)
Received: by mail-pj1-f45.google.com with SMTP id v4so5130802pjh.2
	for <drbd-dev@lists.linbit.com>; Thu, 03 Mar 2022 09:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=DcEbjshQgySqBtgjSy1+OKZZY+Sd4vwdSaGKmyFWkJc=;
	b=WXwaDnsb8HID0Spn/or2l4ztUrO48fYiMPvuk7fTqUXl/yka5P7ohbzzf9cV2hAAcT
	r1Ypw8qIhmRcd2a+FB8l7hWmXj40wnAXgYQM4XpXpshGuHGMeX3DeqDW/6p7225yy49n
	oLrlZSGoTL9KMnG5YbYVn3+WnRo/G43JH3rp4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=DcEbjshQgySqBtgjSy1+OKZZY+Sd4vwdSaGKmyFWkJc=;
	b=AEgY5fJ+8xc/lwvUYqgzcyDMyLapTqjIgkvzY0EnbDZVseo9Bx6VJAKh+HasOUtro/
	4UZdQgyDR0VEvE0FyIIEUuHcwUbbxo2b6jqUb05j/g1AWMlexRyaI3YNdKKtgcDKVBl6
	YNIBKcrQ9BqWFHVV+A9fajpJ7xiQ/OxvDPjgpuy8YiOI1KvFLUTfq9ew4Kc8H6L8Ox6N
	fj+89JdKclgmo7wmwXW2T3gPpkgDa2xIwzmEkKtwL0B1iwekMb3l01yrn/UyEZ9DVFdh
	esC0YuIQ7IJ93XzmI7b7kEFO0QrKRN1Ie0A9MHvC2qXpDLgQDGmaC9ESKKuGpV9icLUV
	k8nA==
X-Gm-Message-State: AOAM531LmDLPU/viA1kbyIBdmeVApez/bFiNkjcH5jBYG+kRMGjggK8f
	3iWi9KePrHS/SMJvO3ObjC09NQ==
X-Google-Smtp-Source: ABdhPJxqUAgcm+o53nFPmMt3Xzp/nP5eJagrImosmirB4O8e0hyGXPiQ0MlWzoISBvak+MEryFoZ3A==
X-Received: by 2002:a17:902:cf05:b0:14d:5249:3b1f with SMTP id
	i5-20020a170902cf0500b0014d52493b1fmr37147754plg.135.1646328563239;
	Thu, 03 Mar 2022 09:29:23 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	l17-20020a056a0016d100b004c34686e322sm3292114pfc.182.2022.03.03.09.29.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Mar 2022 09:29:22 -0800 (PST)
Date: Thu, 3 Mar 2022 09:29:22 -0800
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202203030929.BF0DE2B4@keescook>
References: <20220303113223.326220-1-hch@lst.de>
	<20220303113223.326220-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220303113223.326220-6-hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 5/5] loadpin: stop using bdevname
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

On Thu, Mar 03, 2022 at 02:32:23PM +0300, Christoph Hellwig wrote:
> Use the %pg format specifier to save on stack consuption and code size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
