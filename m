Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC377B059C3
	for <lists+drbd-dev@lfdr.de>; Tue, 15 Jul 2025 14:17:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 435D6162274;
	Tue, 15 Jul 2025 14:17:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
	[209.85.208.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 38263160650
	for <drbd-dev@lists.linbit.com>; Tue, 15 Jul 2025 14:16:54 +0200 (CEST)
Received: by mail-ed1-f51.google.com with SMTP id
	4fb4d7f45d1cf-607ec30df2bso10446533a12.1
	for <drbd-dev@lists.linbit.com>; Tue, 15 Jul 2025 05:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1752581814;
	x=1753186614; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=pY+MEN3vD09dThY+2nXjbyvTovAJhhRzX2y37T6Grrk=;
	b=j7BwC3n0Vw6IX1kUh4zgAJJjueC3fiIhJEKPTKKxZLa1T8LXoQ0dOAQyk6hBuG/HaF
	jPBvWv+KB0QFiAee7rTGyZPlXL/9G6S33m0cdWoQDOoA+eWjtNzfeqNbGmHvpuK9eYir
	5BX2p502EBLGJKg48vGtaV0oRkb/N0LPKUXJvo8j7KrOqpaiq+f4w5a2KOysw6qFduXk
	4vj8CWRQqNVFfHLI4d7C5CYsbYLmgM0bnG8shaq0k4fxQarPOLP5U/CRzArNguZGGSf7
	9tTWZZUiRJyLY4Es0gxYV72YIU1S1BVL5ERf19cEF3BET/WIV/XWF7klZ5SuPI5RafGA
	8YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1752581814; x=1753186614;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=pY+MEN3vD09dThY+2nXjbyvTovAJhhRzX2y37T6Grrk=;
	b=g4ZTk/SE7CBHkMhVBnNR3keQ0GLyzym+rbQMA94TwsiXhFqVFchu2178FB5dIdXpQR
	umjgusSUE9eskc6WNKermJictNdWDOAnHQHDrrZ7CEbsR9+v8TMQw1ogGknc2YRN+HdR
	I7RZd41bz09NhTSLu5q1EX6TzJ5mAD79rnbFCiyGIWXecTwlXxDs3gF53zaPakZ8RuMR
	X5L/1uTJJpbhUwkej8LDre7Ae+4+sB5t6bFoLV2R4e/Y7zldZCdv1t5qwCTi2CYg47xk
	scTpU9H0tue5w1vSs6VfRTCFVXW6NxXSAKd33YBVFGZ7Dk4ie8et11OZtEEugl9VCNNW
	ReEQ==
X-Gm-Message-State: AOJu0YwaONpyGVXglGTf8qlPScu2adydbnGj/gJFsncx/w75SQiF+HOr
	JwfHlq1FGraFJWkh/PNMGqyzx+axmHPA7kwl9Bg2MYLcBOzqNB0QzDOR+17/gRE0SC6Lcwbp6vI
	VnG0wSHwKMIzYkBY2kRmjfIcDEoSVRAytQO2Y8qGlOqGg7fjg2BuUouo=
X-Gm-Gg: ASbGncsdWBEjmrfrq/1j9ifI6LXEJdLB18CMaiLfjh/dVx+1z1QFA5euxxJ6omwrJLl
	JDcgQuQIOMy3pFAdVy1Oz+5yvxLrBapi6ZMII7IJRaGEDFgEKc0R1ZClbYHjYqq4xBlF11LieVy
	O4thi+GJ0rh8JfefPLRBZbte12Q4saI7b1aIYQRBIpRzX7XiqJiwwbPNfR1etqouYsVYyQDf9r9
	lNS2pXloibOwdgKLTU=
X-Google-Smtp-Source: AGHT+IGm/OAjRKN/2thCZBoDCrH+dPLy90ja31hwCt8hGWi8HxfnQVHZk6I2pJPaSd2V/IjjSnHfEPa+tEFXe9lCAbA=
X-Received: by 2002:a05:6402:378d:b0:5fb:c126:12c9 with SMTP id
	4fb4d7f45d1cf-611e84c2334mr13949734a12.25.1752581814089;
	Tue, 15 Jul 2025 05:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250512054449.1876131-1-zhengbing.huang@easystack.cn>
	<AIgAWQAHL2UusPjIM6GtBqpF.3.1751957527642.Hmail.zhengbing.huang@easystack.cn>
In-Reply-To: <AIgAWQAHL2UusPjIM6GtBqpF.3.1751957527642.Hmail.zhengbing.huang@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Tue, 15 Jul 2025 14:16:41 +0200
X-Gm-Features: Ac12FXwm0AjVhrVKb34tmLbpp1ieXnpiTnymbo4Ij4MKTGFg7sHm2_fXY_Hrs1E
Message-ID: <CAGNP_+XBPKxpAz=2hhjXvnZ12WWs4tHzJuwyKBNsWVuubqB__A@mail.gmail.com>
Subject: Re: [PATCH] drbd: Fix kernel hangs issue
To: ZhengbingHuang <zhengbing.huang@easystack.cn>
Content-Type: multipart/alternative; boundary="000000000000781b2d0639f6c0d4"
Cc: drbd-dev <drbd-dev@lists.linbit.com>
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

--000000000000781b2d0639f6c0d4
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for this and your other recent contributions. It is currently
vacation season here in Europe where the DRBD maintainers are based, so
there will be a delay in responding to them.

Thanks for your patience.

Joel

--000000000000781b2d0639f6c0d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Thanks =
for this and your other recent contributions. It is currently vacation seas=
on here in Europe where the DRBD maintainers are based, so there will be a =
delay in responding to them.</div><div><br></div><div>Thanks for your patie=
nce.</div><div><br></div><div>Joel</div><div><br></div></div><br></div>

--000000000000781b2d0639f6c0d4--
