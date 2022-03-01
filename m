Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9274C7F5F
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 01:41:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2123B42179A;
	Tue,  1 Mar 2022 01:41:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 551 seconds by postgrey-1.31 at mail19;
	Tue, 01 Mar 2022 01:40:48 CET
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3973D421790
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 01:40:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1646095248; x=1677631248;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=iQYOoTv3Io78EdoGSCPEiJBASaZqMAGkeBkPnB8tiBw=;
	b=Is5rjZKkSN8Bgu6BdOE16MTNPNIc6VM1l/pNSL3cXrwJZYNuGYkEmf3+
	BTuP01BD7ReUTvrddzGAvs8w9u1bnIksF6lWkphbeOyTPB0fBAjtHQd9X
	RYNHN0E0JltQfKjHz6mpZsHM1C7H5ReJAh/v6j8+eeAhzFvEcHrzAN68I
	08ST552V02Herbcq7pVa42Ah56F2eyQALdaC/BsnwI4/k3Xd/M0gWSgyx
	yCWdrz1l6AEa7PG0x153bHI3Tze1CQL3kQxUTR0BZh+TJ8xkIsZ28mF/s
	OcSxZcLvKqj4q0x1FAb+l05wd3TUPceDFowvx0NJAKj9JiJsyNU/fXqts w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="240432660"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="240432660"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Feb 2022 16:30:36 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="803674992"
Received: from chunhanz-mobl.amr.corp.intel.com (HELO localhost)
	([10.212.29.175]) by fmsmga005-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 16:30:35 -0800
Date: Mon, 28 Feb 2022 16:30:35 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yh1pKyX8z6R1l7mf@iweiny-desk3>
References: <20220222155156.597597-1-hch@lst.de>
	<20220222155156.597597-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222155156.597597-2-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 01/10] iss-simdisk: use bvec_kmap_local in
 simdisk_submit_bio
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

On Tue, Feb 22, 2022 at 04:51:47PM +0100, Christoph Hellwig wrote:
> Using local kmaps slightly reduces the chances to stray writes, and
> the bvec interface cleans up the code a little bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  arch/xtensa/platforms/iss/simdisk.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/xtensa/platforms/iss/simdisk.c b/arch/xtensa/platforms/iss/simdisk.c
> index 8eb6ad1a3a1de..0f0e0724397f4 100644
> --- a/arch/xtensa/platforms/iss/simdisk.c
> +++ b/arch/xtensa/platforms/iss/simdisk.c
> @@ -108,13 +108,13 @@ static void simdisk_submit_bio(struct bio *bio)
>  	sector_t sector = bio->bi_iter.bi_sector;
>  
>  	bio_for_each_segment(bvec, bio, iter) {
> -		char *buffer = kmap_atomic(bvec.bv_page) + bvec.bv_offset;
> +		char *buffer = bvec_kmap_local(&bvec);
>  		unsigned len = bvec.bv_len >> SECTOR_SHIFT;
>  
>  		simdisk_transfer(dev, sector, len, buffer,
>  				bio_data_dir(bio) == WRITE);
>  		sector += len;
> -		kunmap_atomic(buffer);
> +		kunmap_local(buffer);
>  	}
>  
>  	bio_endio(bio);
> -- 
> 2.30.2
> 
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
