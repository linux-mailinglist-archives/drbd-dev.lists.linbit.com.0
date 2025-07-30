Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0822AB16278
	for <lists+drbd-dev@lfdr.de>; Wed, 30 Jul 2025 16:16:18 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0A8381622E8;
	Wed, 30 Jul 2025 16:16:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 84967160909
	for <drbd-dev@lists.linbit.com>; Wed, 30 Jul 2025 16:15:56 +0200 (CEST)
Received: by mail-ed1-f45.google.com with SMTP id
	4fb4d7f45d1cf-6157ed5dc51so2571271a12.1
	for <drbd-dev@lists.linbit.com>; Wed, 30 Jul 2025 07:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1753884956;
	x=1754489756; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=f4PKI5LDW7gMeA9XnMbpMjy/Zq7C7u9BinWEVBEQWb8=;
	b=ndhd7WldUxEsyY78knXUXQdtgLUBl4yvP7PYSujCx4efRFQCZYTF/+vBf7/Ant0Avr
	GlkQRZkGaa52G+uMA7fbgh8b6REi5nlI/WSmnKaVeVsLQosvWEnrUbYbO+zN/1f62BPu
	4ZsNhYo6A+AR+vSXJkP3c7rG4FlRxs//SY3yBzNgCF/2vESYm3jAm/0cxnZvET5X2QQP
	TAQpT7U+TgYxkTzf3V//UdSrwpiqPsRSY32VL0nFWoVRF/fwtG3gbZS2fqxY1iSqcCt4
	jYrC5zd6GxxBnRYvjM1BhSkl6TpdjHgTchERxxhVm8lyZ3ODwjYOp4wseXTxrixJWDhK
	CJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1753884956; x=1754489756;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=f4PKI5LDW7gMeA9XnMbpMjy/Zq7C7u9BinWEVBEQWb8=;
	b=YFbSdYe3PPuhjMlIRB9Up7LO5ACy4gpM13rofGGzo7QL98VgckW9UmwWOhykQ4BPmw
	rGJGp9HDamC6vY5S2+g53IV4klp6CJkc5UtN99tqljMZk5iDnZ3yNidgyGt3NO3DZV5P
	XlP0ix93PvGZ7GUTjgTjF0S+DTrcVSzUL57bVdezEtGYKVhtWyTzvHGAgaDPFIc2I3iU
	Rk4Onl8+4a4mULdXGD3c/SIljurlDqi8pVK5xKKbZRBRg4ITpBqxoTyAP4heDoUZMmy4
	EPMV2ZwrEmhaORD5FAfdxcMEfgM98vJfsDkodeYygM7aw7FeMpgN54UfRHx3m+A4/CR3
	cTnw==
X-Gm-Message-State: AOJu0Yyko+XC8BfuHXzOYzMD/cHqp6QKmyNIRaNpSkWBs+7FlrYSWd/V
	p1KNFZEouYnjdR9ZkpAaZZ3O8hheoBC7zLbpKyf6afcjpNIVP2vGRquD4XylA4XAc2jgbRICFlv
	FfzUiRpXJoK5Zn4Xdccj+eA8LMAqytMMy/CqJ/WzLL8Yxg84hsKtW6IY=
X-Gm-Gg: ASbGncub2nRy9ucwqjxrFjMn/xKGVABi1mwX59lWYXR7vY5o9zuZX32DG0x7oCWS+jc
	6go/K9TBLKQWgv5HzD/vEWF8P+/Xe7ub1ZBucK/WhsvTFiSlpNgSa4YezDfKMOREoQt/fL2At1i
	zXQ/JDQw/19zWCdGpDqDgjvbmx0nYN1LKVyk3VHSArbLdsmsWrfbEY+UqyNSf5ShVXzohQr67i+
	jw0Jj+dDuzKHWLLcg==
X-Google-Smtp-Source: AGHT+IGbCRRAJgNxVLmukPiTWi2FC4Eq1LWNmij19jFJ6tBo1nLMLHseMXsryaw1IDJE9dOtaMMKuzvInsceM12ROx0=
X-Received: by 2002:a17:907:9627:b0:ad5:2328:e39b with SMTP id
	a640c23a62f3a-af8fd9875b8mr425809766b.31.1753884955715; Wed, 30 Jul 2025
	07:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250512054449.1876131-1-zhengbing.huang@easystack.cn>
	<AIgAWQAHL2UusPjIM6GtBqpF.3.1751957527642.Hmail.zhengbing.huang@easystack.cn>
	<CAGNP_+XBPKxpAz=2hhjXvnZ12WWs4tHzJuwyKBNsWVuubqB__A@mail.gmail.com>
In-Reply-To: <CAGNP_+XBPKxpAz=2hhjXvnZ12WWs4tHzJuwyKBNsWVuubqB__A@mail.gmail.com>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Wed, 30 Jul 2025 16:15:42 +0200
X-Gm-Features: Ac12FXxbo_wfj5KfYxz8Gvdnt4mdUQitujvuFCYyq6bEBSm-m7w5XEJDCh8t00I
Message-ID: <CADGDV=Xj8awZQ4f2nfp_EZm-X+gQHWBzcUH_1Qq+o_dbxJMVGQ@mail.gmail.com>
Subject: Re: [PATCH] drbd: Fix kernel hangs issue
To: ZhengbingHuang <zhengbing.huang@easystack.cn>
Content-Type: multipart/alternative; boundary="000000000000c3633e063b26297d"
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

--000000000000c3633e063b26297d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks applied

Sorry for the long turnaround time.

Best regards,
 Philipp

On Tue, Jul 15, 2025 at 2:17=E2=80=AFPM Joel Colledge <joel.colledge@linbit=
.com>
wrote:

> Hi,
>
> Thanks for this and your other recent contributions. It is currently
> vacation season here in Europe where the DRBD maintainers are based, so
> there will be a delay in responding to them.
>
> Thanks for your patience.
>
> Joel
>
>
>

--000000000000c3633e063b26297d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>Thanks applied<br><br>Sorry for the long turnaround ti=
me.<br><br>Best regards,<div>=C2=A0Philipp</div></div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tu=
e, Jul 15, 2025 at 2:17=E2=80=AFPM Joel Colledge &lt;<a href=3D"mailto:joel=
.colledge@linbit.com">joel.colledge@linbit.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"=
ltr"><div>Hi,</div><div><br></div><div>Thanks for this and your other recen=
t contributions. It is currently vacation season here in Europe where the D=
RBD maintainers are based, so there will be a delay in responding to them.<=
/div><div><br></div><div>Thanks for your patience.</div><div><br></div><div=
>Joel</div><div><br></div></div><br></div>
</blockquote></div>

--000000000000c3633e063b26297d--
