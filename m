Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE454B0A4B
	for <lists+drbd-dev@lfdr.de>; Thu, 10 Feb 2022 11:09:25 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8F8CD42032B;
	Thu, 10 Feb 2022 11:09:24 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 419 seconds by postgrey-1.31 at mail19;
	Thu, 10 Feb 2022 11:09:23 CET
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 31019420164
	for <drbd-dev@lists.linbit.com>; Thu, 10 Feb 2022 11:09:23 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 775E721115;
	Thu, 10 Feb 2022 10:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1644487344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=lcBtRTov0U4scR5M2Iy2myhqZeOwAIyV54RcClAbhV4=;
	b=UVJHxaJMKmE/DO/JZe3iVbVw3GQe2kQmip1zYFYiRYyI1pZTASyk8ODPUH85ZCuqzCIWsi
	rV6USU5SNQRHNVVtN7czjs/tg9jgYBrlYPUuVDHO/aShUUH/4xIgSIpkWiWmMUD14J4lqn
	gHBmV7fgdq0Mk5zS8kvpWhMAHojnEdM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1644487344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=lcBtRTov0U4scR5M2Iy2myhqZeOwAIyV54RcClAbhV4=;
	b=3uOBgMN4Wr+d5mCyhO6cp6IQhYZtOH8ULuhOgZdIotrLORbzqWHkWV4veZpJWP42oTgmJG
	NOB6bjhLKtWqFVCQ==
Received: from quack3.suse.cz (unknown [10.163.28.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 0BE01A3B97;
	Thu, 10 Feb 2022 10:02:23 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id BEB02A05BC; Thu, 10 Feb 2022 11:02:22 +0100 (CET)
Date: Thu, 10 Feb 2022 11:02:22 +0100
From: Jan Kara <jack@suse.cz>
To: NeilBrown <neilb@suse.de>
Message-ID: <20220210100222.f2nmwwb5pcfmejvw@quack3.lan>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>
	<164447147264.23354.2763356897218946255.stgit@noble.brown>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <164447147264.23354.2763356897218946255.stgit@noble.brown>
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	drbd-dev@lists.linbit.com, Paolo Valente <paolo.valente@linaro.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Chao Yu <chao@kernel.org>, linux-block@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Jeff Layton <jlayton@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Wu Fengguang <fengguang.wu@intel.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 10/11] block/bfq-iosched.c: use "false"
 rather than "BLK_RW_ASYNC"
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

On Thu 10-02-22 16:37:52, NeilBrown wrote:
> bfq_get_queue() expects a "bool" for the third arg, so pass "false"
> rather than "BLK_RW_ASYNC" which will soon be removed.
> 
> Acked-by: Jens Axboe <axboe@kernel.dk>
> Signed-off-by: NeilBrown <neilb@suse.de>

Looks good. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/bfq-iosched.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/bfq-iosched.c b/block/bfq-iosched.c
> index 0c612a911696..4e645ae1e066 100644
> --- a/block/bfq-iosched.c
> +++ b/block/bfq-iosched.c
> @@ -5448,7 +5448,7 @@ static void bfq_check_ioprio_change(struct bfq_io_cq *bic, struct bio *bio)
>  	bfqq = bic_to_bfqq(bic, false);
>  	if (bfqq) {
>  		bfq_release_process_ref(bfqd, bfqq);
> -		bfqq = bfq_get_queue(bfqd, bio, BLK_RW_ASYNC, bic, true);
> +		bfqq = bfq_get_queue(bfqd, bio, false, bic, true);
>  		bic_set_bfqq(bic, bfqq, false);
>  	}
>  
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
