Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C34C81EB
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 05:07:41 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BAE574217AD;
	Tue,  1 Mar 2022 05:07:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 718194217A9
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 05:07:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1646107659; x=1677643659;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=wwDVriVDm7UgNSs8eXv3lJSf+SyllYz/XxGrm4fiOYw=;
	b=KF+DTAdRsJ1CDNbAf/6jzOAMLRhigIivRNQi9xIwXHKb5Jck8yelE+/h
	YhG8mXSIAtm3BTU/NuQjvZock12FDpvf/uqhp1OqF9mJoyRsdEWUuAx+k
	TGeGjVsuybSQpl9CbeE6awmrIO3xVHSa+TgIqKz5BFfZDOq3Suz45jrr1
	cu/WIpyFrwWas2xjpiUXC+5mpJGvOOAuoQwldjwT60NpWXmDVVDeoEutx
	UGilLUv5V/8AKGbVB370vMme0OkroHSRfyRljT8dtNpA4N2IhfIJ+7Bsy
	BM+RW4nyHc9Jv4B0nv7PEfL0u9/lWo2dEOrckkRwVAJsI8X/FqJDjg0wt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="233667898"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="233667898"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Feb 2022 20:06:38 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="639228248"
Received: from chunhanz-mobl.amr.corp.intel.com (HELO localhost)
	([10.212.29.175]) by fmsmga002-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 20:06:37 -0800
Date: Mon, 28 Feb 2022 20:06:37 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yh2bzX6YzzltNLZg@iweiny-desk3>
References: <20220222155156.597597-1-hch@lst.de>
	<20220222155156.597597-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222155156.597597-9-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 08/10] drbd: use bvec_kmap_local in
	drbd_csum_bio
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

On Tue, Feb 22, 2022 at 04:51:54PM +0100, Christoph Hellwig wrote:
> Using local kmaps slightly reduces the chances to stray writes, and
> the bvec interface cleans up the code a little bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/block/drbd/drbd_worker.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
> index a5e04b38006b6..1b48c8172a077 100644
> --- a/drivers/block/drbd/drbd_worker.c
> +++ b/drivers/block/drbd/drbd_worker.c
> @@ -326,9 +326,9 @@ void drbd_csum_bio(struct crypto_shash *tfm, struct bio *bio, void *digest)
>  	bio_for_each_segment(bvec, bio, iter) {
>  		u8 *src;
>  
> -		src = kmap_atomic(bvec.bv_page);
> -		crypto_shash_update(desc, src + bvec.bv_offset, bvec.bv_len);
> -		kunmap_atomic(src);
> +		src = bvec_kmap_local(&bvec);
> +		crypto_shash_update(desc, src, bvec.bv_len);
> +		kunmap_local(src);
>  
>  		/* REQ_OP_WRITE_SAME has only one segment,
>  		 * checksum the payload only once. */
> -- 
> 2.30.2
> 
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
