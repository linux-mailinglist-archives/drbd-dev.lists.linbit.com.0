Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB84AEF15
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 11:16:26 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D539B420660;
	Wed,  9 Feb 2022 11:16:25 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
	[209.85.208.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2864420633
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 11:16:24 +0100 (CET)
Received: by mail-ed1-f47.google.com with SMTP id co28so4093038edb.1
	for <drbd-dev@lists.linbit.com>; Wed, 09 Feb 2022 02:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rAKZIFdP28Fau+cOOS9z/0N05/8YiKE8+fxfg8uPyQs=;
	b=YWFqKgZ5ycvsDpd3Js/maaKkL2iEOs7pq1F8qJxkGIxo554G77WEA3/MnBXGdZJ6cn
	S2zOBOKx2p0k6E6nCOGXvUgDHDjckUkdsO4MClCKJRSd3vUEvBl9BHCq4d2KVMB0z23Z
	IYoRQl6Lk58wTLjKRX4ZrVQDstZv2FRuv/uE8mIqPKq99yhwX2LqDrlnQeID6q2GFd1t
	ZgeDSV93cGgQ7/h+xJiGltXLWpkmouQSRZbU1/qqhYmJtIgsKdWYhOA3i7ZoJHPWk4xD
	2xq5lbDdRmAT1Sll/JVr7RWWPBhG/RiI1a3mymQOP2l96/ar+llCZ8IUt2uMw5fBIecl
	b0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rAKZIFdP28Fau+cOOS9z/0N05/8YiKE8+fxfg8uPyQs=;
	b=V+zzz3g3jLNzCemBkThoDDACrS8O4YsNTX6je4qgSlYaRvA9/rIIHV/xJXM+PhDV+I
	srVsaKtzCps4f22nlfn6+xBUdGgDb6E8YDQwTnq9RpEJZBy1S31IqZCDdsvBx9Pw/gbG
	QHcidTle41cSsXvWBWcjQnjLk0m9NdSBZH92inWhYqMaaNaLlasjc68Nnz71eat8T3W7
	7hArqnw35HWCqz5pPF4pqdALB8Qsuy0Xyw7Tow0pgbZjhtyd91cg7LvMzw1QN95IHM4/
	V1YR8Z/iccW/PMgHKXZufbYbJQ59mzY0Z6doM9uIm9aRGVT6sRD3QJwn4KQRofy3Dvz9
	vrkA==
X-Gm-Message-State: AOAM533l2/QQrnx92br23vRMVktH8re2hEwZcf3lyZMzaPcPIE1EmR4C
	ExJofuHRnSFNmwgvnYG1ISKhW3T/5VGMt53p1cJdJA==
X-Google-Smtp-Source: ABdhPJyJl1H6BhQtX6vwv0TWGp6atpb+7BMBNRgisc9vY7m9y/rdk2zMRqBceAy/KYQ8UAkhYC65Cf47LU0RO5V0mS4=
X-Received: by 2002:a05:6402:2916:: with SMTP id
	ee22mr1661883edb.3.1644401784309; 
	Wed, 09 Feb 2022 02:16:24 -0800 (PST)
MIME-Version: 1.0
References: <20220209082828.2629273-1-hch@lst.de>
	<20220209082828.2629273-4-hch@lst.de>
In-Reply-To: <20220209082828.2629273-4-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 9 Feb 2022 11:16:13 +0100
Message-ID: <CAMGffE=GMYNsw+mDt1h-BDh3JXkdrP9v2AUF7z0xE7jkumM+RQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: axboe@kernel.dk, manoj@linux.ibm.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, haris.iqbal@ionos.com,
	ukrishn@linux.ibm.com, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com, mrochs@linux.ibm.com
Subject: Re: [Drbd-dev] [PATCH 3/7] rnbd: drop WRITE_SAME support
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

Hi Christoph,


On Wed, Feb 9, 2022 at 9:28 AM Christoph Hellwig <hch@lst.de> wrote:
>
> REQ_OP_WRITE_SAME was only ever submitted by the legacy Linux zeroing
> code, which has switched to use REQ_OP_WRITE_ZEROES long before rnbd was
> even merged.

Do you think if it makes sense to instead of removing
REQ_OP_WRITE_SAME, simply convert it to REQ_OP_WRITE_ZEROES?

Thanks!
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rnbd/rnbd-clt.c   | 7 ++-----
>  drivers/block/rnbd/rnbd-clt.h   | 1 -
>  drivers/block/rnbd/rnbd-proto.h | 6 ------
>  drivers/block/rnbd/rnbd-srv.c   | 3 +--
>  4 files changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> index c08971de369fc..dc192d2738854 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -82,7 +82,6 @@ static int rnbd_clt_set_dev_attr(struct rnbd_clt_dev *dev,
>         dev->nsectors               = le64_to_cpu(rsp->nsectors);
>         dev->logical_block_size     = le16_to_cpu(rsp->logical_block_size);
>         dev->physical_block_size    = le16_to_cpu(rsp->physical_block_size);
> -       dev->max_write_same_sectors = le32_to_cpu(rsp->max_write_same_sectors);
>         dev->max_discard_sectors    = le32_to_cpu(rsp->max_discard_sectors);
>         dev->discard_granularity    = le32_to_cpu(rsp->discard_granularity);
>         dev->discard_alignment      = le32_to_cpu(rsp->discard_alignment);
> @@ -1359,8 +1358,6 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
>         blk_queue_logical_block_size(dev->queue, dev->logical_block_size);
>         blk_queue_physical_block_size(dev->queue, dev->physical_block_size);
>         blk_queue_max_hw_sectors(dev->queue, dev->max_hw_sectors);
> -       blk_queue_max_write_same_sectors(dev->queue,
> -                                        dev->max_write_same_sectors);
>
>         /*
>          * we don't support discards to "discontiguous" segments
> @@ -1610,10 +1607,10 @@ struct rnbd_clt_dev *rnbd_clt_map_device(const char *sessname,
>         }
>
>         rnbd_clt_info(dev,
> -                      "map_device: Device mapped as %s (nsectors: %zu, logical_block_size: %d, physical_block_size: %d, max_write_same_sectors: %d, max_discard_sectors: %d, discard_granularity: %d, discard_alignment: %d, secure_discard: %d, max_segments: %d, max_hw_sectors: %d, rotational: %d, wc: %d, fua: %d)\n",
> +                      "map_device: Device mapped as %s (nsectors: %zu, logical_block_size: %d, physical_block_size: %d, max_discard_sectors: %d, discard_granularity: %d, discard_alignment: %d, secure_discard: %d, max_segments: %d, max_hw_sectors: %d, rotational: %d, wc: %d, fua: %d)\n",
>                        dev->gd->disk_name, dev->nsectors,
>                        dev->logical_block_size, dev->physical_block_size,
> -                      dev->max_write_same_sectors, dev->max_discard_sectors,
> +                      dev->max_discard_sectors,
>                        dev->discard_granularity, dev->discard_alignment,
>                        dev->secure_discard, dev->max_segments,
>                        dev->max_hw_sectors, dev->rotational, dev->wc, dev->fua);
> diff --git a/drivers/block/rnbd/rnbd-clt.h b/drivers/block/rnbd/rnbd-clt.h
> index 0c2cae7f39b9f..6946ba23d62e5 100644
> --- a/drivers/block/rnbd/rnbd-clt.h
> +++ b/drivers/block/rnbd/rnbd-clt.h
> @@ -122,7 +122,6 @@ struct rnbd_clt_dev {
>         bool                    wc;
>         bool                    fua;
>         u32                     max_hw_sectors;
> -       u32                     max_write_same_sectors;
>         u32                     max_discard_sectors;
>         u32                     discard_granularity;
>         u32                     discard_alignment;
> diff --git a/drivers/block/rnbd/rnbd-proto.h b/drivers/block/rnbd/rnbd-proto.h
> index de5d5a8df81d7..3eb8b34bd1886 100644
> --- a/drivers/block/rnbd/rnbd-proto.h
> +++ b/drivers/block/rnbd/rnbd-proto.h
> @@ -249,9 +249,6 @@ static inline u32 rnbd_to_bio_flags(u32 rnbd_opf)
>         case RNBD_OP_SECURE_ERASE:
>                 bio_opf = REQ_OP_SECURE_ERASE;
>                 break;
> -       case RNBD_OP_WRITE_SAME:
> -               bio_opf = REQ_OP_WRITE_SAME;
> -               break;
>         default:
>                 WARN(1, "Unknown RNBD type: %d (flags %d)\n",
>                      rnbd_op(rnbd_opf), rnbd_opf);
> @@ -284,9 +281,6 @@ static inline u32 rq_to_rnbd_flags(struct request *rq)
>         case REQ_OP_SECURE_ERASE:
>                 rnbd_opf = RNBD_OP_SECURE_ERASE;
>                 break;
> -       case REQ_OP_WRITE_SAME:
> -               rnbd_opf = RNBD_OP_WRITE_SAME;
> -               break;
>         case REQ_OP_FLUSH:
>                 rnbd_opf = RNBD_OP_FLUSH;
>                 break;
> diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
> index 132e950685d59..0e6b5687f8321 100644
> --- a/drivers/block/rnbd/rnbd-srv.c
> +++ b/drivers/block/rnbd/rnbd-srv.c
> @@ -548,8 +548,7 @@ static void rnbd_srv_fill_msg_open_rsp(struct rnbd_msg_open_rsp *rsp,
>                 cpu_to_le16(rnbd_dev_get_max_segs(rnbd_dev));
>         rsp->max_hw_sectors =
>                 cpu_to_le32(rnbd_dev_get_max_hw_sects(rnbd_dev));
> -       rsp->max_write_same_sectors =
> -               cpu_to_le32(bdev_write_same(rnbd_dev->bdev));
> +       rsp->max_write_same_sectors = 0;
>         rsp->max_discard_sectors =
>                 cpu_to_le32(rnbd_dev_get_max_discard_sects(rnbd_dev));
>         rsp->discard_granularity =
> --
> 2.30.2
>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
