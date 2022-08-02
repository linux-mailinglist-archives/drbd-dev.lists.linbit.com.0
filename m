Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 23BE35879C8
	for <lists+drbd-dev@lfdr.de>; Tue,  2 Aug 2022 11:23:38 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0619042066B;
	Tue,  2 Aug 2022 11:23:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
	[209.85.218.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B707D4203DF
	for <drbd-dev@lists.linbit.com>; Tue,  2 Aug 2022 11:23:35 +0200 (CEST)
Received: by mail-ej1-f51.google.com with SMTP id a7so11899751ejp.2
	for <drbd-dev@lists.linbit.com>; Tue, 02 Aug 2022 02:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=u0oOnvBi8bUi6r/yBymCsYU3tJP3AbfdkPnocyOzI1w=;
	b=dNquckXKkrOUn28pC7DdToDnZkOZudg5xUof9WXMPXHJFK12KTEIrRAlLKanY0F1b3
	xZTOaWLmTqXNciVIt+whjmpjI5esoQmd7MOOUdHLSpCTUbCtWpxmgR0RtCQfjuwAmD9p
	U2zkl8f4aP4ojKCa9UoP0s7CzAn4zZFN7IMsnSt6JBtcsfVlGizlzxHLpaHBFutWegJk
	7HbkMiCwAVkyxs1iV1LTVNh9iwrsEZvQ9mLrR3dQGi4pyo5WGg2de3pVRUXwR2hJmfIV
	Pg65PnPtyqSbrm1f4Ielm3aomjzQ4uqTsmX08LPHoYSDSu3KUZW6Wn3GJzxf2l/qoRgl
	sfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=u0oOnvBi8bUi6r/yBymCsYU3tJP3AbfdkPnocyOzI1w=;
	b=zgzvWawAn8XlI1BpNrL6QxX9So+yeaF8zep3pYL0+lutsqh+UNBndCbMEaaSN8Xv72
	FYsuh/SAwMCQ0YJk/zJD2OuCvgltVD9Y6gPOdzrZR0oRxP7xBE8RQlO7MYsBTqx/OtTr
	W3aBL/QGvJyLHAk1RV2DZLrgVqZ5Hr5AyYmB9PQLxIUHtFq/3H7aU/nfDVIaL7B6RWy1
	Cgw1mpTueknIpBC1UC2gEF3LyNdzjI+c2C2P8P1G3VJczl7HG2QmIGN6m1IBHPcW71nr
	8giF08yg0HpbylyYm75BK59E8W2rU1vo7nvSLH+00041jnBaHOB/bDayiOig1jDpH2Hp
	Z7XA==
X-Gm-Message-State: ACgBeo0B0yhQa/pBtTGkPsc4Cli34rvx+W2jzvLi/c5Hv3WdfvdgRQp/
	aTMqWdYviOUp+bF4wjLg/4tQefch44XAhfUknGLT/+LF
X-Google-Smtp-Source: AA6agR5UiOfDylnGn3RbctxO8JCJv361ylUj2CgMImNxmQ2fgbSpi6xkcpBfY9A1i64yHGfp+Gb/4qfAxbt6CvsiuQ4=
X-Received: by 2002:a17:907:3f8f:b0:730:9367:f9c2 with SMTP id
	hr15-20020a1709073f8f00b007309367f9c2mr5320596ejc.438.1659432215338;
	Tue, 02 Aug 2022 02:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <AL*AywBKImqCcBd6mgBHvKqI.1.1657802179974.Hmail.rui.xu@easystack.cn>
In-Reply-To: <AL*AywBKImqCcBd6mgBHvKqI.1.1657802179974.Hmail.rui.xu@easystack.cn>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Tue, 2 Aug 2022 11:23:24 +0200
Message-ID: <CAGNP_+WQe2bnEPOTNLD-bLWM-K78YOppb+wArQxuwD3oMU0OJQ@mail.gmail.com>
To: "rui.xu" <rui.xu@easystack.cn>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] drbd: a question of uuid compare
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

Hi Xu,

Commit 300bfb7ba follows after commit 33600a4632f2. They are both
intended to improve the same scenario. That scenario is described in
the commit message for 33600a4632f2. In short, 300bfb7ba prevents an
unnecessary resync in a case where the connection was lost and
regained, but no data was written in between.

You have found a scenario that is broken by this change. We need to
find a solution that works in both scenarios. Patches welcome.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
