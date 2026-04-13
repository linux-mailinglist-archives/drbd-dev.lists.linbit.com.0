Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMMtINEs3WmVaQkAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Mon, 13 Apr 2026 19:50:09 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0B73F1ABB
	for <lists+drbd-dev@lfdr.de>; Mon, 13 Apr 2026 19:50:08 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 103D8163137;
	Mon, 13 Apr 2026 19:49:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9F7991621BE
	for <drbd-dev@lists.linbit.com>; Mon, 13 Apr 2026 19:49:52 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C8AEF6183C;
	Mon, 13 Apr 2026 17:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09482C2BCAF;
	Mon, 13 Apr 2026 17:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776102591;
	bh=RHlWpDhqE4IKOkFXV9Fh64KcGdDthPmi41dfkVaT7Eo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pd5m4oxgxc1vqwjyEk7DN6TH2VpxTalo4RumGHaVVor1SNl1iMBx8h2Ag54LYKuru
	b65KDkBBPKyPXs0q4YhzDqW6ghgjdWFXJIyDy/50knKXbLZkgdKdILK6WEXx+zt2tU
	7rOj7gCfVGp+0TbEM5ufWQtO031CsBr/bKdocJe54Np+rrhF/Xc8QTPUb5WNnu/GfZ
	zR54cG5qCcspBnMFrdiWjD3fA6BmIgSN3hQwi8ExomvmsE8+W2JQPHVOqh/1LEMKPT
	mxWqhQKO35QRtKHhlQAqcG7AZw8rJj3sYXSL+lyXIEBDBFEQ8aAg8UYUdytK8dozoL
	XqW4/3d5W6dLQ==
Date: Mon, 13 Apr 2026 10:49:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christoph =?UTF-8?B?QsO2aG13YWxkZXI=?= <christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH 2/4] tools: ynl-gen-c: optionally emit structs and helpers
Message-ID: <20260413104939.5ef4d9dc@kernel.org>
In-Reply-To: <adzVUdf74CVk2DwJ@localhost.localdomain>
References: <20260407173356.873887-1-christoph.boehmwalder@linbit.com>
	<20260407173356.873887-3-christoph.boehmwalder@linbit.com>
	<20260412125502.3f8ff576@kernel.org>
	<adzVUdf74CVk2DwJ@localhost.localdomain>
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
X-Spamd-Result: default: False [3.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.dk,gmail.com,vger.kernel.org,linbit.com,google.com,lists.linbit.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[kuba@kernel.org,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:donald.hunter@gmail.com,m:netdev@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:edumazet@google.com,m:lars.ellenberg@linbit.com,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,drbd-dev-bounces@lists.linbit.com];
	NEURAL_SPAM(0.00)[0.921];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[drbd-dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 1D0B73F1ABB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 13 Apr 2026 13:48:32 +0200 Christoph B=C3=B6hmwalder wrote:
> >Can we just commit the code they output and leave the YNL itself be?
> >Every single legacy family has some weird quirks the point of YNL
> >is to get rid of them, not support them all.. =20
>=20
> Fair enough, we could also do that. Though the question then becomes
> whether we want to keep the YAML spec for the "drbd" family (patch 3 of
> this series) in Documentation/.
>=20
> I would argue it makes sense to keep it around somewhere so that the old
> family is somehow documented, but obviously that yaml file won't work
> with the unmodified generator.

To be clear (correct me if I misunderstood) it looked like we would be
missing out on "automating" things, so extra work would still need to
be done in the C code / manually written headers. But pure YNL (eg
Python or Rust) client _would_ work? They could generate correct
requests and parse responses, right?

If yes, keeping it makes sense. FWIW all the specs we have for "old"
networking families (routing etc) also don't replace any kernel code.
They are purely to enable user space libraries in various languages.
Whether having broad languages support for drbd or you just have one
well known user space stack - I dunno.=20

> Maybe keep it, but with a comment at the top that notes that
> - this family is deprecated and "frozen",
> - the spec is only for documentation purposes, and
> - the spec doesn't work with the upstream parser?

The past point needs a clarification, I guess..
