Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F14B305455
	for <lists+drbd-dev@lfdr.de>; Wed, 27 Jan 2021 08:21:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 75E7F4205E5;
	Wed, 27 Jan 2021 08:21:32 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 323 seconds by postgrey-1.31 at mail19;
	Wed, 27 Jan 2021 08:21:30 CET
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 893D042006B
	for <drbd-dev@lists.linbit.com>; Wed, 27 Jan 2021 08:21:30 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DDA820759
	for <drbd-dev@lists.linbit.com>; Wed, 27 Jan 2021 07:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611732089;
	bh=PHGvgPZS9fmzb8WwHWTDSJ0PUf4j0hQIB49cA17Ux8M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aOcLULEJAETe0ZlQOMFoWv+xV+961UgFHoRNBzUMPi/oFzrgBLf6fpFTjN/IS05QO
	zYzdqWHKfbJrw60OF8NQxrmzPpTarFG5BYYhXfdM82s2hq4GFbvrBTg0+/gc9t50It
	YL3Oe/Z9JLGMVM5I+aLWcGsKrktoXC5hMjaVZsxS33HhjLk4OG2Duzg5eJzML2qsTX
	SvIigcKxB7d/BjQsPegVpK8LEUO0LIj3aQP1HkoGMEQsssBIbzs2Nv5jASFVBV6Rrv
	RhIZkevlJdJVxgQR3wvBJsdnYdlgcaGm25mcIExHcY0pbsKd4dATwjIkTayV/aOI2P
	9V2GznHJHrLLQ==
Received: by mail-lf1-f46.google.com with SMTP id b2so1283929lfq.0
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 23:21:28 -0800 (PST)
X-Gm-Message-State: AOAM5323J/bl7q/U6cn4MHX/zylzXNF5F394ZKcL8HyXaQ+490f5jvOf
	Zsy/TjZqlUiNbne9OOnQtVZZJj/307xNHHOEfNo=
X-Google-Smtp-Source: ABdhPJxzU6eEXjGgMsXjIbLicQlntxxKhHAHPBju5x4svSgsvP73GNvKL+gYo0RpjmVTLgHo2j69VOR6hw/D9eon+xA=
X-Received: by 2002:a05:6512:b1b:: with SMTP id
	w27mr4516614lfu.10.1611732087108; 
	Tue, 26 Jan 2021 23:21:27 -0800 (PST)
MIME-Version: 1.0
References: <20210126145247.1964410-1-hch@lst.de>
	<20210126145247.1964410-12-hch@lst.de>
In-Reply-To: <20210126145247.1964410-12-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 23:21:16 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4SRXoOjfU5GHoOGfONjb1yMT7HEyHLZb4E4vNARF44jw@mail.gmail.com>
Message-ID: <CAPhsuW4SRXoOjfU5GHoOGfONjb1yMT7HEyHLZb4E4vNARF44jw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Mike Snitzer <snitzer@redhat.com>, Linux-MM <linux-mm@kvack.org>,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	Naohiro Aota <naohiro.aota@wdc.com>, linux-nilfs@vger.kernel.org,
	Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-raid <linux-raid@vger.kernel.org>,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 11/17] md: remove bio_alloc_mddev
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

On Tue, Jan 26, 2021 at 7:12 AM Christoph Hellwig <hch@lst.de> wrote:
>
> bio_alloc_mddev is never called with a NULL mddev, and ->bio_set is
> initialized in md_run, so it always must be initialized as well.  Just
> open code the remaining call to bio_alloc_bioset.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/md.c     | 12 +-----------
>  drivers/md/md.h     |  2 --
>  drivers/md/raid1.c  |  2 +-
>  drivers/md/raid10.c |  2 +-
>  4 files changed, 3 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 7d1bb24add3107..e2b9dbb6e888f6 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -340,16 +340,6 @@ static int start_readonly;
>   */
>  static bool create_on_open = true;
>
> -struct bio *bio_alloc_mddev(gfp_t gfp_mask, int nr_iovecs,
> -                           struct mddev *mddev)
> -{
> -       if (!mddev || !bioset_initialized(&mddev->bio_set))
> -               return bio_alloc(gfp_mask, nr_iovecs);
> -
> -       return bio_alloc_bioset(gfp_mask, nr_iovecs, &mddev->bio_set);
> -}
> -EXPORT_SYMBOL_GPL(bio_alloc_mddev);
> -
>  static struct bio *md_bio_alloc_sync(struct mddev *mddev)
>  {
>         if (!mddev || !bioset_initialized(&mddev->sync_set))
> @@ -613,7 +603,7 @@ static void submit_flushes(struct work_struct *ws)
>                         atomic_inc(&rdev->nr_pending);
>                         atomic_inc(&rdev->nr_pending);
>                         rcu_read_unlock();
> -                       bi = bio_alloc_mddev(GFP_NOIO, 0, mddev);
> +                       bi = bio_alloc_bioset(GFP_NOIO, 0, &mddev->bio_set);
>                         bi->bi_end_io = md_end_flush;
>                         bi->bi_private = rdev;
>                         bio_set_dev(bi, rdev->bdev);
> diff --git a/drivers/md/md.h b/drivers/md/md.h
> index f13290ccc1c248..bcbba1b5ec4a71 100644
> --- a/drivers/md/md.h
> +++ b/drivers/md/md.h
> @@ -742,8 +742,6 @@ extern void md_rdev_clear(struct md_rdev *rdev);
>  extern void md_handle_request(struct mddev *mddev, struct bio *bio);
>  extern void mddev_suspend(struct mddev *mddev);
>  extern void mddev_resume(struct mddev *mddev);
> -extern struct bio *bio_alloc_mddev(gfp_t gfp_mask, int nr_iovecs,
> -                                  struct mddev *mddev);
>
>  extern void md_reload_sb(struct mddev *mddev, int raid_disk);
>  extern void md_update_sb(struct mddev *mddev, int force);
> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
> index 3b19141cdb4bc2..d2378765dc154f 100644
> --- a/drivers/md/raid1.c
> +++ b/drivers/md/raid1.c
> @@ -1104,7 +1104,7 @@ static void alloc_behind_master_bio(struct r1bio *r1_bio,
>         int i = 0;
>         struct bio *behind_bio = NULL;
>
> -       behind_bio = bio_alloc_mddev(GFP_NOIO, vcnt, r1_bio->mddev);
> +       behind_bio = bio_alloc_bioset(GFP_NOIO, vcnt, &r1_bio->mddev->bio_set);
>         if (!behind_bio)
>                 return;
>
> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
> index be8f14afb6d143..e1eefbec15d444 100644
> --- a/drivers/md/raid10.c
> +++ b/drivers/md/raid10.c
> @@ -4531,7 +4531,7 @@ static sector_t reshape_request(struct mddev *mddev, sector_t sector_nr,
>                 return sectors_done;
>         }
>
> -       read_bio = bio_alloc_mddev(GFP_KERNEL, RESYNC_PAGES, mddev);
> +       read_bio = bio_alloc_bioset(GFP_KERNEL, RESYNC_PAGES, &mddev->bio_set);
>
>         bio_set_dev(read_bio, rdev->bdev);
>         read_bio->bi_iter.bi_sector = (r10_bio->devs[r10_bio->read_slot].addr
> --
> 2.29.2
>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
