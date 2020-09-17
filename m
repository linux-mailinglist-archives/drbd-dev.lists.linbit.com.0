Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 502D826D7E5
	for <lists+drbd-dev@lfdr.de>; Thu, 17 Sep 2020 11:42:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3C5CE420E00;
	Thu, 17 Sep 2020 11:42:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 33F4E420DF9
	for <drbd-dev@lists.linbit.com>; Thu, 17 Sep 2020 11:42:14 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B6C92AFE5;
	Thu, 17 Sep 2020 09:41:47 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id B26A41E12E1; Thu, 17 Sep 2020 11:41:13 +0200 (CEST)
Date: Thu, 17 Sep 2020 11:41:13 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200917094113.GH7347@quack2.suse.cz>
References: <20200910144833.742260-1-hch@lst.de>
	<20200910144833.742260-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200910144833.742260-2-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 01/12] fs: remove the unused SB_I_MULTIROOT
	flag
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

On Thu 10-09-20 16:48:21, Christoph Hellwig wrote:
> The last user of SB_I_MULTIROOT is disappeared with commit f2aedb713c28
> ("NFS: Add fs_context support.")
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Nice. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza
> ---
>  fs/namei.c         | 4 ++--
>  include/linux/fs.h | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/namei.c b/fs/namei.c
> index e99e2a9da0f7de..f1eb8ccd2be958 100644
> --- a/fs/namei.c
> +++ b/fs/namei.c
> @@ -568,8 +568,8 @@ static bool path_connected(struct vfsmount *mnt, struct dentry *dentry)
>  {
>  	struct super_block *sb = mnt->mnt_sb;
>  
> -	/* Bind mounts and multi-root filesystems can have disconnected paths */
> -	if (!(sb->s_iflags & SB_I_MULTIROOT) && (mnt->mnt_root == sb->s_root))
> +	/* Bind mounts can have disconnected paths */
> +	if (mnt->mnt_root == sb->s_root)
>  		return true;
>  
>  	return is_subdir(dentry, mnt->mnt_root);
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 7519ae003a082c..fbd74df5ce5f34 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1385,7 +1385,6 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_I_CGROUPWB	0x00000001	/* cgroup-aware writeback enabled */
>  #define SB_I_NOEXEC	0x00000002	/* Ignore executables on this fs */
>  #define SB_I_NODEV	0x00000004	/* Ignore devices on this fs */
> -#define SB_I_MULTIROOT	0x00000008	/* Multiple roots to the dentry tree */
>  
>  /* sb->s_iflags to limit user namespace mounts */
>  #define SB_I_USERNS_VISIBLE		0x00000010 /* fstype already mounted */
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
