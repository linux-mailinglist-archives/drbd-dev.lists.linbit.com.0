Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 527962FB323
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:37:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 09EA24205EE;
	Tue, 19 Jan 2021 08:37:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A91A6420231
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:12:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033897; x=1642569897;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=2EwAg85Rl2+jMe62nRnS8RL98bOCXmnfO5riJrV6i0c=;
	b=pvrfAmVqGa8pio9atMXs9y2z+ykExJ2lUd52toYu/vUbfPzxxmZ538hs
	TLpwVsEONJP9H2xaBdbD3wFTfxnrlx9FNQBLyfOFThGZ5gCCTYn5hWb93
	sHmtNycn6ASLbEkT9roUswE935NOvEM1xQw3ThNOB1QMlKLxWnWcnBCa1
	bUOH3s91O1Oe+3zMhpuJ/wySlDADQYVQ055QdZL2zAcYVuYklZ+KusTqq
	4Qa18fvhH0jRuUDd0RuDDeSmA8/RDs6I2bXNU7gR2+HjV+hfymh9kuENt
	pbYjJTbEtQhtvzZSf3rqw/p7nHCdd17I5tYqpPCqAA7EXZLq80AbhxRPh A==;
IronPort-SDR: Glmv3mcv0Ed8l4Dmjd1k7sCMwMB9pgkFOWsGIn2shtWEbAehGWjYTY2ZxU3gW8JuDbjpsj0EW4
	mJKZjeXHsN4JHeF2oacudTQy11Pt+EU/bNGAl0Uv8HLb6Avz5Pzt7Y9RymxvEyjqgDrzXoRbCS
	OlEbY0jnMCcOBNQMlEa0Ezq4Ql3jXkH7ft2pqqhizA2ofexbiWEP1pQR9M4+zRGS9gxlgEno/J
	2IU2tpS0cdWUIANDJRCJZYS9tIIwKpyomUUrIvqs8RU0+dZAlvAGEKG6dfPyYFEnz1gl0O9zl0
	jJw=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="261722071"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:16:17 +0800
IronPort-SDR: oKBHXt8+S9t4Xdy4j2gJP8NT7+pBnh2LEQMXaj2gtj14dH22PWPTM9fLOzBD9xahGz+0zK5cHI
	BdS9gkg9s8ar/M83QVzsQRYV6OXm0uTI6n5DR27ZPHTJbDRGXQltWVh1BaL0ir8vkYbt2J/ZVW
	9OFN9rC9awJi2TqQWzu0SPMYbbTc73x6TeLvhc7Ki+gVmFI5yBEmEcb13OHDZ/HtCLkRsGRAb3
	1bSUDBdeVbS293k5z1j4xlg9ztOZ3RK6aSfTQKeqjzjaLyrWeQTeJP7s6uy6mK8IOF0/HhpoiY
	MaLN89TnVnsDNuOibnf2khLB
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:12 -0800
IronPort-SDR: w8TQaHPmOf4afpFLhHFiHm4s9YBVvwz1nCheCJ4OBOH8yQ2UY0NC3Tt/JdFHF9KkeR+DlxZGUH
	e7bQB+02ddXqKaR8b/7v1Y7wXKviC9dKqJTPF9aSTC9cHooTn06sxWBBnh6ybRkpJPiq1eaXml
	Li9XSEIsEl1dTBAvxWyxQKBso9dBp+WZiRKxmJUsbAqs+G/qtiWTWXlVZWjYoZKV0OKSYwZfdM
	WxDGvor0MhqHOPvWCUI9b0h4sFeSeNraJk/cdT+mEYZtqS1ubVV2lyl7ZqDz6u2Z/jCzzw/RkG
	Jdo=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:06:34 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:05:54 -0800
Message-Id: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:53 +0100
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, snitzer@redhat.com,
	gustavo@embeddedor.com, clm@fb.com, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, hch@lst.de, agk@redhat.com,
	naohiro.aota@wdc.com, sagi@grimberg.me, darrick.wong@oracle.com,
	osandov@fb.com, kent.overstreet@gmail.com,
	Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	josef@toxicpanda.com, efremov@linux.com, colyli@suse.de,
	tj@kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
	bvanassche@acm.org, agruenba@redhat.com, axboe@kernel.dk,
	damien.lemoal@wdc.com, tytso@mit.edu, martin.petersen@oracle.com,
	song@kernel.org, philipp.reisner@linbit.com,
	jefflexu@linux.alibaba.com, rpeterso@redhat.com,
	lars.ellenberg@linbit.com, jth@kernel.org, asml.silence@gmail.com
Subject: [Drbd-dev] [RFC PATCH 00/37] block: introduce bio_init_fields()
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
Content-Type: multipart/mixed; boundary="===============7844249466814339453=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============7844249466814339453==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Hi,

