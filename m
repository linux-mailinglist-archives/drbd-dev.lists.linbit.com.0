Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EE866E546
	for <lists+drbd-dev@lfdr.de>; Tue, 17 Jan 2023 18:52:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4496E420643;
	Tue, 17 Jan 2023 18:52:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8F7EC420319
	for <drbd-dev@lists.linbit.com>; Tue, 17 Jan 2023 18:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673977946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=7bhc0N8lOZgDifhC2frdOWe817b3omvaW/l36eahars=;
	b=EQEGpClgsYHZwoEPnXGAYhRdX8mIcl50fVr5aa21umkAzYAtHt/F4dnHc4EmCAyzumUpnH
	t10YmstzWd+epOs/enAgylNcL0a9WcjO9v0U7hGKuJmmcMe0djKJBYSICuyoogTuuxyzey
	Gsq414APb4EdXEhpIc5Z9o4GE2qyEv8=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
	[209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
	us-mta-360-FplARbRkOTaNFEOzRHx4DA-1; Tue, 17 Jan 2023 12:52:25 -0500
X-MC-Unique: FplARbRkOTaNFEOzRHx4DA-1
Received: by mail-qv1-f71.google.com with SMTP id
	df6-20020a056214080600b00534fe2ad5a3so3069595qvb.11
	for <drbd-dev@lists.linbit.com>; Tue, 17 Jan 2023 09:52:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=7bhc0N8lOZgDifhC2frdOWe817b3omvaW/l36eahars=;
	b=m2477aqU6doJzlfxllJSy7PBhq1s8XrO/yw/vyztGci6rq97OZl4o2acoWHaGZOkLW
	bUCPaHYfTxQJYlySofqDe2SCznBMuJC0wBABvF0Fjn4OIs+Xjjv4QzEm+2j9EbSCXH7a
	NSWXpE1FYxMD7W5kTbfPhefmagu61DUA0+Hrw+7mNY6DHzhqU8pfYx+lsfxg44p66bXR
	WL46K+YttzFI1r6pLFwrhXEGmH5MEGjI8KcIvN8gpR2gmblj8O9j9x3VAMSGxYD8+Sqv
	yRgGyBhgttB3YiBwjI+vVuCW06NFn2eHwx1zEqnjzqd7hK0tL3Rkexpxp7uQGytW74Zh
	tWhw==
X-Gm-Message-State: AFqh2kqcNwMo2kB03xc0CsY74ppGquguFwv5oos9iYhWgzbdH59OKrdX
	sP16H/LD2N/3X3vjRR54QP/2TNIITwlG65l9CAT1j3b9HwInr7j/j1xvytzQnlJEuuMfseRkVfj
	IGU8IUwSXhmqReKqJduo=
X-Received: by 2002:ac8:480a:0:b0:3ae:55ba:8392 with SMTP id
	g10-20020ac8480a000000b003ae55ba8392mr4862300qtq.32.1673977944875;
	Tue, 17 Jan 2023 09:52:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtgV1rHPprpYlV6nz/fDPisM7ofVJJ0FHk5YLTcA4e90viVYHPitevtt/bN1J4+T4+w8pQt7w==
X-Received: by 2002:ac8:480a:0:b0:3ae:55ba:8392 with SMTP id
	g10-20020ac8480a000000b003ae55ba8392mr4862262qtq.32.1673977944562;
	Tue, 17 Jan 2023 09:52:24 -0800 (PST)
Received: from localhost (pool-68-160-145-102.bstnma.fios.verizon.net.
	[68.160.145.102]) by smtp.gmail.com with ESMTPSA id
	x21-20020a05620a0b5500b0070688f60025sm2768704qkg.76.2023.01.17.09.52.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Jan 2023 09:52:24 -0800 (PST)
Date: Tue, 17 Jan 2023 12:52:22 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Gulam Mohamed <gulam.mohamed@oracle.com>
Message-ID: <Y8bgVh7HQx9jZWtF@redhat.com>
References: <20221221040506.1174644-1-gulam.mohamed@oracle.com>
	<20221221040506.1174644-2-gulam.mohamed@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20221221040506.1174644-2-gulam.mohamed@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: nvdimm@lists.linux.dev, shminderjit.singh@oracle.com,
	philipp.reisner@linbit.com, song@kernel.org, dm-devel@redhat.com,
	ira.weiny@intel.com, agk@redhat.com, drbd-dev@lists.linbit.com,
	dave.jiang@intel.com, senozhatsky@chromium.org,
	vishal.l.verma@intel.com, joe.jin@oracle.com,
	kent.overstreet@gmail.com, ngupta@vflare.org, kch@nvidia.com,
	konrad.wilk@oracle.com, snitzer@kernel.org, colyli@suse.de,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	dan.j.williams@intel.com, axboe@kernel.dk,
	linux-block@vger.kernel.org, martin.petersen@oracle.com,
	rajesh.sivaramasubramaniom@oracle.com, minchan@kernel.org,
	linux-kernel@vger.kernel.org, junxiao.bi@oracle.com,
	lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [PATCH for-6.2/block V3 2/2] block: Change the
 granularity of io ticks from ms to ns
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

[comments/questions inlined below]

On Tue, Dec 20 2022 at 11:05P -0500,
Gulam Mohamed <gulam.mohamed@oracle.com> wrote:

> Problem Desc
> ============
> The "iostat" user-space utility was showing %util as 100% for the disks
> which has latencies less than a milli-second i.e for latencies in the
> range of micro-seconds and below.
> 
> Root Cause
> ==========
> The IO accounting in block layer is currently done by updating the
> io_ticks in jiffies which is of milli-seconds granularity. Due to this,
> for the devices with IO latencies less than a milli-second, the latency
> will be accounted as 1 milli-second even-though its in the range of
> micro-seconds. This was causing the iostat command to show %util
> as 100% which is incorrect.
> 
> Recreationg of the issue
> ========================
> Setup
> -----
> Devices: NVMe 24 devices
> Model number: 4610 (Intel)
> 
> fio
> ---
> [global]
> bs=4K
> iodepth=1
> direct=1
> ioengine=libaio
> group_reporting
> time_based
> runtime=100
> thinktime=1ms
> numjobs=1
> name=raw-write
> rw=randrw
> ignore_error=EIO:EIO
> [job1]
> filename=/dev/nvme0n1
> 
> iostat o/p
> ----------
> 
> Device   %wrqm r_await w_await aqu-sz rareq-sz wareq-sz  svctm  %util
> nvme3n1   0.00    0.05    0.00  75.38     0.50     0.00   0.00 100.00
> 
> Device   %wrqm r_await w_await aqu-sz rareq-sz wareq-sz  svctm  %util
> nvme3n1   0.00    0.05    0.00  74.74     0.50     0.00   0.00 100.00
> 
> Solution
> ========
> Use ktime_get_ns() to update the disk_stats io_ticks so that the io_ticks
> are updated for every io start and end times.
> 
> Issues using ktime
> ==================
> 
> Using ktime_get_ns() has a performance overhead as ktime will go ahead
> and reads the clock everytime its called. Following test environment
> was used by Jens Axboe on which t/io_uring was run which has shown a
> high performance drop.
> 
> Devices
> -------
> SSDs: P5800X
> No of devices: 24
> 
> io_uring config
> ---------------
> Polled IO
> iostats: Enabled
> Reads: Random
> Block Size: 512
> QDepth: 128
> Batch Submit: 32
> Batch Complete: 32
> No of Threads: 24
> 
> With the above environment and ktime patch, it has shown a performance
> drop of ~25% from iostats disabled and ~19% performance drop from current
> iostats enabled. This performance drop is high.
> 
> Suggestion from Jens Axboe
> ==========================
> Jens Axboe suggested to split the bigger patch into two as follows:
> 
> 1. In first patch, change all the types from unsigned long to u64, that
>    can be done while retaining jiffies.
> 
> 2. In second patch, add an iostats == 2 setting, which enables the higher
>    resolution mode using ktime. We'd still default to 1, lower granularity
>    iostats enabled.
> 
> Fix details
> ===========
> 1. Use ktime_get_ns() to get the current nano-seconds to update the
>    io_ticks for start and end time stamps in block layer for io accounting
> 
> 2. Create a new setting '2' in sysfs for iostats variable i.e for
>    /sys/block/<device-name>/queue/iostats, to enable the iostat (io
>    accounting) with nano-seconds (using ktime) granularity. This setting
>    should be enabled only if the iostat is needed with high resolution
>    mode as it has a high performance drop
> 
> 3. Earlier available settings were 0 and 1 for disable and enable io
>    accounting with milli-seconds granularity (jiffies)
> 
> Testing
> =======
> Ran the t/io_uring command with following setup:
> 
> Devices
> -------
> SSDs: P4610
> No of devices: 8
> 
> io_uring config
> ---------------
> Polled IO
> iostats: Enabled
> Reads: Random
> Block Size: 512
> QDepth: 128
> Batch Submit: 32
> Batch Complete: 32
> No of Threads: 24
> 
> io_uring o/p
> ------------
> iostat=0, with patch: Maximum IOPS=10.09M
> iostat=1, with patch: Maximum IOPS=9.84M
> iostat=2, with patch: Maximum IOPS=9.48M
> 
> Changes from V2 to V3
> =====================
> 1. Changed all the required variables data-type to u64 as a first patch
> 2. Create a new setting '2' for iostats in sysfs in this patch
> 3. Change the code to get the ktime values when iostat=2, in this patch
> 
> Signed-off-by: Gulam Mohamed <gulam.mohamed@oracle.com>
> ---
>  block/blk-core.c                  | 26 +++++++++++++++++----
>  block/blk-mq.c                    |  4 ++--
>  block/blk-sysfs.c                 | 39 ++++++++++++++++++++++++++++++-
>  block/genhd.c                     | 18 ++++++++++----
>  drivers/block/drbd/drbd_debugfs.c | 12 ++++++++--
>  drivers/block/zram/zram_drv.c     |  3 ++-
>  drivers/md/dm.c                   | 13 +++++++++--
>  include/linux/blkdev.h            |  4 ++++
>  8 files changed, 103 insertions(+), 16 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 5670032fe932..0b5e4eb909a5 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -927,6 +927,18 @@ int iocb_bio_iopoll(struct kiocb *kiocb, struct io_comp_batch *iob,
>  }
>  EXPORT_SYMBOL_GPL(iocb_bio_iopoll);
>  
> +/*
> + * Get the time based upon the available granularity for io accounting
> + * If the resolution mode is set to precise (2) i.e
> + * (/sys/block/<device>/queue/iostats = 2), then this will return time
> + * in nano-seconds else this will return time in jiffies
> + */
> +u64  blk_get_iostat_ticks(struct request_queue *q)
> +{
> +       return (blk_queue_precise_io_stat(q) ? ktime_get_ns() : jiffies);
> +}
> +EXPORT_SYMBOL_GPL(blk_get_iostat_ticks);
> +

Would prefer to see blk_get_iostat_ticks tagged with 'static inline'
and moved to blkdev.h (obviously below blk_queue_precise_io_stat).

Also, just a general comment: I've historically been a bigger (ab)user
of jump_labels to avoid excess branching costs per IO, e.g. see commit
442761fd2b29 ("dm: conditionally enable branching for less used features").
It could be there is an opportunity for a follow-on patch that
leverages them?  Or should that just be left to each driver to decide
to do with its own resources (rather than have block core provide that)?

(if nothing in the system ever uses QUEUE_FLAG_PRECISE_IO_STAT then
it'd be nice to avoid needless branching).

<snip>

> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 011a85ea40da..1bb58a0b8cd1 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -482,7 +482,11 @@ static int dm_blk_ioctl(struct block_device *bdev, fmode_t mode,
>  
>  u64 dm_start_time_ns_from_clone(struct bio *bio)
>  {
> -	return jiffies_to_nsecs(clone_to_tio(bio)->io->start_time);
> +	struct request_queue *q = bdev_get_queue(bio->bi_bdev);
> +	u64 start_time_ns = (blk_queue_precise_io_stat(q) ?
> +				clone_to_tio(bio)->io->start_time :
> +				jiffies_to_nsecs(clone_to_tio(bio)->io->start_time));
> +	return start_time_ns;
>  }
>  EXPORT_SYMBOL_GPL(dm_start_time_ns_from_clone);
>  
> @@ -498,6 +502,11 @@ static void dm_io_acct(struct dm_io *io, bool end)
>  	struct mapped_device *md = io->md;
>  	struct bio *bio = io->orig_bio;
>  	unsigned int sectors;
> +	struct request_queue *q = bdev_get_queue(bio->bi_bdev);
> +
> +	u64 start_time = (blk_queue_precise_io_stat(q) ?
> +				nsecs_to_jiffies(io->start_time) :
> +				io->start_time);
>  
>  	/*
>  	 * If REQ_PREFLUSH set, don't account payload, it will be
> @@ -589,7 +598,7 @@ static struct dm_io *alloc_io(struct mapped_device *md, struct bio *bio)
>  	io->orig_bio = bio;
>  	io->md = md;
>  	spin_lock_init(&io->lock);
> -	io->start_time = jiffies;
> +	io->start_time = blk_get_iostat_ticks(bio->bi_bdev->bd_queue);
>  	io->flags = 0;
>  
>  	if (static_branch_unlikely(&stats_enabled))

The above seems correct, by checking the top-level DM device's
disposition on QUEUE_FLAG_PRECISE_IO_STAT, but I'm now wondering
if there should be code that ensures consistency across stacked
devices (which DM is the biggest creator/consumer of)?

dm_table_set_restrictions() deals with such inconsistencies at DM
device creation time (so basically: if any device in the DM table has
QUEUE_FLAG_PRECISE_IO_STAT set then the top-level DM device should
inherit that queue flag). A user could still override it but at least
the default will be sane initially.

Mike

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
