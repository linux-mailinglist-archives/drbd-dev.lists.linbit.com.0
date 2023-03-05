Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558C6B220F
	for <lists+drbd-dev@lfdr.de>; Thu,  9 Mar 2023 12:00:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 63B03420620;
	Thu,  9 Mar 2023 12:00:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
	[209.85.160.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3D9F74203D5
	for <drbd-dev@lists.linbit.com>; Sun,  5 Mar 2023 10:06:57 +0100 (CET)
Received: by mail-oa1-f52.google.com with SMTP id
	586e51a60fabf-1755e639b65so8219110fac.3
	for <drbd-dev@lists.linbit.com>; Sun, 05 Mar 2023 01:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20210112; t=1678007217;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=z/okQs3hEwnfh9P2cECDw5TQT9kK9LWIJ9favFYhWCc=;
	b=LuhgulaEBS0MZSqvNRAwHLtFtl53yDimlObfALlERCyVFYK/UT3M7fL112k1Pqkqqr
	u2nVfhBH/sCvMOhVEzH3M/UkZB6NE86tc5l+ck0oGMBhGm4lrcMsqieXtVrkpf3GZsHl
	d5O8uKoJZT+iEets7yTII10p4gTzWkTwEnDT6yYxnKfGBbFq02/4QsiyZJ/lqbJxUw+l
	NyFG0dvHTTlTbKN8drNYapl7BLQkTc8Nx5UCUjAu6vkbsI0PEhvpnM9IeGTB777oMsXS
	WEkLqZHnsBaH0IRMlNB07upuppxeZCjdpkU4WAHofX8bLLruRha0LP6P+bJf/2ZRYROE
	2CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112; t=1678007217;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=z/okQs3hEwnfh9P2cECDw5TQT9kK9LWIJ9favFYhWCc=;
	b=4Yfhg5yPqFv0J4s+SVxQFUsnsxHXWu91MhNKVpuSH+N3B4gRMXMBblc3XRTw/QQOmX
	TkvOoQiI+/RPAS2T6ZMPKq7Sb9P3cA+e9qb0oYY0k0tUjjWPiRwtCfcaypmvfIUGQE9K
	d2OAhBvvcwOSmHvZipNpbmanACmzl4xGUXEJBewGnK3b2oh4WdAhJ3kp/CIjdKMwArED
	6qg4g1gO2NAZDOS2SUA7EozYZ3QbU+oiSrHyh+R2ZJSDSPqRACluug1z6WiCjQ9nrNzH
	t0J3gZfgotnA5soxihuXEKTdxtnPko5sDSDBmatH3dbZsZyLNM3dOT9Vzf0u15E4N8+W
	uEbQ==
X-Gm-Message-State: AO0yUKXUDpPVNchieX91PmgAR7QWhB2R0wYVuAXJP1dZZtcM/cbhBjZx
	CflXxuJCKB9j809wpim/iawMEx4U7ihutnah8gE=
X-Google-Smtp-Source: AK7set9bDBVFvOw990wTA+eUXZln6VhRb2LSujHtTq5X8Pdt+5t5IFGPFg2hCCUSIBn7Us5bM85y2CZwM8DrYN5N/K4=
X-Received: by 2002:a05:6870:d2a5:b0:172:6f4:dcdf with SMTP id
	d37-20020a056870d2a500b0017206f4dcdfmr2421793oae.3.1678007217114;
	Sun, 05 Mar 2023 01:06:57 -0800 (PST)
MIME-Version: 1.0
References: <20220616143227.4004-1-wangxiang@cdjrlc.com>
	<b628a808-bb07-c94f-9d70-6bd4eb4be690@linbit.com>
In-Reply-To: <b628a808-bb07-c94f-9d70-6bd4eb4be690@linbit.com>
From: "James W." <wjn740@gmail.com>
Date: Sun, 5 Mar 2023 17:06:44 +0800
Message-ID: <CA+FcS-yK6sdRVyUL_RBzrkWKvL8ixD=K2TcxRhP7rFhQBvJzBA@mail.gmail.com>
To: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
X-Mailman-Approved-At: Thu, 09 Mar 2023 12:00:47 +0100
Cc: axboe@kernel.dk, Xiang wangx <wangxiang@cdjrlc.com>,
	linux-kernel@vger.kernel.org, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: Fix typo in comment
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
Content-Type: multipart/mixed; boundary="===============4790667808114559111=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============4790667808114559111==
Content-Type: multipart/alternative; boundary="0000000000001b547105f6238036"

--0000000000001b547105f6238036
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: wjn740@gmail.com

Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com> =E4=BA=8E2022=
=E5=B9=B46=E6=9C=8822=E6=97=A5=E5=91=A8=E4=B8=89
22:29=E5=86=99=E9=81=93=EF=BC=9A

> Am 16.06.22 um 16:32 schrieb Xiang wangx:
> > Delete the redundant word 'and'.
> >
> > Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>
> > ---
> >  drivers/block/drbd/drbd_bitmap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/block/drbd/drbd_bitmap.c
> b/drivers/block/drbd/drbd_bitmap.c
> > index 9e060e49b3f8..8afdde400e37 100644
> > --- a/drivers/block/drbd/drbd_bitmap.c
> > +++ b/drivers/block/drbd/drbd_bitmap.c
> > @@ -86,7 +86,7 @@ struct drbd_bitmap {
> >
> >       /* exclusively to be used by __al_write_transaction(),
> >        * drbd_bm_mark_for_writeout() and
> > -      * and drbd_bm_write_hinted() -> bm_rw() called from there.
> > +      * drbd_bm_write_hinted() -> bm_rw() called from there.
> >        */
> >       unsigned int n_bitmap_hints;
> >       unsigned int al_bitmap_hints[AL_UPDATES_PER_TRANSACTION];
>
> Thanks!
>
> Acked-by: Christoph B=C3=B6hmwalder <christoph.boehmwalder@linbit.com>
>
> --
> Christoph B=C3=B6hmwalder
> LINBIT | Keeping the Digital World Running
> DRBD HA =E2=80=94  Disaster Recovery =E2=80=94 Software defined Storage
>

--0000000000001b547105f6238036
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: <a href=3D"mailto:wjn740@gmail.com">wjn740@gm=
ail.com</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">Christoph B=C3=B6hmwalder &lt;<a href=3D"mailto:christoph.boehmw=
alder@linbit.com">christoph.boehmwalder@linbit.com</a>&gt; =E4=BA=8E2022=E5=
=B9=B46=E6=9C=8822=E6=97=A5=E5=91=A8=E4=B8=89 22:29=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 16.06.22 =
um 16:32 schrieb Xiang wangx:<br>
&gt; Delete the redundant word &#39;and&#39;.<br>
&gt; <br>
&gt; Signed-off-by: Xiang wangx &lt;<a href=3D"mailto:wangxiang@cdjrlc.com"=
 target=3D"_blank">wangxiang@cdjrlc.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/block/drbd/drbd_bitmap.c | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/drivers/block/drbd/drbd_bitmap.c b/drivers/block/drbd/drb=
d_bitmap.c<br>
&gt; index 9e060e49b3f8..8afdde400e37 100644<br>
&gt; --- a/drivers/block/drbd/drbd_bitmap.c<br>
&gt; +++ b/drivers/block/drbd/drbd_bitmap.c<br>
&gt; @@ -86,7 +86,7 @@ struct drbd_bitmap {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* exclusively to be used by __al_write_tran=
saction(),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * drbd_bm_mark_for_writeout() and<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 * and drbd_bm_write_hinted() -&gt; bm_rw() calle=
d from there.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * drbd_bm_write_hinted() -&gt; bm_rw() called fr=
om there.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int n_bitmap_hints;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int al_bitmap_hints[AL_UPDATES_PER_=
TRANSACTION];<br>
<br>
Thanks!<br>
<br>
Acked-by: Christoph B=C3=B6hmwalder &lt;<a href=3D"mailto:christoph.boehmwa=
lder@linbit.com" target=3D"_blank">christoph.boehmwalder@linbit.com</a>&gt;=
<br>
<br>
-- <br>
Christoph B=C3=B6hmwalder<br>
LINBIT | Keeping the Digital World Running<br>
DRBD HA =E2=80=94=C2=A0 Disaster Recovery =E2=80=94 Software defined Storag=
e<br>
</blockquote></div>

--0000000000001b547105f6238036--

--===============4790667808114559111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============4790667808114559111==--
