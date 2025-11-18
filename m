Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4622FC6A59B
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Nov 2025 16:39:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 76B73162785;
	Tue, 18 Nov 2025 16:38:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com
	[209.85.166.176])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 39056160923
	for <drbd-dev@lists.linbit.com>; Tue, 18 Nov 2025 16:38:44 +0100 (CET)
Received: by mail-il1-f176.google.com with SMTP id
	e9e14a558f8ab-43377ee4825so28110305ab.2
	for <drbd-dev@lists.linbit.com>; Tue, 18 Nov 2025 07:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1763480323;
	x=1764085123; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=m4AZ1H1F7o4dF87ZOWmvmXAUCUSSC9J0kROior/lM3M=;
	b=FhapTB5VBWhwtEaICvyiIlKzm/dj0Gtb5UQIBF1yAwTuBbusDlH3h4C+d9XpJ3u3C6
	/255Nd2GvKkwvXUkKjgqOiyDxiMLdchzEumFCLcmddx249lR/gn5xdmnP1c9N0SWknoR
	tCanM4HjxTc/qQ2BgaAXJLBptLcrSCby75FzmL/S+QQzID21ArwG4NT8e0bnXpEpqKKc
	L2g2dQcYyku8twVQijaYWIEeDJANWSMedUgpYn88YVuuIApE5E4KFGpoCyURt65aZw/X
	rsJ1gNxnjsx2aNstqENGZcODh8EkwnUpGHQw4lPEV87gd46ltqoYyzJGTK6izruTKG5p
	Vvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1763480323; x=1764085123;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=m4AZ1H1F7o4dF87ZOWmvmXAUCUSSC9J0kROior/lM3M=;
	b=GcLM+0JHY9A/Bj10wKvEcX8lCJ8qI+BJPgx+lFwyW1nECA3mH1yDQMF2F1fFx+wtGz
	oxM+ZZ2QOOgymdh8EJenr+PyrVu1SVwg60HhJ9vAvOwBQHVUrG2V3HHEqgD0XQsKI/wg
	W9lhcwaar1XtpQNinTUdfyuFogS0nmasMSUcd7t7rollLQlP9c3l+nXmaxqCRHMTMdm1
	3yURAnMHCG8bDjZcj8aUPNAel66LQCrFRU7y6rTJf0QeXqkuN8pK6v7nx0/FXu6dmOL5
	T7QJskAkbLxml1bILsRp84Qg8a9YAjPTiwOmherLaeGvGVBS6Ku6olrR7yrjdPu3MGpQ
	h2Zw==
X-Forwarded-Encrypted: i=1;
	AJvYcCXecHBSpNp8mEd7KlDbc0PXI2KtN/m0vy/ACPtVxh9Xa4UtkMqveBflXzUp+c6/SQejA3Fr458xHA==@lists.linbit.com
X-Gm-Message-State: AOJu0YxE9P72dtnhPdF8cZIgNpfOsNRICBH5+BFN5wWnD/Fl32e3K0yY
	gIXl411USSOZ7HESErpBgqTWUjb3o4Ge+BE+AV4WsJhJ4P86Ed+Qmf8dkece13bii4Q=
X-Gm-Gg: ASbGncuM1UxUK29eg9u9o54Zsg3n6jhN7ALT3A33FHbwWYiLMwIWuoriDVUekD2Y7jK
	pwXrTyTxEoi52NSBGpBBiPa0tShWsNdF6KWIVKg6Yz0fZnZRtvTZFmpzCJGP9MZI8qipfxz6odO
	lv/pbUfF7NeIWyEmCB79A+GNLL2Vs70SSsIruvXKE9gZ0ENEY0YJYj3r41E1QcUCdMPvv8e7yuB
	5sQAyfXw5Joa0tP59pyTsyDh58fuG+39CG3mosPEVtl7pAdTS8BFpne0HeHUAP7Hin4E3q8MOdS
	5O46hGyKIwJV12Jik2ZgvIRfwNYkH/XAYrUQCDTN31rrvqbC4MWBlAUUcSYIuft2/chF8fnKN2V
	xLQf5q23YWwm8P31uDuVdGJWlTwzwDbd7L0fSTCMsEJrHJbEnNzrX057DXj0QHhyd0CVQ
X-Google-Smtp-Source: AGHT+IGOAjl+lk3/PXczazt18iN7tgLDRPZ9uWyfZPv0T2taK+010OdOmJFclvk8hgGche1I/bPH0Q==
X-Received: by 2002:a05:6e02:148d:b0:434:96ea:ff5a with SMTP id
	e9e14a558f8ab-43496eb0099mr158039065ab.35.1763480323213; 
	Tue, 18 Nov 2025 07:38:43 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	e9e14a558f8ab-434833e94f1sm83498515ab.10.2025.11.18.07.38.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Nov 2025 07:38:42 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, 
	=?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	drbd-dev@lists.linbit.com, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sukrut Heroorkar <hsukrut3@gmail.com>
In-Reply-To: <20251118090753.390818-1-hsukrut3@gmail.com>
References: <20251118090753.390818-1-hsukrut3@gmail.com>
Subject: Re: [PATCH] drbd: turn bitmap I/O comments into regular block comments
Message-Id: <176348032225.300553.3972505243693659876.b4-ty@kernel.dk>
Date: Tue, 18 Nov 2025 08:38:42 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
Cc: shuah@kernel.org, david.hunter.linux@gmail.com
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


On Tue, 18 Nov 2025 14:37:53 +0530, Sukrut Heroorkar wrote:
> W=1 build warns because the bitmap I/O comments use '/**', which
> marks them as kernel-doc comments even though these functions do not
> document an external API.
> 
> Convert these comments to regular block comments so kernel-doc no
> longer parses them.
> 
> [...]

Applied, thanks!

[1/1] drbd: turn bitmap I/O comments into regular block comments
      commit: 2c6d792d4b7676e2b340df05425330452fee1f40

Best regards,
-- 
Jens Axboe



