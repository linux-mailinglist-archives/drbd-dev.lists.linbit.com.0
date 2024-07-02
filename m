Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8C91EDBC
	for <lists+drbd-dev@lfdr.de>; Tue,  2 Jul 2024 06:15:23 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DD07A420196;
	Tue,  2 Jul 2024 06:15:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 435 seconds by postgrey-1.31 at mail19;
	Tue, 02 Jul 2024 03:53:31 CEST
Received: from out-184.mta1.migadu.com (out-184.mta1.migadu.com
	[95.215.58.184])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 330C142010D
	for <drbd-dev@lists.linbit.com>; Tue,  2 Jul 2024 03:53:30 +0200 (CEST)
X-Envelope-To: drbd-dev@lists.linbit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1719884775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Ofo9Rbs7gF++33fhpxXh2d73ihmZ2nJDKp8+3sbbZLU=;
	b=YpJY4yJEAhhH8tO82dmYDQsndpKFgrOb1ICJgfyMoTJ2K2KO4OL7TFKaRktcusGRpCEA83
	RS9RNog3xaIAVW6sfFPfxrZoUyxremu8AlflV2vDM5d7cy4ezLWafenssLjsiwwZjr6j76
	mypsznq8qn2pTFID7An6YljzobzXEGY=
X-Envelope-To: zhengbing.huang@easystack.cn
X-Envelope-To: dongsheng.yang@easystack.cn
X-Envelope-To: philipp.reisner@linbit.com
Subject: Re: [PATCH 01/11] drbd_nl: dont allow detating to be inttrupted in
	waiting D_DETACHING to DISKLESS
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<CADGDV=Xo6Z_K2R8vB7+7_jf0U_im0Nmy-xQ36AYh59qi45EvAQ@mail.gmail.com>
	<f0faab82-9113-d34b-fbd2-9f817c4166e0@easystack.cn>
	<CADGDV=Vaxg1-xfaGD4B6vogiyr1pgKDK3Rv6_bLhLC0GCgpigQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
	include these headers.
From: Dongsheng Yang <dongsheng.yang@linux.dev>
Message-ID: <d16555b2-a777-e6ed-83f3-fc93a7a12607@linux.dev>
Date: Tue, 2 Jul 2024 09:45:59 +0800
MIME-Version: 1.0
In-Reply-To: <CADGDV=Vaxg1-xfaGD4B6vogiyr1pgKDK3Rv6_bLhLC0GCgpigQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 02 Jul 2024 06:15:15 +0200
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



在 2024/7/1 星期一 下午 6:00, Philipp Reisner 写道:
> Hi Dongsheng,
> 
> Thanks for all this information! That is already nearly a perfect
> commit message.
> Still, I am looking for a better approach to solving this problem.
> Instead of making the detach uninterruptible, I suggest finding a way
> to still schedule the ldev_destroy_work in this corner case.

Sounds good, we are willing to do review and test for your patch when 
it's ready.
> 
> PS: I prefer changes with 100 lines of commit message that touches 3
> lines of code over 3 lines of commit message for 100 lines of code
> changes.

Totally understood, that's important for discussion and code maintaining.

