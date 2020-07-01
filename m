Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C4E210802
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Jul 2020 11:26:33 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B17BA4203E3;
	Wed,  1 Jul 2020 11:26:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7EC094203F5
	for <drbd-dev@lists.linbit.com>; Wed,  1 Jul 2020 11:24:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=kVtz6vlqJaw/bVcdduLYH4iE1TfD3bHAdPcoJqUty3c=;
	b=fqj9Bq+LPiX5Cw82+DKENOtZGq
	aBH2pV9JriMzRvy5+0j64xrRmqbi06FwHdCyyH3uCDubulK1NERetFJK1xFzKQY+iXQVy5XGPU+xl
	/8+zjmJSUzyKDSohp1PbTPulp7b3LNcKbeAeTRiFa5ER5du9CjNnVFmk1/cLC4YQcwJeNFeAu/B/t
	7LQYhpHNJ89uXgEEGIP8Kl/6Q59oBdTnE2iI0XlR6ib/eAbUM2WK68TsWfzhy2JvgP5NrxmDNwUdK
	2kLdrPLtmrx4+deQuyG8ej+JvRoHTRyPjJ4ocq2XFWOIjBChE8rflkGjPJ8f2cJsvLg9xAC3ZO5Oq
	zQLc42fA==;
Received: from [2001:4bb8:184:76e3:ea38:596b:3e9e:422a] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqYhD-0000hE-MD; Wed, 01 Jul 2020 09:06:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed,  1 Jul 2020 11:06:18 +0200
Message-Id: <20200701090622.3354860-1-hch@lst.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-mm@kvack.org, dm-devel@redhat.com,
	Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org,
	linux-btrfs@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] remove dead bdi congestion leftovers
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

we have a lot of bdi congestion related code that is left around without
any use.  This series removes it in preparation of sorting out the bdi
lifetime rules properly.

Diffstat:
 block/blk-cgroup.c               |   19 ----
 drivers/block/drbd/drbd_main.c   |   59 --------------
 drivers/block/drbd/drbd_proc.c   |    1 
 drivers/md/bcache/request.c      |   43 ----------
 drivers/md/bcache/super.c        |    1 
 drivers/md/dm-cache-target.c     |   19 ----
 drivers/md/dm-clone-target.c     |   15 ---
 drivers/md/dm-era-target.c       |   15 ---
 drivers/md/dm-raid.c             |   12 --
 drivers/md/dm-table.c            |   37 ---------
 drivers/md/dm-thin.c             |   16 ---
 drivers/md/dm.c                  |   33 --------
 drivers/md/dm.h                  |    1 
 drivers/md/md-linear.c           |   24 -----
 drivers/md/md-multipath.c        |   23 -----
 drivers/md/md.c                  |   23 -----
 drivers/md/md.h                  |    4 
 drivers/md/raid0.c               |   16 ---
 drivers/md/raid1.c               |   31 -------
 drivers/md/raid10.c              |   26 ------
 drivers/md/raid5.c               |   25 ------
 fs/btrfs/disk-io.c               |   23 -----
 include/linux/backing-dev-defs.h |   43 ----------
 include/linux/backing-dev.h      |   22 -----
 include/linux/blk-cgroup.h       |    6 -
 include/linux/device-mapper.h    |   11 --
 mm/backing-dev.c                 |  157 +++------------------------------------
 27 files changed, 20 insertions(+), 685 deletions(-)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
