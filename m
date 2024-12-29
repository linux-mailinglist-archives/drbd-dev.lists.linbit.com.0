Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A2AA1668D
	for <lists+drbd-dev@lfdr.de>; Mon, 20 Jan 2025 07:11:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9A31116B823;
	Mon, 20 Jan 2025 07:11:18 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 579B7160968
	for <drbd-dev@lists.linbit.com>; Sun, 29 Dec 2024 06:58:46 +0100 (CET)
Received: by mail-ej1-f65.google.com with SMTP id
	a640c23a62f3a-aa6a92f863cso1334881266b.1
	for <drbd-dev@lists.linbit.com>; Sat, 28 Dec 2024 21:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1735451926; x=1736056726;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=gOaO3GIHJbTPnVowygmPizFspt+znwbY2af+UA4iMaA=;
	b=G/FrZUy1c/Ef31A2OUD3gpvCoqI6mh25Y8aMqZSTkbK+GuuZ54Np+h/HGazcbXpASA
	TplsM/eMpsPg6F8j9eHBabyzbyycYhIVEUld4mk2qtFwijP2t+dv3hbzX+45OmBWOCio
	qglghtjkMVGf5kLWG/haSjGr/e2JwwdzZTOS9N+CN+vl2Ti7YL0Cm2ra6BtUx3XrL2Pt
	cD/w+DACvzTyaSPezahmiZK/qeyyvXJVpJrDcjPilkcTP2OQFS70rfxc3f809RCuxlEe
	u7fcdVmRloskrYa+ZRxyKyn9blOLqkxM5m9Ji8PkL2RLROZZhospdsfDNwlRmKis63+f
	R8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1735451926; x=1736056726;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=gOaO3GIHJbTPnVowygmPizFspt+znwbY2af+UA4iMaA=;
	b=laEJX1t23jAWrmSDNSisN20GAs7liCfNZ8MXfxS104Cub9lXBLlbyGr6FWPa4kfYMB
	fSn8grnw3pQnUnsN99ydc6s+ULzQVN9rbQXDVqnvzYM4wlPL+VDagU8acmJUxxmUP+3A
	W9ZU7/drpHKOxxfH3J6M21F+4n+/lJoHXc6sZr8q81LfGSdwCuyFo4WgLjZIFSph37O5
	1+PUNpCS2+I3zLj0fqwE/pPvr0vg/B0Z9skC9B0Clw/WvGCWnfPHD8sXoX/Pkc0PThzt
	w1cnvpstPLqf5SXDG5CysvF9ddz+dz6yDgmTcTnIqbg4cRYM3bbzgvOd4EQbSX9w872I
	yWOg==
X-Forwarded-Encrypted: i=1;
	AJvYcCV9OadHWpyTv9QtU6uW/HHyEeZrCnwHsICVXYrCcgagQKPzvqsToy4Uf3DwkoaRY6RVH9k+ahTbsA==@lists.linbit.com
X-Gm-Message-State: AOJu0YzNsGToorJUQfjx7P4TEmkC56YxKts7Xw18xoxajrjsZkbxLoxL
	wi3OGWpjtZMZ/+CCVGXkRVMlC8MtrQ3JSB1NpXfyhfAj4K0EfCigaHR79nVtpNGJB2pGI4sjdZ7
	FNLR1VpWjuUZOy+kIxeAy8fe4Wsk=
X-Gm-Gg: ASbGncsMZSJUB+JJBs1LBljcrzTJmZC2GPbggMRwh8yMV4AboFA8J0kvc0zbij6S99f
	NrvAeZqQIi2kiRhGAcva5GW8WoLLy3aG/2Fc=
X-Google-Smtp-Source: AGHT+IEghvvIfQoPMz+PP7ZizlnBePaNWLdNkAgdkNoTrqc2EavOIh9PBwbfodDJWb7eX7EGgiuA/PAZW4tAhIbrPO8=
X-Received: by 2002:a17:907:86aa:b0:aa6:5eae:7ece with SMTP id
	a640c23a62f3a-aac33549659mr3223500366b.43.1735451926000;
	Sat, 28 Dec 2024 21:58:46 -0800 (PST)
MIME-Version: 1.0
References: <20241229042758.163842-1-shixinhe6@gmail.com>
	<qfagx4fjlluq4fox7fw5ltx63wxpifnr7lp3nkt63jm4wbtzp2@mna6znzgfqv2>
In-Reply-To: <qfagx4fjlluq4fox7fw5ltx63wxpifnr7lp3nkt63jm4wbtzp2@mna6znzgfqv2>
From: newBox shi <shixinhe6@gmail.com>
Date: Sun, 29 Dec 2024 13:58:34 +0800
Message-ID: <CABEB809afGY_ha6aXwDm28U7j_b8mHLycxp=PNfUdi017KtAaw@mail.gmail.com>
Subject: Re: [PATCH] Documentation zram: fix description about huge page
	writeback example
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 20 Jan 2025 07:11:04 +0100
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, philipp.reisner@linbit.com,
	linux-kernel@vger.kernel.org, minchan@kernel.org,
	lars.ellenberg@linbit.com, drbd-dev@lists.linbit.com
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

I just changed 'incompressible' to 'huge'. I thought huge page is
incompressible but incompressible page does not just include huge
page. Given the example is `echo huge`, it may be better to use `huge
page writeback'.


Sergey Senozhatsky <senozhatsky@chromium.org> =E4=BA=8E2024=E5=B9=B412=E6=
=9C=8829=E6=97=A5=E5=91=A8=E6=97=A5 12:36=E5=86=99=E9=81=93=EF=BC=9A
>
> On (24/12/29 04:27), Shi Xinhe wrote:
> >
> > Corrected the description to accurately reflect that huge page writebac=
k example.
>
> But what is the correction?  In zram huge page is incompressible page.
