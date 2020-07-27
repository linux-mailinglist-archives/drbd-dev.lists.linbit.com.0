Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF422F990
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Jul 2020 21:55:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C58ED4203D0;
	Mon, 27 Jul 2020 21:55:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.prgmr.com (mail.prgmr.com [71.19.149.6])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4FE634203D0
	for <drbd-dev@lists.linbit.com>; Mon, 27 Jul 2020 21:55:18 +0200 (CEST)
Received: from [10.0.0.38] (c-174-62-72-237.hsd1.ca.comcast.net
	[174.62.72.237]) (Authenticated sender: srn)
	by mail.prgmr.com (Postfix) with ESMTPSA id 36C65720097
	for <drbd-dev@lists.linbit.com>; Mon, 27 Jul 2020 15:54:47 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com 36C65720097
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
	s=default; t=1595879687;
	bh=vVdugnobp4miUkoXUnmnOiiFruM1VI0G7puEAWfpMXM=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=Komee1Bj5gfTjBOcaFUoLyj7BsdzEIKJ5JnERUUurvTKr1qHxecxaRWnyrAruVqa0
	WNpoRevJjScSP9dvNG4d1kwjTaAgQYDDL2a5o1sbTiShVX6BcsU4zHFyXTMJS5QHwO
	epctBw2mFBHDthfYzNr4BgGEtm+rN/zUxHNvza0o=
To: drbd-dev@lists.linbit.com
References: <308845ca-17a3-43d0-b7ad-80069d9bc17f@prgmr.com>
	<20200727071658.GH4222@soda.linbit>
From: Sarah Newman <srn@prgmr.com>
Message-ID: <9573c4df-56d1-9c05-41d2-9058e9e5f77f@prgmr.com>
Date: Mon, 27 Jul 2020 12:54:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200727071658.GH4222@soda.linbit>
Content-Language: en-US
Subject: Re: [Drbd-dev] Bug(s) with Linux v5.4.46
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

On 7/27/20 12:16 AM, Lars Ellenberg wrote:
> On Sun, Jul 26, 2020 at 08:55:10PM -0700, Sarah Newman wrote:
> 
>> 	kref_put(&device->kref, drbd_destroy_device);
> 
> At this point we are "sure" to still hold at least one
> additional reference on device.
> 
>> 	del_gendisk(device->vdisk);
>> 	synchronize_rcu();
> 
> which we put here:
> 
>> 	kref_put(&device->kref, drbd_destroy_device);
> 
> 
> But what you present here shows that in your case that is not true.
> 
> There is nothing DRBD specific new in the mentioned kernel version.

The last version we heavily tested was the v4.9 series.

> 
>> In drbd_destroy_device, there is the line:
>>
>> memset(device, 0xfd, sizeof(*device));
>>
>> So I think that drbd_destroy_device must have run before del_gendisk,
>> and therefore the reference count for device->kref is unbalanced.
> 
> Looks like it.
> 
>> I do not know if this is related to the error message:
>>
>>   ASSERTION FAILED: connection->current_epoch->list not empty
>>
>> or not.
>>
>> There were no error messages reported on the peer.
>>
>> FYI, when we've run in debug mode we've seen some ODEBUG errors about
>> freeing active objects around the time that DRBD resources were released.
>> One was a work_struct and the other was a timer_list. I do not know if
>> either of those are related.
> 
> You want to show them? Maybe they help in understanding what is going on here.

OK - as I said I'm not sure it's DRBD:

