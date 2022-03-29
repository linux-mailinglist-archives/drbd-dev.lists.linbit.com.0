Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AB56B4EA8B7
	for <lists+drbd-dev@lfdr.de>; Tue, 29 Mar 2022 09:50:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A6D59420634;
	Tue, 29 Mar 2022 09:50:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A12124201DA
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 09:50:45 +0200 (CEST)
Received: by mail-ua1-f45.google.com with SMTP id a28so7323113uaf.7
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 00:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Oq+Z6jNlZq+ZQofugfp2fRT6ds4wfKxot/aZdwn2WhA=;
	b=yZhdVjxwh2/m5mbLgEngbkgE3G3gnxZFRf1jW13GjQM5F98zv7M82fzW8oKWfZSKUF
	kluYlmO7/djcCa8os2SM3k7YOg+loZt0FPygDR9ComSmwQxnkNHbWxildLYxmsKVkXDb
	DxyJesNbu7I7TwfK9xMRH1fit0kbIQ3DRgi3aOoe33j4XbntfXHuMGxiZBbsCdhlaCMt
	3Jq20be/b7HvMOVMr9CZHcCAcpxSR6s3i7RaHeD3ZZSZr1s+cG8i8RIe7mqtt2RRtCgS
	u51da3zY7RvzdQZihKHdUI5EDco+FytktD3YVJYkeoz/wes7UkclKvRM1J8sV6BlmVgt
	nVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Oq+Z6jNlZq+ZQofugfp2fRT6ds4wfKxot/aZdwn2WhA=;
	b=GhXAsTMODq6El/BB+lhNVwJvTVBZPqCT/AByWl7qOC1ax1c2ig54PMVmgMpdg4lCyb
	Dz8tGB9DflheS8AzcLdhybKa9ARoBAzSVm9t5E+TJz1AzwTPIoPw6U3AhSPbMKZWQ4v5
	ohBf5eQ7TcYj7u1++aGniCapkcvGvvIOTzS8L7p+IpHPT1Q9Ql5oeLJ4MxhEUewzcPUC
	BRA6ARAV+GNCr7NKv8VcDveppho3jgUY8ut6lGhtYMAQWaiKgeHwm7+sfCYD4N0yUjqh
	xYNOziOiH3N++zbpW7RBtf4Ms2loSSQS8EzbBBIKm1Xj0L2xtNmm6Fnh87AKXRsy2PjP
	U9Vg==
X-Gm-Message-State: AOAM533jlaGuuKaS+/wiwElmJZcWavoaAogwm24k3n45RG255/5T3JF+
	zYpVftrzVNFlKuai8uMDBbOUBl/ySkv2P24Nli19uiOe
X-Google-Smtp-Source: ABdhPJw5plfdPb+L2JPLk102d32wrj5zplTwmUxFp7a5XaOP/QkyG0KqpejT+kgULLuf4pgaK9Mu7q3gz8Vv5zQqzws=
X-Received: by 2002:ab0:6c48:0:b0:359:cfea:c24f with SMTP id
	q8-20020ab06c48000000b00359cfeac24fmr9497635uas.104.1648540244878;
	Tue, 29 Mar 2022 00:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220329070618.GA20396@lst.de>
	<CADGDV=UgjZAbmAN-2bO1nyDvA=XCC9Lf2dxWHZ0BwxF12nnztQ@mail.gmail.com>
	<20220329073254.GA20691@lst.de>
In-Reply-To: <20220329073254.GA20691@lst.de>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Tue, 29 Mar 2022 09:50:33 +0200
Message-ID: <CADGDV=U5jwe0CZ12174cMahfD_h-GsBswWaA1VOJbHaC1nsrUw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] state of drbd in mainline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

> The complete lack of bug reports and maintainer interaction usually
> suggests low to no use and heavy bitrot.  If that is not the case
> here that's fine, just asking..
>

FYI, feature-wise the in-tree DRBD is frozen. Maintenance only. Users,
seeking advanced
features switch to the out-of-tree DRBD and use other means of communication:
Github issues, linbit's community slack channel, last not least
linbit's ticketing system.

That is why you see virtually no activity.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
