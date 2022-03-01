Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E48DC4C8CA2
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Mar 2022 14:28:47 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 92FB042179E;
	Tue,  1 Mar 2022 14:28:46 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
	[209.85.166.177])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C3595421798
	for <drbd-dev@lists.linbit.com>; Tue,  1 Mar 2022 14:28:44 +0100 (CET)
Received: by mail-il1-f177.google.com with SMTP id d3so12517721ilr.10
	for <drbd-dev@lists.linbit.com>; Tue, 01 Mar 2022 05:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0rqEHtyUvKInY3eDADJFtpu+gdfZq4axYpoJEFqNG8M=;
	b=I2qodJt4VEaNZJyZteahkXLrk3gcBP6spDM9mba7O5eU1RB0noMF3SaBN+E8vfdw3Y
	GW1Qja0562jHy97CnNHFiAvEnhDIzFZuk2nVuHxePbR8HX9rviCDiIna9neO0UiGoLDn
	jsXu+RAKBdy7qxqlxo03hClTY9xe+rR+zNfDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0rqEHtyUvKInY3eDADJFtpu+gdfZq4axYpoJEFqNG8M=;
	b=B4SKK/oylUrv5RSyqH/p8i+H93rHCKSaULUha38h/spM7J21V1vxGBg3YNC6682Whm
	aqYz39awmK1SPFaeEY+a+9Ye0wGI2PwU0VVd6dwOG/3HYkhzGSqxvXub8Gki8vtHZvJ5
	V3wu042bMXrKQLM+pKJH7XdOWe87bk1HJkgPG/mZF5iZnapr4nGPROeA9yTB0FjynKro
	ZxXNYU9yGkZhXEoyzFNBspBLv1b9K3QNvBTYqr3vGTvn7xrlZQ1oNp6360s3zqYJHoCc
	VIkwd2GooN3OhYivoMSs05YqO2vBwaR1DxJjXYz7OBj3Fz393FyQVNFXnE3/Y3HlEGCT
	MzuA==
X-Gm-Message-State: AOAM532cUJRFxGuZnHPJ9EuAjNrbzYOEXZkeLl06BhQvIqTsvFXghI6G
	Ck5K9IXu7C+G71Z6PiX5k+TfvcmIfcb3QwM7sBuQdQ==
X-Google-Smtp-Source: ABdhPJwFD3IYwN4qrYy++4yIV02k4VVunIMIlONHamgVoi7ny6ji/ttTCSgiD81N18MIcwz3ac7fQNZ2oqyazBRiwXg=
X-Received: by 2002:a92:ca4a:0:b0:2ba:878e:fd12 with SMTP id
	q10-20020a92ca4a000000b002ba878efd12mr22464625ilo.139.1646141263901;
	Tue, 01 Mar 2022 05:27:43 -0800 (PST)
MIME-Version: 1.0
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>
	<164549983737.9187.2627117501000365074.stgit@noble.brown>
In-Reply-To: <164549983737.9187.2627117501000365074.stgit@noble.brown>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 1 Mar 2022 14:27:33 +0100
Message-ID: <CAJfpegsGOFD46KM8pxFAemokv9OOsCSHk=ag6jZZ=VscijMXZQ@mail.gmail.com>
To: NeilBrown <neilb@suse.de>
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
	"Darrick J. Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm <linux-mm@kvack.org>,
	drbd-dev@lists.linbit.com, Paolo Valente <paolo.valente@linaro.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Ext4 <linux-ext4@vger.kernel.org>, Chao Yu <chao@kernel.org>,
	linux-nilfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, Linux NFS list <linux-nfs@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jeff Layton <jlayton@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Wu Fengguang <fengguang.wu@intel.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 04/11] fuse: remove reliance on bdi congestion
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

