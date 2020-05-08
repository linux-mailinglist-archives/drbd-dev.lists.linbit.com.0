Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFFD1CB521
	for <lists+drbd-dev@lfdr.de>; Fri,  8 May 2020 18:46:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 671AF4203C9;
	Fri,  8 May 2020 18:46:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1ED7B4203C9
	for <drbd-dev@lists.linbit.com>; Fri,  8 May 2020 18:44:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Es4eIMqxlcHTpRumUrbJ++gZhpS818l1WN5FHjjMEjU=;
	b=bPwC4QVd0Eqoqu/0a+YLSeqq6G
	y3Ac6OeS7pyYIvXRuJ1Q1r8hldlCe1EyFxndwC6/UraMbV3XVZvIqbPYeCd5sGITrXAIxDNXAGQUW
	yZp4CytLymAXVg8Itk+HF3vSnQYDL2aEs5HHWvuQT/9u8WcWUgP3a6UsxHxFUCSXefc0ZOB92ORqu
	p2J+yQbrrAa18myCM+1A5S2RAbMs1QtGw3SppGzhKmy3I7wNMrzkeLRctZpWN3/RDMn+XM88t1UK7
	d9WLPbt4BVV7ADYNKYz+1OpEtXJFhYJsMyjG9PKK6MKBcvwLmtY5ZPUUd3vITVwYSJiyK9m0mJk6z
	xYopxSug==;
Received: from [2001:4bb8:180:9d3f:90d7:9df8:7cd:3504] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX5eh-0004MH-Mi; Fri, 08 May 2020 16:15:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  8 May 2020 18:15:02 +0200
Message-Id: <20200508161517.252308-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	linux-nvdimm@lists.01.org, Geoff Levand <geoff@infradead.org>,
	linux-kernel@vger.kernel.org, Jim Paris <jim@jtan.com>,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	linux-m68k@lists.linux-m68k.org, Philip Kelleher <pjk1939@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Joshua Morris <josh.h.morris@us.ibm.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] remove a few uses of ->queuedata
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

Hi all,

various bio based drivers use queue->queuedata despite already having
set up disk->private_data, which can be used just as easily.  This
series cleans them up to only use a single private data pointer.

blk-mq based drivers that have code pathes that can't easily get at
the gendisk are unaffected by this series.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
