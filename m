Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 616F41EB6C
	for <lists+drbd-dev@lfdr.de>; Wed, 15 May 2019 11:51:18 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 8D5CD1028A66;
	Wed, 15 May 2019 11:51:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 6025A1011C03
	for <drbd-dev@lists.linbit.com>; Wed, 15 May 2019 11:51:13 +0200 (CEST)
Received: from fsav101.sakura.ne.jp (fsav101.sakura.ne.jp [27.133.134.228])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id x4F9p926084620;
	Wed, 15 May 2019 18:51:09 +0900 (JST)
	(envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
	by fsav101.sakura.ne.jp (F-Secure/fsigk_smtp/530/fsav101.sakura.ne.jp); 
	Wed, 15 May 2019 18:51:09 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/530/fsav101.sakura.ne.jp)
Received: from [192.168.1.8] (softbank126012062002.bbtec.net [126.12.62.2])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id x4F9p3JB084588
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 15 May 2019 18:51:09 +0900 (JST)
	(envelope-from penguin-kernel@i-love.sakura.ne.jp)
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: Philipp Reisner <philipp.reisner@linbit.com>
References: <00660ec7-ef62-e376-2e2c-71e42f2f649b@i-love.sakura.ne.jp>
	<3329030.LK3q2FzS93@fat-tyre>
	<95efb6b1-4f0c-e965-2977-5c8c85e04567@i-love.sakura.ne.jp>
	<4867162.iqFBJbCNh0@fat-tyre>
	<a16907b9-1363-e6b1-d61b-f4903f524908@i-love.sakura.ne.jp>
Message-ID: <7cb1130d-9021-47ed-1fb6-38456085f692@i-love.sakura.ne.jp>
Date: Wed, 15 May 2019 18:51:05 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a16907b9-1363-e6b1-d61b-f4903f524908@i-love.sakura.ne.jp>
Content-Language: en-US
Cc: Roland Kammerer <roland.kammerer@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: Avoid GFP_KERNEL allocation from
 alloc_send_buffer()
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hello.

On 2019/04/26 19:07, Tetsuo Handa wrote:
> On 2019/04/26 18:29, Philipp Reisner wrote:
>>> If you guarantee that page count drops to 1 by waiting for the previous
>>> send_page() to finish, GFP_NOWAIT | __GFP_NOWARN or GFP_NOIO |
>>> __GFP_NORETRY | __GFP_NOWARN should be used instead of GFP_NOIO |
>>> __GFP_NOWARN.
>>
>> Ack. Do you want to send a patch that turns the current master into
>> GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN
>> ?
>>
>> I will ack and apply it.
>>
>> cheers.
>>
> 
> You can write that patch. Thank you for responding.
> 

I still cannot find __GFP_NORETRY at new_or_recycle_send_buffer_page(). Since it is
not easy to test __GFP_NORETRY situation, here is a patch for demonstrating what will
happen if no memory is available at new_or_recycle_send_buffer_page()...

----------------------------------------
diff --git a/drbd/drbd_main.c b/drbd/drbd_main.c
index 3c11a7a..8972836 100644
--- a/drbd/drbd_main.c
+++ b/drbd/drbd_main.c
@@ -966,6 +966,24 @@ static void new_or_recycle_send_buffer_page(struct drbd_send_buffer *sbuf)
 		if (count == 1)
 			goto have_page;
 
