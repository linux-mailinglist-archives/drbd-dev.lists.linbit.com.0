Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 563C047214C
	for <lists+drbd-dev@lfdr.de>; Mon, 13 Dec 2021 08:03:52 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 36B6842096A;
	Mon, 13 Dec 2021 08:03:47 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 427 seconds by postgrey-1.31 at mail19;
	Fri, 10 Dec 2021 08:24:24 CET
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 83A16420602
	for <drbd-dev@lists.linbit.com>; Fri, 10 Dec 2021 08:24:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1639121065; x=1670657065;
	h=message-id:date:mime-version:subject:to:cc:references:
	from:in-reply-to:content-transfer-encoding;
	bh=7FfogzDJZyAmmUkEN16snEUFpH3F6ooonfvy8tAEA4w=;
	b=jpWEb0OF8vQe1ZAI0/tkNx1dgaO8aZfOXpS4oTA7sllAsHaxNiumz2NH
	Is+/c6UtimQzrhLkWOCMW4GlsljYYtaocqUz9JJsYpV6Ro4XITxrt2LLo
	krN6baXe/P6mfoHxiYBgMWTT7S/wHOkjIXUse8/jMuGlYE7pMQFxVlHaM
	TKCbGzKeQlCWwNemlRjxBVckOcpy0uRwqy0TXj7U65DjiOfbr+0fx4TpX
	fYbQiQnPFrDteBHNMdIYdI0mN4T8eoMcr16SwnM4r4aTOwNU+9uE4p0TE
	trfP9NLmf3hB0inRMR+nJ0ce6lyFZ66FD4sREtA7GTee5Qy6UxZ9Xg2aO w==;
X-IronPort-AV: E=Sophos;i="5.88,194,1635177600"; d="scan'208";a="188927547"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2021 15:17:17 +0800
IronPort-SDR: 9lyIt9Vl++Atho4jQpEy2JBQpwK7TqXs5awuzxdlv0eXfM46pfkdziP2y74azq7X+qPEEES2Be
	DMnEIewTwo3riluaYVQwzH/Vx77a5QVyU4+Dtb/eMqDntRX3I5Gdy0t1xJM1jOiK09pUbyqgh+
	JLReYg+vR4cbqk9bjwJ6hMBDY4wJsEJmQjzz4kIiABteaN/ljJwhx0OJrmn4a7s0V7nX2Qgahj
	6ERZnMHWdBWdvzF2fapmyli2rQCTDIGsSQ/XFkU/pISbj9mALvfQCtaw9ILcjUMNmdpkWAg8qf
	t+XgPWBS70GKNwOCoNgEa33o
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Dec 2021 22:50:18 -0800
IronPort-SDR: WUS8ahFbZnWgxLdvcIKagmKTJj8On6lPg1rHz2PQYzvh8w0h1eA2rP/BB/bfiUt2dQK6OvrSDw
	g/wdEg+NJCunzn8Btr4WAEIcfwM+aLmroZG657BUbloOId5GkWzW5GIfCqFIEZzZSQy9yiVCL7
	XYs1DQCNpKM+c/MpgWgQ8zzzt1MWf09VtOifqX6vgq3Y5oJBs4BhKm0HKygp6MIELtTGBb9E6J
	v2h1ESpdFeCcIKgyn5tt9lSKVH5qxYjpP1kWqWAeKETjtYytAvw5Vjc19xEtytwJbSMtxjk6Sy
	IpA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
	by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Dec 2021 23:17:16 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4J9Mfg1TDNz1Rvlf
	for <drbd-dev@lists.linbit.com>; Thu,  9 Dec 2021 23:17:15 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1639120633; x=1641712634; bh=7FfogzDJZyAmmUkEN16snEUFpH3F6ooonfv
	y8tAEA4w=; b=DEdszg/WHJbXKfrQKjjoN01y20bcBLrJZnb5682pFeLeuHXIyB2
	VE6lfSRUIspRwO7LZxrMKbfFcuRHjC2/Msa9pE1B1hU3xbq+G/V6M2XbojJdImg8
	4WSoJrvkob6LtrZk21HTsXZAdf/kMztg2q2mcocvmGQD98xvPmGSDpthu/GQhPBz
	LZqQsxGA7p9yEUTLpYbuQSQ0hEz9WTqBgxvSLAPwd42tESWlStLZtP3lqVpfr3Yk
	8k93WvlWDN4pE00v0DVt997deRZCjXivVKk6oxZo+pFRBPe9lQ6mos3y94LXc/kC
	6QrJWEUFRrdOTcT07el8mZi6eONZ4TFDJfw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	(amavisd-new, port 10026)
	with ESMTP id gMF1q1yawnBT for <drbd-dev@lists.linbit.com>;
	Thu,  9 Dec 2021 23:17:13 -0800 (PST)
