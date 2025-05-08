Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AEAAAF4A6
	for <lists+drbd-dev@lfdr.de>; Thu,  8 May 2025 09:27:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C3A8516B818;
	Thu,  8 May 2025 09:27:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 2500 seconds by postgrey-1.31 at mail19;
	Thu, 08 May 2025 09:27:37 CEST
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 61BAB160917
	for <drbd-dev@lists.linbit.com>; Thu,  8 May 2025 09:27:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LUk2v4Kgt6IfJvrY62PvE3Gvm9P9tXpkFTZyMPWY+M8=;
	b=JkBB1ft1C9RlzCuqlNxo+mUQdf
	gkqJNWxKR/PRkHdAq8kshn+TBdGVLxkYAQiqZJ4SLAv/6Xb5vdUvldHC5h1u+L1KqzutJu+l2/tvQ
	mlI8UlHmcqe7w0jaJ6T/0RfaJXnA0LS9LcvBHg1c54fvqyMbSRGDGo8r28ZCPnuHevY9IqcqJXZ82
	mHyhrFHPq1XYK1a4NUVnm+rx8dnXjMjMv/jIu1fNZDBGjAyTpypCF9Vzq7jQcDjHHAY+8vGArP1Sx
	Q0mLvXQKY7ehOqPu0RNET64Rx+BjNXJEVwFJVeNQQVKOzhGhtgf2uiuBdJRcqJQ3//CBvs8saJ5Ht
	/UdlZHEg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
	Hat Linux)) id 1uCv0w-0000000HVN9-1Afy;
	Thu, 08 May 2025 06:45:50 +0000
Date: Wed, 7 May 2025 23:45:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: transferring bvecs over the network in drbd
Message-ID: <aBxTHl8UIwr9Ehuv@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, drbd-dev@lists.linbit.com
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

Hi all,

I recently went over code that directly access the bio_vec bv_page/
bv_offset members and the code in _drbd_send_bio/_drbd_send_zc_bio
came to my attention.

It iterates the bio to kmap all segments, and then either does a
sock_sendmsg on a newly created kvec iter, or one one a new bvec iter
for each segment.  The former can't work on highmem systems and both
versions are rather inefficient.

What is preventing drbd from doing a single sock_sendmsg with the
bvec payload?  nvme-tcp (nvme_tcp_init_iter0 is a good example for
doing that, or the sunrpc svcsock code using it's local bvec list
(svc_tcp_sendmsg).
