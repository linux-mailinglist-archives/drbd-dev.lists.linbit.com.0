Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29A653DD1
	for <lists+drbd-dev@lfdr.de>; Thu, 22 Dec 2022 11:02:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0FDDC421792;
	Thu, 22 Dec 2022 11:02:19 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 264E5421792
	for <drbd-dev@lists.linbit.com>; Thu, 22 Dec 2022 11:02:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671703335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=o6jO/LCV2IF2UxvEuH5GPFWr6SJ3JZsJjPnFQmLY128=;
	b=J8KWvYrdRMUcYz7OnJvR3piSBL6vCgwTYe3bO3Dqtp49Sg6Y/qebYMpzuIEshDIJG8Qt3y
	lS2qdgP1B3JZgpTOOj6uaU1Y9PF8OUSt5m6erW4AHvpyUR3x9R1GtjSpneZ2cHHuffH6kI
	Zvnnxi2agB3WktngJWxi5AbDBdsHoCk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
	us-mta-104-ELTp7VjEPPug2MWai0xjYw-1; Thu, 22 Dec 2022 05:02:11 -0500
X-MC-Unique: ELTp7VjEPPug2MWai0xjYw-1
Received: by mail-qk1-f197.google.com with SMTP id
	br6-20020a05620a460600b007021e1a5c48so909838qkb.6
	for <drbd-dev@lists.linbit.com>; Thu, 22 Dec 2022 02:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=content-transfer-encoding:mime-version:user-agent:references
	:in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
	:from:to:cc:subject:date:message-id:reply-to;
	bh=o6jO/LCV2IF2UxvEuH5GPFWr6SJ3JZsJjPnFQmLY128=;
	b=E9pOYBFHMn8e0WY4doo7A6AvMlEmNIPK1pu3V3UcW56W3SxfvT/Yq/0OsvTK/v+Lgx
	aACBExB/pVV6vJUS8mVY0SHNSSDo722K8DprQ28JOq39bStV34jXlBNatKwipOWgqcMp
	1qDgxEwfP1LBrGLZGvmTcYdjXVonTAwV0ZkHmV4TL9l8Ohg515/5hT0X6+R6ASlm5sEd
	c7apVoHckj2TE8Ar6BqBXGH9EAGjiutNjINavPewbF8hhU8ZmBqV+HcMCblV/UKZ5OLM
	G5toUwRxi5lTvNfOVDr2ezXXsyF9ZQltk0GAXQmvVoDgADT+GP5UoU9ClAA4ulMsnpre
	oghA==
X-Gm-Message-State: AFqh2kpRSEEmloaszz9LYHVsSqTb/ifgx73KjIQ2wS5t0A5TwJkIGCuz
	LCeMGqnrcK2DIE5TOSc4nkgi/+zz6HnyanCefM9NAHLTjWGsApgkp0G68EmNrzqDSaPZU25oIkH
	bCOg+wSEoMhmCS1xhYUEg
X-Received: by 2002:a0c:c508:0:b0:4e5:a127:382f with SMTP id
	x8-20020a0cc508000000b004e5a127382fmr6466208qvi.48.1671703331053;
	Thu, 22 Dec 2022 02:02:11 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtZnBvcAi4VqZ0nAfseRa5ZZncJObkgh59kN1yODkWBS5WICo+kLsdO+KK5pqcbrrZqdW1DHQ==
X-Received: by 2002:a0c:c508:0:b0:4e5:a127:382f with SMTP id
	x8-20020a0cc508000000b004e5a127382fmr6466171qvi.48.1671703330733;
	Thu, 22 Dec 2022 02:02:10 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-101-173.dyn.eolo.it.
	[146.241.101.173]) by smtp.gmail.com with ESMTPSA id
	f1-20020a05620a408100b006cfc9846594sm4269qko.93.2022.12.22.02.02.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Dec 2022 02:02:10 -0800 (PST)
Message-ID: <8d91ab13f56e88af0f6133130808f9623b3adb2e.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>, Linus Torvalds
	<torvalds@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>
