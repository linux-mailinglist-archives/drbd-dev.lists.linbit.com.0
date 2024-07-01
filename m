Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 4361491D8D2
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Jul 2024 09:19:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DB7C242065F;
	Mon,  1 Jul 2024 09:19:08 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m6027.netease.com (mail-m6027.netease.com [210.79.60.27])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 230EA420653
	for <drbd-dev@lists.linbit.com>;
	Mon,  1 Jul 2024 09:19:02 +0200 (CEST)
Received: from [192.168.122.189] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 914984C0129;
	Mon,  1 Jul 2024 10:23:17 +0800 (CST)
Subject: Re: [PATCH 05/11] drbd_transport_rdma: dont break in
	dtr_tx_cq_event_handler if (cm->state != DSM_CONNECTED)
To: Philipp Reisner <philipp.reisner@linbit.com>,
	"zhengbing.huang" <zhengbing.huang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<20240624054619.23212-5-zhengbing.huang@easystack.cn>
	<CADGDV=XCh8QLqYZ0-zddu6nwdJJor9UGb960K-CmN5yLB58XzA@mail.gmail.com>
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
Message-ID: <5de313a6-8b0a-36c4-4b76-307ee1ab3477@easystack.cn>
Date: Mon, 1 Jul 2024 10:23:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CADGDV=XCh8QLqYZ0-zddu6nwdJJor9UGb960K-CmN5yLB58XzA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHUsfVkxPSEtNSEhKSUgeHlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a906c1a8dd6022ekunm914984c0129
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Phw6ITo6GDcqMk1DTz0oQzNL
	HxIwChdVSlVKTEpCQ0tLTkJDT0tKVTMWGhIXVR8UFRwIEx4VHFUCGhUcOx4aCAIIDxoYEFUYFUVZ
	V1kSC1lBWUlKQ1VCT1VKSkNVQktZV1kIAVlBT0lPSDcG
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



在 2024/6/28 星期五 下午 8:07, Philipp Reisner 写道:
> Hello Dongsheng,
> 
> It appears that you are trying to fix a leak of cm structures. Is that correct?

Yes, in our network faulure testing, we found drbdadm down command hang 
at dtr_free() to 
wait_event(rdma_transport->cm_count_wait,!atomic_read(&rdma_transport->cm_count));, 


we can find out the leak cm in memory and found the tx_descs_posted is 
not 0. then we did more hacking and found this problem in [05/11]

let's say this case:

a) post two tx_desc and tx_desc_posted to 2.

b) first tx_desc complete and call dtr_tx_cq_event_handler and into 
dtr_handle_tx_cq_event().

c) network failure and dtr_tx_timeout_work_fn() clear CONNECTED.

d) dtr_handle_tx_cq_event() returns, at this time , the second tx_desc 
is already complete, we expect rc = ib_req_notify_cq(cq, IB_CQ_NEXT_COMP 
| IB_CQ_REPORT_MISSED_EVENTS); to return 1 in rc and continue to call 
dtr_handle_tx_cq_event() in next while loop.

d) but it check cm->state is not CONNECTED, and break the outer while 
loop, so the second tx_desc will never be handled.

> Do you the reference on cm that is held because of the timer?
> Please describe what the problem is, and how you are improving the situation.
> 
> In case this approach is the right solution, the patch should also change the
> dtr_handle_tx_cq_event() function to type void.
> 
> best regards,
>   Philipp
> 
> On Mon, Jun 24, 2024 at 8:22 AM zhengbing.huang
> <zhengbing.huang@easystack.cn> wrote:
>>
>> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>>
>> We need to drain all tx in disconnect to put all kref for cm
>>
>> Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
>> ---
>>   drbd/drbd_transport_rdma.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
>> index b7ccb15d4..9a6d15b78 100644
>> --- a/drbd/drbd_transport_rdma.c
>> +++ b/drbd/drbd_transport_rdma.c
>> @@ -1956,9 +1956,6 @@ static void dtr_tx_cq_event_handler(struct ib_cq *cq, void *ctx)
>>                          err = dtr_handle_tx_cq_event(cq, cm);
>>                  } while (!err);
>>
>> -               if (cm->state != DSM_CONNECTED)
>> -                       break;
>> -
>>                  rc = ib_req_notify_cq(cq, IB_CQ_NEXT_COMP | IB_CQ_REPORT_MISSED_EVENTS);
>>                  if (unlikely(rc < 0)) {
>>                          struct drbd_transport *transport = cm->path->path.transport;
>> --
>> 2.27.0
>>
> .
> 
