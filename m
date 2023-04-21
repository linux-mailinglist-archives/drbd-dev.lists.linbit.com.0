Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B376EB457
	for <lists+drbd-dev@lfdr.de>; Sat, 22 Apr 2023 00:02:41 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 285944252C4;
	Sat, 22 Apr 2023 00:02:41 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E99494202E5
	for <drbd-dev@lists.linbit.com>; Sat, 22 Apr 2023 00:02:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zJtElQBBcdjQLKuTgcAUU6SVKeCB/u/2QO+HYPXJ5yM=;
	b=TZu/Zi5uyNmtM3AYC5F+uKMVsg
	hHiw+cqzzyEH5I7hS1byjWvZbtD93wTW5QBG4M2KWk+B9WNSSwm8v8mi/Pnh/wNHKblwtRlS/KMzQ
	Ay3jyrkfXj38Eh37M4Cv7VwmsBNNmqrv9OwKF8lm0f+wSW4Om7abWzDRmsfs9KuyHuU0Imx3Q0AER
	ZAbNWgHZn5tbTJvEdgqX6vx58Jc1AstSfU9BdUtC5U+O8zrXvOcpy1sMmYqObWFFEt0xJw9Ase7ZL
	24pyTndrtdkUUd3SbhFseygDv/Okmg+4zGC/X9a2KfIdvJud/46SLd6TpOspXAPAEoF1aQEjJW7ON
	WDwf8KDw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
	Hat Linux)) id 1ppypq-00Bv2r-1H; Fri, 21 Apr 2023 22:02:30 +0000
Date: Fri, 21 Apr 2023 15:02:30 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <ZEMH9h/cd9Cp1t+X@bombadil.infradead.org>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
	<20230421195807.2804512-4-mcgrof@kernel.org>
	<ZELuiBNNHTk4EdxH@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZELuiBNNHTk4EdxH@casper.infradead.org>
Cc: djwong@kernel.org, philipp.reisner@linbit.com, linux-mm@kvack.org,
	dm-devel@redhat.com, agk@redhat.com, drbd-dev@lists.linbit.com,
	hch@infradead.org, p.raghav@samsung.com,
	senozhatsky@chromium.org, snitzer@kernel.org,
	linux-block@vger.kernel.org, hare@suse.de, kbusch@kernel.org,
	axboe@kernel.dk, da.gomez@samsung.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	minchan@kernel.org, patches@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [PATCH 3/5] iomap: simplify iomap_init() with
	PAGE_SECTORS
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

On Fri, Apr 21, 2023 at 09:14:00PM +0100, Matthew Wilcox wrote:
> On Fri, Apr 21, 2023 at 12:58:05PM -0700, Luis Chamberlain wrote:
> > Just use the PAGE_SECTORS generic define. This produces no functional
> > changes. While at it use left shift to simplify this even further.
> 
> How is FOO << 2 simpler than FOO * 4?
> 
> > -	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
> > +	return bioset_init(&iomap_ioend_bioset, PAGE_SECTORS << 2,

We could just do:


-	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
+	return bioset_init(&iomap_ioend_bioset, 4 * PAGE_SECTORS,

The shift just seemed optimal if we're just going to change it.

  Luis
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
