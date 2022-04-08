Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C60494F90AE
	for <lists+drbd-dev@lfdr.de>; Fri,  8 Apr 2022 10:23:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9C7B84201AE;
	Fri,  8 Apr 2022 10:23:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
	[209.85.218.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1880A420065
	for <drbd-dev@lists.linbit.com>; Fri,  8 Apr 2022 10:23:45 +0200 (CEST)
Received: by mail-ej1-f50.google.com with SMTP id n6so15719422ejc.13
	for <drbd-dev@lists.linbit.com>; Fri, 08 Apr 2022 01:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=quc+L6LVYFLCMaxpEl4wlMrsRrL606QVVGdFg0DAltQ=;
	b=MfAiN1y8roJuFeIZHy6OG9LN0yFh5sM3REafsjhOiNopdIrr2Tlzix3EprrLwN/+Em
	woGzm92CahS8gZVKQq1RY0GqOrEj4sAffHoo46JKJBdlEdEOwS77l7VFt+18m2z+33Ci
	DNzgDqfjuYh7kkiWjhd/M4/r6MIlnz+FttlO8YxHhr7irdk3llDpGaZ3KQUyG8AyA3qa
	iXtPL+MUTCDyUTtu5YNsnQ294KrUk4DR9ULZoqMvqWV2U7KvCupTSYv1zupwbgqY5aVm
	WotggfkdCBhOpNTkvaIowTAebAVs0vUDR5oAJG5IspPuK3U9M7TNTR9i2xZFJDU1WbFD
	Rm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=quc+L6LVYFLCMaxpEl4wlMrsRrL606QVVGdFg0DAltQ=;
	b=t9cx7DfLa+X46RSB+cSEKlbW7BabynRR/BFOkn6S7jjFVzfZ58Uo3D7F5vPFhtRnxA
	V7V3HiFkJjyEFx1LDkM3wRsUX4HzTbFoJgRAuwP2dfLEG5yoqAit9nswbQQDFOIHOvfQ
	aD8dKtYJUP0bXcIllYUy1OXoYnY+iOoQI6TiqZvwHkrvuZaiZzQKwf5z6QClofD5cz2p
	HKx49sqJqRGXrJWJiKYPyH876RbP6MqWTJ2kRSZV8qKkqH1d1BSv1fcqXOTOvWPxailv
	+X0VDgRVAuSKMT4ALUNeg6xPkl8A++IvH/FNHGKNzoHMZIHc7Z+Yq9k5EiL/dsJdX1hg
	cqNA==
X-Gm-Message-State: AOAM532Sq9dcSiQSO5zCiLd+hjwFI+J8bvkArwV76pqtCTNtwet8cFtd
	a83IXD2GTCs3uCmV9MT2BqKuJry0YcpUZd/IwMU1l4V+1fS5Gw==
X-Google-Smtp-Source: ABdhPJwkZ6NWx1YbnIDcusZ4dkQN10KkaEd3G/qw304BrIrBE36Pll5xLn3DlzxesXDU1Ha16g32Mkd69gMaDKQd5aA=
X-Received: by 2002:a17:907:1c0b:b0:6e7:f58a:9b8e with SMTP id
	nc11-20020a1709071c0b00b006e7f58a9b8emr17703379ejc.438.1649406225313;
	Fri, 08 Apr 2022 01:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220302123523.471277-1-rui.xu@easystack.cn>
	<ANUANAAVIdwn*FrX7b*E8aoA.3.1648177379860.Hmail.rui.xu@easystack.cn>
	<CAGNP_+U9ex9RjftsSFOcXmhTYs4uXGH+OKskLqUjzARozdEc_w@mail.gmail.com>
In-Reply-To: <CAGNP_+U9ex9RjftsSFOcXmhTYs4uXGH+OKskLqUjzARozdEc_w@mail.gmail.com>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Fri, 8 Apr 2022 10:23:34 +0200
Message-ID: <CAGNP_+Wmd20E3MBkxsOnyE3Y67zmfUnSqP1vSAHPMap9U-AEVg@mail.gmail.com>
To: Xu Rui <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd:do not wait for negotiation result with
	unconnected peer
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

Thanks for this patch! It has been applied in a slightly simplified form as:
https://github.com/LINBIT/drbd/commit/aea83b266ba9a3c46ea773a12f57b2fb6dff15a4

Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
