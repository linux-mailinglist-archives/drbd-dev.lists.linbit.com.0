Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270A4C81DC
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 05:00:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F23FE4217AB;
	Tue,  1 Mar 2022 05:00:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DE6584217A1
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 05:00:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1646107210; x=1677643210;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=LcxwOayz+lKTZD4HcNKclIM15x9RJubsj20BQE2u+gg=;
	b=EAWCT9DdUKPUDTlkUIlK3nwB8+5zE5E7BPhQa+PJ/sAlRixeHSXWccIG
	Y8PINCFejVyE0l6B/ROYEwhD9sAR/pO1F5BVDRVo+oNYiOLwS9CtpTeGG
	RFmS3E9zCKjIYKRjsOT50m06Y8zmHWXBZLI/v4WyXw7tEGRyVhvQ6bo92
	XT49LHH9odD6Ye45YqKXBekS4Pxjg30h0Wz5xfnT3VS4MNNx7NP7aHz18
	KJUW7v+8/Ac9qWXfBWpWLvQx36p9ZyJA893WYbivo/SeZEl2FpjtlMbes
	Q0IJnkyruVspCuFRAaBTsaJJ3Dc+E9wjDR22LOzEIIF2XuWZhQPWWHLV9 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="252976582"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="252976582"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Feb 2022 20:00:02 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="639226239"
Received: from chunhanz-mobl.amr.corp.intel.com (HELO localhost)
	([10.212.29.175]) by fmsmga002-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 20:00:01 -0800
Date: Mon, 28 Feb 2022 20:00:01 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yh2aQROdfk1iUuQV@iweiny-desk3>
References: <20220222155156.597597-1-hch@lst.de>
	<20220222155156.597597-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222155156.597597-8-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 07/10] bcache: use bvec_kmap_local in bio_csum
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

On Tue, Feb 22, 2022 at 04:51:53PM +0100, Christoph Hellwig wrote:
> Using local kmaps slightly reduces the chances to stray writes, and
> the bvec interface cleans up the code a little bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/md/bcache/request.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
> index 6869e010475a3..4e55ca8ca67ff 100644
> --- a/drivers/md/bcache/request.c
> +++ b/drivers/md/bcache/request.c
> @@ -44,10 +44,10 @@ static void bio_csum(struct bio *bio, struct bkey *k)
>  	uint64_t csum = 0;
>  
>  	bio_for_each_segment(bv, bio, iter) {
> -		void *d = kmap(bv.bv_page) + bv.bv_offset;
> +		void *d = bvec_kmap_local(&bv);
>  
>  		csum = crc64_be(csum, d, bv.bv_len);
> -		kunmap(bv.bv_page);
> +		kunmap(d);

kunmap_local()

Ira

>  	}
>  
>  	k->ptr[KEY_PTRS(k)] = csum & (~0ULL >> 1);
> -- 
> 2.30.2
> 
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
