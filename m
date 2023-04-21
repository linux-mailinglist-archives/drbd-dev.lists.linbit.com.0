Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 831536EB2D9
	for <lists+drbd-dev@lfdr.de>; Fri, 21 Apr 2023 22:22:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C650E4252BE;
	Fri, 21 Apr 2023 22:22:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1463 seconds by postgrey-1.31 at mail19;
	Fri, 21 Apr 2023 22:22:45 CEST
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B94884252B9
	for <drbd-dev@lists.linbit.com>; Fri, 21 Apr 2023 22:22:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=u68XQLIrnZKRacEesRmgMeebDfY2xepEp8VfzdXWDIU=;
	b=v2Yysw6qnZCKZGHYViYMSlL9PX
	OuzBIdMXAZi9a0Aylm9+m6X0SUR9QfSRQWt6BR+i2NRETsZ6Q+SXuK9lQy5WU4zsg8hL/d+3/HxHP
	7u16cxddAAH0Levxw7QkEhPJYgLzQoxh9mTY0sW8D3nWNOMD2kKhBNI1vNdffgVDXr/2T8c82Y5qU
	E9eADBnb7SD7yl0vil3K123jE0aHFhVSxq7uYbW8KiUJfJMdOCsVvAmqdVYeer9l8ep8otFOWRNnY
	KtLnYHU/vkUk7ZqjMNP+nGPPo4GBK2IqyC7H5LPrFjy8QpCc92ciVZUd47CkvDBUuKvVuqlD5AieX
	QRQ0Q9rQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red
	Hat Linux)) id 1ppwtU-00BlaV-1S; Fri, 21 Apr 2023 19:58:08 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com, hch@infradead.org, djwong@kernel.org,
	minchan@kernel.org, senozhatsky@chromium.org
Date: Fri, 21 Apr 2023 12:58:02 -0700
Message-Id: <20230421195807.2804512-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Cc: p.raghav@samsung.com, linux-xfs@vger.kernel.org, mcgrof@kernel.org,
	da.gomez@samsung.com, patches@lists.linux.dev,
	willy@infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, hare@suse.de, linux-fsdevel@vger.kernel.org,
	kbusch@kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 0/5] block: simplify with PAGE_SECTORS_SHIFT
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

A bit of block drivers have their own incantations with
PAGE_SHIFT - SECTOR_SHIFT. Just simplfy and use PAGE_SECTORS_SHIFT
all over.

Based on linux-next next-20230421.

Luis Chamberlain (5):
  dm integrity: simplify by using PAGE_SECTORS_SHIFT
  drbd: use PAGE_SECTORS_SHIFT and PAGE_SECTORS
  iomap: simplify iomap_init() with PAGE_SECTORS
  dm bufio: simplify by using PAGE_SECTORS_SHIFT
  zram: use generic PAGE_SECTORS and PAGE_SECTORS_SHIFT

 drivers/block/drbd/drbd_bitmap.c |  4 ++--
 drivers/block/zram/zram_drv.c    | 12 ++++++------
 drivers/block/zram/zram_drv.h    |  2 --
 drivers/md/dm-bufio.c            |  4 ++--
 drivers/md/dm-integrity.c        | 10 +++++-----
 fs/iomap/buffered-io.c           |  2 +-
 6 files changed, 16 insertions(+), 18 deletions(-)

-- 
2.39.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
