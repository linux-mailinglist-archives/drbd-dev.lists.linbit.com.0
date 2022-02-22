Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1866A4BFD94
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Feb 2022 16:52:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D59914205DD;
	Tue, 22 Feb 2022 16:52:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EA8CF4201FE
	for <drbd-dev@lists.linbit.com>; Tue, 22 Feb 2022 16:52:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=YyVH4oj53flKDl4o6G8llll8rWu5K49Wopw1JMTA1xQ=;
	b=O6ch8zKeyvbAZ1fRjY4PD5TW8M
	Et6jgk5KwIVYitQ2YzDJd9NJHtVLNaZkCe0EcCizD4CMzxzO+3jbAQHyQ97oNoLj6afPZBg20jIJI
	wI2bnoMAOQEK4yCBOB0FSlU4lTpisJX21uvhXCBOf0MRdq4JV7ZVryJXM+zBrVEHg3Ip6RJ+gRbkb
	Kk3hsR3x48wAOFyj3rZqpBddrw73R4G3Kxj3eok45Kum7Lj2a/7rtDOUCm9kaUSY0NnHbQiBt+umG
	LNK0C7a5sHMwpaZLLfj4+0Vxkk9Av1gjkUPYAQPpvyFzzY8zKJhvaBMn8w1aZwln0lQKqdWGPi+22
	U1HayEWw==;
Received: from [2001:4bb8:198:f8fc:c22a:ebfc:be8d:63c2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMXSI-00APnc-Q7; Tue, 22 Feb 2022 15:51:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Feb 2022 16:51:46 +0100
Message-Id: <20220222155156.597597-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Chris Zankel <chris@zankel.net>, Justin Sanders <justin@coraid.com>,
	Minchan Kim <minchan@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>,
	linux-xtensa@linux-xtensa.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Denis Efremov <efremov@linux.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
	linux-bcache@vger.kernel.org, nvdimm@lists.linux.dev,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] remove opencoded kmap of bio_vecs
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

this series replaces various open coded kmaps of bio_vecs with higher
level helpers that use kmap_local_page underneath.

Diffstat:
 arch/xtensa/platforms/iss/simdisk.c |    4 ++--
 drivers/block/aoe/aoecmd.c          |    2 +-
 drivers/block/drbd/drbd_receiver.c  |    4 ++--
 drivers/block/drbd/drbd_worker.c    |    6 +++---
 drivers/block/floppy.c              |    6 ++----
 drivers/block/zram/zram_drv.c       |    9 ++-------
 drivers/md/bcache/request.c         |    4 ++--
 drivers/nvdimm/blk.c                |    7 +++----
 drivers/nvdimm/btt.c                |   10 ++++------
 9 files changed, 21 insertions(+), 31 deletions(-)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
