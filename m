Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C40936114A7
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Oct 2022 16:35:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6CFCE4252DB;
	Fri, 28 Oct 2022 16:35:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 438 seconds by postgrey-1.31 at mail19;
	Fri, 28 Oct 2022 12:31:20 CEST
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5A56C4203BD
	for <drbd-dev@lists.linbit.com>; Fri, 28 Oct 2022 12:31:20 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 19DB3B80159;
	Fri, 28 Oct 2022 10:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 423D9C433C1;
	Fri, 28 Oct 2022 10:23:59 +0000 (UTC)
Date: Fri, 28 Oct 2022 06:24:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20221028062414.7859f787@gandalf.local.home>
In-Reply-To: <Y1uSG/7VXWLNlxlt@infradead.org>
References: <20221027150525.753064657@goodmis.org>
	<20221027150925.819019339@goodmis.org>
	<20221027111944.39b3a80c@gandalf.local.home>
	<Y1uSG/7VXWLNlxlt@infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Oct 2022 16:35:18 +0200
Cc: Jens Axboe <axboe@kernel.dk>, Stephen Boyd <sboyd@kernel.org>,
	linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	cgroups@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Guenter Roeck <linux@roeck-us.net>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [RFC][PATCH v2 04/31] timers: block: Use
 del_timer_shutdown() before freeing timer
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

On Fri, 28 Oct 2022 01:26:03 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> This is just a single patch out of apparently 31, which claims that
> something that doesn't even exist in mainline must be used without any
> explanation.  How do you expect anyone to be able to review it?

  https://lore.kernel.org/all/20221027150525.753064657@goodmis.org/

Only the first patch is relevant to you. I guess the Cc list would have
been too big to Cc everyone that was Cc'd in the series.

It not being in mainline is the reason I marked it RFC. As it's more of an
FYI than a pull it in request.

-- Steve
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
