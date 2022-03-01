Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0C34C81D4
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 04:59:11 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B48594217AA;
	Tue,  1 Mar 2022 04:59:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6FA6F4217A1
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 04:59:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1646107149; x=1677643149;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=JmKLQqD/paUGVR0IFWSaZMWPH0JozuynpP4eKVlBoHg=;
	b=SLInjPXPOnhUDrB61ob3TAw4vs0OmIv2YeByfULV0IYfMWknURXqG5tx
	iTEpx+9mybcMl7BGUu2R/Zc5ZqIXeo/f4GwRkTrrLMe7hqgQFSZdce4oI
	QvEeRy8LiG5Y6/RhtJ9D7tw15nHvOEOZiGVYR1l7nG49TJdWaL3eG+xbx
	np7K6QeDIf+0VlmpHX+U3Bx7TgAgZH0IqI0FJaEpIOHmsARS+65Ikgk4+
	wm7BmQwx5OFwGe9+yZ8gbXgkUm62zNDSfW9yCgny8QIocXbxIN7/T4tpo
	maJMjkkX/IbxTm7Vg7FCzPLK6s4yMRQDbPU0WFglW10N2sh40uNgoMxUC A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="233019238"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="233019238"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Feb 2022 19:59:08 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="575563941"
Received: from chunhanz-mobl.amr.corp.intel.com (HELO localhost)
	([10.212.29.175]) by orsmga001-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 19:59:07 -0800
Date: Mon, 28 Feb 2022 19:59:06 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yh2aCi6gtG0naC1r@iweiny-desk3>
References: <20220222155156.597597-1-hch@lst.de>
	<20220222155156.597597-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222155156.597597-7-hch@lst.de>
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

On Tue, Feb 22, 2022 at 04:51:52PM +0100, Christoph Hellwig wrote:
> Using local kmaps slightly reduces the chances to stray writes, and
> the bvec interface cleans up the code a little bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/nvdimm/btt.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
> index cbd994f7f1fe6..9613e54c7a675 100644
> --- a/drivers/nvdimm/btt.c
> +++ b/drivers/nvdimm/btt.c
> @@ -1163,17 +1163,15 @@ static int btt_rw_integrity(struct btt *btt, struct bio_integrity_payload *bip,
>  		 */
>  
>  		cur_len = min(len, bv.bv_len);
> -		mem = kmap_atomic(bv.bv_page);
> +		mem = bvec_kmap_local(&bv);
>  		if (rw)
> -			ret = arena_write_bytes(arena, meta_nsoff,
> -					mem + bv.bv_offset, cur_len,
> +			ret = arena_write_bytes(arena, meta_nsoff, mem, cur_len,

Why drop bv.bv_offset here and below?

Ira

>  					NVDIMM_IO_ATOMIC);
>  		else
> -			ret = arena_read_bytes(arena, meta_nsoff,
> -					mem + bv.bv_offset, cur_len,
> +			ret = arena_read_bytes(arena, meta_nsoff, mem, cur_len,
>  					NVDIMM_IO_ATOMIC);
>  
> -		kunmap_atomic(mem);
> +		kunmap_local(mem);
>  		if (ret)
>  			return ret;
>  
> -- 
> 2.30.2
> 
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
