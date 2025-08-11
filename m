Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AC2B20B10
	for <lists+drbd-dev@lfdr.de>; Mon, 11 Aug 2025 16:02:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 71B571626D0;
	Mon, 11 Aug 2025 16:01:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6BEAA16064E
	for <drbd-dev@lists.linbit.com>; Mon, 11 Aug 2025 16:01:45 +0200 (CEST)
Received: by mail-pj1-f49.google.com with SMTP id
	98e67ed59e1d1-321a5d6d301so912875a91.3
	for <drbd-dev@lists.linbit.com>; Mon, 11 Aug 2025 07:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1754920904;
	x=1755525704; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=kjBs1p0/NbPjLuntxkjIdS1sRnWoFU1tGonDHNXLht0=;
	b=UUo42N5AE/ZO6Atw3QJpuXxeH/PP/eY49aBfpzMLpPhFa6g4Pa2OshEmGQlLvV2iZD
	s65JBwWMOWZPVIjMkDmfgZ1h7R3dXYuvecApLEx79R0i/g5RDm9JpxUI7glzzMC1i+46
	6jFCt++otoX3Lpkx+KEimh3HJYys7Zx+tThy7VK+wZbQG8Z3xappF6/gd41KKybEtgBx
	i4t53SNwVdOyyQW0J6xgfXgGuklfVsMW1Nutv7yqUtAeNGMvevSzUlL6bUV8L8Ixv8g/
	e6Co4yoPQ2RZ9ENuHZvYdREB7GoumiyLFK8W+3AWnPSrRt3DhTXb8MVg+stVH1lJaGFk
	TSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1754920904; x=1755525704;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=kjBs1p0/NbPjLuntxkjIdS1sRnWoFU1tGonDHNXLht0=;
	b=n8ANs9PtLxzI8QkGeYHwLfDdIeJ7+BV4Tb/zmmIiYd9NnWlUp3EH52+3xiGXTCoZbU
	F3MPUZGWdL8JX/ybRXa6O910jTCHHae0EMokDOmJN6O7dbZj/d7gudb4rpSe6TqByU2d
	OmueIe9T8qndhjk8+MsRdVXTr476ykZKzc6iTbzzfuYJHpyUaHb7k0GyFh5x7cb/4pov
	+q1MUeHA4odi649rwP+lGh1jaWeY7s+0SvwCgpFqtrRTmaNSRrAnAAgAYOf4ToKzkiNr
	zn/tq6zaaxJcmJqurZzqIl0IkrxalczW9XqoXk+sxDbZTZyIUTaDzMzJwY1HTOXhjUEe
	cwvg==
X-Gm-Message-State: AOJu0YyPTo/8zInRb5peI4NrC1qCrt1wZUo8BodbP/hokh65pumbpfoI
	aSbgr051WLTn1VRFuGgkGeshzRdSXM0XZLBKK1qYuyRjl7+NSiuGlldJco6VA+QV0B0=
X-Gm-Gg: ASbGncszNW6on49CLE+4AGZ9MpJnGtUlL9pjInGSebDs04giFd9IhSl/mtM8Pzi9dfZ
	SgmQheJGVwNKQFgjHsTIIHp6tn2chh3uyQ1n5/+yROrFsb/8nhEO+TElHZqM38RAh70kIh/t9fu
	JyLIM7rPorpbp+0Cr3dqBF4WQym9AWIN+3BzRLU54wTjg/bbebCnsxY5IUL2fSmdGApJs2Wq8PR
	FhCwaD+WUW3PhDVdyspxcS+a1EC9lUrZONSxAOGU5pSy5gbk/M1h13BCuiEsl+q9ksCsa/n4NaY
	w78NHXwJv6SoGtiRH6GMGz2MWDEn8+oEjSP05ElD2xhDRNI2NtiS68a4WtQTDmwwPEusI6xYvb9
	EWBUsvqJs43YmEtg=
X-Google-Smtp-Source: AGHT+IEG+EPunzjJanJtxibmBqQfuE/BD/BPsLCfQHcWyKgSOYhhNJuA2U7Xhq6QKFdDKZa7AnFtAQ==
X-Received: by 2002:a17:90b:2544:b0:31f:42e8:a899 with SMTP id
	98e67ed59e1d1-32183a0132emr17806156a91.13.1754920903742; 
	Mon, 11 Aug 2025 07:01:43 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	98e67ed59e1d1-32161259a48sm14821216a91.18.2025.08.11.07.01.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Aug 2025 07:01:43 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20250605103852.23029-1-christoph.boehmwalder@linbit.com>
References: <20250605103852.23029-1-christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH] drbd: Remove the open-coded page pool
Message-Id: <175492090268.697940.16894165700096915187.b4-ty@kernel.dk>
Date: Mon, 11 Aug 2025 08:01:42 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3-dev-2ce6c
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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


On Thu, 05 Jun 2025 12:38:52 +0200, Christoph Böhmwalder wrote:
> If the network stack keeps a reference for too long, DRBD keeps
> references on a higher number of pages as a consequence.
> 
> Fix all that by no longer relying on page reference counts dropping to
> an expected value. Instead, DRBD gives up its reference and lets the
> system handle everything else. While at it, remove the open-coded
> custom page pool mechanism and use the page_pool included in the
> kernel.
> 
> [...]

Applied, thanks!

[1/1] drbd: Remove the open-coded page pool
      commit: d5dd409812eca084e68208926bb629c8f708651f

Best regards,
-- 
Jens Axboe



