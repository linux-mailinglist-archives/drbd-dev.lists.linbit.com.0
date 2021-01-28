Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE05307393
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 11:21:53 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC886420815;
	Thu, 28 Jan 2021 11:21:51 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F6154207F7
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 11:21:49 +0100 (CET)
Received: by mail-ot1-f54.google.com with SMTP id f6so4658595ots.9
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 02:21:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HDfQ7EgSz4He6IVrUzqy89nGy356H19n/4Ap6Knawyw=;
	b=rXQxI8rwZ7ZQOd1c+gVYRYqpp27VpO1TGoND5H4AovObs3t2xtBp1cgkyka3aPP3oP
	E9ty4x6JgLKQA8UA9L4ptVPtjpKUJy3fBQZyyE1fK/CdJdixeVnMcZrKxk3i90Vuln9U
	08jSYryplwKIzDHM8qcMswe1HydqtGS9hF+wvWefARhXSa0vngswJ4eAhE18kPhtQCbJ
	ZuvdVbT95ftyVwZ14842f4lMcqYgJkOO/nfuIsBlg/BPG7C+uj4/BoNzMswkC1eJ0tjZ
	E/jTNRoZKJ8SvDy0EBlmc+x2j3bJrifhUxY7QY9hvEjzpmdWZp+09ZOinFijNIXsaGaL
	6UEQ==
X-Gm-Message-State: AOAM530kAjNX1mqX6XNUfHpsXupt2EJId7PQTySQLlPXvUyD3CHVYVXt
	WeX9iajqZGRmHcHX5sfNhBvcpUPeZOlBQkj/WV4=
X-Google-Smtp-Source: ABdhPJwJviHVEMHN6dwg9pHl9sFzPeOTWi/Tyw7MUMRzUkqGbWVHXybuLc31QSYFbmu849bxozre+7WWIBRJddZRpNc=
X-Received: by 2002:a05:6830:2313:: with SMTP id
	u19mr11117098ote.321.1611829309173; 
	Thu, 28 Jan 2021 02:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
	<20210128071133.60335-30-chaitanya.kulkarni@wdc.com>
In-Reply-To: <20210128071133.60335-30-chaitanya.kulkarni@wdc.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Jan 2021 11:21:36 +0100
Message-ID: <CAJZ5v0h01e4LgV0c5FxLorcc6iFW2LVzC=hJcd7LNAJ6D0E8jg@mail.gmail.com>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, Takashi Iwai <tiwai@suse.de>,
	djwong@kernel.org, linux-nvme <linux-nvme@lists.infradead.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Alex Shi <alex.shi@linux.alibaba.com>,
	Christoph Hellwig <hch@lst.de>, Alasdair Kergon <agk@redhat.com>,
	drbd-dev@lists.linbit.com, naohiro.aota@wdc.com,
	linux-nilfs@vger.kernel.org, Sagi Grimberg <sagi@grimberg.me>,
	"open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
	Mark Fasheh <mark@fasheh.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, osandov@fb.com,
	Eric Biggers <ebiggers@kernel.org>,
	xen-devel@lists.xenproject.org, ngupta@vflare.org,
	Len Brown <len.brown@intel.com>, Linux PM <linux-pm@vger.kernel.org>,
	Hannes Reinecke <hare@suse.de>, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, Tejun Heo <tj@kernel.org>,
	linux-fscrypt@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
	jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
	Joel Becker <jlbec@evilplan.org>, konishi.ryusuke@gmail.com,
	Bart Van Assche <bvanassche@acm.org>,
	Jens Axboe <axboe@kernel.dk>, damien.lemoal@wdc.com,
	Ted Ts'o <tytso@mit.edu>, Andrew Morton <akpm@linux-foundation.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, jth@kernel.org,
	asml.silence@gmail.com, ocfs2-devel@oss.oracle.com, roger.pau@citrix.com
Subject: Re: [Drbd-dev] [RFC PATCH 29/34] power/swap: use bio_new in
	hib_submit_io
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

On Thu, Jan 28, 2021 at 8:21 AM Chaitanya Kulkarni
<chaitanya.kulkarni@wdc.com> wrote:
>

Please explain in the changelog why making this change is a good idea.

> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> ---
>  kernel/power/swap.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/kernel/power/swap.c b/kernel/power/swap.c
> index c73f2e295167..e92e36c053a6 100644
> --- a/kernel/power/swap.c
> +++ b/kernel/power/swap.c
> @@ -271,13 +271,12 @@ static int hib_submit_io(int op, int op_flags, pgoff_t page_off, void *addr,
>                 struct hib_bio_batch *hb)
>  {
>         struct page *page = virt_to_page(addr);
> +       sector_t sect = page_off * (PAGE_SIZE >> 9);
>         struct bio *bio;
>         int error = 0;
>
> -       bio = bio_alloc(GFP_NOIO | __GFP_HIGH, 1);
> -       bio->bi_iter.bi_sector = page_off * (PAGE_SIZE >> 9);
> -       bio_set_dev(bio, hib_resume_bdev);
> -       bio_set_op_attrs(bio, op, op_flags);
> +       bio = bio_new(hib_resume_bdev, sect, op, op_flags, 1,
> +                     GFP_NOIO | __GFP_HIGH);
>
>         if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
>                 pr_err("Adding page to bio failed at %llu\n",
> --
> 2.22.1
>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
