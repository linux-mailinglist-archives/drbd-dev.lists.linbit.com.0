Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 93060873ABF
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Mar 2024 16:35:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C3FE42062A;
	Wed,  6 Mar 2024 16:35:37 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
	[209.85.166.175])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8F78A4205D4
	for <drbd-dev@lists.linbit.com>; Wed,  6 Mar 2024 16:35:31 +0100 (CET)
Received: by mail-il1-f175.google.com with SMTP id
	e9e14a558f8ab-35d374bebe3so5646475ab.1
	for <drbd-dev@lists.linbit.com>; Wed, 06 Mar 2024 07:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1709739330;
	x=1710344130; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=jX4nyne9Vjk99u0/ohdDAGsyHE7iZyQVnC8gHrggHOs=;
	b=Ijfgg1L7oahFsHUWDFQSXgx6nOP4DFaEyfBSvEParR/VfZdice3rfXIodbFSDYRfNK
	WG5O12htZcK1G/miRNUsYf+XxhSaBMYZnxZDh6BsUbWmyCAm2dx+M1zzu/mQKzir3k4p
	JawHqO9EfItLr2Y9/UM0zTzU33ifyUmv16l6978Ryg05hbXZ9n3w17PvtL07nlVKmxQI
	vi5HNPySaYMdE6aH5jxQF8apGn6LYHEFQ2y6zUqgo8cG8F19FfCcjL3QZ6uE7axbJ7tx
	3mtBNVOcpnxzVkLpFqt8YxWgrUe7/h5LHGJhTnJFnd/mzl+gcrxN+vShnxEZd0lpISkd
	ffyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709739330; x=1710344130;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=jX4nyne9Vjk99u0/ohdDAGsyHE7iZyQVnC8gHrggHOs=;
	b=rUcHjilij1HIKGwxzq3Y5Q+BPdUSsmRDG8iTBMwggAZY9UWZwmcJkMjHM89lL1a1JB
	u113jQaf2IUUkify8sFPAE5VOBxNih4UeO24i8Gt9wJtD6Cw9pVmgwsSHUInacAiItiN
	8HMUZ+5/ZB/KATBUgo0GX7Uu/M9Hhv1wovyREBj8fDVgt1RX45zopArdV1S6v7aF6gEN
	aw74bkNIA7EKUp5mNXqhb64yNbd+/i7PRKEBijis7/qnAuIAY5Cg4Avi0BipHM7NNdzg
	KyPptne+DlRhdZ+vRF4v4zbYHaPK8qiV8qYsFwAML3tHmNYzBvB5oSeMfLoGFAC4NTZb
	kHow==
X-Gm-Message-State: AOJu0YytargVIm14gx8UGQvuu5pMOVpRYMZjhnmg8p9H0+Mb9jxQgbwQ
	LpZlEaTK783A0+DBTClhy+8tjoIF0mHMhleSdfHemEx8m3v9IXWpG51syKTwqfR0+/h7O/Piciw
	+
X-Google-Smtp-Source: AGHT+IH1bcw4KhZiBlzy5h98P6a4jHCdS8o6jRQnommbMHMGdLVJEO3B9N/OVPPwu9nqf1K5rJA3RQ==
X-Received: by 2002:a05:6e02:152b:b0:365:a792:3749 with SMTP id
	i11-20020a056e02152b00b00365a7923749mr3880536ilu.3.1709739330455;
	Wed, 06 Mar 2024 07:35:30 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	t2-20020a92cc42000000b003660612cf73sm324467ilq.49.2024.03.06.07.35.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Mar 2024 07:35:29 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>
In-Reply-To: <20240306140332.623759-1-philipp.reisner@linbit.com>
References: <20240305134041.137006-1-hch@lst.de>
	<20240306140332.623759-1-philipp.reisner@linbit.com>
Subject: Re: [PATCH 0/7] drbd atomic queue limits conversion
Message-Id: <170973932937.23995.12080568570430339256.b4-ty@kernel.dk>
Date: Wed, 06 Mar 2024 08:35:29 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.5-dev-2aabd
Cc: linux-block@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
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


On Wed, 06 Mar 2024 15:03:25 +0100, Philipp Reisner wrote:
> Here, with the Reviewed-by and Tested-by trailers.
> 
> Christoph Hellwig (7):
>   drbd: pass the max_hw_sectors limit to blk_alloc_disk
>   drbd: refactor drbd_reconsider_queue_parameters
>   drbd: refactor the backing dev max_segments calculation
>   drbd: merge drbd_setup_queue_param into
>     drbd_reconsider_queue_parameters
>   drbd: don't set max_write_zeroes_sectors in decide_on_discard_support
>   drbd: split out a drbd_discard_supported helper
>   drbd: atomically update queue limits in
>     drbd_reconsider_queue_parameters
> 
> [...]

Applied, thanks!

[1/7] drbd: pass the max_hw_sectors limit to blk_alloc_disk
      commit: aa067325c05dc3a3aac588f40cacf8418f916cee
[2/7] drbd: refactor drbd_reconsider_queue_parameters
      commit: 342d81fde24152adf9747e6e126c8c3179d1a54c
[3/7] drbd: refactor the backing dev max_segments calculation
      commit: 2828908d5cc8396e7c91d04d67e03ed834234bcd
[4/7] drbd: merge drbd_setup_queue_param into drbd_reconsider_queue_parameters
      commit: e16344e506314e35b1a5a8ccd7b88f4b1844ebb0
[5/7] drbd: don't set max_write_zeroes_sectors in decide_on_discard_support
      commit: e3992e02c970f6eb803b98b9f733cad40f190161
[6/7] drbd: split out a drbd_discard_supported helper
      commit: 5eaee6e9c8f9940ecee93678972774fb8dd450d5
[7/7] drbd: atomically update queue limits in drbd_reconsider_queue_parameters
      commit: e6dfe748f09e37f77437bd337f891f5b57d5d5a2

Best regards,
-- 
Jens Axboe



