Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id AF96E91BB91
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jun 2024 11:36:12 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3FEBB4202BA;
	Fri, 28 Jun 2024 11:36:11 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
	[209.85.219.177])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 059084202BA
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 11:36:06 +0200 (CEST)
Received: by mail-yb1-f177.google.com with SMTP id
	3f1490d57ef6-dfde5ae0aaeso355744276.1
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 02:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1719567366;
	x=1720172166; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=YB4RRIB6rUSN6RxKHPTLZJaUqIwFb+QO5dKeKaLIO3Q=;
	b=o/7vIfjOKMN+dOUuEzMfbIdfjEV8nqXuV2xcT4JEJOzshhnqa7eDeTXTLYqtbiVHVF
	rttWlOoxDpWtPeNdZ2udtp2UALpHDb//W+lUSWcMzcUbe6aF4L3vs3eGB7qXKfYF8QAT
	FtRxDskBp5jWPkCTbSZftizhxg0eujHZyaziv5kSq9IPn2dcRHgHlVSA4wUpXR2B+mFJ
	G8enwFesRMaZga76K7fJgXPkyICDU0rNMh8UTsTdUjhWIzM1ehLpe7dOU8XwP+oWeOKn
	4YmKRggEtjZTtICCIdsCFlXlNdf7YIIG0Qyfebr7huz1UGCNVFzlD7wLlinuC4DZZmR4
	1LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1719567366; x=1720172166;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=YB4RRIB6rUSN6RxKHPTLZJaUqIwFb+QO5dKeKaLIO3Q=;
	b=KqRnMTy0XM342HthIwXcUpXYcibtvZpk4hUA09NTvHTEfQK76QWTGW1IgBSjxh+AQy
	I4LCRLROnvDeAIRKRCrjLF7w8DbDdcKgDlVPhEMeZsi/LUhwF5yZz0pVM7MKyzU7Ba85
	HRsLCnUjBzqVzO/Nf6168pKJbkaTqXDVrUntjns7Ga3DSSTpYTnID0v7xBGkmRJ30QeZ
	FD2sZTQHBzKGB9HDfxRxq1b1yXbD4q2kjm0ExjbXM7lhRa5LPi7ipZXtClpkqFTsTW7i
	sToD+soZkx0FNGgagqnmECC8Mn9uDCTig8zd9ThPxnG9zfnrZocxPWMWtATdB1V+rGCN
	HHyQ==
X-Gm-Message-State: AOJu0Ywi5DlTxTFFg4bK0zlJN9aJ0KId3L5dVlQe77ZNMFE31p2TApwp
	VFt572JWiWX/WMCsXZM7q2bNn7N+Ovi7BtsIyMx1JIkTWBFaxnfsq3ztXffyB31buk00EssO+Lk
	k1JCEucllLcHDmYelEiR3W96KjV3zelxb4IMntMP9IhXxCmwiv9o=
X-Google-Smtp-Source: AGHT+IF75pDQOJprkoANdDZKZFlV4/9fScJx8a5lsCevvutPB7HSKowewvgMXYSDmfHAZgMZFTUs/81Q+Ssa8G70CYk=
X-Received: by 2002:a25:ad94:0:b0:e03:55f1:319d with SMTP id
	3f1490d57ef6-e0355f13391mr1810428276.39.1719567365847; Fri, 28 Jun 2024
	02:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<20240624054619.23212-2-zhengbing.huang@easystack.cn>
In-Reply-To: <20240624054619.23212-2-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 28 Jun 2024 11:35:54 +0200
Message-ID: <CADGDV=W=Nx=_vmxzQZZaSMFW0eVWjHeRYBZ1Ly5DtmU1Pj6jFA@mail.gmail.com>
Subject: Re: [PATCH 02/11] drbd_receiver: get_ldev before use device->ldev for
	drbd_reconsider_queue_parameters()
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Dongsheng Yang <dongsheng.yang@easystack.cn>, drbd-dev@lists.linbit.com
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

Thanks.

On Mon, Jun 24, 2024 at 8:32=E2=80=AFAM zhengbing.huang
<zhengbing.huang@easystack.cn> wrote:
>
> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>
> check ldev is not NULL before use it in drbd_reconsider_queue_parameters(=
)
>
> Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
> ---
>  drbd/drbd_receiver.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
> index 49e7815ed..fd07b29d7 100644
> --- a/drbd/drbd_receiver.c
> +++ b/drbd/drbd_receiver.c
> @@ -9845,7 +9845,12 @@ static void conn_disconnect(struct drbd_connection=
 *connection)
>                 rcu_read_unlock();
>
>                 peer_device_disconnected(peer_device);
> -               drbd_reconsider_queue_parameters(device, device->ldev);
> +               if (get_ldev(device)) {
> +                       drbd_reconsider_queue_parameters(device, device->=
ldev);
> +                       put_ldev(device);
> +               } else {
> +                       drbd_reconsider_queue_parameters(device, NULL);
> +               }
>
>                 kref_put(&device->kref, drbd_destroy_device);
>                 rcu_read_lock();
> --
> 2.27.0
>
