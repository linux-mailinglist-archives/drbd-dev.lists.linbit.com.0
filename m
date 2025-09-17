Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFB0B7FE8B
	for <lists+drbd-dev@lfdr.de>; Wed, 17 Sep 2025 16:21:39 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 481F81622C4;
	Wed, 17 Sep 2025 16:21:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C1CC160655
	for <drbd-dev@lists.linbit.com>; Wed, 17 Sep 2025 16:21:14 +0200 (CEST)
Received: by mail-io1-f51.google.com with SMTP id
	ca18e2360f4ac-890e5bb3100so138987639f.0
	for <drbd-dev@lists.linbit.com>; Wed, 17 Sep 2025 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1758118873;
	x=1758723673; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=d68s8pWNCdPaGhVBNodG3vOwiZCJ3oHbIMlBi1U/Nnw=;
	b=XjGHQxfrVThgPn/23jfeBA20h8tWjPXF3ookQRdSZTSXp9Zr1eGUPmK3FSgmPWw1mT
	cW0A4ekU7f6pZthCmPxoat///NALqGcUVH7ktZg35waqfS9HqLoZtqf+IOXhlGEQeghO
	k4mrSEwzvN5yWYSxYCXprz6GfDJfo5YfqhdXOTfLeg1J7MfgjpfTz92fqJFodqntK7Wq
	LG1Ml8iovFFcemHicK+TsaxB3IhfOPeoXqf/W4GnYou8FS8j6d8Plf+F2VUxfG5BOmh9
	N37b/o3BAApkTU82CraMVpNWmxhRYpRp9ndyAlt+fXdfF7SRYoWFHBtKez4HOWjaOC8Z
	/fhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1758118873; x=1758723673;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=d68s8pWNCdPaGhVBNodG3vOwiZCJ3oHbIMlBi1U/Nnw=;
	b=KwbXlODGWyVww90AiCevx+Uky7kHMnwgKUmA56SWLP7xAoFmo0r4fnB79LqDXbQI98
	FMTeVVr33tAd3TxPuaOn0sjzNiXLbWLgZRw7P0bW9YCdSSclBFtwQBD1mRAAiBEPCxdF
	GjYfZKQWWmSG75Cw7cEt4JyO/0VDf0fXOtzhpIfkgUk3cukNpyJaUu8pnphanqmIhqBA
	cKDe6lpCe4h0FxLxv46MCpuPPcuG9OnDobZPJTR98CQDONJPhv1fr9lIiqKkGEUNVgUr
	trBDz7wVtZZtd7L/c3N4jw+Wk4NsIL6sDlPzpLh8RO4CrBeHscyL5m/HBusGIptlpNjm
	I58Q==
X-Forwarded-Encrypted: i=1;
	AJvYcCXb/YefR6fY+w4briieENoSX7BtwCGfVSNOLLZpkY+9UByQkAI/vmQyT4rZh6YSXsC2BKLAa+GTDg==@lists.linbit.com
X-Gm-Message-State: AOJu0YxLb183Q/Fiv81HYwwI8E8DY7rKo51N90HL1YKU0Rc2gm2Gn2Gh
	FFfH43QPTyGj63L2VkWd2gg9fFxNRGBYByuduSEOqaWkkiPwRKlhn8yK0SFLIZrwb4U=
X-Gm-Gg: ASbGncscQ4NpZOTGOMH4PDuVtARK5jvgD1sbv49jZjHuIlcK3gIL3YbNLf/NfsuVHmJ
	YeTFYspRBOCjq5Xz9XUAY/er2z38Ru1SK5t3AFYmkJRen1k1C/9oUw2jqpt+zvzxOrgzqq1nIr8
	j7Li6gmufqnnWDCPLKdhiG5zjdx6wNAPZkoxpx1eARYI0eAzXWEn2h8/AS9dQbezNa3v6OTYwj9
	xjyr3EzDqqz5ExYKDddbfIuP42aYXXvsXL+k6mwkY0mw/NnIvTXnjtV+kPMNU3XA9Q3Wr76ivSK
	hoANbqIH2xSKwT6VVGht4q9pekhsfgvV4stxHOC2trm1nqODWCc/eX7d2Dlu2l+Pe4m9K3pLnF8
	FCSTxNIOIYARu5Q==
X-Google-Smtp-Source: AGHT+IHdd2VS4yz6Fa1klXONV8I+5ZoG/vMhg8JzZxOXeIeHOgf+AemBCv8ARUuHNgaKUufvKlJZJA==
X-Received: by 2002:a05:6602:1683:b0:887:1b69:9693 with SMTP id
	ca18e2360f4ac-89d1bfaa016mr356375239f.5.1758118872921; 
	Wed, 17 Sep 2025 07:21:12 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	ca18e2360f4ac-88f2f6c6339sm670751239f.21.2025.09.17.07.21.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 17 Sep 2025 07:21:12 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, linux-raid@vger.kernel.org, 
	drbd-dev@lists.linbit.com, Zhang Yi <yi.zhang@huaweicloud.com>
In-Reply-To: <20250910111107.3247530-1-yi.zhang@huaweicloud.com>
References: <20250910111107.3247530-1-yi.zhang@huaweicloud.com>
Subject: Re: (subset) [PATCH v2 0/2] Fix the initialization of
	max_hw_wzeroes_unmap_sectors for stacking drivers
Message-Id: <175811887192.378805.895284774096542580.b4-ty@kernel.dk>
Date: Wed, 17 Sep 2025 08:21:11 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-2ce6c
Cc: pmenzel@molgen.mpg.de, martin.petersen@oracle.com, john.g.garry@oracle.com,
	yangerkun@huawei.com, yi.zhang@huawei.com,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	yukuai3@huawei.com, hch@lst.de
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


On Wed, 10 Sep 2025 19:11:05 +0800, Zhang Yi wrote:
> Changes since v1:
>  - Improve commit messages in patch 1 by adding a simple reproduction
>    case as Paul suggested and explaining the implementation differences
>    between RAID 0 and RAID 1/10/5, no code changes.
> 
> v1: https://lore.kernel.org/linux-block/20250825083320.797165-1-yi.zhang@huaweicloud.com/
> 
> [...]

Applied, thanks!

[2/2] drbd: init queue_limits->max_hw_wzeroes_unmap_sectors parameter
      commit: 027a7a9c07d0d759ab496a7509990aa33a4b689c

Best regards,
-- 
Jens Axboe