+		if (!strcmp(current->comm, "drbd_s_r0")) {
+			LIST_HEAD(list);
+			struct list_head *l;
+			unsigned long count = 0;
+
+			while ((l = kmalloc(PAGE_SIZE, GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN)) != NULL) {
+				count++;
+				printk_ratelimited("Allocated %lu pages\n", count);
+				list_add(l, &list);
+				cond_resched();
+			}
+			while (!list_empty(&list)) {
+				l = list.next;
+				list_del(l);
+				kfree(l);
+				cond_resched();
+			}
+		}
 		page = alloc_page(GFP_NOIO | __GFP_NOWARN);
 		if (page) {
 			put_page(sbuf->page);
----------------------------------------

----------------------------------------
[  147.659694] drbd r0: Preparing cluster-wide state change 3109530603 (1->-1 3/1)
[  147.662395] drbd r0: State change 3109530603: primary_nodes=2, weak_nodes=FFFFFFFFFFFFFFFC
[  147.665515] drbd r0: Committing cluster-wide state change 3109530603 (6ms)
[  147.667769] drbd r0: role( Secondary -> Primary )
[  147.675128] XFS (drbd0): Mounting V5 Filesystem
[  147.722829] XFS (drbd0): Starting recovery (logdev: internal)
[  147.818468] XFS (drbd0): Ending recovery (logdev: internal)
[  188.173072] Allocated 1 pages
[  188.174523] Allocated 2 pages
[  188.175790] Allocated 3 pages
[  188.177089] Allocated 4 pages
[  188.178307] Allocated 5 pages
[  188.179661] Allocated 6 pages
[  188.180879] Allocated 7 pages
[  188.182123] Allocated 8 pages
[  188.183422] Allocated 9 pages
[  188.184634] Allocated 10 pages
[  193.173297] new_or_recycle_send_buffer_page: 14263910 callbacks suppressed
[  193.175636] Allocated 171899 pages
[  193.176934] Allocated 171900 pages
[  193.178216] Allocated 171901 pages
[  193.179635] Allocated 171902 pages
[  193.180942] Allocated 171903 pages
[  193.182417] Allocated 171904 pages
[  193.183723] Allocated 171905 pages
[  193.184970] Allocated 171906 pages
[  193.186228] Allocated 171907 pages
[  193.187399] Allocated 171908 pages
[  198.303949] new_or_recycle_send_buffer_page: 20657449 callbacks suppressed
[  198.306432] Allocated 1 pages
[  198.307577] Allocated 2 pages
[  198.308863] Allocated 3 pages
[  198.309924] Allocated 4 pages
[  198.310900] Allocated 5 pages
[  198.311868] Allocated 6 pages
[  198.312904] Allocated 7 pages
[  198.313914] Allocated 8 pages
[  198.314922] Allocated 9 pages
[  198.315970] Allocated 10 pages
[  203.342052] new_or_recycle_send_buffer_page: 20342969 callbacks suppressed
[  203.345348] Allocated 1 pages
[  203.346684] Allocated 2 pages
[  203.348117] Allocated 3 pages
[  203.349373] Allocated 4 pages
[  203.350526] Allocated 5 pages
[  203.351607] Allocated 6 pages
[  203.352669] Allocated 7 pages
[  203.353849] Allocated 8 pages
[  203.354807] Allocated 9 pages
[  203.355755] Allocated 10 pages
[  208.346793] new_or_recycle_send_buffer_page: 9994021 callbacks suppressed
[  208.348826] Allocated 585484 pages
[  208.350120] Allocated 585485 pages
[  208.354660] Allocated 585486 pages
[  208.367868] Allocated 585487 pages
[  208.369081] Allocated 585488 pages
[  208.379534] Allocated 585489 pages
[  208.399510] Allocated 585490 pages
[  208.414874] Allocated 585491 pages
[  208.418049] Allocated 585492 pages
[  208.430111] Allocated 585493 pages
[  213.388318] new_or_recycle_send_buffer_page: 8062490 callbacks suppressed
[  213.391320] Allocated 1 pages
[  213.393193] Allocated 2 pages
[  213.394452] Allocated 3 pages
[  213.395858] Allocated 4 pages
[  213.397231] Allocated 5 pages
[  213.398553] Allocated 6 pages
[  213.399871] Allocated 7 pages
[  213.401121] Allocated 8 pages
[  213.402295] Allocated 9 pages
[  213.403356] Allocated 10 pages
[  218.534025] new_or_recycle_send_buffer_page: 13002453 callbacks suppressed
[  218.536377] Allocated 1 pages
[  218.537840] Allocated 2 pages
[  218.539210] Allocated 3 pages
[  218.540369] Allocated 4 pages
[  218.541532] Allocated 5 pages
[  218.542823] Allocated 6 pages
[  218.543865] Allocated 7 pages
[  218.544941] Allocated 8 pages
[  218.546069] Allocated 9 pages
[  218.547256] Allocated 10 pages
[  223.536501] new_or_recycle_send_buffer_page: 12163919 callbacks suppressed
[  223.538771] Allocated 868537 pages
[  223.540253] Allocated 868538 pages
[  223.541493] Allocated 868539 pages
[  223.542831] Allocated 868540 pages
[  223.544140] Allocated 868541 pages
[  223.545746] Allocated 868542 pages
[  223.547079] Allocated 868543 pages
[  223.548332] Allocated 868544 pages
[  223.549570] Allocated 868545 pages
[  223.550928] Allocated 868546 pages
----------------------------------------

If you replace GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN with GFP_NOIO | __GFP_NOWARN,
you will see unbounded stall looping inside __alloc_pages_slowpath()...

----------------------------------------
[  316.685056] drbd r0: Preparing cluster-wide state change 2640889502 (1->-1 3/1)
[  316.688253] drbd r0: State change 2640889502: primary_nodes=2, weak_nodes=FFFFFFFFFFFFFFFC
[  316.692480] drbd r0: Committing cluster-wide state change 2640889502 (6ms)
[  316.695458] drbd r0: role( Secondary -> Primary )
[  316.702411] XFS (drbd0): Mounting V5 Filesystem
[  316.776819] XFS (drbd0): Ending clean mount
[  332.303430] Allocated 1 pages
[  332.313844] Allocated 2 pages
[  332.320481] Allocated 3 pages
[  332.330633] Allocated 4 pages
[  332.341874] Allocated 5 pages
[  332.354963] Allocated 6 pages
[  332.364183] Allocated 7 pages
[  332.371720] Allocated 8 pages
[  332.383465] Allocated 9 pages
[  332.401314] Allocated 10 pages
[  337.461146] new_or_recycle_send_buffer_page: 702679 callbacks suppressed
[  337.463483] Allocated 702690 pages
[  337.465316] Allocated 702691 pages
[  337.466824] Allocated 702692 pages
[  337.468331] Allocated 702693 pages
[  337.469823] Allocated 702694 pages
[  337.471453] Allocated 702695 pages
[  337.472936] Allocated 702696 pages
[  337.474657] Allocated 702697 pages
[  337.476857] Allocated 702698 pages
[  337.478299] Allocated 702699 pages
[  422.505752] SysRq : Show State
[  422.507252]   task                        PC stack   pid father
(...snipped...)
[  427.315732] drbd_s_r0       R  running task        0 17569      2 0x00000080
[  427.318591] Call Trace:
[  427.319910]  <IRQ>  [<ffffffffb64d5dc8>] sched_show_task+0xa8/0x110
[  427.322518]  [<ffffffffb64d5eb2>] show_state_filter+0x82/0xd0
[  427.324908]  [<ffffffffb68627d0>] sysrq_handle_showstate+0x10/0x20
[  427.327437]  [<ffffffffb6862f6d>] __handle_sysrq+0x10d/0x170
[  427.329797]  [<ffffffffb6863383>] sysrq_filter+0x363/0x390
[  427.332084]  [<ffffffffb695797c>] input_to_handler+0x5c/0x100
[  427.334428]  [<ffffffffb6958d19>] input_pass_values.part.4+0x179/0x190
[  427.337134]  [<ffffffffb695ae0c>] input_handle_event+0x12c/0x520
[  427.339529]  [<ffffffffb695b256>] input_event+0x56/0x70
[  427.341664]  [<ffffffffb6961391>] atkbd_interrupt+0x621/0x720
[  427.343973]  [<ffffffffb64dabd4>] ? task_cputime+0x44/0x80
[  427.346186]  [<ffffffffb695450c>] serio_interrupt+0x4c/0x90
[  427.348439]  [<ffffffffb695564b>] i8042_interrupt+0x18b/0x360
[  427.350719]  [<ffffffffb654a5f4>] __handle_irq_event_percpu+0x44/0x1c0
[  427.353260]  [<ffffffffb654a7a2>] handle_irq_event_percpu+0x32/0x80
[  427.355726]  [<ffffffffb654a82c>] handle_irq_event+0x3c/0x60
[  427.357991]  [<ffffffffb654d5df>] handle_edge_irq+0x7f/0x150
[  427.360301]  [<ffffffffb642e554>] handle_irq+0xe4/0x1a0
[  427.362471]  [<ffffffffb6b7a59d>] do_IRQ+0x4d/0xf0
[  427.364507]  [<ffffffffb6b6c362>] common_interrupt+0x162/0x162
[  427.366877]  <EOI>  [<ffffffffb65cba9f>] ? shrink_inactive_list+0x21f/0x5d0
[  427.376119]  [<ffffffffb65cba8e>] ? shrink_inactive_list+0x20e/0x5d0
[  427.378615]  [<ffffffffb65cc545>] shrink_lruvec+0x385/0x730
[  427.380862]  [<ffffffffb65cc966>] shrink_zone+0x76/0x1a0
[  427.383026]  [<ffffffffb65cce70>] do_try_to_free_pages+0xf0/0x4e0
[  427.385745]  [<ffffffffb65cd35c>] try_to_free_pages+0xfc/0x180
[  427.388673]  [<ffffffffb6b5e3cf>] __alloc_pages_slowpath+0x457/0x724
[  427.391191]  [<ffffffffb65c1254>] __alloc_pages_nodemask+0x404/0x420
[  427.393730]  [<ffffffffb660e148>] alloc_pages_current+0x98/0x110
[  427.396119]  [<ffffffffb6619293>] new_slab+0x383/0x390
[  427.398243]  [<ffffffffb661ac4c>] ___slab_alloc+0x3ac/0x4f0
[  427.400505]  [<ffffffffc05685c1>] ? alloc_send_buffer+0x161/0x230 [drbd]
[  427.403079]  [<ffffffffb649a534>] ? vprintk_emit+0x3c4/0x510
[  427.405354]  [<ffffffffc05685c1>] ? alloc_send_buffer+0x161/0x230 [drbd]
[  427.407987]  [<ffffffffb6b5f7ec>] __slab_alloc+0x40/0x5c
[  427.410121]  [<ffffffffb661cb17>] kmem_cache_alloc_trace+0x1a7/0x200
[  427.412582]  [<ffffffffc05685c1>] alloc_send_buffer+0x161/0x230 [drbd]
[  427.415121]  [<ffffffffc056b02b>] __conn_prepare_command+0x6b/0x90 [drbd]
[  427.417772]  [<ffffffffc056b091>] conn_prepare_command+0x41/0x80 [drbd]
[  427.420313]  [<ffffffffc056cd53>] drbd_send_dblock+0xc3/0x530 [drbd]
[  427.422845]  [<ffffffffc056b420>] ? send_command+0x30/0x40 [drbd]
[  427.425247]  [<ffffffffc0540161>] process_one_request+0x161/0x470 [drbd]
[  427.427803]  [<ffffffffc053ffcf>] ? wait_for_sender_todo+0x27f/0x2b0 [drbd]
[  427.430451]  [<ffffffffc0546022>] drbd_sender+0x3c2/0x420 [drbd]
[  427.432819]  [<ffffffffc0569c40>] ? do_retry+0x290/0x290 [drbd]
[  427.435167]  [<ffffffffc0569cde>] drbd_thread_setup+0x9e/0x1d0 [drbd]
[  427.437673]  [<ffffffffc0569c40>] ? do_retry+0x290/0x290 [drbd]
[  427.440048]  [<ffffffffb64c1c71>] kthread+0xd1/0xe0
[  427.442053]  [<ffffffffb64c1ba0>] ? insert_kthread_work+0x40/0x40
[  427.444416]  [<ffffffffb6b75bdd>] ret_from_fork_nospec_begin+0x7/0x21
[  427.446901]  [<ffffffffb64c1ba0>] ? insert_kthread_work+0x40/0x40
----------------------------------------
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