Received: from [10.225.54.48] (unknown [10.225.54.48])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4J9MfZ5t1Pz1RtVG;
	Thu,  9 Dec 2021 23:17:10 -0800 (PST)
Message-ID: <78032c30-3676-e772-bc8e-b9f00a652ce8@opensource.wdc.com>
Date: Fri, 10 Dec 2021 16:17:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
	Gecko/20100101 Thunderbird/91.4.0
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Li Jinlin <lijinlin3@huawei.com>,
	song@kernel.org, philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
	axboe@kernel.dk, jack@suse.cz, ming.lei@redhat.com, tj@kernel.org,
	mcgrof@kernel.org, mcroce@microsoft.com
References: <20211210051707.2202646-1-lijinlin3@huawei.com>
	<20211210051707.2202646-2-lijinlin3@huawei.com>
	<e9b03c2a-b1f6-e083-3a2b-bf1478628f31@suse.de>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital
In-Reply-To: <e9b03c2a-b1f6-e083-3a2b-bf1478628f31@suse.de>
X-Mailman-Approved-At: Mon, 13 Dec 2021 08:03:45 +0100
Cc: linux-raid@vger.kernel.org, linux-block@vger.kernel.org,
	linfeilong@huawei.com, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2 1/3] md: Fix undefined behaviour in
	is_mddev_idle
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

