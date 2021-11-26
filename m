Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BCA45E859
	for <lists+drbd-dev@lfdr.de>; Fri, 26 Nov 2021 08:16:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 537BB4203C3;
	Fri, 26 Nov 2021 08:16:44 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 75752420012
	for <drbd-dev@lists.linbit.com>; Fri, 26 Nov 2021 08:16:43 +0100 (CET)
Received: by mail-ed1-f49.google.com with SMTP id o20so34611329eds.10
	for <drbd-dev@lists.linbit.com>; Thu, 25 Nov 2021 23:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tszJl3nRrOBevJxO8tAz11+YJXfp2nVs65aqfAK7OeE=;
	b=ItPWoq8OOtt+ENwFjKXv6Iku99UMURX/FYI1SFTacqs2+qJFsbGKH0vsirTSwKeihA
	CGNdCPG7ZXoWPXT7VxgRV2IrjwYSB0/02/k+p/vunK7KRsy2OCgKdV5ja1LVKOTG8Dwm
	U2lVS65Uw8QfC1Zf1TLc2Pr5kN3qfER/WsJXq9iljPLBqY/FNPhhYIPXRl0j5q8pZUn8
	220vE19DkXjLXqTjIJj2Nd1m6WTvh3prxskaR/1QdHgpppgvtpOuU3TDyw+VDWO6dH/6
	U6+bQ7XlO2Cb8qyi0nRw8BXbUrBxLI8QyiIymMwXawKBQOSONFNSeXJNq3qpK8ZH2nVo
	+MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tszJl3nRrOBevJxO8tAz11+YJXfp2nVs65aqfAK7OeE=;
	b=FJDNiAYnRaRCodeNLlt0aJ/TnTysBX9lH6OHZqTsi5axbaILNkDByvQK4Lgq6QrtJp
	Nd9XrYlukRSEOPYftlRU5WThpaaGAspSKWnuX+Rc0JswoJ4wFHPxdxZckKamcv3n1aoK
	PlzY0nfZvn54W8s02qlrGL28Dv3OLqEZgIAlIYBnu1Jq9FSSNmvPrUasRakI7T1AXX3J
	a1gBJgRJUKmz9KlRximGmp9rYACB2S9KQZTqZlwe8ykj+AGdXqjfomYPXGrQ8aiHkA+C
	ZqEl/P1dzFw4e/+c8y9sREzzGV2rZ6SGyJ6eoep2QHFnHmV7sxikDQUp6uFGZwy33oqT
	LzeA==
X-Gm-Message-State: AOAM532OALUZwZApRcuo4PxI7HzJb5pSPEwo0n+SVaX8UEEm1ldK3bai
	xbZ1hHwU4GBbrRjOp/zeZCm4aQz2xrq8BpMOLbcsBanJ
X-Google-Smtp-Source: ABdhPJxr+mgQO/tGGWGLCgVfXM57lHwgCuStOtBvO+BkRLqSdhcZQgx/wmlYjWPThHxA/Amw5eONTAX4fSbMtwP8eVQ=
X-Received: by 2002:a05:6402:147:: with SMTP id
	s7mr45728798edu.8.1637911002824; 
	Thu, 25 Nov 2021 23:16:42 -0800 (PST)
MIME-Version: 1.0
References: <7df04f45-8746-e666-1a9d-a998f1ab1f91@gmail.com>
In-Reply-To: <7df04f45-8746-e666-1a9d-a998f1ab1f91@gmail.com>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Fri, 26 Nov 2021 08:16:32 +0100
Message-ID: <CAGNP_+WRohG5BMPvJUM1gAm8gOk=b1jn0_+TMr3FyqxnP+_EmA@mail.gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2] docs: admin-guide/blockdev: Remove
	digraph of node-states
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

> Joel, are you OK with this change going through the -doc tree?

Yes. This has my ack. Thanks!

Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