Jun 28 13:53:32 hail kernel: kobject: 'integrity' (0000000077623090): kobject_release, parent 0000000000000000 (delayed 4000)
Jun 28 13:53:32 hail kernel: kobject: '147:3' (0000000039ce23c2): kobject_release, parent 0000000000000000 (delayed 1000)
Jun 28 13:53:32 hail kernel: kobject: 'holders' (000000006657b8fa): kobject_release, parent 000000005efea813 (delayed 2000)
Jun 28 13:53:32 hail kernel: kobject: 'slaves' (000000005ee8b4cb): kobject_release, parent 000000005efea813 (delayed 3000)
Jun 28 13:53:32 hail kernel: drbd resource3: Terminating drbd_w_resource
Jun 28 13:53:33 hail kernel: kobject: 'queues' (00000000e530d1f8): kobject_release, parent 0000000000000000 (delayed 1000)
Jun 28 13:53:33 hail kernel: kobject: 'loadtest168-emu' (00000000c67cf6e9): kobject_release, parent 0000000000000000 (delayed 3000)
Jun 28 13:53:33 hail kernel: kobject: 'vif-541-0' (00000000fbe87798): kobject_release, parent 0000000000000000 (delayed 4000)
Jun 28 13:53:33 hail kernel: kobject: 'console-540-0' (000000001f752215): kobject_release, parent 0000000000000000 (delayed 2000)
Jun 28 13:53:33 hail kernel: xenbr1: port 337(loadtest168) entered disabled state
Jun 28 13:53:33 hail kernel: kobject: '1419' (00000000544ef6fb): kobject_release, parent 0000000000000000 (delayed 3000)
Jun 28 13:53:33 hail kernel: kobject: '1420' (000000001c6b6754): kobject_release, parent 0000000000000000 (delayed 3000)
Jun 28 13:53:33 hail kernel: xenbr1: port 337(loadtest168) entered disabled state
Jun 28 13:53:33 hail kernel: device loadtest168 left promiscuous mode
Jun 28 13:53:33 hail kernel: xenbr1: port 337(loadtest168) entered disabled state
Jun 28 13:53:33 hail kernel: kobject: 'rx-0' (0000000004009ca6): kobject_release, parent 000000007083fc4d (delayed 4000)
Jun 28 13:53:33 hail kernel: kobject: 'tx-0' (00000000129ffeb7): kobject_release, parent 000000007083fc4d (delayed 2000)
Jun 28 13:53:33 hail kernel: kobject: 'net' (00000000aa2c79e9): kobject_release, parent 0000000000000000 (delayed 4000)
Jun 28 13:53:33 hail kernel: kobject: 'brport' (0000000023912758): kobject_release, parent 0000000000000000 (delayed 3000)
Jun 28 13:53:33 hail kernel: kobject: '1411' (000000000f8a047a): kobject_release, parent 0000000000000000 (delayed 1000)
Jun 28 13:53:33 hail kernel: kobject: '1423' (00000000ab9afdc9): kobject_release, parent 0000000000000000 (delayed 1000)
Jun 28 13:53:33 hail kernel: kobject: '1424' (00000000769b6aea): kobject_release, parent 0000000000000000 (delayed 3000)
Jun 28 13:53:33 hail kernel: kobject: '1421' (00000000ecdfbadd): kobject_release, parent 0000000000000000 (delayed 4000)
Jun 28 13:53:34 hail kernel: kobject: 'queue' (00000000e1259dd1): kobject_release, parent 0000000000000000 (delayed 3000)
Jun 28 13:53:35 hail kernel: kobject: 'queue' (00000000e8c5e220): kobject_release, parent 0000000000000000 (delayed 4000)
Jun 28 13:53:35 hail kernel: kobject: 'drbd3' (000000005efea813): kobject_release, parent 0000000000000000 (delayed 1000)
Jun 28 13:53:36 hail kernel: kobject: 'queue' (0000000056b0406d): kobject_release, parent 0000000000000000 (delayed 1000)

