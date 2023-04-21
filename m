Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A486B6EB2F4
	for <lists+drbd-dev@lfdr.de>; Fri, 21 Apr 2023 22:37:24 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 12F934202E5;
	Fri, 21 Apr 2023 22:37:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1387 seconds by postgrey-1.31 at mail19;
	Fri, 21 Apr 2023 22:37:22 CEST
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A7AFB4202E5
	for <drbd-dev@lists.linbit.com>; Fri, 21 Apr 2023 22:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7jDGoKVRVE8/8Iw2EXqkPonvmAc0gvYRAzqps4fjwwg=;
	b=mr+zjn1yXtzKk4APmgRaOn77YC
	qyrdJusW0V5fFBehp0H4LgJmcOzWB0HiZ/19FHS9XzMMBWYiQQiK2ov9vzahR7YBu95NK76q9JJZs
	AkLKN4MUKm/MQ5+LZ/SLYHWNNTKsZIr04BKzck1FGkgdltQkKD7lNhCvCFoMTcFExtsIMgiMKVPre
	m9Im6jnJmlKaq2x+wCYrcuNfTZjtNWDTsZNJmxJoZAgKC50KnsIBoeDx/zoi7hd2VV9XP++ihIvTA
	tOEZ5yH+/ubaSmLHWmwzD23OC6iMGfb2/N5vqIvhKd4FYrTP8/q/0FOd4KBWDZDlc9qXT016NGn1F
	NwwreEtg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1ppxA3-00FZsC-AG; Fri, 21 Apr 2023 20:15:15 +0000
Date: Fri, 21 Apr 2023 21:15:15 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZELu017UCTZWrCjv@casper.infradead.org>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
	<20230421195807.2804512-2-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421195807.2804512-2-mcgrof@kernel.org>
Cc: djwong@kernel.org, philipp.reisner@linbit.com, linux-mm@kvack.org,
	dm-devel@redhat.com, agk@redhat.com, drbd-dev@lists.linbit.com,
	hch@infradead.org, p.raghav@samsung.com,
	senozhatsky@chromium.org, snitzer@kernel.org,
	linux-block@vger.kernel.org, hare@suse.de, kbusch@kernel.org,
	axboe@kernel.dk, da.gomez@samsung.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	minchan@kernel.org, patches@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [PATCH 1/5] dm integrity: simplify by using
	PAGE_SECTORS_SHIFT
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

On Fri, Apr 21, 2023 at 12:58:03PM -0700, Luis Chamberlain wrote:
> -	*pl_index = sector >> (PAGE_SHIFT - SECTOR_SHIFT);
> +	*pl_index = sector >> (PAGE_SECTORS_SHIFT);

You could/should remove the () around PAGE_SECTORS_SHIFT

(throughout)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
