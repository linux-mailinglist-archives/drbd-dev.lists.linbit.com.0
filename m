Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAB8C241B9
	for <lists+drbd-dev@lfdr.de>; Fri, 31 Oct 2025 10:21:58 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC2C11627B6;
	Fri, 31 Oct 2025 10:21:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C60A21626D9
	for <drbd-dev@lists.linbit.com>; Mon, 27 Oct 2025 23:46:22 +0100 (CET)
Received: by mail-wm1-f42.google.com with SMTP id
	5b1f17b1804b1-475dbc3c9efso19996135e9.0
	for <drbd-dev@lists.linbit.com>; Mon, 27 Oct 2025 15:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1761605182; x=1762209982;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=YbNF9xBLgvPcEJ73q19bteNh3qQ4EWHWmqaSpEAAHPI=;
	b=lTZ1cduAlx7ba33G/dkfzJeq8CRK2uOjfCLgZgTeEZs3W6Lx/H3PrVDr3FpZMYtEZ2
	FeoDTeLA92wNf70LFKdWhuvmafWWDe8d10rew/QOmToydgvsM5ZvsI8e+t6KVM8dXDOk
	h7CkY5COckQ4wquaHDhYAAK7/y+wDT32D+QiI2law9HQpC6QjrnuG6kGiTIUvSlRIafs
	oLMRXfOfsp37ZlhJeLViy0pUrloBIz7HSoAqhbN2oaffGCslzyiSqWq8+DE0gk96ef8e
	Xj7R+la48bZqJ7xBsNFyeEu2NIBkh2i/AbMGZi7X4KzIFtfRdQsaHvHz2OZdp0W6l8r1
	iNfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1761605182; x=1762209982;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=YbNF9xBLgvPcEJ73q19bteNh3qQ4EWHWmqaSpEAAHPI=;
	b=XioDATVQ11RgmBxHQ9jrFqXoLxRyvJ7bHj42VGVkgJX2VSE7TdFwZyvYePqt26gCpQ
	CGB33Cb4M1yyMV2ufWIzJf8UWYVERFxPo6rdQ2Finlzu400UyaRTvzw9Gge6I29Ghm5p
	CAwUDgIBHN8173bLd3BUEgX1yKkA/w4XcxBBKri7IyiLKYBVNwykPlydiJ1cceypy8By
	qEh8yQyKBNIFlY/8WhW+hAD3SfIMw1xI7ro5owFe2AFFXRbzEVbD0vdSYFNueeYSDfHx
	xmIUxT8MtTqzxaLOHPnx8vvH+EccxkT1w4TY93t0Egox5/wOwjKuE+ZWlD3XuxJSCQfG
	hyiQ==
X-Forwarded-Encrypted: i=1;
	AJvYcCXvw0RET47TCidrdY7HYzja4MhNTyTO+tGetAGUxLWBbKfs/JYJQSm4JIYGF5Xi9A2Yc3BI8irhhw==@lists.linbit.com
X-Gm-Message-State: AOJu0Yw3OH82hkrEbsgdfaS6NZSsm3Dmfjei1z5QMg2jFzSukRqe+N9v
	SFUQBdMWVQhuOKYzxTOcSGbrmUeWujo5i/9L+e9NZL6dGQHWbQfVtYT73twEJv9kDmxIjJ+rKUY
	p+NXZPpvw56nPu3FbuDHdBEgY4I+iZBk=
X-Gm-Gg: ASbGncteCl8zfTJ9aEwnmAx82fBVz6mFJsc504a0BIYMXoUrcOqa1Z+RPIMZnhlP8xz
	D6Dff0fRBsj7M1bQdFix2ydVNuVzr6glx9pC3qiEA8WP9dni3okMmk4NulMUkDlbT9sx2xbWwap
	F18ZOyyx0kZnWz1CGG4I4CxxiBpmS1HiYndSJyXDuHUGKsCbm44T9KwOJUeAw3KZTJG3XAcQprd
	+NKsdxioHEzwfhfDLJhYlGcR4NaXYpq6bJC1ce74Z5z026hexJ0zZw/rv+Ux1IpzWUOYQ==
