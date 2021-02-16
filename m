Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1992031CA11
	for <lists+drbd-dev@lfdr.de>; Tue, 16 Feb 2021 12:46:29 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F291042062F;
	Tue, 16 Feb 2021 12:46:27 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BD4E84205F3
	for <drbd-dev@lists.linbit.com>; Tue, 16 Feb 2021 12:46:26 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5738667373; Tue, 16 Feb 2021 12:46:24 +0100 (CET)
Date: Tue, 16 Feb 2021 12:46:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20210216114624.GA1221@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
	<20201116145809.410558-13-hch@lst.de>
	<CAMM=eLfD0_Am3--X+PsKPTfc9qzejxpMNjYwEh=WtjSa-iSncg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMM=eLfD0_Am3--X+PsKPTfc9qzejxpMNjYwEh=WtjSa-iSncg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Justin Sanders <justin@coraid.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	Hannes Reinecke <hare@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-block <linux-block@vger.kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] [PATCH 12/78] dm: use set_capacity_and_notify
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

On Fri, Feb 12, 2021 at 10:45:32AM -0500, Mike Snitzer wrote:
> On Mon, Nov 16, 2020 at 10:05 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Use set_capacity_and_notify to set the size of both the disk and block
> > device.  This also gets the uevent notifications for the resize for free.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Hannes Reinecke <hare@suse.de>
> > ---
> >  drivers/md/dm.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> > index c18fc25485186d..62ad44925e73ec 100644
> > --- a/drivers/md/dm.c
> > +++ b/drivers/md/dm.c
> > @@ -1971,8 +1971,7 @@ static struct dm_table *__bind(struct mapped_device *md, struct dm_table *t,
> >         if (size != dm_get_size(md))
> >                 memset(&md->geometry, 0, sizeof(md->geometry));
> >
> > -       set_capacity(md->disk, size);
> > -       bd_set_nr_sectors(md->bdev, size);
> > +       set_capacity_and_notify(md->disk, size);
> >
> >         dm_table_event_callback(t, event_callback, md);
> >
> 
> Not yet pinned down _why_ DM is calling set_capacity_and_notify() with
> a size of 0 but, when running various DM regression tests, I'm seeing
> a lot of noise like:
> 
> [  689.240037] dm-2: detected capacity change from 2097152 to 0
> 
> Is this pr_info really useful?  Should it be moved to below: if
> (!capacity || !size) so that it only prints if a uevent is sent?

In general I suspect such a size change might be interesting to users
if it e.g. comes from a remote event.  So I'd be curious why this happens
with DM, and if we can detect some higher level gendisk state to supress
it if it is indeed spurious.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
