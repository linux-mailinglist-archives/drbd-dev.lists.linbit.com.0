Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCA12B4D39
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 18:37:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7FFD74208E9;
	Mon, 16 Nov 2020 18:37:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 92CFC4208E5
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 18:37:48 +0100 (CET)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 1B49F22450
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 17:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605548267;
	bh=ftduAERcAIXDqH3TIoaKNDFMaog9lpKkHZKNbYpzPJA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=wH0K96aiOcV3zWDXEfO4eGXrSbfel4fzpavvJrcvlGnm+IOvE6CCXcyPRZ9CDEpWQ
	ERyPgn3goZaj4Rjri8kCDsRD2QqVIDrl9bwMtmzAsZXelVyGcoi/J8IVVb6h9ki8ms
	Nt6zKSXy/JZjbcTnM2HNzH4y+CQMSryqUl+eemUA=
Received: by mail-wm1-f43.google.com with SMTP id d142so19498wmd.4
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 09:37:47 -0800 (PST)
X-Gm-Message-State: AOAM53037tNx2VQCE9067IklFlyp2ylLjFgnhAqaseGXExMFUELPR+dz
	vPdGzeISKUIllX1PzdGK90rEBU3r/HsHLt4ePck=
X-Google-Smtp-Source: ABdhPJwSJNXG5A+c75VC7fB+eg5ocrYD0cMopnWErnzA3/FY5Qe4JfgRdEHZElz1KxxX9qTRF1opV72EejXl51sD+G0=
X-Received: by 2002:a1c:bbc4:: with SMTP id
	l187mr17490114wmf.133.1605548265533; 
	Mon, 16 Nov 2020 09:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-29-hch@lst.de>
In-Reply-To: <20201116145809.410558-29-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Mon, 16 Nov 2020 09:37:34 -0800
X-Gmail-Original-Message-ID: <CAPhsuW5YeO0-Cb=avHu2osRKjz19Lvk4jWqaCdaqFnjbdPJtrw@mail.gmail.com>
Message-ID: <CAPhsuW5YeO0-Cb=avHu2osRKjz19Lvk4jWqaCdaqFnjbdPJtrw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
	Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid <linux-raid@vger.kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>,
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] [PATCH 28/78] md: implement ->set_read_only to hook
	into BLKROSET processing
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

On Mon, Nov 16, 2020 at 6:58 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Implement the ->set_read_only method instead of parsing the actual
> ioctl command.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

[...]
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
