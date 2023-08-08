Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 003EB776FEB
	for <lists+drbd-dev@lfdr.de>; Thu, 10 Aug 2023 08:02:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B55B64252F7;
	Thu, 10 Aug 2023 08:02:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 01ACE420171
	for <drbd-dev@lists.linbit.com>; Tue,  8 Aug 2023 13:24:37 +0200 (CEST)
Received: by mail-ed1-f41.google.com with SMTP id
	4fb4d7f45d1cf-523225dd110so5430179a12.0
	for <drbd-dev@lists.linbit.com>; Tue, 08 Aug 2023 04:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=luizalabs.com; s=google; t=1691493877; x=1692098677;
	h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
	:date:message-id:reply-to;
	bh=aNXIv/B1toiQr6smo5Wh2HHXmVRYGvtJWcti7upovKU=;
	b=LZ+7GrqlgmbWKaxx9iqpedamtXE9ctXv1oGfCzCJ/NL7xspofBfWExmEioFiKSZrS6
	7Z9RBwiZDcR3ElAekiPeLk6Wy/5BRGVWTpk79J68xARNaMmHVrdLtATSuoEt8uXkZ5bF
	8mMfY/N8togN5ZzVTbpEoGYD8HbCG8n+OSvZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1691493877; x=1692098677;
	h=to:subject:message-id:date:from:mime-version:x-gm-message-state
	:from:to:cc:subject:date:message-id:reply-to;
	bh=aNXIv/B1toiQr6smo5Wh2HHXmVRYGvtJWcti7upovKU=;
	b=bf2CIfZIV7hnincbLomedcMcfZoKDOuBU9zDMI0O7XFy2vOXCtkzBhRzRe2YPXb5hR
	wK/TkoNdS2A5mYH/Awvf9Ly9JJzJERwfgSV7KYvbk8zSdVSmEnmbuI1k+VxPdfaSNRy9
	g0+wDEKtD25bff+OolafPreRDMYQZ8kZueqZbX/zXA2BuesKrqVNtS1oytImvd1T5ia6
	+OgMoljQhZvxy8HGyjwvBDxM+/+dudBKzDrE0Y+FZwrlN57/FVy8fbDtJwm7KvPFyzHg
	BjuLpvdNW02AKt1MLz8PBfPGzUc/0oYeTjqXCdzmZ40wVTMmmFI8E9ONUE9lPFmJCWS5
	N2Gg==
X-Gm-Message-State: AOJu0YwzUJcqSmsu2QmCgMwV59GWG91cvtQKsNEhGTO4OBmHwUIwqHKP
	7Kl9p8tEFrfWa7Y7GsLdoqfEZDsPgkd3gVufrcTUwVK9l1czkswzxpDN28dy5Y7kixGtQOK4IbU
	VEwKA9DMV8jI08gS5j5cQ44hVCxuBBPecT9l+GCXSmRHmGw==
X-Google-Smtp-Source: AGHT+IEJ74jG7/LoEb1i2Yah0RbiT/Z79AVXm6A96Ro6iWvkQOVvG+nyJfaUdR9hxKDX+pv7RMkdClowXOev4Fk9UWs=
X-Received: by 2002:aa7:da4a:0:b0:522:2af1:1ffe with SMTP id
	w10-20020aa7da4a000000b005222af11ffemr9698303eds.9.1691493877110;
	Tue, 08 Aug 2023 04:24:37 -0700 (PDT)
MIME-Version: 1.0
From: Gustavo Luiz Ferreira Walbon <gustavo.walbon@luizalabs.com>
Date: Tue, 8 Aug 2023 08:24:24 -0300
Message-ID: <CAPPH7CSAXNbAKFLDSbdBGoCiZAE-FuqHRio4Kh2G_7gsHZigOw@mail.gmail.com>
To: drbd-user@lists.linbit.com, drbd-dev@lists.linbit.com
X-Mailman-Approved-At: Thu, 10 Aug 2023 08:02:35 +0200
Subject: [Drbd-dev] Improvement of output log
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
Content-Type: multipart/mixed; boundary="===============6672010681964599773=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============6672010681964599773==
Content-Type: multipart/alternative; boundary="000000000000afd2750602679b49"

--000000000000afd2750602679b49
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I have been searching for a way to configure DRBD to provide more detailed
reports when handling requests among the nodes with volumes. This is
particularly important when investigating an issue like a call trace from a
module.

