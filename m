Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 30792493550
	for <lists+drbd-dev@lfdr.de>; Wed, 19 Jan 2022 08:18:31 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 167D74206C7;
	Wed, 19 Jan 2022 08:18:30 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5676E420602
	for <drbd-dev@lists.linbit.com>; Wed, 19 Jan 2022 01:21:05 +0100 (CET)
Received: by mail-ed1-f41.google.com with SMTP id cx27so3071650edb.1
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jan 2022 16:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bmeqfE1RuOXde41Zr3CQ/9tcb+03J/6w+lG9hJ7A4Ho=;
	b=Ybqt4L8XARDalF5U3jxiomW7vn0XAjkMf9MRDY2CLKnxrl9ZFVPOy45252iZ/ahaBE
	Uul8Do3DwK3+IhjDQEsQqZ25qhbKav+CsP+D/VRz8S/JP1MCrWjpPNAT2T6HpwQO2Kaj
	U+mXSh1wrYynaFmrl3R954SKWovO2KgQQwMuFgk3bN6254exjP5wW45dCjMVUb5YwN8a
	VxuJ4073q87irF35SwVs1OSriqyn3iO2/rrlt98SROIN6upeJLmrkKzh1HvDiSu1wNK0
	Osy4+7YgQ8hN9QPHR4VjTrEWqZipRE0LQfv8aN/2JjfC3ryAYgT+7fuyuH/QIVRL+JSD
	L94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bmeqfE1RuOXde41Zr3CQ/9tcb+03J/6w+lG9hJ7A4Ho=;
	b=z24dTh2KFLJVg8K6HpYVzoHZ4BPrOTjXj1iiXL1tZ6vbF6z5Wz6hyW9KDDOYPFJ9Zy
	DpSzCWqG3Mzg7rTICMPRZK5f/C2LX7A8sGe0Kx0bVMZtveKxk3HB5FVMSFi2i/CKR5GK
	QSkjA050rUqqug9dWRvWUovsOl8B4NKtNF3Q3UM2qfCC/YIQRBkHA7XzSQCbSn75Mkeg
	cF9uVPX/9F3Fx6HXtNdOTu1BR/9RtAPaP0ZdzDlyDehSG18wOPPfdWVSJfvv62AfMeUx
	fU/YZ2gR15qA2oKpB7nZkXW/ep3t/0heq7l5Y1ln2BavSB4YcJSxpzyLf1Grp6K/a/Zo
	MGTg==
X-Gm-Message-State: AOAM530Gn5qLubKBF3jiyfpS18Li7XOdVkbGLtmxUeu1pKMmsLIE9v8g
	i5gD8yczX6oWNUNqr6ZgpNKhchSShZUxkbnc7ut8Dg==
X-Google-Smtp-Source: ABdhPJzX/FVgzC0EPKMvsUUn84DEffG26tohBKCZtOfTfxVCmLokcVuYpKW6O9EGM43LUqr04D+DAH09ngv7yEmd1xc=
X-Received: by 2002:a05:6402:14f:: with SMTP id
	s15mr27553335edu.118.1642551665549; 
	Tue, 18 Jan 2022 16:21:05 -0800 (PST)
MIME-Version: 1.0
References: <20220118071952.1243143-1-hch@lst.de>
	<20220118071952.1243143-11-hch@lst.de>
In-Reply-To: <20220118071952.1243143-11-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 19 Jan 2022 01:20:54 +0100
Message-ID: <CAMGffEmFZB1PPE09bfxQjKw-tJhdprEkF-OWrVF4Kjsf1OwQ_g@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 19 Jan 2022 08:18:28 +0100
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.co>,
	dm-devel@redhat.com, "Md . Haris Iqbal" <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 10/19] rnbd-srv: simplify bio mapping in
	process_rdma
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

Hi Christoph,

Thanks for the patch.

