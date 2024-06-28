Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id A48E091BDDC
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jun 2024 13:51:59 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D588B4202BA;
	Fri, 28 Jun 2024 13:51:57 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
	[209.85.219.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D66254202BA
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 13:51:50 +0200 (CEST)
Received: by mail-yb1-f179.google.com with SMTP id
	3f1490d57ef6-dfab4779d95so429381276.0
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 04:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1719575510;
	x=1720180310; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=zKZiZlC/mut0DabxxjhznoYTQCsB0xoj9q2Alx+iV6w=;
	b=JkCP+VAbbwYYCiQWeHgfpnMdM6DDNwVY/IIDHwKED/soLNNb/jLjXBlKHSmGmSxolh
	okGW0cn3FGQ1bSeD66TXPkvMLdfrQut0o0AWIfwVeu2bPQjuK4coupmEQZdnj8aNcF2J
	M/5jIrhv1xQ4mL8wRWzLhRoENJ2hmYeGNFZM5UuSs3JOencQ9dq1yN3Dp4Jei1g9yrOC
	4EtDazxrcxrXSRHwL344CjXz2AUBz81ZL6OStW+28EwTzT1aTcGkOEjTyo3WsNs2LvVr
	msoaE/VvoaQyyamSET9voonAPKeTi+aa0BRoL3EruzGqh5bXMsLHgAFSFi1JlkyIyLDW
	81FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1719575510; x=1720180310;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=zKZiZlC/mut0DabxxjhznoYTQCsB0xoj9q2Alx+iV6w=;
	b=CrhexLutqwvwHjCwaNTnB5kFKp+KG1JrxRA12qJXJaGVedpgQ/V7kcefrovnPk+xPG
	lZDN0pI1Toh1coFamXJ18izoI8hgBqAbhxM70GNPEXr5EAAgfwReMhMX3CzcqT7Ym+nA
	9VBvcC37Vy0GHiqgyTYdBlj4zJViBIRjIRHYkZum7/nyZOLuvOWokxg/YuMczGYhX1vj
	4Jp8JAG9sxxLtPsbS6afwLOtNruF6bQj6pdqcxA+rWCgX9PPhV5mA6iOpJH/DUrx5WNH
	qc4kgA2CGVRP5sz/6lu4aBa4w5mkQlRAFgSnC3CQCCFy1NhAjXzf9HxNjK44JMgfY6Pm
	bE4w==
X-Gm-Message-State: AOJu0YzDJie8PIUiCGmCIXEjdjf7vGWrolT+bvhfL2L8jQY/DWZbZYXz
	XcXg0sLQe/dYjRSB6GqRMF9fd92RoOaRHanTm04AdHMxYPFrWWuDSK3jaU3YjgYLJi4ThF0V+vA
	Nz2lyz1KyvQPd8TOhATm0HQL5aunk8liAwyiDvK2qB/157I/R2+Qi6w==
X-Google-Smtp-Source: AGHT+IGOWRGc+NEbfgJ0UtidVd2ChuE7Y9WPZNcJs+/44GHOmmfdZOz4fVkQ4r6sUJ7z0xv+2k7bsswQdPtfGr6oHSc=
X-Received: by 2002:a25:ae4a:0:b0:df7:6030:bb4e with SMTP id
	3f1490d57ef6-e034559de7emr5434572276.61.1719575509963; Fri, 28 Jun 2024
	04:51:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<20240624054619.23212-4-zhengbing.huang@easystack.cn>
In-Reply-To: <20240624054619.23212-4-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 28 Jun 2024 13:51:38 +0200
Message-ID: <CADGDV=XEoNE6r_Q+R3agyytF-AhqduKdwM87FRsRC9axF8P5PQ@mail.gmail.com>
Subject: Re: [PATCH 04/11] drbd_transport_rdma: dont schedule
	retry_connect_work in active is false
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

Hello Dongsheng,

Please explain what problem you are fixing with this change. Do you
have a log that shows a problem in this area? Please describe why your
proposed change improves DRBD's behavior.

best regards,
 Philipp

On Mon, Jun 24, 2024 at 9:28=E2=80=AFAM zhengbing.huang
<zhengbing.huang@easystack.cn> wrote:
>
> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>
> Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
> ---
>  drbd/drbd_transport_rdma.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
> index eccd0c6ce..b7ccb15d4 100644
> --- a/drbd/drbd_transport_rdma.c
> +++ b/drbd/drbd_transport_rdma.c
> @@ -1089,9 +1089,13 @@ static void dtr_cma_retry_connect_work_fn(struct w=
ork_struct *work)
>         if (err) {
>                 struct dtr_path *path =3D container_of(cs, struct dtr_pat=
h, cs);
>                 struct drbd_transport *transport =3D path->path.transport=
;
> +               struct dtr_transport *rdma_transport =3D
> +                       container_of(transport, struct dtr_transport, tra=
nsport);
>
>                 tr_err(transport, "dtr_start_try_connect failed  %d\n", e=
rr);
> -               schedule_delayed_work(&cs->retry_connect_work, HZ);
> +               if (rdma_transport->active) {
> +                       schedule_delayed_work(&cs->retry_connect_work, HZ=
);
> +               }
>         }
>  }
>
> @@ -1116,6 +1120,8 @@ static void dtr_remove_cm_from_path(struct dtr_path=
 *path, struct dtr_cm *failed
>  static void dtr_cma_retry_connect(struct dtr_path *path, struct dtr_cm *=
failed_cm)
>  {
>         struct drbd_transport *transport =3D path->path.transport;
> +       struct dtr_transport *rdma_transport =3D
> +               container_of(transport, struct dtr_transport, transport);
>         struct dtr_connect_state *cs =3D &path->cs;
>         long connect_int =3D 10 * HZ;
>         struct net_conf *nc;
> @@ -1128,7 +1134,9 @@ static void dtr_cma_retry_connect(struct dtr_path *=
path, struct dtr_cm *failed_c
>                 connect_int =3D nc->connect_int * HZ;
>         rcu_read_unlock();
>
> -       schedule_delayed_work(&cs->retry_connect_work, connect_int);
> +       if (rdma_transport->active) {
> +               schedule_delayed_work(&cs->retry_connect_work, connect_in=
t);
> +       }
>  }
>
>  static void dtr_cma_connect_work_fn(struct work_struct *work)
> --
> 2.27.0
>
