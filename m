Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6298D49F08F
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jan 2022 02:34:36 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4CE5C42A58D;
	Fri, 28 Jan 2022 02:34:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AD27242A583
	for <drbd-dev@lists.linbit.com>;
	Fri, 28 Jan 2022 02:34:35 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9335961D9F;
	Fri, 28 Jan 2022 01:34:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A24C340E4;
	Fri, 28 Jan 2022 01:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643333674;
	bh=syJ8YNq0jFqssCN+Fpn6CejIFER0XxHyJW+5cZh7qQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r4MmK2L91UnUY3Ju+lob6pGYrfuC4tFQze7/UdZcwtg0my1bI0HYZ/EGzcR2/0eYh
	5qWQkXkz6GQ99yyiTKsnnZ4hM95RpS6f7bdJAM5P56admAP3hc/ZCtXKNCnRVkrgES
	v2zuReXf7omP1BD/F2BPe0mg+8tbNoZzsZhdyhFKiYcIFiKTzLCcaIL+zbZB+jgKI2
	HaKelY2L0Vg6ndyDgX/aggsEHmYplzWVSHFk3KYEO4hj0B99GHfDlJ8bPCc2gICQtz
	XRdKz8lPe2Sew/3rSqRIVIUhmZZ9ob0Va5c0yw/atKn6Dw4IaoROTNoyJVls08WLFV
	3jQ5xdJOfRU/w==
Date: Thu, 27 Jan 2022 17:34:31 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: NeilBrown <neilb@suse.de>
Message-ID: <YfNIJxirDBO/pcQQ@google.com>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
	<164325158956.29787.7016948342209980097.stgit@noble.brown>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <164325158956.29787.7016948342209980097.stgit@noble.brown>
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, drbd-dev@lists.linbit.com,
	Paolo Valente <paolo.valente@linaro.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Chao Yu <chao@kernel.org>, linux-block@vger.kernel.org,
	linux-nilfs@vger.kernel.org, ceph-devel@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Jeff Layton <jlayton@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 3/9] f2fs: change retry waiting for
 f2fs_write_single_data_page()
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

On 01/27, NeilBrown wrote:
> f2fs_write_single_data_page() can return -EAGAIN if it cannot get
> the cp_rwsem lock - it holds a page lock and so cannot wait for it.
> 
> Some code which calls f2fs_write_single_data_page() use
> congestion_wait() and then tries again.  congestion_wait() doesn't do
> anything useful as congestion is no longer tracked.  So this is just a
> simple sleep.
> 
> A better approach is it wait until the cp_rwsem lock can be taken - then
> try again.  There is certainly no point trying again *before* the lock
> can be taken.
> 
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>  fs/f2fs/compress.c |    6 +++---
>  fs/f2fs/data.c     |    9 ++++++---
>  2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index d0c3aeba5945..58ff7f4b296c 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1505,9 +1505,9 @@ static int f2fs_write_raw_pages(struct compress_ctx *cc,
>  				if (IS_NOQUOTA(cc->inode))
>  					return 0;
>  				ret = 0;
> -				cond_resched();
> -				congestion_wait(BLK_RW_ASYNC,
> -						DEFAULT_IO_TIMEOUT);
> +				/* Wait until we can get the lock, then try again. */
> +				f2fs_lock_op(F2FS_I_SB(cc->inode));
> +				f2fs_unlock_op(F2FS_I_SB(cc->inode));

Since checkpoint uses down_write(cp_rwsem), I'm not sure the write path is safe
and needs to wait for checkpoint. Can we just do io_schedule_timeout()?

>  				goto retry_write;
>  			}
>  			return ret;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 8c417864c66a..1d2341163e2c 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3047,9 +3047,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>  				} else if (ret == -EAGAIN) {
>  					ret = 0;
>  					if (wbc->sync_mode == WB_SYNC_ALL) {
> -						cond_resched();
> -						congestion_wait(BLK_RW_ASYNC,
> -							DEFAULT_IO_TIMEOUT);
> +						/* Wait until we can get the
> +						 * lock, then try again.
> +						 */
> +						f2fs_lock_op(F2FS_I_SB(mapping->host));
> +						f2fs_unlock_op(F2FS_I_SB(mapping->host));
> +
>  						goto retry_write;
>  					}
>  					goto next;
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
