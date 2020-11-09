Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 467552AD38F
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Nov 2020 11:23:12 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DDAD44207DE;
	Tue, 10 Nov 2020 11:23:05 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 302 seconds by postgrey-1.31 at mail19;
	Mon, 09 Nov 2020 12:36:28 CET
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 06D804207B7
	for <drbd-dev@lists.linbit.com>; Mon,  9 Nov 2020 12:36:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604921788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=qJPHU79Z9aFII+RXhVTkpUcHO9yLNqjEBCGqyvXY310=;
	b=ONHWpkbq2ScZlreLe2KU1v4fARlvdEMqOzMj6FZ9lXc6/GfSnpjq5j3dWaa77Ep+RHZcjv
	elt2qGiHt8VTcsFo6UetipHKU/JRjwpL6z3XvoHZxRwqaZFPLxElkWZEo1m3tqqV0ntXVZ
	3jk3ql9F+V0lrhx/dXsGff22fhkv9SQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-495-W27gt3SuNSWrOzXTIgAGmg-1; Mon, 09 Nov 2020 06:30:20 -0500
X-MC-Unique: W27gt3SuNSWrOzXTIgAGmg-1
Received: by mail-wr1-f71.google.com with SMTP id p16so1573222wrx.4
	for <drbd-dev@lists.linbit.com>; Mon, 09 Nov 2020 03:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=qJPHU79Z9aFII+RXhVTkpUcHO9yLNqjEBCGqyvXY310=;
	b=oAKQuMWBu0ztA/BKGvmfVOPUIBxrJXhVkD5U9VEXfpsdH7uDkQE2OfGi7NbrN6YLXA
	jAQkplpWhEG/siWRs7dJ3il1eiFxWnczUuYGP8TvdNLQyKBPeDTSxmuqEio6EbaQKP3Q
	FHhuy8x1XCnjuxtsiRVk33rDgkqzpLICJ4SPpd0yS/sUFuTGUrMni0pTtS4dugKJD4TN
	c8o+s4BljS5pLJdEq+wcyYwA9sl8DwgwyDkOYduQ+lBKXbWw6ll//qax+zg6hqubd/sf
	JGI0FsMH3XrmhR1EIS3jLylTD3dSdVFEZ2fTPPwTe1gncVB3QMyxXxId3D0QX2A6S6Dt
	gEaA==
X-Gm-Message-State: AOAM532f65h7WN6A5i4MQzO4oVrTSjxVdnm1xOrMizZzv2vhmOUUB7R3
	INAApBEGELzlTiipKKLdmhorkT9NF9xxJr/lWvk4sRvAwuCuAazzr49OvoRd9fxDDX58VlRoSF3
	rwwA+Ykj3dSS9f1GOLCzK
X-Received: by 2002:a05:6000:1005:: with SMTP id
	a5mr10320357wrx.425.1604921419107; 
	Mon, 09 Nov 2020 03:30:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfMfmWa9Cv9HNLSs0dLMrckBnIhQ+LX5gsNBfqeNBoHRKN7zV/cjWgtINNh6h724r5DlDOEA==
X-Received: by 2002:a05:6000:1005:: with SMTP id
	a5mr10320328wrx.425.1604921418961; 
	Mon, 09 Nov 2020 03:30:18 -0800 (PST)
Received: from redhat.com (bzq-79-181-34-244.red.bezeqint.net. [79.181.34.244])
	by smtp.gmail.com with ESMTPSA id
	35sm10972366wro.71.2020.11.09.03.30.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Nov 2020 03:30:17 -0800 (PST)
Date: Mon, 9 Nov 2020 06:30:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20201109063004-mutt-send-email-mst@kernel.org>
References: <20201106190337.1973127-1-hch@lst.de>
	<20201106190337.1973127-24-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20201106190337.1973127-24-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:23:02 +0100
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] [PATCH 23/24] virtio-blk: remove a spurious call to
 revalidate_disk_size
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

On Fri, Nov 06, 2020 at 08:03:35PM +0100, Christoph Hellwig wrote:
> revalidate_disk_size just updates the block device size from the disk
> size.  Thus calling it from revalidate_disk_size doesn't actually do
> anything.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/block/virtio_blk.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 3e812b4c32e669..145606dc52db1e 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -598,7 +598,6 @@ static void virtblk_update_cache_mode(struct virtio_device *vdev)
>  	struct virtio_blk *vblk = vdev->priv;
>  
>  	blk_queue_write_cache(vblk->disk->queue, writeback, false);
> -	revalidate_disk_size(vblk->disk, true);
>  }
>  
>  static const char *const virtblk_cache_types[] = {
> -- 
> 2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
