Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 6932E2AEE72
	for <lists+drbd-dev@lfdr.de>; Wed, 11 Nov 2020 11:06:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 43B6D42081A;
	Wed, 11 Nov 2020 11:06:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A0D1742080E
	for <drbd-dev@lists.linbit.com>; Wed, 11 Nov 2020 11:06:54 +0100 (CET)
Received: by mail-ej1-f65.google.com with SMTP id f20so1981209ejz.4
	for <drbd-dev@lists.linbit.com>; Wed, 11 Nov 2020 02:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cloud.ionos.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8BVYeCUTuKi3mlr+D1JejV3WQ4DReZqKao2un+osJdI=;
	b=EWvaurrQLE5Q4yXlmvtPWeVGE0dkpLilBhFACYcpJh5SLgD4k2LHFrfA3fg/phe+gw
	pOXsWhTko+6vmsPMUys1ydyafND8sfafc/BhJ0cLDqzJH5wv7CFdS4PBi4SJJirndEDo
	I3sopJwAoMSpcvKBGOBbJDfAHPo19nxrr5mYxmaUjZAtoeSEinoAPgcqf0tp4SGruWUm
	s+puyVNd/9QM59nJCHGxgwiF4Uhv/qkw3Bh4E6NoIJN/jPJN6bl5siKGHhBBHVdEhBTl
	i9cN1zoK+m/ZDFXKRJbDKDgS4Hb/xEaLU1cJNAhSo0nBcfuCpt/4xbdL/4qVB2KjPelC
	haxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8BVYeCUTuKi3mlr+D1JejV3WQ4DReZqKao2un+osJdI=;
	b=bJ25Oi4PFPVPhWhFkNZoNQ5nTcMDUt/+/T8S8SEjSYg0RcAXV4swXc3gi0zSm1YR/u
	hEIaZpDJvhVCEQHELwXYuWnz2PwJMNmr/Kb0r+MPVs9bIIhll5dMiO54jwe+ffwEkUyt
	q6GUQtxuuVxB2KLWH5Wa9Q9wTM2GrV4WI5PGz4NeiE/x0bcy83mmfE3cwan1tphO6kWj
	ujiYPuU9zUefVOovj7Br46MChK/4B/54SoHyCGwz2z+U4tXdB8ehxdehO58EVtY69pZ9
	sxQXPmtG4J4EYU2TIepcEOOoeJlkjqP7WZbcT5/bqDLtfV0S3EFbKGO6l7BUPdD/INaQ
	xF8Q==
X-Gm-Message-State: AOAM531xkTRfeykYwaP4tOsDCdp2A6ZxWfFr90sONEabbdomkr2prPKU
	LdikJUY8SWA8amsIZLzrU/gKNsl4porLIDM7+MUSeg==
X-Google-Smtp-Source: ABdhPJzsSG4n+ejxAi7LIm+JtRF2XZ0Zmfdo/Dim1Bn2zjoT1vntwc6k1ciTHUd7GwTXoyYPdOeDF7UWMmfnel/IKPk=
X-Received: by 2002:a17:907:c05:: with SMTP id
	ga5mr19170455ejc.212.1605089213881; 
	Wed, 11 Nov 2020 02:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20201111082658.3401686-1-hch@lst.de>
	<20201111082658.3401686-18-hch@lst.de>
	<CAOi1vP-JjnNdAUqd9Gy6YdFgi8Ev4_Jt3zcB9DhAmdAvQhG7Eg@mail.gmail.com>
In-Reply-To: <CAOi1vP-JjnNdAUqd9Gy6YdFgi8Ev4_Jt3zcB9DhAmdAvQhG7Eg@mail.gmail.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Wed, 11 Nov 2020 11:06:43 +0100
Message-ID: <CAMGffEmU1ezUo68zF8DS4CRZZMosqhmDw3h7uiWzh2nL8tUs9g@mail.gmail.com>
To: Ilya Dryomov <idryomov@gmail.com>
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Christoph Hellwig <hch@lst.de>, Lars Ellenberg <drbd-dev@lists.linbit.com>,
	Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>,
	xen-devel@lists.xenproject.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid <linux-raid@vger.kernel.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Ceph Development <ceph-devel@vger.kernel.org>,
	Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] [PATCH 17/24] rbd: use set_capacity_and_notify
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

On Wed, Nov 11, 2020 at 10:55 AM Ilya Dryomov <idryomov@gmail.com> wrote:
>
> On Wed, Nov 11, 2020 at 9:27 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Use set_capacity_and_notify to set the size of both the disk and block
> > device.  This also gets the uevent notifications for the resize for free.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> > ---
> >  drivers/block/rbd.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> > index f84128abade319..b7a194ffda55b4 100644
> > --- a/drivers/block/rbd.c
> > +++ b/drivers/block/rbd.c
> > @@ -4920,8 +4920,7 @@ static void rbd_dev_update_size(struct rbd_device *rbd_dev)
> >             !test_bit(RBD_DEV_FLAG_REMOVING, &rbd_dev->flags)) {
> >                 size = (sector_t)rbd_dev->mapping.size / SECTOR_SIZE;
> >                 dout("setting size to %llu sectors", (unsigned long long)size);
> > -               set_capacity(rbd_dev->disk, size);
> > -               revalidate_disk_size(rbd_dev->disk, true);
> > +               set_capacity_and_notify(rbd_dev->disk, size);
> >         }
> >  }
> >
> > --
> > 2.28.0
> >
>
> Hi Christoph,
>
> The Acked-by is wrong here.  I acked this patch (17/24, rbd), and Jack
> acked the next one (18/24, rnbd).
right. :)
>
> Thanks,
>
>                 Ilya
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
