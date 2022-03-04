Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEFD4CCC17
	for <lists+drbd-dev@lfdr.de>; Fri,  4 Mar 2022 04:07:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E388442177F;
	Fri,  4 Mar 2022 04:07:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BF06C4201F3
	for <drbd-dev@lists.linbit.com>; Fri,  4 Mar 2022 04:07:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1646363251; x=1677899251;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=Lc9qHdOlafcJNOz8evKbREjH7xRoVMfzT76IGNVrBPY=;
	b=XfHLs2XObDpHSE+KBv7dRsyZEo3U49Y3CTRdPcYI2sf7gPuVaSIuSx9/
	5dnBp/fXv7Y8Xovxgsi4Ip0O7VZwZ01TtLUz0wQ7KQ3VTfXbYA9Xpf0LN
	ZnebRygdmu2QCEEU5nClJ0MtiRWTpTDyg62KxNpxgocc+xagsI9irTpfu
	erRwg7b5/wNUDelH7/vGUHeDn+7mqTwFc58JN6nFxMbTfIQUbwOQCKFrs
	GgdetaBdYc8IWHXuEA+Acr69vu8cuHUOD+jCWD47ShPsQxidMv39rt4Kv
	Y2PoSa6Sgh/slo94Ff//agrcTA7etBblDGPeC2uyo2apxxtPzdfcHG6Dy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10275"; a="314595014"
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="314595014"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	03 Mar 2022 19:06:12 -0800
X-IronPort-AV: E=Sophos;i="5.90,154,1643702400"; d="scan'208";a="546100598"
Received: from harikara-mobl.amr.corp.intel.com (HELO localhost)
	([10.212.33.238]) by fmsmga007-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 19:06:11 -0800
Date: Thu, 3 Mar 2022 19:06:11 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YiGCIzAwEO+o9pEj@iweiny-desk3>
References: <20220303111905.321089-1-hch@lst.de>
	<20220303111905.321089-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220303111905.321089-8-hch@lst.de>
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

On Thu, Mar 03, 2022 at 02:19:02PM +0300, Christoph Hellwig wrote:
> Using local kmaps slightly reduces the chances to stray writes, and
> the bvec interface cleans up the code a little bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/md/bcache/request.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
> index 6869e010475a3..fdd0194f84dd0 100644
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
> +		kunmap_local(d);
>  	}
>  
>  	k->ptr[KEY_PTRS(k)] = csum & (~0ULL >> 1);
> -- 
> 2.30.2
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
