Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 562AA905612
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2024 17:00:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 643BB42086A;
	Wed, 12 Jun 2024 17:00:41 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 50B5542081C
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2024 17:00:34 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9E11668AFE; Wed, 12 Jun 2024 17:00:30 +0200 (CEST)
Date: Wed, 12 Jun 2024 17:00:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 10/26] xen-blkfront: don't disable cache flushes when
	they fail
Message-ID: <20240612150030.GA29188@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-11-hch@lst.de> <ZmlVziizbaboaBSn@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmlVziizbaboaBSn@macbook>
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
	linuxppc-dev@lists.ozlabs.org
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

On Wed, Jun 12, 2024 at 10:01:18AM +0200, Roger Pau Monné wrote:
> On Tue, Jun 11, 2024 at 07:19:10AM +0200, Christoph Hellwig wrote:
> > blkfront always had a robust negotiation protocol for detecting a write
> > cache.  Stop simply disabling cache flushes when they fail as that is
> > a grave error.
> 
> It's my understanding the current code attempts to cover up for the
> lack of guarantees the feature itself provides:

> So even when the feature is exposed, the backend might return
> EOPNOTSUPP for the flush/barrier operations.

How is this supposed to work?  I mean in the worst case we could
just immediately complete the flush requests in the driver, but
we're really lying to any upper layer.

> Such failure is tied on whether the underlying blkback storage
> supports REQ_OP_WRITE with REQ_PREFLUSH operation.  blkback will
> expose "feature-barrier" and/or "feature-flush-cache" without knowing
> whether the underlying backend supports those operations, hence the
> weird fallback in blkfront.

If we are just talking about the Linux blkback driver (I know there
probably are a few other implementations) it won't every do that.
I see it has code to do so, but the Linux block layer doesn't
allow the flush operation to randomly fail if it was previously
advertised.  Note that even blkfront conforms to this as it fixes
up the return value when it gets this notsupp error to ok.

> Overall blkback should ensure that REQ_PREFLUSH is supported before
> exposing "feature-barrier" or "feature-flush-cache", as then the
> exposed features would really match what the underlying backend
> supports (rather than the commands blkback knows about).

Yes.  The in-tree xen-blkback does that, but even without that the
Linux block layer actually makes sure flushes sent by upper layers
always succeed even when not supported.

