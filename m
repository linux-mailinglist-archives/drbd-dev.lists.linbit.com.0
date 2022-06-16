Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B24550F6D
	for <lists+drbd-dev@lfdr.de>; Mon, 20 Jun 2022 06:33:53 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B1C20420620;
	Mon, 20 Jun 2022 06:33:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
	[209.85.221.175])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C9A154201D0
	for <drbd-dev@lists.linbit.com>; Thu, 16 Jun 2022 15:16:17 +0200 (CEST)
Received: by mail-vk1-f175.google.com with SMTP id s1so614043vkl.3
	for <drbd-dev@lists.linbit.com>; Thu, 16 Jun 2022 06:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bZfE2VmU7d2d9j5AkisGJ9medII3GC2ySzEGC9v7gqw=;
	b=SwRui+bCsc67Gz+yW6vPKVbiTjyRXKyCRotZ97aihAotAobkP4IkbUeKO/hO5/ZpNU
	Ly1cnEanJFak+iSTpXQe2OfGrteX7b7pjB2rXWgs9dF5VIM5Q0XuZ7cOyVy8uJ+xa9MR
	A8qZTtF6NAOkf68S8J7ugPZ0jsUlHeSPjDkW9Exw4ej0vpZBMBj1Dy/bFPp/ACoXW+A2
	MIw7YUgPWxa/vSkzL8CN73h2Wwv3j1ezN2/yhLjqaWl7LpXsv929CTqLx3uoQ2i0WDut
	odQ3fZg7U/vrSojpnXWZZX7zwSsdV5PtxuElCxwNA32KUmucyQ9DTOt2tPVBdUUYGJeh
	7TcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bZfE2VmU7d2d9j5AkisGJ9medII3GC2ySzEGC9v7gqw=;
	b=pQcv7Ujy9MKm/f89UtFvc2hArQ4gcXuu+/N7RElUjplpqvvYI7OeXa17fru2v1/gSZ
	OwBo8mMaD2AaiavBqUAhTXBy9gBaPr0vtmdiSJPRLhS4/8R7Z838p2hK4eCDuTq2RDrK
	TG6qXO5bfQXN2hPbe+R5qH+8EqvwB+KD165BgV3pXMpHWV1xPfPqktjbNFrM79mOLtVp
	cNccgnie/otCmz7B2zCPbYsfS6F2vMJ29A3Iv007bsp8GJrHaRGdvc8QxP+jajK0MNJJ
	eoNLWngsapzX56fo0pkqKWXcfuaMNzwsselKJUZfwBwPnIgV0xi92NZhXatxYEHv3fyr
	bfug==
X-Gm-Message-State: AJIora83Q9ID1LS1vzW+hUlV0yf/cjNwOsKrrya+y307T48M8WjAvScP
	lfLj70ZoR2qnad8vdn9K7tmKxWnOcBdt5zJ1FKQ=
X-Google-Smtp-Source: AGRyM1tpcGqGpUGUbpMPKY0LsZTwDyCvpS8p7mbGfBN7TcghKwgRHYOF/8odubEKSGFPRWxpsiLjQ7XsGVUbkSzX9tI=
X-Received: by 2002:a05:6122:99b:b0:365:1bc1:7ba6 with SMTP id
	g27-20020a056122099b00b003651bc17ba6mr2190381vkd.27.1655385376860;
	Thu, 16 Jun 2022 06:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220615140620.31630-1-kvapss@gmail.com>
	<CAGNP_+VHaMWzb-Z4ujuasuVDoLE459JAQ6q88JDLGeKJwKfmjw@mail.gmail.com>
In-Reply-To: <CAGNP_+VHaMWzb-Z4ujuasuVDoLE459JAQ6q88JDLGeKJwKfmjw@mail.gmail.com>
From: kvaps <kvapss@gmail.com>
Date: Thu, 16 Jun 2022 15:16:06 +0200
Message-ID: <CAGO-sgM98Rugu-=KO1VOSGKOnPbFGXKe-YaaG50WyQ_0dL3JuQ@mail.gmail.com>
To: Joel Colledge <joel.colledge@linbit.com>
X-Mailman-Approved-At: Mon, 20 Jun 2022 06:33:52 +0200
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] compat: make spaas url configurable
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
Content-Type: multipart/mixed; boundary="===============8178824531340124089=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============8178824531340124089==
Content-Type: multipart/alternative; boundary="0000000000005aac8005e1907130"

--0000000000005aac8005e1907130
Content-Type: text/plain; charset="UTF-8"

Yeah. There are some discussions about the needs for this change:
- https://github.com/LINBIT/saas/pull/1#issuecomment-1152117095
- https://github.com/piraeusdatastore/piraeus-operator/issues/315

