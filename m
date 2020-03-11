Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4671F824A
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 11:55:41 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7C4C74203EB;
	Sat, 13 Jun 2020 11:55:41 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 137934203D6
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:55:26 +0200 (CEST)
Received: by mail-wm1-f68.google.com with SMTP id b82so1522224wmb.1
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:mime-version:from:date:message-id:subject
	:to; bh=l/wDtebg/hA30nObyA+vnEymMNGM312XTFiftTI40Ak=;
	b=odxMwEWPVLDWMNJMEKTBXRpStGaXl9+T0DhMISOOs4Eoz41zaw6NBeTHvhMOQ5qcww
	737TOLGNDbDvzgg98hjuvRXW90V7hTS7PziHiNq5Z5OtcbMH7U/jZrFkIdTdktQYO4GY
	2bfbk4o9OLjOiF+FGqSmq4c8vlmNv5RtP+B46MBtJF4hG5mS/gGRslp0NAmTTRGu6ozb
	N3yepxu7veUX4G+3EhmPwWt+c72ZfxyvgJEoTOHvgHq7JdwP3y46M66weCp1l3cwN70s
	zdEi6pfnfCbT2yzL+bX95cNIrYsWXm1Tky1/3zYO9b8ozYaSFIMvOeD5XN7+HGdyYGIs
	8cAQ==
X-Gm-Message-State: AOAM530qWBceEmN4g+AijRV7stQT16ASctwvyIcRBtNNq8Xd484biOLk
	6EzQ6i9fjRgIFeEtE6CZ2z7eNMJRb8G+2w==
X-Google-Smtp-Source: ABdhPJx+RX+IRHpWtK0NDAWcjphvjgf0yUCOz5W94kxeQJmbGdBCRA0cnOx/TCIQCR1xVLlIcNZs2w==
X-Received: by 2002:a1c:de82:: with SMTP id v124mr3256581wmg.89.1592042126181; 
	Sat, 13 Jun 2020 02:55:26 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	88sm15234900wre.45.2020.06.13.02.55.25
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:55:25 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:55:24 +0200
Resent-Message-ID: <20200613095524.GB4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1487 seconds by postgrey-1.31 at mail19;
	Wed, 11 Mar 2020 16:56:53 CET
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9EC624203DE
	for <drbd-dev@lists.linbit.com>; Wed, 11 Mar 2020 16:56:53 +0100 (CET)
Received: by mail-wr1-f49.google.com with SMTP id n15so3263700wrw.13
	for <drbd-dev@lists.linbit.com>; Wed, 11 Mar 2020 08:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=l/wDtebg/hA30nObyA+vnEymMNGM312XTFiftTI40Ak=;
	b=R8A6RteNiLAKNCYA1IzIzqpNry3SASGzPDr1+/lJUjYeNRTo5k47F3kXewtcqdVkwj
	yKlKxlkOt2c3u2qHCo1B2ya+Fq3f6cq9EscSWZq01/CKlafOpTP9EVvMiq0OL8nWqbew
	QdTgpkEHxZGhimxVB8FjQUrSrOOsi9ropCRoyspICSJdVh785OF2GY9Z0THOdmpYo+4G
	sv7oJOdx/PPOoxJKe9y7v8SQWJWjBDtsnbKKMMSbk8Yl7WQsG1ayuHj/t/inH3iKbD+k
	vbk7HYzW+WfeUjApmtPYV/poLTYxvag/K6lrk7XSWX6iSuRMEkFEO7wJfRxuvhhem3hE
	Y/8w==
X-Received: by 2002:a05:6512:1109:: with SMTP id
	l9mr2539636lfg.50.1583940258406; 
	Wed, 11 Mar 2020 08:24:18 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?16LXqNefINeQ16HXkNeV?= <eranasseo100@gmail.com>
Date: Wed, 11 Mar 2020 17:24:03 +0200
Message-ID: <CANNRee=885eDz9bbcWVLi0_68V9xCufKus_dQMxMpkPaqRZ4sw@mail.gmail.com>
To: drbd-dev@lists.linbit.com
Subject: [Drbd-dev] RHEL 7.6 | 3.10.0-957 | drbd_req.c compilation errors
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
Content-Type: multipart/mixed; boundary="===============7412053147708379841=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============7412053147708379841==
Content-Type: multipart/alternative; boundary="00000000000072a34e05a095d4a9"

--00000000000072a34e05a095d4a9
Content-Type: text/plain; charset="UTF-8"

Hello experts,

I noticed that some APIs (part_round_stats, part_inc_in_flight) were
changed in RHEL 7.6 Kernel 3.10.0-957 which drbd_req.c was not aligned to.

Do you know if the following patch is correct from DRBD perspective?
https://opendev.org/starlingx/integ/commit/3de433a3b1667c7223702fb9e3e81e424cdaedcb

To be more precise I mean only the drbd_req.c changes here:
https://opendev.org/starlingx/integ/src/commit/3de433a3b1667c7223702fb9e3e81e424cdaedcb/kernel/kernel-rt/centos/patches/fix-CentOS-7.6-upgrade-compile-error.patch

Would appreciate any help
Thank you

Regards
Eran Asseo

--00000000000072a34e05a095d4a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"rtl"><div dir=3D"ltr">Hello experts,</div><div dir=3D"ltr"><br>=
</div><div dir=3D"ltr">I noticed that some APIs (<code class=3D"gmail-diff =
gmail-hljs"><span class=3D"gmail-hljs-addition">part_round_stats,</span></c=
ode><code class=3D"gmail-diff gmail-hljs"><span class=3D"gmail-hljs-additio=
n"> part_inc_in_flight</span></code><code class=3D"gmail-diff gmail-hljs"><=
span class=3D"gmail-hljs-addition"></span></code>)



were changed in RHEL 7.6 Kernel
3.10.0-957 which drbd_req.c was not aligned to.</div><div dir=3D"ltr"><br><=
/div><div dir=3D"ltr">Do you know if the following patch is correct from DR=
BD perspective?</div><div dir=3D"ltr"><a href=3D"https://opendev.org/starli=
ngx/integ/commit/3de433a3b1667c7223702fb9e3e81e424cdaedcb">https://opendev.=
org/starlingx/integ/commit/3de433a3b1667c7223702fb9e3e81e424cdaedcb</a></di=
v><div dir=3D"ltr"><br></div><div dir=3D"ltr">To be more precise I mean onl=
y the drbd_req.c changes here:</div><div dir=3D"ltr"><a href=3D"https://ope=
ndev.org/starlingx/integ/src/commit/3de433a3b1667c7223702fb9e3e81e424cdaedc=
b/kernel/kernel-rt/centos/patches/fix-CentOS-7.6-upgrade-compile-error.patc=
h">https://opendev.org/starlingx/integ/src/commit/3de433a3b1667c7223702fb9e=
3e81e424cdaedcb/kernel/kernel-rt/centos/patches/fix-CentOS-7.6-upgrade-comp=
ile-error.patch</a></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">Would =
appreciate any help<br></div><div dir=3D"ltr">Thank you<br></div><div dir=
=3D"ltr"><br></div><div dir=3D"ltr">Regards<br></div><div dir=3D"ltr">Eran =
Asseo<br></div></div>

--00000000000072a34e05a095d4a9--

--===============7412053147708379841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============7412053147708379841==--
