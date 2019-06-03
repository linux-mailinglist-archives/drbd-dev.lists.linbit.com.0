Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id AF77133056
	for <lists+drbd-dev@lfdr.de>; Mon,  3 Jun 2019 14:55:30 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 5292F1028A6F;
	Mon,  3 Jun 2019 14:55:29 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 440 seconds by postgrey-1.31 at mail09;
	Mon, 03 Jun 2019 14:55:27 CEST
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 35CFD1011C03
	for <drbd-dev@lists.linbit.com>; Mon,  3 Jun 2019 14:55:26 +0200 (CEST)
Received: by mail-wm1-f66.google.com with SMTP id g135so7884769wme.4
	for <drbd-dev@lists.linbit.com>; Mon, 03 Jun 2019 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=gmfaYMqMA2pUjpiZbkgIu9BW1558iD1QIVFfjCYSE5o=;
	b=KwBTRHMXN2MoL6xay12siNXqMShifkvjOvUYMpPL3pi4V9G/TURRGvRje83NKj2emO
	A1pJsWcdgRlmNDH5jV09GVJ2dY65BLW04fMosTP6jhfYlkK4kD1jBx9l/RIKRWh4fUcA
	urPL+zRjEcYkiGX++nhYJDQrlftfMu731fawRHW3nWJlGndUZBPuSeKAdprtMV3a4BGf
	+Gb3102cvdyDLPbrewgaI1pm97D+CRnDu3HU8+p7NgAquiTF5OLPL2Mit/lr4VaVQsws
	tWuHDt3ohK/tBcE2zsAJ3XvTqJ0qBXNW9H9uojvMlgvY//d3vGuDGTDphcvv7htjQwJo
	vMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=gmfaYMqMA2pUjpiZbkgIu9BW1558iD1QIVFfjCYSE5o=;
	b=lH2c19p94KgLP9jG0xYzmaT2DK8RsPJTucOrh5bTr/js85rCu6Goxt83/mHINwTfGn
	/xP9TLRdJZyos4Al1AAwA7HDyx3mw2Tz547EcDGV2YYmjCh/CIFUV7Exbq2RoXzq8lcf
	mPFisqDc2V3xByH0Yid0hJjmmDvvsPaQRCc0+LIMCVVT2lSlC5NCF+IcjOmJ759TkTDv
	Ryds9VQ1eUkGzJUJkSA/SdhEDGpEcBZV0WiaobQvcvf2e+OuKOn7+gKjjbGN2p6aPocw
	spwuvT/Pvf+oglZGqLWJ0sHbGEbkOGa9QIgEy5eUnXe88cC5O0dtN8RS1LsOGgYIjE69
	9jdA==
X-Gm-Message-State: APjAAAVEmH9f+/YAvXHwPVdvMBStZwjQPglgTElKnMHA++1sVR5AN6X6
	jhix3VJpyxNLK7ACOl5S5ot3UjbrV2K6pA==
X-Google-Smtp-Source: APXvYqxgcu6nfQnmo55WQOYWcfI4v2qYN4lpMZWaqZpn3DHwvphoVOapyx0e+io+CdwOeQqCWqHo5g==
X-Received: by 2002:a1c:98d6:: with SMTP id a205mr2093091wme.145.1559566086887;
	Mon, 03 Jun 2019 05:48:06 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	88sm15861148wrl.68.2019.06.03.05.48.06
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 03 Jun 2019 05:48:06 -0700 (PDT)
Date: Mon, 3 Jun 2019 14:48:04 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190603124804.GI5803@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <15124635.GA4107@soda.linbit>
	<1516057231-21756-1-git-send-email-drbd-dev@lists.ewheeler.net>
	<20180116072615.GA3940@infradead.org>
	<20180116094907.GD4107@soda.linbit>
	<alpine.LRH.2.11.1905101728280.1835@mx.ewheeler.net>
	<20190528131823.GD5803@soda.linbit>
	<alpine.LRH.2.11.1906012121470.27699@mx.ewheeler.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.11.1906012121470.27699@mx.ewheeler.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Sun, Jun 02, 2019 at 12:28:31AM +0000, Eric Wheeler wrote:
> On Tue, 28 May 2019, Lars Ellenberg wrote:
> =

> > On Fri, May 10, 2019 at 05:36:32PM +0000, Eric Wheeler wrote:
> > > Hi Lars,
> > > =

> > > We just tried 4.19.x and this bugs still exists. We applied the patch =

> > > which was originally submitted to this thread and it still applies cl=
eanly =

> > > and seems to work for our use case. You mentioned that you had some o=
lder =

> > > code which zeroed out unaligned discard requests (or perhaps it was f=
or a =

> > > different purpose) that you may be able to use to patch this. Could y=
ou =

> > > dig those up and see if we can get this solved?
> > > =

> > > It would be nice to be able to use drbd with thin backing volumes fro=
m the =

> > > vanilla kernel. If this has already been fixed in something newer tha=
n =

> > > 4.19, then please point me to the commit.
> > =

> > I think it was merged upstream in 5.0
> > f31e583aa2c2 drbd: introduce P_ZEROES (REQ_OP_WRITE_ZEROES on the "wire=
")
> =

> Thanks Lars, I appreciate your patch.  =

> =

> Your unaligned zerout code in drbd_issue_discard_or_zero_out() looks =

> great.  I particulary like how you adjusted max_discard_sectors to the =

> granularity, as well as alignment handling.  Well thought out.
> =

> Your commit notes that "for backward compatibility, P_TRIM means zero-out=
, =

> unless the DRBD_FF_WZEROES feature flag is agreed upon during handshake."
> =

> We test our environment by deploying the newer kernel on one of the DRBD =

> servers and checking for regressions---but this will cause a zero-out on =

> the new server because the old server doesn't yet support DRBD_FF_WZEROES.
> =

> For our purpose, can you think of any reason that it would be unsafe to =

> hack the following into drbd_do_features() so the newer version will not =

> zero-out while we test and get both nodes up to the newer version?

If you "fake" agreed_features to include DRBD_FF_WZEROES,
that may start to send the P_ZEROES command,
which the older peer does not understand yet,
triggering a protocol error and disconnect...

You can always use a newer DRBD module with the older kernel,
until you are prepared to upgrade the kernel...

But you knew that.

> diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd=
_receiver.c
> index c7ad88d..76191e6 100644
> --- a/drivers/block/drbd/drbd_receiver.c
> +++ b/drivers/block/drbd/drbd_receiver.c
> @@ -5382,6 +5382,8 @@ static int drbd_do_features(struct drbd_connection =
*connection)
>  	connection->agreed_pro_version =3D min_t(int, PRO_VERSION_MAX, p->proto=
col_max);
>  	connection->agreed_features =3D PRO_FEATURES & be32_to_cpu(p->feature_f=
lags);
>  =

> +	connection->agreed_features |=3D DRBD_FF_WZEROES;
> +
>  	drbd_info(connection, "Handshake successful: "
>  	     "Agreed network protocol version %d\n", connection->agreed_pro_ver=
sion);

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
