Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF891BB2A
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jun 2024 11:11:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 77EF04203C1;
	Fri, 28 Jun 2024 11:11:11 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
	[209.85.219.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D9F6E420167
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 11:11:04 +0200 (CEST)
Received: by mail-yb1-f179.google.com with SMTP id
	3f1490d57ef6-dfdb6122992so307276276.3
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2024 02:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1719565864;
	x=1720170664; darn=lists.linbit.com; 
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=RaXZWXFZvPD8Y48T6qvfUw0tQZv1JZnkPv5i1zZJki0=;
	b=oyt6Q39iE5PSZGgoBi594/uIYLviI1lI6jmMrd1Sl1tDALGATgzPP0cKnX02qs1yfY
	yu8gGGcuxZeK5xfyA1mIaqWTNZaWJ+RKrouaqOFZguBCiGThIlZrzwVIJ8zy/Z6eIJxK
	dDepbezhC4Spep3bfif1LWHtE7wK9LqfVrnkJ/P2D2bIKjbxhRB8B45Kts8eZu9MZXYW
	/iHND5B3n1ick7YsJCZTgYx26zQvwdgImREv5qRqk1csHNbbqkMlDEZUa8nETpCkZ7Gy
	JBHbpUPIV5ojBxnBPkTTF4o6o/FipC2gW8+aU+uAqa8+wEquK7Sj8LN+9RNznhlfywsj
	ENtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1719565864; x=1720170664;
	h=content-transfer-encoding:cc:to:subject:message-id:date:from
	:in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=RaXZWXFZvPD8Y48T6qvfUw0tQZv1JZnkPv5i1zZJki0=;
	b=LdCFC6MQ/7uJpspYFtC1LsqxexXbmk05+BjdggBYhSruZioeQTDu46vjDOkpLhx3tL
	2H0aMDwTLIrZDB0LBxLp7k49iJRotEcKpOl0ZYGbUm4guDEbp3kDjnKN9lI7cVS5oOaM
	Qn3cAYxJgzxwRy3E8ovehk6IPqXhhu45x6aosKyhxAhOsgECJit7xOD5EoMVdLFSi/v4
	2D7OaoYF/yEvNRKIhGcZNptljU9gWTSAu5Mks+I45WnXq2aXqlcR7ExOFnPiXi+fF2eB
	pAYKNEqNwyWVO3C1FevSTyu/OXQnay2Hsiatmpiah0AwBQQ+KCaPyOqXKjHFzERcI0MF
	+p5A==
X-Gm-Message-State: AOJu0YxivBxW6aEKxLL9zObVJijNqCWp0jek2dZmER8o4jti81OAjjKA
	+Vmf7X2DpJNTTpzWuygLZpinJ6Yp/aJuWq3Pcmfn1KkpILtdHcxlY2XCSx1u7NJALlaVqXVItRJ
	7Vw2PkYJGBhJvo3OjPiZGqy6pvfamOm0X8PsA6fWhNwRtAZqF3bo=
X-Google-Smtp-Source: AGHT+IGf4rq2HZWiccm0z1Yc9M5ZixIj3Bv9yJlRx8QclvDjqJ6O0oHBq7wEkZ/irMHQ2VnlYTzajeL5PF6xA8MdkAw=
X-Received: by 2002:a5b:78a:0:b0:dff:320f:edca with SMTP id
	3f1490d57ef6-e0300f8828cmr15643508276.18.1719565863937; Fri, 28 Jun 2024
	02:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
In-Reply-To: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri, 28 Jun 2024 11:10:52 +0200
Message-ID: <CADGDV=Xo6Z_K2R8vB7+7_jf0U_im0Nmy-xQ36AYh59qi45EvAQ@mail.gmail.com>
Subject: Re: [PATCH 01/11] drbd_nl: dont allow detating to be inttrupted in
	waiting D_DETACHING to DISKLESS
To: "zhengbing.huang" <zhengbing.huang@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: Dongsheng Yang <dongsheng.yang@easystack.cn>, drbd-dev@lists.linbit.com
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

Hello Dongsheng,

First of all, thanks for contributing patches to us.
Please find my reply on the patch below the quote:

On Mon, Jun 24, 2024 at 7:52=E2=80=AFAM zhengbing.huang
<zhengbing.huang@easystack.cn> wrote:
>
> From: Dongsheng Yang <dongsheng.yang@easystack.cn>
>
> In our network failure and drbd down testing, we found warning in dmesg a=
nd drbd down process into D state:
>
> "kernel: drbd /unregistered/ramtest3/0 drbd103: ASSERTION device->disk_st=
ate[NOW] =3D=3D D_FAILED || device->disk_state[NOW] =3D=3D D_DETACHING FAIL=
ED in go_diskless"
>
> the problem is the wait_event is inttruptable, it could be intrupted by s=
ignal and call drbd_cleanup_device before go_diskless()
>

In this case, I suggest improving the expression in the assertion.
Improving an assertion can also mean removing that assertion.

The wait_event_interruptible() is there for a reason. Think of a
backing disk that behaves like a tar pit=E2=80=94a backing device that no
longer finishes IO requests. You want a way to interrupt the drbdsetup
waiting in detach.

PS: A bit more elaborative commit messages are welcome.

best regards,
 Philipp
