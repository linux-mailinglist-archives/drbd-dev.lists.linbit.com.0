Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D7F49DACC
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 07:36:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 992F2420638;
	Thu, 27 Jan 2022 07:36:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF8C04205C6
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 07:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=VwOfDxAxTyUmpkxo5WFIProZUqoG2UZpSn/4hB/cnvg=;
	b=oxyAN7Cx41TWd2eVVqsUpqY1VB
	AvzUKuSJS63qWit1AlGi9ipNRnChpYeVrDsB/AP/65j3C1hT3GKXqFuQgBFxQzLpjBAT13bwfEXZc
	idMbjwxo+p2UoTHhTVJ7NgKg32vVIWiAyZ8bzdlus13MrBogPHD0boXK6udu3RJ6HhSeI3sxJmRN0
	UT6mIr4yAH2i2smEm8Kho2Mo1oWAKzVDJ5HbPep5lu/2zCbGiaPz85mzgGY5MbRB3lcEZjJ2TaKnk
	e6ZMFo9OBEE5IJQylSv+cG/HuZhHmgtDrHEH4cM4xBO7Y/lKJzBaUYXfpekAZ8A4wya43FVown6zE
	R5kSRxHA==;
Received: from 213-225-10-69.nat.highway.a1.net ([213.225.10.69]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCyNq-00EY07-23; Thu, 27 Jan 2022 06:35:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 27 Jan 2022 07:35:32 +0100
Message-Id: <20220127063546.1314111-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] improve the bio cloning interface
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

Hi Jens,

this series changes the bio cloning interface to match the rest changes
to the bio allocation interface and passes the block_device and operation
to the cloning helpers.  In addition it renames the cloning helpers to
be more descriptive.

To get there it requires a bit of refactoring in the device mapper code.

Diffstat:
 Documentation/block/biodoc.rst   |    5 -
 block/bio-integrity.c            |    1 
 block/bio.c                      |  106 +++++++++++++-----------
 block/blk-crypto.c               |    1 
 block/blk-mq.c                   |    4 
 block/bounce.c                   |    3 
 drivers/block/drbd/drbd_req.c    |    5 -
 drivers/block/drbd/drbd_worker.c |    4 
 drivers/block/pktcdvd.c          |    4 
 drivers/md/bcache/request.c      |    6 -
 drivers/md/dm-cache-target.c     |   26 ++----
 drivers/md/dm-crypt.c            |   11 +-
 drivers/md/dm-zoned-target.c     |    3 
 drivers/md/dm.c                  |  167 ++++++++++++++-------------------------
 drivers/md/md-faulty.c           |    4 
 drivers/md/md-multipath.c        |    4 
 drivers/md/md.c                  |    5 -
 drivers/md/raid1.c               |   34 +++----
 drivers/md/raid10.c              |   16 +--
 drivers/md/raid5.c               |    4 
 fs/btrfs/extent_io.c             |    4 
 include/linux/bio.h              |    6 -
 22 files changed, 185 insertions(+), 238 deletions(-)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
