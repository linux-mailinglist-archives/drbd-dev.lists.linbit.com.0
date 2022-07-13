Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B0E572E6D
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Jul 2022 08:50:53 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 502E9420F75;
	Wed, 13 Jul 2022 08:50:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 19F9A42097C
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 08:50:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=KrpjvwUcHbQf2YuRp2OWaODTDZci6DgQG3eP4OSBmUI=;
	b=YRBK/+Qzhe+1221YOQ4iqzLn/5
	4Vwf1PyNclwthcoNXZ8KOoB+GAm/JBggQtmauR03xvzEJ6HJrky94ioJYu/id13gc3E8Vp3eEjaPZ
	4/U7tIzjiBG7yOAf5AudMpRTfWM/glZnmH0Q5KsdHn9yGpUBaGPrRgAqZ84jMYIXbbDNEzhIhaeXE
	HPqbGv7ZwbHz+9nAFWGg1NsiY6L75v7smtXveUpmZ+cLceuQWo6JUhgy4Vj3ymFqb/j70IVLdScfi
	nMcJLQNaBI3D7FKAwYGd4Ir2YoBbRsfjJA6+RJnMFwO2T37jlyn5qeZ+yBeFjFD20xwQM/46VSp4+
	+bC9PZdw==;
Received: from ip4d15c27d.dynamic.kabel-deutschland.de ([77.21.194.125]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVJH-000NMY-Jw; Wed, 13 Jul 2022 05:53:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Jul 2022 07:53:08 +0200
Message-Id: <20220713055317.1888500-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	Song Liu <song@kernel.org>, Mark Fasheh <mark@fasheh.com>,
	linux-raid@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Joel Becker <jlbec@evilplan.org>, Jan Kara <jack@suse.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	linux-ext4@vger.kernel.org, Jack Wang <jinpu.wang@ionos.com>,
	ocfs2-devel@oss.oracle.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] remove bdevname
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

this series removes the final uses and the implementation of the bdevname()
function.

Diffstat:
 block/bdev.c                        |   10 ++---
 block/blk-lib.c                     |    6 +--
 block/genhd.c                       |   23 ------------
 drivers/block/drbd/drbd_req.c       |    6 +--
 drivers/block/pktcdvd.c             |   10 +----
 drivers/block/rnbd/rnbd-srv-dev.c   |    1 
 drivers/block/rnbd/rnbd-srv-dev.h   |    1 
 drivers/block/rnbd/rnbd-srv-sysfs.c |    5 +-
 drivers/block/rnbd/rnbd-srv.c       |    9 ++---
 drivers/block/rnbd/rnbd-srv.h       |    3 -
 drivers/md/md.c                     |    2 -
 drivers/md/raid1.c                  |    2 -
 drivers/md/raid10.c                 |    2 -
 fs/ext4/mmp.c                       |    9 ++---
 fs/jbd2/journal.c                   |    6 ++-
 fs/ocfs2/cluster/heartbeat.c        |   64 ++++++++++++++++--------------------
 include/linux/blkdev.h              |    1 
 kernel/trace/blktrace.c             |    4 +-
 18 files changed, 62 insertions(+), 102 deletions(-)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