In short: we're running SPAAS locally to allow our clients with isolated
environments be able to build DRBD module in their clusters without need of
spatch dependency as it adds additional 523 megabytes to every container.

> What is the purpose of this definition in the top-level Makefile? As far
as I can see, it is only needed in the other one.
>
> I guess it serves a documentation purpose, showing what command line
variables can be set. That is presumably the point of the SPAAS variable in
the top-level makefile. In that case, explicitly pass it down like the
SPAAS variable for consistency.

Yes, I just added it into the same files where the SPAAS variable is
specified.
I think it is good to have it described somewhere, but it always has a
default value and it can work without specifying it in Makefiles at all.

Best Regards,
Andrei Kvapil


On Wed, Jun 15, 2022 at 6:32 PM Joel Colledge <joel.colledge@linbit.com>
wrote:

> Thanks for the contribution. Seems like a reasonable idea to me.
>
> > diff --git a/Makefile b/Makefile
> > index 87c29518..37d7851d 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -37,6 +37,7 @@ DOCKERIMAGESTARGETS = $(addprefix
> dockerimage.,$(DOCKERIMAGES))
> >  # Use the SPAAS (spatch as a service) online service
> >  # Have this as make variable for distributions.
> >  SPAAS ?= true
> > +SPAAS_URL ?= https://drbd.io:2020
>
> What is the purpose of this definition in the top-level Makefile? As
> far as I can see, it is only needed in the other one.
>
> I guess it serves a documentation purpose, showing what command line
> variables can be set. That is presumably the point of the SPAAS
> variable in the top-level makefile. In that case, explicitly pass it
> down like the SPAAS variable for consistency.
>
> Best regards,
> Joel
>

--0000000000005aac8005e1907130
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yeah. There are some discussions about the needs for =
this change:</div><div>- <a href=3D"https://github.com/LINBIT/saas/pull/1#i=
ssuecomment-1152117095">https://github.com/LINBIT/saas/pull/1#issuecomment-=
1152117095</a></div><div>- <a href=3D"https://github.com/piraeusdatastore/p=
iraeus-operator/issues/315">https://github.com/piraeusdatastore/piraeus-ope=
rator/issues/315</a></div><div><br></div><div>In short: we&#39;re running S=
PAAS locally to allow our clients with isolated environments be able to bui=
ld DRBD module in their clusters without need of spatch dependency as it ad=
ds additional 523 megabytes to every container.<br></div><div><br></div><di=
v>&gt; What is the purpose of this definition in the top-level Makefile? As=
 far as I can see, it is only needed in the other one.<br>&gt; <br>&gt; I g=
uess it serves a documentation purpose, showing what command line variables=
 can be set. That is presumably the point of the SPAAS variable in the top-=
level makefile. In that case, explicitly pass it down like the SPAAS variab=
le for consistency.</div><div><br></div><div>Yes, I just added it into the =
same files where the SPAAS variable is specified.</div><div>I think it is g=
ood to have it described somewhere, but it always has a default value and i=
t can work without specifying it in Makefiles at all.<br></div><div><br></d=
iv><div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature"><div dir=3D"ltr"><div>Best Regards,</div><div>Andrei Kvapil=
<br></div></div></div></div><br></div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 6:32 PM Joel =
Colledge &lt;<a href=3D"mailto:joel.colledge@linbit.com">joel.colledge@linb=
it.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Thanks for the contribution. Seems like a reasonable idea to me.<br>
<br>
&gt; diff --git a/Makefile b/Makefile<br>
&gt; index 87c29518..37d7851d 100644<br>
&gt; --- a/Makefile<br>
&gt; +++ b/Makefile<br>
&gt; @@ -37,6 +37,7 @@ DOCKERIMAGESTARGETS =3D $(addprefix dockerimage.,$(D=
OCKERIMAGES))<br>
&gt;=C2=A0 # Use the SPAAS (spatch as a service) online service<br>
&gt;=C2=A0 # Have this as make variable for distributions.<br>
&gt;=C2=A0 SPAAS ?=3D true<br>
&gt; +SPAAS_URL ?=3D <a href=3D"https://drbd.io:2020" rel=3D"noreferrer" ta=
rget=3D"_blank">https://drbd.io:2020</a><br>
<br>
What is the purpose of this definition in the top-level Makefile? As<br>
far as I can see, it is only needed in the other one.<br>
<br>
I guess it serves a documentation purpose, showing what command line<br>
variables can be set. That is presumably the point of the SPAAS<br>
variable in the top-level makefile. In that case, explicitly pass it<br>
down like the SPAAS variable for consistency.<br>
<br>
Best regards,<br>
Joel<br>
</blockquote></div>

--0000000000005aac8005e1907130--

--===============8178824531340124089==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============8178824531340124089==--
