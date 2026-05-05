Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHKqMbpB+Wl37QIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 05 May 2026 03:02:50 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAB24C59A9
	for <lists+drbd-dev@lfdr.de>; Tue, 05 May 2026 03:02:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2D1DC164D70;
	Tue,  5 May 2026 03:02:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 987791626CE
	for <drbd-dev@lists.linbit.com>; Tue,  5 May 2026 03:02:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2CC360055;
	Tue,  5 May 2026 01:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D92C2BCB8;
	Tue,  5 May 2026 01:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777942951;
	bh=iEGXDzlDY4dzJ0j/v5KnsVQUb0689gZIcFlZ1AFxiGU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=grFstXbCwhBGyTVmgTIhFOCAjCfAhphC5VCNADmCIDQLgEcq08XtGBvBiS6tiUn+A
	Gl6jmAupztL64e0HtHVgcHVzUmRgEo+WC05tClgvtjeqTMMyRq9JaShOrodJgN6G9K
	Yvfb3lFbYi7Nbw574MZqybscKJoAJmUkt0NEGGRhCME+7fmXfyU8Kp4npai6CFMrtI
	ceUzWbQQPEpf+J/Y4pNnZI3N420ZHjOb7FOxhvQm5VCvvk+VJTixVlzblvmW17chZl
	YYEuRz7ZyhOKyjhZOHfGaynn68YG0w3tyfsUB6QIzIjPiHGwcsPd+Xexw11Tq/4bbc
	Sm7e8vdatShbA==
Date: Mon, 4 May 2026 18:02:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christoph =?UTF-8?B?QsO2aG13YWxkZXI=?= <christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH 2/4] tools: ynl-gen-c: optionally emit structs and helpers
Message-ID: <20260504180230.34ec1561@kernel.org>
In-Reply-To: <afhgQgySpoxXFCn1@localhost.localdomain>
References: <20260407173356.873887-1-christoph.boehmwalder@linbit.com>
	<20260407173356.873887-3-christoph.boehmwalder@linbit.com>
	<20260412125502.3f8ff576@kernel.org>
	<adzVUdf74CVk2DwJ@localhost.localdomain>
	<20260413104939.5ef4d9dc@kernel.org>
	<ad4ox7ibZoiW-tje@localhost.localdomain>
	<20260414083548.02f76970@kernel.org>
	<afhgQgySpoxXFCn1@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Jens Axboe <axboe@kernel.dk>, Donald Hunter <donald.hunter@gmail.com>,
	netdev@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com
X-Rspamd-Queue-Id: 6BAB24C59A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.dk,gmail.com,vger.kernel.org,linbit.com,google.com,lists.linbit.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:donald.hunter@gmail.com,m:netdev@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:edumazet@google.com,m:lars.ellenberg@linbit.com,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER(0.00)[kuba@kernel.org,drbd-dev-bounces@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.858];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_SENDER_MAILLIST(0.00)[]

On Mon, 4 May 2026 11:05:55 +0200 Christoph B=C3=B6hmwalder wrote:
> On Tue, Apr 14, 2026 at 08:35:48AM -0700, Jakub Kicinski wrote:
> >On Tue, 14 Apr 2026 14:08:58 +0200 Christoph B=C3=B6hmwalder wrote: =20
> >> But we still need to support the current family via a compat path, and
> >> I would much rather have two YNL-based families than one genl_magic and
> >> one YNL-based. Carrying both sounds like a nightmare.
> >>
> >> So the spec proposed in this series would never actually be used to
> >> generate a userspace client, if that's what you're asking. We would
> >> continue to use the current libgenl-based approach, with some userspace
> >> compat shims to make it work with YNL. Then, when "drbd2" comes along,
> >> we could "do things properly". =20
> >
> >Let's jump to the drbd2 work. =20
>=20
> We have a bit of a chicken-egg situation there.
>=20
> The drbd2 work depends on the DRBD 9 upstreaming series, since the drbd2
> netlink family will use the new DRBD 9 semantics.
> However, the DRBD 9 series depends on the current DRBD module already
> using YNL (or rather, *not* using genl_magic anymore).
>=20
> Our plan is to convert the current family to YNL in-place first, then
> incrementally add the new modern drbd2 family with DRBD 9 semantics in
> another series.
>=20
> How would you prefer to handle the YNL switch? If it makes it easier for
> you, just committing the YNL-generated code without the generator is
> fine for me. The old family is effectively frozen, so that would work.

That could work. Please float a series and CC netdev, we'll review.
