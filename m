Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 36026C2CA03
	for <lists+drbd-dev@lfdr.de>; Mon, 03 Nov 2025 16:16:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D8A9F1627A3;
	Mon,  3 Nov 2025 16:16:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
	[209.85.166.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0332F16094D
	for <drbd-dev@lists.linbit.com>; Mon,  3 Nov 2025 16:16:23 +0100 (CET)
Received: by mail-il1-f181.google.com with SMTP id
	e9e14a558f8ab-4332d5be8adso9871745ab.0
	for <drbd-dev@lists.linbit.com>; Mon, 03 Nov 2025 07:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1762182982;
	x=1762787782; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=g2VP5eHd4whSzt4tHMCcMt8UV6SGTODxfAS8gkq2xxo=;
	b=pFpB+JGW9I5ftZXITP3KYxxJiJDCHRX5pSVA35VPpVBg0oIGgSBH0HcKkDGZjVOqr2
	qQ3YMGUy81Wsj2jzeZ1ftB7aK4zTXiRdZi7L7P2k2zlvnOCyop6GS5OkRvtkA2eCVlzZ
	5eo6L6k4CKSX7k/xb39tWk06cHsA+Fci+xJ3i+ggLLVB4/7PvDJnVq7rTXCpzB/AKXTB
	PhD2vHGVLI0YBHcTA6Yyh87qf7lbj5CRAPgczt5NBvbffk0O8W5VKDWrKp4f7mVTcJcu
	3rV6Tzk7LGcC9ofWhAu8EGVHzHUewydzWLcAnaNxSZsbRHWZkzZioovl0aAkkfZqJl2L
	ecRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1762182982; x=1762787782;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=g2VP5eHd4whSzt4tHMCcMt8UV6SGTODxfAS8gkq2xxo=;
	b=j/tiXRuN6ChhyHRD3UWZ78g4DABdQLEx5aGdJ3MP9b3eQe1DHH4ZuxzxHiFYYgAp/0
	ZkHRZs6MrOgzOwvg8ztIaRM9AfM8emOiF79nYzkMjHDL3mCA1EbiKppKp6qHyTrne7BF
	g5+1cWb7rigSjBk4yhGITNRjI2vEqZbbnrJMw2zt4KzpVtSEJw1j2jxXroPFNN+RseZc
	LR9RPVUR+zf1lNzcsIMBgTfJWNSQYtU/hIrPUAWbSTj59IGfAq2WKXsjzPGyOXS+6R94
	8EtWZVY5VfAvExYXZEhnlqInkFcpRwJc9/D2+fFLA8zB9hLvA+prEtTcLXWFwRdR8xaI
	+F9w==
X-Forwarded-Encrypted: i=1;
	AJvYcCXA/T7OMn+/ollTkHgOFtn5U+4aT/XVC9YtYWurs6xHsXHfCtRf7sBiyWv4rkEe9ItQUMqvN3JM9w==@lists.linbit.com
X-Gm-Message-State: AOJu0YzcfYxtruqWzECix11sAJ7SVr9+A+4iZkFnp8/81pQ8NXHLT82f
	8ZKNWp+qpIOc7JioEaMtncje4dqufrnCydHjDvT/6+eYyZzeF+jq6B++74E+A4K8fNY=
X-Gm-Gg: ASbGncsN+KoRZa0BviPITKN1FUJZjk4CxcyEwloFhkvb3fiKKrsgwZjHCyH4qpION2t
	wIgL50DjyaLwAAVP0Ha6PWBK4VMxiViSaW69V2mMeZlvat1kVspcfP7917i5S6DCRDJXrD3Fw8j
	C2w2y0d7RrNHd//mK75xT6riITHM0fy1hEUnPN8QqsDuovnqZoreLpxWtcDDlbiVBQJu12njtoT
	mF7CjPQ/h9zGYgW7SJz9hLhDEcfx6i3dST5PO2XMZyMvJgNyzVvi8vaxYJEBbpKWhtRrbJ2JAhH
	6EfhveeMh/mViLfJKf6rdCXyOpwHTIdvWURmAACcbQ99YIIkIwuzoz6p2qA7hioSJdXMq/sXpwp
	nwhDSk8mQdjjSr8aQTplP/5TbGDXpPRIu756iIbu7bipjEsJ67Nv1/NBiz3+oJN/ClDM=
X-Google-Smtp-Source: AGHT+IEiDN1o+PM/1Z7sT1acon36b1aVtRVhw4Y/i/XVotDAKRdH4bIM1pLS9oCqfCdsagASs5k2KQ==
X-Received: by 2002:a92:ca0c:0:b0:433:3192:4aa with SMTP id
	e9e14a558f8ab-433319206abmr40241605ab.4.1762182982356; 
	Mon, 03 Nov 2025 07:16:22 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	8926c6da1cb9f-5b72258d620sm261819173.8.2025.11.03.07.16.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 03 Nov 2025 07:16:21 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: philipp.reisner@linbit.com, Shi Hao <i.shihao.999@gmail.com>
In-Reply-To: <20251101054422.17045-1-i.shihao.999@gmail.com>
References: <20251101054422.17045-1-i.shihao.999@gmail.com>
Subject: Re: [PATCH] drbd: replace kmap() with kmap_local_page() in
	receiver path
Message-Id: <176218298119.720460.5302997686043809131.b4-ty@kernel.dk>
Date: Mon, 03 Nov 2025 08:16:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
Cc: linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
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


On Sat, 01 Nov 2025 11:14:22 +0530, Shi Hao wrote:
> Use kmap_local_page() instead of kmap() to avoid
> CPU contention.
> 
> kmap() uses a global set of mapping slots that can cause contention
> between multiple CPUs, while kmap_local_page() uses per-CPU slots
> eliminating this contention. It also ensures non-sleeping operation
> and provides better cache locality.
> 
> [...]

Applied, thanks!

[1/1] drbd: replace kmap() with kmap_local_page() in receiver path
      commit: 77220f6d18a22b0b5d73b5d2156609b0aa21a7c5

Best regards,
-- 
Jens Axboe



