Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C835B310A
	for <lists+drbd-dev@lfdr.de>; Fri,  9 Sep 2022 09:57:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A3AAF4210D5;
	Fri,  9 Sep 2022 09:57:41 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9251D420667
	for <drbd-dev@lists.linbit.com>; Fri,  9 Sep 2022 09:57:34 +0200 (CEST)
Received: by mail-ed1-f46.google.com with SMTP id q21so1273147edc.9
	for <drbd-dev@lists.linbit.com>; Fri, 09 Sep 2022 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:from:to:cc:subject:date;
	bh=g5aNKRebsPkbHo93YD6ZgXU7IkUHgWAe4kVYz/c7OUI=;
	b=sS4dC+JO8Hfq6jFXdadv86nqfgEc5lqBkbFxn3uPLK5Wt8ITQNkPJBac20DAfQkpUa
	DGozgACD2PeTxho0TPfkzY3PZTIDU3gDWuprAWMry5V1W/uF69WeYmxUTAVCxOnqk2EL
	CSnOVWQVPguIErYD3HscNH/7uGQGyJirQaurNR5h5DQE9E7mzPRxtEMqpdCg7Qznv9lZ
	nGl6Wx0kYEnhB2l9j3GQyS0wwroMmABGQFWPFR29pB7SUZ4HW3H/iQoy+lTVYtKEGMSm
	aBfiuWKlyVRfZSe/n2LNzaRHsGun7MfItG5jaOkQeGrEiT2vpe8P4BnoADyWqSwGrujg
	lA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=cc:to:subject:message-id:date:from:in-reply-to:references
	:mime-version:x-gm-message-state:from:to:cc:subject:date;
	bh=g5aNKRebsPkbHo93YD6ZgXU7IkUHgWAe4kVYz/c7OUI=;
	b=cDnhI8jzhmvyShqmjAjCj2gePlNB4IdW6q0DdyKNG5/6Ggr23P6EXo1kh4+WRi2MOG
	0EyRQ8JevokhWWZqg8qq2eiYF1TaOTF3/0dMeXbdiqNt//QRrrNxRqzHgl4yo2nfn5CO
	SReOWTpp+CbUer7+TgJ9EgfgI6H6z497pd8iCUpXIIY2Txdp5tOHLmvJK+qygL1FkW8x
	7AePCoN+qUmcj1s3ot+XJCXzWyhvqalKy4TpFxSkMx1Vogikx5NjxciKyxmlyW8ieVA6
	y0paJCkWBPYAdB4P27et3wm8wHyjHEVT5B4oDqzwv4SDIGq8RPlCV/wWYixBtD8DPd8p
	bUmw==
X-Gm-Message-State: ACgBeo3i6XM8IYqAYOCiic4g9ThRIe7hfQzUJAvMUhTpA75gBKplQtKY
	kyesNr0vrwX0izIxPR849ccus0qRuNY42YtcyeEt1m2s
X-Google-Smtp-Source: AA6agR7tcxd/0gYNwG5iZmY8L9PFOeTGXxv0Q7PaM4PmFc7tyA1HAlrpt2LMHpq1FCBHE8Fs25YNut2nQkfRd1wS958=
X-Received: by 2002:a05:6402:5254:b0:450:e9be:e13 with SMTP id
	t20-20020a056402525400b00450e9be0e13mr3552533edd.398.1662710254644;
	Fri, 09 Sep 2022 00:57:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220908211337.17090-1-veggiemike@sourceruckus.org>
	<20220908211337.17090-2-veggiemike@sourceruckus.org>
In-Reply-To: <20220908211337.17090-2-veggiemike@sourceruckus.org>
From: Joel Colledge <joel.colledge@linbit.com>
Date: Fri, 9 Sep 2022 09:57:23 +0200
Message-ID: <CAGNP_+VfjTkF57HJAk1-MEmJbGbcjVeUEX702awJo+mUE29uuw@mail.gmail.com>
To: Michael D Labriola <veggiemike@sourceruckus.org>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 1/3] drbd: remove WRITE_SAME support
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

Thanks for the patch!

> This commit mimics upstream commit a34592ff6b78, which removes all the
> WRITE_SAME code because "REQ_OP_WRITE_SAME was only ever submitted by
> the legacy Linux zeroing code, which has switched to use
> REQ_OP_WRITE_ZEROES long ago."  WRITE_SAME was then removed from Linux
> 5.18.

This is an interesting case. If we remove all the write-same code like
this, then we either need to add it back in via compat, or we lose a
feature. I think it is OK to lose the feature on 5.18+ kernels, since
the rest of the kernel does not use it any more. On older kernels this
might break real use cases.

There is also the case where our peer is running an older kernel and
we are running 5.18+. I think we should worry about that after
deciding what to do with peers that run the same kernel.

I've added Lars to CC because he is more familiar with the historical
changes in this area.

Note: If we do remove the feature entirely, we should stop advertising
the feature flag DRBD_FF_WSAME so that the peer knows that we do not
support it.

Best regards,
Joel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
