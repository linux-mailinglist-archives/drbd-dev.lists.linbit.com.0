Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C3938BF57
	for <lists+drbd-dev@lfdr.de>; Fri, 21 May 2021 08:29:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A8F4E42036A;
	Fri, 21 May 2021 08:29:42 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 396 seconds by postgrey-1.31 at mail19;
	Fri, 21 May 2021 08:29:40 CEST
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2677420169
	for <drbd-dev@lists.linbit.com>; Fri, 21 May 2021 08:29:40 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id C508C6736F; Fri, 21 May 2021 08:23:01 +0200 (CEST)
Date: Fri, 21 May 2021 08:23:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Coly Li <colyli@suse.de>
Message-ID: <20210521062301.GA10244@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
	<20210521055116.1053587-13-hch@lst.de>
	<d4f1c005-2ce0-51b5-c861-431f0ffb3dcf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4f1c005-2ce0-51b5-c861-431f0ffb3dcf@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: nvdimm@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Max Filippov <jcmvbkbc@gmail.com>, dm-devel@redhat.com,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Vishal Verma <vishal.l.verma@intel.com>, Christoph Hellwig <hch@lst.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Matias Bjorling <mb@lightnvm.io>, Nitin Gupta <ngupta@vflare.org>,
	Vasily Gorbik <gor@linux.ibm.com>, linux-xtensa@linux-xtensa.org,
	Alex Dubov <oakad@yahoo.com>, Heiko Carstens <hca@linux.ibm.com>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org, Philip Kelleher <pjk1939@linux.ibm.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jens Axboe <axboe@kernel.dk>, Chris Zankel <chris@zankel.net>,
	Song Liu <song@kernel.org>, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Jim Paris <jim@jtan.com>,
	Minchan Kim <minchan@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Drbd-dev] [PATCH 12/26] bcache: convert to
 blk_alloc_disk/blk_cleanup_disk
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

On Fri, May 21, 2021 at 02:15:32PM +0800, Coly Li wrote:
> The  above 2 lines are added on purpose to prevent an refcount
> underflow. It is from commit 86da9f736740 ("bcache: fix refcount
> underflow in bcache_device_free()").
> 
> Maybe add a parameter to blk_cleanup_disk() or checking (disk->flags &
> GENHD_FL_UP) inside blk_cleanup_disk() ?

Please take a look at patch 4 in the series.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
