Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4E3872085
	for <lists+drbd-dev@lfdr.de>; Tue,  5 Mar 2024 14:42:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5F0DE42032F;
	Tue,  5 Mar 2024 14:42:20 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7FDA54201A7
	for <drbd-dev@lists.linbit.com>; Tue,  5 Mar 2024 14:40:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3uqF7GWkhm4u4EkLAwWWCLj3aw8Q/TDdp2iKlr/k3VQ=;
	b=nlYItw/ARjQD0Ym3tunsAtR0PQ
	0BtKSt9D5OWcmpvNr5Vy24a/UAyXSraCzj1LRc8qUoOUNyo+MVdux/4Oua9M3i//ZkXZCke8X4opY
	v7ZatTUJ+DMNUYojvD51x13beGRuB5bgpfiwiijrFJw16NH3hPI0xNYOzMlQuIBCMlIvpYkbK2xGP
	7Ei9RoahcVIwPD7zRj67szOdlmFhE0YPPS7/gLmC/yEKOmrdrLwgXKTI8qGtO5IOdY7pnLRsCHZ8p
	zMskxIZjO5RXPmdWlTt+psw9PxqAnqChUL3ogtkhTHdVV8DQkIld7Af6F8JQq9t3WO1JKgKAlGtOV
	8aeLW9QA==;
Received: from [50.219.53.154] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhV2A-0000000DqwQ-0gqD; Tue, 05 Mar 2024 13:40:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Subject: drbd atomic queue limits conversion
Date: Tue,  5 Mar 2024 06:40:34 -0700
Message-Id: <20240305134041.137006-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi Jens,

this is a standalone resend of the drbd queue limits conversion.
Philipp said Linbit has reviewed and tested it, and they'll hopefully
provide the formal tags for that in a bit.

Diffstat:
 drbd_main.c |   13 ++-
 drbd_nl.c   |  210 ++++++++++++++++++++++++++++--------------------------------
 2 files changed, 110 insertions(+), 113 deletions(-)
