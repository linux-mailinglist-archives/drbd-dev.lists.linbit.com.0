Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2696A6EC622
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Apr 2023 08:22:27 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B6C944203CE;
	Mon, 24 Apr 2023 08:22:26 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1570 seconds by postgrey-1.31 at mail19;
	Mon, 24 Apr 2023 08:22:25 CEST
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9E69C4202BE
	for <drbd-dev@lists.linbit.com>; Mon, 24 Apr 2023 08:22:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=edf2YE6tOjy5o639pmoNCDDnqNTZQ8NPmup4HBvbC60=;
	b=qBKmlBP0RbumDgdRWERGFEVbSD
	kDf8Kr5lk5aB2+nWak9xt17TfHD2PupAuPb1mUJmwaPm/dURvhYPVWSPaaOFCU9vr679O7rjTbCXX
	FY14jwJ6foFME5jmhn6hiaV5cvLy3w+4wiA9HOCqY9FKPUwzVOJnoZoumJfKXe+j3dCSf+I4DhyyN
	meS9IcfszZYuw8bakpryb8WeNnXvLqGFAShnlXlum+ZdAx1uWAgWfJ88JFAJBehhF7KCT0OC/pGsx
	saWH2fGCCZFbpsAwVDoLKGMeyxz9Qo8euhIsqOiC8WZE42QMSALorud5SvHI394LQ9T2HdWzjtMUM
	uj/muRvg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
	Linux)) id 1pqpAv-00FPys-1e; Mon, 24 Apr 2023 05:55:45 +0000
Date: Sun, 23 Apr 2023 22:55:45 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <ZEYZ4ScVDXviFJ/J@infradead.org>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
	<20230421195807.2804512-4-mcgrof@kernel.org>
	<ZELuiBNNHTk4EdxH@casper.infradead.org>
	<ZEMH9h/cd9Cp1t+X@bombadil.infradead.org>
	<20230421223420.GH3223426@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421223420.GH3223426@dread.disaster.area>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: djwong@kernel.org, philipp.reisner@linbit.com, linux-mm@kvack.org,
	dm-devel@redhat.com, agk@redhat.com, drbd-dev@lists.linbit.com,
	Matthew Wilcox <willy@infradead.org>, hch@infradead.org,
	p.raghav@samsung.com, senozhatsky@chromium.org,
	snitzer@kernel.org, linux-block@vger.kernel.org, hare@suse.de,
	kbusch@kernel.org, axboe@kernel.dk, da.gomez@samsung.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	minchan@kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
	patches@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	lars.ellenberg@linbit.com
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

On Sat, Apr 22, 2023 at 08:34:20AM +1000, Dave Chinner wrote:
> > 
> > -	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
> > +	return bioset_init(&iomap_ioend_bioset, 4 * PAGE_SECTORS,
> 
> Yes, please.
> 
> > The shift just seemed optimal if we're just going to change it.
> 
> Nope, it's just premature optimisation at the expense of
> maintainability. The compiler will optimise the multiplication into
> shifts if that is the fastest way to do it for the given
> architecture the code is being compiled to.

We still had cases of the compiler not doing obvious
multiplication/division to shift conversion lately.  That being said:

 1) this is an initialization path, no one actually cares
 2) we're dealing with constants here, and compilers are really good
    at constant folding

so yes, this should be using the much more readable version.

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
