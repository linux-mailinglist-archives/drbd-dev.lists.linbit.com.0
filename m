Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 279AA1CBF16
	for <lists+drbd-dev@lfdr.de>; Sat,  9 May 2020 10:33:18 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2D5F4203EB;
	Sat,  9 May 2020 10:33:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC05E4203D3
	for <drbd-dev@lists.linbit.com>; Sat,  9 May 2020 10:32:46 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id DB7F368C7B; Sat,  9 May 2020 10:23:52 +0200 (CEST)
Date: Sat, 9 May 2020 10:23:52 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20200509082352.GB21834@lst.de>
References: <20200508161517.252308-1-hch@lst.de>
	<CAPcyv4j3gVqrZWCCc2Q-6JizGAQXW0b+R1BcvWCZOvzaukGLQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4j3gVqrZWCCc2Q-6JizGAQXW0b+R1BcvWCZOvzaukGLQg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Geoff Levand <geoff@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jim Paris <jim@jtan.com>, Joshua Morris <josh.h.morris@us.ibm.com>,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	linux-m68k@lists.linux-m68k.org, Philip Kelleher <pjk1939@linux.ibm.com>,
	linux-bcache@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Christoph Hellwig <hch@lst.de>, Nitin Gupta <ngupta@vflare.org>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] remove a few uses of ->queuedata
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

On Fri, May 08, 2020 at 11:04:45AM -0700, Dan Williams wrote:
> On Fri, May 8, 2020 at 9:16 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > Hi all,
> >
> > various bio based drivers use queue->queuedata despite already having
> > set up disk->private_data, which can be used just as easily.  This
> > series cleans them up to only use a single private data pointer.
> 
> ...but isn't the queue pretty much guaranteed to be cache hot and the
> gendisk cache cold? I'm not immediately seeing what else needs the
> gendisk in the I/O path. Is there another motivation I'm missing?

->private_data is right next to the ->queue pointer, pat0 and part_tbl
which are all used in the I/O submission path (generic_make_request /
generic_make_request_checks).  This is mostly a prep cleanup patch to
also remove the pointless queue argument from ->make_request - then
->queue is an extra dereference and extra churn.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
