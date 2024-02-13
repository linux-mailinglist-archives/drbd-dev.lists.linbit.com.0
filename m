Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 163D285355A
	for <lists+drbd-dev@lfdr.de>; Tue, 13 Feb 2024 16:56:09 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E3B3B4203BF;
	Tue, 13 Feb 2024 16:56:05 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 94062420230
	for <drbd-dev@lists.linbit.com>; Tue, 13 Feb 2024 16:56:00 +0100 (CET)
Received: by mail-io1-f51.google.com with SMTP id
	ca18e2360f4ac-7bff2f6080aso19520339f.1
	for <drbd-dev@lists.linbit.com>; Tue, 13 Feb 2024 07:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1707839759;
	x=1708444559; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=ZPsZ61/B147XeUCItHAVNy9atLHaMQ7vWuQvVfNBe/E=;
	b=s6+TY3wZGJgIT9E0tb0fI3hpj1oAJ0ZPjCHtIKNoG86u+b5ZRylSOAXvRq5t3NywZV
	yBXwM2VsnTDybjXe63f/274z9K5Z00T3Mvt62ZKFx8knK9Tl1/WsB8gd64n6LwrzF95p
	VO+F+hrsJf997Vcjuh50f8kCdrzlJqO7nxuM6xy5dSBI4/xHmxkAG5iwcTfjaBvTNYYR
	rygfxjAq7Lj7pL1x5f0A2pmEuUrxEl3FFnOt3vtotVuZcMuTvaRMKm21MHZdWoI4e6aU
	TA11ylViuH0OEqMPp0kLhwndg48nlV6tXdH+SitQvxLNXmkmc7a2q+ThEIJG6FVZMQq7
	surw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1707839759; x=1708444559;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=ZPsZ61/B147XeUCItHAVNy9atLHaMQ7vWuQvVfNBe/E=;
	b=LWT6n12VetbnnJgoD1IZ6rtA1lwvSj0CeezD6oQhJXbtQ6ao5Rrik8vsmQlSKiN3yZ
	DaMVvHZC+3tbM6WB8rWh7pIGx7YKnRYnCm1z9QKZrUf3FGVBNSi+4F6I0E+qAcaRCvNN
	scUSz+lSPpY9b8Lu4TQU9fL6IyfAf5kqdV7xES9E4tknytpq8sp87Wmh+ivVjd/b6bDz
	N5fwtbBu5LVZxstJwX4r4MpkOdxtw0ixFkqFBDQHhMo1Wa4qEeMEQNU0cBFCGK1qDDk6
	A0Hca++exo5Tz+hUo/tZ2+3YcaMXKHsXU0huGUlbRmNcwHCcYIA9TM4/JY6icN37/7z8
	SBtw==
X-Forwarded-Encrypted: i=1;
	AJvYcCVzgBbjnb5N2nxBwe2NY73VowzlFPPRUXXFMzBIiS9DmUNEidwWXpR1ybziVt7YwHbLvNlsv9JDVLreg1O9752vTze68W/JDYkX
X-Gm-Message-State: AOJu0YxQspYSQtZ2+h7jjahpCelwobBxidIatiAoQt4MalmzbjaXT1bl
	E2E80mMNoYaQGUMgazwQuXELaXAvebszSDLHFvMiTsYjzsh5rxpHFBCZuLQgcxY=
X-Google-Smtp-Source: AGHT+IEslLXJyHXnsj51AumuBlOy6N0oP+uPR/PHnApNPg2IYUR26OYsdB25n355+SMmGoWI5yZEXQ==
X-Received: by 2002:a5e:9411:0:b0:7c4:4f32:8311 with SMTP id
	q17-20020a5e9411000000b007c44f328311mr44941ioj.2.1707839759646; 
	Tue, 13 Feb 2024 07:55:59 -0800 (PST)
X-Forwarded-Encrypted: i=1;
	AJvYcCU/S1UrM7pG0AjHa4py/2k7FGa1SDtErFeE4Lc7xt6L3BDoPYiSiEH8JVbfCLyHDMUwZX01txjBWgNqXC64Iu9aqLcJfFHHI7xpcYPORy8iC7EDl3VY+S2Lqywgj5yDCpGsRu4GV7OnCVgiqP9bcCOe2UmDctiD76nULVMnih/Uyj4QlWnvDk4EaMDWm+8H1/wOI4CnL6t24O5IYvTiykt8dQDIoaeH/C1J/feEnXtVKKsf+hM8qmhcEDs75hQS5J7jN3WCoqYt5uj7vFEN7/vCqXoOPJeBr4p3P/O9L80ITraOIB60kfgD9qqndGwK0Be6h0BLEFUHkBAXfmTLwCMyaUVOBCOzfyoSf11lrQjKfQRRk35dCwwSpqWKrhBynySDIqvRLcY2MDTlZemxzBVCcssGSPxAEBpgZovxz9kqglYJ47RCIK1NgDeiWXAa1FY=
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	ay31-20020a056638411f00b00473ca57bfefsm403153jab.124.2024.02.13.07.55.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 13 Feb 2024 07:55:58 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, 
	=?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20240213100354.457128-1-arnd@kernel.org>
References: <20240213100354.457128-1-arnd@kernel.org>
Subject: Re: [PATCH] drbd: fix function cast warnings in state machine
Message-Id: <170783975824.2331975.17734171438051214868.b4-ty@kernel.dk>
Date: Tue, 13 Feb 2024 08:55:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd
Cc: linux-block@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	"Uladzislau Rezki \(Sony\)" <urezki@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com


On Tue, 13 Feb 2024 11:03:01 +0100, Arnd Bergmann wrote:
> There are four state machines in drbd that use a common infrastructure, with
> a cast to an incompatible function type in REMEMBER_STATE_CHANGE that clang-16
> now warns about:
> 
> drivers/block/drbd/drbd_state.c:1632:3: error: cast from 'int (*)(struct sk_buff *, unsigned int, struct drbd_resource_state_change *, enum drbd_notification_type)' to 'typeof (last_func)' (aka 'int (*)(struct sk_buff *, unsigned int, void *, enum drbd_notification_type)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>  1632 |                 REMEMBER_STATE_CHANGE(notify_resource_state_change,
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1633 |                                       resource_state_change, NOTIFY_CHANGE);
>       |                                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/block/drbd/drbd_state.c:1619:17: note: expanded from macro 'REMEMBER_STATE_CHANGE'
>  1619 |            last_func = (typeof(last_func))func; \
>       |                        ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/block/drbd/drbd_state.c:1641:4: error: cast from 'int (*)(struct sk_buff *, unsigned int, struct drbd_connection_state_change *, enum drbd_notification_type)' to 'typeof (last_func)' (aka 'int (*)(struct sk_buff *, unsigned int, void *, enum drbd_notification_type)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>  1641 |                         REMEMBER_STATE_CHANGE(notify_connection_state_change,
>       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1642 |                                               connection_state_change, NOTIFY_CHANGE);
>       |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] drbd: fix function cast warnings in state machine
      commit: fe0b1e9a73d60f01fdc391925be74e823af7c91d

Best regards,
-- 
Jens Axboe



