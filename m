Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA854E4F5F
	for <lists+drbd-dev@lfdr.de>; Wed, 23 Mar 2022 10:29:38 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0096E420FB7;
	Wed, 23 Mar 2022 10:29:37 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
	[209.85.128.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D09CB42034F
	for <drbd-dev@lists.linbit.com>; Wed, 23 Mar 2022 10:29:35 +0100 (CET)
Received: by mail-yw1-f178.google.com with SMTP id
	00721157ae682-2e5e176e1b6so9781057b3.13
	for <drbd-dev@lists.linbit.com>; Wed, 23 Mar 2022 02:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RTdntLwWP7UcoqdxIbtO2gBEwkCYFZ/lgUjrNqmrzxY=;
	b=T61hvAd7cJiSJIGmZk3tv26qPToF8HN5U/lQ/m08EAvWa2SmtE6To2nDTNf374lnhT
	GPKcxTCuuPtJXa5gmEw+gX2f1CnhO+VLeiTWr2XmuaL6dVuTtvBLqYJtSXHPPzFlHs5d
	Ri/6Ne7YUODQm8T3VMLlOYE4KOjFASZnLeZ8IqhaE9iuhu7q9KNKFvXczv/h7Sgwfpuk
	P+Ovst/9RkkokTnzdrENQ2gJQlJX7TsW9sSFizNo9ppyZqVHj+5ghhwpu4GTzkQKNuQt
	kjsxCrJT+nOf4qUF+msiy+R5Tj/zMWQPy3RSPf7HIGYLtyZhwIakdPpQAIpFcLhlFiZB
	DguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RTdntLwWP7UcoqdxIbtO2gBEwkCYFZ/lgUjrNqmrzxY=;
	b=iFTXJQjBzQG1EfpmJrwH0/AtSmKOL21jqJkqHCXl9Lueq4lI9Ck43rXsaFRwQhYbBE
	iiyOljjXBG4O/s8qEKpizCOe6EQ4qZ8pgWbWEHBSDDk4rkPGIjFIJkfuIV/TpKtFrGuo
	YMUH+tEYg5jjoN2teVLwZFaRPKet7dDlP+iN3SXG552nvEhaFgN/oXLP2UobdQ+tF4Xb
	gRdXGy23J8UUeGQLmo9XVZ8JDTnYDiW7BiAxq2ITbzlzyJnnlVx7kiamKPhsUTHugptJ
	Hb2SAJIWu0oDkX/EfCgOl9h8pcBiySWSwZs+d/aViZ/6hLkkPO0Zz+ovXEY7KZ242jJ+
	MxKw==
X-Gm-Message-State: AOAM531nEIEGfXcjPPIPwuk8UOeFEk23MRV064LksChcCHrSl1zTJ9Tx
	0mhnQ70lsQ2u81nRQSAsVudyDhhPm91Zmr2nWOM=
X-Google-Smtp-Source: ABdhPJxsStnlEm2/XrSzPGOBMOTw5PlnKDFjWTj/c9kKouVbhUo8itraPrOCZBSFmdgor+QYZSqQ1SYIOcVDz/aGNlE=
X-Received: by 2002:a0d:c284:0:b0:2dc:37ec:f02c with SMTP id
	e126-20020a0dc284000000b002dc37ecf02cmr33701891ywd.503.1648027774854;
	Wed, 23 Mar 2022 02:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220124091107.642561-1-hch@lst.de>
	<20220124091107.642561-2-hch@lst.de>
	<20220322211915.GA2413063@roeck-us.net>
	<CAKFNMonRd5QQMzLoH3T=M=C=2Q_j9d86EYzZeY4DU2HQAE3E8w@mail.gmail.com>
	<20220323064248.GA24874@lst.de>
In-Reply-To: <20220323064248.GA24874@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Wed, 23 Mar 2022 18:29:23 +0900
Message-ID: <CAKFNMonANUN7_99oVBOq=iCJpt6jQs3qhu1ez5SwMm2g7sZUyw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>, Guenter Roeck <linux@roeck-us.net>
Cc: Jens Axboe <axboe@kernel.dk>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-nfs@vger.kernel.org, linux-nilfs <linux-nilfs@vger.kernel.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, linux-block@vger.kernel.org,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.co>,
	device-mapper development <dm-devel@redhat.com>,
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	ntfs3@lists.linux.dev, Jack Wang <jinpu.wang@ionos.com>,
	Andrew Morton <akpm@linux-foundation.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [dm-devel] [PATCH 01/19] fs: remove mpage_alloc
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

On Wed, Mar 23, 2022 at 3:42 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Mar 23, 2022 at 06:38:22AM +0900, Ryusuke Konishi wrote:
> > This looks because the mask of GFP_KERNEL is removed along with
> > the removal of mpage_alloc().
> >
>
> > The default value of the gfp flag is set to GFP_HIGHUSER_MOVABLE by
> > inode_init_always().
> > So, __GFP_HIGHMEM hits the gfp warning at bio_alloc() that
> > do_mpage_readpage() calls.
>
> Yeah.  Let's try this to match the iomap code:
>
> diff --git a/fs/mpage.c b/fs/mpage.c
> index 9ed1e58e8d70b..d465883edf719 100644
> --- a/fs/mpage.c
> +++ b/fs/mpage.c
> @@ -148,13 +148,11 @@ static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
>         int op = REQ_OP_READ;
>         unsigned nblocks;
>         unsigned relative_block;
> -       gfp_t gfp;
> +       gfp_t gfp = mapping_gfp_constraint(page->mapping, GFP_KERNEL);
>
>         if (args->is_readahead) {
>                 op |= REQ_RAHEAD;
> -               gfp = readahead_gfp_mask(page->mapping);
> -       } else {
> -               gfp = mapping_gfp_constraint(page->mapping, GFP_KERNEL);
> +               gfp |= __GFP_NORETRY | __GFP_NOWARN;
>         }
>
>         if (page_has_buffers(page))

I did not test for iomap, but this patch has fixed the same regression on the
latest mainline at least for ext2, exfat, vfat and nilfs2.  Thanks!

Ryusuke Konishi
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
