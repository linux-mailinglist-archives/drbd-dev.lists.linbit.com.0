Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 55308A5D8B9
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Mar 2025 09:58:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 40C5116B6A6;
	Wed, 12 Mar 2025 09:58:02 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
	[209.85.219.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BCAA3160644
	for <drbd-dev@lists.linbit.com>; Wed, 12 Mar 2025 09:57:59 +0100 (CET)
Received: by mail-yb1-f169.google.com with SMTP id
	3f1490d57ef6-e63a159525bso2440876276.2
	for <drbd-dev@lists.linbit.com>; Wed, 12 Mar 2025 01:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1741769878;
	x=1742374678; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=2XdYv/A0frrTtu6lKhljjo2oX4d7238HwkNHjYoJ4+E=;
	b=t+p1nsf0h2h7VMiRPgV5PkVbLqybYQPWURnYxSOZcwJtjLXxBzmpwXB4/VpAlzp329
	Jg3I1TB3FvD/BvrpwLZTF/V1CF4UWhahTOs0ZNFcoZvnsVj7U605km1GAfqb5CCiNO7V
	nT2s1hfqRcQUqE6W2cTLyy0PB1+e7+uMbbbZ12p002NjoykRBtXuo6mxWZ5uAF74Uezd
	WUwgEmJ6bkRvT7OPE/6c73TCvSu+dxr0U9FNDPiaTn+oOYbKv4sX2omc8+IIjTp6FhJa
	MOdc3EfFPhKFDaqPcpE0cAtNny5Cq4/Ei54RWRg19uEfzSLs2y8lNO20k7JoZ0IjwRAX
	LL+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1741769878; x=1742374678;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=2XdYv/A0frrTtu6lKhljjo2oX4d7238HwkNHjYoJ4+E=;
	b=enaws03j/kkSDgxOx8A9cN9sw8kx0Ct1/5mjDJYcWHICjVO4sEcrtKAnolI6ok0ZF0
	1vUDotKLjp+E9MYrWCmyYl9KXW9GOK+7NitLfNiicTe/UbEUjSgBBeuO3/wC3D51UlrM
	UAxsNa8PfEoBcQDymi87h3MBmcOm/i0Kison79VkiB5c6xLpscnpPpwPhrLAAesYW2xK
	bPZZ9GyRvYGE2AD3BL7fu7CdXebpDZiiq/TRHsC84TBwlmIGPGh9gYO4oi+hw27XplCo
	IZRzh+Im/Y02ACoE6rSbxf6MB/qY/6/Z/91R/o6DZACLURSuIBtu4xoBQStHy9klUO81
	7PXA==
X-Gm-Message-State: AOJu0YznmgMLzHHdt5wFTA3OkM+r2X/7c8lxT2lFw7JIO1n9Lk2b9VlV
	lZfuKTWTCy6/JsGazOLd0jKQKcWS42QO2kjjVIYbq807WD8nOGYBMQncECXuHfkeeblypJYK6Ei
	p9ZXC0PwseZBTpjllIEYZ9xiLZNDRm3SPCTLuE0y50GuYmfrYeplPH2YB
X-Gm-Gg: ASbGncu+bDgP5PX6FG2XLO0oCaHgNaTdBLnX9QsMGHT7jb/udo2cFtl0ncBjGgi8+BD
	GVn1dDD7f33u9ba1PxhuNvCNzCKiHO5lKYDHbaldt7ilhxnmcqU2Q7Fbxvdqyn4Za+B1Sw2oiqR
	P8v1v5+ATIs0JWr5yIdrLMCMnZSMs=
X-Google-Smtp-Source: AGHT+IFVMAvb1zD+01lPQ2My1/jeWPX/S0g8sKc9QLAHAQxU41kaRfm8Yx9+e1QH89c0JCNzdCzDpX3y2AyXtDifLLs=
X-Received: by 2002:a05:6902:2749:b0:e5b:3ad3:4010 with SMTP id
	3f1490d57ef6-e63b52115b4mr7965567276.31.1741769878679; Wed, 12 Mar 2025
	01:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250311110633.1122918-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20250311110633.1122918-1-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Wed, 12 Mar 2025 09:57:47 +0100
X-Gm-Features: AQ5f1JpJKcHxRFpb3RuwMSeQM2Q8CImx65MB6Uqp-qCOtaibyqFzjQrO2DNjx7c
Message-ID: <CADGDV=XjFc4W6JL89B14K5XTbJP1WRr5a4BCirrHOSNBj8G5KA@mail.gmail.com>
Subject: Re: [PATCH] rdma: Add network ping detection
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

Applied as https://github.com/LINBIT/drbd/commit/78c472291ad471f77bdf8fcc3a=
056a5806a530d3

Thanks!

PS: One of us will also review your "[PATCH] drbd: Fix IO block after
network failure" soon.


On Tue, Mar 11, 2025 at 12:11=E2=80=AFPM zhengbing.huang
<zhengbing.huang@easystack.cn> wrote:
>
> In rdma mode, the drbd establishes a connection between two nodes,
> and without I/O. If one node suddenly crash,
> the connection status of the remain node is still normal.
> That is, the remain node cannot detect the exception of the peer node.
>
> So in rdma transport mode, we also add a ping work, like tcp transport mo=
de.
>
> Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
> ---
>  drbd/drbd_transport_rdma.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
> index 427065789..9799be396 100644
> --- a/drbd/drbd_transport_rdma.c
> +++ b/drbd/drbd_transport_rdma.c
> @@ -3152,6 +3152,9 @@ static void dtr_set_rcvtimeo(struct drbd_transport =
*transport, enum drbd_stream
>                 container_of(transport, struct dtr_transport, transport);
>
>         rdma_transport->stream[stream].recv_timeout =3D timeout;
> +
> +       if (stream =3D=3D CONTROL_STREAM)
> +               mod_timer(&rdma_transport->control_timer, jiffies + timeo=
ut);
>  }
>
>  static long dtr_get_rcvtimeo(struct drbd_transport *transport, enum drbd=
_stream stream)
> --
> 2.43.0
>