Could you please advise on how I can enhance the output in a reproducible
scenario of an issue?

Regards,

--=20
*Gustavo L F Walbon*
Desenvolvedor S=C3=AAnior, Luiza Labs, IaaS Core

--=20




_=E2=80=98Esta mensagem =C3=A9 direcionada apenas para os endere=C3=A7os co=
nstantes no=20
cabe=C3=A7alho inicial. Se voc=C3=AA n=C3=A3o est=C3=A1 listado nos endere=
=C3=A7os constantes no=20
cabe=C3=A7alho, pedimos-lhe que desconsidere completamente o conte=C3=BAdo =
dessa=20
mensagem e cuja c=C3=B3pia, encaminhamento e/ou execu=C3=A7=C3=A3o das a=C3=
=A7=C3=B5es citadas est=C3=A3o=20
imediatamente anuladas e proibidas=E2=80=99._


*=C2=A0**=E2=80=98Apesar do Magazine Luiza tomar=20
todas as precau=C3=A7=C3=B5es razo=C3=A1veis para assegurar que nenhum v=C3=
=ADrus esteja=20
presente nesse e-mail, a empresa n=C3=A3o poder=C3=A1 aceitar a responsabil=
idade por=20
quaisquer perdas ou danos causados por esse e-mail ou por seus anexos=E2=80=
=99.*




--000000000000afd2750602679b49
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br>I have been searching for a way to configu=
re DRBD to provide more detailed reports when handling requests among the n=
odes with volumes. This is particularly important when investigating an iss=
ue like a call trace from a module.<br><br>Could you please advise on how I=
 can enhance the output in a reproducible scenario of an issue?<br><br>Rega=
rds,<br clear=3D"all"><div><br></div><span class=3D"gmail_signature_prefix"=
>-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><font size=3D"4"><b>Gustavo L F Walbon</=
b></font><div>Desenvolvedor S=C3=AAnior, Luiza Labs, IaaS Core</div><div><b=
r></div><div><br></div></div></div></div></div>

<br>
<div style=3D"font-family:Arial,Helvetica,sans-serif;font-size:1.3em"><div =
style=3D"color:rgb(97,97,97);font-family:&#39;Open Sans&#39;;font-size:14px=
;line-height:21px;background-color:rgb(255,255,255)"><div style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:12.8000001907349px;line-=
height:normal"><div style=3D"font-family:Arial,Helvetica,sans-serif;font-si=
ze:1.3em"><div style=3D"color:rgb(97,97,97);font-family:&#39;Open Sans&#39;=
;font-size:14px;line-height:21px"><div style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8000001907349px;line-height:normal"><br>=
</div></div></div><div style=3D"font-family:Arial,Helvetica,sans-serif;font=
-size:1.3em"><i style=3D"font-family:arial,sans-serif;font-size:x-small">=
=E2=80=98Esta mensagem =C3=A9 direcionada apenas para os endere=C3=A7os con=
stantes no cabe=C3=A7alho inicial. Se voc=C3=AA n=C3=A3o est=C3=A1 listado =
nos endere=C3=A7os constantes no cabe=C3=A7alho, pedimos-lhe que desconside=
re completamente o conte=C3=BAdo dessa mensagem e cuja c=C3=B3pia, encaminh=
amento e/ou execu=C3=A7=C3=A3o das a=C3=A7=C3=B5es citadas est=C3=A3o imedi=
atamente anuladas e proibidas=E2=80=99.</i></div><div style=3D"font-family:=
Arial,Helvetica,sans-serif;font-size:1.3em"><p style=3D"font-family:arial,s=
ans-serif;text-align:justify"><i><font size=3D"1">=C2=A0</font></i><i><font=
 size=3D"1">=E2=80=98Apesar do Magazine Luiza tomar todas as precau=C3=A7=
=C3=B5es razo=C3=A1veis para assegurar que nenhum v=C3=ADrus esteja present=
e nesse e-mail, a empresa n=C3=A3o poder=C3=A1 aceitar a responsabilidade p=
or quaisquer perdas ou danos causados por esse e-mail ou por seus anexos=E2=
=80=99.</font></i></p></div></div></div></div>
--000000000000afd2750602679b49--

--===============6672010681964599773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============6672010681964599773==--
