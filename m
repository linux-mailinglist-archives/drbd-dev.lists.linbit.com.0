Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE46AA6E70
	for <lists+drbd-dev@lfdr.de>; Fri,  2 May 2025 11:48:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D392E160953;
	Fri,  2 May 2025 11:48:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
	[209.85.219.182])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2EC23160953
	for <drbd-dev@lists.linbit.com>; Fri,  2 May 2025 11:48:24 +0200 (CEST)
Received: by mail-yb1-f182.google.com with SMTP id
	3f1490d57ef6-e740a09eae0so1626052276.1
	for <drbd-dev@lists.linbit.com>; Fri, 02 May 2025 02:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1746179304;
	x=1746784104; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=PxCQaRFgfxzIby8jAdtTEZdagV/oOPK7TXV1NocUnAE=;
	b=jiVVBFyOGjk/tyPCo8L/5RyyjmvkX74bb9yJBnQ8Xwilml/j0fGSy9xJQMZldUPZjK
	wNhzpGhCs7+W1sxhb3S5SK+1sXW3AJijv2o9aYlvmejYF68X3+4Nh2JyIynAdR9XHe17
	QcovUy2xI/9V9MC/DPaNxMUP5hSdLAJ1qga4eZL15eHkd/8jIWxNCulDY3UffGyGg9d4
	PhHLSyscDxfRdAV/r+/OYGhsW1Z4AFDxHJSrka1mLGBAd0n8BmTbFMK1Gb7qKV+ZqcWC
	MAB6G2NKLF4FjHUgfQbmdjm3qQN66c+5nkTerEka+/RiETBrCc70mEPxbo5yM4meUr5Q
	YXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1746179304; x=1746784104;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=PxCQaRFgfxzIby8jAdtTEZdagV/oOPK7TXV1NocUnAE=;
	b=P90ZSg0ZufIPCEzGc7CK+4al3iRhRT+HwUx2Z0s5BHZMx/HhtU7vVp6caD7ETMT+kV
	ixbQGt2is4mw7B2k5B5POgkycgZu/xG1lZXRBvxSwwWb5BQMprWO/mRJWEn6XlYCEAfC
	qGykCpuI1qCQW+JtFMhKetkXI+YNQkjDBXIF3grx34xjnZm3jwQLBY5AVFHz9AGtMs4q
	4PBjg5RN21M0kOxR2RTqGPPI4ABWOH0k8HZ4TjyCITP/jRxFs4LI5YUJkwsbhXFeZhNO
	ysbkkVHO6hPu7f4zO2ldH0r63BBCBdLEw9s3H7580W1PgR4/he9JR0QcbcnDGe0wCkc9
	x0zQ==
X-Gm-Message-State: AOJu0Yy8LH+IZ1rndElXl7NXVcIOB4j3NGtXBhbg14sF6H/YSZRWy4oO
	iX2gx0hRXAancP1nOz6ZdVz5fDNmgoKYt9ok3coCwZGEXL/nd76LbdI4GRbme4ozLpaoVetsBri
	e2kTHCD2LqkfedM0kebNDuogR/8mH9JU3P9RTmkE+ZQ+egt1s/0A9ig==
X-Gm-Gg: ASbGnctPqPeUR+j9QjUXKMnQqoDOkzCRSVtyYxOEKIv4o1oKEo0Hb2Z1/XFlZ+Dvl+l
	8bnHjZZNzmWLjvTXyb3wqkheY/xo+S4Y8P47e9Hh3OiOVzl8JiUOsF/wMIfsorI4i/3WMM5hCSy
	7no0vxKlmf8ho0rNiApyFdsl8=
X-Google-Smtp-Source: AGHT+IF/Q3zOX/1EfeCuN1IcUCsTx2enaH73seLaZexaJQME/YslS/p1fVm7hBSatrIqAjZLzypmkc4gLgQUs1UlKbU=
X-Received: by 2002:a05:6902:1614:b0:e73:2869:2b5f with SMTP id
	3f1490d57ef6-e7565548e95mr3042021276.8.1746179303630; Fri, 02 May 2025
	02:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250417060819.2157347-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20250417060819.2157347-1-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 2 May 2025 11:48:13 +0200
X-Gm-Features: ATxdqUH4OrXe8LtlVVp39vlcnkgrilBkYKA-BMRgx8zI6NRoFzqr1FuK7Tz7Q2I
Message-ID: <CADGDV=UZGxQv=UnKp54ryKN9rnb1_1UF83iFb5UpjMKShZF97w@mail.gmail.com>
Subject: Re: [PATCH] rdma: Fix cm leaks in some abnormal scenarios
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hi Zhengbing,

Thanks applied.
PS: I had to remove the change to the unpublished change to the
drbd-headers from your patch.

Best regards,
 Philipp

On Thu, Apr 17, 2025 at 8:23=E2=80=AFAM zhengbing.huang
<zhengbing.huang@easystack.cn> wrote:
>
> In dtr_create_rx_desc() function, if ib_dma_map_single() return an
> error, it goes to error code branch, which does not subtract 1
> from the reference count of cm.
>
> In dtr_post_tx_desc() function, in the retry code branch, has similar iss=
ues.
>
> Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
> ---
>  drbd/drbd-headers          |  2 +-
>  drbd/drbd_transport_rdma.c | 14 ++++++++++----
>  2 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drbd/drbd-headers b/drbd/drbd-headers
> index 94f447251..9188ee14f 160000
> --- a/drbd/drbd-headers
> +++ b/drbd/drbd-headers
> @@ -1 +1 @@
> -Subproject commit 94f4472513f351efba5788f783feba6ac6efe9fc
> +Subproject commit 9188ee14f6de582a493d260c091db0c655b30d50
> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
> index 9ce15a0ce..be919a926 100644
> --- a/drbd/drbd_transport_rdma.c
> +++ b/drbd/drbd_transport_rdma.c
> @@ -2080,8 +2080,10 @@ static int dtr_create_rx_desc(struct dtr_flow *flo=
w, gfp_t gfp_mask)
>         rx_desc->sge.addr =3D ib_dma_map_single(cm->id->device, page_addr=
ess(page), alloc_size,
>                                               DMA_FROM_DEVICE);
>         err =3D ib_dma_mapping_error(cm->id->device, rx_desc->sge.addr);
> -       if (err)
> -               goto out;
> +       if (err) {
> +               tr_err(transport, "ib_dma_map_single() failed %d\n", err)=
;
> +               goto out_put;
> +       }
>         rx_desc->sge.length =3D alloc_size;
>
>         atomic_inc(&flow->rx_descs_allocated);
> @@ -2094,6 +2096,9 @@ static int dtr_create_rx_desc(struct dtr_flow *flow=
, gfp_t gfp_mask)
>                 dtr_free_rx_desc(rx_desc);
>         }
>         return err;
> +
> +out_put:
> +       kref_put(&cm->kref, dtr_destroy_cm);
>  out:
>         kfree(rx_desc);
>         drbd_free_pages(transport, page, 0);
> @@ -2396,9 +2401,10 @@ retry:
>                 return -EINTR;
>
>         flow =3D &cm->path->flow[stream];
> -       if (atomic_dec_if_positive(&flow->peer_rx_descs) < 0)
> +       if (atomic_dec_if_positive(&flow->peer_rx_descs) < 0) {
> +               kref_put(&cm->kref, dtr_destroy_cm);
>                 goto retry;
> -
> +       }
>         device =3D cm->id->device;
>         switch (tx_desc->type) {
>         case SEND_PAGE:
> --
> 2.43.0
>
