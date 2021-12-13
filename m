Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF14473895
	for <lists+drbd-dev@lfdr.de>; Tue, 14 Dec 2021 00:31:55 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 61F7A4205FC;
	Tue, 14 Dec 2021 00:31:54 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8B22B4203DB
	for <drbd-dev@lists.linbit.com>; Tue, 14 Dec 2021 00:31:52 +0100 (CET)
Received: by mail-io1-f48.google.com with SMTP id p65so21060430iof.3
	for <drbd-dev@lists.linbit.com>; Mon, 13 Dec 2021 15:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:in-reply-to:references:subject:message-id:date
	:mime-version:content-transfer-encoding;
	bh=uiBzuM8r8ioHjMgApkzDHqgZYcstJX42l7Bsr3gpsPQ=;
	b=t5KKyEzSTtUdvvCmw8pHFWdxwwHEeHi16sMm9QZiOaro0uLwYZlgCOp7jr9Isys+M7
	5ppSfIhgO3I4V3FnrCcUhWUKUi3hta2TwJUoVWi5U9vMg8mYyhKXR2oJWeYCGzWLxl0m
	OyeX+DDiKPvV5Ty4Ax5UUv2RyIlC8B5JYtaLeef7oML7UPzpdZ5g7nvBA9hu8lrJ5b2f
	RSnpQJE4fYH7BEnjZp7t8cqXoPdJnHtediabkFbNzH//g56ewQBxdqMtjMIOxbFkGgZ/
	8MDwE0uHmsU9r9EzVDJunsXbPCOWMMmluNJfCEjVEEzJ7bnFymFDSG3CyKZAsfZ1K+bE
	bnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
	:message-id:date:mime-version:content-transfer-encoding;
	bh=uiBzuM8r8ioHjMgApkzDHqgZYcstJX42l7Bsr3gpsPQ=;
	b=rLNbYuV6RxzF+2xstFc+3E+1tgyLGXz3ON1pydMI8W7MceF+Cb2o/BlmFpIyduE9Uv
	H3LcCXwhehke1H+I9Ytn62HEu1Ae9d037S91KEA6yfdsVTPsDZzJrBxjrVJcZmAVJJaB
	CC6c68u52cADsSiXKaEnxVsmTKrYsAMYYfXDRi6sz73/LFmpNvzMyiOaYIn8vGjsUvYj
	XKc/Jgmb/YFMQgwYHkBv9JR8x7FMCybiHfVxGFnf/UoER7z//vpMMnd3bImhzWJrgHxq
	0BeeMp2tkunI7rQ/WTSIqGGF1ETi2IbBuCP/bGY9yh46WIHNsG1c2F/gQGSReV3LuoIf
	ZFyA==
X-Gm-Message-State: AOAM533GHj3JmUp26V8nE3o35SbAuNyNAeoMU96XEZbFg1CILITwuTPO
	Gh4hE/rs21AIsaLHkM2phSE4/UxPZSQrNg==
X-Google-Smtp-Source: ABdhPJwZdCxAZbnRirMUyxwq3+dXPLxT+7soIgG+IIckJWFuR/FnyAlx+UYW7BSeafbgjw5za/3bgA==
X-Received: by 2002:a6b:7e44:: with SMTP id k4mr1203769ioq.103.1639438311104; 
	Mon, 13 Dec 2021 15:31:51 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
	by smtp.gmail.com with ESMTPSA id
	d17sm7780949ilc.79.2021.12.13.15.31.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Dec 2021 15:31:50 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Kees Cook <keescook@chromium.org>
In-Reply-To: <20211118203712.1288866-1-keescook@chromium.org>
References: <20211118203712.1288866-1-keescook@chromium.org>
Message-Id: <163943830994.160816.6815884532342154175.b4-ty@kernel.dk>
Date: Mon, 13 Dec 2021 16:31:49 -0700
MIME-Version: 1.0
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: Use struct_group() to zero algs
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

On Thu, 18 Nov 2021 12:37:12 -0800, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memset(), avoid intentionally writing across
> neighboring fields.
> 
> Add a struct_group() for the algs so that memset() can correctly reason
> about the size.
> 
> [...]

Applied, thanks!

[1/1] drbd: Use struct_group() to zero algs
      commit: 52a0cab35c568f896067641d8e07f798341954f5

Best regards,
-- 
Jens Axboe


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
