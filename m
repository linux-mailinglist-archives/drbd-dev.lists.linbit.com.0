Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B5234610C24
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Oct 2022 10:26:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3655F420960;
	Fri, 28 Oct 2022 10:26:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF7CF420321
	for <drbd-dev@lists.linbit.com>; Fri, 28 Oct 2022 10:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NSFvNasYsfodbnQHojzQMqo+zVFJLt7KLaSOZRcfaUo=;
	b=bLdfCKmpWHGIaP8dtWXbmk1azY
	3V0CcnTEZ27fcVNfDAzAhxdGG6lCTYWqzDmOVPnITxvO0hCyl8rkNg9dxNDb6IONIHt9A+wKFX92j
	g0ATxvMYQFh+6Vok1Bf8jOatYALAROFElh6U0OgBkVX0ndqLN0OAinRgSP7pc7Lu0n6RVkFvVaJJd
	zkbjIteUfej7HyCW1IBZOHVxKQvszSJslt4MFRLD7jgRuAGPZNvE9pm28BdJErSjA0PFCf0YVWDJH
	aF2edsB8E5AgzWYZscjS97W5BB3RTGGW7Mg8S/IlAPTb/r+cyw6G2WJFKMWka94flyzU0aqCBS9Do
	4m3xz2cw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1ooKgl-00G8rL-Il; Fri, 28 Oct 2022 08:26:03 +0000
Date: Fri, 28 Oct 2022 01:26:03 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <Y1uSG/7VXWLNlxlt@infradead.org>
References: <20221027150525.753064657@goodmis.org>
	<20221027150925.819019339@goodmis.org>
	<20221027111944.39b3a80c@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027111944.39b3a80c@gandalf.local.home>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
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

This is just a single patch out of apparently 31, which claims that
something that doesn't even exist in mainline must be used without any
explanation.  How do you expect anyone to be able to review it?
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
