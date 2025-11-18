Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C4BC95F60
	for <lists+drbd-dev@lfdr.de>; Mon, 01 Dec 2025 08:09:00 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1A0651630D0;
	Mon,  1 Dec 2025 08:08:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E9B521608F4
	for <drbd-dev@lists.linbit.com>; Tue, 18 Nov 2025 10:09:39 +0100 (CET)
Received: by mail-lf1-f52.google.com with SMTP id
	2adb3069b0e04-591c9934e0cso7065387e87.0
	for <drbd-dev@lists.linbit.com>; Tue, 18 Nov 2025 01:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1763456979; x=1764061779;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=YoHE8hp2i1KX2JI1FOp1afYS6Cs1Km7WJ0bcBoqu2UE=;
	b=A8etl2cLiKNEU/8olrg4SOW+LwdMx8XgiKWHo8yKVAQq2XZJh+lR3HbEunVY5W3xrz
	geN8Sw2o2QTIGWYi6SUJfRCP/mIFM+USuBl6W7BiPOz5Q93LGGcffSzWAt1LQf4RAhwU
	IW9ClgnHoaKsie4bn6aIenepqvJ9p6BjnrFFt3L/o1vZux3h3YqX5iS6xwnyd6sgPXu+
	K4VcBUR5GIPfosM8BA5HD8RDEGN0E/PlNg9dFkc5Gly6IlkzOxTSKhOJQp/WCdbOOsVy
	5c9rDi7NelEP6J8MCUP94x/revt4v/cv2CLEcyNSd7RUPfBfx0+FfyPxfF2FGnqv0PfI
	CXfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1763456979; x=1764061779;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=YoHE8hp2i1KX2JI1FOp1afYS6Cs1Km7WJ0bcBoqu2UE=;
	b=IZMIUcCNTCf4VnKKuKfJoVfROQMVlm5l9TGD0GPs2zq6yPwWGe0bDNuRcIiSAw0O++
	gdIlFHzddl47E53JYUqdih/e/ekskwPGmLXWSvzt/Wn88rn2PyUvFVKGLoBbkFV4FHBM
	fMlRszPSQU/iYgyZpUxuemWXm0/6Vzkzn63PjWo6YYasoB5aPRld+7rluE8SWTc33uYq
	sZ7IUdw3uAmzpdsFFZIuN8fuGP4obmUDlJZ4BTgITOMO/cgEJ3+qrsMBbDtZSVSnnTL4
	16gyWHSJTg0LYPCL9y073tneqB/2Ly84OylLv2N4hd2ResQh642bhz1OO0L1MtecQl8s
	khSQ==
X-Forwarded-Encrypted: i=1;
	AJvYcCU9liDPZYhnr02TBl4aSwwd/LWSGiQsB2oDLgM3aY88KdX5VjLFlEkdQ0CSX3Zd3pdBVN4o6laLIQ==@lists.linbit.com
X-Gm-Message-State: AOJu0Yz6MnwGRp6xDKeztH6O9Kv/snt6C7Rmm5SzI9q+SDPyS1e39oRS
	wHNbOFQDoXmWwlWOiLomxNbWdfMVuVNbWb/ftQXJg5luv6nmlNQeSZ4+B5L2VMbOeR1cnNVmzWF
	YuEZLmmcGjCqSGBRj0wMCVtVWj3zL1to=
X-Gm-Gg: ASbGncuxP8UH79RjVDI4rwTvdgLhr3+2TnmrwngQ/TApOSj1WItwRZ4cYDl7QCrSbpz
	gh0JB6593/Kri6idn3U+wKisOV6QyJ+EjgszoLr6TiRxGW3ZbDdb+5AsjjqIPfGq0ndusiJYt3U
	K1vSEE8GKQlGESgyIx20Hd9nt30CrslGSkrAHSTW/9e8MAKAXDi3QXfdHjsaqBBdqjN1RNQCLdo
	dy31h67K+2nW/BrJfLDiyMLoneH1vpOFYwY7F6P9KuuOAKxkcj5EoSUIn0pg5u5lDs9J/EtgsAf
	wPcGQcNkgX0i+7t9j+NN6esBInjLiFCThdJoOZM=
X-Google-Smtp-Source: AGHT+IE/uU2RhskqEwCPV5Xh65lsa6xSHbo8Buss+DjCMC8KyUkuat+m6Bi999yJJzhXnwmrobG75Ra704tETyHlW38=
X-Received: by 2002:a05:6512:3b0d:b0:594:5685:94ce with SMTP id
	2adb3069b0e04-59584213a5dmr5447072e87.48.1763456978696; Tue, 18 Nov 2025
	01:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20251117172557.355797-1-hsukrut3@gmail.com>
	<aRwNfiIWUVl5G0eX@infradead.org>
In-Reply-To: <aRwNfiIWUVl5G0eX@infradead.org>
From: sukrut heroorkar <hsukrut3@gmail.com>
Date: Tue, 18 Nov 2025 14:39:26 +0530
X-Gm-Features: AWmQ_bmSzlm8tpSKHFvMtfS5Kpi5L2PYKuN0eQgo0wyXv88tq_m9EqbpBxWv0QQ
Message-ID: <CAHCkknrzdT1NkD1EGMPBGkamrg8fJY7Xu1GX6WjjPhquCyGQrg@mail.gmail.com>
Subject: Re: [PATCH] drbd: add missing kernel-doc for peer_device parameter
To: Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 01 Dec 2025 08:07:50 +0100
Cc: Jens Axboe <axboe@kernel.dk>, david.hunter.linux@gmail.com,
	Philipp Reisner <philipp.reisner@linbit.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, shuah@kernel.org,
	"open list:DRBD DRIVER" <drbd-dev@lists.linbit.com>
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

On Tue, Nov 18, 2025 at 11:39=E2=80=AFAM Christoph Hellwig <hch@infradead.o=
rg> wrote:
>
> On Mon, Nov 17, 2025 at 10:55:56PM +0530, Sukrut Heroorkar wrote:
> > W=3D1 build warns that peer_device is undocumented in the bitmap I/O
> > handlers. This parameter was introduced in commit 8164dd6c8ae1
> > ("drbd: Add peer device parameter to whole-bitmap I/O handlers"), but
> > the kernel-doc was not updated.
> >
> > Add the missing @peer_device entry.
>
> Or just make it a non-kerneldoc comment as it doesn't document an
> external API to start with.
>
Thank you. I have sent another patch adhering to this suggestion.
