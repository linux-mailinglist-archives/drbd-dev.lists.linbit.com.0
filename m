Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3F04C8021
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 02:10:15 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A0DD64217A5;
	Tue,  1 Mar 2022 02:10:14 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7104F4217A1
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 02:10:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1646097012; x=1677633012;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=HwnaWy+oJRDlGNb4s/iv7PtVKCKNjC5iJpB2XE6LsI0=;
	b=ZUuEz/50fU2Sug1cjNhVgJHCr1BomodmxQQWdaDwGJh/NzW1SskxDfSB
	z6EDx4+HGg7K8jLNKUM9zv4NLfzSjEVil/zTAytWXWcN/yQbP7jhOz+IJ
	8CBjLXVFjBlqx2PyIiOKmEgyRde+UhfpWphcbgSvschjl+lnLzp5tqMSB
	CpETJFR020UKijvHIZHG6s5tZIeztVgzhIA0G+wOVBox2OFqso9qCV4LA
	dJt69z/GQ66htEdKKNpTMDndT5G4qng3pJg+XVtIceKStZNmgJO+rPVHp
	FvDH7kmWSUC8ydOX6DOiaMMwCGATD6bymPm1m2PCAfMb8sn0CYcrCGW9o A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="339461166"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="339461166"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Feb 2022 17:10:10 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="685538225"
Received: from chunhanz-mobl.amr.corp.intel.com (HELO localhost)
	([10.212.29.175]) by fmsmga001-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 17:10:10 -0800
Date: Mon, 28 Feb 2022 17:10:09 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yh1ycd3S/FKAtnuD@iweiny-desk3>
References: <20220222155156.597597-1-hch@lst.de>
	<20220222155156.597597-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222155156.597597-4-hch@lst.de>
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

On Tue, Feb 22, 2022 at 04:51:49PM +0100, Christoph Hellwig wrote:
> Use the proper helper instead of open coding the copy.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks fine but I don't see a reason to keep the other operation atomic.  Could
the src map also use kmap_local_page()?

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/block/zram/zram_drv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
> index a3a5e1e713268..14becdf2815df 100644
> --- a/drivers/block/zram/zram_drv.c
> +++ b/drivers/block/zram/zram_drv.c
> @@ -1331,12 +1331,10 @@ static int zram_bvec_read(struct zram *zram, struct bio_vec *bvec,
>  		goto out;
>  
>  	if (is_partial_io(bvec)) {
> -		void *dst = kmap_atomic(bvec->bv_page);
>  		void *src = kmap_atomic(page);
>  
> -		memcpy(dst + bvec->bv_offset, src + offset, bvec->bv_len);
> +		memcpy_to_bvec(bvec, src + offset);
>  		kunmap_atomic(src);
> -		kunmap_atomic(dst);
>  	}
>  out:
>  	if (is_partial_io(bvec))
> -- 
> 2.30.2
> 
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
