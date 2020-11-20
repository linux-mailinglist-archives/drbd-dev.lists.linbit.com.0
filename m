Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 193DF2BA59D
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Nov 2020 10:13:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 07B684207E9;
	Fri, 20 Nov 2020 10:13:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 670194207E4
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 10:13:34 +0100 (CET)
Received: by mail-io1-f66.google.com with SMTP id u21so9179079iol.12
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 01:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2zRE/ngI8nW9pepj06Wkfz4UngmzBlhBZDu0v1Fe2g4=;
	b=gEQggfyl2ooVIBOeLbW+ZcC5OdfXAwRS9E/PLNzIdCg0GY/c89ic6uGnhSYG2uExl+
	Zir/LKwLqz0hBj6khXtifVkhSkEYw3X1uehuw+v735kARYJuz75fh5XLFnV9cDS8i6Wu
	RMfkQBiU5zgOHM3+aNESgdXOhPqIJw72J1KpawyKXLmJ3PxRzi9yxTAD6SkbUDGyGebV
	89HPBJTXLl7gOdComAG6hITVRDeZwpcJiKq33MHfx7vauXF0VpnkST0HNycx4Qn9aup5
	65ExSwnupNMvfgPJq0FxVqTAWpQP6xT3TqE4VGX6AEB1/MBpN6yoGVTgY6RJzHsdunD7
	Cmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2zRE/ngI8nW9pepj06Wkfz4UngmzBlhBZDu0v1Fe2g4=;
	b=Gt7KyeoXcYcC+Ko8GT4BZx2icK+QD62wt+k3guuWvsTr8RJ0e99nRfatKcEd5LFIzt
	9AGZQIv4ijH5YChOrKUlZHJM+Htju+Z9ezvmS6RDdsWZZsLnrGxx1u3IA8RMl7EFTAF5
	zRFvWG1o6i6YnpOpZTuVcZiiRZqvgFcJu505bmbBdmboIB7Ts792tV69EwxfWWGGc1dm
	mnzrnpKF6phghbrbwnUvyqfreymOtSSPImjhMO8GNPZHbx0jCr9orCCY7TTQC5uos7qT
	KBbEpBFhbAsVMK9HVXInmEu4hEpbIJ/nm8D0P7Q7c/4ZayJrTjfqQw3urlNzt7JUs2T0
	2lCA==
X-Gm-Message-State: AOAM5311ta7/h925NWNNrVsoU4RUauGqJF1cujMbb5/s7pprtaOwRbmN
	B5ArC+MtX53xH/FGrp3psSHgvFPCNKPEOt+2lQ+cDMaYBKsD0j+IfRs=
X-Google-Smtp-Source: ABdhPJyJJu7JEYi7Q9HHD/DbmnBNMARsXU0i++d3Cr767DW4G3FtAfQAwgYVBEdI5sYXdXgTKDnLzWv2b269WAnXuV4=
X-Received: by 2002:a5d:9d16:: with SMTP id j22mr24662235ioj.172.1605863613287;
	Fri, 20 Nov 2020 01:13:33 -0800 (PST)
MIME-Version: 1.0
References: <859ad180-0e92-5542-4d52-730589e99682@easystack.cn>
In-Reply-To: <859ad180-0e92-5542-4d52-730589e99682@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 20 Nov 2020 10:13:22 +0100
Message-ID: <CADGDV=X9P9A+ig-K-nCcTvTD11jTWE6ai0SH17BDm1MLb+DCzQ@mail.gmail.com>
To: Zhang Duan <duan.zhang@easystack.cn>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 2/2] drbd: delay resync start unless source
 has transferred to L_SYNC_SOURCE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Zhang,

The explanation is sound, the patch looks good. I am going to apply this.

What I wanted to ask:
Are you using automated tests to find this kind of defects?
The tests we maintain are here: https://github.com/LINBIT/drbd9-tests
We would welcome very much if you contribute your tests to this as well.

best regards,
 Phil

On Wed, Nov 18, 2020 at 9:46 AM Zhang Duan <duan.zhang@easystack.cn> wrote:
>
> drbd_start_resync may be rescheduled due to down_trylock failure, leaves a
> state of L_WF_BITMAP_S while target state is L_SYNC_TARGET and already has
> sent its resync request. Then, resync going on while the source is
> L_WF_BITMAP_S
> will lead to data lose by time sequence below:
>
> L_WF_BITMAP_S                   L_SYNC_TARGET
>                                  resync request(sector A)
> reply old data(A)               read & write old data(A)
> new IO(A)
> send oos(A)                     set oos(A)
> A is at new version             resync write A done
>                                  set in sync(A) but A is at old version
>
> Signed-off-by: ZhangDuan <duan.zhang@easystack.cn>
> ---
>   drbd/drbd_receiver.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git drbd/drbd_receiver.c drbd/drbd_receiver.c
> index a31e44b2..7a9ce4d0 100644
> --- drbd/drbd_receiver.c
> +++ drbd/drbd_receiver.c
> @@ -3301,6 +3301,15 @@ static int receive_DataRequest(struct
> drbd_connection *connection, struct packet
>                 return ignore_remaining_packet(connection, pi->size);
>         }
>   +     /* Tell target to have a retry, waiting for the rescheduled
> +        * drbd_start_resync to complete. Otherwise the concurrency
> +        * of send oos and resync may lead to a data lose. */
> +       if ((pi->cmd == P_RS_DATA_REQUEST || pi->cmd == P_CSUM_RS_REQUEST) &&
> +                       peer_device->repl_state[NOW] == L_WF_BITMAP_S) {
> +               drbd_send_ack_rp(peer_device, P_RS_CANCEL, p);
> +               return ignore_remaining_packet(connection, pi->size);
> +       }
> +
>         peer_req = drbd_alloc_peer_req(peer_device, GFP_TRY);
>         err = -ENOMEM;
>         if (!peer_req)
> --
> 2.24.0.windows.2
>
>
> --
> Sincerely Yours,
> Zhang Duan
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
