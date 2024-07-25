Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 687B59429AA
	for <lists+drbd-dev@lfdr.de>; Wed, 31 Jul 2024 10:53:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D4C07420640;
	Wed, 31 Jul 2024 10:53:08 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1269 seconds by postgrey-1.31 at mail19;
	Thu, 25 Jul 2024 13:57:57 CEST
Received: from lounge.grep.be (lounge.grep.be [144.76.219.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CFDF3420211
	for <drbd-dev@lists.linbit.com>; Thu, 25 Jul 2024 13:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=A2VuDAKeSGGGRwdNEgASvdRePK2jE6LTgdknFzfGiVg=;
	b=HRSnzfY+SxqUo9lzjJBHswdyNO
	izEqhcP/7tFCFgJJGzzhTZHV+hkIJ95lvet5keDsrZB2SVJh4LM2TT0rY+nfGtvBDiOATcCiQ/ZZp
	NX14nRCfBdImELKCJsEds0YwtB87PNneYsFwhe69klvX8hKaVd3bPAdUOO5oKLpwqsdI1TpEV3xHA
	zPeruYumASMydrGBh8+RD0p+DiFqZyJ0vUaImcbHlwd7Aik2LDO+RgK3xJUkwPiJj9pwJIeGrrPKF
	y3yZwQEUsA40VBWzlQvQ+rZPVwPFNOT65DR9yRxPQziuObFSyUbJuGiw7PBH1R7FTtIfgagxi0sHi
	wC/6XZ8A==;
Received: from [102.39.153.168] (helo=pc220518)
	by lounge.grep.be with esmtpsa (TLS1.3) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
	(envelope-from <w@uter.be>) id 1sWwlF-001dJr-31;
	Thu, 25 Jul 2024 13:35:53 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
	(envelope-from <w@uter.be>) id 1sWwl8-00000002sGZ-0mps;
	Thu, 25 Jul 2024 13:35:46 +0200
Date: Thu, 25 Jul 2024 13:35:46 +0200
From: Wouter Verhelst <w@uter.be>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
Message-ID: <ZqI4kosy20WkLC2P@pc220518.home.grep.be>
References: <20240617060532.127975-1-hch@lst.de>
	<20240617060532.127975-15-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617060532.127975-15-hch@lst.de>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none
X-Mailman-Approved-At: Wed, 31 Jul 2024 10:53:01 +0200
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-bcache@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
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

On Mon, Jun 17, 2024 at 08:04:41AM +0200, Christoph Hellwig wrote:
> Use the chance to switch to defaulting to non-rotational and require
> the driver to opt into rotational, which matches the polarity of the
> sysfs interface.
[...]
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index cb1c86a6a3fb9d..6cddf5baffe02a 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1867,11 +1867,6 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
>  		goto out_err_disk;
>  	}
>  
> -	/*
> -	 * Tell the block layer that we are not a rotational device
> -	 */
> -	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
> -
>  	mutex_init(&nbd->config_lock);
>  	refcount_set(&nbd->config_refs, 0);
>  	/*

NBD actually exports a flag for rotational devices; it's defined in
nbd.h in the NBD userland source as

#define NBD_FLAG_ROTATIONAL     (1 << 4)        /* Use elevator algorithm - rotational media */

which is passed in the same flags field which also contains the
NBD_FLAG_SEND_FLUSH and NBD_FLAG_SEND_FUA flags.

Perhaps we might want to look at that flag and set the device to
rotational if it is specified?

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.