Thanx
> 
> best regards,
>   Philipp
> 
> On Mon, Jul 1, 2024 at 4:02 AM Dongsheng Yang
> <dongsheng.yang@easystack.cn> wrote:
>>
>>
>>
>> 在 2024/6/28 星期五 下午 5:10, Philipp Reisner 写道:
>>> Hello Dongsheng,
>>>
>>> First of all, thanks for contributing patches to us.
>>> Please find my reply on the patch below the quote:
>>>
>>> On Mon, Jun 24, 2024 at 7:52 AM zhengbing.huang
>>> <zhengbing.huang@easystack.cn> wrote:
>>>>
>>>> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>>>>
>>>> In our network failure and drbd down testing, we found warning in dmesg and drbd down process into D state:
>>>>
>>>> "kernel: drbd /unregistered/ramtest3/0 drbd103: ASSERTION device->disk_state[NOW] == D_FAILED || device->disk_state[NOW] == D_DETACHING FAILED in go_diskless"
>>>>
>>>> the problem is the wait_event is inttruptable, it could be intrupted by signal and call drbd_cleanup_device before go_diskless()
>>>>
>>>
>>> In this case, I suggest improving the expression in the assertion.
>>> Improving an assertion can also mean removing that assertion.
>>
>> Hi Philipp,
>>          This patchset is fixing the problems found by a network failure test
>> script[1].
>>          The [1/11] is not about just a WARNING, it will result a process with D
>> state in wait_event(device->misc_wait, !test_bit(GOING_DISKLESS,
>> &device->flags)); in adm_del_minor().
>>
>> let's think about this sequence:
>>
>> a) drbd_adm_down -> adm_detach -> change_disk_state(device, D_DETACHING...
>>
>> b) it will call put_ldev(), set GOING_DISKLESS and post a work for
>> GO_DISKLESS
>>
>> c) adm_detach() start wait_event_interruptible(device->misc_wait,
>>                          get_disk_state(device) != D_DETACHING);
>> but it can be intrrupted, then call drbd_cleanup_device() to set
>> device->disk_state[NOW] = D_DISKLESS;
>>
>> after that, it will go to adm_del_minor() and
>> wait_event(device->misc_wait, !test_bit(GOING_DISKLESS,
>> &device->flags)); which expects drbd_ldev_destroy to clear GOING_DISKLESS.
>>
>> d) on the other hand, go_diskless work start and warn on the message in
>> commit message. it will do change_disk_state(device, D_DISKLESS,
>> CS_HARD, "go-diskless", NULL); But the disk_state[NOW] is already
>> D_DISKLESS. So it will not schedule &device->ldev_destroy_work.
>>
>> As a result, the wait_event in c) will never return.
>>
>>
>> [1]:
>> check_drbd_process() {
>>       ps aux | grep " D"|grep drbd
>> }
>>
>> check_node_2_drbd_process() {
>>       ssh node-2 'ps aux' | grep " D"|grep drbd
>> }
>>
>> wait_for_no_drbd_d_state() {
>>       count=0
>>       while true; do
>>           if check_drbd_process; then
>>               echo "Found drbd process in D state, sleeping for ${count}
>> second..."
>>               sleep 1
>>               count=$((count + 1))
>>           else
>>               echo "No drbd process in D state."
>>               break
>>           fi
>>       done
>>       while true; do
>>           if check_node_2_drbd_process; then
>>               echo "Found drbd process in D state, sleeping for ${count}
>> second..."
>>               sleep 1
>>               count=$((count + 1))
>>           else
>>               echo "No drbd process in D state."
>>               break
>>           fi
>>       done
>> }
>>
>> random_sleep=$((RANDOM % 100))
>>
>> ssh node-2 "ifup Bond2-roce.1469"
>> ifup Bond2-roce.1469
>>
>> sleep 5
>>
>> for i in `seq 0 9`; do
>>           drbdadm up ramtest${i}
>>           ssh node-2 "drbdadm up ramtest${i}"
>> done
>>
>> sleep ${random_sleep}
>>
>> ssh node-2 "ifdown Bond2-roce.1469"
>>
>> random_sleep=$((RANDOM % 10))
>>
>> for i in `seq 0 9`; do
>>           drbdsetup fail-io ramtest${i} &
>>           drbdadm down ramtest${i} &
>> done
>>
>> sleep 10
>>
>> wait_for_no_drbd_d_state
>>>
>>> The wait_event_interruptible() is there for a reason. Think of a
>>> backing disk that behaves like a tar pit—a backing device that no
>>> longer finishes IO requests. You want a way to interrupt the drbdsetup
>>> waiting in detach.
>>>
>>> PS: A bit more elaborative commit messages are welcome.
>>>
>>> best regards,
>>>    Philipp
>>>
