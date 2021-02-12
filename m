Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C93C931A1F6
	for <lists+drbd-dev@lfdr.de>; Fri, 12 Feb 2021 16:46:02 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B2D944203B9;
	Fri, 12 Feb 2021 16:46:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
	[209.85.214.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A2364420341
	for <drbd-dev@lists.linbit.com>; Fri, 12 Feb 2021 16:45:44 +0100 (CET)
Received: by mail-pl1-f178.google.com with SMTP id e9so66748plh.3
	for <drbd-dev@lists.linbit.com>; Fri, 12 Feb 2021 07:45:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M8C1yZZgp4rNPfghNpxWN41GpCK1+InKLAelhxbvplw=;
	b=c5Swll1u41ktg+yIq+u2Oy7uS7QBkz+tkQOx7FReRrDBOLJ64hfYXQYQERa+OC5rwq
	QTqAsPg0wW+AVO/CyBxdF35OJ3XUcgq+CWwR1VUEnEWtBwZRpw1enxPmUDwd3bmrp/HG
	MFgihwdM/9Kor3aYHMt91y6/JOTIIwaGXconoqXmwIoBMdKNUc4R1yRRDcjHEDguSyR3
	TfemjZGKgcpE+YAfphVNCAUkWI8m/BV/ofYXnHtsWNUnW3OWjBc4IzrkF4Ad+zbSKVmk
	HmAXDeNbqJLNwBvV3U0fLkzTtU9dGEyhCJrMFKmIDGT7TQonk172c0UyKw7BqRRsVihG
	rQpw==
X-Gm-Message-State: AOAM531sLhGm7tpabbdXBHyCebXtGMvype+iF69nJ2vYHEDn3ptZGdlO
	2Ozo1bqQUMWiLKn7T7YvodPa4ETdhdV44YLt+CE=
X-Google-Smtp-Source: ABdhPJyYCXBmQgiV5syIf5Cv8mFWKTwy1gjS5Yhyhg4Qi/jYzZasdmgfRgJp2ybsEGtlgybQDIghy8J0Yy2+jaKx2kI=
X-Received: by 2002:a17:90a:4e1:: with SMTP id g88mr3222886pjg.7.1613144743400;
	Fri, 12 Feb 2021 07:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-13-hch@lst.de>
In-Reply-To: <20201116145809.410558-13-hch@lst.de>
From: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 12 Feb 2021 10:45:32 -0500
Message-ID: <CAMM=eLfD0_Am3--X+PsKPTfc9qzejxpMNjYwEh=WtjSa-iSncg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Justin Sanders <justin@coraid.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>,
	device-mapper development <dm-devel@redhat.com>, drbd-dev@lists.linbit.com,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	Hannes Reinecke <hare@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-block <linux-block@vger.kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] [PATCH 12/78] dm: use set_capacity_and_notify
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

On Mon, Nov 16, 2020 at 10:05 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> ---
>  drivers/md/dm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index c18fc25485186d..62ad44925e73ec 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1971,8 +1971,7 @@ static struct dm_table *__bind(struct mapped_device *md, struct dm_table *t,
>         if (size != dm_get_size(md))
>                 memset(&md->geometry, 0, sizeof(md->geometry));
>
> -       set_capacity(md->disk, size);
> -       bd_set_nr_sectors(md->bdev, size);
> +       set_capacity_and_notify(md->disk, size);
>
>         dm_table_event_callback(t, event_callback, md);
>

Not yet pinned down _why_ DM is calling set_capacity_and_notify() with
a size of 0 but, when running various DM regression tests, I'm seeing
a lot of noise like:

[  689.240037] dm-2: detected capacity change from 2097152 to 0

Is this pr_info really useful?  Should it be moved to below: if
(!capacity || !size) so that it only prints if a uevent is sent?

Mike
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
