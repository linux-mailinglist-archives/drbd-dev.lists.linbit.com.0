Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 5577891D6F2
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Jul 2024 06:19:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CCBB2420657;
	Mon,  1 Jul 2024 06:19:54 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 319 seconds by postgrey-1.31 at mail19;
	Mon, 01 Jul 2024 04:34:03 CEST
Received: from mail-m12826.netease.com (mail-m12826.netease.com
	[103.209.128.26])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CED75420304
	for <drbd-dev@lists.linbit.com>; Mon,  1 Jul 2024 04:34:02 +0200 (CEST)
Received: from [192.168.122.189] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id CE84E4C0234;
	Mon,  1 Jul 2024 10:28:34 +0800 (CST)
Subject: Re: [PATCH 07/11] drbd_transport_rdma: put kref in dtr_remap_tx_desc
	error
To: Philipp Reisner <philipp.reisner@linbit.com>,
	"zhengbing.huang" <zhengbing.huang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<20240624054619.23212-7-zhengbing.huang@easystack.cn>
	<CADGDV=U1EG9Zd22ujB=fUGCoExMhCLF6fYGj171MVKxabxz=iA@mail.gmail.com>
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
Message-ID: <ad51fcd4-9dfe-4421-b250-a0aed42f1cb9@easystack.cn>
Date: Mon, 1 Jul 2024 10:28:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CADGDV=U1EG9Zd22ujB=fUGCoExMhCLF6fYGj171MVKxabxz=iA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkNPVhlMTBhDT01LHUNDGFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a906c1f64a0022ekunmce84e4c0234
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OCI6Pxw5LjcpTU0uGhkRAR8o
	KTQwFD5VSlVKTEpCQ0tLQkpOTUhMVTMWGhIXVR8UFRwIEx4VHFUCGhUcOx4aCAIIDxoYEFUYFUVZ
	V1kSC1lBWUlKQ1VCT1VKSkNVQktZV1kIAVlBSElPTjcG
X-Mailman-Approved-At: Mon, 01 Jul 2024 06:19:37 +0200
Cc: drbd-dev@lists.linbit.com
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



在 2024/6/28 星期五 下午 8:19, Philipp Reisner 写道:
> Hello Dongsheng,
> 
> This looks wrong. In this loop, we are trying to find a path on which
> to repost this tx_desc. When the remapping fails, there is no reason
> to drop the drop a ref on the cm.

But dtr_select_and_get_cm_for_tx() get a ref, if we dont put it before 
continue, who will put this ref?
> 
> So, please provide a description what you are intending here with this change?
> 
> best regards,
>   Philipp
> 
> On Mon, Jun 24, 2024 at 9:27 AM zhengbing.huang
> <zhengbing.huang@easystack.cn> wrote:
>>
>> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>>
>> Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
>> ---
>>   drbd/drbd_transport_rdma.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
>> index c7adc87e3..77ff0055e 100644
>> --- a/drbd/drbd_transport_rdma.c
>> +++ b/drbd/drbd_transport_rdma.c
>> @@ -2355,8 +2355,11 @@ static int dtr_repost_tx_desc(struct dtr_cm *old_cm, struct dtr_tx_desc *tx_desc
>>                          return -ECONNRESET;
>>
>>                  err = dtr_remap_tx_desc(old_cm, cm, tx_desc);
>> -               if (err)
>> +               if (err) {
>> +                       pr_err("dtr_remap_tx_desc failed cm : %px\n", cm);
>> +                       kref_put(&cm->kref, dtr_destroy_cm);
>>                          continue;
>> +               }
>>
>>                  err = __dtr_post_tx_desc(cm, tx_desc);
>>                  if (!err) {
>> --
>> 2.27.0
>>
> .
> 
