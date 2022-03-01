Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5994C81CA
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 04:54:30 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 32F844217A8;
	Tue,  1 Mar 2022 04:54:29 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D18604217A1
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 04:54:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1646106867; x=1677642867;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=VS6fmfe+veXdqFV0QkiV3wt3rSbkw9JdxwIlqxaie1k=;
	b=ibrtZ1cOkZlqxfgWlGaNPdgJJYob5ekUBywZ2LqoUGQCm8KqLQLToSw8
	Xs92eflDkEHpqAE380ntNsXqWjxW+H6XZ/K+yZTjU2I4XunA7ID1IL16E
	YflzfETvVFt0XyW6oBSFgelc0+6GAxdqtauDj0+9iiA0PncivtVMwTyu4
	xNHXkoDb1yD6nXAUAjEqcArwwt6BITYtprG8b5Mn/T2Ik1ufE4R7y2MxT
	qfkZKnPzz6sy5waL+DvBmIK0kfXo2r68JCCGWrOCmBAB6xPZpbkM2qYzc
	IOJQyyzPyxoY/eOfoyb1wXibHUuyZwpSi3VaLRtWqXbxULFaW2yBq1LK/ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="316264232"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="316264232"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Feb 2022 19:54:25 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="641118781"
Received: from chunhanz-mobl.amr.corp.intel.com (HELO localhost)
	([10.212.29.175]) by orsmga004-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 19:54:24 -0800
Date: Mon, 28 Feb 2022 19:54:23 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yh2Y76PZxSHF1stE@iweiny-desk3>
References: <20220222155156.597597-1-hch@lst.de>
	<20220222155156.597597-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222155156.597597-6-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 05/10] nvdimm-blk: use bvec_kmap_local in
 nd_blk_rw_integrity
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

On Tue, Feb 22, 2022 at 04:51:51PM +0100, Christoph Hellwig wrote:
> Using local kmaps slightly reduces the chances to stray writes, and
> the bvec interface cleans up the code a little bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/nvdimm/blk.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/nvdimm/blk.c b/drivers/nvdimm/blk.c
> index c1db43524d755..0a38738335941 100644
> --- a/drivers/nvdimm/blk.c
> +++ b/drivers/nvdimm/blk.c
> @@ -88,10 +88,9 @@ static int nd_blk_rw_integrity(struct nd_namespace_blk *nsblk,
>  		 */
>  
>  		cur_len = min(len, bv.bv_len);
> -		iobuf = kmap_atomic(bv.bv_page);
> -		err = ndbr->do_io(ndbr, dev_offset, iobuf + bv.bv_offset,
> -				cur_len, rw);
> -		kunmap_atomic(iobuf);
> +		iobuf = bvec_kmap_local(&bv);
> +		err = ndbr->do_io(ndbr, dev_offset, iobuf, cur_len, rw);
> +		kunmap_local(iobuf);
>  		if (err)
>  			return err;
>  
> -- 
> 2.30.2
> 
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