On 2021/12/10 15:45, Hannes Reinecke wrote:
> On 12/10/21 6:17 AM, Li Jinlin wrote:
>> UBSAN reports this problem:
>>
>> [ 5984.281385] UBSAN: Undefined behaviour in drivers/md/md.c:8175:15
>> [ 5984.281390] signed integer overflow:
>> [ 5984.281393] -2147483291 - 2072033152 cannot be represented in type 'int'
>> [ 5984.281400] CPU: 25 PID: 1854 Comm: md101_resync Kdump: loaded Not tainted 4.19.90
>> [ 5984.281404] Hardware name: Huawei TaiShan 200 (Model 5280)/BC82AMDDA
>> [ 5984.281406] Call trace:
>> [ 5984.281415]  dump_backtrace+0x0/0x310
>> [ 5984.281418]  show_stack+0x28/0x38
>> [ 5984.281425]  dump_stack+0xec/0x15c
>> [ 5984.281430]  ubsan_epilogue+0x18/0x84
>> [ 5984.281434]  handle_overflow+0x14c/0x19c
>> [ 5984.281439]  __ubsan_handle_sub_overflow+0x34/0x44
>> [ 5984.281445]  is_mddev_idle+0x338/0x3d8
>> [ 5984.281449]  md_do_sync+0x1bb8/0x1cf8
>> [ 5984.281452]  md_thread+0x220/0x288
>> [ 5984.281457]  kthread+0x1d8/0x1e0
>> [ 5984.281461]  ret_from_fork+0x10/0x18
>>
>> When the stat aacum of the disk is greater than INT_MAX, its
>> value becomes negative after casting to 'int', which may lead
>> to overflow after subtracting a positive number. In the same
>> way, when the value of sync_io is greater than INT_MAX,
>> overflow may also occur. These situations will lead to
>> undefined behavior.
>>
>> Otherwise, if the stat accum of the disk is close to INT_MAX
>> when creating raid arrays, the initial value of last_events
>> would be set close to INT_MAX when mddev initializes IO
>> event counters. 'curr_events - rdev->last_events > 64' will
>> always false during synchronization. If all the disks of mddev
>> are in this case, is_mddev_idle() will always return 1, which
>> may cause non-sync IO is very slow.
>>
>> To address these problems, need to use 64bit signed integer
>> type for sync_io, last_events, and curr_events.
>>
>> In all the drivers that come with the kernel, the sync_io
>> variable in struct gendisk is only used for the md driver
>> currently. It should be more suitable in struct md_rdev, so
>> add the sync_io variable in struct md_rdev, and use it to
>> replace. We modify md_sync_acct() and md_sync_acct_bio()
>> to fit for this change as well. md_sync_acct_bio() need
>> access to the rdev, so we set bio->bi_bdev to rdev before
>> calling it, and reset bio->bi_bdev to bdev in this function.
>>
> Please make that two patches, one for moving sync_io and one for
> fixing the undefined behaviour.
> 
>> Signed-off-by: Li Jinlin <lijinlin3@huawei.com>
>> ---
>>   drivers/md/md.c       |  6 +++---
>>   drivers/md/md.h       | 13 +++++++++----
>>   drivers/md/raid1.c    |  4 ++--
>>   drivers/md/raid10.c   | 24 ++++++++++++------------
>>   drivers/md/raid5.c    |  4 ++--
>>   include/linux/genhd.h |  1 -
>>   6 files changed, 28 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/md/md.c b/drivers/md/md.c
>> index 5111ed966947..f1b71a92801e 100644
>> --- a/drivers/md/md.c
>> +++ b/drivers/md/md.c
>> @@ -8429,14 +8429,14 @@ static int is_mddev_idle(struct mddev *mddev, int init)
>>   {
>>   	struct md_rdev *rdev;
>>   	int idle;
>> -	int curr_events;
>> +	s64 curr_events;
>>   
>>   	idle = 1;
>>   	rcu_read_lock();
>>   	rdev_for_each_rcu(rdev, mddev) {
>>   		struct gendisk *disk = rdev->bdev->bd_disk;
>> -		curr_events = (int)part_stat_read_accum(disk->part0, sectors) -
>> -			      atomic_read(&disk->sync_io);
>> +		curr_events = (s64)part_stat_read_accum(disk->part0, sectors) -
>> +			      atomic64_read(&rdev->sync_io);
> 
> So you are replacing a 'signed integer' (ie 32bit) calculation with a 
> 'signed 64-bit integer' calculation.
> IE you just shifted the overflow from INT_MAX to LONG_MAX, without 
> actually fixing it, or?
> 
>>   		/* sync IO will cause sync_io to increase before the disk_stats
>>   		 * as sync_io is counted when a request starts, and
>>   		 * disk_stats is counted when it completes.
>> diff --git a/drivers/md/md.h b/drivers/md/md.h
>> index 53ea7a6961de..584e357e0940 100644
>> --- a/drivers/md/md.h
>> +++ b/drivers/md/md.h
>> @@ -50,7 +50,7 @@ struct md_rdev {
>>   
>>   	sector_t sectors;		/* Device size (in 512bytes sectors) */
>>   	struct mddev *mddev;		/* RAID array if running */
>> -	int last_events;		/* IO event timestamp */
>> +	s64 last_events;		/* IO event timestamp */
>>   
>>   	/*
>>   	 * If meta_bdev is non-NULL, it means that a separate device is
>> @@ -138,6 +138,8 @@ struct md_rdev {
>>   		unsigned int size;	/* Size in sectors of the PPL space */
>>   		sector_t sector;	/* First sector of the PPL space */
>>   	} ppl;
>> +
>> +	atomic64_t sync_io;		/* counter of sync IO (unit sectors) */
>>   };
>>   enum flag_bits {
>>   	Faulty,			/* device is known to have a fault */
>> @@ -549,14 +551,17 @@ static inline int mddev_trylock(struct mddev *mddev)
>>   }
>>   extern void mddev_unlock(struct mddev *mddev);
>>   
>> -static inline void md_sync_acct(struct block_device *bdev, unsigned long nr_sectors)
>> +static inline void md_sync_acct(struct md_rdev *rdev, unsigned long nr_sectors)
>>   {
>> -	atomic_add(nr_sectors, &bdev->bd_disk->sync_io);
>> +	atomic64_add(nr_sectors, &rdev->sync_io);
>>   }
>>   
>>   static inline void md_sync_acct_bio(struct bio *bio, unsigned long nr_sectors)
>>   {
>> -	md_sync_acct(bio->bi_bdev, nr_sectors);
>> +	struct md_rdev *rdev = (void *)bio->bi_bdev;
> 
> That look weird. bio->bi_bdev should be a 'struct gendisk', not a MD 
> internal data structure.

You mean a "struct block_device". right ? :)

