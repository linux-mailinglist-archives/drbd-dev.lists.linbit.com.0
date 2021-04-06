Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6637B3562E7
	for <lists+drbd-dev@lfdr.de>; Wed,  7 Apr 2021 07:12:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A7A5420631;
	Wed,  7 Apr 2021 07:12:54 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 417FA4205C4
	for <drbd-dev@lists.linbit.com>; Tue,  6 Apr 2021 23:00:36 +0200 (CEST)
Received: by mail-pg1-f176.google.com with SMTP id w10so5814098pgh.5
	for <drbd-dev@lists.linbit.com>; Tue, 06 Apr 2021 14:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=fQLaQc5/GaCbi7FW0HmczstHI38aj6TzWQieMfsdo/Q=;
	b=ZX4eYkpr7+VTllCHm8SBVsK8c9F4iAO6AtLmDQsa0vHfdpYyVCMVgjpRaPyLnn/jLL
	2kCuRCMN4YkYTIfIXg7c48NtN0vSmfQfldD/NTsy4ia1F0Yjr8re7p+vAt66raTmNfxa
	CWm8nDjXX0Ul4Z1q/7wX1fMqvNNcCjPtxUjcuGtf8MHrMB5/TrulTfQc4oxfR5Jx84bU
	xtoigrGoRyR4CGwIilnl39gsNq5h0i2TiV585ud2ljo3CmSzK6S2pYHZlPKNJFkj2MsQ
	+uLj6b8H+ObBIcbAeDB5+I1oLZ6UH0DhLAIh6JjqV4Ro5pZ2tPjQqjNpt5/74k5HPV87
	5Liw==
X-Gm-Message-State: AOAM531aPsDYwimSTgi7cyPhSap3IStEjQf2+Rvx3InHxZpcpVPoDKN4
	/qtDMGNTrmg4in9gRUrjeTw=
X-Google-Smtp-Source: ABdhPJxzMprke+6saz2YcivdY4CO3En9U55zbwbKUELZtPC7/SZJGMbYevQneaoHZfD1eIOxr67tJQ==
X-Received: by 2002:a63:5458:: with SMTP id e24mr81330pgm.170.1617742836057;
	Tue, 06 Apr 2021 14:00:36 -0700 (PDT)
Received: from ?IPv6:2601:647:4000:d7:277d:764e:de23:a2e8?
	([2601:647:4000:d7:277d:764e:de23:a2e8])
	by smtp.gmail.com with ESMTPSA id
	w2sm14367882pfb.174.2021.04.06.14.00.34
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 06 Apr 2021 14:00:35 -0700 (PDT)
To: Lee Jones <lee.jones@linaro.org>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
	<20210312105530.2219008-3-lee.jones@linaro.org>
From: Bart Van Assche <bvanassche@acm.org>
Message-ID: <ed6f1b85-ba63-52fd-16f2-cd8777c3fdd0@acm.org>
Date: Tue, 6 Apr 2021 14:00:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210312105530.2219008-3-lee.jones@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 07 Apr 2021 07:12:53 +0200
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 02/11] block: drbd: drbd_interval: Demote
 some kernel-doc abuses and fix another header
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

On 3/12/21 2:55 AM, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> [ ... ]

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
