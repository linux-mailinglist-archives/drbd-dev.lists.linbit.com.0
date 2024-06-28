Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 5447691BE5E
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jun 2024 14:20:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2C1C84203D5;
	Fri, 28 Jun 2024 14:20:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
	[209.85.219.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A48D4420167
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 14:20:00 +0200 (CEST)
Received: by mail-yb1-f181.google.com with SMTP id
	3f1490d57ef6-e02c4983bfaso500209276.2
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 05:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1719577200;
	x=1720182000; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=uh3fAKh7CHHRHZwYcAoQskBpEHX8hi4tgIBRlaT8GBc=;
	b=Z070QIOXOLIhzDengKmEjJGAnp8PC6pQvafHITlx5mt/7W7/j5bQeyAodXkF6chkcp
	sGqAash9sWReA7O3MXCAbILue0Q9PLVi+jqY2gjg90CZx9jppDtPtMPTVXrZF9J7r8D4
	DiJ5ryxwVNRTcQy5MvN6pKwXdaPPyoPUlW6hLRWYrk2b0W3eoqHwwbit+1g6TEsO42SY
	n4Ko1wA/QbWLVx5RZ5hGeJTdQzArHZpvllXDe4bGJke1sXHOUxDS71HIdnS/Y5+vEMAA
	j7AJfAukK8GxwzrVG590ltt46Nh59B68V/CHwQpwPrL0U3lTLqzztA2RAct1c9K84SPw
	YntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1719577200; x=1720182000;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=uh3fAKh7CHHRHZwYcAoQskBpEHX8hi4tgIBRlaT8GBc=;
	b=PuDC8w0kEW7KlXqrddsl9bb2RPagFBcioLhzNSg+OwSie0J7gwZ+8/TyHjvMiG2h4B
	m09l1kt6GxIf87vDhu2UYPSy9tSTQlx95vmKAdMLHYoe4cqwmt2kfyBhl50hYjQB+nDa
	oyzTrY2RhGWrAmpAVW3QdO204Z9f1J+h8DemJ5HR2VzTYHtEoEJ/qxoESQYwpIZx3kWw
	YIgzS6KWgHcvnNJdPRZ3KC8qDA+odqKsFZwAIJWBhMd1QHzw8CN7yXoSUUhOjMoNXnL/
	qtPubCv6NDNzlhO2bJGMcqRm8mPAFDWbY3dTNquk6Bb70urUb8mYeEoP2aYfZJfKmuoM
	SMLA==
X-Gm-Message-State: AOJu0YzP+TF7lc1pkAXYO/39j16R/jzgklXDeH3vGHhECj59qhux0M98
	eQ38ipUc6QferGfDbdfinPNSa4qqggIc0msYOtCeAbK6ux0eCieuyRy+p1A4HuZVNlzB+lZdm4e
	4H+WQv7EWxrG/tyFx3KafD4p6mfnWq/5W0nfI3ZXGjGdBTLfvVIY=
X-Google-Smtp-Source: AGHT+IFgYHWKPGro0cTn1iIbKA2UGVKk9/v47cgfY1ob/Apa1W7NQBjnU6+Yc6zwGrexH1cyGCzuqhlx1vNk2seCqlc=
X-Received: by 2002:a25:add2:0:b0:dfe:5a00:df5c with SMTP id
	3f1490d57ef6-e0300f3ffffmr17777251276.18.1719577199803; Fri, 28 Jun 2024
	05:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
	<20240624054619.23212-7-zhengbing.huang@easystack.cn>
In-Reply-To: <20240624054619.23212-7-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 28 Jun 2024 14:19:48 +0200
Message-ID: <CADGDV=U1EG9Zd22ujB=fUGCoExMhCLF6fYGj171MVKxabxz=iA@mail.gmail.com>
Subject: Re: [PATCH 07/11] drbd_transport_rdma: put kref in dtr_remap_tx_desc
	error
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

This looks wrong. In this loop, we are trying to find a path on which
to repost this tx_desc. When the remapping fails, there is no reason
to drop the drop a ref on the cm.

So, please provide a description what you are intending here with this chan=
ge?

best regards,
 Philipp

On Mon, Jun 24, 2024 at 9:27=E2=80=AFAM zhengbing.huang
<zhengbing.huang@easystack.cn> wrote:
>
> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>
> Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
> ---
>  drbd/drbd_transport_rdma.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
> index c7adc87e3..77ff0055e 100644
> --- a/drbd/drbd_transport_rdma.c
> +++ b/drbd/drbd_transport_rdma.c
> @@ -2355,8 +2355,11 @@ static int dtr_repost_tx_desc(struct dtr_cm *old_c=
m, struct dtr_tx_desc *tx_desc
>                         return -ECONNRESET;
>
>                 err =3D dtr_remap_tx_desc(old_cm, cm, tx_desc);
> -               if (err)
> +               if (err) {
> +                       pr_err("dtr_remap_tx_desc failed cm : %px\n", cm)=
;
> +                       kref_put(&cm->kref, dtr_destroy_cm);
>                         continue;
> +               }
>
>                 err =3D __dtr_post_tx_desc(cm, tx_desc);
>                 if (!err) {
> --
> 2.27.0
>
