Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2CA4AEFC3
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 12:11:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3A60642094A;
	Wed,  9 Feb 2022 12:11:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 552 seconds by postgrey-1.31 at mail19;
	Wed, 09 Feb 2022 10:15:01 CET
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 185CB4205EC
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 10:15:00 +0100 (CET)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
	include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1644397546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=rlSA805MDoryKB/tu0n68xmri81ZVnikvMPprm9yUto=;
	b=Grb1TyxI/KSzMSO/uCDZoh1l3iFPdrVJPrDJEsRzecMlpmti4wOxBBtSYTxEsxlaOwuclW
	vbVdsJUJaIL2bX8s7BQmCfaaP5KyF2jqIgvgeK54HvEkM9+vQ1BbgwmUWSQfuFqyE7XlPY
	nizP91gfFOyMZS4rqEQk+ZfFthatGN4=
From: Guoqing Jiang <guoqing.jiang@linux.dev>
To: Christoph Hellwig <hch@lst.de>, axboe@kernel.dk,
	martin.petersen@oracle.com, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, target-devel@vger.kernel.org,
	haris.iqbal@ionos.com, jinpu.wang@ionos.com, manoj@linux.ibm.com,
	mrochs@linux.ibm.com, ukrishn@linux.ibm.com
References: <20220209082828.2629273-1-hch@lst.de>
	<20220209082828.2629273-4-hch@lst.de>
Message-ID: <4f1565b2-0f83-0cfa-58bd-86d5dee48e51@linux.dev>
Date: Wed, 9 Feb 2022 17:05:36 +0800
MIME-Version: 1.0
In-Reply-To: <20220209082828.2629273-4-hch@lst.de>
Content-Language: en-US
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Mailman-Approved-At: Wed, 09 Feb 2022 12:11:25 +0100
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, drbd-dev@lists.linbit.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com



