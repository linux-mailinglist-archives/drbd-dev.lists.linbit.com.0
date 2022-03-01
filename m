Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2CE4C8200
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 05:11:32 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B09F94217B2;
	Tue,  1 Mar 2022 05:11:32 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A5E644217A9
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 05:11:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
	t=1646107877; x=1677643877;
	h=date:from:to:cc:subject:message-id:references:
	mime-version:in-reply-to;
	bh=qltwIc937Uu5ijgl7gEV8QkFm9r0IMF7rI6cefmccNg=;
	b=RBboOQ2yQ/0HDS4vJcPzd2zohpWWMmp0LiqD646U7QQsJQYkvCNpCx2Z
	mU6f3g0bVYIAx/DletGLiOCmFUoPILQZK0QYcEs2spD6Hnp5MVlNkoeKX
	jlHXfOeeoW7bzrjmZh47yVeeLZBD30FlB7gBgeHib2S1G5B9O9PA3sZZE
	pIGV3qB+pxKPvvThOf2lvZZVwTXTdekpI8jt6hNXVeT79tgMuwpcwbdch
	0fwQ5vLPBv3NAcClEUEgZ+v/WESfkj70OoIKcph4zSEfviIqW48dN1drQ
	aTOCh7S3Ikbs9AXdmjdKW//xh302VIJb1L3ACLLe/89RwnJThLeD4ZnDi g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="316266160"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="316266160"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	28 Feb 2022 20:11:16 -0800
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; d="scan'208";a="550543648"
Received: from chunhanz-mobl.amr.corp.intel.com (HELO localhost)
	([10.212.29.175]) by orsmga008-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 20:11:15 -0800
Date: Mon, 28 Feb 2022 20:11:15 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yh2c41kEWmmGgWLG@iweiny-desk3>
References: <20220222155156.597597-1-hch@lst.de>
	<20220222155156.597597-11-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222155156.597597-11-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 10/10] floppy: use memcpy_{to,from}_bvec
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

On Tue, Feb 22, 2022 at 04:51:56PM +0100, Christoph Hellwig wrote:
> Use the helpers instead of open coding them.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

> ---
>  drivers/block/floppy.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
> index 19c2d0327e157..8c647532e3ce9 100644
> --- a/drivers/block/floppy.c
> +++ b/drivers/block/floppy.c
> @@ -2485,11 +2485,9 @@ static void copy_buffer(int ssize, int max_sector, int max_sector_2)
>  		}
>  
>  		if (CT(raw_cmd->cmd[COMMAND]) == FD_READ)
> -			memcpy_to_page(bv.bv_page, bv.bv_offset, dma_buffer,
> -				       size);
> +			memcpy_to_bvec(&bv, dma_buffer);
>  		else
> -			memcpy_from_page(dma_buffer, bv.bv_page, bv.bv_offset,
> -					 size);
> +			memcpy_from_bvec(dma_buffer, &bv);
>  
>  		remaining -= size;
>  		dma_buffer += size;
> -- 
> 2.30.2
> 
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
