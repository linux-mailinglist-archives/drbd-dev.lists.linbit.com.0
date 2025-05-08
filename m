Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A50EAAF770
	for <lists+drbd-dev@lfdr.de>; Thu,  8 May 2025 12:07:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9520816B80C;
	Thu,  8 May 2025 12:07:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 14BBD160917
	for <drbd-dev@lists.linbit.com>; Thu,  8 May 2025 12:06:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pfHS1satfw4d5UlQRemOh7AwSCj6+f4ja/q+0KzVbcE=;
	b=dN7KYuUORZ+nhO+OImtjFutR+v
	//J4b2N1a9Yq/rOlkOXYl5LtENRH4GQaD5w6jru6ckFx46y3wDtSbfRd6kFhyX9kWkdMzmWEuWwNq
	qtp/Ax9s03FeFDSt66YC/pytIf0hmgX86su9i3jqYv9fmjl+G8TLQIADz1Kr60YEaGyuaJewjQUdS
	CEExDFLHgGromSAmsVvBPBEqsgQ7bgj3guD4dBdvgtzt5zfRLSNP+dtNSJq6KJwuWwwOJOpo0cEBe
	o6BRhPh+FUIXhOoX9tYyDQ+kUXyfplwFSdmQLwfhq0W4d5zDmlmvqus4xNFuff0RoTiLn7cEfn/h6
	NGU/GzrQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
	Hat Linux)) id 1uCy9V-00000000L5s-07EI;
	Thu, 08 May 2025 10:06:53 +0000
Date: Thu, 8 May 2025 03:06:53 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christoph Hellwig <hch@infradead.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?=
	<christoph.boehmwalder@linbit.com>, 
	drbd-dev@lists.linbit.com, linux-block@vger.kernel.org
Subject: Re: transferring bvecs over the network in drbd
Message-ID: <aByCPR7Ynl93qDiY@infradead.org>
References: <aBxTHl8UIwr9Ehuv@infradead.org> <aBxt3NsJcofxhV5P@grappa.linbit>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBxt3NsJcofxhV5P@grappa.linbit>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Thu, May 08, 2025 at 10:39:56AM +0200, Lars Ellenberg wrote:
> For async replication, we want to actually copy data into send buffer,
> we cannot have the network stack hold a reference to a page for which
> we signalled io completion already.
> 
> For sync replication we want to avoid additional data copy if possible,
> so try to use "zero copy sendpage".

I didn't even complain about having both variants :)

> 
> That's why we have two variants of what looks to be the same thing.
> 
> Why we do it that way: probably when we wrote that part,
> a better infrastructure was not available, or we were not aware of it.

Yes.  While the iov_iter and the bvec version of have been around
for a long time, drbd probably still predates them.

> Thanks for the pointers, we'll look into it.
> Using more efficient ways to do stuff sounds good.

thanks.  Note that now that ->sendpage has been replaced with the
MSG_SPLICE_PAGES flag you can actually share most code for both
variants as well.
