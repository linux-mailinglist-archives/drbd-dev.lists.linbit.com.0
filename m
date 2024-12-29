Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0829AA1668C
	for <lists+drbd-dev@lfdr.de>; Mon, 20 Jan 2025 07:11:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3338816B81E;
	Mon, 20 Jan 2025 07:11:16 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B23E8160963
	for <drbd-dev@lists.linbit.com>; Sun, 29 Dec 2024 06:19:06 +0100 (CET)
Received: by mail-ed1-f65.google.com with SMTP id
	4fb4d7f45d1cf-5d7e527becaso13305829a12.3
	for <drbd-dev@lists.linbit.com>; Sat, 28 Dec 2024 21:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1735449546; x=1736054346;
	darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=Bb3r32gWv+iYh9f76bgEVwbjRRPyWmF0hEvnAK9qCKI=;
	b=a+gmm7URSn6HNs1LaMqHGHnUiRRCEBZ3pxghvMKjDOtnPPguMI3ZywxqRufoaYxDGd
	ztfJtOoLyoIeySU/E3iSIhP2MTKhyT6vTHUShaRU6MkxE2p4iQkPcN7lNxil94P2KIBG
	0Xz1GaQcXWxfA1U+HX64PijQgPtD8Q79RWKVr44TSa2DDL/VFuXg/NlmOnliRSmzEsq8
	tIbIKhMhy7dbTzWEDxAD7PGiUaS0Ew+tOLFty/SeVf7oqOlNxWJz4EhgopDSdQkaPrT7
	do3R2JkPVWjpaivoS99QlKMojcGmjoifmLsGKwQjc+47g6VVnRyeI4lPffwDz4Yzo0BX
	/K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1735449546; x=1736054346;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=Bb3r32gWv+iYh9f76bgEVwbjRRPyWmF0hEvnAK9qCKI=;
	b=ASosUJx3jfVmn/wkT/SUIjGRR3Zdf4Pbv08ctjH6Rv8rhX0qZnGbeCBJbQs/ZSI40y
	r43kItUh6SrpagarnXcpuJDbTIOa1EcqN5vgiOBPPblK9FGaTiA5a97q8hI0JLZ9aAaX
	0ag0OvCk3AN70B8nkBi5wBcnkLG2QdTUcxU5+HAc1AmMPT2b2WFfVHvrB4s+YrBNqAT7
	dT42erxKyp6GWU5ontRDy9glzJuyLAEKJX6t3ZeX7sh/F4bCzpixAcVByQyqcBwZTgIv
	aAwx6rxOxu5XMdhOrjlPpz3wuYiQOzKwwP4jrcoTlWnDn4oGsMd0TRZRCLc4Og78sFnR
	rCTw==
X-Forwarded-Encrypted: i=1;
	AJvYcCUWVl3NyNq3eBQxwCiU7psUNJsTCjaLg8Y8l81C2xJ/tgU/GyDHL63JTEHVsmpbyHtA+VxlOer1fA==@lists.linbit.com
X-Gm-Message-State: AOJu0YyCjseqzmiALec9kpNAKbR6gCX7yGrUw3Nb1sy11oxfw9wJWMFj
	eR94vKsiCfdER5G8SwyuYsFtVDrdBS5HH3NvgTbnrv/ukNNhVVr07NqTHGaEZMnbFBIJWxjDOVC
	woxZvYlpVJkbHXhkCJQkkITjTEzs=
X-Gm-Gg: ASbGncu8JWfSvp1ChLmx9DTkR8rwiUrlCV+k9Ghd+hOMJWb9FS/h3GzERZcOQBnj+Yq
	oqPzb0pCiMx4hJ6E6ASuuKMoyvjmhKIbHqK1LCDD84vqgBuxbnw==
X-Google-Smtp-Source: AGHT+IGEeEvU22KObDPBS7BjAWMOdJZId93/CqYG9WzjdA3uHaHJn2VODp88zt4MLsonWgNW/vbg6urzurNB6kxYpwo=
X-Received: by 2002:a05:6402:358c:b0:5d0:8f1c:d9d7 with SMTP id
	4fb4d7f45d1cf-5d81dd83b30mr82007809a12.4.1735449545521; Sat, 28 Dec 2024
	21:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20241229042758.163842-1-shixinhe6@gmail.com>
	<qfagx4fjlluq4fox7fw5ltx63wxpifnr7lp3nkt63jm4wbtzp2@mna6znzgfqv2>
In-Reply-To: <qfagx4fjlluq4fox7fw5ltx63wxpifnr7lp3nkt63jm4wbtzp2@mna6znzgfqv2>
From: newBox shi <shixinhe6@gmail.com>
Date: Sun, 29 Dec 2024 13:18:54 +0800
Message-ID: <CABEB8098qotPWb-QkJ3_R9b6RwpKin_h8TrZ9v96S6KgMtxzDA@mail.gmail.com>
Subject: Re: [PATCH] Documentation zram: fix description about huge page
	writeback example
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: multipart/alternative; boundary="000000000000afbfad062a61d596"
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

--000000000000afbfad062a61d596
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just changed 'incompressible' to 'huge'. I thought huge page is
incompressible but incompressible page does not just include huge page.
Given the example is `echo huge`, it may be better to use `huge page
writeback'.

Sergey Senozhatsky <senozhatsky@chromium.org> =E4=BA=8E2024=E5=B9=B412=E6=
=9C=8829=E6=97=A5=E5=91=A8=E6=97=A5 12:36=E5=86=99=E9=81=93=EF=BC=9A

> On (24/12/29 04:27), Shi Xinhe wrote:
> >
> > Corrected the description to accurately reflect that huge page writebac=
k
> example.
>
> But what is the correction?  In zram huge page is incompressible page.
>

--000000000000afbfad062a61d596
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just changed &#39;incompressible&#39; to &#39;huge&#39;.=
 I thought huge page is incompressible but incompressible page does not jus=
t include huge page. Given the example is `echo huge`, it may be better to =
use `huge page writeback&#39;.</div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">Sergey Senozhatsky &lt;=
<a href=3D"mailto:senozhatsky@chromium.org">senozhatsky@chromium.org</a>&gt=
; =E4=BA=8E2024=E5=B9=B412=E6=9C=8829=E6=97=A5=E5=91=A8=E6=97=A5 12:36=E5=
=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On (24/12/29 04:27), Shi Xinhe wrote:<br>
&gt; <br>
&gt; Corrected the description to accurately reflect that huge page writeba=
ck example.<br>
<br>
But what is the correction?=C2=A0 In zram huge page is incompressible page.=
<br>
</blockquote></div>

--000000000000afbfad062a61d596--
