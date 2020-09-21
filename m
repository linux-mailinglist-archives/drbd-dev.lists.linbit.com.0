Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1616D27267E
	for <lists+drbd-dev@lfdr.de>; Mon, 21 Sep 2020 16:00:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EA13342082F;
	Mon, 21 Sep 2020 16:00:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7BD3442082A
	for <drbd-dev@lists.linbit.com>; Mon, 21 Sep 2020 16:00:44 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A75DA68AFE; Mon, 21 Sep 2020 16:00:11 +0200 (CEST)
Date: Mon, 21 Sep 2020 16:00:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Coly Li <colyli@suse.de>
Message-ID: <20200921140010.GA14672@lst.de>
References: <20200921080734.452759-1-hch@lst.de>
	<20200921080734.452759-4-hch@lst.de>
	<b547a1b6-ab03-0520-012d-86d112c83d92@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b547a1b6-ab03-0520-012d-86d112c83d92@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Justin Sanders <justin@coraid.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org, linux-mm@kvack.org,
	Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 03/13] bcache: inherit the optimal I/O size
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

On Mon, Sep 21, 2020 at 05:54:59PM +0800, Coly Li wrote:
> I am not sure whether virtual bcache device's optimal request size can
> be simply set like this.
> 
> Most of time inherit backing device's optimal request size is fine, but
> there are two exceptions,
> - Read request hits on cache device
> - User sets sequential_cuttoff as 0, all writing may go into cache
> device firstly.
> For the above two conditions, all I/Os goes into cache device, using
> optimal request size of backing device might be improper.
> 
> Just a guess, is it OK to set the optimal request size of the virtual
> bcache device as the least common multiple of cache device's and backing
> device's optimal request sizes ?

Well, if the optimal I/O size is wrong, the read ahead size also is
wrong.  Can we just drop the setting?
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
