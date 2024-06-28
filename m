Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id B936691BE3D
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jun 2024 14:12:53 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DF7BC4203D5;
	Fri, 28 Jun 2024 14:12:52 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
	[209.85.219.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8CE89420167
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 14:12:48 +0200 (CEST)
Received: by mail-yb1-f169.google.com with SMTP id
	3f1490d57ef6-e03618fc78bso281388276.2
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 05:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1719576768;
	x=1720181568; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Bn45ZSHZKh//jfpWnvIJafyDYP0WTBuWIaYhXfsp6Go=;
	b=HDUPoMXBuaECqncct+l0XmWAEKpB1kbfOhRpIl3EW2KZDsuHHmr/tiF4u9cGjopaQb
	6J2R5vpuayDGyekaq0L2RR09ciPgIsrLgm0JjHI6qW44NXyf7Kr6WMQcz6DrKLyESlbz
	kQYlgvLH5gwD7XW0v3rqQxeOgMjc5LCtkJFRyagFMGMJSZoVJinlNwR6xBFctSFJW/u3
	ILy5jJzHuaDNqrmP48IOgyH3q5pAU+AAZZy9XCBJKzkN2f04VqrcVKV0NgQrEc97aFt5
	p9M07bkUzlAc/n2wJamQJhqSHS/lHC/4gd7Y7uPL0GdnsmReY0BWOMoVHRgckX+lqOrR
	xtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1719576768; x=1720181568;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=Bn45ZSHZKh//jfpWnvIJafyDYP0WTBuWIaYhXfsp6Go=;
	b=jDpfZsq4u9/2kcgoqwEDM3vQPPH8mbbhFYilh5fRfmMCkPG66/C84bjHelz9m0VUN5
	gp2E77i2lXU2ONYdzGGZSJPYANToeKaPLEICfldLIx6Nt1yMWoRq31tIY1TVEia76v2M
	r6ct5wG2WJXDIc9P66U6VizPmFwDUTWKGgyoPwOTenTUHycOnQMbeavQuOooS3flGbUV
	jgs76AA729r8sqmBmZ7/6G2R9PQU+zlUTSvwurQFCrDp4iE/eqM+SyadK6oGAV0lHh6a
	gRkeZNhjAUyIxIHfXiAyo1BhIdA6Sc2ohpZQTQoi4Yt1Y6Wjb6eupvhXmu2ilWBKRI9Y
	Tdbg==
X-Gm-Message-State: AOJu0YxOn7jMyh7oLyn8U7mL3hjS/IqLBMdLv7pMGfoShxlQ1Ahy3YjF
	4avZAKad15NJbtT5B7pgnW2KmY7wOUwMYk/mWVL41KtBw1Q8JGfFGCUCz3WSIdgdGGq8n/fFlo7
	Jlw6BBCTNmXYPcmkw+ioVCA/aO2O9AEIZQnEhSdrU
X-Google-Smtp-Source: AGHT+IGuBE3tzGO31anVQ1zng8irHi1MTkyIREry5htzo58uqs6jZ+Qv2NNWfmzcoyfcwEgainX+4u8pTuDkN807A/Y=
X-Received: by 2002:a25:8481:0:b0:e03:3f0f:a643 with SMTP id
	3f1490d57ef6-e033f0fa799mr7086884276.50.1719576767758; Fri, 28 Jun 2024
	05:12:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<20240624054619.23212-6-zhengbing.huang@easystack.cn>
In-Reply-To: <20240624054619.23212-6-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 28 Jun 2024 14:12:37 +0200
Message-ID: <CADGDV=WthASvFg32vL67hrpEET2haetQXoHB2DV3P_DV9VY2jA@mail.gmail.com>
Subject: Re: [PATCH 06/11] drbd_transport_rdma: put kref in error path
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

It looks plausible, but still, please provide a description.

On Mon, Jun 24, 2024 at 7:52=E2=80=AFAM zhengbing.huang
<zhengbing.huang@easystack.cn> wrote:
>
> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>
> Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
> ---
>  drbd/drbd_transport_rdma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
> index 9a6d15b78..c7adc87e3 100644
> --- a/drbd/drbd_transport_rdma.c
> +++ b/drbd/drbd_transport_rdma.c
> @@ -1157,6 +1157,7 @@ static void dtr_cma_connect_work_fn(struct work_str=
uct *work)
>         kref_get(&cm->kref); /* for the path->cm pointer */
>         err =3D dtr_path_prepare(path, cm, true);
>         if (err) {
> +               kref_put(&cm->kref, dtr_destroy_cm);
>                 tr_err(transport, "dtr_path_prepare() =3D %d\n", err);
>                 goto out;
>         }
> --
> 2.27.0
>
