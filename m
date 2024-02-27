Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE6586A213
	for <lists+drbd-dev@lfdr.de>; Tue, 27 Feb 2024 23:04:20 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8DDEB4205D4;
	Tue, 27 Feb 2024 23:04:18 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 547 seconds by postgrey-1.31 at mail19;
	Tue, 27 Feb 2024 23:04:13 CET
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6B07B4205D4
	for <drbd-dev@lists.linbit.com>; Tue, 27 Feb 2024 23:04:13 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B83DDCE1AAA
	for <drbd-dev@lists.linbit.com>; Tue, 27 Feb 2024 21:55:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03A72C433C7
	for <drbd-dev@lists.linbit.com>; Tue, 27 Feb 2024 21:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709070904;
	bh=3/RfPqLDBq2vduXCxtn+wVcLC2MeaCqjWafrmlfzQ8Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jpGMil46p6GqVRZCu84P+c06uHDWgOH12QdM4jaCSQ0ockAS3EaabTLyUuqwTYmw4
	OC2mOJkEOmE8hhOLCme6nd7zNX0NGRDfFTrPNdjnYGgkJILslvSp7h7ty1C/pXTv1D
	PHvU53csggehUlFV1fZzocZRwLOyLWXfovNfwvzTCYN4aWnf6VSc9WuQ+n+YqY0SJ2
	zMSQq+eOrGl1tN0d+HEvHitFV6hcdHAcJ4VCYEoU/RWPTa+8OWjLrbGrsR3BVMzDTE
	5PGYiD3RNhruSer6bb6QDb155wghQWExyniiLl3g4wHvRc6r5bUKp6t/1aqxjC4GgV
	Pscn9B/HILXDg==
Received: by mail-lf1-f50.google.com with SMTP id
	2adb3069b0e04-5131316693cso1328501e87.0
	for <drbd-dev@lists.linbit.com>; Tue, 27 Feb 2024 13:55:03 -0800 (PST)
X-Forwarded-Encrypted: i=1;
	AJvYcCVqmRAJYz/d4ZIQm8Kfk/9HKmC9ArR2NxS/qp5YSJQtiWHdV8kZqRPmVmz469UpULy87gggRYuR7RQucRGt+iQfuei77MVO1BX4
X-Gm-Message-State: AOJu0YzVlrU1eI+vMQA6Niq+ZyzJDMwXk9o5zQkAQDWywpE3YpjKRBlr
	UDZ+BS+Vf1mFR7nWJmgp3U31SD74OKD+sU9PV1wahvzuS125GR99pNmOSAiDE2OJdaKVuzRpXhf
	l9wpTM63KsyQQaNTcDH0X6IgIQog=
X-Google-Smtp-Source: AGHT+IHPxa2DdiuJIouYc51MEi39KJBs69dc432JIqCMoP62t/zoip/3+rIeVMh1JnR4ItsfvwyijLn41RUlo5ksKEw=
X-Received: by 2002:ac2:46ee:0:b0:513:124:b36 with SMTP id
	q14-20020ac246ee000000b0051301240b36mr3668098lfo.29.1709070902249;
	Tue, 27 Feb 2024 13:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20240226103004.281412-1-hch@lst.de>
	<20240226103004.281412-7-hch@lst.de>
	<b4828284-87ec-693b-e2c3-84bdafcbda65@huaweicloud.com>
	<20240227152609.GA14782@lst.de>
In-Reply-To: <20240227152609.GA14782@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 27 Feb 2024 13:54:50 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5xaK=WR1RKGpYkSzHW8TOMbUwY-KeTD=kD3otQFZZV0Q@mail.gmail.com>
Message-ID: <CAPhsuW5xaK=WR1RKGpYkSzHW8TOMbUwY-KeTD=kD3otQFZZV0Q@mail.gmail.com>
Subject: Re: [PATCH 06/16] md/raid1: use the atomic queue limit update APIs
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, Mike Snitzer <snitzer@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Yu Kuai <yukuai1@huaweicloud.com>,
	Mikulas Patocka <mpatocka@redhat.com>, "yukuai \(C\)" <yukuai3@huawei.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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

On Tue, Feb 27, 2024 at 7:26=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrot=
e:
>
> On Mon, Feb 26, 2024 at 07:29:08PM +0800, Yu Kuai wrote:
> > Hi,
> >
> > =E5=9C=A8 2024/02/26 18:29, Christoph Hellwig =E5=86=99=E9=81=93:
> >> Build the queue limits outside the queue and apply them using
> >> queue_limits_set.  Also remove the bogus ->gendisk and ->queue NULL
> >> checks in the are while touching it.
> >
> > The checking of mddev->gendisk can't be removed, because this is used t=
o
> > distinguish dm-raid and md/raid. And the same for following patches.
>
> Ah.  Well, we should make that more obvious then.  This is what I
> currently have:
>
> http://git.infradead.org/?p=3Dusers/hch/block.git;a=3Dshortlog;h=3Drefs/h=
eads/md-blk-limits
>
> particularly:
>
> http://git.infradead.org/?p=3Dusers/hch/block.git;a=3Dcommitdiff;h=3D24b2=
fd15f57f06629d2254ebec480e1e28b96636

Yes! I was thinking about something like mddev_is_dm() to make these
checks less confusing. Thanks!

Song
