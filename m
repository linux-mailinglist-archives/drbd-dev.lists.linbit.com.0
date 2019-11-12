Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 802F1F93AE
	for <lists+drbd-dev@lfdr.de>; Tue, 12 Nov 2019 16:10:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3017E4203D6;
	Tue, 12 Nov 2019 16:10:16 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1038 seconds by postgrey-1.31 at mail19;
	Tue, 12 Nov 2019 16:10:14 CET
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2FC7B420381
	for <drbd-dev@lists.linbit.com>; Tue, 12 Nov 2019 16:10:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=sEPUX+fjGSBAUvIPMLjjkbM2wjez+7ShnBnUv0GrGXQ=;
	b=WlrR7WN0oU471oOXPzD/76xEH
	DpRzwnLXM1J6c9eHsZ9uHwP1womIAHdH/BLxeGPujcBv5eijmHg2NKXX0F0+QK4aXHeL7JzG4yXgS
	DBrc/zS1n40MPVH2DUHxyco4Gz4yB/HFzIZHk0nYHPy3waYm/HOVPs2l9clqXGtWmdeSv4b85g2b1
	s8NyDr7bSFHYbrxbd61CuMXCGVU8DPE3W08RO1Cqy8r94/GZN7KZj+0liECO7qu7V45Kds5frmjtA
	2iDWbyoP1NCdDQZq23AnjCqcpUL5JVxD8UnpvZFA2tpLA8HwjPCJGIg1qGsBwCXG4SxbVY9JIpdb/
	YczsttymQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1iUXVD-00014g-Gu; Tue, 12 Nov 2019 14:50:43 +0000
Date: Tue, 12 Nov 2019 06:50:43 -0800
From: Christoph Hellwig <hch@infradead.org>
To: jgq516@gmail.com
Message-ID: <20191112145043.GA31295@infradead.org>
References: <20191112090139.16092-1-guoqing.jiang@cloud.ionos.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191112090139.16092-1-guoqing.jiang@cloud.ionos.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [RFC PATCH] block: move rb interval tree from drbd
	to block
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

On Tue, Nov 12, 2019 at 10:01:39AM +0100, jgq516@gmail.com wrote:
> From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
> 
> Currently, drbd has the implementation of rb interval tree.
> And we would like to reuse it for raid1 io serialization [1],
> so move it to a common place, rename to block_interval, export
> those symbols and make necessary changes to drbd.

This should not be built unconditonally, but be selected by the two
users.  And lib/ seems like a better place than block.

Also please fix up any > 80 char lines that your naming changes
introduce.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
