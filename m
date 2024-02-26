Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 144A3867338
	for <lists+drbd-dev@lfdr.de>; Mon, 26 Feb 2024 12:35:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8A5F7420639;
	Mon, 26 Feb 2024 12:35:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A1D4B4205E3
	for <drbd-dev@lists.linbit.com>; Mon, 26 Feb 2024 12:34:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=UGOSCCyPj/BmRrHF9CnihwGu6XS72OjDXvKcF03cHYA=;
	b=PVY5zDhQgnDSI3xSU6JaYDl3yV
	DI+C56e+8os7t3dK8OC8gGlQMnO6B1Nf5dsaqNKizXuShwPEAfCqW6NEI9wrzKg/tX70chdIPPUsW
	AV7KihXFeQpy9VwQRd8rNmFKm6KBpfwgv37P2mlUz2ih5C0wC7LRIYrSyXYrriLDQEYYmt5FDMLwI
	B3wpoIKggevVlZ+30j0svvtMdwN0KMSrsP37jyLCZwmoKIN+FlFn7FQSXgwsbUobSjRWDT4tAMsUC
	2lE4G1uSQEBameQtvWHf0bpn4xAibws088GAdTVLnpWSKThCGSU3LqsCnaCGOMzURH23XOcuAVhN+
	SS3AJNVQ==;
Received: from 213-147-167-65.nat.highway.webapn.at ([213.147.167.65]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reYFM-000000004WJ-2FR6; Mon, 26 Feb 2024 10:30:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: atomic queue limit updates for stackable devices v2
Date: Mon, 26 Feb 2024 11:29:48 +0100
Message-Id: <20240226103004.281412-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: dm-devel@lists.linux.dev, linux-block@vger.kernel.org,
	linux-raid@vger.kernel.org, drbd-dev@lists.linbit.com
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

this series adds new helpers for the atomic queue limit update
functionality and then switches dm and md over to it.  The dm switch is
pretty trivial as it was basically implementing the model by hand
already, md is a bit more work.

I've run the mdadm testsuite, and it has the same (rather large) number
of failures as the baseline.  I've still not managed to get the dm
testuite running unfortunately, but it survives xfstests which exercises
quite a few dm targets and blktests.

nvme-multipath will be handled separately as it is too tightly integrated
with the rest of nvme.

Changes since v1:
 - a few kerneldoc fixes
 - fix a line remove after testing in raid0
 - also add drbd

Diffstat:
 block/blk-settings.c           |   47 ++++++---
 drivers/block/drbd/drbd_main.c |   13 +-
 drivers/block/drbd/drbd_nl.c   |  210 +++++++++++++++++++----------------------
 drivers/md/dm-table.c          |   27 ++---
 drivers/md/md.c                |   37 +++++++
 drivers/md/md.h                |    3 
 drivers/md/raid0.c             |   37 +++----
 drivers/md/raid1.c             |   24 +---
 drivers/md/raid10.c            |   52 ++++------
 drivers/md/raid5.c             |  123 ++++++++++--------------
 include/linux/blkdev.h         |    5 
 11 files changed, 305 insertions(+), 273 deletions(-)
