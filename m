Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA3D9F2DDC
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Dec 2024 11:10:32 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BF77F16099A;
	Mon, 16 Dec 2024 11:10:30 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BAFEF160961
	for <drbd-dev@lists.linbit.com>; Mon, 16 Dec 2024 11:10:26 +0100 (CET)
Received: by mail-ed1-f50.google.com with SMTP id
	4fb4d7f45d1cf-5d3d2a30afcso6829516a12.3
	for <drbd-dev@lists.linbit.com>; Mon, 16 Dec 2024 02:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1734343826;
	x=1734948626; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=1HmlHTVCbOW7xRqJqGUEVYtitmZpDH5VFj0J+evh7NI=;
	b=PJ4VxBxjO4WzfCgl6bh2eu3ezyAwbiBP4pPTIUmkGTm2QtBr8da2lZwfXC/aZOciac
	dD99dA946iAyGPqeTWobzylD5a+1mUH8boHCNC0FlIsiPIEFbYcpYhzQ2BS140Xocelb
	7NQTVZ99OP8mO09zH1cMO44Lquyg4FfWQOSVhurzK3O2E2QYh4GlY05SHt85+C1VfV2q
	AK5DU7EaXW/UBINnhmeip++h0NqLt3liF9FwuAeDy7lV9z/1ffikdw6GwpE6vBWszbbH
	TVWH/2Cq94ERcFrRgucKmMvWP1A/yrEfvcuLSlsls6XXN5R0lDBYZ0drl8KN2S6dOA4/
	DsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1734343826; x=1734948626;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=1HmlHTVCbOW7xRqJqGUEVYtitmZpDH5VFj0J+evh7NI=;
	b=xORbiPm9JmqiDQiQGnWldjeCSOv8Nb0V405VY23PxD/HynF+GciPypgrisDOtqOcEE
	PoUOX5OuY4uKMZ3RNd2elO/kPskL8Q3Z+8nN84K1sC8RGwQeE7hqjfewbSe6mSSq1wsr
	+y0/EfPRwapx2bUaxTY6C5yxKTF4QbFAz9pIFMYccpg/6FvMDxg3CtC8deibDzkOAZWM
	m0vkKrs1EO2Zvt3eDPBB8tFXmlPTecdDcqU5cnSVySG+bhQVWJjYJ12LzkTSmriVaKoI
	sq93GCAoO3iM02m2U0NZRGKbyMvbr7i5Lb2zQsxWD19k8IN+7P2XxvpUin2heM1FFG+G
	jU0w==
X-Gm-Message-State: AOJu0YxVNrdwzG6O35nKLtOwX9bUbgYnnodW3vuY2eVgzHjT2sI0Q8FN
	KBwkLTjhZHL5Kto+Sd0gye5hS1ilrOSbbptNunN6KSj/BOL2zTRLJKDBWxB440fkqFYROaXDnZH
	9ea2kTt3+s4NmquRC4ARGzj2H9XLIak+lAmBst2Wa/qWXAwEmUFBhEA==
X-Gm-Gg: ASbGncvAk/VFRJkMJO33sAHodIdIwCUACgLosVpUNGoFyvcaxZ0tzZ6h6iy/OqtwxzT
	h/oEm3G8ShASx1r7l+s68OU+bRjx5ZZd9gJLY910=
X-Google-Smtp-Source: AGHT+IHn03C/Ar3BGa/fRyCmApsQVkGEkNeMbaorHINe/70xtjuYMv6g+JS52X38x4Ae5wbIO3g0plDayExpoJzX08Y=
X-Received: by 2002:a17:907:3f97:b0:aab:736c:5a7 with SMTP id
	a640c23a62f3a-aab779b4b90mr1228864166b.25.1734343824367;
	Mon, 16 Dec 2024 02:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20241215065056.879266-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20241215065056.879266-1-zhengbing.huang@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Mon, 16 Dec 2024 11:10:12 +0100
Message-ID: <CAGNP_+W+gELNC_1DmmHYbbAe_7hP0YdXk04cF_X5MqYevhN+jw@mail.gmail.com>
Subject: Re: [PATCH v2] drbd: Fix memory leak
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Cc: drbd-dev@lists.linbit.com
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

Thanks. Applied as
https://github.com/LINBIT/drbd/commit/d64ebe7eb7df8c622b20bca38f3d7f4c7bb033c9

The commit will be merged to master in due course.

Best regards,
Joel
