Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 240C891D6EF
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Jul 2024 06:19:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7035B4205C7;
	Mon,  1 Jul 2024 06:19:42 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 598 seconds by postgrey-1.31 at mail19;
	Mon, 01 Jul 2024 04:19:02 CEST
Received: from mail-m127105.qiye.163.com (mail-m127105.qiye.163.com
	[115.236.127.105])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B4757420304
	for <drbd-dev@lists.linbit.com>; Mon,  1 Jul 2024 04:19:02 +0200 (CEST)
Received: from [192.168.122.189] (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id CC63E4C01D4;
	Mon,  1 Jul 2024 10:02:05 +0800 (CST)
Subject: Re: [PATCH 01/11] drbd_nl: dont allow detating to be inttrupted in
	waiting D_DETACHING to DISKLESS
To: Philipp Reisner <philipp.reisner@linbit.com>,
	"zhengbing.huang" <zhengbing.huang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<CADGDV=Xo6Z_K2R8vB7+7_jf0U_im0Nmy-xQ36AYh59qi45EvAQ@mail.gmail.com>
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
Message-ID: <f0faab82-9113-d34b-fbd2-9f817c4166e0@easystack.cn>
Date: Mon, 1 Jul 2024 10:02:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CADGDV=Xo6Z_K2R8vB7+7_jf0U_im0Nmy-xQ36AYh59qi45EvAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHk0ZVh4dTUkYQktCGEoaTlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a906c07252f022ekunmcc63e4c01d4
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODI6Hzo4TjciSU0RITwoIkko
	Dh0KC0tVSlVKTEpCTEJCSElNT0lCVTMWGhIXVR8UFRwIEx4VHFUCGhUcOx4aCAIIDxoYEFUYFUVZ
	V1kSC1lBWUlKQ1VCT1VKSkNVQktZV1kIAVlBTkhKSjcG
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



在 2024/6/28 星期五 下午 5:10, Philipp Reisner 写道:
> Hello Dongsheng,
> 
> First of all, thanks for contributing patches to us.
> Please find my reply on the patch below the quote:
> 
> On Mon, Jun 24, 2024 at 7:52 AM zhengbing.huang
> <zhengbing.huang@easystack.cn> wrote:
>>
>> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>>
>> In our network failure and drbd down testing, we found warning in dmesg and drbd down process into D state:
>>
>> "kernel: drbd /unregistered/ramtest3/0 drbd103: ASSERTION device->disk_state[NOW] == D_FAILED || device->disk_state[NOW] == D_DETACHING FAILED in go_diskless"
>>
>> the problem is the wait_event is inttruptable, it could be intrupted by signal and call drbd_cleanup_device before go_diskless()
>>
> 
> In this case, I suggest improving the expression in the assertion.
> Improving an assertion can also mean removing that assertion.

Hi Philipp,
	This patchset is fixing the problems found by a network failure test 
script[1].
	The [1/11] is not about just a WARNING, it will result a process with D 
state in wait_event(device->misc_wait, !test_bit(GOING_DISKLESS, 
&device->flags)); in adm_del_minor().

let's think about this sequence:

a) drbd_adm_down -> adm_detach -> change_disk_state(device, D_DETACHING...

b) it will call put_ldev(), set GOING_DISKLESS and post a work for 
GO_DISKLESS

c) adm_detach() start wait_event_interruptible(device->misc_wait,
			get_disk_state(device) != D_DETACHING);
but it can be intrrupted, then call drbd_cleanup_device() to set 
device->disk_state[NOW] = D_DISKLESS;

after that, it will go to adm_del_minor() and 
wait_event(device->misc_wait, !test_bit(GOING_DISKLESS, 
&device->flags)); which expects drbd_ldev_destroy to clear GOING_DISKLESS.

d) on the other hand, go_diskless work start and warn on the message in 
commit message. it will do change_disk_state(device, D_DISKLESS, 
CS_HARD, "go-diskless", NULL); But the disk_state[NOW] is already 
D_DISKLESS. So it will not schedule &device->ldev_destroy_work.

As a result, the wait_event in c) will never return.


[1]:
check_drbd_process() {
     ps aux | grep " D"|grep drbd
}

check_node_2_drbd_process() {
     ssh node-2 'ps aux' | grep " D"|grep drbd
}

wait_for_no_drbd_d_state() {
     count=0
     while true; do
         if check_drbd_process; then
             echo "Found drbd process in D state, sleeping for ${count} 
second..."
             sleep 1
             count=$((count + 1))
         else
             echo "No drbd process in D state."
             break
         fi
     done
     while true; do
         if check_node_2_drbd_process; then
             echo "Found drbd process in D state, sleeping for ${count} 
second..."
             sleep 1
             count=$((count + 1))
         else
             echo "No drbd process in D state."
             break
         fi
     done
}

random_sleep=$((RANDOM % 100))

ssh node-2 "ifup Bond2-roce.1469"
ifup Bond2-roce.1469

sleep 5

for i in `seq 0 9`; do
         drbdadm up ramtest${i}
         ssh node-2 "drbdadm up ramtest${i}"
done

sleep ${random_sleep}

ssh node-2 "ifdown Bond2-roce.1469"

random_sleep=$((RANDOM % 10))

for i in `seq 0 9`; do
         drbdsetup fail-io ramtest${i} &
         drbdadm down ramtest${i} &
done

sleep 10

wait_for_no_drbd_d_state
> 
> The wait_event_interruptible() is there for a reason. Think of a
> backing disk that behaves like a tar pit—a backing device that no
> longer finishes IO requests. You want a way to interrupt the drbdsetup
> waiting in detach.
> 
> PS: A bit more elaborative commit messages are welcome.
> 
> best regards,
>   Philipp
> 
