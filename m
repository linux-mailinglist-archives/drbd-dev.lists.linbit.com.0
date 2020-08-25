Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF20252473
	for <lists+drbd-dev@lfdr.de>; Wed, 26 Aug 2020 01:50:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3976E420D93;
	Wed, 26 Aug 2020 01:50:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.prgmr.com (mail.prgmr.com [71.19.149.6])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DA647420D89
	for <drbd-dev@lists.linbit.com>; Wed, 26 Aug 2020 01:50:18 +0200 (CEST)
Received: from [10.0.0.5] (c-69-181-255-113.hsd1.ca.comcast.net
	[69.181.255.113]) (Authenticated sender: srn)
	by mail.prgmr.com (Postfix) with ESMTPSA id 672D472020D;
	Tue, 25 Aug 2020 19:49:47 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com 672D472020D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
	s=default; t=1598399387;
	bh=aqj2gMbXR04OYLOfqIigzCH6m6rRfCJoBzVT8Kvxf34=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=D7/MCbXOGMqa0T3GY/BFhsjhhKXrUC1FKBHQg/9N1ralznvcNeWliOugb8pCVLXTG
	x2IvzeGd7RF3G1TihwWx3W06bDen4hvXpblIOtAfgATpUV7/qmT+Ctq9aVfqVgQWaM
	ErxVW81GC7ojz3CaN+/KMhlBTQvidHFevojfo50g=
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com, axboe@kernel.dk
References: <20200819055237.30920-1-srn@prgmr.com>
From: Sarah Newman <srn@prgmr.com>
Message-ID: <8b581990-a978-7cd8-041e-c5374b72f967@prgmr.com>
Date: Tue, 25 Aug 2020 16:49:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819055237.30920-1-srn@prgmr.com>
Content-Language: en-US
Cc: linux-block@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] block: drbd: defer calling kref_put until
 end of drbd_delete_device
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

On 8/18/20 10:52 PM, Sarah Newman wrote:
> At least once I saw:
> 
> drbd resource37: ASSERTION FAILED:
>    connection->current_epoch->list not empty
> drbd resource37: Connection closed
> drbd resource37: conn( Disconnecting -> StandAlone )
> drbd resource37: receiver terminated
> drbd resource37: Terminating drbd_r_resource
> block drbd37: disk( UpToDate -> Failed )
> block drbd37: 0 KB (0 bits) marked out-of-sync by on disk bit-map.
> block drbd37: disk( Failed -> Diskless )
> general protection fault: 0000 [#1] SMP NOPTI
> CPU: 0 PID: 18526 Comm: drbdsetup-84 Not tainted 5.4.46-1.el7.x86_64 #1
> RIP: e030:kobject_uevent_env+0x1d/0x660
> RSP: e02b:ffffc900757a7a10 EFLAGS: 00010246
> RAX: 0000000000000001 RBX: fdfdfdfdfdfe023d RCX: ffff8880606f9870
> RDX: 0000000000000000 RSI: 0000000000000001 RDI: fdfdfdfdfdfe023d
> RBP: ffff8880606f9870 R08: 0000000000000040 R09: ffffffffc01ae500
> R10: ffffc900757a7aa8 R11: ffffffffc01f0b58 R12: ffff8880606f9800
> R13: ffff88800fb5dc00 R14: ffffffff824055e5 R15: ffff88800fb5dc48
> FS:  00007fbbc98e4740(0000) GS:ffff888188a00000(0000)
>       knlGS:0000000000000000
> CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f978b44c000 CR3: 0000000007926000 CR4: 0000000000040660
> Call Trace:
> ? error_exit+0x5/0x20
> blk_integrity_del+0x1a/0x2b
> del_gendisk+0x27/0x2f0
> drbd_delete_device+0xcc/0x100 [drbd]
> adm_del_minor+0xc5/0xe0 [drbd]
> drbd_adm_down+0x13f/0x1f0 [drbd]
> genl_family_rcv_msg+0x1d2/0x410
> genl_rcv_msg+0x47/0x90
> ? __kmalloc_node_track_caller+0x217/0x2e0
> ? genl_family_rcv_msg+0x410/0x410
> netlink_rcv_skb+0x49/0x110
> genl_rcv+0x24/0x40
> netlink_unicast+0x191/0x220
> netlink_sendmsg+0x21d/0x3f0
> sock_sendmsg+0x5b/0x60
> sock_write_iter+0x97/0x100
> new_sync_write+0x12d/0x1d0
> vfs_write+0xa5/0x1a0
> ksys_write+0x59/0xd0
> do_syscall_64+0x5b/0x1a0
> entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x7fbbc93f1a00
> 
> Which I traced back to drbd_destroy_device being called early, as
> drbd_destroy_device sets memory to 0xfd and one of the pointers
> observed was an offset from 0xfdfdfdfdfdfdfdfd.
> 
> Make it so that the system can be recovered even if we see this bug,
> and call out if we unexpectedly do not free the device at the end
> of drbd_delete_device.
> 
> Signed-off-by: Sarah Newman <srn@prgmr.com>
> ---
>   drivers/block/drbd/drbd_main.c | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
> index a18155cdce41..9148713e8b3b 100644
> --- a/drivers/block/drbd/drbd_main.c
> +++ b/drivers/block/drbd/drbd_main.c
> @@ -2935,6 +2935,7 @@ void drbd_delete_device(struct drbd_device *device)
>   	struct drbd_resource *resource = device->resource;
>   	struct drbd_connection *connection;
>   	struct drbd_peer_device *peer_device;
> +	unsigned int minor = device_to_minor(device);
>   
>   	/* move to free_peer_device() */
>   	for_each_peer_device(peer_device, device)
> @@ -2942,15 +2943,24 @@ void drbd_delete_device(struct drbd_device *device)
>   	drbd_debugfs_device_cleanup(device);
>   	for_each_connection(connection, resource) {
>   		idr_remove(&connection->peer_devices, device->vnr);
> -		kref_put(&device->kref, drbd_destroy_device);
>   	}
> +	/* There is a problem somewhere with the reference counting for
> +	 * device->kref, such that at least once we saw the last kref_put before
> +	 * the very last one actually call drbd_destroy_device. Since it should
> +	 * be syntactically equivalent, move all the kref_puts to the end. We'll
> +	 * then get a warning if calling kref_put underflows.
> +	 */
>   	idr_remove(&resource->devices, device->vnr);
> -	kref_put(&device->kref, drbd_destroy_device);
>   	idr_remove(&drbd_devices, device_to_minor(device));
> -	kref_put(&device->kref, drbd_destroy_device);
>   	del_gendisk(device->vdisk);
>   	synchronize_rcu();
> +	for_each_connection(connection, resource) {
> +		kref_put(&device->kref, drbd_destroy_device);
> +	}
> +	kref_put(&device->kref, drbd_destroy_device);
>   	kref_put(&device->kref, drbd_destroy_device);
> +	if (!kref_put(&device->kref, drbd_destroy_device))
> +		pr_err("invalid kref for device %d\n", minor);
>   }
>   
>   static int __init drbd_init(void)
> 

Added linux-block as a CC. I can resend this patch if necessary.

Checking in to see if the patch is overall suitable and if so, whether any changes or additional testing is required before merging.

Thanks, Sarah
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