Jun 28 13:53:36 hail kernel: ------------[ cut here ]------------
Jun 28 13:53:36 hail kernel: ODEBUG: free active (active state 0) object type: work_struct hint: kobject_delayed_cleanup+0x0/0x80
Jun 28 13:53:36 hail kernel: WARNING: CPU: 0 PID: 20709 at lib/debugobjects.c:488 debug_print_object+0x99/0x110
Jun 28 13:53:36 hail kernel: Modules linked in: einj 8021q garp mrp bonding xt_physdev ip6table_filter ip6_tables xt_conntrack nf_conntrack 
nf_defrag_ipv6 nf_defrag_ipv4 crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcspkr cdc_eem usbnet mii hpilo hpwdt ccp tun sch_ingress sch_htb 
raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor k10temp raid6_pq raid10 sp5100_tco fuse i2c_piix4 ext2 ebt_mark ebt_ip wmi 
ebt_ip6 ebt_arp ebtable_nat ebtable_filter ipmi_si ebtables ipmi_devintf ipmi_msghandler acpi_power_meter drbd lru_cache libcrc32c cls_u32 cls_fw 
br_netfilter bridge stp llc xenfs xen_privcmd act_police mlx4_en raid1 crc32c_intel serio_raw drm_vram_helper ttm igb ptp pps_core dca mlx4_core 
xen_pciback xen_netback xen_blkback xen_gntalloc xen_gntdev xen_evtchn
Jun 28 13:53:36 hail kernel: CPU: 0 PID: 20709 Comm: kworker/0:1 Tainted: G      D W         5.4.46-1_prgmr_debug.el7.x86_64 #1
Jun 28 13:53:36 hail kernel: Hardware name: HPE ProLiant DL325 Gen10/ProLiant DL325 Gen10, BIOS A41 03/09/2020
Jun 28 13:53:36 hail kernel: Workqueue: events kobject_delayed_cleanup
Jun 28 13:53:36 hail kernel: RIP: e030:debug_print_object+0x99/0x110
Jun 28 13:53:36 hail kernel: Code: ff ff ff ff 48 89 f7 48 29 c7 48 89 f8 48 83 ff 30 77 5c 48 8b 14 dd a0 86 a8 82 4c 89 e6 48 c7 c7 98 23 5e 82 e8 
3b 5b ab ff <0f> 0b 83 05 12 95 5f 01 01 48 83 c4 18 5b 5d 41 5c c3 83 05 02 95
Jun 28 13:53:36 hail kernel: RSP: e02b:ffffc90043227d10 EFLAGS: 00010282
Jun 28 13:53:36 hail kernel: RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000006
Jun 28 13:53:36 hail kernel: RDX: 0000000000000007 RSI: 0000000000000000 RDI: ffff888188a17c60
Jun 28 13:53:36 hail kernel: RBP: ffffffff8289aa80 R08: 0000000000000001 R09: 0000000000000001
Jun 28 13:53:36 hail kernel: R10: 0000000000000000 R11: ffff888043a50000 R12: ffffffff825ae78d
Jun 28 13:53:36 hail kernel: R13: ffffffff8289aa80 R14: ffff8881236d6cd0 R15: 0000000000000000
Jun 28 13:53:36 hail kernel: FS:  00007fa5706a3740(0000) GS:ffff888188a00000(0000) knlGS:0000000000000000
Jun 28 13:53:36 hail kernel: CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
Jun 28 13:53:36 hail kernel: CR2: 00007f66c00010b8 CR3: 0000000047014000 CR4: 0000000000040660
Jun 28 13:53:36 hail kernel: Call Trace:
Jun 28 13:53:36 hail kernel: debug_check_no_obj_freed+0x1be/0x1ec
Jun 28 13:53:36 hail kernel: slab_free_freelist_hook+0xe9/0x190
Jun 28 13:53:36 hail kernel: ? device_release+0x2a/0x80
Jun 28 13:53:36 hail kernel: kfree+0xca/0x2f0
Jun 28 13:53:36 hail kernel: device_release+0x2a/0x80
Jun 28 13:53:36 hail kernel: kobject_delayed_cleanup+0x3d/0x80
Jun 28 13:53:36 hail kernel: process_one_work+0x26d/0x620
Jun 28 13:53:36 hail kernel: worker_thread+0x3c/0x390
Jun 28 13:53:36 hail kernel: ? process_one_work+0x620/0x620
Jun 28 13:53:36 hail kernel: kthread+0x121/0x140
Jun 28 13:53:36 hail kernel: ? kthread_create_worker_on_cpu+0x70/0x70
Jun 28 13:53:36 hail kernel: ret_from_fork+0x27/0x50
Jun 28 13:53:36 hail kernel: irq event stamp: 0
Jun 28 13:53:36 hail kernel: hardirqs last  enabled at (0): [<0000000000000000>] 0x0
Jun 28 13:53:36 hail kernel: hardirqs last disabled at (0): [<ffffffff81110255>] copy_process+0xa95/0x1e40
Jun 28 13:53:36 hail kernel: softirqs last  enabled at (0): [<ffffffff81110255>] copy_process+0xa95/0x1e40
Jun 28 13:53:36 hail kernel: softirqs last disabled at (0): [<0000000000000000>] 0x0
Jun 28 13:53:36 hail kernel: ---[ end trace 2130fa3cc27515d6 ]---


