Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2353851F85B
	for <lists+drbd-dev@lfdr.de>; Mon,  9 May 2022 11:42:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EF190420620;
	Mon,  9 May 2022 11:42:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
	[209.85.218.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 42A42420600
	for <drbd-dev@lists.linbit.com>; Mon,  9 May 2022 11:42:47 +0200 (CEST)
Received: by mail-ej1-f47.google.com with SMTP id j6so25638263ejc.13
	for <drbd-dev@lists.linbit.com>; Mon, 09 May 2022 02:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3z4Q/LcJ0TqcI9eW5ZVxpQZZRJ+sqzz8TEjMXpUaV9Y=;
	b=kc4kDtL+NDiESPykBCaJGmjjS/rE565/fVphPFKIUqjyELUGsn/v2vxvwazlrXZXgk
	l0tdoI1qkvpGv1LEydbZW7yzNVaM+21+C6Uuo33vqytR5OsSC1GiQVUZXuVgcFaa15XK
	ns8FVlZTZ1Du7xD4FRd4FuQsBjy5oFE+3gA5WUoD8RH4peZmIz9ufnIk14pTX0pv01lx
	YQbfn2mDvxd8v4WOhYSF6Lwz461H6vT74qU3vdJJg1PU+jgmJ17TV55I6fMYn6OEN9Ye
	XfYyUwuZ3ZDDIGzVfSWBk/5OvC6YuSoqQDFPXrAWEOFc0jESTwZDzcSNjhIvrHQkZRtt
	ZYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3z4Q/LcJ0TqcI9eW5ZVxpQZZRJ+sqzz8TEjMXpUaV9Y=;
	b=rLa/FPHP4TKqm3TAyQ24mrYdRoA2nclz1/9r+XlBbsX2DburKAsCMoxe40nB05rXlQ
	lQ5PzMSBnddbUYZB8r1VHmzUuNKT8YJajy8wRENM8Doj/Bzfcfw4hIaDmlkLQKYTmFre
	gmV3S65TDKMIr0biG8v9jmzMeHhryXiR9zU/xq9GfrbIrZ4ySlWOAVVKQcATWZJCpnzx
	jf6fK5ymvyK1UEI2Px5IRvxTM/OLT5tEtWX6GaCVrLqrWLy3fzImi8TGF6pbi0rAqonA
	ofJ0No3Ril/Rg6dafl+MgQNCofv4KaeaozlANctuH6uOdOlC6YP6e9jpTqP6+zv7SxOT
	6gMg==
X-Gm-Message-State: AOAM530ok7k2Upa2S8OCPi4GbFaJVhh/dCu07qMeWBLWpXXCJ8StoM4a
	inHsPjg84ckb8mffNKjuxeUbeQnzbXfbiP/Dj3xL1Z5Y
X-Google-Smtp-Source: ABdhPJzKUmNu4cl42ak286swxEfVGFt8lK36Pmu7r+tn2S2qm7JyUfTaIC2vpUeNmsFnkpQOEVh8tXSoOO8WnLdNA2o=
X-Received: by 2002:a17:907:3e8c:b0:6f4:4fdb:6f24 with SMTP id
	hs12-20020a1709073e8c00b006f44fdb6f24mr13798749ejc.44.1652089367654;
	Mon, 09 May 2022 02:42:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220507082519.1968685-1-rui.xu@easystack.cn>
In-Reply-To: <20220507082519.1968685-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Mon, 9 May 2022 11:42:37 +0200
Message-ID: <CAGNP_+UOUftWd956zhi1C_SrHB2HWk5i7vOY_foe32-ysOuRGg@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: change the variable ov_left to atomic
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

Applied as
https://github.com/LINBIT/drbd/commit/9125d60aef3ad229c4dac5141e6075bacb36bf92

Thanks!
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