X-Google-Smtp-Source: AGHT+IEeNWo2bsGLLqGLfQNsY0L6lNVZZ2khSDzRsqsRr6Jo8tC6B0Avoq1yBzRM+ieeQ79ZgiTz+pEgGuOt7PLnUe4=
X-Received: by 2002:a05:600c:46d3:b0:471:1415:b545 with SMTP id
	5b1f17b1804b1-47717def6demr11070845e9.7.1761605181955; Mon, 27 Oct 2025
	15:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1761439133.git.jinji.z.zhong@gmail.com>
In-Reply-To: <cover.1761439133.git.jinji.z.zhong@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 27 Oct 2025 15:46:10 -0700
X-Gm-Features: AWmQ_bma6lyHlpvPtwTt1egk70m2KnBJDjgat6AjIDzKFfoBCYrn6d-bXve4s8M
Message-ID: <CAKEwX=MqsyWki+DfzePb3SwXWTZ_2tcDV-ONBQu62=otnBXCiQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] Introduce per-cgroup compression priority
To: jinji zhong <jinji.z.zhong@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 31 Oct 2025 10:20:24 +0100
Cc: linux-doc@vger.kernel.org, roman.gushchin@linux.dev, mhocko@kernel.org,
	linux-mm@kvack.org, shakeel.butt@linux.dev,
	drbd-dev@lists.linbit.com, corbet@lwn.net,
	YoungJun Park <youngjun.park@lge.com>, senozhatsky@chromium.org,
	linux-block@vger.kernel.org, terrelln@fb.com, dsterba@suse.com,
	cgroups@vger.kernel.org, akpm@linux-foundation.org,
	axboe@kernel.dk, feng.han@honor.com, liulu.liu@honor.com,
	muchun.song@linux.dev, philipp.reisner@linbit.com,
	linux-kernel@vger.kernel.org, minchan@kernel.org,
	mkoutny@suse.com, hannes@cmpxchg.org, tj@kernel.org,
	zhongjinji@honor.com, lars.ellenberg@linbit.com
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

On Sat, Oct 25, 2025 at 6:53=E2=80=AFPM jinji zhong <jinji.z.zhong@gmail.co=
m> wrote:
>
> Hello everyone,
>
> On Android, different applications have varying tolerance for
> decompression latency. Applications with higher tolerance for
> decompression latency are better suited for algorithms like ZSTD,
> which provides high compression ratio but slower decompression
> speed. Conversely, applications with lower tolerance for
> decompression latency can use algorithms like LZ4 or LZO that
> offer faster decompression but lower compression ratios. For example,
> lightweight applications (with few anonymous pages) or applications
> without foreground UI typically have higher tolerance for decompression
> latency.
>
> Similarly, in memory allocation slow paths or under high CPU
> pressure, using algorithms with faster compression speeds might
> be more appropriate.
>
> This patch introduces a per-cgroup compression priority mechanism,
> where different compression priorities map to different algorithms.
> This allows administrators to select appropriate compression
> algorithms on a per-cgroup basis.
>
> Currently, this patch is experimental and we would greatly
> appreciate community feedback. I'm uncertain whether obtaining
> compression priority via get_cgroup_comp_priority in zram is the
> best approach. While this implementation is convenient, it seems
> somewhat unusual. Perhaps the next step should be to pass
> compression priority through page->private.

I agree with TJ's and Shakeel's take on this. You (or some other
zram/zswap users) will have to present a more compelling case for the
necessity of a hierarchical structure for this property :)

The semantics itself is unclear to me - what's the default? How should
inheritance be defined? What happens when cgroups are killed etc?

As a side note, seems like there is a proposal for swap device
priority (+ Youngjun)

https://lore.kernel.org/all/20250716202006.3640584-1-youngjun.park@lge.com/

Is this something you can leverage?

Another alternative is to make this zram-internal, i.e add knobs to
zram sysfs, or extend the recomp parameter. I'll defer to zram
maintainers and users to comment on this :)
