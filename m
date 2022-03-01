Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D44C8B5D
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 13:19:32 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7969E42179E;
	Tue,  1 Mar 2022 13:19:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 49556421799
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 13:19:29 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
	id CD72668AFE; Tue,  1 Mar 2022 13:19:26 +0100 (CET)
Date: Tue, 1 Mar 2022 13:19:26 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <20220301121926.GA3405@lst.de>
References: <20220222155156.597597-1-hch@lst.de>
	<20220222155156.597597-4-hch@lst.de>
	<Yh1ycd3S/FKAtnuD@iweiny-desk3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yh1ycd3S/FKAtnuD@iweiny-desk3>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, Chris Zankel <chris@zankel.net>,
	Justin Sanders <justin@coraid.com>, Minchan Kim <minchan@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>, linux-xtensa@linux-xtensa.org,
	Dan Williams <dan.j.williams@intel.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Denis Efremov <efremov@linux.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
	linux-bcache@vger.kernel.org, nvdimm@lists.linux.dev,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph Hellwig <hch@lst.de>, Nitin Gupta <ngupta@vflare.org>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 03/10] zram: use memcpy_to_bvec in
	zram_bvec_read
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

On Mon, Feb 28, 2022 at 05:10:09PM -0800, Ira Weiny wrote:
> On Tue, Feb 22, 2022 at 04:51:49PM +0100, Christoph Hellwig wrote:
> > Use the proper helper instead of open coding the copy.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Looks fine but I don't see a reason to keep the other operation atomic.  Could
> the src map also use kmap_local_page()?

That switch obviously makes sense, but in this series I've focussed on
the bio_vec maps so far.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
