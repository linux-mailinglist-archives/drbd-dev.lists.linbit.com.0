Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A16ED5F9B63
	for <lists+drbd-dev@lfdr.de>; Mon, 10 Oct 2022 10:50:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2D24142095F;
	Mon, 10 Oct 2022 10:50:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 3075 seconds by postgrey-1.31 at mail19;
	Mon, 10 Oct 2022 10:50:28 CEST
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C6A8420319
	for <drbd-dev@lists.linbit.com>; Mon, 10 Oct 2022 10:50:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sWolSNkLX1ZPnLQhfmowne8piiQT5rQ6uM09AjXa5Dc=;
	b=aJIBlsb0nSpWjrle4oZywMion1
	d0M1TLezw/OcG2P0MgPxI6aB4/HTO9AxzYy4TBBhT7iUcr9rtBjX/6QDGEY3NVp14bJ4/jDCFWOLR
	AQbNGi/LTMEXH3wmTjrkT5Y5SGv/Ib9V7XughQZRpp+pgf73tDFKD5qBO9fZNJp7D5XdpZAn047TZ
	EiJJmMepreW3fKePOipspGiOfrSt007DayqpG0JoDUJoeTic1aqPtkls/MHiWNJVicPA3qcsuILrN
	M+txLRN4vmfGm/5lZL3wxlLajTmeHmNW15SUYd9J3te7dVhIl6aHu6Zoczw8l4kTSbppDR+vGd2rO
	RUq4Vc7g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1ohngj-00HSJR-TP; Mon, 10 Oct 2022 07:59:01 +0000
Date: Mon, 10 Oct 2022 00:59:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Chaitanya Kulkarni <kch@nvidia.com>
Message-ID: <Y0PQxdzmMzAAW0KF@infradead.org>
References: <20221005050027.39591-1-kch@nvidia.com>
	<20221005050027.39591-2-kch@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221005050027.39591-2-kch@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: vincent.fu@samsung.com, vigneshr@ti.com, philipp.reisner@linbit.com,
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
	jinpu.wang@ionos.com, tim@cyberelk.net,
	drbd-dev@lists.linbit.com, bvanassche@acm.org, richard@nod.at,
	damien.lemoal@opensource.wdc.com, shinichiro.kawasaki@wdc.com,
	ogeert@linux-m68k.org, josef@toxicpanda.com, efremov@linux.com,
	nbd@other.debian.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, hare@suse.de,
	ming.lei@redhat.com, axboe@kernel.dk, johannes.thumshirn@wdc.com,
	linux-kernel@vger.kernel.org, mcgrof@kernel.org,
	haris.iqbal@ionos.com, lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [RFC PATCH 01/18] block: add and use init disk helper
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

On Tue, Oct 04, 2022 at 10:00:10PM -0700, Chaitanya Kulkarni wrote:
> +void init_disk(struct gendisk *disk, int major, int first_minor,
> +		int minors, sector_t sectors, void *private_data,
> +		const struct block_device_operations *fops)
> +{
> +	disk->major = major;
> +	disk->first_minor = first_minor;
> +	disk->minors = minors;
> +	set_capacity(disk, sectors);
> +	disk->private_data = private_data;
> +	disk->fops = fops;

I don't like this at all.  For one major/first_minor/minors are
optional and discouraged for new drivers.  Setting the capacity is
a different thing and is done by helpers also used for revalidation
in many drivers.

It might make sense to pass the fops (and maybe private_data) to
blk_mq_alloc_disk / blk_alloc_disk, but even then I'm not quite
sure it is worth the churn.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