On Tue, Jan 18, 2022 at 8:20 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The memory mapped in process_rdma is contiguous, so there is no need
> to loop over bio_add_page.  Remove rnbd_bio_map_kern and just open code
> the bio allocation and mapping in the caller.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/rnbd/rnbd-srv-dev.c | 57 -------------------------------
>  drivers/block/rnbd/rnbd-srv-dev.h |  5 ---
>  drivers/block/rnbd/rnbd-srv.c     | 20 ++++++++---
>  3 files changed, 15 insertions(+), 67 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-srv-dev.c b/drivers/block/rnbd/rnbd-srv-dev.c
> index b241a099aeae2..98d3e591a0885 100644
> --- a/drivers/block/rnbd/rnbd-srv-dev.c
> +++ b/drivers/block/rnbd/rnbd-srv-dev.c
> @@ -44,60 +44,3 @@ void rnbd_dev_close(struct rnbd_dev *dev)
>         blkdev_put(dev->bdev, dev->blk_open_flags);
>         kfree(dev);
>  }
> -
> -void rnbd_dev_bi_end_io(struct bio *bio)
> -{
> -       struct rnbd_dev_blk_io *io = bio->bi_private;
> -
> -       rnbd_endio(io->priv, blk_status_to_errno(bio->bi_status));
> -       bio_put(bio);
> -}
> -
> -/**
> - *     rnbd_bio_map_kern       -       map kernel address into bio
> - *     @data: pointer to buffer to map
> - *     @bs: bio_set to use.
> - *     @len: length in bytes
> - *     @gfp_mask: allocation flags for bio allocation
> - *
> - *     Map the kernel address into a bio suitable for io to a block
> - *     device. Returns an error pointer in case of error.
> - */
> -struct bio *rnbd_bio_map_kern(void *data, struct bio_set *bs,
> -                             unsigned int len, gfp_t gfp_mask)
> -{
> -       unsigned long kaddr = (unsigned long)data;
> -       unsigned long end = (kaddr + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> -       unsigned long start = kaddr >> PAGE_SHIFT;
> -       const int nr_pages = end - start;
> -       int offset, i;
> -       struct bio *bio;
> -
> -       bio = bio_alloc_bioset(gfp_mask, nr_pages, bs);
> -       if (!bio)
> -               return ERR_PTR(-ENOMEM);
> -
> -       offset = offset_in_page(kaddr);
> -       for (i = 0; i < nr_pages; i++) {
> -               unsigned int bytes = PAGE_SIZE - offset;
> -
> -               if (len <= 0)
> -                       break;
> -
> -               if (bytes > len)
> -                       bytes = len;
> -
> -               if (bio_add_page(bio, virt_to_page(data), bytes,
> -                                   offset) < bytes) {
> -                       /* we don't support partial mappings */
> -                       bio_put(bio);
> -                       return ERR_PTR(-EINVAL);
> -               }
> -
> -               data += bytes;
> -               len -= bytes;
> -               offset = 0;
> -       }
> -
> -       return bio;
> -}
> diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
> index 0eb23850afb95..1a14ece0be726 100644
> --- a/drivers/block/rnbd/rnbd-srv-dev.h
> +++ b/drivers/block/rnbd/rnbd-srv-dev.h
> @@ -41,11 +41,6 @@ void rnbd_dev_close(struct rnbd_dev *dev);
>
>  void rnbd_endio(void *priv, int error);
>
> -void rnbd_dev_bi_end_io(struct bio *bio);
> -
> -struct bio *rnbd_bio_map_kern(void *data, struct bio_set *bs,
> -                             unsigned int len, gfp_t gfp_mask);
> -
>  static inline int rnbd_dev_get_max_segs(const struct rnbd_dev *dev)
>  {
>         return queue_max_segments(bdev_get_queue(dev->bdev));
> diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
> index 1ee808fc600cf..65c670e96075b 100644
> --- a/drivers/block/rnbd/rnbd-srv.c
> +++ b/drivers/block/rnbd/rnbd-srv.c
> @@ -114,6 +114,14 @@ rnbd_get_sess_dev(int dev_id, struct rnbd_srv_session *srv_sess)
>         return sess_dev;
>  }
>
> +static void rnbd_dev_bi_end_io(struct bio *bio)
> +{
> +       struct rnbd_dev_blk_io *io = bio->bi_private;
> +
> +       rnbd_endio(io->priv, blk_status_to_errno(bio->bi_status));
> +       bio_put(bio);
> +}
> +
>  static int process_rdma(struct rnbd_srv_session *srv_sess,
>                         struct rtrs_srv_op *id, void *data, u32 datalen,
>                         const void *usr, size_t usrlen)
> @@ -144,11 +152,11 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
>         priv->sess_dev = sess_dev;
>         priv->id = id;
>
> -       /* Generate bio with pages pointing to the rdma buffer */
> -       bio = rnbd_bio_map_kern(data, sess_dev->rnbd_dev->ibd_bio_set, datalen, GFP_KERNEL);
> -       if (IS_ERR(bio)) {
> -               err = PTR_ERR(bio);
> -               rnbd_srv_err(sess_dev, "Failed to generate bio, err: %d\n", err);
> +       bio = bio_alloc_bioset(GFP_KERNEL, 1, sess_dev->rnbd_dev->ibd_bio_set);
> +       if (bio_add_page(bio, virt_to_page(data), datalen,
> +                       offset_in_page(data))) {
this changes lead to IO error all the time, because bio_add_page return len.
We need  if (bio_add_page(bio, virt_to_page(data), datalen,
                     offset_in_page(data)) < datalen)

Thanks!
> +               rnbd_srv_err(sess_dev, "Failed to map data to bio\n");
> +               err = -EINVAL;
>                 goto sess_dev_put;
>         }
>
> @@ -170,6 +178,8 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
>
>         return 0;
>
> +bio_put:
> +       bio_put(bio);
>  sess_dev_put:
>         rnbd_put_sess_dev(sess_dev);
>  err:
> --
> 2.30.2
>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
