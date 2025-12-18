Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DC842CCCDB1
	for <lists+drbd-dev@lfdr.de>; Thu, 18 Dec 2025 17:48:32 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5230816315A;
	Thu, 18 Dec 2025 17:48:16 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
	[209.85.218.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8628E162759
	for <drbd-dev@lists.linbit.com>; Thu, 18 Dec 2025 17:48:10 +0100 (CET)
Received: by mail-ej1-f41.google.com with SMTP id
	a640c23a62f3a-b802d5e9f06so79732466b.1
	for <drbd-dev@lists.linbit.com>; Thu, 18 Dec 2025 08:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1766076490;
	x=1766681290; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=RtblFu1c/mhRdIIgEg2eQIqNJjF1oVM7AnSTPv2o+TA=;
	b=MzMk314mcGBxejIaOvOlWFiKYjtw336c2qfGsM0mGTEo4Lvp0OCePghcYUunQsmkLr
	fluRbksCY53c1UajF4fcuxBuLT/Gs0er1s85YSGVW/3KJXXpPZ3sOTx1k9Qm+TNzxDg5
	spMWilhnGMN9nQT+BzWfdznqr6qVnovfDYrEX8EwNmld89JZ1d1OB1MqE0tc4wF3webf
	EsAqbG0QLEZGo9pvG7QTcD7ulCRKy9KBnYTcg4MTMFRQ4JDHkJvi6Wmp0K/SgyGTi0yg
	rpD4Fp8rZwVVgTjmT1jqEAQ15IvM1eKJ9Ya9wFBHL9ILNUepijByxxzWhwUM7qsT1phY
	fb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1766076490; x=1766681290;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=RtblFu1c/mhRdIIgEg2eQIqNJjF1oVM7AnSTPv2o+TA=;
	b=FLmvZq6e71nnL3M+AuS3N3WdtcFWmJDZaU7uoPSipcChRFf+IYeRliqLy05fJWy5Dz
	fCQ0JSVm030JXc6O15DV+EYcRQRK+eTjeSBNgMHlaiRn8apehnVmKawCe/lvdS3LaSY2
	5S5RlMoTNtYhLHaO81kxtAA/bP5fUQV61vpZsxi0YCpXmJVD+qq575EOJ2D4UUUzluYE
	9VFanYY+Glv/GMqObOB3MevZr8VZkMfMn5bt7NTElBYJvlJcanT+mSlRLA7nwxs+FDh4
	Iq3kOuCGfJgZFqnwPq1JgCqm+kPo8VOGNFyimVHThCIGV3IKzQHDuTCUKTQVRYxos10A
	uk5g==
X-Gm-Message-State: AOJu0Yxe5bnT+uxhSuD0Iw0/26CIkFhcG7voSPIbJ1kk+LovA5yIn2y3
	jLMRsRATO6BCzJwGQL74y2/+Zq04iz8vdEYcfCT8/GEwrXIG8jIyOLqZtgJjFOSEQqo7jVc2iF+
	EGeqTlrxC917pLGdvJxN9pExghv20wKj77vpgF+eqJ3mzFZnU52hAaICHYQ==
X-Gm-Gg: AY/fxX48H6AUIkstT12aTHX9PBL3hYJTUOXacQ2R2XlK0+1f/pJ5SkGKnHUxxHbZOjw
	NKbGYfLuIn0p7u88TSv+t/vPLhTjVtLPLyTpqnB4hwh67hFytv4yetf0lJ2lgLfxvsaz4X3lK7v
	DSKvCCzuMIgoxhMV7S+3mzr191DULkWLON5FQ8n8f9pK4nXrX01swkHD1cBO6bCXiaVxCjMAMCA
	UUhR5qQzPur3bDI1ZBOpYUCyyi6xMuqXVaA28BAJe8skMfvEsgAEnnBYl9rSCA+e44sRdA7Q0t/
	w9AnNyJBOd3YiKiDzh/9QtW2TBk=
X-Google-Smtp-Source: AGHT+IEkhAWK0YbauRSXAGaFbSmHW8WjUDiLG59tVrIHPEEsYngkm18ePBOQhpPSN2fmsWNZ7ZOotnRbIjLEDgMnLgA=
X-Received: by 2002:a17:906:c109:b0:b73:8cea:62bb with SMTP id
	a640c23a62f3a-b7d237730b0mr2285281466b.31.1766076489797;
	Thu, 18 Dec 2025 08:48:09 -0800 (PST)
MIME-Version: 1.0
References: <20251218130117.907395-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20251218130117.907395-1-zhengbing.huang@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Thu, 18 Dec 2025 17:47:58 +0100
X-Gm-Features: AQt7F2qUFMbtCbDubYE8trFSq2TANRy79mZYdAJY-Yep41N0Oo9r_AVld7gIArQ
Message-ID: <CAGNP_+XBX=rmF_y25arQstkEFfqZnQRFWwXim79YibV+E0Xjpg@mail.gmail.com>
Subject: Re: [PATCH v2] drbd: only send P_PEERS_IN_SYNC for up to 4 MiB in
	resync progress
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: multipart/alternative; boundary="000000000000d22c6906463cb918"
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

--000000000000d22c6906463cb918
Content-Type: text/plain; charset="UTF-8"

Hi Zhengbing Huang,

Thanks for the contribution! I also considered this case but did not work
on any code to improve the behavior yet. I will look at your patch and
write again.

Thanks also for your recent RDMA patches. Philipp Reisner is aware of them
and will review them in due course.

Best regards,
Joel

--000000000000d22c6906463cb918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Zhengbing Huang,</div><div><br></div><div>Thanks f=
or the contribution! I also considered this case but did not work on any co=
de to improve the behavior yet. I will look at your patch and write again.<=
/div><div><br></div><div>Thanks also for your recent RDMA patches.=C2=A0Phi=
lipp Reisner=C2=A0is aware of them and will review them in due course.</div=
><div><br></div><div>Best regards,</div><div>Joel</div><div><br></div></div=
>

--000000000000d22c6906463cb918--
