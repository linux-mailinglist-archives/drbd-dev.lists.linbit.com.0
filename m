Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA491D753
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Jul 2024 07:14:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E4AE14207F4;
	Mon,  1 Jul 2024 07:14:09 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 4199 seconds by postgrey-1.31 at mail19;
	Mon, 01 Jul 2024 07:14:04 CEST
Received: from mail-m254100.xmail.ntesmail.com
	(mail-m254100.xmail.ntesmail.com [103.129.254.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E5AC74202E7
	for <drbd-dev@lists.linbit.com>; Mon,  1 Jul 2024 07:14:02 +0200 (CEST)
Received: from [192.168.122.189] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 825784C02AC;
	Mon,  1 Jul 2024 10:48:27 +0800 (CST)
Subject: Re: [PATCH 03/11] drbd_transport_rdma: put kref for cm in
	dtr_path_established in error path
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	"zhengbing.huang" <zhengbing.huang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<20240624054619.23212-3-zhengbing.huang@easystack.cn>
	<CADGDV=V4kpNPAWf6MsdswhbMqKPe5=qEMXkF_KBqXVM7W+aUhQ@mail.gmail.com>
	<f368f323-140c-9995-63b7-ec8ada21a7f0@easystack.cn>
Message-ID: <73f04036-5bb3-9ad5-bfe1-ea4d26817ceb@easystack.cn>
Date: Mon, 1 Jul 2024 10:48:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f368f323-140c-9995-63b7-ec8ada21a7f0@easystack.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTx8aVk1KT08dTkoZGUpLSFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a906c31977e022ekunm825784c02ac
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pxw6LDo6NTcjGE1KTh82Cy81
	PFYaFBNVSlVKTEpCQ0tJSktDSUhNVTMWGhIXVR8UFRwIEx4VHFUCGhUcOx4aCAIIDxoYEFUYFUVZ
	V1kSC1lBWUlKQ1VCT1VKSkNVQktZV1kIAVlBSENKSzcG
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



在 2024/7/1 星期一 上午 10:07, Dongsheng Yang 写道:
> 
> 
> 在 2024/6/28 星期五 下午 5:40, Philipp Reisner 写道:
>> Hello Dongsheng,
>>
>> Please add more information why you think this change fixes a bug.
>> Have you experienced a leak of cm structs?
>> We got a RDMA_CM_EVENT_ESTABLISHED event. Even if DRBD does not do
>> anything with this cm, we sill expect a RDMA_CM_EVENT_DISCONNECTED in
>> the future. Is a problem in the handling of the disconnect?
> 
> If dtr_path_established() go into this branch, it will not 
> schedule_work(&cm->establish_work);
> 
> That means path->cm->state = DSM_CONNECTED; will not be done in 
> dtr_path_established_work_fn(), so __dtr_disconnect_path() will not call 
> rdma_disconnect(). That means this reference will never be put.

let me consider this  example:
a) rdma_connect() called and RDMA_CM_EVENT_ESTABLISHED received.

b) network failure and dtr_path_established() go into error path.

c) establish_work will not be scheduled.

d) drbdadm down test will hang because cm ref is not put.
>>
>> best regards,
>>   Philipp
>>
>> On Mon, Jun 24, 2024 at 9:28 AM zhengbing.huang
>> <zhengbing.huang@easystack.cn> wrote:
>>>
>>> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>>>
>>> Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
>>> ---
>>>   drbd/drbd_transport_rdma.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
>>> index cfbae0e78..eccd0c6ce 100644
>>> --- a/drbd/drbd_transport_rdma.c
>>> +++ b/drbd/drbd_transport_rdma.c
>>> @@ -922,6 +922,7 @@ static void dtr_path_established(struct dtr_cm *cm)
>>>                          atomic_set(&cs->active_state, PCS_INACTIVE);
>>>                          wake_up(&cs->wq);
>>>                  }
>>> +               kref_put(&cm->kref, dtr_destroy_cm);
>>>                  return;
>>>          }
>>>
>>> -- 
>>> 2.27.0
>>>
