Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 138E84C7F5E
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 01:40:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D310D421790;
	Tue,  1 Mar 2022 01:40:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 489 seconds by postgrey-1.31 at mail19;
	Tue, 01 Mar 2022 01:39:57 CET
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A5CF2421790
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 01:39:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1646095200; x=1677631200;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=QySiqZr3Aw1s/l/FX4PY4TC5JAQpi05yLKC4BU8F00g=;
	b=X/CV+YIYH2ZKKNyE8ttALMVsdbKwMnKOO0uFAODM8fIoek/6pzkTKb1j
	OABLR9+DRURvU+KOwrM9AV55jreUppWexlfTWdjB341dD1I71errlTrvI
	Uw8D4um4iRYIIukGQL1K6HFBmhCyznk3lXxc24r31Zpa+cV7VLTq3GtPf
	CuM2NGk6UFQeNoozv1HVRxTgeSLPW/mC7C68fOslQ2buXqDiIEtdJ8F7S
	ASbIsjDFE6v3NTczooTN8AvOPQfbORgbrpEV9kVKL8NcrV8FSup15QdHo
	h05bi9zV3nZlEpxmH1SWkomnepvS5g359VlQ8QvUnm24F4fsxBQRT/Woh A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="277683999"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="277683999"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Feb 2022 16:31:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="639181195"
Received: from chunhanz-mobl.amr.corp.intel.com (HELO localhost)
	([10.212.29.175]) by fmsmga002-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 16:31:46 -0800
Date: Mon, 28 Feb 2022 16:31:46 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yh1pclDpq6iImDAu@iweiny-desk3>
References: <20220222155156.597597-1-hch@lst.de>
	<20220222155156.597597-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222155156.597597-3-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 02/10] aoe: use bvec_kmap_local in bvcpy
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

On Tue, Feb 22, 2022 at 04:51:48PM +0100, Christoph Hellwig wrote:
> Using local kmaps slightly reduces the chances to stray writes, and
> the bvec interface cleans up the code a little bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/aoe/aoecmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
> index cc11f89a0928f..093996961d452 100644
> --- a/drivers/block/aoe/aoecmd.c
> +++ b/drivers/block/aoe/aoecmd.c
> @@ -1018,7 +1018,7 @@ bvcpy(struct sk_buff *skb, struct bio *bio, struct bvec_iter iter, long cnt)
>  	iter.bi_size = cnt;
>  
>  	__bio_for_each_segment(bv, bio, iter, iter) {
> -		char *p = kmap_atomic(bv.bv_page) + bv.bv_offset;
> +		char *p = bvec_kmap_local(&bv);
>  		skb_copy_bits(skb, soff, p, bv.bv_len);
>  		kunmap_atomic(p);

kunmap_local()

Ira

>  		soff += bv.bv_len;
> -- 
> 2.30.2
> 
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
