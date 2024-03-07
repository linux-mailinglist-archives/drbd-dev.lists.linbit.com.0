Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id DD74487489C
	for <lists+drbd-dev@lfdr.de>; Thu,  7 Mar 2024 08:23:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D1C8E420301;
	Thu,  7 Mar 2024 08:23:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6CFF9420319
	for <drbd-dev@lists.linbit.com>; Thu,  7 Mar 2024 03:54:43 +0100 (CET)
Received: by mail-lj1-f181.google.com with SMTP id
	38308e7fff4ca-2d228a132acso4833761fa.0
	for <drbd-dev@lists.linbit.com>; Wed, 06 Mar 2024 18:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1709780083; x=1710384883; darn=lists.linbit.com;
	h=to:references:message-id:content-transfer-encoding:cc:date
	:in-reply-to:from:subject:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=VzWs2u1fk0vDoigeNKo7oEEO87WIJ7cBKTPk4kvL4Vc=;
	b=OIbfh12yYMCqyEoEUa1R3KsCfZh9bgG7pxHxPoQnM7Oy0/hsDaXgvVgFI/AamoPpNy
	I37ev7VypYleerskbY6Wj4WufnzC1zG3ZeIMdkQ4yjc9c+un2Mq/7PKYxxi1NXigwj2a
	NTH6+jtWUDWsR9BshMq98upMuFECfbCqsYSKHmqOMSjnBqLLMUuRyXvnDOS5ASFPNCRu
	ULpimjJhtIuiFw8Zh0uodBo0uQOi9L0hm3pVohjPoKbQ65AmGGG+LgmmtgJZHipLqywG
	Ubvmt1vDavzxRaQdWp08na58CAz2XoEM/BZwXKSdh2RaAIpNCCYX2Hky/b1H6CEawa/g
	EfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709780083; x=1710384883;
	h=to:references:message-id:content-transfer-encoding:cc:date
	:in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=VzWs2u1fk0vDoigeNKo7oEEO87WIJ7cBKTPk4kvL4Vc=;
	b=FCEZkxi0+iHcHZSoJEkvUqViFuDEtFrXihDJTtgj9jownzJKnfivUpTcUnwkjDYk39
	FElzCF/tfocWuDCUW0bS8qlY1g8Mr7WB6IEwLvVEg+JiDiXWov9NnZlEMMZIzBf09PWN
	Vxul2UAu5qNWM5NveTYereuwJ6kGpz8RYihik9ViY71OJZ/Ey8rpPGfYUaApXhV9myrv
	wyYuCsEZu2qD6AP6oZs4DftqHmjIkOZjFX1CEvMxQH1aSE9Ub+2VkhC3rfEYzxLAAqne
	euFDOsKDKYzgEfN39gCnEvnRAWwqedTPxsnuCuLhBBiyTulphPBd9y5ySLq5HBE7q7j0
	LzRw==
X-Gm-Message-State: AOJu0Yw0oQYzeAU1ALcix2lQrOk99u1myle5dqLntx9c+eSyU1778jJs
	4rbOVd32qHFJaJsZbIlJviGaUW0JL+7WgEZFtmEMEDRo/1y1Om9ZL/J6Ml2LZffbzz5QjaSlYIs
	rV24=
X-Google-Smtp-Source: AGHT+IG+gYEE8aiiY7XDCukcwE5qtrTlhnJpUWVrWLjiM7OhrfxbjWALl1sV2iDDgBI8lVoC/h1BxQ==
X-Received: by 2002:a2e:6806:0:b0:2d3:2b86:e5f1 with SMTP id
	c6-20020a2e6806000000b002d32b86e5f1mr508608lja.18.1709780083155;
	Wed, 06 Mar 2024 18:54:43 -0800 (PST)
Received: from smtpclient.apple ([23.247.139.60])
	by smtp.gmail.com with ESMTPSA id
	s13-20020a17090a440d00b002961a383303sm439843pjg.14.2024.03.06.18.54.41
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2024 18:54:42 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH 2/2] crm-fence-peer.9.sh: use join of node_state to judge
	whether node is banned
From: Su Yue <glass.su@suse.com>
In-Reply-To: <20240303091259.5045-2-l@damenly.org>
Date: Thu, 7 Mar 2024 10:54:29 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <C2F581E6-5D15-49E7-B944-B79B3C08F252@suse.com>
References: <20240303091259.5045-1-l@damenly.org>
	<20240303091259.5045-2-l@damenly.org>
To: drbd-dev@lists.linbit.com
X-Mailer: Apple Mail (2.3774.200.91.1.1)
X-Mailman-Approved-At: Thu, 07 Mar 2024 08:23:27 +0100
Cc: lars.ellenberg@linbit.com
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

Hi, dear drbd folks
  Would you help review the patches for drbd-utils? Many thanks!

=E2=80=94=20
Su

> On Mar 3, 2024, at 17:12, Su Yue <glass.su@suse.com> wrote:
>=20
> From: Su Yue <glass.su@suse.com>
>=20
> crmd in node_state can't be "banned". join should be used instead
> of crmd.
>=20
> Signed-off-by: Su Yue <glass.su@suse.com>
> ---
> scripts/crm-fence-peer.9.sh | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/crm-fence-peer.9.sh b/scripts/crm-fence-peer.9.sh
> index a3353a7354a6..b326a1656c15 100755
> --- a/scripts/crm-fence-peer.9.sh
> +++ b/scripts/crm-fence-peer.9.sh
> @@ -934,7 +934,7 @@ guess_if_pacemaker_will_fence()
>=20
> # for further inspiration, see pacemaker:lib/pengine/unpack.c, =
determine_online_status_fencing()
> [[ -z $in_ccm ]] && will_fence=3Dtrue
> - [[ $crmd =3D "banned" ]] && will_fence=3Dtrue
> + [[ $join =3D "banned" ]] && will_fence=3Dtrue
> if [[ ${expected-down} =3D "down" && $in_ccm =3D "false"  && $crmd !=3D =
"online" ]]; then
> : "pacemaker considers this as clean down"
> elif [[ $in_ccm =3D false ]] || [[ $crmd !=3D "online" ]]; then
> --=20
> 2.44.0
>=20

