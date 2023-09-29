Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D86D7B3A8E
	for <lists+drbd-dev@lfdr.de>; Fri, 29 Sep 2023 21:21:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ACE61420372;
	Fri, 29 Sep 2023 21:21:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C9EE4201A1
	for <drbd-dev@lists.linbit.com>; Fri, 29 Sep 2023 21:21:18 +0200 (CEST)
Received: by mail-pl1-f182.google.com with SMTP id
	d9443c01a7336-1c5c91bec75so110733715ad.3
	for <drbd-dev@lists.linbit.com>; Fri, 29 Sep 2023 12:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chromium.org; s=google; t=1696015278; x=1696620078;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=E+9SXcyvjGd+Gta4/O6IN/DD1n96uskx63gniN4z8Ko=;
	b=mzxOM4IkFKQU/Dr1aXJh/z4VwON/nEl1I82Qa4ym6kQhJNOeHuMeIQCt21fbRhP1C8
	5y1fp36Hgdmv+lcu5GpQ13cCk0uRZS4XvJzT24AArOGNBRsYd5vD3yCJL5yOq2A8QUsI
	6wpOBZmHyQoPZ5kEJOU9u97O9/xZMSg/F14Ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1696015278; x=1696620078;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=E+9SXcyvjGd+Gta4/O6IN/DD1n96uskx63gniN4z8Ko=;
	b=KoK+xuDouM5rgaOvjqBFgHgD9mVB3RbfghExAkePqo/FiiuCvd2e4rX/CpJV7zzW2+
	XYFObMAelA3U6mR/rYNks1vYlktWsDMOfv8yV6hFUMJ2tg+NVh0W4fdxNosyrgeDAeXs
	e9FjBMzZ01VFYlj96y2DKRDAVnuU//d+eB899W+PlYHSTJuyL9E/nlWALdT1RINrz2hI
	2FZRM0IOBKYH2zVBFTMBk30qG4hSTMe1wLoDJ8k7z6Z/yePfXgQTCjzq2YXmOotpmJra
	irlKHUacfZIfAZwoT7Xmyi6lxY6+GcLkUx9/eMGQwhhFUdr1XXtrpFpmP4rxbBojhYk5
	DUPA==
X-Gm-Message-State: AOJu0YyFC+KGJaxhyt+A8cJ3rHMlBlq6FuiUZsBQ4vVj3skzo4zMRHEO
	7xHo/kErlBzIfEMVxdT0MrllWg==
X-Google-Smtp-Source: AGHT+IEL4QFJkNtYGTd3LQFr4m9MDVzMcU8D/M+Brl5u7rqE/vHdG8ltVoVEVCzLGwOap+25wTol5Q==
X-Received: by 2002:a17:902:bc4a:b0:1c4:486f:5939 with SMTP id
	t10-20020a170902bc4a00b001c4486f5939mr3964184plz.3.1696015278078;
	Fri, 29 Sep 2023 12:21:18 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net.
	[198.0.35.241]) by smtp.gmail.com with ESMTPSA id
	l13-20020a170902f68d00b001b54d064a4bsm17218730plg.259.2023.09.29.12.21.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 Sep 2023 12:21:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Kees Cook <keescook@chromium.org>
Date: Fri, 29 Sep 2023 12:21:08 -0700
Message-Id: <169601526972.3013632.16591134753215081850.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915200316.never.707-kees@kernel.org>
References: <20230915200316.never.707-kees@kernel.org>
MIME-Version: 1.0
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: Annotate struct fifo_buffer with
	__counted_by
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

On Fri, 15 Sep 2023 13:03:16 -0700, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct fifo_buffer.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] drbd: Annotate struct fifo_buffer with __counted_by
      https://git.kernel.org/kees/c/f246956ca8f3

Take care,

-- 
Kees Cook

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
