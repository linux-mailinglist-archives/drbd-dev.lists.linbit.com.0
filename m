Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 148332AB2DB
	for <lists+drbd-dev@lfdr.de>; Mon,  9 Nov 2020 09:53:46 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C8E334207A8;
	Mon,  9 Nov 2020 09:53:44 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF56F420209
	for <drbd-dev@lists.linbit.com>; Mon,  9 Nov 2020 09:53:42 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
	id AB71E6736F; Mon,  9 Nov 2020 09:53:40 +0100 (CET)
Date: Mon, 9 Nov 2020 09:53:40 +0100
From: Christoph Hellwig <hch@lst.de>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20201109085340.GB27483@lst.de>
References: <20201106190337.1973127-1-hch@lst.de>
	<20201106190337.1973127-4-hch@lst.de>
	<1d06cdfa-a904-30be-f3ec-08ae2fa85cbd@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d06cdfa-a904-30be-f3ec-08ae2fa85cbd@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com,
	linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org,
	Ilya Dryomov <idryomov@gmail.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-block@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-raid@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] [PATCH 03/24] nvme: let
 set_capacity_revalidate_and_notify update the bdev size
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

On Mon, Nov 09, 2020 at 08:53:58AM +0100, Hannes Reinecke wrote:
>> index 376096bfc54a83..4e86c9aafd88a7 100644
>> --- a/drivers/nvme/host/core.c
>> +++ b/drivers/nvme/host/core.c
>> @@ -2053,7 +2053,7 @@ static void nvme_update_disk_info(struct gendisk *disk,
>>   			capacity = 0;
>>   	}
>>   -	set_capacity_revalidate_and_notify(disk, capacity, false);
>> +	set_capacity_revalidate_and_notify(disk, capacity, true);
>>     	nvme_config_discard(disk, ns);
>>   	nvme_config_write_zeroes(disk, ns);
>> @@ -2136,7 +2136,6 @@ static int nvme_update_ns_info(struct nvme_ns *ns, struct nvme_id_ns *id)
>>   		blk_stack_limits(&ns->head->disk->queue->limits,
>>   				 &ns->queue->limits, 0);
>>   		blk_queue_update_readahead(ns->head->disk->queue);
>> -		nvme_update_bdev_size(ns->head->disk);
>>   		blk_mq_unfreeze_queue(ns->head->disk->queue);
>>   	}
>>   #endif
>
> Hold on.
> This, at the very least, should be a separate patch.
> With this you are changing the behaviour of nvme multipath.
>
> Originally nvme multipath would update/change the size of the multipath 
> device according to the underlying path devices.
> With this patch the size of the multipath device will _not_ change if there 
> is a change on the underlying devices.

Yes, it will.  Take a close look at nvme_update_disk_info and how it is
called.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