On Tue, 22 Feb 2022 at 04:18, NeilBrown <neilb@suse.de> wrote:
>
> The bdi congestion tracking in not widely used and will be removed.
>
> Fuse is one of a small number of filesystems that uses it, setting both
> the sync (read) and async (write) congestion flags at what it determines
> are appropriate times.
>
> The only remaining effect of the sync flag is to cause read-ahead to be
> skipped.
> The only remaining effect of the async flag is to cause (some)
> WB_SYNC_NONE writes to be skipped.
>
> So instead of setting the flags, change:
>  - .readahead to stop when it has submitted all non-async pages
>     for read.
>  - .writepages to do nothing if WB_SYNC_NONE and the flag would be set
>  - .writepage to return AOP_WRITEPAGE_ACTIVATE if WB_SYNC_NONE
>     and the flag would be set.
>
> The writepages change causes a behavioural change in that pageout() can
> now return PAGE_ACTIVATE instead of PAGE_KEEP, so SetPageActive() will
> be called on the page which (I think) will further delay the next attempt
> at writeout.  This might be a good thing.
>
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>  fs/fuse/control.c |   17 -----------------
>  fs/fuse/dev.c     |    8 --------
>  fs/fuse/file.c    |   17 +++++++++++++++++
>  3 files changed, 17 insertions(+), 25 deletions(-)
>
> diff --git a/fs/fuse/control.c b/fs/fuse/control.c
> index 000d2e5627e9..7cede9a3bc96 100644
> --- a/fs/fuse/control.c
> +++ b/fs/fuse/control.c
> @@ -164,7 +164,6 @@ static ssize_t fuse_conn_congestion_threshold_write(struct file *file,
>  {
>         unsigned val;
>         struct fuse_conn *fc;
> -       struct fuse_mount *fm;
>         ssize_t ret;
>
>         ret = fuse_conn_limit_write(file, buf, count, ppos, &val,
> @@ -178,22 +177,6 @@ static ssize_t fuse_conn_congestion_threshold_write(struct file *file,
>         down_read(&fc->killsb);
>         spin_lock(&fc->bg_lock);
>         fc->congestion_threshold = val;
> -
> -       /*
> -        * Get any fuse_mount belonging to this fuse_conn; s_bdi is
> -        * shared between all of them
> -        */
> -
> -       if (!list_empty(&fc->mounts)) {
> -               fm = list_first_entry(&fc->mounts, struct fuse_mount, fc_entry);
> -               if (fc->num_background < fc->congestion_threshold) {
> -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> -               } else {
> -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> -               }
> -       }
>         spin_unlock(&fc->bg_lock);
>         up_read(&fc->killsb);
>         fuse_conn_put(fc);
> diff --git a/fs/fuse/dev.c b/fs/fuse/dev.c
> index cd54a529460d..e1b4a846c90d 100644
> --- a/fs/fuse/dev.c
> +++ b/fs/fuse/dev.c
> @@ -315,10 +315,6 @@ void fuse_request_end(struct fuse_req *req)
>                                 wake_up(&fc->blocked_waitq);
>                 }
>
> -               if (fc->num_background == fc->congestion_threshold && fm->sb) {
> -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> -                       clear_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> -               }
>                 fc->num_background--;
>                 fc->active_background--;
>                 flush_bg_queue(fc);
> @@ -540,10 +536,6 @@ static bool fuse_request_queue_background(struct fuse_req *req)
>                 fc->num_background++;
>                 if (fc->num_background == fc->max_background)
>                         fc->blocked = 1;
> -               if (fc->num_background == fc->congestion_threshold && fm->sb) {
> -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_SYNC);
> -                       set_bdi_congested(fm->sb->s_bdi, BLK_RW_ASYNC);
> -               }
>                 list_add_tail(&req->list, &fc->bg_queue);
>                 flush_bg_queue(fc);
>                 queued = true;
> diff --git a/fs/fuse/file.c b/fs/fuse/file.c
> index 829094451774..94747bac3489 100644
> --- a/fs/fuse/file.c
> +++ b/fs/fuse/file.c
> @@ -966,6 +966,14 @@ static void fuse_readahead(struct readahead_control *rac)
>                 struct fuse_io_args *ia;
>                 struct fuse_args_pages *ap;
>
> +               if (fc->num_background >= fc->congestion_threshold &&
> +                   rac->ra->async_size >= readahead_count(rac))
> +                       /*
> +                        * Congested and only async pages left, so skip the
> +                        * rest.
> +                        */
> +                       break;

Ah, you are taking care of it here...

Regarding the async part: a potential (corner?) case is if task A is
reading region X and triggering readahead for region Y and at the same
time task B is reading region Y.  In the congestion case it can happen
that non-uptodate pages in Y are truncated off the pagecache while B
is waiting for them to become uptodate.

This shouldn't be too hard to trigger, just need two sequential
readers of the same file, where one is just ahead of the other.  I'll
try to do a test program for this case specifically.

Thanks,
Miklos
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
