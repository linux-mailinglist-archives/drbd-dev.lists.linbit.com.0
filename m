Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319C4C80D5
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 03:15:07 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F35CA4217A8;
	Tue,  1 Mar 2022 03:15:05 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF8664217A1
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 03:15:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1646100904; x=1677636904;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=FHnCsOMAMVBswmIQalbSrppghnzz3akbTDtT8A36Yxg=;
	b=gDYW81p7Iy1B4CRHWtxvdzfNuvCJN2svgkIFSpkZiH+wJCYoXm4d530g
	EafwXOwdyAnXtDnUP2ZskXyAVresAxr7W+QEoDL4rvItd7TrpSG/rZBkw
	+/duaJM4uikZ6Y3CEcXv25uHF+dvsHab4cdBdzbK8+i+sEjfCZ2JDhT0f
	mCyz/7jaC71jpmCGp7xPs3AHlaiaBhmQKmXHqYKIWpPUltCGYjyXbIXbL
	ot4oueiUF+pqW1xCS5NwJFA6G5lVItR/D+jMeyFbb3TPis2UdqKoobmBT
	c8euhJYCTznx2Aax3MGHqLsOgx+QbK/5cCMB8E2f8x7b/A1N+1IsUtbsi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="233654418"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="233654418"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Feb 2022 18:12:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="629855449"
Received: from chunhanz-mobl.amr.corp.intel.com (HELO localhost)
	([10.212.29.175]) by fmsmga003-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 18:12:45 -0800
Date: Mon, 28 Feb 2022 18:12:45 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yh2BHT4xXBJac987@iweiny-desk3>
References: <20220222155156.597597-1-hch@lst.de>
	<20220222155156.597597-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222155156.597597-5-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 04/10] zram: use memcpy_from_bvec in
	zram_bvec_write
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

On Tue, Feb 22, 2022 at 04:51:50PM +0100, Christoph Hellwig wrote:
> Use memcpy_from_bvec instead of open coding the logic.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Same comment regarding the dst map.  Does it need to be atomic?

Regardless,
Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/block/zram/zram_drv.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index 14becdf2815df..e9474b02012de 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -1465,7 +1465,6 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec,
>  {
>  	int ret;
>  	struct page *page = NULL;
> -	void *src;
>  	struct bio_vec vec;
>  
>  	vec = *bvec;
> @@ -1483,11 +1482,9 @@ static int zram_bvec_write(struct zram *zram, struct bio_vec *bvec,
>  		if (ret)
>  			goto out;
>  
> -		src = kmap_atomic(bvec->bv_page);
>  		dst = kmap_atomic(page);
> -		memcpy(dst + offset, src + bvec->bv_offset, bvec->bv_len);
> +		memcpy_from_bvec(dst + offset, bvec);
>  		kunmap_atomic(dst);
> -		kunmap_atomic(src);
>  
>  		vec.bv_page = page;
>  		vec.bv_len = PAGE_SIZE;
> -- 
> 2.30.2
> 
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
