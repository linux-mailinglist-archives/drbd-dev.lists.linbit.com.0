Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE603B0124
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Jun 2021 12:17:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6D89E4205C9;
	Tue, 22 Jun 2021 12:17:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
	[209.85.218.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AA71242032D
	for <drbd-dev@lists.linbit.com>; Tue, 22 Jun 2021 11:21:39 +0200 (CEST)
Received: by mail-ej1-f53.google.com with SMTP id nb6so33307716ejc.10
	for <drbd-dev@lists.linbit.com>; Tue, 22 Jun 2021 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J+TuWtRh0cwZs6fqId6IVjATkhIgNS1OQt/TCJxwn2o=;
	b=l+bG+WDle7ie4xDb8Alrf1BvsVOgjrifj94F6fMC0ERFxtvvmcgbxkTdDT2xFHQJAH
	c1b5oyGRZ6NPQ20P1YvzLgvAPkazBs5FCLgHbzDFtnm+qrHI4j/UvIzaJlEw9RCDjuLK
	vxQIBeF8FAyB2jUu5gBA8F9MtG7pEfUfNwOr3Rvh+hc/vOFnu+ajWcTpd0E5rlJHX0Ri
	jKP1ApE1tE1sQQWuKumy9WmWQPfgyL+1MVkY748v4Zh1HzMksNaIQkwtAPn+IPqx0r4h
	bCIDmGWNGIWtiQRT8HmI8N1TvDfpIchuvQw7KLQ3HfKXCVBHg7llkaOHnnqGDdRtWJQ8
	AtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J+TuWtRh0cwZs6fqId6IVjATkhIgNS1OQt/TCJxwn2o=;
	b=pOdU0aU4dp4+dZXSesTbZptFou6bqkUSDRtShA94Ia7XNruMwQiBoaeMJUOD+dc7a5
	wq0IJtBGtekyr/IuSAnC5ctl4UkEUZYAUyK+3rDoJCsZGVHXjKoy50YOFeHhA0JLVhoH
	0v9AZnmyE0kg5Lo+Ga9Wk0DyxN6OjdlkEI+fB/oODpXNVEBN2z6Y79XEw0NDlqkOkyZZ
	90V4gnPtpF3WJI6hI9Re5H8xqiSBI4XpjtRNZaUCh9k/35giAbtSvEJZNuvHlGDzGc9C
	ja0NXdEAXMTVSaZJ74ff3M2gRH0nDvNG5nHwaVGxsXAne1knpdofDiYBDKwnRZbWIwlO
	jQYg==
X-Gm-Message-State: AOAM531Pa6ygv8MsvaRJHsT4oZe3Rzj9o5wfXVn5YXT5qDAIUl1DS6Va
	JEtPR8wmqblpIVWdFvjiEb6J+obdSudx/euktE253ZKL
X-Google-Smtp-Source: ABdhPJxYtjAXNoTNiCzh2VHZdmERzQR29g7Fkz/v14MjVs8B8Ev74Ap/GjfxnKLv3cxPwKhizKh5DnDYm2jfAYJ20ds=
X-Received: by 2002:a17:906:5053:: with SMTP id
	e19mr2989981ejk.251.1624353699208; 
	Tue, 22 Jun 2021 02:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAMgLiBtVkgEaTiY6UaoYcimywHmurz6-yETyKyDUdycgAOzkOA@mail.gmail.com>
In-Reply-To: <CAMgLiBtVkgEaTiY6UaoYcimywHmurz6-yETyKyDUdycgAOzkOA@mail.gmail.com>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Tue, 22 Jun 2021 11:21:28 +0200
Message-ID: <CAGNP_+XoT9k3UALO7Wakg286w8HvUcN2AtZYuzaO480e8P1KSg@mail.gmail.com>
To: fei luo <morphyluo@gmail.com>
X-Mailman-Approved-At: Tue, 22 Jun 2021 12:17:45 +0200
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] Fix drbd adding volume dynamically problem
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

Hi,

This sounds similar to an issue that we are already aware of. Are you
using Linstor and a thin-provisioned backing pool perhaps?

This is not that high on our priorities because it is an unusual
use-case. Multiple volumes are used to form a consistency group.
Generally when you need a consistency group, you know at the point
when you create the volumes, so you create all the volumes at once. If
I have understood correctly, this issue only occurs when you add a
volume to a resource which is already up. What is your use-case where
you need to do this?

I have not looked at the patch in detail yet.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
