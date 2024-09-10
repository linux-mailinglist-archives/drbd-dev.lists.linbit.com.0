Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B170972694
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Sep 2024 03:21:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3148842090B;
	Tue, 10 Sep 2024 03:21:40 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 85C3F420239
	for <drbd-dev@lists.linbit.com>; Tue, 10 Sep 2024 03:21:34 +0200 (CEST)
Received: by mail-pl1-f172.google.com with SMTP id
	d9443c01a7336-2054e22ce3fso1932205ad.2
	for <drbd-dev@lists.linbit.com>; Mon, 09 Sep 2024 18:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1725931294;
	x=1726536094; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=FbHezFl/yia2I+g8JEPGnuA0HdRe8qPShzuc/dAam7o=;
	b=sTDCwkqjyoGDgwnrivUUi4JkY4rUx3QOJUN2YtLN9jHGbMnlT6ckQM2dbsZZhLPjTr
	TyP7sx91FRUe5bxa9MaJ1ZWnz97CuvICAoVLVChDXTxpcwDnSAyw144UxdCOZx2EvWRs
	pOIIOhmltBRUZdxBB5obynxdBtnRfFptn+6VJ0m2EL0dIs+7NLMuxh00mTnO2eselgrH
	3alGE7poNkOtNvuzR3LvSY0O4LQD9t10tg42Ft0ObUUeMwOB7RNJ+OeUcOhZTIG/AdaA
	IULyS4QIpcoVQivspXc9XHklLTMe6sXokpKuEIwXCVIJFZ20t/8rNi9J7/QPv4etVNZO
	5xhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1725931294; x=1726536094;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=FbHezFl/yia2I+g8JEPGnuA0HdRe8qPShzuc/dAam7o=;
	b=h9EVfVOqTtkZaJdyTpj9KefdqtAyx2SDVycD561pGC0qq39WuFZZcOtAu44vkNX95r
	4pWIvjZPGSMCV4+a+kpj8AShPIz400N+l4I/WK1JMjcuc2AB5uP5Kw7SPSTssArhx6w9
	atV8ebj2q6NnyDeTw1lWKF/0MK5PZG7fvtCt2ajowQejNQVCgTCX/93iMNzIh0n4AUFI
	185Xh59YorwwMeIUEnuku+XAhWAmEESZDdfsWFpdc/6VU0XhJDbtmwP5OU879v0X82va
	b/DTRK075UcTjT+qGaMd20F/L2EsKfPgMULDYrLcSN+MvymfrKTN47ikr9hPMSJ0HcC2
	NQlg==
X-Forwarded-Encrypted: i=1;
	AJvYcCV+Gl3wGcTPf7A+du8lmrEO0ZxERGyXvnl4VHtS29/6EJGJEmpmD6Lj/WL3IkAVApv+T5GKO51phg==@lists.linbit.com
X-Gm-Message-State: AOJu0YxBqVM5D1oWB7nR6MmsCbLPPsf1paYpzYu8fPzmoed2sgKhpAHo
	mViapOlmhd/odaySFRrM2cjH7A1zuzA0it1GD17oP9GqKLoba1oARp8OokkUV14=
X-Google-Smtp-Source: AGHT+IFa+VZ81ocWMaBa2mFn46xb84Mt6PsKyBjpAI0MI3gvqZzTycK0AEdo/AX/35uwZXb4OrHhvg==
X-Received: by 2002:a17:902:dacc:b0:205:7c76:4b2c with SMTP id
	d9443c01a7336-206f05f6924mr132506985ad.48.1725931293861; 
	Mon, 09 Sep 2024 18:21:33 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	d9443c01a7336-20710e1b09bsm39335845ad.56.2024.09.09.18.21.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2024 18:21:33 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>, 
	Mikhail Lobanov <m.lobanov@rosalinux.ru>
In-Reply-To: <20240909133740.84297-1-m.lobanov@rosalinux.ru>
References: <20240909133740.84297-1-m.lobanov@rosalinux.ru>
Subject: Re: [PATCH] drbd: Add NULL check for net_conf to prevent
	dereference in state validation
Message-Id: <172593129267.13781.9847171739560045999.b4-ty@kernel.dk>
Date: Mon, 09 Sep 2024 19:21:32 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
Cc: lvc-project@linuxtesting.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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


On Mon, 09 Sep 2024 09:37:36 -0400, Mikhail Lobanov wrote:
> If the net_conf pointer is NULL and the code attempts to access its
> fields without a check, it will lead to a null pointer dereference.
> Add a NULL check before dereferencing the pointer.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> 
> [...]

Applied, thanks!

[1/1] drbd: Add NULL check for net_conf to prevent dereference in state validation
      commit: de068f4741781bbba0568b44b41d51da0feef6f9

Best regards,
-- 
Jens Axboe



