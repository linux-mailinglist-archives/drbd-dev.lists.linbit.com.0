Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E4522E49B
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Jul 2020 06:05:38 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1E89242046E;
	Mon, 27 Jul 2020 06:05:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 592 seconds by postgrey-1.31 at mail19;
	Mon, 27 Jul 2020 06:05:34 CEST
Received: from mail.prgmr.com (mail.prgmr.com [71.19.149.6])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 13C684203D2
	for <drbd-dev@lists.linbit.com>; Mon, 27 Jul 2020 06:05:34 +0200 (CEST)
Received: from [192.168.2.47] (c-174-62-72-237.hsd1.ca.comcast.net
	[174.62.72.237]) (Authenticated sender: srn)
	by mail.prgmr.com (Postfix) with ESMTPSA id B6457720091;
	Sun, 26 Jul 2020 23:55:10 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com B6457720091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
	s=default; t=1595822110;
	bh=DMklx9p86kSRquGheNq9JgwFoT395CVBgO/Mw0xQLYY=;
	h=To:From:Subject:Cc:Date:From;
	b=TnzbaQ1rzDdxU4eQTuyAYK9MySd6Q9YWgXC+HZb6aPbYf+zopiBmx301Y9fKAINlk
	Ne6HOCtaaoalC7O0N8KUso5hUZgZ//jIJXX/PTj41lGclSfmcYJ0Wjyo3u84mWsnLu
	z7g7KVd2HlqTCWX1RHL3JsuAxDnYtOx7yFf8VBFs=
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com
From: Sarah Newman <srn@prgmr.com>
Message-ID: <308845ca-17a3-43d0-b7ad-80069d9bc17f@prgmr.com>
Date: Sun, 26 Jul 2020 20:55:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
Cc: drbd-dev@lists.linbit.com
Subject: [Drbd-dev] Bug(s) with Linux v5.4.46
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

Hi,

We got the following kernel log messages:

Jul 25 03:38:24 hail kernel: ata1.00: error: { IDNF }
Jul 25 03:38:24 hail kernel: ata1.00: configured for UDMA/133
Jul 25 03:38:24 hail kernel: ata1: EH complete
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
Jul 25 03:38:26 hail kernel: CPU: 0 PID: 18526 Comm: drbdsetup-84 Not tainted 5.4.46-1_prgmr.el7.x86_64 #1
Jul 25 03:38:26 hail kernel: Hardware name: HPE ProLiant DL325 Gen10/ProLiant DL325 Gen10, BIOS A41 03/09/2020
Jul 25 03:38:26 hail kernel: RIP: e030:kobject_uevent_env+0x1d/0x660
Jul 25 03:38:26 hail kernel: Code: 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 41 57 89 f0 41 56 41 55 41 54 55 53 48 83 ec 38 4c 8b 34 c5 00 e8 17 82 83 
fe 01 75 04 <80> 4f 3c 08 48 89 f8 eb 0d 48 8b 40 18 48 85 c0 0f 84 19 01 00 00
Jul 25 03:38:26 hail kernel: RSP: e02b:ffffc900757a7a10 EFLAGS: 00010246
Jul 25 03:38:26 hail kernel: RAX: 0000000000000001 RBX: fdfdfdfdfdfe023d RCX: ffff8880606f9870
Jul 25 03:38:26 hail kernel: RDX: 0000000000000000 RSI: 0000000000000001 RDI: fdfdfdfdfdfe023d
Jul 25 03:38:26 hail kernel: RBP: ffff8880606f9870 R08: 0000000000000040 R09: ffffffffc01ae500
Jul 25 03:38:26 hail kernel: R10: ffffc900757a7aa8 R11: ffffffffc01f0b58 R12: ffff8880606f9800
Jul 25 03:38:26 hail kernel: R13: ffff88800fb5dc00 R14: ffffffff824055e5 R15: ffff88800fb5dc48
Jul 25 03:38:26 hail kernel: FS:  00007fbbc98e4740(0000) GS:ffff888188a00000(0000) knlGS:0000000000000000
Jul 25 03:38:26 hail kernel: CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
Jul 25 03:38:26 hail kernel: CR2: 00007f978b44c000 CR3: 0000000007926000 CR4: 0000000000040660
Jul 25 03:38:26 hail kernel: Call Trace:
Jul 25 03:38:26 hail kernel: ? error_exit+0x5/0x20
Jul 25 03:38:26 hail kernel: blk_integrity_del+0x1a/0x2b
Jul 25 03:38:26 hail kernel: del_gendisk+0x27/0x2f0
Jul 25 03:38:26 hail kernel: drbd_delete_device+0xcc/0x100 [drbd]
Jul 25 03:38:26 hail kernel: adm_del_minor+0xc5/0xe0 [drbd]
Jul 25 03:38:26 hail kernel: drbd_adm_down+0x13f/0x1f0 [drbd]
Jul 25 03:38:26 hail kernel: genl_family_rcv_msg+0x1d2/0x410
Jul 25 03:38:26 hail kernel: genl_rcv_msg+0x47/0x90
Jul 25 03:38:26 hail kernel: ? __kmalloc_node_track_caller+0x217/0x2e0
Jul 25 03:38:26 hail kernel: ? genl_family_rcv_msg+0x410/0x410
Jul 25 03:38:26 hail kernel: netlink_rcv_skb+0x49/0x110
Jul 25 03:38:26 hail kernel: genl_rcv+0x24/0x40
Jul 25 03:38:26 hail kernel: netlink_unicast+0x191/0x220
Jul 25 03:38:26 hail kernel: netlink_sendmsg+0x21d/0x3f0
Jul 25 03:38:26 hail kernel: sock_sendmsg+0x5b/0x60
Jul 25 03:38:26 hail kernel: sock_write_iter+0x97/0x100
Jul 25 03:38:26 hail kernel: new_sync_write+0x12d/0x1d0
Jul 25 03:38:26 hail kernel: vfs_write+0xa5/0x1a0
Jul 25 03:38:26 hail kernel: ksys_write+0x59/0xd0
Jul 25 03:38:26 hail kernel: do_syscall_64+0x5b/0x1a0
Jul 25 03:38:26 hail kernel: entry_SYSCALL_64_after_hwframe+0x44/0xa9
Jul 25 03:38:26 hail kernel: RIP: 0033:0x7fbbc93f1a00
Jul 25 03:38:26 hail kernel: Code: 73 01 c3 48 8b 0d 70 74 2d 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 83 3d bd d5 2d 00 00 75 10 b8 01 00 
00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 ee cb 01 00 48 89 04 24
Jul 25 03:38:26 hail kernel: RSP: 002b:00007ffe63ab8ce8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
Jul 25 03:38:26 hail kernel: RAX: ffffffffffffffda RBX: 0000000001bb8070 RCX: 00007fbbc93f1a00
Jul 25 03:38:26 hail kernel: RDX: 0000000000000030 RSI: 0000000001bb8080 RDI: 0000000000000003
Jul 25 03:38:26 hail kernel: RBP: 0000000000000030 R08: 00007ffe63ab8d54 R09: 0000000000000000
Jul 25 03:38:26 hail kernel: R10: 000000000000006b R11: 0000000000000246 R12: 0000000001bb8080
Jul 25 03:38:26 hail kernel: R13: 0000000000000030 R14: 0000000000000003 R15: 0000000000414378
Jul 25 03:38:26 hail kernel: Modules linked in: 8021q garp mrp bonding xt_physdev ip6table_filter ip6_tables xt_conntrack nf_conntrack nf_defrag_ipv6 
nf_defrag_ipv4 ib_isert iscsi_target_mod ib_srpt target_core_mod ib_srp scsi_transport_srp rpcrdma sunrpc rdma_ucm ib_iser rdma_cm iw_cm ib_umad 
libiscsi ib_ipoib scsi_transport_iscsi ib_cm mlx4_ib ib_uverbs ib_core crct10dif_pclmul crc32_pclmul hpilo ghash_clmulni_intel pcspkr cdc_eem usbnet 
mii hpwdt ccp sp5100_tco k10temp ipmi_si i2c_piix4 wmi ipmi_devintf ipmi_msghandler tun acpi_power_meter sch_ingress sch_htb raid456 async_raid6_recov 
async_memcpy async_pq async_xor async_tx xor raid6_pq raid10 fuse ext2 ebt_mark ebt_ip ebt_ip6 ebt_arp ebtable_nat ebtable_filter ebtables drbd 
lru_cache libcrc32c cls_u32 cls_fw br_netfilter bridge stp llc xenfs xen_privcmd act_police mlx4_en raid1 crc32c_intel serio_raw drm_vram_helper ttm 
igb ptp pps_core dca mlx4_core xen_pciback xen_netback xen_blkback xen_gntalloc xen_gntdev xen_evtchn
Jul 25 03:38:26 hail kernel: ---[ end trace 664811a432d5d82a ]---
Jul 25 03:38:26 hail kernel: RIP: e030:kobject_uevent_env+0x1d/0x660
Jul 25 03:38:26 hail kernel: Code: 44 00 00 66 2e 0f 1f 84 00 00 00 00 00 41 57 89 f0 41 56 41 55 41 54 55 53 48 83 ec 38 4c 8b 34 c5 00 e8 17 82 83 
fe 01 75 04 <80> 4f 3c 08 48 89 f8 eb 0d 48 8b 40 18 48 85 c0 0f 84 19 01 00 00
Jul 25 03:38:26 hail kernel: RSP: e02b:ffffc900757a7a10 EFLAGS: 00010246
Jul 25 03:38:26 hail kernel: RAX: 0000000000000001 RBX: fdfdfdfdfdfe023d RCX: ffff8880606f9870
Jul 25 03:38:26 hail kernel: RDX: 0000000000000000 RSI: 0000000000000001 RDI: fdfdfdfdfdfe023d
Jul 25 03:38:26 hail kernel: RBP: ffff8880606f9870 R08: 0000000000000040 R09: ffffffffc01ae500
Jul 25 03:38:26 hail kernel: R10: ffffc900757a7aa8 R11: ffffffffc01f0b58 R12: ffff8880606f9800
Jul 25 03:38:26 hail kernel: R13: ffff88800fb5dc00 R14: ffffffff824055e5 R15: ffff88800fb5dc48
Jul 25 03:38:26 hail kernel: FS:  00007fbbc98e4740(0000) GS:ffff888188a00000(0000) knlGS:0000000000000000
Jul 25 03:38:26 hail kernel: CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
Jul 25 03:38:26 hail kernel: CR2: 00007f978b44c000 CR3: 0000000007926000 CR4: 0000000000040660

