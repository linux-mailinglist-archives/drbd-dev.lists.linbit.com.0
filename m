Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EA0722D85
	for <lists+drbd-dev@lfdr.de>; Mon,  5 Jun 2023 19:22:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BFB16420AFD;
	Mon,  5 Jun 2023 19:22:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
	[209.85.216.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A84424203B3
	for <drbd-dev@lists.linbit.com>; Mon,  5 Jun 2023 19:22:02 +0200 (CEST)
Received: by mail-pj1-f41.google.com with SMTP id
	98e67ed59e1d1-256918803baso1030181a91.1
	for <drbd-dev@lists.linbit.com>; Mon, 05 Jun 2023 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1685985721;
	x=1688577721; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=4bx3FOQ8WpXAjUchLrV7ZdQUMCcuc5rVhaoplHLZKkU=;
	b=NmMei7rN/FQixwaXZYdcuIqojmmWOTp3C9B6kG7NOpV0TNYhFnHmxNTr6RVA4dADhm
	lnGs6br8Osze0v/nf45uyiMWPpbT08Ed1pOxiu/uIzRR2GRirueFk/vTh71TTVGMY1tM
	lcu3bjzFVw6A6v2Q9VvvaP0ykmVyppKEVkhGBB5l562aAKL9NBDktU2ohjDOodcjtPlR
	ydBEK2dmhGggVTvL0IAa3d830ysmMcn0aUkBoYH/nX5g3XagTgxONQNHPde0tx5wfQY9
	7ryJkoTYpwHPx5dL1kP/eqdpJuoLDjFkmuAUfIkT3+cVjJPLBPdohoZ3RvxQKC4ZzZCx
	ybgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1685985721; x=1688577721;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=4bx3FOQ8WpXAjUchLrV7ZdQUMCcuc5rVhaoplHLZKkU=;
	b=ii7hYl4OL+xt1wtlfM45XgfzOarOz7kP9DANNZZVT87mZp5Vll9zTXFXPhorUVv+07
	LLtG13qd9a8kQilSOKd0b/lrRvzI13SrlU8QzMDXtKcA76xKNGqhZRkH4S/ddDyApv/M
	UhOlqMrdQUFESe5ukrVlv9OPq2oZqN67Xpmlq2TEu5suCLNhQeusTx0l8bYJBVCrRFzN
	GaezJqqYRqRauzImGB8aixZjbeWvOI4IPaORLF/th4r8Iq1teN9ti+dwis5sO45mmbgi
	uy6OH+mAtw5KNy2WpjKV1kR3DQ6HgRSBdtEhc+KEWqDQn3FQ1SQr3YprWJiOra1ueaJE
	fmMA==
X-Gm-Message-State: AC+VfDxh6/WOGBbgusJujAKvjTx7a2msf87rlm1iKd/MT6KEpVcmgQWb
	clhIN9fW6PpkdZQ59g7C+n7CN1NbmWeHMKhYR5s=
X-Google-Smtp-Source: ACHHUZ661iczc0HcuBHzs3Fi+bR77NqS/CnPjg3kZtWjD9M5bK3e6bkSVWVIc5Nlkq2/lDCuuq4zNg==
X-Received: by 2002:a17:90b:1e51:b0:258:85d9:be02 with SMTP id
	pi17-20020a17090b1e5100b0025885d9be02mr16979731pjb.2.1685985720966;
	Mon, 05 Jun 2023 10:22:00 -0700 (PDT)
Received: from [127.0.0.1] ([2600:380:c01c:32f0:eff8:7692:bf8a:abc6])
	by smtp.gmail.com with ESMTPSA id
	cl9-20020a17090af68900b0025643e5da99sm7993666pjb.37.2023.06.05.10.21.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 05 Jun 2023 10:22:00 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
	christoph.boehmwalder@linbit.com, Christoph Hellwig <hch@lst.de>
In-Reply-To: <20230601151646.1386867-1-hch@lst.de>
References: <20230601151646.1386867-1-hch@lst.de>
Message-Id: <168598571992.2504.2085169404981858004.b4-ty@kernel.dk>
Date: Mon, 05 Jun 2023 11:21:59 -0600
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-c6835
Cc: linux-block@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: stop defining __KERNEL_SYSCALLS__
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


On Thu, 01 Jun 2023 17:16:46 +0200, Christoph Hellwig wrote:
> __KERNEL_SYSCALLS__ hasn't been needed since Linux 2.6.19 so stop
> defining it.
> 
> 

Applied, thanks!

[1/1] drbd: stop defining __KERNEL_SYSCALLS__
      commit: d519df00938eed652fc041ff4e07b2b38a4ad3bc

Best regards,
-- 
Jens Axboe



_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
