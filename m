Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB02C7A2
	for <lists+drbd-dev@lfdr.de>; Tue, 28 May 2019 15:18:30 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id A52AE103B4AE;
	Tue, 28 May 2019 15:18:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 2940E101AC67
	for <drbd-dev@lists.linbit.com>; Tue, 28 May 2019 15:18:26 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id d9so20215897wrx.0
	for <drbd-dev@lists.linbit.com>; Tue, 28 May 2019 06:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=qcTvsk+UCfbFdsEXKr8TQrbFAEGJURQ/pQgVJPeH+oQ=;
	b=BC4MXGYkZQXy7mqJmMNGHymVJrDjsFp/KA9IBtrHKACQLKTh7DdwsUOpOXDRRnvTUE
	C8u4d908Y9r0cs/LHiMylSt8p5MEgvrCcac0EDtsLfevNMWT+uRoCSVXvs+IISFPvtDj
	lo7t5LUntMEa6tHXudTVRTruZJ7gRJQZUCgSfwYkNgJXQkHmrPapVFfirswTJ/D2I6yb
	w2e94VR6C0zuXejCbbj3p1KMnUeRDJD8aCZfOi/YiyTzxkdkNNShBaGLZQr6payyb9eZ
	Tup3fCxgZ5YVfJY32BD6h7yCgAxr7mDxGKjFewbUBre3uDNnhZ7QD8dmtysyCRfgOWYj
	+2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=qcTvsk+UCfbFdsEXKr8TQrbFAEGJURQ/pQgVJPeH+oQ=;
	b=cW+0sOcyoS8IDYEvb9hekpgGRizkAR157x9Ts8KyQOgAXyhlqc1QL2vD5aaM58Qs3g
	4yGrH9VQDcN8rcR63sKSOj/2OHi0EzzevIOuMgZuQFmbWsZmB3iS3c6rYjqm7vCUkstY
	ObpyANHNNIovON3S3o6+k5A5hvJ8ol9CBoBz1Ber4fPnJG5eoR34n0LEaT0S7Pn3+izN
	SwQfXK/znC0/O5tQf8RFyZwIC4MmaV+SF2xXMvwMxMXSyUBAxWjaDPag1EGjBN39Wx7v
	qdiBSTfSnXIVvuDYhdppKMWaS4iRj2uy77sM0q4iiiuvftaqgqNYzdMLFWYAg+jGLRhL
	DuZw==
X-Gm-Message-State: APjAAAVASo/lxIja9z3Z6URuJD4WaUYBMqInniakO3080QQM34RXRZu/
	AAlza5134dOwmxPfslMNV2YrQQif
X-Google-Smtp-Source: APXvYqz6mozGy9uZb9MqcgQGTyhkCyWtzWXdkQe2jURUETumSBi723sWqNfMtadAuXeZb5vXO+U/CA==
X-Received: by 2002:adf:db89:: with SMTP id u9mr40797993wri.294.1559049506335; 
	Tue, 28 May 2019 06:18:26 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	i15sm13040650wre.30.2019.05.28.06.18.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 May 2019 06:18:25 -0700 (PDT)
Date: Tue, 28 May 2019 15:18:23 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: Eric Wheeler <drbd-dev@lists.ewheeler.net>
Message-ID: <20190528131823.GD5803@soda.linbit>
Mail-Followup-To: Eric Wheeler <drbd-dev@lists.ewheeler.net>,
	drbd-dev@lists.linbit.com, linux-kernel@vger.kernel.org
References: <15124635.GA4107@soda.linbit>
	<1516057231-21756-1-git-send-email-drbd-dev@lists.ewheeler.net>
	<20180116072615.GA3940@infradead.org>
	<20180116094907.GD4107@soda.linbit>
	<alpine.LRH.2.11.1905101728280.1835@mx.ewheeler.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.11.1905101728280.1835@mx.ewheeler.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: fix discard_zeroes_if_aligned
	regression
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Fri, May 10, 2019 at 05:36:32PM +0000, Eric Wheeler wrote:
> Hi Lars,
> =

> We just tried 4.19.x and this bugs still exists. We applied the patch =

> which was originally submitted to this thread and it still applies cleanl=
y =

> and seems to work for our use case. You mentioned that you had some older =

> code which zeroed out unaligned discard requests (or perhaps it was for a =

> different purpose) that you may be able to use to patch this. Could you =

> dig those up and see if we can get this solved?
> =

> It would be nice to be able to use drbd with thin backing volumes from th=
e =

> vanilla kernel. If this has already been fixed in something newer than =

> 4.19, then please point me to the commit.

I think it was merged upstream in 5.0
f31e583aa2c2 drbd: introduce P_ZEROES (REQ_OP_WRITE_ZEROES on the "wire")

-- =

: Lars Ellenberg
: LINBIT | Keeping the Digital World Running
: DRBD -- Heartbeat -- Corosync -- Pacemaker
: R&D, Integration, Ops, Consulting, Support

DRBD=AE and LINBIT=AE are registered trademarks of LINBIT
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
