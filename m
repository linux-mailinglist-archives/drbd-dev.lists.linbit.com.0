Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D27B4EA872
	for <lists+drbd-dev@lfdr.de>; Tue, 29 Mar 2022 09:22:40 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 11174420620;
	Tue, 29 Mar 2022 09:22:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
	[209.85.217.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0FB6F4201B8
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 09:22:37 +0200 (CEST)
Received: by mail-vs1-f50.google.com with SMTP id t123so18183246vst.13
	for <drbd-dev@lists.linbit.com>; Tue, 29 Mar 2022 00:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=xb9mIDKjQYIPkq2cl/LQcYQOcQo4MJLugHIfTo+Qa6c=;
	b=ho9KA6bqwNHpP7Z9+/NNQ/6p6oZwFpSbs9Olm4Et6kAHH0xYY9I7xIG+xIicp/u1kU
	hm7Mm8PWdyZleac1UvxZsi2LMs2eiXEJHtxSjOfrPim3sGqnPdZGp8zdLwVVdUTQePxL
	sic5RrCkUInVh8kXeS73rwDjHBLg1K07g7eFQw3ILvzivfceShXFLyvCJflTU6DarL7i
	VXv/JYUK1KwsxhzHSy9jMbJZpTuOuAa14mmE9MWHYzOWCXYukd/tsD6ELiqtOkQ8Ym4K
	iQOs6MxnTjgLjd8iqGsfc+eB1a+3gNUuHlesYqQPvPSG9dMTYCY1/X0asyyn/9F7WLWt
	hsHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xb9mIDKjQYIPkq2cl/LQcYQOcQo4MJLugHIfTo+Qa6c=;
	b=s85d5+Q5hLIUlJzTmng2neIXS/drnQeDGblxQtACy2149QdnMvs1I/EQdaTOTDlEK4
	yzp/SUegrwd/P7f4TIsibfbjSIs3oMhDnUE0Ez9J0zPBsqVQVQ0lmeDv2L0qHKJnLzhK
	QzF5nzQuztkbWVXS/aF64YiY0zFZ0EgOlJdsNc+9V435HunjEO3bHx+2GeoXUlofTTQy
	uV3hJiGofZn37Yq/Z8kgSzB1TBGPc1UNP+r2UsBZd2yYB473mZasMUsknf1LTcjeFiFd
	rFQo1Y4/VrouYJ+bMz4/pFSrwzNVwjy1+3m2j2QJGe5tROOoe0G9+seOuB4MzGgnN5om
	kB3g==
X-Gm-Message-State: AOAM531BBNSM5TBsK1yrSCvc2xYgxWBqNS6btLvPeAfBXQeRZ2k9aumC
	X3MgzkdFJzxfyDuFauOpQA70EVQCknQbJf1Ek91Zafi3
X-Google-Smtp-Source: ABdhPJwCXePQpQWxAnSccfkCBDftojg20BXVcLiLhweIwoqEklq6I51tYdZhLR2kJY/W1ebOWnvkv9zngLEIFHfIsVI=
X-Received: by 2002:a67:c89c:0:b0:31a:7a59:71dd with SMTP id
	v28-20020a67c89c000000b0031a7a5971ddmr14213399vsk.25.1648538557183;
	Tue, 29 Mar 2022 00:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220329070618.GA20396@lst.de>
In-Reply-To: <20220329070618.GA20396@lst.de>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Tue, 29 Mar 2022 09:22:26 +0200
Message-ID: <CADGDV=UgjZAbmAN-2bO1nyDvA=XCC9Lf2dxWHZ0BwxF12nnztQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] state of drbd in mainline
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
Content-Type: multipart/mixed; boundary="===============2576236007611386401=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============2576236007611386401==
Content-Type: multipart/alternative; boundary="000000000000199c0305db564bc7"

--000000000000199c0305db564bc7
Content-Type: text/plain; charset="UTF-8"

Hi Christoph,

what do you expect for the DRBD changes? Usually, they fall into the
category: yes, obviously. When you are changing the block layer in this
way, then that is necessary for the in-tree DRBD code.

Regarding users: Yes, there are users of the in-tree DRBD code. Very big
corporations. And, yes, we see pressure building up that we get our act
together and re-sync the in-tree DRBD with the out-of tree DRBD.

best regards,
 Phil


On Tue, Mar 29, 2022 at 9:06 AM Christoph Hellwig <hch@lst.de> wrote:

> Hi all,
>
> while I've been reworking large parts of the block layer over the
> last months I've basically never gotten drbd reviews, and in general
> drbd seems to be completely maintained upstream.  Do we even have users
> for it?  Is it time to drop drbd from the kernel tree?
>
> Thanks,
>         Christoph
>

--000000000000199c0305db564bc7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Christoph,<div><br></div><div>what do you expect for th=
e DRBD changes? Usually, they fall into the category: yes, obviously. When =
you are changing the block layer in this way, then that is necessary for th=
e in-tree DRBD code.</div><div><br></div><div>Regarding users: Yes, there a=
re users of the in-tree DRBD code. Very big corporations. And, yes, we see =
pressure=C2=A0building up that we get our act together and re-sync the in-t=
ree DRBD with the out-of tree DRBD.</div><div><br></div><div>best regards,<=
br>=C2=A0Phil</div><div><br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 29, 2022 at 9:06 AM Christoph=
 Hellwig &lt;<a href=3D"mailto:hch@lst.de">hch@lst.de</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Hi all,<br>
<br>
while I&#39;ve been reworking large parts of the block layer over the<br>
last months I&#39;ve basically never gotten drbd reviews, and in general<br=
>
drbd seems to be completely maintained upstream.=C2=A0 Do we even have user=
s<br>
for it?=C2=A0 Is it time to drop drbd from the kernel tree?<br>
<br>
Thanks,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Christoph<br>
</blockquote></div>

--000000000000199c0305db564bc7--

--===============2576236007611386401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============2576236007611386401==--
