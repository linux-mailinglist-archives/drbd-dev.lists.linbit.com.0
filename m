Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E011542B52D
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 07:29:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C2C8F420FCD;
	Wed, 13 Oct 2021 07:29:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CAA67420FCD
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 07:28:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ocvXC+DvSauKdmmvS3p+BxJi5u95doUk5KlK23wKtqo=;
	b=lKRpM4ZXjdzEAs+vZHMan9ZhwK
	q3qA9dd5QajFA+KsuGdVyTH2p+oZZPEv/z2NSgSxTwIMMwqmktOR+s0Mrd19t1c1Y/TakGT40A9Wj
	fXHJiNb6NQJwkxlZ/5iLycWCBNdMTLXRP1g8wuFiwK5UhTbY4DE7tpL0AHanppMBRE/m1Ine/XAEK
	um2dw0LVt4/UjLCyOHoVNjJK0jpXEaLw+w3Q6MwnUfqPKIR8hZ7XIOjLGS/AwhJhnrAzptzhgIYv3
	k508G2hmAkGrCbErzCtBLkTxM5WVEpuUuduXQQzcasviJArvc73oNwcMB0CSLN98PutjOV+1MzU1W
	3RwzUyhQ==;
Received: from 089144212063.atnat0021.highway.a1.net ([89.144.212.63]
	helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maWXM-0075tt-3G; Wed, 13 Oct 2021 05:10:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Oct 2021 07:10:13 +0200
Message-Id: <20211013051042.1065752-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	reiserfs-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: [Drbd-dev] don't use ->bd_inode to access the block device size
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

various drivers currently poke directy at the block device inode, which
is a bit of a mess.  This series cleans up the places that read the
block device size to use the proper helpers.  I have separate patches
for many of the other bd_inode uses, but this series is already big
enough as-is,

I wondered about adding a helper for looking at the size in byte units
to avoid the SECTOR_SHIFT shifts in various places.  But given that
I could not come up with a good name and block devices fundamentally
work in sector size granularity I decided against that.

Diffstat:
 block/fops.c                        |    2 +-
 drivers/block/drbd/drbd_int.h       |    3 +--
 drivers/md/bcache/super.c           |    2 +-
 drivers/md/bcache/util.h            |    4 ----
 drivers/md/bcache/writeback.c       |    2 +-
 drivers/md/dm-bufio.c               |    2 +-
 drivers/md/dm-cache-metadata.c      |    2 +-
 drivers/md/dm-cache-target.c        |    2 +-
 drivers/md/dm-clone-target.c        |    2 +-
 drivers/md/dm-dust.c                |    5 ++---
 drivers/md/dm-ebs-target.c          |    2 +-
 drivers/md/dm-era-target.c          |    2 +-
 drivers/md/dm-exception-store.h     |    2 +-
 drivers/md/dm-flakey.c              |    3 +--
 drivers/md/dm-integrity.c           |    6 +++---
 drivers/md/dm-linear.c              |    3 +--
 drivers/md/dm-log-writes.c          |    4 ++--
 drivers/md/dm-log.c                 |    2 +-
 drivers/md/dm-mpath.c               |    2 +-
 drivers/md/dm-raid.c                |    6 +++---
 drivers/md/dm-switch.c              |    2 +-
 drivers/md/dm-table.c               |    3 +--
 drivers/md/dm-thin-metadata.c       |    2 +-
 drivers/md/dm-thin.c                |    2 +-
 drivers/md/dm-verity-target.c       |    3 +--
 drivers/md/dm-writecache.c          |    2 +-
 drivers/md/dm-zoned-target.c        |    2 +-
 drivers/md/md.c                     |   26 +++++++++++---------------
 drivers/mtd/devices/block2mtd.c     |    5 +++--
 drivers/nvme/target/io-cmd-bdev.c   |    4 ++--
 drivers/target/target_core_iblock.c |    5 +++--
 fs/affs/super.c                     |    2 +-
 fs/btrfs/dev-replace.c              |    2 +-
 fs/btrfs/disk-io.c                  |    3 ++-
 fs/btrfs/ioctl.c                    |    4 ++--
 fs/btrfs/volumes.c                  |    7 ++++---
 fs/buffer.c                         |    4 ++--
 fs/cramfs/inode.c                   |    2 +-
 fs/ext4/super.c                     |    2 +-
 fs/fat/inode.c                      |    5 +----
 fs/hfs/mdb.c                        |    2 +-
 fs/hfsplus/wrapper.c                |    2 +-
 fs/jfs/resize.c                     |    5 ++---
 fs/jfs/super.c                      |    5 ++---
 fs/nfs/blocklayout/dev.c            |    4 ++--
 fs/nilfs2/ioctl.c                   |    2 +-
 fs/nilfs2/super.c                   |    2 +-
 fs/nilfs2/the_nilfs.c               |    3 ++-
 fs/ntfs/super.c                     |    8 +++-----
 fs/ntfs3/super.c                    |    3 +--
 fs/pstore/blk.c                     |    4 ++--
 fs/reiserfs/super.c                 |    7 ++-----
 fs/squashfs/super.c                 |    5 +++--
 fs/udf/lowlevel.c                   |    5 ++---
 fs/udf/super.c                      |    9 +++------
 include/linux/genhd.h               |    6 ++++++
 56 files changed, 100 insertions(+), 117 deletions(-)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
