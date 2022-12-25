Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0CD655CEA
	for <lists+drbd-dev@lfdr.de>; Sun, 25 Dec 2022 12:40:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9E93F42066B;
	Sun, 25 Dec 2022 12:40:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 16248420323
	for <drbd-dev@lists.linbit.com>; Sun, 25 Dec 2022 12:40:27 +0100 (CET)
Received: by mail-wr1-f47.google.com with SMTP id z10so8193909wrh.10
	for <drbd-dev@lists.linbit.com>; Sun, 25 Dec 2022 03:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:in-reply-to:from:references:cc:to
	:content-language:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=ZHIIoLI6GIci6V+pJYW1QHErBVX3zcPxWh+ZJQxLA0o=;
	b=OPpn+Oh/Qp5L2e9Il+Hm5QxpuQY7Gs5a/N87KQPkNnUtdboE321sBl7TVr1CqgUjc3
	IpSPgvcUFCdkAUoLC1np3iyoARmmrqV+tjaNc14WdA0MZfCylehyxW01fe1kNJ6RSccH
	pAIihcBVy3nsLrwLSGf9ong/kE7dyS0VUP88Cbkvv2fJ1DTu1Hw9tJCwfwnrfLyXy8Kq
	yIzupOZtFTwkXj3NIrpqL0xQyXgW82EbDx6fp9ImyAKbnxBxjpBNNN4aiKeJEEvL2dne
	RMTg1sHB1bb1R+EF7HUK0pg/NhjBJElhDO0TVYhw0GdVNgJVJr6Y80SV7fFJP3SNLru2
	5Jjg==
X-Gm-Message-State: AFqh2kriK8lHcF3VS8YPBS0k4/nWckmydAyMnsFkusJfykbaXQtCCzu4
	AaRo+b9hh1dZjw4lD3D4SaU=
X-Google-Smtp-Source: AMrXdXtOU+j5gb521X9u9SLkgvSyxLbk+fAjhclAlSe9w631NeEuF0qIeOMvF5fteB8K21s8/zxQPQ==
X-Received: by 2002:adf:f30f:0:b0:242:864e:c71c with SMTP id
	i15-20020adff30f000000b00242864ec71cmr8954222wro.24.1671968426666;
	Sun, 25 Dec 2022 03:40:26 -0800 (PST)
Received: from [192.168.64.177] (bzq-219-42-90.isdn.bezeqint.net.
	[62.219.42.90]) by smtp.gmail.com with ESMTPSA id
	e16-20020adfdbd0000000b002362f6fcaf5sm7652128wrj.48.2022.12.25.03.40.23
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sun, 25 Dec 2022 03:40:26 -0800 (PST)
Message-ID: <1d0eb8e4-a91f-4635-bac7-9bc6cefbeff0@grimberg.me>
Date: Sun, 25 Dec 2022 13:40:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
	Thunderbird/102.4.2
Content-Language: en-US
To: Gulam Mohamed <gulam.mohamed@oracle.com>, linux-block@vger.kernel.org
References: <20221221040506.1174644-1-gulam.mohamed@oracle.com>
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <20221221040506.1174644-1-gulam.mohamed@oracle.com>
Cc: nvdimm@lists.linux.dev, shminderjit.singh@oracle.com,
	linux-kernel@vger.kernel.org, song@kernel.org,
	dm-devel@redhat.com, ira.weiny@intel.com, agk@redhat.com,
	drbd-dev@lists.linbit.com, dave.jiang@intel.com,
	vishal.l.verma@intel.com, konrad.wilk@oracle.com,
	joe.jin@oracle.com, kent.overstreet@gmail.com, ngupta@vflare.org,
	kch@nvidia.com, senozhatsky@chromium.org, snitzer@kernel.org,
	colyli@suse.de, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, dan.j.williams@intel.com,
	axboe@kernel.dk, martin.petersen@oracle.com,
	rajesh.sivaramasubramaniom@oracle.com,
	philipp.reisner@linbit.com, junxiao.bi@oracle.com,
	minchan@kernel.org, lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [PATCH for-6.2/block V3 1/2] block: Data type
 conversion for IO accounting
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



On 12/21/22 06:05, Gulam Mohamed wrote:
> Change the data type of start and end time IO accounting variables in,
> block layer, from "unsigned long" to "u64". This is to enable nano-seconds
> granularity, in next commit, for the devices whose latency is less than
> milliseconds.
> 
> Changes from V2 to V3
> =====================
> 1. Changed all the required variables data-type to u64 as part of this
>     first patch
> 2. Create a new setting '2' for iostats in sysfs in next patch
> 3. Change the code to get the ktime values when iostat=2 in next patch
> 
> Signed-off-by: Gulam Mohamed <gulam.mohamed@oracle.com>
> ---
>   block/blk-core.c              | 24 ++++++++++++------------
>   block/blk.h                   |  2 +-
>   drivers/block/drbd/drbd_int.h |  2 +-
>   drivers/block/zram/zram_drv.c |  4 ++--
>   drivers/md/bcache/request.c   | 10 +++++-----
>   drivers/md/dm-core.h          |  2 +-
>   drivers/md/dm.c               |  2 +-
>   drivers/md/md.h               |  2 +-
>   drivers/md/raid1.h            |  2 +-
>   drivers/md/raid10.h           |  2 +-
>   drivers/md/raid5.c            |  2 +-
>   drivers/nvdimm/btt.c          |  2 +-
>   drivers/nvdimm/pmem.c         |  2 +-
>   include/linux/blk_types.h     |  2 +-
>   include/linux/blkdev.h        | 12 ++++++------
>   include/linux/part_stat.h     |  2 +-

nvme-mpath now also has stats, so struct nvme_request should also be
updated.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
