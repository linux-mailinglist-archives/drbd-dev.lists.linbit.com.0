Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8A593A17F
	for <lists+drbd-dev@lfdr.de>; Tue, 23 Jul 2024 15:32:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A133B42082D;
	Tue, 23 Jul 2024 15:31:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 99EED420657
	for <drbd-dev@lists.linbit.com>; Tue, 23 Jul 2024 15:31:54 +0200 (CEST)
Received: by mail-pg1-f176.google.com with SMTP id
	41be03b00d2f7-6c386a3ac43so70051a12.0
	for <drbd-dev@lists.linbit.com>; Tue, 23 Jul 2024 06:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1721741513;
	x=1722346313; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=3TZ5ldNvpgl0zGwq9TUJinN2tshm4DZksOkaoK0Hc9Y=;
	b=Js1NK5WH1dD+yhrYBFIkVl6aFczuyod57QL1/R7QTY5as6GRVXKLaVi+nVZHJ/htY3
	UiwG1yn/ruB1yTVutpZPjZZHLd1N4XNp3Y6P0T/POMewVt6i11KxNj2JktSKCrdJbQXN
	fYAA+xFBpyFMFLJxXFtSR182I6PWJVG8QECp3QfVV1hJjk+g2+9Km5yixNGVbde+tZa3
	OXLtUSJJ6eL2cAKoNEPRz05liHYqnRuMRCXXPt52o9So7bCVMmy4CJVyugIadroBNF3J
	EwPymywnvKfy0swqGAOnkHmu24+QAcum3WYICOtfW6o6jkHonLTXLkRZWL52nF5x7GvR
	LoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1721741513; x=1722346313;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=3TZ5ldNvpgl0zGwq9TUJinN2tshm4DZksOkaoK0Hc9Y=;
	b=kF/83FiyZaZPnyY/L+aYJf2TDLmlqZ15OiDy1WeLz2Cr9yJS0+31YGiiPmKTdaF4oG
	e3RwJqtq6TQnMr47aitsN+FWro8U+hUK+XI02qX8FqOMsihCocnfoLw4FbshTJmRPArn
	0xVCWjT8j3fjfeRgZ8IP36KUM9gYlqmYpFONAJ+XxaZNo2RAGLWb+3Y7HuvrFoKEqAWA
	2Qszd2f4sEWc/l99K9v7RcWikgtuktpaw7MfWVTKOQFw7RUVm1rU53ZKdacLEf0qvru8
	DvwxnvyRJFiZF6Efh7/Dl5MfwJA2dKO6/fsjXy5znRq4gaPXMujXKn6iR2pEqHH2CvOq
	2Qug==
X-Forwarded-Encrypted: i=1;
	AJvYcCXtpWGrowVIPRhKCtTfJAmmjcroXtehOkwYXrxfZsmGaYbheWZUCkfNz9buEpJ2WaUexDIgiUjNRWu9QAP340YRpFhIQcIJTXoC
X-Gm-Message-State: AOJu0YyMoRFXcAPyg5tBoAWRVTiuQxdkqlD8GM5REybW7O9be3UBKuHp
	MysvP35V8TFs7i6fS9NjvneQ6LDNW1BlRp9ITg9ZFedOXK9MLwxbosKVUkRnVDE=
X-Google-Smtp-Source: AGHT+IHxt3qJcNFhOgTmuTSf/6MAoBV2NfVh2JCWLOLA/lZ1dp8b1Zzvb8z66ap7Hc0lElinVA352w==
X-Received: by 2002:a05:6a00:391b:b0:704:173c:5111 with SMTP id
	d2e1a72fcca58-70d08635b76mr7749852b3a.3.1721741512980; 
	Tue, 23 Jul 2024 06:31:52 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-70d14aa33f6sm4867744b3a.65.2024.07.23.06.31.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 23 Jul 2024 06:31:52 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, Simon Horman <horms@kernel.org>
In-Reply-To: <20240723-drbd-doc-v1-1-a04d9b7a9688@kernel.org>
References: <20240723-drbd-doc-v1-1-a04d9b7a9688@kernel.org>
Subject: Re: [PATCH] drbd: Add peer_device to Kernel doc
Message-Id: <172174151190.171540.3359811072031639762.b4-ty@kernel.dk>
Date: Tue, 23 Jul 2024 07:31:51 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
Cc: linux-block@vger.kernel.org, Andreas Gruenbacher <agruen@kernel.org>,
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


On Tue, 23 Jul 2024 10:41:52 +0100, Simon Horman wrote:
> Add missing documentation of peer_device parameter to Kernel doc.
> 
> These parameters were added in commit 8164dd6c8ae1 ("drbd: Add peer
> device parameter to whole-bitmap I/O handlers")
> 
> Flagged by W=1 builds.
> 
> [...]

Applied, thanks!

[1/1] drbd: Add peer_device to Kernel doc
      commit: b8a4518b5c2d1164f9bb2e586733a658c5239adf

Best regards,
-- 
Jens Axboe