> 
>> +
>> +	bio_set_dev(bio, rdev->bdev);
>> +	md_sync_acct(rdev, nr_sectors);
>>   }
>>   
>>   struct md_personality
>> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
>> index 7dc8026cf6ee..74c42dabe57c 100644
>> --- a/drivers/md/raid1.c
>> +++ b/drivers/md/raid1.c
>> @@ -2232,7 +2232,7 @@ static void sync_request_write(struct mddev *mddev, struct r1bio *r1_bio)
>>   
>>   		wbio->bi_end_io = end_sync_write;
>>   		atomic_inc(&r1_bio->remaining);
>> -		md_sync_acct(conf->mirrors[i].rdev->bdev, bio_sectors(wbio));
>> +		md_sync_acct(conf->mirrors[i].rdev, bio_sectors(wbio));
>>   
>>   		submit_bio_noacct(wbio);
>>   	}
>> @@ -2791,7 +2791,7 @@ static sector_t raid1_sync_request(struct mddev *mddev, sector_t sector_nr,
>>   		if (rdev && bio->bi_end_io) {
>>   			atomic_inc(&rdev->nr_pending);
>>   			bio->bi_iter.bi_sector = sector_nr + rdev->data_offset;
>> -			bio_set_dev(bio, rdev->bdev);
>> +			bio->bi_bdev = (void *)rdev;
>>   			if (test_bit(FailFast, &rdev->flags))
>>   				bio->bi_opf |= MD_FAILFAST;
>>   		}
>> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
>> index dde98f65bd04..fc1e6c0996de 100644
>> --- a/drivers/md/raid10.c
>> +++ b/drivers/md/raid10.c
>> @@ -2407,7 +2407,7 @@ static void sync_request_write(struct mddev *mddev, struct r10bio *r10_bio)
>>   
>>   		atomic_inc(&conf->mirrors[d].rdev->nr_pending);
>>   		atomic_inc(&r10_bio->remaining);
>> -		md_sync_acct(conf->mirrors[d].rdev->bdev, bio_sectors(tbio));
>> +		md_sync_acct(conf->mirrors[d].rdev, bio_sectors(tbio));
>>   
>>   		if (test_bit(FailFast, &conf->mirrors[d].rdev->flags))
>>   			tbio->bi_opf |= MD_FAILFAST;
>> @@ -2430,7 +2430,7 @@ static void sync_request_write(struct mddev *mddev, struct r10bio *r10_bio)
>>   			bio_copy_data(tbio, fbio);
>>   		d = r10_bio->devs[i].devnum;
>>   		atomic_inc(&r10_bio->remaining);
>> -		md_sync_acct(conf->mirrors[d].replacement->bdev,
>> +		md_sync_acct(conf->mirrors[d].replacement,
>>   			     bio_sectors(tbio));
>>   		submit_bio_noacct(tbio);
>>   	}
>> @@ -2562,12 +2562,12 @@ static void recovery_request_write(struct mddev *mddev, struct r10bio *r10_bio)
>>   		wbio2 = NULL;
>>   	if (wbio->bi_end_io) {
>>   		atomic_inc(&conf->mirrors[d].rdev->nr_pending);
>> -		md_sync_acct(conf->mirrors[d].rdev->bdev, bio_sectors(wbio));
>> +		md_sync_acct(conf->mirrors[d].rdev, bio_sectors(wbio));
>>   		submit_bio_noacct(wbio);
>>   	}
>>   	if (wbio2) {
>>   		atomic_inc(&conf->mirrors[d].replacement->nr_pending);
>> -		md_sync_acct(conf->mirrors[d].replacement->bdev,
>> +		md_sync_acct(conf->mirrors[d].replacement,
>>   			     bio_sectors(wbio2));
>>   		submit_bio_noacct(wbio2);
>>   	}
>> @@ -3486,7 +3486,7 @@ static sector_t raid10_sync_request(struct mddev *mddev, sector_t sector_nr,
>>   				from_addr = r10_bio->devs[j].addr;
>>   				bio->bi_iter.bi_sector = from_addr +
>>   					rdev->data_offset;
>> -				bio_set_dev(bio, rdev->bdev);
>> +				bio->bi_bdev = (void *)rdev;
>>   				atomic_inc(&rdev->nr_pending);
>>   				/* and we write to 'i' (if not in_sync) */
>>   
>> @@ -3508,7 +3508,7 @@ static sector_t raid10_sync_request(struct mddev *mddev, sector_t sector_nr,
>>   					bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
>>   					bio->bi_iter.bi_sector = to_addr
>>   						+ mrdev->data_offset;
>> -					bio_set_dev(bio, mrdev->bdev);
>> +					bio->bi_bdev = (void *)mrdev;
>>   					atomic_inc(&r10_bio->remaining);
>>   				} else
>>   					r10_bio->devs[1].bio->bi_end_io = NULL;
>> @@ -3529,7 +3529,7 @@ static sector_t raid10_sync_request(struct mddev *mddev, sector_t sector_nr,
>>   				bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
>>   				bio->bi_iter.bi_sector = to_addr +
>>   					mreplace->data_offset;
>> -				bio_set_dev(bio, mreplace->bdev);
>> +				bio->bi_bdev = (void *)mreplace;
>>   				atomic_inc(&r10_bio->remaining);
>>   				break;
>>   			}
>> @@ -3684,7 +3684,7 @@ static sector_t raid10_sync_request(struct mddev *mddev, sector_t sector_nr,
>>   			if (test_bit(FailFast, &rdev->flags))
>>   				bio->bi_opf |= MD_FAILFAST;
>>   			bio->bi_iter.bi_sector = sector + rdev->data_offset;
>> -			bio_set_dev(bio, rdev->bdev);
>> +			bio->bi_bdev = (void *)rdev;
>>   			count++;
>>   
>>   			rdev = rcu_dereference(conf->mirrors[d].replacement);
>> @@ -3706,7 +3706,7 @@ static sector_t raid10_sync_request(struct mddev *mddev, sector_t sector_nr,
>>   			if (test_bit(FailFast, &rdev->flags))
>>   				bio->bi_opf |= MD_FAILFAST;
>>   			bio->bi_iter.bi_sector = sector + rdev->data_offset;
>> -			bio_set_dev(bio, rdev->bdev);
>> +			bio->bi_bdev = (void *)rdev;
>>   			count++;
>>   			rcu_read_unlock();
>>   		}
>> @@ -4865,7 +4865,7 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
>>   
>>   	read_bio = bio_alloc_bioset(GFP_KERNEL, RESYNC_PAGES, &mddev->bio_set);
>>   
>> -	bio_set_dev(read_bio, rdev->bdev);
>> +	read_bio->bi_bdev = (void *)rdev;
>>   	read_bio->bi_iter.bi_sector = (r10_bio->devs[r10_bio->read_slot].addr
>>   			       + rdev->data_offset);
>>   	read_bio->bi_private = r10_bio;
>> @@ -4921,7 +4921,7 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
>>   		if (!rdev2 || test_bit(Faulty, &rdev2->flags))
>>   			continue;
>>   
>> -		bio_set_dev(b, rdev2->bdev);
>> +		b->bi_bdev = (void *)rdev2;
>>   		b->bi_iter.bi_sector = r10_bio->devs[s/2].addr +
>>   			rdev2->new_data_offset;
>>   		b->bi_end_io = end_reshape_write;
>> @@ -5016,7 +5016,7 @@ static void reshape_request_write(struct mddev *mddev, struct r10bio *r10_bio)
>>   		}
>>   		atomic_inc(&rdev->nr_pending);
>>   		rcu_read_unlock();
>> -		md_sync_acct_bio(b, r10_bio->sectors);
>> +		md_sync_acct(rdev, r10_bio->sectors);
>>   		atomic_inc(&r10_bio->remaining);
>>   		b->bi_next = NULL;
>>   		submit_bio_noacct(b);
>> diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
>> index 9c1a5877cf9f..b932282ff50a 100644
>> --- a/drivers/md/raid5.c
>> +++ b/drivers/md/raid5.c
>> @@ -1167,7 +1167,7 @@ static void ops_run_io(struct stripe_head *sh, struct stripe_head_state *s)
>>   		if (rdev) {
>>   			if (s->syncing || s->expanding || s->expanded
>>   			    || s->replacing)
>> -				md_sync_acct(rdev->bdev, RAID5_STRIPE_SECTORS(conf));
>> +				md_sync_acct(rdev, RAID5_STRIPE_SECTORS(conf));
>>   
>>   			set_bit(STRIPE_IO_STARTED, &sh->state);
>>   
>> @@ -1234,7 +1234,7 @@ static void ops_run_io(struct stripe_head *sh, struct stripe_head_state *s)
>>   		if (rrdev) {
>>   			if (s->syncing || s->expanding || s->expanded
>>   			    || s->replacing)
>> -				md_sync_acct(rrdev->bdev, RAID5_STRIPE_SECTORS(conf));
>> +				md_sync_acct(rrdev, RAID5_STRIPE_SECTORS(conf));
>>   
>>   			set_bit(STRIPE_IO_STARTED, &sh->state);
>>   
>> diff --git a/include/linux/genhd.h b/include/linux/genhd.h
>> index 74c410263113..6b84444111e4 100644
>> --- a/include/linux/genhd.h
>> +++ b/include/linux/genhd.h
>> @@ -150,7 +150,6 @@ struct gendisk {
>>   	struct list_head slave_bdevs;
>>   #endif
>>   	struct timer_rand_state *random;
>> -	atomic_t sync_io;		/* RAID */
>>   	struct disk_events *ev;
>>   #ifdef  CONFIG_BLK_DEV_INTEGRITY
>>   	struct kobject integrity_kobj;
>>
> 
> Cheers,
> 
> Hannes


-- 
Damien Le Moal
Western Digital Research
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
