Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 499C061A145
	for <lists+drbd-dev@lfdr.de>; Fri,  4 Nov 2022 20:42:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CB70B4217B3;
	Fri,  4 Nov 2022 20:42:16 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B5320420237
	for <drbd-dev@lists.linbit.com>; Fri,  4 Nov 2022 20:42:14 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 02FAFB82DCA;
	Fri,  4 Nov 2022 19:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A74C433D6;
	Fri,  4 Nov 2022 19:42:11 +0000 (UTC)
Date: Fri, 4 Nov 2022 15:42:09 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20221104154209.21b26782@rorschach.local.home>
In-Reply-To: <20221104192232.GA2520396@roeck-us.net>
References: <20221104054053.431922658@goodmis.org>
	<20221104192232.GA2520396@roeck-us.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Thomas Gleixner <tglx@linutronix.de>, linux-leds@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	linux-afs@lists.infradead.org, lvs-devel@vger.kernel.org,
	linux-acpi@vger.kernel.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
	bridge@lists.linux-foundation.org, linux-pm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, rcu@vger.kernel.org,
	cgroups@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
	Anna-Maria Gleixner <anna-maria@linutronix.de>,
	linux-edac@vger.kernel.org, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-parisc@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	netfilter-devel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Drbd-dev] [RFC][PATCH v3 00/33] timers: Use timer_shutdown*()
 before freeing timers
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

On Fri, 4 Nov 2022 12:22:32 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> Unfortunately the renaming caused some symbol conflicts.
> 
> Global definition: timer_shutdown
> 
>   File             Line
> 0 time.c            93 static inline void timer_shutdown(struct clock_event_device *evt)
> 1 arm_arch_timer.c 690 static __always_inline int timer_shutdown(const int access,
> 2 timer-fttmr010.c 105 int (*timer_shutdown)(struct clock_event_device *evt);
> 3 timer-sp804.c    158 static inline void timer_shutdown(struct clock_event_device *evt)
> 4 timer.h          239 static inline int timer_shutdown(struct timer_list *timer)

$ git grep '\btimer_shutdown'
arch/arm/mach-spear/time.c:static inline void timer_shutdown(struct clock_event_device *evt)
arch/arm/mach-spear/time.c:     timer_shutdown(evt);
arch/arm/mach-spear/time.c:     timer_shutdown(evt);
arch/arm/mach-spear/time.c:     timer_shutdown(evt);
drivers/clocksource/arm_arch_timer.c:static __always_inline int timer_shutdown(const int access,
drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_VIRT_ACCESS, clk);
drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_PHYS_ACCESS, clk);
drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_MEM_VIRT_ACCESS, clk);
drivers/clocksource/arm_arch_timer.c:   return timer_shutdown(ARCH_TIMER_MEM_PHYS_ACCESS, clk);
drivers/clocksource/timer-fttmr010.c:   int (*timer_shutdown)(struct clock_event_device *evt);
drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
drivers/clocksource/timer-fttmr010.c:   fttmr010->timer_shutdown(evt);
drivers/clocksource/timer-fttmr010.c:           fttmr010->timer_shutdown = ast2600_timer_shutdown;
drivers/clocksource/timer-fttmr010.c:           fttmr010->timer_shutdown = fttmr010_timer_shutdown;
drivers/clocksource/timer-fttmr010.c:   fttmr010->clkevt.set_state_shutdown = fttmr010->timer_shutdown;
drivers/clocksource/timer-fttmr010.c:   fttmr010->clkevt.tick_resume = fttmr010->timer_shutdown;
drivers/clocksource/timer-sp804.c:static inline void timer_shutdown(struct clock_event_device *evt)
drivers/clocksource/timer-sp804.c:      timer_shutdown(evt);
drivers/clocksource/timer-sp804.c:      timer_shutdown(evt);

Honestly, I think these need to be renamed, as "timer_shutdown()"
should be specific to the timer code, and not individual timers.

I'll start making a patch set that starts by renaming these timers,
then adds the timer_shutdown() API, and finished with the trivial
updates, and that will be a real "PATCH" (non RFC).

Linus, should I also add any patches that has already been acked by the
respective maintainer?

-- Steve
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
