Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1353730546B
	for <lists+drbd-dev@lfdr.de>; Wed, 27 Jan 2021 08:23:02 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EA5634205FF;
	Wed, 27 Jan 2021 08:23:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7C4384205FF
	for <drbd-dev@lists.linbit.com>; Wed, 27 Jan 2021 08:23:00 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 301BF2072C
	for <drbd-dev@lists.linbit.com>; Wed, 27 Jan 2021 07:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611732179;
	bh=wys3sZM3KFLi7kSDIT+8OH9R8Mzfn9WfVwnN3287ktM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bec44/no8t56Z502LgnlM+Qg3a7iRfwb8LyhJ+o5g82IaOznb97Gk8xlDwtFm7y0Q
	4B+/tC5K9lGgUBiHyhE00pi36rFGRQbfNmoExpX38MvaaIEiIlo5Xpl02zb3d2+c9I
	6QT/NDPMg5Mj36lJBF9f+RFUcTIY2MmljvRbc0DiIULgDdoXmR4KXliM+gH3VlyPk6
	mHWoOAExmkNvS6m/z6G7b4ZdKBJLDixAbo/Wzlpm3cgdfJxA927Fy/aSbJhFzA/wq4
	2ciHhZnN+TzrdwTTB4DOYnCFwWnsw1IL4QMJJGrVzDQalyZsi3zFFnOCUMa/DMqtOX
	AkooKL+eqRW2g==
Received: by mail-lj1-f175.google.com with SMTP id c18so892332ljd.9
	for <drbd-dev@lists.linbit.com>; Tue, 26 Jan 2021 23:22:59 -0800 (PST)
X-Gm-Message-State: AOAM531CrKkCwhqPjxoEBZ9yNSeaiqJBhvQcPx+qNNHQJpa9OqlYuWg9
	c4qMwqviO3ulrWwEZkAQ+CfA5Dj1G10Z1ZY8z/c=
X-Google-Smtp-Source: ABdhPJwT4SgEWFQYI+aGplxcgngrqXZ09YVZXq+be6TcwdS2L0sd+F5PxgqsedykGzzK3GAh/e6zF7ilKInCLGcj5r0=
X-Received: by 2002:a2e:b8d3:: with SMTP id s19mr5116366ljp.97.1611732177533; 
	Tue, 26 Jan 2021 23:22:57 -0800 (PST)
MIME-Version: 1.0
References: <20210126145247.1964410-1-hch@lst.de>
	<20210126145247.1964410-14-hch@lst.de>
In-Reply-To: <20210126145247.1964410-14-hch@lst.de>
From: Song Liu <song@kernel.org>
Date: Tue, 26 Jan 2021 23:22:46 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4AViTNjq1mp6zvbEJ8zKdK7__BfXEsvATTBWraK2u1Jg@mail.gmail.com>
Message-ID: <CAPhsuW4AViTNjq1mp6zvbEJ8zKdK7__BfXEsvATTBWraK2u1Jg@mail.gmail.com>
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
Subject: Re: [Drbd-dev] [PATCH 13/17] md: remove md_bio_alloc_sync
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

On Tue, Jan 26, 2021 at 7:17 AM Christoph Hellwig <hch@lst.de> wrote:
>
> md_bio_alloc_sync is never called with a NULL mddev, and ->sync_set is
> initialized in md_run, so it always must be initialized as well.  Just
> open code the remaining call to bio_alloc_bioset.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Song Liu <song@kernel.org>

> ---
>  drivers/md/md.c | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/drivers/md/md.c b/drivers/md/md.c
> index 6a27f52007c871..399c81bddc1ae1 100644
> --- a/drivers/md/md.c
> +++ b/drivers/md/md.c
> @@ -340,14 +340,6 @@ static int start_readonly;
>   */
>  static bool create_on_open = true;
>
> -static struct bio *md_bio_alloc_sync(struct mddev *mddev)
> -{
> -       if (!mddev || !bioset_initialized(&mddev->sync_set))
> -               return bio_alloc(GFP_NOIO, 1);
> -
> -       return bio_alloc_bioset(GFP_NOIO, 1, &mddev->sync_set);
> -}
> -
>  /*
>   * We have a system wide 'event count' that is incremented
>   * on any 'interesting' event, and readers of /proc/mdstat
> @@ -989,7 +981,7 @@ void md_super_write(struct mddev *mddev, struct md_rdev *rdev,
>         if (test_bit(Faulty, &rdev->flags))
>                 return;
>
> -       bio = md_bio_alloc_sync(mddev);
> +       bio = bio_alloc_bioset(GFP_NOIO, 1, &mddev->sync_set);
>
>         atomic_inc(&rdev->nr_pending);
>
> --
> 2.29.2
>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