Date: Thu, 22 Dec 2022 11:02:01 +0100
In-Reply-To: <20221220134519.3dd1318b@gandalf.local.home>
References: <20221220134519.3dd1318b@gandalf.local.home>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
	linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
	SHA-cyfmac-dev-list@infineon.com, linux-leds@vger.kernel.org,
	drbd-dev@lists.linbit.com, lvs-devel@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-atm-general@lists.sourceforge.net,
	Julia Lawall <Julia.Lawall@inria.fr>, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
	linux-ext4@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	linux-media@vger.kernel.org, bridge@lists.linux-foundation.org,
	intel-gfx@lists.freedesktop.org, linux-nfs@vger.kernel.org,
	linux-block@vger.kernel.org, cgroups@vger.kernel.org,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	brcm80211-dev-list.pdl@broadcom.com,
	Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-bluetooth@vger.kernel.org, netfilter-devel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Drbd-dev] [PATCH] treewide: Convert del_timer*() to
	timer_shutdown*()
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

On Tue, 2022-12-20 at 13:45 -0500, Steven Rostedt wrote:
> [
>   Linus,
> 
>     I ran the script against your latest master branch:
>     commit b6bb9676f2165d518b35ba3bea5f1fcfc0d969bf
> 
>     As the timer_shutdown*() code is now in your tree, I figured
>     we can start doing the conversions. At least add the trivial ones
>     now as Thomas suggested that this gets applied at the end of the
>     merge window, to avoid conflicts with linux-next during the
>     development cycle. I can wait to Friday to run it again, and
>     resubmit.
> 
>     What is the best way to handle this?
> ]
> 
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> Due to several bugs caused by timers being re-armed after they are
> shutdown and just before they are freed, a new state of timers was added
> called "shutdown". After a timer is set to this state, then it can no
> longer be re-armed.
> 
> The following script was run to find all the trivial locations where
> del_timer() or del_timer_sync() is called in the same function that the
> object holding the timer is freed. It also ignores any locations where the
> timer->function is modified between the del_timer*() and the free(), as
> that is not considered a "trivial" case.
> 
> This was created by using a coccinelle script and the following commands:
> 
>  $ cat timer.cocci
> @@
> expression ptr, slab;
> identifier timer, rfield;
> @@
> (
> -       del_timer(&ptr->timer);
> +       timer_shutdown(&ptr->timer);
> > 
> -       del_timer_sync(&ptr->timer);
> +       timer_shutdown_sync(&ptr->timer);
> )
>   ... when strict
>       when != ptr->timer
> (
>         kfree_rcu(ptr, rfield);
> > 
>         kmem_cache_free(slab, ptr);
> > 
>         kfree(ptr);
> )
> 
>  $ spatch timer.cocci . > /tmp/t.patch
>  $ patch -p1 < /tmp/t.patch
> 
> Link: https://lore.kernel.org/lkml/20221123201306.823305113@linutronix.de/
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>

For the networking bits:

>  drivers/net/ethernet/intel/i40e/i40e_main.c      |  6 +++---
>  drivers/net/ethernet/marvell/sky2.c              |  2 +-
>  drivers/net/ethernet/sun/sunvnet.c               |  2 +-
>  drivers/net/usb/sierra_net.c                     |  2 +-
>  net/802/garp.c                                   |  2 +-
>  net/802/mrp.c                                    |  4 ++--
>  net/bridge/br_multicast.c                        |  8 ++++----
>  net/bridge/br_multicast_eht.c                    |  4 ++--
>  net/core/gen_estimator.c                         |  2 +-
>  net/ipv4/ipmr.c                                  |  2 +-
>  net/ipv6/ip6mr.c                                 |  2 +-
>  net/mac80211/mesh_pathtbl.c                      |  2 +-
>  net/netfilter/ipset/ip_set_list_set.c            |  2 +-
>  net/netfilter/ipvs/ip_vs_lblc.c                  |  2 +-
>  net/netfilter/ipvs/ip_vs_lblcr.c                 |  2 +-
>  net/netfilter/xt_IDLETIMER.c                     |  4 ++--
>  net/netfilter/xt_LED.c                           |  2 +-
>  net/sched/cls_flow.c                             |  2 +-
>  net/sunrpc/svc.c                                 |  2 +-
>  net/tipc/discover.c                              |  2 +-
>  net/tipc/monitor.c                               |  2 +-

Acked-by: Paolo Abeni <pabeni@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
