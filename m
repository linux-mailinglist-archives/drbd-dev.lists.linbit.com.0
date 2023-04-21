Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5E6EB2F6
	for <lists+drbd-dev@lfdr.de>; Fri, 21 Apr 2023 22:37:53 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 496E24252BF;
	Fri, 21 Apr 2023 22:37:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D02D34252C7
	for <drbd-dev@lists.linbit.com>; Fri, 21 Apr 2023 22:37:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=A2XozTJws4toh13zEJ4n565nKKguH3N7JeE3lhWnoDE=;
	b=KazI3OChQ8xi0cwyBWWi2wSA+d
	Dv6s5by1QWGWvpAlTZWGesKNdytZlLSAOalemBEZO5rELZUMfVeAY1yZ3qclyF0geINsWblz8o9JL
	KrCp/O0cKi2DLEYQQN08eZ21fTIZ0L+F8tqLSxzO0hmvR/ttXJr3rOL0pEgRfoaFXGQvs5IVHOHZZ
	zxTc3G+5goFSv5y1kllt2rSeIkt+cwOtNK+S+HhWtGPacqN3frlkpTebwCYWwbszRhF/mRefjwcIe
	CuzZGi/qjzq6oLG6SAyyoiOIgXbRDVTOGZtPQOQ5R3M4zoPS5TI38FfuJsg7RWNB05tynED3yvDp7
	IUu5SVig==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1ppx8q-00FZlw-Dy; Fri, 21 Apr 2023 20:14:00 +0000
Date: Fri, 21 Apr 2023 21:14:00 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZELuiBNNHTk4EdxH@casper.infradead.org>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
	<20230421195807.2804512-4-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421195807.2804512-4-mcgrof@kernel.org>
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

On Fri, Apr 21, 2023 at 12:58:05PM -0700, Luis Chamberlain wrote:
> Just use the PAGE_SECTORS generic define. This produces no functional
> changes. While at it use left shift to simplify this even further.

How is FOO << 2 simpler than FOO * 4?

> -	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
> +	return bioset_init(&iomap_ioend_bioset, PAGE_SECTORS << 2,

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
