Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C76872F8D
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Mar 2024 08:25:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8316042035F;
	Wed,  6 Mar 2024 08:25:17 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 705904201E0
	for <drbd-dev@lists.linbit.com>; Tue,  5 Mar 2024 11:00:44 +0100 (CET)
Received: by mail-ed1-f54.google.com with SMTP id
	4fb4d7f45d1cf-55a179f5fa1so8000964a12.0
	for <drbd-dev@lists.linbit.com>; Tue, 05 Mar 2024 02:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709632844;
	x=1710237644; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=tXbGSFtVCfDFkobtjhcXyNWgEukYChl86bKjO2HdFD8=;
	b=URAL0OnRP+m/YiwzJqepL/96H2xJae86i1jTfbEOnaGVNvQzJyCN31okJ/LtNkQpAn
	ZHWC5KtiaofVmuSh0w0bUnOfPsK++yp0/4XLvY9sAdyEMlOjI/hwjMTh9n+tGLmzP3yW
	dOVIn/hvLRMW480nhBvwOo85aG+GTxkYHLeBVW29/qKq8Fb8UA4SK4H0R/aLW2A9rFTl
	9RZeO21ak1tK35GSGG1kmtPz0cSOH76jekI3K+aRidM599mPyk9Dw2dO2TavknjPPVNm
	NTqJbujOlO6/uRvAOrS336nY3yux8Dl7L6iN6ZwDKIPr35RHsnBClcCWjUjjTU0iwWlu
	6xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709632844; x=1710237644;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=tXbGSFtVCfDFkobtjhcXyNWgEukYChl86bKjO2HdFD8=;
	b=WZjS13Ff4azlNTSpQ3h/iH9IRsxynyJWAcIjppFWtfkDPWcpzD6h0r0MedYcvlTeGc
	cslrmPQQCLHpvT/YcQ8cmGzp1Iab6dszew2zHLSVOhP1Ki6QrSY/M7yqHRXh/RpcYMOA
	5hl1WiiS61u91Zs19R9eBkPT/fTT7xN5QHDxfyjVelFvzUhezMgvOXzMPypiaZF5fD28
	tshX+GMbZYjuY1ZTkPaBg5McMYiz6+tSYXy+CvsJ1D1YbXMCXpdW1Bf0tpHYFfwLBHiS
	jjjOICgnjVjtNeiKYW1GYGciGSyE1UCzwm8C0/ia95/o1HFFtbl4E8+2mfOg2R0qjYuf
	7CCA==
X-Gm-Message-State: AOJu0YyAOfhTXCHPfLfJ6SeKlv/dfxQKGtWN6bGTfkJ7MSCwjeZTGAEZ
	3XHPWT0SdNjJa9smqkJD+miLhXkKPZj9B1Th7m1XuqosAP6Xlx1UhrDnnn9uSSWj07WNRDjyhRG
	Pr9bWn0R4bfv/AigLtVG8pyftZrZrFIFnd1tMc9vwF3KTV7ud
X-Google-Smtp-Source: AGHT+IHRy4Ra2MFeveNOBH7MxHkrdGd2EcwJeeDrJbN8533GQqrv4sjY8NCwWn3BHxWTHX2C8lzFNRjhx/yw2FxA1h4=
X-Received: by 2002:a17:906:f8d6:b0:a45:2e21:c776 with SMTP id
	lh22-20020a170906f8d600b00a452e21c776mr4286375ejb.3.1709632843838;
	Tue, 05 Mar 2024 02:00:43 -0800 (PST)
MIME-Version: 1.0
References: <20240302154129.683863-1-yoann.congal@smile.fr>
	<ZebnOCAsOgmAKuX9@rck.sh>
In-Reply-To: <ZebnOCAsOgmAKuX9@rck.sh>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Tue, 5 Mar 2024 11:00:18 +0100
Message-ID: <CAMSfU+5+8xm6LadpOr906f7ZRx07xjK3K_g_1EAbYyJEaiFHvw@mail.gmail.com>
Subject: Re: [PATCH] configure.ac: Add an option to disable host udev version
	checks
To: Roland Kammerer <roland.kammerer@linbit.com>
Content-Type: multipart/alternative; boundary="0000000000005a86bc0612e6eaab"
X-Mailman-Approved-At: Wed, 06 Mar 2024 08:25:13 +0100
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

--0000000000005a86bc0612e6eaab
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 5 mars 2024 =C3=A0 10:34, Roland Kammerer <roland.kammerer@linbit.c=
om> a
=C3=A9crit :

> thanks, applied
>
>
> https://github.com/LINBIT/drbd-utils/commit/f2b5a7335ae52109dfb95a9d99ae2=
0519c43d59a


Awesome, thank you!
--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000005a86bc0612e6eaab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mar. 5 mars 2024 =C3=A0=C2=A010:3=
4, Roland Kammerer &lt;<a href=3D"mailto:roland.kammerer@linbit.com">roland=
.kammerer@linbit.com</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_q=
uote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">thanks, applied<br>
<br>
<a href=3D"https://github.com/LINBIT/drbd-utils/commit/f2b5a7335ae52109dfb9=
5a9d99ae20519c43d59a" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/LINBIT/drbd-utils/commit/f2b5a7335ae52109dfb95a9d99ae20519c43d59a</a></b=
lockquote><div><br></div><div>Awesome, thank you! <br></div></div><span cla=
ss=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail=
_signature"><div dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</=
font><div><font face=3D"Raleway, regular">Smile ECS - Tech expert<br></font=
></div></div></div></div>

--0000000000005a86bc0612e6eaab--
