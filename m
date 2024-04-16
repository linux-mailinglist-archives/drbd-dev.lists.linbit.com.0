Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0328A6CB4
	for <lists+drbd-dev@lfdr.de>; Tue, 16 Apr 2024 15:42:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 773864202AA;
	Tue, 16 Apr 2024 15:42:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D31524201D7
	for <drbd-dev@lists.linbit.com>; Tue, 16 Apr 2024 15:42:20 +0200 (CEST)
Received: by mail-wr1-f51.google.com with SMTP id
	ffacd0b85a97d-346359c8785so3402119f8f.0
	for <drbd-dev@lists.linbit.com>; Tue, 16 Apr 2024 06:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1713274940;
	x=1713879740; darn=lists.linbit.com; 
	h=in-reply-to:content-disposition:mime-version:references
	:mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
	:subject:date:message-id:reply-to;
	bh=FtRpYGlIaOwBawcvab5vfBiUnObfRbuDvN6mQAPgWkQ=;
	b=UfrcXo3x/0hW1YStfsqSsaze7AWb0Lq4YXCdDnsB08O6mOMPBfpeE+W1rSH3Efq8iZ
	ZyuOQ4owBuNgmT2V8movzINZ3Q9mCbAKXiVBvtoVtiqpH2d1TFEMnh9hfdCLXjv+zXrm
	vj+nU6RCrtK5+HycKK4Qe7FbCTaB2bh17JK2ehAUdGKRV6D75ngW+OemYvwfNRXeukEq
	cu62Vi/PvLzaZjym/geUvNSdqltnc/bVoWkX3gGfO99MZ1ZAYXneit7M4Wqnej3WMHT2
	bs0t9ar5iNzhqFDMDG5Bgn10HiaVc7+IVhjFTB03LLCzseJN42E9QRD2EtvMOjzhDFOP
	Aftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1713274940; x=1713879740;
	h=in-reply-to:content-disposition:mime-version:references
	:mail-followup-to:message-id:subject:cc:to:from:date
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=FtRpYGlIaOwBawcvab5vfBiUnObfRbuDvN6mQAPgWkQ=;
	b=MHKVgjt1nyuZnMMX3yAEESODUULDzZC2TvSQNETDBO13P/ibqVWdTq4MzkPNoJesEZ
	0WX20Mln08YFg4IFCzPmf4/E0D1Z4uiOQUw3oeq6BpZfIu+jJVCAIt1BbCSUIZI5a6Bp
	dGyHyN/Rqv6IbvboqJv2nLgZoHey7d/DxxLX3FLfvDsOQPC+jS3CvWqgRoaFk8Hlv/8f
	i//HplWBRk/oA30ZQlCFygYhmqQLhW/5R2tQQckm//jdlzxdzkB3bz8mDPOIZqdhvL7t
	pvMUxecZ8Jx8KnHW7bWZAOv24nMvEpMWZGwTQGfbkuzd/tKw6i334nnAtPLgtoaoJelk
	Yu1w==
X-Forwarded-Encrypted: i=1;
	AJvYcCVCza8B8ROur+IH78Qx+DXmm7+Bem+MeTJOHQaxeVqcN1zpXqSpM1oXAy7pKy2aDpC70bvnmSRfUVw3riBLxc6ZuazkcKcaWELh
X-Gm-Message-State: AOJu0Yw2Bed2Ne3ZvYWNM92lMQBmbLJV67cm0iN4Ju4B2koLb93R9Q40
	5cMkbw6BCQwh05leV8h51E1UQ7uEQ5T8/zYNWtHzZXd0k4Y5C+1C/YkZANc0WTO8rA==
X-Google-Smtp-Source: AGHT+IHb2XUGXH3VYBdStkdwRwp1cNSpTWQi9dMAjeRtfvly6FxJAKALRZs42okP9GoT69KRJJu88g==
X-Received: by 2002:a5d:6484:0:b0:346:47d6:5d17 with SMTP id
	o4-20020a5d6484000000b0034647d65d17mr10870806wri.57.1713274939982;
	Tue, 16 Apr 2024 06:42:19 -0700 (PDT)
Received: from grappa.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	p14-20020a5d48ce000000b00349856b640bsm1353351wrs.67.2024.04.16.06.42.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 16 Apr 2024 06:42:19 -0700 (PDT)
Date: Tue, 16 Apr 2024 15:42:17 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: I-HSIN CHENG <richard120310@gmail.com>
Subject: Re: [PATCH] lru_cache: Initialize hlist_head in lc_create
Message-ID: <Zh6AOaymY1kF+V8F@grappa.linbit>
Mail-Followup-To: I-HSIN CHENG <richard120310@gmail.com>,
	philipp.reisner@linbit.com, christoph.boehmwalder@linbit.com,
	drbd-dev@lists.linbit.com, linux-kernel@vger.kernel.org
References: <20240311030735.233470-1-richard120310@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311030735.233470-1-richard120310@gmail.com>
Cc: philipp.reisner@linbit.com, linux-kernel@vger.kernel.org,
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

On Mon, Mar 11, 2024 at 11:07:35AM +0800, I-HSIN CHENG wrote:
> Use INIT_HLIST_HEAD to perform the initialization for each pointer to
> struct list_head in the variable "slot" to provide more safety and
> prevent possible bugs from uninitialized behavior.

Completely pointless.  It is kcalloc'd.  Why explicitly zero-out something
that was already explicitly zeroed out to begin with.

    Lars
