Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NjDLrIql2nmvQIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Feb 2026 16:22:26 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 59E17160107
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Feb 2026 16:22:26 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 50248162766;
	Thu, 19 Feb 2026 16:22:25 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
	[209.85.160.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 715F216087D
	for <drbd-dev@lists.linbit.com>; Thu, 19 Feb 2026 16:22:21 +0100 (CET)
Received: by mail-oa1-f46.google.com with SMTP id
	586e51a60fabf-413c2977db8so635850fac.3
	for <drbd-dev@lists.linbit.com>; Thu, 19 Feb 2026 07:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1771514540;
	x=1772119340; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=NEw6ziLtIMYeEr1+4vym/6HQDO9fW9fuHMCrppee5HU=;
	b=kb5cBjaLs6EEdVIsRg87rQpAR0r9ePMXOlAEwJSRpU2FrqHasMIyHoV00aSq6WIsQ1
	6yjbR3j6SEs5caG9xZZGa5ek/57uTGBVec74myNZq15SVDuiuMrIzBO2aXHMZ50qzOG7
	3zQ6ahdBJn5VsQ2AOdPV8QT6qBqtRqrBxJ0jjIEvM9xdqVvzZVQohKMv4Sug3Bb231e4
	szZBNanwy8lfOD9OfMEJo0Gphdfe5b/d/6chtS+cyqW73YeZmsTB1TMOhdRb/7GcDY/Y
	pVRNaYZrkK/8f1II9qmzDPWmNzBRc/VkvrqW8z7Aqjqv1lu7PqrtQ4RVWJTn5WGjnRdq
	POFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1771514540; x=1772119340;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=NEw6ziLtIMYeEr1+4vym/6HQDO9fW9fuHMCrppee5HU=;
	b=atSc9T8GqqKhKCWoCwc4fjekPXluxsoftGZUA2LtZ+eWvvyzeRQbjQc8KEo9Tp91cv
	fmGZ3+xmVnKonpIcGtG6cvBqYifaCWyY79fG/P1XZ2nI7k6+dWHvVEZlY2VuV5FGHbAK
	q7g/gi4fU8Jy4AfH4hcaknIb2qHLOaHojNPMo9crnuMpqjhRJuulcR5go76CLRLiWVYL
	qJ821vCpApI/yq+cyUFE19AVNA8Q7UBcVc17xyu3e/kRnK8d15YomGpfm+4RgovzgSYY
	E3BRF/WXJaNzgnmtC3jH9NREcZgPly+re0oOIiR9LPFhrJnEEYIEF7qIomcxPVVXlHu+
	G6zw==
X-Forwarded-Encrypted: i=1;
	AJvYcCW2ZyX3hNt39V7vpr/Elf6dDp062u4bw3Q6ezS70yzXOt2zWsxuwj2/ubFyCmW4hmR5Oq2LCYkXtA==@lists.linbit.com
X-Gm-Message-State: AOJu0Yw2qFUFkeq6LQs9LyWiPJXWPJ2M2gXLL3oyFhD3sr0uJn9tVfJX
	Uq1NUoxrTw4uLJhcZ/NelcjXxOmJVG8cpP4clJhyBmKTS4ncn4b/6MRWqbrSRoynTGQ=
X-Gm-Gg: AZuq6aINGX39CaLZz5sa4a5u8uu2bgvJBwh9m5X/IaGRGxqhM6RlRrbYO2+ZoBSOdsv
	RSGn6MEz1EDVqKHhW/eigOAt17fWOjOjNUcp77Id9GwVmnAnPvYBlXn88JhwPBuZe5p3+SlAotS
	siTMt6H05YbZPthU496cU49nmdwr/8mtpguvw4Ytj2I82lBQ+CsXc1jQgxLkSySniA+na5zjN8c
	rnKY8G7ZlVsmLVZ+NBFhW1GPZuKFRq72GOgfHxF6Movalr2QZEY/nxCAIx7t0xaeGRfR2FQxTwP
	IwiW8Uxd8lPDd5a50WPANf0X3TXa15uqa9aeQFsJIm9ME7qe8CpQTiFnDiPM3Kpj2eg1fnA6Dha
	EtRK+vO8jJyjNmGU2MBTsg1az9+AOCXFgFI3LAKtSrBpCLhTlX9eVqRw3M2I4SOLtYvXmtH9vwb
	EffS6rMTrTi0ApCUIqZDviuZV2UkKL2lmmCK2gnENypXvsiygatmvhhOA0ufJFrUXY9SEROSxZN
	IpQFA==
X-Received: by 2002:a05:6820:151b:b0:679:a6d0:e99b with SMTP id
	006d021491bc7-679aef36b53mr1781676eaf.70.1771514540481; 
	Thu, 19 Feb 2026 07:22:20 -0800 (PST)
Received: from [127.0.0.1] ([187.199.77.89]) by smtp.gmail.com with ESMTPSA id
	006d021491bc7-679aebf54f1sm1954014eaf.5.2026.02.19.07.22.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Feb 2026 07:22:19 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260219142012.97756-1-christoph.boehmwalder@linbit.com>
References: <20260219142012.97756-1-christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH] drbd: fix "LOGIC BUG" in drbd_al_begin_io_nonblock()
Message-Id: <177151453921.556009.15485390943324050309.b4-ty@kernel.dk>
Date: Thu, 19 Feb 2026 08:22:19 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
Cc: Lars Ellenberg <lars@linbit.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[kernel-dk.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[kernel.dk];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:lars@linbit.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[kernel-dk.20230601.gappssmtp.com:-];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.929];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,kernel.dk:mid]
X-Rspamd-Queue-Id: 59E17160107
X-Rspamd-Action: no action


On Thu, 19 Feb 2026 15:20:12 +0100, Christoph Böhmwalder wrote:
> Even though we check that we "should" be able to do lc_get_cumulative()
> while holding the device->al_lock spinlock, it may still fail,
> if some other code path decided to do lc_try_lock() with bad timing.
> 
> If that happened, we logged "LOGIC BUG for enr=...",
> but still did not return an error.
> 
> [...]

Applied, thanks!

[1/1] drbd: fix "LOGIC BUG" in drbd_al_begin_io_nonblock()
      commit: ab140365fb62c0bdab22b2f516aff563b2559e3b

Best regards,
-- 
Jens Axboe



