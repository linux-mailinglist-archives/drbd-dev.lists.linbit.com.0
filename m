Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 73050B511DC
	for <lists+drbd-dev@lfdr.de>; Wed, 10 Sep 2025 10:55:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C667116270B;
	Wed, 10 Sep 2025 10:55:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
	[45.249.212.56])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 598BA16090F
	for <drbd-dev@lists.linbit.com>; Wed, 10 Sep 2025 10:55:16 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4cMDzP1HsFzKHN1j
	for <drbd-dev@lists.linbit.com>; Wed, 10 Sep 2025 16:55:13 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 64E1A1A0843
	for <drbd-dev@lists.linbit.com>; Wed, 10 Sep 2025 16:55:13 +0800 (CST)
Received: from [10.174.179.80] (unknown [10.174.179.80])
	by APP4 (Coremail) with SMTP id gCh0CgAncIztPMFouU8UCA--.34576S3;
	Wed, 10 Sep 2025 16:55:11 +0800 (CST)
Message-ID: <70c56bd4-89b0-41b8-8ac5-c38ac97319ca@huaweicloud.com>
Date: Wed, 10 Sep 2025 16:55:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] md: init queue_limits->max_hw_wzeroes_unmap_sectors
	parameter
To: John Garry <john.g.garry@oracle.com>, linux-block@vger.kernel.org,
	linux-raid@vger.kernel.org, drbd-dev@lists.linbit.com
References: <20250825083320.797165-1-yi.zhang@huaweicloud.com>
	<20250825083320.797165-2-yi.zhang@huaweicloud.com>
	<5b0fd2a0-dffc-4f51-bdff-746e9bd611bd@oracle.com>
Content-Language: en-US
From: Zhang Yi <yi.zhang@huaweicloud.com>
In-Reply-To: <5b0fd2a0-dffc-4f51-bdff-746e9bd611bd@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgAncIztPMFouU8UCA--.34576S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCw4kAry8JFyfCw1kGF4Uurg_yoW5Wryrpa
	yIqF92gr98tFWxA34kJw17ZFWFq34rGrZFkFy3X3WF9r47Wr12gF4xXa90gFnrXw4rGw1U
	t3WIkF9rua17tFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1
	7KsUUUUUU==
X-CM-SenderInfo: d1lo6xhdqjqx5xdzvxpfor3voofrz/
Cc: axboe@kernel.dk, martin.petersen@oracle.com, yi.zhang@huawei.com,
	yangerkun@huawei.com, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, yukuai3@huawei.com, hch@lst.de
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 9/2/2025 8:25 PM, John Garry wrote:
> On 25/08/2025 09:33, Zhang Yi wrote:
>> From: Zhang Yi <yi.zhang@huawei.com>
>>
>> The parameter max_hw_wzeroes_unmap_sectors in queue_limits should be
>> equal to max_write_zeroes_sectors if it is set to a non-zero value.
>> However, the stacked md drivers call md_init_stacking_limits() to
>> initialize this parameter to UINT_MAX but only adjust
>> max_write_zeroes_sectors when setting limits. Therefore, this
>> discrepancy triggers a value check failure in blk_validate_limits().
>>
>> Fix this failure by explicitly setting max_hw_wzeroes_unmap_sectors to
>> zero.
>>
>> Fixes: 0c40d7cb5ef3 ("block: introduce max_{hw|user}_wzeroes_unmap_sectors to queue limits")
>> Reported-by: John Garry <john.g.garry@oracle.com>
>> Closes: https://lore.kernel.org/linux-block/803a2183-a0bb-4b7a-92f1-afc5097630d2@oracle.com/
>> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
> 
> Tested-by: John Garry <john.g.garry@oracle.com> # raid 0/1/10

Thank you for the test!

> 
>> diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
>> index f1d8811a542a..419139ad7663 100644
>> --- a/drivers/md/raid0.c
>> +++ b/drivers/md/raid0.c
>> @@ -382,6 +382,7 @@ static int raid0_set_limits(struct mddev *mddev)
>>       md_init_stacking_limits(&lim);
>>       lim.max_hw_sectors = mddev->chunk_sectors;
>>       lim.max_write_zeroes_sectors = mddev->chunk_sectors;
>> +    lim.max_hw_wzeroes_unmap_sectors = mddev->chunk_sectors;
>>       lim.io_min = mddev->chunk_sectors << 9;
>>       lim.io_opt = lim.io_min * mddev->raid_disks;
>>       lim.chunk_sectors = mddev->chunk_sectors;
>> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
>> index 408c26398321..35c6498b4917 100644
>> --- a/drivers/md/raid1.c
>> +++ b/drivers/md/raid1.c
>> @@ -3211,6 +3211,7 @@ static int raid1_set_limits(struct mddev *mddev)
>>         md_init_stacking_limits(&lim);
>>       lim.max_write_zeroes_sectors = 0;
>> +    lim.max_hw_wzeroes_unmap_sectors = 0;
> 
> It would be better if we documented why we cannot support this on raid1/10, yet we can on raid0.
> 
> I am looking through the history of why max_write_zeroes_sectors is set to zero. I have gone as far back as 5026d7a9b, and this tells us that the retry mechanism for WRITE SAME causes an issue where mirrors are offlined (and so we disabled the support); and this was simply copied for write zeroes in 3deff1a70.

Yes, as discussed with Kuai, it's better to add TODO comments for
RAID 1, 10, and 5 for now, and we can support them by properly
propagating unsupported errors to the upper layers. I can send out
a separate patch to add this comment.

Thanks,
Yi.


