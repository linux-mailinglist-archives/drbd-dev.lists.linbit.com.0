Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B8680B2B978
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Aug 2025 08:34:37 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C3BD516271E;
	Tue, 19 Aug 2025 08:34:23 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D96B7162251
	for <drbd-dev@lists.linbit.com>; Tue, 19 Aug 2025 08:34:18 +0200 (CEST)
Received: by mail-ed1-f45.google.com with SMTP id
	4fb4d7f45d1cf-6188b5b1f1cso5853502a12.0
	for <drbd-dev@lists.linbit.com>; Mon, 18 Aug 2025 23:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1755585258;
	x=1756190058; darn=lists.linbit.com; 
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date:message-id:reply-to;
	bh=w+qbXUaqnlCREb1jkeiprO3YVxUWMCIvqOyGpxCu9lc=;
	b=P+BSZE7NqEEufUF7/EmABPd/aYqX28X8qYONcO9GMszwML1xpEQ5MC2I+ZGj+RlA/k
	UiXp/W04hXbsrpZQqy/e+bJeOwZcfmDRWIPfDGpVIc6uCgyzuzcB1WVJq7uzeBEpyJ80
	bu32zRJ9S5E+mMtswcFaGmYYgcvpH392ycJL8P5Fl89uTCVzAHX94K2dEgtskIT0qAJm
	CeuPc2yPzkn7jTDxV0MGv5cccChGdOu1n+bkxgb3GVhRFsYZGo+jXs5iMgej+KH2I8fF
	idbsMwhdzMx3crOMeGRkDS9UyaFMHVzm7jJHRpyOgfq3N9JYj0Qbkgxdv3qHs9e+OhMD
	0G3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1755585258; x=1756190058;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=w+qbXUaqnlCREb1jkeiprO3YVxUWMCIvqOyGpxCu9lc=;
	b=sChkfWfVh0AbTXi82tcoC1J2op6tSjPniX7JYCBptkkMPBXjFRCs4h+1sfQomVclqm
	MkeDw3FRGVotAxChALjd6dSj79KBtOC4s4HKFUOqBpNeYwbqigAhGB9CmuHOioG0Z0z0
	V9J3rJhrUeUpkSymgAGc/+/+hlwdeXP1ynCK0Q1469SKKhYwBVuR0u/MnqDcTm1pf7Ya
	6GhPQJYASZCLrMkUzNg3zzRou0yfnpvjnbrokzUDeVtH1y5Itz98dUd93Y00eTz0kSPi
	khjTulPTyOCX3DYnsYwHycvLL3/7GlzlGOpXqCZ55kNTl1uKvmSe54tvzniZ+M4VWHr9
	bG3w==
X-Gm-Message-State: AOJu0YwlrlOJcckTXbmjdr4w9+M1l/HLMzbX2c1kwO+tIBHB3/jNg1J8
	ufS+JSLv4yncihqTTUWl3MRYyrXao5hFPobnmH7u0fz7hJzN4mlvXUOM+raN7dPdsk+Xf4DyxZY
	N61KpG5MGeXCFuVjwXzxUaRydTbCyEZEhB+DAPkdJhwMkTzspXE5epE2n6w==
X-Gm-Gg: ASbGnctIz7CnuBbiB3Mdr2DVGcbhwg1564WuvkMYWr/8AJgu5U1EEhkApTrQMZCJFTg
	50F6fkAGfAbLyYOX2bU2Z4iKmNT0QFJs3gSVsfQAiC5n1xMfEP7GZKwpiLlmlhdzlYSyp+bUawQ
	xLoUKpLHg5qFci1MvIiiHc2ID2AqLl2UfxpLJ69Aq9PcT1dLoNIB9hmgJX1QKyjnV+ld2IdUkik
	L2seCRmp9PqsXjkdYEA2QHfPkDNIpi3UlDp1w==
X-Google-Smtp-Source: AGHT+IE9urOBZzEG+7rtWo4PQrNkDwBKplrfKZd8ACBq3ETmMyEF/f7hG/SrucG+P3AG78hVlvuMoSCtlsDQk4c3nDg=
X-Received: by 2002:a05:6402:5c8:b0:618:6e15:d059 with SMTP id
	4fb4d7f45d1cf-61a7e72fd1bmr911946a12.21.1755585258241; Mon, 18 Aug 2025
	23:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250819054959.1168661-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20250819054959.1168661-1-zhengbing.huang@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Tue, 19 Aug 2025 08:34:07 +0200
X-Gm-Features: Ac12FXzN_nSt1CTfQOVJfaKgcpIOtPbtEO3ZaZ7C-SI9V0POxO6lf2XN-h30R8s
Message-ID: <CAGNP_+U7qQttcZ0aasL-fLxUz1Fk1cyhp6rGh1Qpx8g2xMQ9gg@mail.gmail.com>
Subject: Re: [PATCH] drbd: Fix the seq_num conversion error in got_OVResult()
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: multipart/alternative; boundary="000000000000b0d559063cb20bf8"
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

--000000000000b0d559063cb20bf8
Content-Type: text/plain; charset="UTF-8"

Thanks! Applied:
https://github.com/LINBIT/drbd/commit/455f64ae1ea7fa15c2d808260f9ba694f2ecea37

Joel

--000000000000b0d559063cb20bf8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Thanks! Applied:=C2=A0<a href=3D"htt=
ps://github.com/LINBIT/drbd/commit/455f64ae1ea7fa15c2d808260f9ba694f2ecea37=
">https://github.com/LINBIT/drbd/commit/455f64ae1ea7fa15c2d808260f9ba694f2e=
cea37</a></div><div><br></div><div>Joel</div><div><br></div></div><br></div=
>

--000000000000b0d559063cb20bf8--
