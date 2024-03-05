Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 499488719B9
	for <lists+drbd-dev@lfdr.de>; Tue,  5 Mar 2024 10:40:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F2F22420319;
	Tue,  5 Mar 2024 10:40:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com
	[209.85.219.171])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6B8054202C6
	for <drbd-dev@lists.linbit.com>; Tue,  5 Mar 2024 10:40:07 +0100 (CET)
Received: by mail-yb1-f171.google.com with SMTP id
	3f1490d57ef6-dcbf82cdf05so5477858276.2
	for <drbd-dev@lists.linbit.com>; Tue, 05 Mar 2024 01:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1709631606;
	x=1710236406; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=epZZpCQ08Wke+nh++t1X7t9VgckTi+/6BTOZTBIdq6Y=;
	b=eh8mxttRspJ7CSCmUQI9eG6iTlITwwIqQdw1RKwGYRdKQWg0ea0K7ODHUs7MTsP1q0
	OUqZBBYYSLCoGDITvLnM+pTeS5HRPqySjkW82Uc+BPyRjlA1cAoOfxqtNfjLzNZgFfS8
	E62QOz10visk8j6T4e9E1CpkVoldwZi17c8YfzoVhsfOu6kPqJGXPBKlrRmNLEiEAmy/
	jwuxH3+ZA4TYqxtKkdUhH/EfZ2Yq2IzK5PUQaBuYNPjwtP2C+Dn2PoCDmSQyVF6hkKL4
	Sc6hFsErzHRcJHFQPWi9iygzxAdJI2XK7VtKSWOqzAXtMbKeXPsW5nWeA44CWemOIjqK
	OnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709631606; x=1710236406;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=epZZpCQ08Wke+nh++t1X7t9VgckTi+/6BTOZTBIdq6Y=;
	b=W7Pz9MpIcJCYsuD5I0zmF35FRu9YtByxLVtfGapz2/AtsbB2P3h/ndrhTARABXpval
	j/zqwV3fdipoKiQ6Oqh8cUrCvTd8zhQGhWfPzyFa0/c+gcTgNCpRPVhxH4wUnG0j0lmY
	ZzmEQXPlrxMXA486YU7pHW71/+Gwnr2m6GTg9ANRmuIYC8tp5GEfUclUR4hUzcNscR+V
	DDJd3DeLWpROInwlKC/sboqtBS2nnuCqA1INSVXyiw3TjOPRUWj044AerSOC6v4TGhbl
	s6nILJ11mHcQv7Org5nTE3lB24nG/VjKPQ4b59Jd8SPgJs2oG3C9IP6Gx2je39t2Zp7K
	5nJw==
X-Forwarded-Encrypted: i=1;
	AJvYcCWpM11lI3k6wk89tXx6suJdKLylwcc8tLvkPDjcAtOnco16jw02AdD2BpJredDcBECpTmZauhmFaupCuU4HFGJVPxhYLxZC3Qr2
X-Gm-Message-State: AOJu0YzfWgW04voFCALAXIt9pHM0JkgJr2+VwL7xab1vdzlnjLeJXW1p
	jdAMfiQZmp8HNM+kLMBW7Z4fhzMDN2HXVNkviSz4WNMfbRBzvKuAlhdZohSch6HFgqeCr0EV6yI
	frcB15QCNP3V7WLMMMMbcnr7BV4m8IVuUigOq0dou
X-Google-Smtp-Source: AGHT+IGj8sN1qs2du7u/sf6LL7Vm8gU82+4T5TaNsBgbICpftuyrF9gXqiO4N71B4imirDYr19iczOkN0ZcnWji+qoY=
X-Received: by 2002:a25:fc23:0:b0:dd0:39a0:a998 with SMTP id
	v35-20020a25fc23000000b00dd039a0a998mr4546185ybd.6.1709631606556;
	Tue, 05 Mar 2024 01:40:06 -0800 (PST)
MIME-Version: 1.0
References: <20240226103004.281412-1-hch@lst.de>
	<20240226103004.281412-11-hch@lst.de>
	<20240303151438.GB27512@lst.de>
	<CADGDV=XqJ_3biGx-rX0jMMue4-dTg=J8NjyHOU-Ufonv4QiJ-A@mail.gmail.com>
In-Reply-To: <CADGDV=XqJ_3biGx-rX0jMMue4-dTg=J8NjyHOU-Ufonv4QiJ-A@mail.gmail.com>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Tue, 5 Mar 2024 10:39:55 +0100
Message-ID: <CADGDV=WJWZHj89rebvNJ2BOhuqG=_Nr5S3+QXp6LTEGGKyzuKQ@mail.gmail.com>
Subject: Re: drbd queue limits conversion ping
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
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

Christoph,

we are fine with the queue limit conversion as you did it. Lars and I
reviewed it, and Christoph ran the tests. All fine.


On Mon, Mar 4, 2024 at 4:31=E2=80=AFPM Philipp Reisner
<philipp.reisner@linbit.com> wrote:
>
> Hi Christoph,
>
> thanks for the heads up, and sorry for not seeing it sooner. We test
> it overnight and review the patches tomorrow morning.
>
>
> On Sun, Mar 3, 2024 at 4:14=E2=80=AFPM Christoph Hellwig <hch@lst.de> wro=
te:
> >
> > Dear RDBD maintainers,
> >
> > can you start the review on the drbd queue limits conversion?
> > This is the only big chunk of the queue limits conversion we haven't
> > even started reviews on, and the merge window is closing soon.
> >
