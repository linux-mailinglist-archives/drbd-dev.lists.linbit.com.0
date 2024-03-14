Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E7787B6C6
	for <lists+drbd-dev@lfdr.de>; Thu, 14 Mar 2024 04:18:44 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E84F44203C6;
	Thu, 14 Mar 2024 04:18:42 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B306F420323
	for <drbd-dev@lists.linbit.com>; Thu, 14 Mar 2024 04:18:38 +0100 (CET)
Received: by mail-lj1-f171.google.com with SMTP id
	38308e7fff4ca-2d09cf00214so5425431fa.0
	for <drbd-dev@lists.linbit.com>; Wed, 13 Mar 2024 20:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1710386317; x=1710991117; darn=lists.linbit.com;
	h=to:references:message-id:content-transfer-encoding:cc:date
	:in-reply-to:from:subject:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=YirTlYDISQ02/79C8O9Ed5DbfqG55WMUEcoDDxJcPps=;
	b=G5C6jJ13gshCadP1b+821gN8Ba2uGHfriljI/twT8Ll3yF4ENrpyQb/9KQN0qTdbq3
	9cI81itu5wkBq1sUTwL5V+j/NXCf40lIU5cZdjO7Qwm+RdeseNQ0Nw4eQwWm3+qHIeuv
	sUF4itutxWza1X8y2kRdxwOF4NrkQ8HoBmHZV5M4J/DvzsOaLsKfZpYBReP9UPL8BiIE
	lz9BnbNO+1JbmLAzOLjOzY7rAsCM7U/mvwhAw9eB7EKIGHITmX25sdiX3xMH6f2CFLjV
	9eTOqkXaYp32oZVzJcQHtMcbXmcUhsbLlCRESRuxvj8P8z2iW1Ou5CHIkkr1qSs47oy4
	PyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1710386317; x=1710991117;
	h=to:references:message-id:content-transfer-encoding:cc:date
	:in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=YirTlYDISQ02/79C8O9Ed5DbfqG55WMUEcoDDxJcPps=;
	b=fRz45xPlWn2D3QPyGBC8FRHv9lIOrG+v31BtJryHqP5s0lrtOldrqcCc0ZrdkjjKhq
	kQu6AAJV8Mj8CMu5TaPWGl6VmfcqSeh4TPZ8oLC4ITxkDHpBpm662Z+3Xk352EkxxMxD
	CcXd4PkYOLDzFeaeaPUcHOq3OwgEDbi6vupAxCG0ovhgv/BXFwm5oUFTuYZco+wS5Dce
	ieML7ZFT+7Bx+F4FwzcJiuVMQSRmQmBMg0sF9G7t/PmFVUFQXUgqnuN1Hd8VLwyXhlZu
	2oSPSx5yhANXj24OZkCR3VXlM3iaYZ1iaEFqYWqN9zNagl4MChvQWu/c8ntza99h6951
	vetg==
X-Gm-Message-State: AOJu0YzY4xFOIiqoPEbNdB6xOYjHvhUG6VDVPJDJqn2TleAfZOm4lFY5
	pTMTaFjxhR9Alg9n6CTz4du+6gQEH3htEAmjIEMLmioJDFsOiF3SGIodavtAGFm+nmhjBwFMB+C
	7TM8=
X-Google-Smtp-Source: AGHT+IFX+Km0lV7ctatuOgeG+Lj5E7jIy0eFkmRGue/PZGqMPWSQLH8ApnMaTAM/b3KrgvzXa4maZw==
X-Received: by 2002:a05:651c:1024:b0:2d2:2b2e:1680 with SMTP id
	w4-20020a05651c102400b002d22b2e1680mr259553ljm.35.1710386317059;
	Wed, 13 Mar 2024 20:18:37 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.60])
	by smtp.gmail.com with ESMTPSA id
	db3-20020a17090ad64300b0029c5f7e8497sm374707pjb.46.2024.03.13.20.18.35
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Mar 2024 20:18:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: Re: [PATCH 2/2] crm-fence-peer.9.sh: use join of node_state to judge
	whether node is banned
From: Su Yue <glass.su@suse.com>
In-Reply-To: <C2F581E6-5D15-49E7-B944-B79B3C08F252@suse.com>
Date: Thu, 14 Mar 2024 11:18:22 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <48A9DD72-39A4-4866-B858-E50A33299CEB@suse.com>
References: <20240303091259.5045-1-l@damenly.org>
	<20240303091259.5045-2-l@damenly.org>
	<C2F581E6-5D15-49E7-B944-B79B3C08F252@suse.com>
To: drbd-dev@lists.linbit.com
X-Mailer: Apple Mail (2.3774.200.91.1.1)
Cc: lars.ellenberg@linbit.com, philipp.reisner@linbit.com
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



> On Mar 7, 2024, at 10:54, Su Yue <glass.su@suse.com> wrote:
>=20
> Hi, dear drbd folks
>  Would you help review the patches for drbd-utils? Many thanks!
>=20
Gentle ping.

=E2=80=94=20
Su
> =E2=80=94=20
> Su
>=20
>> On Mar 3, 2024, at 17:12, Su Yue <glass.su@suse.com> wrote:
>>=20
>> From: Su Yue <glass.su@suse.com>
>>=20
>> crmd in node_state can't be "banned". join should be used instead
>> of crmd.
>>=20
>> Signed-off-by: Su Yue <glass.su@suse.com>
>> ---
>> scripts/crm-fence-peer.9.sh | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/scripts/crm-fence-peer.9.sh =
b/scripts/crm-fence-peer.9.sh
>> index a3353a7354a6..b326a1656c15 100755
>> --- a/scripts/crm-fence-peer.9.sh
>> +++ b/scripts/crm-fence-peer.9.sh
>> @@ -934,7 +934,7 @@ guess_if_pacemaker_will_fence()
>>=20
>> # for further inspiration, see pacemaker:lib/pengine/unpack.c, =
determine_online_status_fencing()
>> [[ -z $in_ccm ]] && will_fence=3Dtrue
>> - [[ $crmd =3D "banned" ]] && will_fence=3Dtrue
>> + [[ $join =3D "banned" ]] && will_fence=3Dtrue
>> if [[ ${expected-down} =3D "down" && $in_ccm =3D "false"  && $crmd !=3D=
 "online" ]]; then
>> : "pacemaker considers this as clean down"
>> elif [[ $in_ccm =3D false ]] || [[ $crmd !=3D "online" ]]; then
>> --=20
>> 2.44.0
>>=20
>=20

