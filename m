Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E012AB164
	for <lists+drbd-dev@lfdr.de>; Mon,  9 Nov 2020 07:45:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EF4904207A9;
	Mon,  9 Nov 2020 07:45:35 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 297DB4207B1
	for <drbd-dev@lists.linbit.com>; Sat,  7 Nov 2020 01:32:21 +0100 (CET)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7ABC922210
	for <drbd-dev@lists.linbit.com>; Sat,  7 Nov 2020 00:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604709140;
	bh=KcpIPe+A58yFNxxgdAdaS3ugXYdHOBtuseeQrVYguHI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O7dyOXal7YL7+3TQPR507WAWXuCRa9VXvh3tl/XZ3Wmey5p91Ew7PyDj8k/tZUsUX
	XY5D3+3MbK8y+gvrbaa+8QamA+h71zwFvUqQhxnEoaqEjETZ+k6/bM4uDXaudNmc1c
	Llst5cl3Ll69uQ67EfsvLxy48UchXaU9XWGm+pGE=
Received: by mail-lf1-f48.google.com with SMTP id h6so4386113lfj.3
	for <drbd-dev@lists.linbit.com>; Fri, 06 Nov 2020 16:32:20 -0800 (PST)
X-Gm-Message-State: AOAM530MFQjH/VqolhE5ODxw5u11CF12ZQXTwGrcA4guFgrWxEcQRbDR
	5c6BPbijTPoj0R4zTnmBexMUPYHvUs4kQzWvdjM=
X-Google-Smtp-Source: ABdhPJzPKJgvb0YpcBOATticPbEhSqNhkf0gjO34lXWldMg14DmOELWQsnbdEhjrrSsS6KPE2QcSxjJkDLUT8kUmj4w=
X-Received: by 2002:a19:ae13:: with SMTP id f19mr1682538lfc.193.1604709138508; 
	Fri, 06 Nov 2020 16:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20201106190337.1973127-1-hch@lst.de>
	<20201106190337.1973127-22-hch@lst.de>
In-Reply-To: <20201106190337.1973127-22-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Fri, 6 Nov 2020 16:32:07 -0800
X-Gmail-Original-Message-ID: <CAPhsuW6GuXe_2YKnP5wRHg7ytOxjUzTQZ=fG2RKxs6woNVPFaQ@mail.gmail.com>
Message-ID: <CAPhsuW6GuXe_2YKnP5wRHg7ytOxjUzTQZ=fG2RKxs6woNVPFaQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Mon, 09 Nov 2020 07:45:34 +0100
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
Subject: Re: [Drbd-dev] [PATCH 21/24] md: use set_capacity_and_notify
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

On Fri, Nov 6, 2020 at 11:04 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
