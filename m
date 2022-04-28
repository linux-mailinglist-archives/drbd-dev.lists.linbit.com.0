Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 10262512F35
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Apr 2022 10:59:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C17414205A5;
	Thu, 28 Apr 2022 10:59:54 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
	[209.85.208.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 94D434201DC
	for <drbd-dev@lists.linbit.com>; Thu, 28 Apr 2022 10:59:53 +0200 (CEST)
Received: by mail-ed1-f41.google.com with SMTP id e23so4713451eda.11
	for <drbd-dev@lists.linbit.com>; Thu, 28 Apr 2022 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2gphKUheRzuJt4ttmPI3TiHaXeNq0vmVkpoBT8Z0L4Y=;
	b=tgCnCtkE2knLi2FJQ6cEOKyMLQ+Udr7BuT1bV3ARVpiMDZTyK+G/PXPn0c+3wsoBSb
	iwoC3zXTidUCFzQjGCQrFz5AIxvaJcV07AVgjJz/kYLhejiJH3NdTZTKATT+rIPRTHn9
	6GC8z9USLGMVNtVJLv41h6h/QJtwg3oCy4MYTm5ubjPtAgTQZElNW3MTWZxQbwOFCIaN
	fU7xjd4JupoluFV8QLfa34FqPWTi09S6fohUi5bkIMmJkWrEPcQWBRdxJRmLyQHOPQTX
	WFsmYY55lS8mS1VvTUzlWNVJ7FlKrCGj2PPy6tqlxgIwjBaUhyMPxoE6ir/HjozU7R9p
	Up9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2gphKUheRzuJt4ttmPI3TiHaXeNq0vmVkpoBT8Z0L4Y=;
	b=54+zRqEoY5xDoXb8KjH1w1fqjvB/BdZ+BJJOwXs7y2hxJu7xeVRc2UgfPYhgSf+V55
	kqwUHG3GTkFdIJjjfFWIVmeuB/Tbg+ksfvtrJ9Sl2cy0BR46Gubx6VOah+0zlhk4qy7c
	ihSjbGqq2b0d8/cxBaCDHNDK2X236WTtkVg9fB7fr00UYyxPyI4Z0JdxrKdK8HNG46fL
	x30+wmPgab0BFl6HXwEO+6o09AKCVPdOfUIvx3+0QlxaT+nRsqJDLisY0PW9Agzp9a/g
	opvvxkoMiNn3Cb+kGfslpxyfQgS0V3eo9HfQgOTYqZ9u1c4Ev2tz8ZTSVliN2IwY9cT7
	yE0g==
X-Gm-Message-State: AOAM533lINNVShyL6Oi65x3pkuXxd3Y9D3RVpjzvcK7xAN717sh8tqlO
	CGbew2JHK4IYAfaj45NIcJz0vSj0Hp8Z1wo+wijp1W2I
X-Google-Smtp-Source: ABdhPJxWleEAtSRSBCU+5sVj48X3U+0pCkI9Dbhdep0zydNaj9LuL6pKSiNPyoGr+e/GM6A0F3owfvyeOwV6vyE+d/w=
X-Received: by 2002:a05:6402:1850:b0:425:f2e2:2594 with SMTP id
	v16-20020a056402185000b00425f2e22594mr17720933edy.3.1651136393131;
	Thu, 28 Apr 2022 01:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220426080903.1831211-1-rui.xu@easystack.cn>
In-Reply-To: <20220426080903.1831211-1-rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Thu, 28 Apr 2022 09:59:42 +0100
Message-ID: <CAGNP_+W2ARFLdM1a8UNibar_Xu+j4bd8WVwLp88-J8PnivVNEw@mail.gmail.com>
To: Rui Xu <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH v2] drbd: fix a race of drbd_free_peer_req
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

Applied as https://github.com/LINBIT/drbd/commit/254f91494b5fa2e30b0aa816ea573edb3babac99

Thanks!
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
