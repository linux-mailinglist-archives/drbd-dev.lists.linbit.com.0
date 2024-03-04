Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E818705C0
	for <lists+drbd-dev@lfdr.de>; Mon,  4 Mar 2024 16:38:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 250A242065F;
	Mon,  4 Mar 2024 16:38:25 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
	[209.85.221.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F237E420651
	for <drbd-dev@lists.linbit.com>; Mon,  4 Mar 2024 16:38:18 +0100 (CET)
Received: by mail-vk1-f174.google.com with SMTP id
	71dfb90a1353d-4d35b9a4b13so1693086e0c.0
	for <drbd-dev@lists.linbit.com>; Mon, 04 Mar 2024 07:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1709566698;
	x=1710171498; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=jkZYHpu65nwrwTsuxM4amko09H/lzM/u/hvt7PWXRUs=;
	b=l8ilTO1/Ri+Lyr4J/+rKGI2IdgfGDnTKhxt4h1ucd3odJMKdgOLUBY2sIf+0M9ML3U
	BgeoT+qMxMjIsh+5Bi9gb6spWfLfPT/Bc98G+dMQ9rZxX6h2Pi4zbMGIVkvGrDXttmm1
	KQv2QsZ5B3pUgt3b7J5B+Wtkg9xYVpEzRQdNcztQn7qSyLuC6S1+BX/rTpguhgDkRl4E
	JRAitVFMrSmGT6NrKAtdpaglojBLBCaWpZyIV9f/TcVvLIU8gyCO92+Ke1kbCb39LtKK
	71g1iMaozR8Ce8wqWWJu/uvNDOqBREZHvFFp8GVPmJDja0LwSWnEHwhmXvJaO35SwNZl
	Taug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709566698; x=1710171498;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=jkZYHpu65nwrwTsuxM4amko09H/lzM/u/hvt7PWXRUs=;
	b=Wpl2WMvIDJZE2oFMsVfljcmCnFi6A73ycAa7LDmYiFeNQuJjq6twz4Zl9Zt/ueRZTQ
	nii0GbBwO2FVfbDhxJU0JocBAq4h7ycWNL1Ly6eCCYfgPWILRVlqlcYUWblwB6JHGKsq
	THajuWnyZsYvMIr6agWif5vWYXg8jQeI5ra875noJX/oY2TygvWgNG5t8xt+rrUxsa62
	Y4JplOlxnzAr7bSLaI79IXgfuJusLUhynAgCbJReAxGSs9oQ7OTRb/nn0Zs9d58uvjTP
	N7kZRgI2NK2bGANS/P4VG42n6MIUG6OZW3qhIw4GjNK/w3FE4FA96d+lyEnAcJiHzUHc
	56Pw==
X-Forwarded-Encrypted: i=1;
	AJvYcCX1eU+//N/AvznOloA1wmciShrQw1ZW0fM+KNnD9u0KT+xLE12eEY3BF6TaIHlBGhbETNm2Q9jv6CX4n6o7wcL3VNu/s0EPfHyE
X-Gm-Message-State: AOJu0Yx+9n+pFMCXHFVsOszW58wRl34jh/2KWT+N+I2k9e5Q/b8/NoIq
	wLKyLvF4966kYiXUGE0BEGbQHnvr+J4XMsK1csKecSu8Z07c1TQA5DnJCl0BOIJ9aUMwprD0+f4
	DXqc5jYs2WZgxFMnGMrioo1bUebHFkcuwVgTAYvLuZJ6DPac7xOQ=
X-Google-Smtp-Source: AGHT+IHY1zzIo7EvQhjnMmC8zo2BroV2k0mHjtxSH3c9xuozB1/KwhGD5Fi33Ama/05oNzEzJ7bkxUgZDWr7JcM661E=
X-Received: by 2002:a25:ac5e:0:b0:dc6:d1d7:c762 with SMTP id
	r30-20020a25ac5e000000b00dc6d1d7c762mr8613958ybd.11.1709566324642;
	Mon, 04 Mar 2024 07:32:04 -0800 (PST)
MIME-Version: 1.0
References: <20240226103004.281412-1-hch@lst.de>
	<20240226103004.281412-11-hch@lst.de>
	<20240303151438.GB27512@lst.de>
In-Reply-To: <20240303151438.GB27512@lst.de>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Mon, 4 Mar 2024 16:31:53 +0100
Message-ID: <CADGDV=XqJ_3biGx-rX0jMMue4-dTg=J8NjyHOU-Ufonv4QiJ-A@mail.gmail.com>
Subject: Re: drbd queue limits conversion ping
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
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

Hi Christoph,

thanks for the heads up, and sorry for not seeing it sooner. We test
it overnight and review the patches tomorrow morning.


On Sun, Mar 3, 2024 at 4:14=E2=80=AFPM Christoph Hellwig <hch@lst.de> wrote=
:
>
> Dear RDBD maintainers,
>
> can you start the review on the drbd queue limits conversion?
> This is the only big chunk of the queue limits conversion we haven't
> even started reviews on, and the merge window is closing soon.
>
