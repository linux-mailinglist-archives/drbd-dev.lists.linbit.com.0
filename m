Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43984B1629F
	for <lists+drbd-dev@lfdr.de>; Wed, 30 Jul 2025 16:23:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 208611622FC;
	Wed, 30 Jul 2025 16:23:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D49BB162253
	for <drbd-dev@lists.linbit.com>; Wed, 30 Jul 2025 16:23:47 +0200 (CEST)
Received: by mail-ej1-f41.google.com with SMTP id
	a640c23a62f3a-ae0bc7aa21bso1399782166b.2
	for <drbd-dev@lists.linbit.com>; Wed, 30 Jul 2025 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1753885427;
	x=1754490227; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=ads3bNwnJj/SYUS7u5F3Bi45n+Q+juP+Ql9WL3oFhJk=;
	b=h3ouowz3KZc3g1csZlIt//lqzZM0XX+WYsn7y+xGwOyxZ5lPn7tdrdRLObEL31GB+q
	94dMP5acuGe7T0y+75No52CaIn0wFJFcChjGqQFOKA/kA8FXBRvt4KJwfY6MZ8bjN6rZ
	fNgY+5gDINUnsFOcUbizKWbQaQj4pvSBhSG7RsjIUi1WV9B5ynCtoEWph9zuVEfvLGTj
	2OqFVty7Bl2SuP/la7/Kx4/54+vWKsvjO2yMv50RNJ75Pe0TdaFaq4QFXTQ3TlZ2aTD0
	3Q/jNlo+k2Z+vRWSW63+IEklYrQyNa0FtdXbr8n+JJ1mJNUoSOvW32d4HJxKN4SLXhKc
	4R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1753885427; x=1754490227;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=ads3bNwnJj/SYUS7u5F3Bi45n+Q+juP+Ql9WL3oFhJk=;
	b=DIpI8Yi6Zq5Gjgw+sqhQXDahkdwFb2+OcHDNvMvkUzoyjvrbC9We6Xa5EYD0RpZfEp
	11vkmR74X+2DIljrYojWb2FT3DXo/LCWZqzf7UHe4Qa8cVb0y0PNz8VLswLXuZy64444
	ku/rwAMiAYzNaYQahOnhVBLUkegYWP9bIMbNwkNw1Vv0QFCAHuIEU9bhdZ40CxraWOrS
	lAJDSiBBvh5MAFZ0XATl+2Ou+wlcyOvHCAvjBXhBImxQEXb+3ly0nbTW7IzHVYjL+kgu
	ffcba7WksYXz5yDATVKsnYhkGTGib3X3RBnF0mzHzWbGIyjxTiwlO2rjnWrZSPAISRQh
	RRGA==
X-Gm-Message-State: AOJu0YzMZcDzT8hSHbk1k5TYRpETh9X9xbxo6qexU/0/twxSPwsYRq/v
	rEgvY4K5n/e8FhqX9jtPL75R8ezxpqaJ+pmx+chWTn6q6m92HMuvP0Hx+5Ql05U6qXUwwsRlNMT
	Lx8QbncZWVQxpTqnKk4uPvv9hiZQwDEzyAGoWTtZHgZRvSo87t7rIBxc=
X-Gm-Gg: ASbGncsXOHrqP6qJGZKBKubjovaAwVeOsPFPFaRNfI2LEyJs8FuLneOI9ZwwhYa4Yvt
	40XLzdGzFX0e678itUugqoZDfx8EdOdAEowYuRxibn7z8Zh7g/bjIHjt0oCBcwBty6tndOAuXFq
	sDqRdYWzwr4uhNTQzA7SZZP8X8ET7ZzVxOcVa4dCTi4kKJfY1OqXl9qT3FSd9DzDN343mlToGYB
	kYmkVc=
X-Google-Smtp-Source: AGHT+IG8jGEkgxCX4Ro+RJz53/acigS0YYNMibQWDgOnoq0RI3Tlu2D+KMNkVJZuJbIdtJvHeGa8fAsNZsTytFiPSFM=
X-Received: by 2002:a17:907:2da0:b0:aec:4b8e:84cc with SMTP id
	a640c23a62f3a-af8fd6a256cmr408179066b.5.1753885426878; Wed, 30 Jul 2025
	07:23:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250708073717.4077291-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20250708073717.4077291-1-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Wed, 30 Jul 2025 16:23:35 +0200