Jun 28 17:29:13 hail kernel: block drbd12: disk( UpToDate -> Failed )
Jun 28 17:29:13 hail kernel: block drbd12: 0 KB (0 bits) marked out-of-sync by on disk bit-map.
Jun 28 17:29:13 hail kernel: block drbd12: disk( Failed -> Diskless )
Jun 28 17:29:13 hail kernel: kobject: 'integrity' (0000000091c8ac2a): kobject_release, parent 0000000000000000 (delayed 4000)
Jun 28 17:29:13 hail kernel: kobject: '147:12' (0000000083c5876c): kobject_release, parent 0000000000000000 (delayed 2000)
Jun 28 17:29:13 hail kernel: kobject: 'holders' (000000008c009d1d): kobject_release, parent 000000009f3618c3 (delayed 1000)
Jun 28 17:29:13 hail kernel: kobject: 'slaves' (000000005356be07): kobject_release, parent 000000009f3618c3 (delayed 2000)
Jun 28 17:29:13 hail kernel: drbd resource12: Terminating drbd_w_resource
Jun 28 17:29:15 hail kernel: kobject: 'drbd12' (000000009f3618c3): kobject_release, parent 0000000000000000 (delayed 1000)
Jun 28 17:29:16 hail kernel: kobject: 'queue' (00000000dcc18a74): kobject_release, parent 0000000000000000 (delayed 4000)
Jun 28 17:29:16 hail kernel: ------------[ cut here ]------------
Jun 28 17:29:16 hail kernel: ODEBUG: free active (active state 0) object type: timer_list hint: delayed_work_timer_fn+0x0/0x20
Jun 28 17:29:16 hail kernel: WARNING: CPU: 0 PID: 14242 at lib/debugobjects.c:488 debug_print_object+0x99/0x110
Jun 28 17:29:16 hail kernel: Modules linked in: einj 8021q garp mrp bonding xt_physdev ip6table_filter ip6_tables xt_conntrack nf_conntrack 
nf_defrag_ipv6 nf_defrag_ipv4 crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcspkr cdc_eem usbnet mii hpilo hpwdt ccp tun sch_ingress sch_htb 
raid456 async_raid6_recov async_memcpy async_pq async_xor async_tx xor k10temp raid6_pq raid10 sp5100_tco fuse i2c_piix4 ext2 ebt_mark ebt_ip wmi 
ebt_ip6 ebt_arp ebtable_nat ebtable_filter ipmi_si ebtables ipmi_devintf ipmi_msghandler acpi_power_meter drbd lru_cache libcrc32c cls_u32 cls_fw 
br_netfilter bridge stp llc xenfs xen_privcmd act_police mlx4_en raid1 crc32c_intel serio_raw drm_vram_helper ttm igb ptp pps_core dca mlx4_core 
xen_pciback xen_netback xen_blkback xen_gntalloc xen_gntdev xen_evtchn
Jun 28 17:29:16 hail kernel: CPU: 0 PID: 14242 Comm: kworker/0:0 Tainted: G      D W         5.4.46-1_prgmr_debug.el7.x86_64 #1
Jun 28 17:29:16 hail kernel: Hardware name: HPE ProLiant DL325 Gen10/ProLiant DL325 Gen10, BIOS A41 03/09/2020
Jun 28 17:29:16 hail kernel: Workqueue: events kobject_delayed_cleanup
Jun 28 17:29:16 hail kernel: RIP: e030:debug_print_object+0x99/0x110
Jun 28 17:29:16 hail kernel: Code: ff ff ff ff 48 89 f7 48 29 c7 48 89 f8 48 83 ff 30 77 5c 48 8b 14 dd a0 86 a8 82 4c 89 e6 48 c7 c7 98 23 5e 82 e8 
3b 5b ab ff <0f> 0b 83 05 12 95 5f 01 01 48 83 c4 18 5b 5d 41 5c c3 83 05 02 95
Jun 28 17:29:16 hail kernel: RSP: e02b:ffffc90042753d10 EFLAGS: 00010282
Jun 28 17:29:16 hail kernel: RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000006
Jun 28 17:29:16 hail kernel: RDX: 0000000000000007 RSI: 0000000000000000 RDI: ffff888188a17c60
Jun 28 17:29:16 hail kernel: RBP: ffffffff82958620 R08: 0000000000000001 R09: 0000000000000001
Jun 28 17:29:16 hail kernel: R10: 0000000000000000 R11: ffff888152e43000 R12: ffffffff825ae78d
Jun 28 17:29:16 hail kernel: R13: ffffffff82958620 R14: ffff888107ff38e8 R15: 0000000000000000
Jun 28 17:29:16 hail kernel: FS:  00007f5498c538c0(0000) GS:ffff888188a00000(0000) knlGS:0000000000000000
Jun 28 17:29:16 hail kernel: CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
Jun 28 17:29:16 hail kernel: CR2: 00007f5498c5f000 CR3: 000000015452c000 CR4: 0000000000040660
Jun 28 17:29:16 hail kernel: Call Trace:
Jun 28 17:29:16 hail kernel: debug_check_no_obj_freed+0x1be/0x1ec
Jun 28 17:29:16 hail kernel: slab_free_freelist_hook+0xe9/0x190
Jun 28 17:29:16 hail kernel: ? device_release+0x2a/0x80
Jun 28 17:29:16 hail kernel: kfree+0xca/0x2f0
Jun 28 17:29:16 hail kernel: device_release+0x2a/0x80
Jun 28 17:29:16 hail kernel: kobject_delayed_cleanup+0x3d/0x80
Jun 28 17:29:16 hail kernel: process_one_work+0x26d/0x620
Jun 28 17:29:16 hail kernel: worker_thread+0x3c/0x390
Jun 28 17:29:16 hail kernel: ? process_one_work+0x620/0x620
Jun 28 17:29:16 hail kernel: kthread+0x121/0x140
Jun 28 17:29:16 hail kernel: ? kthread_create_worker_on_cpu+0x70/0x70
Jun 28 17:29:16 hail kernel: ret_from_fork+0x27/0x50
Jun 28 17:29:16 hail kernel: irq event stamp: 0
Jun 28 17:29:16 hail kernel: hardirqs last  enabled at (0): [<0000000000000000>] 0x0
Jun 28 17:29:16 hail kernel: hardirqs last disabled at (0): [<ffffffff81110255>] copy_process+0xa95/0x1e40
Jun 28 17:29:16 hail kernel: softirqs last  enabled at (0): [<ffffffff81110255>] copy_process+0xa95/0x1e40
Jun 28 17:29:16 hail kernel: softirqs last disabled at (0): [<0000000000000000>] 0x0
Jun 28 17:29:16 hail kernel: ---[ end trace 2130fa3cc27515da ]---


