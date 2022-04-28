Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DF44C51304E
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Apr 2022 11:49:23 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AD5CC420471;
	Thu, 28 Apr 2022 11:49:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 15BDE4201DC
	for <drbd-dev@lists.linbit.com>; Thu, 28 Apr 2022 11:49:21 +0200 (CEST)
Received: by mail-ed1-f42.google.com with SMTP id a1so4875048edt.3
	for <drbd-dev@lists.linbit.com>; Thu, 28 Apr 2022 02:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=crK7VWKXuiZKV2miTbiFX1T0Lf8/+38gvWV8+diWU04=;
	b=SjCpbYkhcuyXtjBApzXqjm2XkwKcteIxhftiTzCAn7m64aIIFmKxuJhOHpCcIrQxtq
	0VxPOo4AenmdCHqgB5tFgWgnGFoDZh39eEGY8eqdQ0fSCg6Yf2ZHPlDJvafGaGaFP2da
	SU67rCJfqNNaaUp1Hd3fYCL9V0rvPyu88e1M4hJAzp0NzeE+01lQpv4w645zwU8DlH6a
	5/ptA7tVlea5RZ65jsxWFYnYueS5TrDuTfyKSM5OfwH9bkolDOgcCPylsTMFAk2HHD8g
	dqb4KB4Vut2n/EKvuDBE3lHr5Z19zblcgGUMIgzxFst7WHv2QyZc+EicJEDmNBh/0F27
	cYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=crK7VWKXuiZKV2miTbiFX1T0Lf8/+38gvWV8+diWU04=;
	b=KgpXQpkcygRpsxGEcRbmzETHLw6SfKNVW3lx5RnmE8QLjK7uJJgCVmeiloqb4SjNqN
	oSGwj337tBz5+po6t/U/m3TwqQ7dnMLHiQ15MXQoiLvs9e+rMtQbfDZ27uwUvPUs6sYt
	gECpOt2FmVEt70j9LzBZzOJ+Xyx9+Gg9+MTTt5EPKlSoZoApCTgl8mCgx6RQQBGDZ4p2
	alJP5aFPEZlxgJ30Z5HXKRVj10Fbj5VxJ45BGyPaBCPmwJPy4rM6qgWwmZd2C1R5vrTy
	3hrZvNRBnrARidy4TKo+l8t0fRAe4Iy1/mWhbmHTgFUSUd5kn//jsmFsA+qEngAW/FQv
	7AuA==
X-Gm-Message-State: AOAM530DZ2m4bOlVkGIbYFxpAtod80CJ2UHUzWMDi3nlYhSA/diYNf9/
	TwFFFbu9wKgTQwvp7h6ASjNfOGxiDc5WThgnncGOS2d0Oh5iiQ86a8o=
X-Google-Smtp-Source: ABdhPJxzaOL0IENVvEIZuKkCPyw2ciLqPg42Q2lMCr7dQaOLMQEFCAbWCSm3/PEWGUavLPSwIK2q4lWsMy3uQa9AkB4=
X-Received: by 2002:a05:6402:54:b0:419:9b58:e305 with SMTP id
	f20-20020a056402005400b004199b58e305mr34593447edu.158.1651139361528;
	Thu, 28 Apr 2022 02:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220218083713.3645497-1-rui.xu@easystack.cn>
	<CAGNP_+Wmwm7spGK+ba99mVo6us6bu32KHmr1h8sup+LPCQTw9w@mail.gmail.com>
In-Reply-To: <CAGNP_+Wmwm7spGK+ba99mVo6us6bu32KHmr1h8sup+LPCQTw9w@mail.gmail.com>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Thu, 28 Apr 2022 10:49:10 +0100
Message-ID: <CAGNP_+VV3JWfvuReg40ogzUxL3nF0O7=73JMbo4gSMePmxj5NQ@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd:don't increase unacked_cnt when resync
 write error
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

Applied as
https://github.com/LINBIT/drbd/commit/ecd0bd0c884ae7171b62c38b8f2c56a333898bc5

Thanks!
Joel

On Fri, 18 Feb 2022 at 12:32, Joel Colledge <joel.colledge@linbit.com> wrote:
>
> Looks good to me for drbd-9.0. We would have to take care with the
> merge up to the actively maintained branches in order to avoid losing
> the drbd_handle_io_error() call. I suggest we just add the condition
> to the !__test_and_set_bit(__EE_SEND_WRITE_ACK,...) check. The extra
> drbd_set_out_of_sync() call is harmless and it keeps the branches
> similar.
>
> Best regards,
> Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