On 2/9/22 4:28 PM, Christoph Hellwig wrote:
> REQ_OP_WRITE_SAME was only ever submitted by the legacy Linux zeroing
> code, which has switched to use REQ_OP_WRITE_ZEROES long before rnbd was
> even merged.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> ---
>   drivers/block/rnbd/rnbd-clt.c   | 7 ++-----
>   drivers/block/rnbd/rnbd-clt.h   | 1 -
>   drivers/block/rnbd/rnbd-proto.h | 6 ------
>   drivers/block/rnbd/rnbd-srv.c   | 3 +--
>   4 files changed, 3 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.c
> index c08971de369fc..dc192d2738854 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -82,7 +82,6 @@ static int rnbd_clt_set_dev_attr(struct rnbd_clt_dev *dev,
>   	dev->nsectors		    = le64_to_cpu(rsp->nsectors);
>   	dev->logical_block_size	    = le16_to_cpu(rsp->logical_block_size);
>   	dev->physical_block_size    = le16_to_cpu(rsp->physical_block_size);
> -	dev->max_write_same_sectors = le32_to_cpu(rsp->max_write_same_sectors);
>   	dev->max_discard_sectors    = le32_to_cpu(rsp->max_discard_sectors);
>   	dev->discard_granularity    = le32_to_cpu(rsp->discard_granularity);
>   	dev->discard_alignment	    = le32_to_cpu(rsp->discard_alignment);
> @@ -1359,8 +1358,6 @@ static void setup_request_queue(struct rnbd_clt_dev *dev)
>   	blk_queue_logical_block_size(dev->queue, dev->logical_block_size);
>   	blk_queue_physical_block_size(dev->queue, dev->physical_block_size);
>   	blk_queue_max_hw_sectors(dev->queue, dev->max_hw_sectors);
> -	blk_queue_max_write_same_sectors(dev->queue,
> -					 dev->max_write_same_sectors);
>   
>   	/*
>   	 * we don't support discards to "discontiguous" segments
> @@ -1610,10 +1607,10 @@ struct rnbd_clt_dev *rnbd_clt_map_device(const char *sessname,
>   	}
>   
>   	rnbd_clt_info(dev,
> -		       "map_device: Device mapped as %s (nsectors: %zu, logical_block_size: %d, physical_block_size: %d, max_write_same_sectors: %d, max_discard_sectors: %d, discard_granularity: %d, discard_alignment: %d, secure_discard: %d, max_segments: %d, max_hw_sectors: %d, rotational: %d, wc: %d, fua: %d)\n",
> +		       "map_device: Device mapped as %s (nsectors: %zu, logical_block_size: %d, physical_block_size: %d, max_discard_sectors: %d, discard_granularity: %d, discard_alignment: %d, secure_discard: %d, max_segments: %d, max_hw_sectors: %d, rotational: %d, wc: %d, fua: %d)\n",
>   		       dev->gd->disk_name, dev->nsectors,
>   		       dev->logical_block_size, dev->physical_block_size,
> -		       dev->max_write_same_sectors, dev->max_discard_sectors,
> +		       dev->max_discard_sectors,
>   		       dev->discard_granularity, dev->discard_alignment,
>   		       dev->secure_discard, dev->max_segments,
>   		       dev->max_hw_sectors, dev->rotational, dev->wc, dev->fua);
> diff --git a/drivers/block/rnbd/rnbd-clt.h b/drivers/block/rnbd/rnbd-clt.h
> index 0c2cae7f39b9f..6946ba23d62e5 100644
> --- a/drivers/block/rnbd/rnbd-clt.h
> +++ b/drivers/block/rnbd/rnbd-clt.h
> @@ -122,7 +122,6 @@ struct rnbd_clt_dev {
>   	bool			wc;
>   	bool			fua;
>   	u32			max_hw_sectors;
> -	u32			max_write_same_sectors;
>   	u32			max_discard_sectors;
>   	u32			discard_granularity;
>   	u32			discard_alignment;

I am planning to remove more members inside struct rnbd_clt_dev.

> diff --git a/drivers/block/rnbd/rnbd-proto.h b/drivers/block/rnbd/rnbd-proto.h
> index de5d5a8df81d7..3eb8b34bd1886 100644
> --- a/drivers/block/rnbd/rnbd-proto.h
> +++ b/drivers/block/rnbd/rnbd-proto.h
> @@ -249,9 +249,6 @@ static inline u32 rnbd_to_bio_flags(u32 rnbd_opf)
>   	case RNBD_OP_SECURE_ERASE:
>   		bio_opf = REQ_OP_SECURE_ERASE;
>   		break;
> -	case RNBD_OP_WRITE_SAME:
> -		bio_opf = REQ_OP_WRITE_SAME;
> -		break;
>   	default:
>   		WARN(1, "Unknown RNBD type: %d (flags %d)\n",
>   		     rnbd_op(rnbd_opf), rnbd_opf);
> @@ -284,9 +281,6 @@ static inline u32 rq_to_rnbd_flags(struct request *rq)
>   	case REQ_OP_SECURE_ERASE:
>   		rnbd_opf = RNBD_OP_SECURE_ERASE;
>   		break;
> -	case REQ_OP_WRITE_SAME:
> -		rnbd_opf = RNBD_OP_WRITE_SAME;
> -		break;
>   	case REQ_OP_FLUSH:
>   		rnbd_opf = RNBD_OP_FLUSH;
>   		break;
> diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
> index 132e950685d59..0e6b5687f8321 100644
> --- a/drivers/block/rnbd/rnbd-srv.c
> +++ b/drivers/block/rnbd/rnbd-srv.c
> @@ -548,8 +548,7 @@ static void rnbd_srv_fill_msg_open_rsp(struct rnbd_msg_open_rsp *rsp,
>   		cpu_to_le16(rnbd_dev_get_max_segs(rnbd_dev));
>   	rsp->max_hw_sectors =
>   		cpu_to_le32(rnbd_dev_get_max_hw_sects(rnbd_dev));
> -	rsp->max_write_same_sectors =
> -		cpu_to_le32(bdev_write_same(rnbd_dev->bdev));
> +	rsp->max_write_same_sectors = 0;

IIUC, I think we can delete max_write_same_sectors from rsp as well given
the earlier change in setup_request_queue and rnbd_clt_set_dev_attr.

Thanks,
Guoqing
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
