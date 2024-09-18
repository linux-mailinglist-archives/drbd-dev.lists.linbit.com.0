Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id B557E97BAA3
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Sep 2024 12:17:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EA355420900;
	Wed, 18 Sep 2024 12:17:12 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC9BB420303
	for <drbd-dev@lists.linbit.com>; Wed, 18 Sep 2024 12:17:08 +0200 (CEST)
Received: by mail-wr1-f45.google.com with SMTP id
	ffacd0b85a97d-374c1e5fe79so4927168f8f.1
	for <drbd-dev@lists.linbit.com>; Wed, 18 Sep 2024 03:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1726654628;
	x=1727259428; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=9xmRlfgY58bu3lgrbHWfq1PnhjWfcGquoMknYxltLHw=;
	b=Ua9lkuWuzi3GITn+YbecD4CS5wwUiL58vRrsILxewcc+1OpMNiaoc6UAhnsdOAUj48
	zyTyvIJ1F9U7aHNJnWzeCiwy4ycybyNnu6pHUgdnr4/n3Lg4/XamDtyRgUH5UjqMMHOU
	EqbzJkX+zwmjOUmH9PdEIQcfeE4wXNfcSZPcikZOKt5bKQ0h9zibKwWgbK/cMfFkoQmg
	t78WnPsuOlTqaSh2qKGSJ5s9cNjZpjBKWZfqsFZw+mHWVzm8f0CKfN6ROvdgJj/oc82t
	BFwsHd8MRtsPt1NppgjYJtFTjjCqh6TbLgtNJ5FT5FQ7ZKIi/3htwVUOp2EbX25ZBWRM
	JwPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1726654628; x=1727259428;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=9xmRlfgY58bu3lgrbHWfq1PnhjWfcGquoMknYxltLHw=;
	b=D+BOVlSgDzQ1YQDa4dGSDsO0rEi3halu0MYvuXHHLFqNmgDqs6XLdYbT3itXTAMD7V
	qL9GEAbN16ev3QxsMbD9mMJga/4DEiojnYaY7NEmB5iqtqTXuw2verLU0x//BHv6KdkP
	MDx1i50x3Y/Y3hiiN7EbkmGjeo66CN4Kp/BwNGBHMYfKm+vDFpCLfkj5dO7f8gTWq7a9
	wxELSc4WKUKAgEwgS3QHGXiq78bcq7xZ7hqTMi6Wq+oXUFIx0hjJMZmNnmlH9inkx2sJ
	NUncKqtLRl3y1ZO9qvJ2RYKerRfX6sCAJKLmPdI1a2IABYjOuUiRK1jJxaYOcrDmNpYX
	dTgg==
X-Gm-Message-State: AOJu0YzB46kEpIr7VkGCIlA8Rvi8t6aLZnDOq42DJNWl45JKsEAtwqFX
	1PMWHTBlWEXyc6GfslVTQlw9s3TZeHJf4WopoD/Q0ky4EIkFVAJkWvClaTB1X4A=
X-Google-Smtp-Source: AGHT+IEt+88MOqjxAvT4BA2X407wtBcTy4RsMgu6zlhxdOqsfDfTg/sRarmUG6UIBwTVkHUeUeJlPg==
X-Received: by 2002:a05:6000:128c:b0:374:cd3e:7d98 with SMTP id
	ffacd0b85a97d-378c2d062fcmr12084591f8f.19.1726654627726; 
	Wed, 18 Sep 2024 03:17:07 -0700 (PDT)
Received: from [127.0.0.1] ([185.44.53.103]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-378e73e7feesm11837758f8f.29.2024.09.18.03.17.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2024 03:17:07 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
	christoph.boehmwalder@linbit.com, Qiu-ji Chen <chenqiuji666@gmail.com>
In-Reply-To: <20240913083504.10549-1-chenqiuji666@gmail.com>
References: <20240913083504.10549-1-chenqiuji666@gmail.com>
Subject: Re: [PATCH] drbd: Fix atomicity violation in drbd_uuid_set_bm()
Message-Id: <172665462666.8208.13856585668352326031.b4-ty@kernel.dk>
Date: Wed, 18 Sep 2024 04:17:06 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2-dev-648c7
Cc: linux-block@vger.kernel.org, baijiaju1990@gmail.com,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
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


On Fri, 13 Sep 2024 16:35:04 +0800, Qiu-ji Chen wrote:
> The violation of atomicity occurs when the drbd_uuid_set_bm function is
> executed simultaneously with modifying the value of
> device->ldev->md.uuid[UI_BITMAP]. Consider a scenario where, while
> device->ldev->md.uuid[UI_BITMAP] passes the validity check when its value
> is not zero, the value of device->ldev->md.uuid[UI_BITMAP] is written to
> zero. In this case, the check in drbd_uuid_set_bm might refer to the old
> value of device->ldev->md.uuid[UI_BITMAP] (before locking), which allows
> an invalid value to pass the validity check, resulting in inconsistency.
> 
> [...]

Applied, thanks!

[1/1] drbd: Fix atomicity violation in drbd_uuid_set_bm()
      commit: 2f02b5af3a4482b216e6a466edecf6ba8450fa45

Best regards,
-- 
Jens Axboe