Reading this:

kobject_uevent_env+0x1d resolves to:

(gdb) list *(kobject_uevent_env+0x1d)
Line 474 of "lib/kobject_uevent.c" starts at address 0xffffffff81a0f70d <kobject_uevent_env+29> and ends at 0xffffffff81a0f711 <kobject_uevent_env+33>.

Which is:
         if (action == KOBJ_REMOVE)
                 kobj->state_remove_uevent_sent = 1
0xffffffff81a0f70d <kobject_uevent_env+29>:  orb    $0x8,0x3c(%rdi)

kobj as $rdi is 0xfdfdfdfdfdfe023d.

The pointer in question is passed in from:

(gdb) list *(blk_integrity_del+0x1a)
Line 441 of "block/blk-integrity.c" starts at address 0xffffffff814d5d5a <blk_integrity_del+26> and ends at 0xffffffff814d5d62 <blk_integrity_del+34>.

Line's 440 and 441:
      kobject_uevent(&disk->integrity_kobj, KOBJ_REMOVE);
      kobject_del(&disk->integrity_kobj);

What is the offset of integrity_kobj?

(gdb) p &((struct gendisk *)0)->integrity_kobj
$1 = (struct kobject *) 0x440

The pointer we see above, 0xfdfdfdfdfdfe023d, - 0x440 is 0xfdfdfdfdfdfdfdfd.

blk_integrity_del is called at the beginning of del_gendisk near the end of drbd_delete_device. This is the code block from drbd_delete_device around 
there:

	kref_put(&device->kref, drbd_destroy_device);
	del_gendisk(device->vdisk);
	synchronize_rcu();
	kref_put(&device->kref, drbd_destroy_device);
}

In drbd_destroy_device, there is the line:

memset(device, 0xfd, sizeof(*device));

So I think that drbd_destroy_device must have run before del_gendisk, and therefore the reference count for device->kref is unbalanced.

I do not know if this is related to the error message:

  ASSERTION FAILED: connection->current_epoch->list not empty

or not.

There were no error messages reported on the peer.

FYI, when we've run in debug mode we've seen some ODEBUG errors about freeing active objects around the time that DRBD resources were released. One 
was a work_struct and the other was a timer_list. I do not know if either of those are related.

The system in question is still up and running in an error state; is there any more information you want from it?

--Sarah
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