> 
> But: is this "easily" reproducible? If so: how?

I haven't figured out how to easily reproduce it yet.

FYI, it looks like I inadvertently left out some of the logs showing what happened with the connection:

---
Jul 25 03:35:36 hail kernel: drbd resource37: Starting worker thread (from drbdsetup-84 [16066])
Jul 25 03:35:36 hail kernel: block drbd37: disk( Diskless -> Attaching )
Jul 25 03:35:36 hail kernel: drbd resource37: Method to ensure write ordering: flush
Jul 25 03:35:36 hail kernel: block drbd37: max BIO size = 1048576
Jul 25 03:35:36 hail kernel: block drbd37: drbd_bm_resize called with capacity == 4194304
Jul 25 03:35:36 hail kernel: block drbd37: resync bitmap: bits=524288 words=8192 pages=16
Jul 25 03:35:36 hail kernel: block drbd37: size = 2048 MB (2097152 KB)
Jul 25 03:35:36 hail kernel: block drbd37: recounting of set bits took additional 0 jiffies
Jul 25 03:35:36 hail kernel: block drbd37: 0 KB (0 bits) marked out-of-sync by on disk bit-map.
Jul 25 03:35:36 hail kernel: block drbd37: disk( Attaching -> UpToDate )
Jul 25 03:35:36 hail kernel: block drbd37: attached to UUIDs D314471E6BD376E8:0000000000000000:F76A13AB9FF79972:F76913AB9FF79973
Jul 25 03:35:36 hail kernel: drbd resource37: conn( StandAlone -> Unconnected )
Jul 25 03:35:36 hail kernel: drbd resource37: Starting receiver thread (from drbd_w_resource [16068])
Jul 25 03:35:36 hail kernel: drbd resource37: receiver (re)started
Jul 25 03:35:36 hail kernel: drbd resource37: conn( Unconnected -> WFConnection )
Jul 25 03:35:37 hail kernel: block drbd37: role( Secondary -> Primary )
Jul 25 03:35:37 hail kernel: block drbd37: new current UUID 7BAD3285364ECE5B:D314471E6BD376E8:F76A13AB9FF79972:F76913AB9FF79973
Jul 25 03:35:37 hail kernel: drbd resource37: Handshake successful: Agreed network protocol version 101
Jul 25 03:35:37 hail kernel: drbd resource37: Feature flags enabled on protocol level: 0xf TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.
Jul 25 03:35:37 hail kernel: drbd resource37: Peer authenticated using 16 bytes HMAC
Jul 25 03:35:37 hail kernel: drbd resource37: conn( WFConnection -> WFReportParams )
Jul 25 03:35:37 hail kernel: drbd resource37: Starting ack_recv thread (from drbd_r_resource [16082])
Jul 25 03:35:37 hail kernel: block drbd37: drbd_sync_handshake:
Jul 25 03:35:37 hail kernel: block drbd37: self 7BAD3285364ECE5B:D314471E6BD376E8:F76A13AB9FF79972:F76913AB9FF79973 bits:0 flags:0
Jul 25 03:35:37 hail kernel: block drbd37: peer 5AB69B021591F980:D314471E6BD376E9:F76A13AB9FF79973:F76913AB9FF79973 bits:0 flags:0
Jul 25 03:35:37 hail kernel: block drbd37: uuid_compare()=100 by rule 90
Jul 25 03:35:37 hail kernel: block drbd37: helper command: /bin/true initial-split-brain minor-37
Jul 25 03:35:37 hail kernel: block drbd37: helper command: /bin/true initial-split-brain minor-37 exit code 0 (0x0)
Jul 25 03:35:37 hail kernel: block drbd37: Split-Brain detected, 1 primaries, automatically solved. Sync from this node
Jul 25 03:35:37 hail kernel: block drbd37: peer( Unknown -> Secondary ) conn( WFReportParams -> WFBitMapS ) pdsk( DUnknown -> Consistent )
Jul 25 03:35:37 hail kernel: block drbd37: send bitmap stats [Bytes(packets)]: plain 0(0), RLE 21(1), total 21; compression: 100.0%
Jul 25 03:35:37 hail kernel: block drbd37: receive bitmap stats [Bytes(packets)]: plain 0(0), RLE 21(1), total 21; compression: 100.0%
Jul 25 03:35:37 hail kernel: block drbd37: helper command: /bin/true before-resync-source minor-37
Jul 25 03:35:37 hail kernel: block drbd37: helper command: /bin/true before-resync-source minor-37 exit code 0 (0x0)
Jul 25 03:35:37 hail kernel: block drbd37: conn( WFBitMapS -> SyncSource ) pdsk( Consistent -> Inconsistent )
Jul 25 03:35:37 hail kernel: block drbd37: Began resync as SyncSource (will sync 0 KB [0 bits set]).
Jul 25 03:35:37 hail kernel: block drbd37: updated sync UUID 7BAD3285364ECE5B:D315471E6BD376E8:D314471E6BD376E8:F76A13AB9FF79972
Jul 25 03:35:37 hail kernel: block drbd37: Resync done (total 1 sec; paused 0 sec; 0 K/sec)
Jul 25 03:35:37 hail kernel: block drbd37: updated UUIDs 7BAD3285364ECE5B:0000000000000000:D315471E6BD376E8:D314471E6BD376E8
Jul 25 03:35:37 hail kernel: block drbd37: conn( SyncSource -> Connected ) pdsk( Inconsistent -> UpToDate )
Jul 25 03:36:41 hail kernel: drbd resource37: peer( Secondary -> Unknown ) conn( Connected -> TearDown ) pdsk( UpToDate -> DUnknown )
Jul 25 03:36:41 hail kernel: drbd resource37: ack_receiver terminated
Jul 25 03:36:41 hail kernel: drbd resource37: Terminating drbd_a_resource
Jul 25 03:36:41 hail kernel: block drbd37: new current UUID B4D3BB7D18811429:7BAD3285364ECE5B:D315471E6BD376E8:D314471E6BD376E8
Jul 25 03:36:42 hail kernel: drbd resource37: conn( TearDown -> Disconnecting )
Jul 25 03:36:42 hail kernel: drbd resource37: Connection closed
Jul 25 03:36:42 hail kernel: drbd resource37: conn( Disconnecting -> StandAlone )
Jul 25 03:36:42 hail kernel: drbd resource37: receiver terminated
Jul 25 03:36:42 hail kernel: drbd resource37: Terminating drbd_r_resource
Jul 25 03:36:46 hail kernel: drbd resource37: conn( StandAlone -> Unconnected )
Jul 25 03:36:46 hail kernel: drbd resource37: Starting receiver thread (from drbd_w_resource [16068])
Jul 25 03:36:46 hail kernel: drbd resource37: receiver (re)started
Jul 25 03:36:46 hail kernel: drbd resource37: conn( Unconnected -> WFConnection )
Jul 25 03:36:47 hail kernel: drbd resource37: Handshake successful: Agreed network protocol version 101
Jul 25 03:36:47 hail kernel: drbd resource37: Feature flags enabled on protocol level: 0xf TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.
Jul 25 03:36:47 hail kernel: drbd resource37: Peer authenticated using 16 bytes HMAC
Jul 25 03:36:47 hail kernel: drbd resource37: conn( WFConnection -> WFReportParams )
Jul 25 03:36:47 hail kernel: drbd resource37: Starting ack_recv thread (from drbd_r_resource [17644])
Jul 25 03:36:54 hail kernel: block drbd37: drbd_sync_handshake:
Jul 25 03:36:54 hail kernel: block drbd37: self B4D3BB7D18811429:7BAD3285364ECE5B:D315471E6BD376E8:D314471E6BD376E8 bits:98 flags:0
Jul 25 03:36:54 hail kernel: block drbd37: peer 7BAD3285364ECE5A:0000000000000000:D315471E6BD376E8:D314471E6BD376E8 bits:0 flags:0
Jul 25 03:36:54 hail kernel: block drbd37: uuid_compare()=1 by rule 70
Jul 25 03:36:54 hail kernel: block drbd37: peer( Unknown -> Secondary ) conn( WFReportParams -> WFBitMapS ) pdsk( DUnknown -> Consistent )
Jul 25 03:36:54 hail kernel: block drbd37: send bitmap stats [Bytes(packets)]: plain 0(0), RLE 34(1), total 34; compression: 100.0%
Jul 25 03:36:54 hail kernel: block drbd37: receive bitmap stats [Bytes(packets)]: plain 0(0), RLE 34(1), total 34; compression: 100.0%
Jul 25 03:36:54 hail kernel: block drbd37: helper command: /bin/true before-resync-source minor-37
Jul 25 03:36:54 hail kernel: block drbd37: helper command: /bin/true before-resync-source minor-37 exit code 0 (0x0)
Jul 25 03:36:54 hail kernel: block drbd37: conn( WFBitMapS -> SyncSource ) pdsk( Consistent -> Inconsistent )
Jul 25 03:36:54 hail kernel: block drbd37: Began resync as SyncSource (will sync 496 KB [124 bits set]).
Jul 25 03:36:54 hail kernel: block drbd37: updated sync UUID B4D3BB7D18811429:7BAE3285364ECE5B:7BAD3285364ECE5B:D315471E6BD376E8
Jul 25 03:36:54 hail kernel: block drbd37: Resync done (total 1 sec; paused 0 sec; 496 K/sec)
Jul 25 03:36:54 hail kernel: block drbd37: updated UUIDs B4D3BB7D18811429:0000000000000000:7BAE3285364ECE5B:7BAD3285364ECE5B
Jul 25 03:36:54 hail kernel: block drbd37: conn( SyncSource -> Connected ) pdsk( Inconsistent -> UpToDate )
Jul 25 03:36:58 hail kernel: block drbd37: peer( Secondary -> Primary )
Jul 25 03:37:10 hail kernel: block drbd37: role( Primary -> Secondary )
Jul 25 03:37:10 hail kernel: block drbd37: 0 KB (0 bits) marked out-of-sync by on disk bit-map.
Jul 25 03:37:11 hail kernel: drbd resource37: peer( Primary -> Unknown ) conn( Connected -> Disconnecting ) pdsk( UpToDate -> DUnknown )
Jul 25 03:37:11 hail kernel: drbd resource37: ack_receiver terminated
Jul 25 03:37:11 hail kernel: drbd resource37: Terminating drbd_a_resource
Jul 25 03:37:11 hail kernel: drbd resource37: ASSERTION FAILED: connection->current_epoch->list not empty
Jul 25 03:37:11 hail kernel: drbd resource37: Connection closed
Jul 25 03:37:11 hail kernel: drbd resource37: conn( Disconnecting -> StandAlone )
Jul 25 03:37:11 hail kernel: drbd resource37: receiver terminated
Jul 25 03:37:11 hail kernel: drbd resource37: Terminating drbd_r_resource
Jul 25 03:37:11 hail kernel: drbd resource37: conn( StandAlone -> Unconnected )
Jul 25 03:37:11 hail kernel: drbd resource37: Starting receiver thread (from drbd_w_resource [16068])
Jul 25 03:37:11 hail kernel: drbd resource37: receiver (re)started
Jul 25 03:37:11 hail kernel: drbd resource37: conn( Unconnected -> WFConnection )
Jul 25 03:37:12 hail kernel: drbd resource37: Handshake successful: Agreed network protocol version 101
Jul 25 03:37:12 hail kernel: drbd resource37: Feature flags enabled on protocol level: 0xf TRIM THIN_RESYNC WRITE_SAME WRITE_ZEROES.
Jul 25 03:37:12 hail kernel: drbd resource37: Peer authenticated using 16 bytes HMAC
Jul 25 03:37:12 hail kernel: drbd resource37: conn( WFConnection -> WFReportParams )
Jul 25 03:37:12 hail kernel: drbd resource37: Starting ack_recv thread (from drbd_r_resource [18313])
Jul 25 03:37:12 hail kernel: block drbd37: drbd_sync_handshake:
Jul 25 03:37:12 hail kernel: block drbd37: self B4D3BB7D18811428:0000000000000000:7BAE3285364ECE5B:7BAD3285364ECE5B bits:0 flags:0
Jul 25 03:37:12 hail kernel: block drbd37: peer D70375DB919ACEDB:B4D3BB7D18811429:7BAE3285364ECE5A:7BAD3285364ECE5B bits:400 flags:0
Jul 25 03:37:12 hail kernel: block drbd37: uuid_compare()=-1 by rule 50
Jul 25 03:37:12 hail kernel: block drbd37: peer( Unknown -> Primary ) conn( WFReportParams -> WFBitMapT ) disk( UpToDate -> Outdated ) pdsk( DUnknown 
-> UpToDate )
Jul 25 03:37:12 hail kernel: block drbd37: receive bitmap stats [Bytes(packets)]: plain 0(0), RLE 37(1), total 37; compression: 100.0%
Jul 25 03:37:12 hail kernel: block drbd37: send bitmap stats [Bytes(packets)]: plain 0(0), RLE 37(1), total 37; compression: 100.0%
Jul 25 03:37:12 hail kernel: block drbd37: conn( WFBitMapT -> WFSyncUUID )
Jul 25 03:37:12 hail kernel: block drbd37: updated sync uuid B4D4BB7D18811428:0000000000000000:7BAE3285364ECE5B:7BAD3285364ECE5B
Jul 25 03:37:12 hail kernel: block drbd37: helper command: /bin/true before-resync-target minor-37
Jul 25 03:37:12 hail kernel: block drbd37: helper command: /bin/true before-resync-target minor-37 exit code 0 (0x0)
Jul 25 03:37:12 hail kernel: block drbd37: conn( WFSyncUUID -> SyncTarget ) disk( Outdated -> Inconsistent )
Jul 25 03:37:12 hail kernel: block drbd37: Began resync as SyncTarget (will sync 1600 KB [400 bits set]).
Jul 25 03:37:12 hail kernel: block drbd37: Resync done (total 1 sec; paused 0 sec; 1600 K/sec)
Jul 25 03:37:12 hail kernel: block drbd37: updated UUIDs D70375DB919ACEDA:0000000000000000:B4D4BB7D18811428:B4D3BB7D18811429
Jul 25 03:37:12 hail kernel: block drbd37: conn( SyncTarget -> Connected ) disk( Inconsistent -> UpToDate )
Jul 25 03:37:17 hail kernel: block drbd37: helper command: /bin/true after-resync-target minor-37
Jul 25 03:37:17 hail kernel: block drbd37: helper command: /bin/true after-resync-target minor-37 exit code 0 (0x0)
Jul 25 03:38:24 hail kernel: drbd resource37: peer( Primary -> Unknown ) conn( Connected -> Disconnecting ) pdsk( UpToDate -> DUnknown )
Jul 25 03:38:24 hail kernel: drbd resource37: ack_receiver terminated
Jul 25 03:38:24 hail kernel: drbd resource37: Terminating drbd_a_resource
Jul 25 03:38:26 hail kernel: drbd resource37: ASSERTION FAILED: connection->current_epoch->list not empty
Jul 25 03:38:26 hail kernel: drbd resource37: Connection closed
Jul 25 03:38:26 hail kernel: drbd resource37: conn( Disconnecting -> StandAlone )
Jul 25 03:38:26 hail kernel: drbd resource37: receiver terminated
Jul 25 03:38:26 hail kernel: drbd resource37: Terminating drbd_r_resource
Jul 25 03:38:26 hail kernel: block drbd37: disk( UpToDate -> Failed )
Jul 25 03:38:26 hail kernel: block drbd37: 0 KB (0 bits) marked out-of-sync by on disk bit-map.
Jul 25 03:38:26 hail kernel: block drbd37: disk( Failed -> Diskless )
Jul 25 03:38:26 hail kernel: general protection fault: 0000 [#1] SMP NOPTI
---

It looks like we saw "role( Primary -> Secondary )' around 7,500 times on this system before seeing this problem; there are about 16,000 such messages 
on the peer node.

Switching roles isn't something we can test under our current debug kernel because the the kernel is slow enough that the live migration scripts time 
out. Unless you already have a suggestion, I'll have to see if there's a subset of options which would still help here.

--Sarah
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
