Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF6171220C
	for <lists+drbd-dev@lfdr.de>; Fri, 26 May 2023 10:20:27 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8E28A4252EC;
	Fri, 26 May 2023 10:20:26 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 642BA4252EC
	for <drbd-dev@lists.linbit.com>; Fri, 26 May 2023 10:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0KbVHtLWzypQwk+AwZxRS0QdYzT+F7q/5Piz32xg/x8=;
	b=oRl19PBV9T5B9yEeGSQqipatMr
	PRxWWS4jGFgwZvrv2rWRlSzwLJe6REI6Iw0aokgq/vH/EAL6v9jQygHGuYq7IAnF5QH08o4NT968K
	2WA9NTHPmS0lkiCxEhYUlBxjFUW27zaMXt3/ooiriD0jmANXQzCRL/BsOujZeq4aKiOSQaOy+7lxa
	jfR8o0+4WFcujnWQe2iUrlHP5sbYbKQBGwHU7QU5YboV9aepiIdevTotLwapoePOafMrs17+7eYGn
	w7Sf9No/xGOC0HbZ6NCPNE4vV9O70l1asn9Tfmev+S2rMJKGCyyyyVAIKnLeQELhIup8qahAdq2Xn
	VMm3c4UQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
	Hat Linux)) id 1q2SgK-001aII-1S; Fri, 26 May 2023 08:20:16 +0000
Date: Fri, 26 May 2023 01:20:16 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <ZHBrwFk0d80IiOfV@bombadil.infradead.org>
References: <20230526073336.344543-1-mcgrof@kernel.org>
	<20230526073336.344543-2-mcgrof@kernel.org>
	<ZHBqGosY0tWkNdIR@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHBqGosY0tWkNdIR@infradead.org>
Cc: djwong@kernel.org, philipp.reisner@linbit.com, linux-mm@kvack.org,
	dm-devel@redhat.com, agk@redhat.com, drbd-dev@lists.linbit.com,
	willy@infradead.org, p.raghav@samsung.com,
	rohan.puri@samsung.com, senozhatsky@chromium.org,
	snitzer@kernel.org, da.gomez@samsung.com, hare@suse.de,
	kbusch@kernel.org, axboe@kernel.dk, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, rpuri.linux@gmail.com,
	linux-xfs@vger.kernel.org, minchan@kernel.org,
	patches@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [PATCH v2 1/5] block: annotate bdev_disk_changed()
 deprecation with a symbol namespace
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

On Fri, May 26, 2023 at 01:13:14AM -0700, Christoph Hellwig wrote:
> On Fri, May 26, 2023 at 12:33:32AM -0700, Luis Chamberlain wrote:
> > This ensures no other users pop up by mistake easily and provides
> > us a with an easy vehicle to do the same with other routines should
> > we need it later.
> 
> I don't see how this is related to the rest of the seris.

Jessh, sorry it is too late here and that was a typo that the commit
went into the series. I'll go sleep now. This I just had queued
as a reminder for the new annotation for deprecated symbols to be
used in some situations.

Please ignore this patch.

  Luis
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