X-Gm-Features: Ac12FXxMtVZ43ahoiX6mB1A-xFJcblRc4zmJV3UQdOOg04uzRP6YRUrMATzd2uA
Message-ID: <CADGDV=Wd3p5VW9VyA_9nygWmFYYe4fgU0QF3t+Re8KJdZBLxKw@mail.gmail.com>
Subject: Re: [PATCH v2] rdma: Modify rdma_conn_param.rnr_retry to 7
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: multipart/alternative; boundary="000000000000d8b5e7063b264597"
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

--000000000000d8b5e7063b264597
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks applied!

PS: I will continue to review your other patches in the next few days.

Best regards,
 Philipp

On Tue, Jul 8, 2025 at 9:53=E2=80=AFAM zhengbing.huang <zhengbing.huang@eas=
ystack.cn>
wrote:

> During the sync process, we found that the
> IB_WC_RNR_RETRY_EXC_ERR error always occurred, and then
> the connection break. Then when the connection is restored,
> this error occurs again, enter a loop.
>
> When the IB_WC_RNR_RETRY_EXC_ERR error occurs,
> it indicates that there is no rx_desc at the receive side currently.
> Then we query that the current rnr_retry value is 0,
> meane there is no retry.
>
> So we modify rnr_retry to 7(max value), and the problem did not occur
> again.
>
> Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
> ---
>  drbd/drbd_transport_rdma.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
> index 30edfaf96..14392a33b 100644
> --- a/drbd/drbd_transport_rdma.c
> +++ b/drbd/drbd_transport_rdma.c
> @@ -409,6 +409,7 @@ static struct rdma_conn_param dtr_conn_param =3D {
>         .responder_resources =3D 1,
>         .initiator_depth =3D 1,
>         .retry_count =3D 10,
> +       .rnr_retry_count  =3D 7,
>  };
>
>  static u32 dtr_cm_to_lkey(struct dtr_cm *cm)
> --
> 2.43.0
>
>

--000000000000d8b5e7063b264597
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks applied!<br><br>PS: I will continue to review =
your other patches in the next=C2=A0few days.<br><br>Best regards,<div>=C2=
=A0Philipp</div></div></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 8, 2025 at 9:53=E2=
=80=AFAM zhengbing.huang &lt;<a href=3D"mailto:zhengbing.huang@easystack.cn=
">zhengbing.huang@easystack.cn</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">During the sync process, we found that the<br=
>
IB_WC_RNR_RETRY_EXC_ERR error always occurred, and then<br>
the connection break. Then when the connection is restored,<br>
this error occurs again, enter a loop.<br>
<br>
When the IB_WC_RNR_RETRY_EXC_ERR error occurs,<br>
it indicates that there is no rx_desc at the receive side currently.<br>
Then we query that the current rnr_retry value is 0,<br>
meane there is no retry.<br>
<br>
So we modify rnr_retry to 7(max value), and the problem did not occur again=
.<br>
<br>
Signed-off-by: zhengbing.huang &lt;<a href=3D"mailto:zhengbing.huang@easyst=
ack.cn" target=3D"_blank">zhengbing.huang@easystack.cn</a>&gt;<br>
---<br>
=C2=A0drbd/drbd_transport_rdma.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c<br>
index 30edfaf96..14392a33b 100644<br>
--- a/drbd/drbd_transport_rdma.c<br>
+++ b/drbd/drbd_transport_rdma.c<br>
@@ -409,6 +409,7 @@ static struct rdma_conn_param dtr_conn_param =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .responder_resources =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .initiator_depth =3D 1,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .retry_count =3D 10,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.rnr_retry_count=C2=A0 =3D 7,<br>
=C2=A0};<br>
<br>
=C2=A0static u32 dtr_cm_to_lkey(struct dtr_cm *cm)<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div>

--000000000000d8b5e7063b264597--
