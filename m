Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C5526D7C8
	for <lists+drbd-dev@lfdr.de>; Thu, 17 Sep 2020 11:36:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A405D420DF9;
	Thu, 17 Sep 2020 11:36:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 01DFD420DF9
	for <drbd-dev@lists.linbit.com>; Thu, 17 Sep 2020 11:36:55 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 87C08AC61;
	Thu, 17 Sep 2020 09:37:29 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 554E71E12E1; Thu, 17 Sep 2020 11:36:55 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:36:55 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200917093655.GG7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-8-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-8-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>, Minchan Kim <minchan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 07/12] bdi: remove BDI_CAP_CGROUP_WRITEBACK
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

On Thu 10-09-20 16:48:27, Christoph Hellwig wrote:
> Just checking SB_I_CGROUPWB for cgroup writeback support is enough.
> Either the file system allocates its own bdi (e.g. btrfs), in which case
> it is known to support cgroup writeback, or the bdi comes from the block
> layer, which always supports cgroup writeback.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Makes sense. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  block/blk-core.c            | 1 -
>  fs/btrfs/disk-io.c          | 1 -
>  include/linux/backing-dev.h | 8 +++-----
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index 18c092f8d69175..d81ee511ec8b01 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -538,7 +538,6 @@ struct request_queue *blk_alloc_queue(int node_id)
>  	if (!q->stats)
>  		goto fail_stats;
>  
> -	q->backing_dev_info->capabilities = BDI_CAP_CGROUP_WRITEBACK;
>  	q->node = node_id;
>  
>  	atomic_set(&q->nr_active_requests_shared_sbitmap, 0);
> diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
> index 047934cea25efa..e24927bddd5829 100644
> --- a/fs/btrfs/disk-io.c
> +++ b/fs/btrfs/disk-io.c
> @@ -3091,7 +3091,6 @@ int __cold open_ctree(struct super_block *sb, struct btrfs_fs_devices *fs_device
>  		goto fail_sb_buffer;
>  	}
>  
> -	sb->s_bdi->capabilities |= BDI_CAP_CGROUP_WRITEBACK;
>  	sb->s_bdi->ra_pages *= btrfs_super_num_devices(disk_super);
>  	sb->s_bdi->ra_pages = max(sb->s_bdi->ra_pages, SZ_4M / PAGE_SIZE);
>  
> diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
> index 0b06b2d26c9aa3..52583b6f2ea05d 100644
> --- a/include/linux/backing-dev.h
> +++ b/include/linux/backing-dev.h
> @@ -123,7 +123,6 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
>   * BDI_CAP_NO_ACCT_WB:     Don't automatically account writeback pages
>   * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
>   *
> - * BDI_CAP_CGROUP_WRITEBACK: Supports cgroup-aware writeback.
>   * BDI_CAP_SYNCHRONOUS_IO: Device is so fast that asynchronous IO would be
>   *			   inefficient.
>   */
> @@ -233,9 +232,9 @@ int inode_congested(struct inode *inode, int cong_bits);
>   * inode_cgwb_enabled - test whether cgroup writeback is enabled on an inode
>   * @inode: inode of interest
>   *
> - * cgroup writeback requires support from both the bdi and filesystem.
> - * Also, both memcg and iocg have to be on the default hierarchy.  Test
> - * whether all conditions are met.
> + * Cgroup writeback requires support from the filesystem.  Also, both memcg and
> + * iocg have to be on the default hierarchy.  Test whether all conditions are
> + * met.
>   *
>   * Note that the test result may change dynamically on the same inode
>   * depending on how memcg and iocg are configured.
> @@ -247,7 +246,6 @@ static inline bool inode_cgwb_enabled(struct inode *inode)
>  	return cgroup_subsys_on_dfl(memory_cgrp_subsys) &&
>  		cgroup_subsys_on_dfl(io_cgrp_subsys) &&
>  		bdi_cap_account_dirty(bdi) &&
> -		(bdi->capabilities & BDI_CAP_CGROUP_WRITEBACK) &&
>  		(inode->i_sb->s_iflags & SB_I_CGROUPWB);
>  }
>  
> -- 
> 2.28.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
