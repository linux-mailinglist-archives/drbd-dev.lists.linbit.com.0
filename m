Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 536EF2AEE35
	for <lists+drbd-dev@lfdr.de>; Wed, 11 Nov 2020 10:55:49 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0578842081A;
	Wed, 11 Nov 2020 10:55:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 48C7642080E
	for <drbd-dev@lists.linbit.com>; Wed, 11 Nov 2020 10:55:45 +0100 (CET)
Received: by mail-il1-f193.google.com with SMTP id t13so1450627ilp.2
	for <drbd-dev@lists.linbit.com>; Wed, 11 Nov 2020 01:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qfEf7xRtwJh6vel7ndE10SMbjF6zTEFOWV8RA9xu3eI=;
	b=Flu0kG/G8H5tmdzF22ns+x1T3WixC4FBs0RbA9YeGx20Pw3IL573gomPOrRSgLhidi
	jxm4xXdraWCqe23Uz/lTRF5Gzul+neu0ZW5SRlL8rLtuRaQOMWWnKLr+e1J5E2f/IB4R
	iaO9iEipyz2F49FzVbspMmUTamyYBNigOi7Hq45S5vTkNhsbMM69J9bWbbawzfmKvyaE
	prBgh+sprAAWuhDKQzcpJRm9c4LoRmjW0z3OGufy4OEk4vgw7impUerADJ8+P1l4Evs/
	gUeZGg6Qzu0m4oCwYhIr6na+Ay9Hq4ATHKFwzo1XQC1pmqP6NOhCJ7ijtefRPRR/Tb4r
	FFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qfEf7xRtwJh6vel7ndE10SMbjF6zTEFOWV8RA9xu3eI=;
	b=npTpTYqniqpBuyPxaA3pqNUHreIMCvCa2XmGyJpao6XqXVLP1DMXMJaev3b3XQLmNN
	92NdHpWqc4/IpjKR50C/Emm8Zc0DZsrtZzpCxRhUtvO9M4m0DzwNAy2dWmjXup+8agGx
	tUG1Eb/EjmA0JXSq/mQnOwrVuPmC9IpgvY9AmAoFOrcRWdphzjVHSwMcbJWXYCiBI0mF
	Ar9K1jCg6VM3Du2PVcHaBdXsjynfJ+aW67G4su4u8uyxeV9NToQDj3gynn0IZxIn53te
	7V9kkiH39vj+OjRXpFXHdg1MRh0gGsXcBPgOQRiiS9fZFtiA8rbOyjWhwbeGv/qFKp7m
	pExA==
X-Gm-Message-State: AOAM530CJiimArNu6zdepjv7UB/Smtl5kucBOsQG/ga81GrmHHS+NDU8
	k7jw64Y8uVB87oWPQ6qHOpSyX9IGm3EfIlGGX7Q=
X-Google-Smtp-Source: ABdhPJy9ZPoku1YjH4P5V9sTrbXGNc0TDLR8E4ST1Mn4KA5kvu+HvwpbOUC5MO/5tCHlTeWvzQ658Y1GM8zrKYsupSY=
X-Received: by 2002:a92:1f43:: with SMTP id i64mr17516886ile.281.1605088545285;
	Wed, 11 Nov 2020 01:55:45 -0800 (PST)
MIME-Version: 1.0
References: <20201111082658.3401686-1-hch@lst.de>
	<20201111082658.3401686-18-hch@lst.de>
In-Reply-To: <20201111082658.3401686-18-hch@lst.de>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 11 Nov 2020 10:55:45 +0100
Message-ID: <CAOi1vP-JjnNdAUqd9Gy6YdFgi8Ev4_Jt3zcB9DhAmdAvQhG7Eg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	Lars Ellenberg <drbd-dev@lists.linbit.com>,
	linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
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

On Wed, Nov 11, 2020 at 9:27 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Use set_capacity_and_notify to set the size of both the disk and block
> device.  This also gets the uevent notifications for the resize for free.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Jack Wang <jinpu.wang@cloud.ionos.com>
> ---
>  drivers/block/rbd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index f84128abade319..b7a194ffda55b4 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -4920,8 +4920,7 @@ static void rbd_dev_update_size(struct rbd_device *rbd_dev)
>             !test_bit(RBD_DEV_FLAG_REMOVING, &rbd_dev->flags)) {
>                 size = (sector_t)rbd_dev->mapping.size / SECTOR_SIZE;
>                 dout("setting size to %llu sectors", (unsigned long long)size);
> -               set_capacity(rbd_dev->disk, size);
> -               revalidate_disk_size(rbd_dev->disk, true);
> +               set_capacity_and_notify(rbd_dev->disk, size);
>         }
>  }
>
> --
> 2.28.0
>

Hi Christoph,

The Acked-by is wrong here.  I acked this patch (17/24, rbd), and Jack
acked the next one (18/24, rnbd).

Thanks,

                Ilya
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