This is a *compile only RFC* which adds a generic helper to initialize
the various fields of the bio that is repeated all the places in
file-systems, block layer, and drivers.

The new helper allows callers to initialize various members such as
bdev, sector, private, end io callback, io priority, and write hints.

The objective of this RFC is to only start a discussion, this it not 
completely tested at all.                                                                                                            
Following diff shows code level benefits of this helper :-
 38 files changed, 124 insertions(+), 236 deletions(-)

-ck

Chaitanya Kulkarni (37):
  block: introduce bio_init_fields() helper
  fs: use bio_init_fields in block_dev
  btrfs: use bio_init_fields in disk-io
  btrfs: use bio_init_fields in volumes
  ext4: use bio_init_fields in page_io
  gfs2: use bio_init_fields in lops
  gfs2: use bio_init_fields in meta_io
  gfs2: use bio_init_fields in ops_fstype
  iomap: use bio_init_fields in buffered-io
  iomap: use bio_init_fields in direct-io
  jfs: use bio_init_fields in logmgr
  zonefs: use bio_init_fields in append
  drdb: use bio_init_fields in actlog
  drdb: use bio_init_fields in bitmap
  drdb: use bio_init_fields in receiver
  floppy: use bio_init_fields
  pktcdvd: use bio_init_fields
  bcache: use bio_init_fields in journal
  bcache: use bio_init_fields in super
  bcache: use bio_init_fields in writeback
  dm-bufio: use bio_init_fields
  dm-crypt: use bio_init_fields
  dm-zoned: use bio_init_fields metadata
  dm-zoned: use bio_init_fields target
  dm-zoned: use bio_init_fields
  dm log writes: use bio_init_fields
  nvmet: use bio_init_fields in bdev-ns
  target: use bio_init_fields in iblock
  btrfs: use bio_init_fields in scrub
  fs: use bio_init_fields in buffer
  eros: use bio_init_fields in data
  eros: use bio_init_fields in zdata
  jfs: use bio_init_fields in metadata
  nfs: use bio_init_fields in blocklayout
  ocfs: use bio_init_fields in heartbeat
  xfs: use bio_init_fields in xfs_buf
  xfs: use bio_init_fields in xfs_log

 block/blk-lib.c                     | 13 +++++--------
 drivers/block/drbd/drbd_actlog.c    |  5 +----
 drivers/block/drbd/drbd_bitmap.c    |  5 +----
 drivers/block/drbd/drbd_receiver.c  | 11 +++--------
 drivers/block/floppy.c              |  5 +----
 drivers/block/pktcdvd.c             | 12 ++++--------
 drivers/md/bcache/journal.c         | 21 ++++++++-------------
 drivers/md/bcache/super.c           | 19 +++++--------------
 drivers/md/bcache/writeback.c       | 14 ++++++--------
 drivers/md/dm-bufio.c               |  5 +----
 drivers/md/dm-crypt.c               |  4 +---
 drivers/md/dm-log-writes.c          | 21 ++++++---------------
 drivers/md/dm-zoned-metadata.c      | 15 +++++----------
 drivers/md/dm-zoned-target.c        |  9 +++------
 drivers/md/md.c                     |  6 ++----
 drivers/nvme/target/io-cmd-bdev.c   |  4 +---
 drivers/target/target_core_iblock.c | 11 +++--------
 fs/block_dev.c                      | 17 +++++------------
 fs/btrfs/disk-io.c                  | 11 ++++-------
 fs/btrfs/scrub.c                    |  6 ++----
 fs/btrfs/volumes.c                  |  4 +---
 fs/buffer.c                         |  7 ++-----
 fs/erofs/data.c                     |  6 ++----
 fs/erofs/zdata.c                    |  9 +++------
 fs/ext4/page-io.c                   |  6 ++----
 fs/gfs2/lops.c                      |  6 ++----
 fs/gfs2/meta_io.c                   |  5 ++---
 fs/gfs2/ops_fstype.c                |  7 ++-----
 fs/iomap/buffered-io.c              |  5 ++---
 fs/iomap/direct-io.c                | 15 +++++----------
 fs/jfs/jfs_logmgr.c                 | 16 ++++------------
 fs/jfs/jfs_metapage.c               | 16 +++++++---------
 fs/nfs/blocklayout/blocklayout.c    |  8 ++------
 fs/ocfs2/cluster/heartbeat.c        |  4 +---
 fs/xfs/xfs_buf.c                    |  6 ++----
 fs/xfs/xfs_log.c                    |  6 ++----
 fs/zonefs/super.c                   |  7 +++----
 include/linux/bio.h                 | 13 +++++++++++++
 38 files changed, 124 insertions(+), 236 deletions(-)

-- 
2.22.1


--===============7844249466814339453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============7844249466814339453==--
