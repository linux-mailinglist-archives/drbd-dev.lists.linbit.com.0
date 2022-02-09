Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 62BE34AEFC6
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 12:11:28 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 62D78420982;
	Wed,  9 Feb 2022 12:11:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 358 seconds by postgrey-1.31 at mail19;
	Wed, 09 Feb 2022 10:27:47 CET
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B52B3420639
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 10:27:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1644398508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=G5r0Xdb8ikemnPVF5lI7cPng/XJyVvYg/5LzR+eCPl8=;
	b=SBWD6cBRt7Y057lo/4qj/+VF2PhBLswY5lpwyGDKDHGR+AtcS3+w+3Xw02pET5ANPPLSkF
	Pptp3sql6V14GuDWBtZUCNIa2ZQP4S6aLZJyfhxesJBpqDnH2UYJYVvuQSqRWRCcjszb+I
	FIAGH9YhhzQKy9IhE/O+9W6f2bb5gKc=
To: Jinpu Wang <jinpu.wang@ionos.com>
References: <20220209082828.2629273-1-hch@lst.de>
	<20220209082828.2629273-4-hch@lst.de>
	<4f1565b2-0f83-0cfa-58bd-86d5dee48e51@linux.dev>
	<CAMGffE=FmVj26PJtu5fwtr3rNbtE+-dcfxOrmT4hEt3sO7Kw2A@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
	include these headers.
From: Guoqing Jiang <guoqing.jiang@linux.dev>
Message-ID: <0b8c9d4d-0fb0-1aee-97b2-f4381e124df2@linux.dev>
Date: Wed, 9 Feb 2022 17:21:39 +0800
MIME-Version: 1.0
In-Reply-To: <CAMGffE=FmVj26PJtu5fwtr3rNbtE+-dcfxOrmT4hEt3sO7Kw2A@mail.gmail.com>
Content-Language: en-US
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
X-Mailman-Approved-At: Wed, 09 Feb 2022 12:11:25 +0100
Cc: axboe@kernel.dk, manoj@linux.ibm.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, haris.iqbal@ionos.com,
	ukrishn@linux.ibm.com, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com, Christoph Hellwig <hch@lst.de>,
	mrochs@linux.ibm.com
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



On 2/9/22 5:13 PM, Jinpu Wang wrote:
>>> --- a/drivers/block/rnbd/rnbd-srv.c
>>> +++ b/drivers/block/rnbd/rnbd-srv.c
>>> @@ -548,8 +548,7 @@ static void rnbd_srv_fill_msg_open_rsp(struct rnbd_msg_open_rsp *rsp,
>>>                cpu_to_le16(rnbd_dev_get_max_segs(rnbd_dev));
>>>        rsp->max_hw_sectors =
>>>                cpu_to_le32(rnbd_dev_get_max_hw_sects(rnbd_dev));
>>> -     rsp->max_write_same_sectors =
>>> -             cpu_to_le32(bdev_write_same(rnbd_dev->bdev));
>>> +     rsp->max_write_same_sectors = 0;
>> IIUC, I think we can delete max_write_same_sectors from rsp as well given
>> the earlier change in setup_request_queue and rnbd_clt_set_dev_attr.
> No, I don't think it's a good idea, we need to keep the protocol
> compatible, so client for old kernel version
> won't be confused.

Fair enough. Then I guess it is better to add obsolete_ prefix like 
obsolete_rotational.

Thanks,
Guoqing
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
