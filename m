Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 62882B3508F
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Aug 2025 03:01:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D247B162701;
	Tue, 26 Aug 2025 03:00:57 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 980 seconds by postgrey-1.31 at mail19;
	Tue, 26 Aug 2025 03:00:53 CEST
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
	[45.249.212.56])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 695181622F4
	for <drbd-dev@lists.linbit.com>; Tue, 26 Aug 2025 03:00:53 +0200 (CEST)
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4c9pp73HcyzKHNNW
	for <drbd-dev@lists.linbit.com>; Tue, 26 Aug 2025 08:44:31 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 157871A0D9C
	for <drbd-dev@lists.linbit.com>; Tue, 26 Aug 2025 08:44:31 +0800 (CST)
Received: from [10.174.179.143] (unknown [10.174.179.143])
	by APP4 (Coremail) with SMTP id gCh0CgDnMY5tA61oi1A5AQ--.16236S3;
	Tue, 26 Aug 2025 08:44:30 +0800 (CST)
Subject: Re: [PATCH 0/2] Fix the initialization of
	max_hw_wzeroes_unmap_sectors for stacking drivers
To: Zhang Yi <yi.zhang@huaweicloud.com>, linux-block@vger.kernel.org,
	linux-raid@vger.kernel.org, drbd-dev@lists.linbit.com
References: <20250825083320.797165-1-yi.zhang@huaweicloud.com>
From: Yu Kuai <yukuai1@huaweicloud.com>
Message-ID: <18a92f4f-e4e8-4b61-79b1-1b1f116af5fa@huaweicloud.com>
Date: Tue, 26 Aug 2025 08:44:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20250825083320.797165-1-yi.zhang@huaweicloud.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: gCh0CgDnMY5tA61oi1A5AQ--.16236S3
X-Coremail-Antispam: 1UD129KBjvdXoWrurW3Cw4DKw1xJryxWFy7Awb_yoW3ZrgEkF
	1FqFZavw4kCF1SvF15ur1fZry2yay8XF95ury7KayFgayfZFn5G3Wj93s8J3WUAFyqvFWD
	Ar1kt3yxAryUXjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaxYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS
	07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x07UAwIDUUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
Cc: axboe@kernel.dk, martin.petersen@oracle.com, john.g.garry@oracle.com,
	yangerkun@huawei.com, yi.zhang@huawei.com,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"yukuai \(C\)" <yukuai3@huawei.com>, hch@lst.de
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

ÔÚ 2025/08/25 16:33, Zhang Yi Ð´µÀ:
> From: Zhang Yi <yi.zhang@huawei.com>
> 
> Hello,
> 
> This series fixes the initialization of max_hw_wzeroes_unmap_sectors in
> queue_limits for all md raid and drbd drivers, preventing
> blk_validate_limits() failures on underlying devices that support the
> unmap write zeroes command.
> 
> Best regards,
> Yi.
> 
> Zhang Yi (2):
>    md: init queue_limits->max_hw_wzeroes_unmap_sectors parameter
>    drbd: init queue_limits->max_hw_wzeroes_unmap_sectors parameter
> 
>   drivers/block/drbd/drbd_nl.c | 1 +
>   drivers/md/md-linear.c       | 1 +
>   drivers/md/raid0.c           | 1 +
>   drivers/md/raid1.c           | 1 +
>   drivers/md/raid10.c          | 1 +
>   drivers/md/raid5.c           | 1 +
>   6 files changed, 6 insertions(+)
> 

For this set
Reviewed-by: Yu Kuai <yukuai3@huawei.com>

Thanks

