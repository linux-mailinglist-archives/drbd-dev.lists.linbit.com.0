Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id D182E9031FF
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 08:00:10 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 751AA4205CB;
	Tue, 11 Jun 2024 08:00:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7E62842039E
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 07:59:48 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B1AFB68C4E; Tue, 11 Jun 2024 07:59:46 +0200 (CEST)
Date: Tue, 11 Jun 2024 07:59:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 06/26] loop: also use the default block size from an
	underlying block device
Message-ID: <20240611055946.GA3777@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-7-hch@lst.de>
	<27e76310-1831-473e-803a-e0294b91463c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27e76310-1831-473e-803a-e0294b91463c@kernel.org>
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

On Tue, Jun 11, 2024 at 02:58:56PM +0900, Damien Le Moal wrote:
> > +	if (S_ISBLK(inode->i_mode))
> > +		backing_bdev = I_BDEV(inode);
> > +	else if (inode->i_sb->s_bdev)
> > +		backing_bdev = inode->i_sb->s_bdev;
> > +
> 
> Why not move this hunk inside the below "if" ? (backing_dev declaration can go
> there too).

Because another use will pop up a bit later :)

