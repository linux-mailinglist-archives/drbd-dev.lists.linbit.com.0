Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id E487C9A3F75
	for <lists+drbd-dev@lfdr.de>; Fri, 18 Oct 2024 15:23:24 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1D9DA420305;
	Fri, 18 Oct 2024 15:23:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
	[209.85.218.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6BBEF4202F6
	for <drbd-dev@lists.linbit.com>; Fri, 18 Oct 2024 15:23:17 +0200 (CEST)
Received: by mail-ej1-f48.google.com with SMTP id
	a640c23a62f3a-a99e3b3a411so506047066b.0
	for <drbd-dev@lists.linbit.com>; Fri, 18 Oct 2024 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1729257797;
	x=1729862597; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=BC8EXDV7rDKchQjydkpPwwnxdy4931IeTKZxGqD6z4k=;
	b=XI3OLZ5NmOVDJ4xnWmJS9bgPexJHSi6umqJsZqqpRpv38cZcG49RQqJ0bXIeg14DWw
	Y3oitrQH6ztZTMPq4BwUPbEARgsXYtOKojhkcalY/cpdebYc1j+bl/iJU5xZ9ekt0OMN
	HwHxKwVQbJAWcSU0SyKs1iHa8A1LAoGoohzVHnoT1iBzuIwV0fVXG0pMXC5oj25E+ML1
	/6mQbXrt5Efvf3+Qgh19TW6hboAZANjfuOgoVkTdoj/iufY0G8Lv5x2tuApIBc4By/Td
	MlUEsb2iR+81pPQI7VIEkMLAdY8T5AVHJX1Ff2l+gnNkKLXqb3lBNlYQ6jFT+0juN7XT
	3Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1729257797; x=1729862597;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=BC8EXDV7rDKchQjydkpPwwnxdy4931IeTKZxGqD6z4k=;
	b=j5aOAieIfETk26DUadPMEAez64Lll+j1NWi1XUlehqlTMQtnVZC36Xs9isjVcWSL+I
	OLqQXi6xP66sDQ/Dd3t5uLi8muZjTYPs4/Ot1aShxre3/TDb3qXhZomr1hsKmjhabIWo
	ProgJJQluVP5QG39AxTyIskX6JV8ZgYGpdtcKRDUe94rTavaGdO1zTyrjzkL+ntA8WuQ
	10UIu124iDAZIOJ4eitsC5IjGfTRqMq8JenhCUSeN3bQ/E0aO8wsEYuIOZaBft6xkFi3
	rPTuVVI3HnQQZl/FSL8qhzI6BHgFXJt//y6AemRhLpkgFgeOBPNRIZhnPoemrQezLL3w
	ZkRQ==
X-Gm-Message-State: AOJu0Yx4vhVwaQkO2iR1qvT835cK0gecivLAuabDIH6ocFmWV3vP87NH
	wB4ORBdfVXGeIU6wP9KXXiuU6VRBnGjEl5lIOLv/f+E3bMYcgvi6t7xHlnRTcfUiJp+Xk7Bqj0H
	1oAp2DiLdqZZlxjw7lfOFP87mWmeBTARAYEmz6+S1wmeoKAHGEM7zdw==
X-Google-Smtp-Source: AGHT+IEtKtSAyk+B7b8rZGDFnhsChIibd3sx29dKOHxdgjg3cPHz1gJS1InLtx5uiaTcrWOZVg1hKhoYmbmGDPwguBg=
X-Received: by 2002:a17:907:8004:b0:a9a:6c41:50c0 with SMTP id
	a640c23a62f3a-a9a6c4152aemr146038666b.26.1729257797223; Fri, 18 Oct 2024
	06:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <AGwA6wAvLabLP60uFbzuqqrb.1.1729080207471.Hmail.zhengbing.huang@easystack.cn>
	<ANkAFwBjLZbMNNV-w6M*dKqC.3.1729137033565.Hmail.zhengbing.huang@easystack.cn>
In-Reply-To: <ANkAFwBjLZbMNNV-w6M*dKqC.3.1729137033565.Hmail.zhengbing.huang@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Fri, 18 Oct 2024 15:23:06 +0200
Message-ID: <CAGNP_+U4gsRZ0otrJ15R9=aK2z-9n5cw837H-5jLRK=H7TAo4g@mail.gmail.com>
Subject: Re: drbd: resync blocks
To: Zhengbing <zhengbing.huang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
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

Hi Zhengbing,

Thanks for investigating this. I don't have any immediate comments on
this. It may take a while until I have time to look into it in detail.

It would be very helpful to have a reproducer. Ideally using the
framework from https://github.com/LINBIT/drbd9-tests

I guess this hasn't been reported by other users because it occurs
during a resync in the less common direction. Normally 9.1 and 9.2 are
only mixed for a short time while upgrading from 9.1 to 9.2. In this
case, the resync with mixed versions has the SyncSource on 9.1 and the
SyncTarget on 9.2. Nevertheless, it is a valid scenario that we want
to fix.

Best regards,
Joel

On Thu, 17 Oct 2024 at 06:30, Zhengbing <zhengbing.huang@easystack.cn> wrote:
>
>
> Hi Joel,
>
> In testing, we found that the problem is consistent with the one that commit "7a9ae1a208" solves.
> commit "7a9ae1a208" comment in w_e_end_rsdata_req() function:
>             /* DRBD versions without DRBD_FF_RESYNC_DAGTAG lock
>              * 128MiB "resync extents" in the activity log whenever
>              * they make resync requests. Some of these versions
>              * also lock activity lock extents when receiving
>              * P_DATA. In particular, DRBD 9.0 and 9.1. This can
>              * cause a deadlock if we send resync replies in these
>              * extents as follows:
>              * * Node is SyncTarget towards us
>              * * Node locks a resync extent and sends P_RS_DATA_REQUEST
>              * * Node receives P_DATA write in this extent; write
>              *   waits for resync extent to be unlocked
>              * * Node receives P_BARRIER (protocol A); receiver
>              *   thread blocks waiting for write to complete
>              * * We reply to P_RS_DATA_REQUEST, but it is never
>              *   processed because receiver thread is blocked
>              *
>              * Break the deadlock by canceling instead. This is
>              * sent on the control socket so it will be processed. */
>
> Then we found two suspicious pieces of code (patch content below):
> 1. In the w_e_end_rsdata_req() function, there is no lock protection between al_resync_extent_active() and drbd_rs_reply(), and P_DATA may be sent through this gap.
> @@ -180,9 +184,11 @@ struct lc_element *_al_get_nonblock(struct drbd_device *device, unsigned int enr
>  {
>      struct lc_element *al_ext;
>
> +    mutex_lock(&device->resync_lock);
>      spin_lock_irq(&device->al_lock);
>      al_ext = is_local ? lc_try_get_local(device->act_log, enr) : lc_try_get(device->act_log, enr);
>      spin_unlock_irq(&device->al_lock);
> +    mutex_unlock(&device->resync_lock);
>
>      return al_ext;
>  }
> @@ -192,9 +198,11 @@ struct lc_element *_al_get(struct drbd_device *device, unsigned int enr, bool is
>  {
>      struct lc_element *al_ext;
>
> +    mutex_lock(&device->resync_lock);
>      spin_lock_irq(&device->al_lock);
>      al_ext = is_local ? lc_get_local(device->act_log, enr) : lc_get(device->act_log, enr);
>      spin_unlock_irq(&device->al_lock);
> +    mutex_unlock(&device->resync_lock);
>
>      return al_ext;
>  }
> diff --git a/drbd/drbd_int.h b/drbd/drbd_int.h
> index e9d2c3914..95cf2bb48 100644
> --- a/drbd/drbd_int.h
> +++ b/drbd/drbd_int.h
> @@ -1588,6 +1588,7 @@ struct drbd_device {
>
>      int next_barrier_nr;
>      struct drbd_md_io md_io;
> +    struct mutex resync_lock;
>      spinlock_t al_lock;
>      wait_queue_head_t al_wait;
>      struct lru_cache *act_log;    /* activity log */
> diff --git a/drbd/drbd_main.c b/drbd/drbd_main.c
> index 02f4ae5d1..f625e2e83 100644
> --- a/drbd/drbd_main.c
> +++ b/drbd/drbd_main.c
> @@ -4092,6 +4092,7 @@ enum drbd_ret_code drbd_create_device(struct drbd_config_context *adm_ctx, unsig
>  #ifdef CONFIG_DRBD_TIMING_STATS
>      spin_lock_init(&device->timing_lock);
>  #endif
> +    mutex_init(&device->resync_lock);
>      spin_lock_init(&device->al_lock);
>
>      spin_lock_init(&device->pending_completion_lock);
> diff --git a/drbd/drbd_req.c b/drbd/drbd_req.c
> index c4aa23a31..f05e21dd3 100644
> --- a/drbd/drbd_req.c
> +++ b/drbd/drbd_req.c
> @@ -2383,6 +2383,7 @@ static bool prepare_al_transaction_nonblock(struct drbd_device *device,
>      bool made_progress = false;
>      int err;
>
> +    mutex_lock(&device->resync_lock);
>      spin_lock_irq(&device->al_lock);
>
>      /* Don't even try, if someone has it locked right now. */
> @@ -2418,6 +2419,7 @@ static bool prepare_al_transaction_nonblock(struct drbd_device *device,
>      }
>   out:
>      spin_unlock_irq(&device->al_lock);
> +    mutex_unlock(&device->resync_lock);
>      return made_progress;
>  }
>
> diff --git a/drbd/drbd_sender.c b/drbd/drbd_sender.c
> index 738be16d5..ddea6230a 100644
> --- a/drbd/drbd_sender.c
> +++ b/drbd/drbd_sender.c
> @@ -2106,6 +2106,7 @@ int w_e_end_rsdata_req(struct drbd_work *w, int cancel)
>      if (peer_device->repl_state[NOW] == L_AHEAD) {
>          err = drbd_send_ack(peer_device, P_RS_CANCEL, peer_req);
>      } else if (likely((peer_req->flags & EE_WAS_ERROR) == 0)) {
> +        mutex_lock(&peer_device->device->resync_lock);
>          if (unlikely(peer_device->disk_state[NOW] < D_INCONSISTENT)) {
>              if (connection->agreed_features & DRBD_FF_RESYNC_DAGTAG) {
>                  drbd_err_ratelimit(peer_device,
> @@ -2154,6 +2155,7 @@ int w_e_end_rsdata_req(struct drbd_work *w, int cancel)
>              if (expect_ack)
>                  peer_req = NULL;
>          }
> +        mutex_unlock(&peer_device->device->resync_lock);
>      } else {
>          drbd_err_ratelimit(peer_device, "Sending NegRSDReply. sector %llus.\n",
>              (unsigned long long)peer_req->i.sector);
>
>
> 2.The al_resync_extent_active() check does not include changing extent.
> --- a/drbd/drbd_actlog.c
> +++ b/drbd/drbd_actlog.c
> @@ -163,12 +163,16 @@ bool drbd_al_active(struct drbd_device *device, sector_t sector, unsigned int si
>
>         spin_lock_irq(&device->al_lock);
>         for (enr = first; enr <= last; enr++) {
> -               struct lc_element *al_ext;
> -               al_ext = lc_find(device->act_log, enr);
> -               if (al_ext && al_ext->refcnt > 0) {
> +               if (lc_is_used(device->act_log, enr)) {
>                         active = true;
>                         break;
>                 }
> +               // struct lc_element *al_ext;
> +               // al_ext = lc_find(device->act_log, enr);
> +               // if (al_ext && al_ext->refcnt > 0) {
> +               //      active = true;
> +               //      break;
> +               // }
>         }
>         spin_unlock_irq(&device->al_lock);
>
>
> When we fixed these two pieces of code, the problem continued to recur.
> Now the reason is that SyncSource send thead is also blocked, so it will not reply to P_RS_CANCEL ack.
>
> SyncSource send thead:
> [<0>] wait_woken+0x2c/0x60
> [<0>] sk_stream_wait_memory+0x2bb/0x340
> [<0>] do_tcp_sendpages+0x258/0x340
> [<0>] tcp_sendpage_locked+0x44/0x60
> [<0>] tcp_sendpage+0x37/0x50
> [<0>] inet_sendpage+0x52/0x90
> [<0>] dtt_send_page+0x93/0x140 [drbd_transport_tcp]
> [<0>] flush_send_buffer+0xd0/0x150 [drbd]
> [<0>] __send_command+0xf8/0x160 [drbd]
> [<0>] drbd_send_block+0xaa/0x230 [drbd]
> [<0>] drbd_rs_reply+0x26e/0x300 [drbd]
> [<0>] w_e_end_rsdata_req+0xd6/0x4b0 [drbd]
> [<0>] drbd_sender+0x13a/0x3d0 [drbd]
> [<0>] drbd_thread_setup+0x69/0x190 [drbd]
> [<0>] kthread+0x10a/0x120
> [<0>] ret_from_fork+0x1f/0x40
>
> SyncTarget receiver thread:
> [<0>] conn_wait_active_ee_empty_or_disconnect+0x7d/0xb0 [drbd]
> [<0>] receive_Barrier+0x16b/0x1f0 [drbd]
> [<0>] drbd_receiver+0x5af/0x7f0 [drbd]
> [<0>] drbd_thread_setup+0x5c/0x160 [drbd]
> [<0>] kthread+0x10a/0x120
> [<0>] ret_from_fork+0x1f/0x40
>
> Do you have any good solutions?
>
> Best regards,
> zhengbing
>
>
> From: Zhengbing <zhengbing.huang@easystack.cn>
> Date: 2024-10-16 20:03:27
> To: drbd-dev@lists.linbit.com
> Subject: drbd: resync blocks
>
> Hi Joel,
>
> I have a problem with resync blocks.
>
> First, I have a 2 node cluster, and node-1 running DRBD 9.1 and node -2 is DRBD 9.2 and protocol C.
> and the problem scenario is as follows:
> 1. node-2 always has application IO
> 2. node-1 network failure with node-2
> 3. the network is restored. node-1 is SyncTarget and node-2 is SyncSource
> 4. then resync process is blocks
>
> You solved the same problem in Commit "7a9ae1a208", but I still have this problem.
>
> So, how do I solve this problem?
>
> Best regards,
> zhengbing
>
>
>
