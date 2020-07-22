Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3402291FA
	for <lists+drbd-dev@lfdr.de>; Wed, 22 Jul 2020 09:18:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E87894204DB;
	Wed, 22 Jul 2020 09:18:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3085A4204D2
	for <drbd-dev@lists.linbit.com>; Wed, 22 Jul 2020 09:18:44 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5D2936736F; Wed, 22 Jul 2020 09:18:11 +0200 (CEST)
Date: Wed, 22 Jul 2020 09:18:09 +0200
From: Christoph Hellwig <hch@lst.de>
To: Johannes Thumshirn <Johannes.Thumshirn@wdc.com>
Message-ID: <20200722071809.GA25816@lst.de>
References: <20200722062552.212200-1-hch@lst.de>
	<20200722062552.212200-7-hch@lst.de>
	<SN4PR0401MB3598470B14C754768A2D8F389B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4PR0401MB3598470B14C754768A2D8F389B790@SN4PR0401MB3598.namprd04.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Subject: Re: [Drbd-dev] [PATCH 06/14] block: lift setting the readahead size
 into the block layer
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

On Wed, Jul 22, 2020 at 07:13:54AM +0000, Johannes Thumshirn wrote:
> On 22/07/2020 08:27, Christoph Hellwig wrote:
> > +	q->backing_dev_info->ra_pages =
> > +		max(queue_io_opt(q) * 2 / PAGE_SIZE, VM_READAHEAD_PAGES);
> 
> Dumb question, wouldn't a '>> PAGE_SHIFT' be better instead of a potentially 
> costly division?
> 
> Or aren't we caring at all as it's a) not in the fast-path and b) compilers 
> can optimize it to a shift?

That's my thinking.  If anyone has a strong preference I can change
it.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
