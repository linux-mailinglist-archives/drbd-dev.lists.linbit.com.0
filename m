Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 898B24CAB1F
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Mar 2022 18:07:24 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6CD1542179C;
	Wed,  2 Mar 2022 18:07:23 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 00EA9421797
	for <drbd-dev@lists.linbit.com>; Wed,  2 Mar 2022 18:07:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1646240841; x=1677776841;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=ZDYri7lCowU3GJr6M0z1hSFUZr0wdNpx1kXCi+W+DLY=;
	b=nma4VllXPRiz8QWip4YbLoQfd7U5fTSPhk+aXDSRgogx+q85JacV5bRD
	8b55B62caiTXuV2qumzq1cw8yF5hb1vB/y2hicmbVk0qnUZb0UaiSoziy
	K3TCBadHlICrp1j18HnQ8OvNHnh2eg5Qhl4cZS/K4FnDpFL/bRZbB0X1d
	getToFhXlN/0TKW6MCHeRtj0mYCJJjweZNI5jdv5lJXCmZNTeI0LzIeTF
	j8rY6W/wDsiLml9hSnEJBsfWo+NSnogZiYJycewPeo+ED1KZRy/zjqJHI
	/ENSL6Xqvc4rH0hi2jq+bYw21PCgzImKsOk6jF4GIWVRrpLH/p1lxpm7F g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="236963385"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="236963385"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	02 Mar 2022 09:04:52 -0800
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="493606916"
Received: from akshatak-mobl.amr.corp.intel.com (HELO localhost)
	([10.212.41.96]) by orsmga003-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2022 09:04:51 -0800
Date: Wed, 2 Mar 2022 09:04:50 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yh+jshFsKMt+iI55@iweiny-desk3>
References: <20220222155156.597597-1-hch@lst.de>
	<20220222155156.597597-7-hch@lst.de>
	<Yh2aCi6gtG0naC1r@iweiny-desk3> <20220301122042.GB3405@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220301122042.GB3405@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Chris Zankel <chris@zankel.net>,
	Justin Sanders <justin@coraid.com>, Minchan Kim <minchan@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>, linux-xtensa@linux-xtensa.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Denis Efremov <efremov@linux.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
	linux-bcache@vger.kernel.org, nvdimm@lists.linux.dev,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 06/10] nvdimm-btt: use bvec_kmap_local in
	btt_rw_integrity
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

On Tue, Mar 01, 2022 at 01:20:42PM +0100, Christoph Hellwig wrote:
> On Mon, Feb 28, 2022 at 07:59:06PM -0800, Ira Weiny wrote:
> > On Tue, Feb 22, 2022 at 04:51:52PM +0100, Christoph Hellwig wrote:
> > > Using local kmaps slightly reduces the chances to stray writes, and
> > > the bvec interface cleans up the code a little bit.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > ---
> > >  drivers/nvdimm/btt.c | 10 ++++------
> > >  1 file changed, 4 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
> > > index cbd994f7f1fe6..9613e54c7a675 100644
> > > --- a/drivers/nvdimm/btt.c
> > > +++ b/drivers/nvdimm/btt.c
> > > @@ -1163,17 +1163,15 @@ static int btt_rw_integrity(struct btt *btt, struct bio_integrity_payload *bip,
> > >  		 */
> > >  
> > >  		cur_len = min(len, bv.bv_len);
> > > -		mem = kmap_atomic(bv.bv_page);
> > > +		mem = bvec_kmap_local(&bv);
> > >  		if (rw)
> > > -			ret = arena_write_bytes(arena, meta_nsoff,
> > > -					mem + bv.bv_offset, cur_len,
> > > +			ret = arena_write_bytes(arena, meta_nsoff, mem, cur_len,
> > 
> > Why drop bv.bv_offset here and below?
> 
> Because bvec_kmap_local includes bv_offset in the pointer that it
> returns.

Ah I missed that.  Thanks,
Ira
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
