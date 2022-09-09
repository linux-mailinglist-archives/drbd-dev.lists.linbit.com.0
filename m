Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 721655B3129
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Sep 2022 10:00:03 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5673F4210E0;
	Fri,  9 Sep 2022 10:00:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC7A9420667
	for <drbd-dev@lists.linbit.com>; Fri,  9 Sep 2022 09:59:55 +0200 (CEST)
Received: by mail-ed1-f50.google.com with SMTP id 29so1319812edv.2
	for <drbd-dev@lists.linbit.com>; Fri, 09 Sep 2022 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date;
	bh=xwh7ipVFeRG2maEQhh2XmD2BdiQ8D+77EexNPIqNDdM=;
	b=cML12tI7MP33vDuwXWTMOx6vqzvOTfPUR/wiKg6TMu0ZeGvhjvC9Bp+f2uMd6Oo8CM
	PeWvfwDeOQUAg2fZyFot2Q+Oif1wZD+xOQIX5cLXQg/k+md/uWcmWVuQFVKZ4ytVTuV3
	eChfVlkSSpdUKenprOWwfwBeo0h+tReW2IZRYgD9HW3vOX8WAhIozcjeaN3y7wN/gQ+q
	gx8F6zKMjOFZnojxnj7RrClUDUpP5u7/iJXvOHwZ3X7wrVIdfleFuCWKPKPv6Fsl5Thv
	TumAxv81IW2sm7nbLne+4yVApCrbKvtZ2Q3rFxlq4MPJgK+TzcSW6xUGn237Lq8lYLH9
	FbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date;
	bh=xwh7ipVFeRG2maEQhh2XmD2BdiQ8D+77EexNPIqNDdM=;
	b=IpcwK1tPAAKq17usqY5MHSsCkfKKrMHUaNxb78JkTRq3xn3rLBn4Yp7mzfiqyE16lb
	+BWSUfh6Fsom/PkVG2DWT7OH8R23+jEsPVOSxVqyoXiyzo8NF0ZhrHz40VKELzmULdHu
	PzD8BgIS5AFUvn8Rl8R4LAthKHDRCFb97pXT7HyfvLYnlTynA1i8mLmRw3iAMYbvQD2u
	hhocJRhwdSnaK8oqaoDenXlbBKarlawh8Wf3OWio1F05+fsEMNOn0dx3kblbIcwmjIQ1
	Z3JytyTudKjTOLIzNuR3ArB7c6ATv2V5eOWzC17hJu7gjhtmD5nIl5nHnxohrr1zWHzI
	qSJQ==
X-Gm-Message-State: ACgBeo3VRXGNVRrDpuRwApEhYctpSz8gDh2RvTJ3D9VjVTOPnHrqgQ15
	/ZcOT8y/Ac1if1gmH/rJoU2WEA5YDXisx1e91mWRpsf5
X-Google-Smtp-Source: AA6agR61V2b+K4vX7/pXy8+yVamTFKy0Omm5+ieDeHH017F5oRlktMdduOEKEhjL9Y9+fU6KmUJ93M9GKiR1sKWcws0=
X-Received: by 2002:a05:6402:500d:b0:440:9bc5:d0c1 with SMTP id
	p13-20020a056402500d00b004409bc5d0c1mr10420668eda.202.1662710395141;
	Fri, 09 Sep 2022 00:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220908211337.17090-1-veggiemike@sourceruckus.org>
	<20220908211337.17090-4-veggiemike@sourceruckus.org>
In-Reply-To: <20220908211337.17090-4-veggiemike@sourceruckus.org>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Fri, 9 Sep 2022 09:59:44 +0200
Message-ID: <CAGNP_+UdQatEfaDSpDNTifT9h4AwKe5L1_PpSZ_rffk-viqtiw@mail.gmail.com>
To: Michael D Labriola <veggiemike@sourceruckus.org>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 3/3] drbd: use bio_alloc_clone() instead of
	bio_clone_fast()
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

Hi Michael,

I believe Christoph has already started work on this one, so I'm
copying him in so that you can discuss it.

Thanks,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
