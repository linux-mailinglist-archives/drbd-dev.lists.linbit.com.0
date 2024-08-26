Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 0638195F2C0
	for <lists+drbd-dev@lfdr.de>; Mon, 26 Aug 2024 15:20:25 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 577F4420618;
	Mon, 26 Aug 2024 15:20:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F396D420618
	for <drbd-dev@lists.linbit.com>; Mon, 26 Aug 2024 15:19:56 +0200 (CEST)
Received: by mail-io1-f51.google.com with SMTP id
	ca18e2360f4ac-81fd520fe0dso159081339f.3
	for <drbd-dev@lists.linbit.com>; Mon, 26 Aug 2024 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1724678396;
	x=1725283196; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=ND3NrPkSi5n6iQvhSYnvkyJB6B2+0U8Ic4Hctt71hOs=;
	b=CM34tKI5cl0U0L4Tfn9ghfup9pDsUKeaEoKGmzLTx246wc0ssbSLKBBVSQLXM9knDB
	r+5HF6mNiGDLn2j+obiRMmUANWGIOtsV2tf8u7kzrLXs46vCRlm9+Ue+JUmSIZRzr8Mv
	eBok0GD36rrrHRR5aP/D/1YAQ04b4WUkgMfq9bfybjih6tHFVMfHqynR/lg/Rg44gINM
	zevr6jSPF0pbJRp/dMn03PkD73RimHsSD3Xxi0vIKwQTYEdsQW411/fiM0e3DO4JVfp3
	fUdIp0UnlnHQyx8Bnw1RWkklZLjA/2/ODqVtVwYlHb9HU4+zVK479UHsRd+66b3e58vr
	mMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1724678396; x=1725283196;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=ND3NrPkSi5n6iQvhSYnvkyJB6B2+0U8Ic4Hctt71hOs=;
	b=rPu05k8EEHhbsqB+SEjz+9q2lb9FeHcTiDfIo3p5Tx9V1jhbICVlMBUKE0W7ZIRrwN
	Y83ozgnRBIUuiKQAa2Z5A1Kah2Rjq9xPPI9WXtUvJ0rjWVYbKelsvMnjxZNKBcEogWh5
	cvpFwwLdXcRSQq+wlfMQmlIV2CfDWczmrD0B6Y2uI0Gnwj4Z8ERRegu/eXPYD0oPPTz0
	hoYN3A4gFvY8jhelKCLAZYCbLxld9fzJHLFZxxadoB4FhNfPC218f6+IvWPS2Z7T2K8E
	wh/NcAUhntOKAJvrBHn5fq9ucHvanAEQmi9y8k04Eo0XVsUBouUTzs6dz1aQJI5EYHTV
	DhSw==
X-Forwarded-Encrypted: i=1;
	AJvYcCXqWI4GP3G0tAlexrVGkKd9UvQ2yJLfMuPkZxcolBYrcNJOru2YQpZffr7dqzxCjJ7kOXDcMNtxGg==@lists.linbit.com
X-Gm-Message-State: AOJu0YwIQj9cEcGDG08NLOUzNffQ4NcA9EolulSrHPGgtbzNts17nAjV
	yiwKzVxBwkI5/RsX+MU5cyD8xWtVeNxeAtxgbTRygW7iu2RzamMgvacPvJHL02U=
X-Google-Smtp-Source: AGHT+IGuneM3ymYO8gW9bV/pY862S/sob8UkKyinwtVwYM0YXOVdA12+fjG4OXjQZVCqPhQd4a3LGA==
X-Received: by 2002:a05:6602:6216:b0:824:d9c0:3fc6 with SMTP id
	ca18e2360f4ac-8278812b383mr1092953939f.3.1724678395910; 
	Mon, 26 Aug 2024 06:19:55 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	8926c6da1cb9f-4ce710bb24csm2196044173.132.2024.08.26.06.19.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 26 Aug 2024 06:19:55 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, 
	=?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <d5322ef88d1d6f544963ee277cb0b427da8dceef.1724602922.git.christophe.jaillet@wanadoo.fr>
References: <d5322ef88d1d6f544963ee277cb0b427da8dceef.1724602922.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] drbd: Remove an unused field in struct drbd_device
Message-Id: <172467839482.162646.6496919978142098172.b4-ty@kernel.dk>
Date: Mon, 26 Aug 2024 07:19:54 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org,
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


On Sun, 25 Aug 2024 18:22:23 +0200, Christophe JAILLET wrote:
> 'next_barrier_nr' is not used in this driver. Remove it.
> 
> It was already part of the original commit b411b3637fa7 ("The DRBD driver")
> Apparently, it has never been used.
> 
> 

Applied, thanks!

[1/1] drbd: Remove an unused field in struct drbd_device
      commit: 87599eddc25ac03647ab76221523c6485e7594b1

Best regards,
-- 
Jens Axboe



