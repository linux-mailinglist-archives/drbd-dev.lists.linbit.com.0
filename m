Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B429031EB
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 07:59:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 53A9A4203CE;
	Tue, 11 Jun 2024 07:59:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 388 seconds by postgrey-1.31 at mail19;
	Tue, 11 Jun 2024 07:59:10 CEST
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9E16042039E
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 07:59:10 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B7C0F68CFE; Tue, 11 Jun 2024 07:59:06 +0200 (CEST)
Date: Tue, 11 Jun 2024 07:59:06 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 05/26] loop: regularize upgrading the lock size for
	direct I/O
Message-ID: <20240611055906.GA3640@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-6-hch@lst.de>
	<dabc33cd-feb9-4263-8f6e-4d2ab3d71430@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dabc33cd-feb9-4263-8f6e-4d2ab3d71430@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	nbd@other.debian.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org, Roger Pau Monn?? <roger.pau@citrix.com>
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

On Tue, Jun 11, 2024 at 02:56:59PM +0900, Damien Le Moal wrote:
> > +	if (!bsize)
> > +		bsize = loop_default_blocksize(lo, inode->i_sb->s_bdev);
> 
> If bsize is specified and there is a backing dev used with direct IO, should it
> be checked that bsize is a multiple of bdev_logical_block_size(backing_bdev) ?

For direct I/O that check would be useful.  For buffered I/O we can do
read-modify-write cycles.  However this series is already huge and not
primarily about improving the loop driver parameter validation, so
I'll defer this for now.
