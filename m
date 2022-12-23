Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C467D65524E
	for <lists+drbd-dev@lfdr.de>; Fri, 23 Dec 2022 16:41:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 30327422129;
	Fri, 23 Dec 2022 16:41:22 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B00DB422115
	for <drbd-dev@lists.linbit.com>;
	Fri, 23 Dec 2022 16:41:20 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A75496150D;
	Fri, 23 Dec 2022 15:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55F15C433D2;
	Fri, 23 Dec 2022 15:41:15 +0000 (UTC)
Date: Fri, 23 Dec 2022 10:41:13 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, Thomas Gleixner
	<tglx@linutronix.de>
Message-ID: <20221223104113.0bc8d37f@gandalf.local.home>
In-Reply-To: <20221220134519.3dd1318b@gandalf.local.home>
References: <20221220134519.3dd1318b@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Tue, 20 Dec 2022 13:45:19 -0500
Steven Rostedt <rostedt@goodmis.org> wrote:

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

Note, I just did a git remote update, checked out the latest, re-ran the
script, and this patch hasn't changed.

-- Steve
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
