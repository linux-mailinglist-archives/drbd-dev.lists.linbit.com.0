Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0553822E66C
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Jul 2020 09:22:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DE4744204B2;
	Mon, 27 Jul 2020 09:22:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 460 seconds by postgrey-1.31 at mail19;
	Sun, 22 Mar 2020 17:33:22 CET
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 41EDB420005
	for <drbd-dev@lists.linbit.com>; Sun, 22 Mar 2020 17:33:21 +0100 (CET)
Received: by mail-ed1-f43.google.com with SMTP id v6so13528729edw.8
	for <drbd-dev@lists.linbit.com>; Sun, 22 Mar 2020 09:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=qURnMcHLb3hXcDNSWXbq1W/AIFsXHucb9bC3V5dGvBQ=;
	b=hREx0nRhbyi6XFRkfrA2QDqBmwG7fag8X9awCMeZHjGykAFzxhskWO8lExKzNnE1tX
	cxCz64HN8enXxCpdetkbx60e+5LHDQ/UzhMjEKvFVa9lj8Dfbg0yhfLjmUH47KMZqH+y
	aetBtB1uefXFgKAEk/39+OTX4Q06WxaOyNDJzr+q0PY3Qyfidk8SN9AusEEfth9w8taN
	cGMiwfVyh6NGMrt3QLysE/by3okOFsxeZDqKDPgGzGoNpBTDswPZBTkPWLgZ13mPlN0L
	Nsiq8xUlPOC+xlN1NLG+RYK9hLzfMQ/X9KHoKz9q6FGQCA9bKBun7FAVDv78HA6wNKzh
	QEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=qURnMcHLb3hXcDNSWXbq1W/AIFsXHucb9bC3V5dGvBQ=;
	b=LG5c3F8w2YPkvfH5KKCRLveAeMoiaVurBOZToAOWA2JpofWTlNC7bwZF1Uh4Fsl+eu
	LBO5sxb19qYe19PNeIbMqevi25juOtPfVGxjUCboOTffmEHYa7KK3tC6YIqQDJnI7ETx
	OmnOCiXmQMZpER2kDc7Xtkg+8ETVSYzbq+vDkgKChkaxeuKIDtAjMONpkZWKeEzQc7qW
	RjnZeV/PdM1dnnDVyIamitPZwanI0KO6pijvYgbAX7Q8YiRLo3cpuRrF0+/zLCaa5W1g
	cWIgxp6D0K7ONzi8JDIwP+22oUXiqotT5XFGJS7EkURsOcURaWqH22f67ngy28cdU0Vm
	HELg==
X-Gm-Message-State: ANhLgQ0qRVQb9yKx1nCR6c4nV9g1itrq0oY5B51QnVsRaTm9tLhsXpuY
	NgkLFNIL1HDhW2/Vx8hYbiPUe7noumYqJ0cfgK9jgEH6
X-Google-Smtp-Source: ADFU+vtkivZAIPYFImGzBVEVL92afHibRROoWrk5HbSZlqK8DdPGkONAaeW7vGc2Vn1ecmsb3WH4H12Slk/5lMqsUvU=
X-Received: by 2002:a17:906:3016:: with SMTP id
	22mr5287906ejz.29.1584894800968; 
	Sun, 22 Mar 2020 09:33:20 -0700 (PDT)
MIME-Version: 1.0
From: "T.J. Yang" <tjyang2001@gmail.com>
Date: Sun, 22 Mar 2020 11:33:09 -0500
Message-ID: <CAD2GW8rEcO0rYaFbi3y8FC3ps7koyyN_ihvHZ8iRGrps_=-TFQ@mail.gmail.com>
To: drbd-dev@lists.linbit.com
X-Mailman-Approved-At: Mon, 27 Jul 2020 09:22:33 +0200
Subject: [Drbd-dev] Lower MIN_SPATCH_VERSION to 1.0.7 ?
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
Content-Type: multipart/mixed; boundary="===============1960260311324706734=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============1960260311324706734==
Content-Type: multipart/alternative; boundary="0000000000009e484905a174134b"

--0000000000009e484905a174134b
Content-Type: text/plain; charset="UTF-8"

Hi

Can MIN_SPATCH_VERSION be set to 1.0.7 in upstream code base ?

CentOS 8 only have rpm package(coccinelle) for version 1.0.7.
With version 1.0.7 set, I was able to make drbd.

[me@centos8t01 drbd]$ grep MIN_SPATCH_VERSION=
 drbd-kernel-compat/gen_compat_patch.sh
MIN_SPATCH_VERSION=1.0.7
[me@centos8t01 drbd]$ make

    Calling toplevel makefile of kernel source tree, which I believe is in
    KDIR=/lib/modules/4.18.0-187.el8.x86_64/source

make -C /lib/modules/4.18.0-187.el8.x86_64/source
 O=/lib/modules/4.18.0-187.el8.x86_64/build M=/build/me/github/drbd/drbd
 modules
  Building modules, stage 2.
  MODPOST 2 modules
mv .drbd_kernelrelease.new .drbd_kernelrelease
Memorizing module configuration ... done.
[me@centos8t01 drbd]$

-- 
T.J. Yang

--0000000000009e484905a174134b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<div><br></div><div>Can=C2=A0MIN_SPATCH_VERSION be=
 set to 1.0.7 in upstream code base ?=C2=A0</div><div><br></div><div>CentOS=
 8 only have rpm package(coccinelle) for version 1.0.7.</div><div>With vers=
ion 1.0.7 set, I was able to make drbd.=C2=A0</div><div><br></div><div>[me@=
centos8t01 drbd]$ grep MIN_SPATCH_VERSION=3D =C2=A0 =C2=A0drbd-kernel-compa=
t/gen_compat_patch.sh<br>MIN_SPATCH_VERSION=3D1.0.7<br></div><div>[me@cento=
s8t01 drbd]$ make<br><br>=C2=A0 =C2=A0 Calling toplevel makefile of kernel =
source tree, which I believe is in<br>=C2=A0 =C2=A0 KDIR=3D/lib/modules/4.1=
8.0-187.el8.x86_64/source<br><br>make -C /lib/modules/4.18.0-187.el8.x86_64=
/source =C2=A0O=3D/lib/modules/4.18.0-187.el8.x86_64/build M=3D/build/me/gi=
thub/drbd/drbd =C2=A0modules<br>=C2=A0 Building modules, stage 2.<br>=C2=A0=
 MODPOST 2 modules<br>mv .drbd_kernelrelease.new .drbd_kernelrelease<br>Mem=
orizing module configuration ... done.<br>[me@centos8t01 drbd]$<br><div><br=
></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature">T.J. Yang</div></div></div>

--0000000000009e484905a174134b--

--===============1960260311324706734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============1960260311324706734==--
