Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEU0EC7622mbKAkAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Sun, 12 Apr 2026 22:01:50 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id DC5F03E5CFA
	for <lists+drbd-dev@lfdr.de>; Sun, 12 Apr 2026 22:01:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A893C163138;
	Sun, 12 Apr 2026 22:01:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 397 seconds by postgrey-1.31 at mail19;
	Sun, 12 Apr 2026 22:01:44 CEST
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC651162338
	for <drbd-dev@lists.linbit.com>; Sun, 12 Apr 2026 22:01:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80FCC60142;
	Sun, 12 Apr 2026 19:55:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6440C19424;
	Sun, 12 Apr 2026 19:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776023705;
	bh=WdJxeYmmwVGQcrKKOV+mgsVWVSfM6w4XxdfxGzCPDto=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vR1mmNVv21poI2EMgosTHT0V+9+hT1hkOpFnBoZFYKcT0UVkK/P1C2nzuM6jz12l0
	yo9lwh+zCYDkTikyfj/ALNggi06f6AB0/fndZ6rzM+sj1Pw1S3Htjgz3uDuBrIOJf+
	r1ZTHCGml6I/evdGn6lbyqlyoqAbP48SpH9xQ8ZekR13pSEbATHpwgSq3nbh4rwYZX
	ZUDxCGwr5XcIjoinUhEjFNI9K07MbMzjfu0f9kyouAGTTzjf6jPxy1EM3VHmrNiyjU
	Df26pAvhjsU3417ouN/V2bFXXBaBi3mFAhDfhCT0WyS31o4uH6n/mG2tUKkCvTfawP
	LmxN7joup4XKA==
Date: Sun, 12 Apr 2026 12:55:02 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christoph =?UTF-8?B?QsO2aG13YWxkZXI=?= <christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH 2/4] tools: ynl-gen-c: optionally emit structs and helpers
Message-ID: <20260412125502.3f8ff576@kernel.org>
In-Reply-To: <20260407173356.873887-3-christoph.boehmwalder@linbit.com>
References: <20260407173356.873887-1-christoph.boehmwalder@linbit.com>
	<20260407173356.873887-3-christoph.boehmwalder@linbit.com>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.dk,gmail.com,vger.kernel.org,linbit.com,google.com,lists.linbit.com];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:donald.hunter@gmail.com,m:netdev@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:edumazet@google.com,m:lars.ellenberg@linbit.com,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[kuba@kernel.org,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.687];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: DC5F03E5CFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue,  7 Apr 2026 19:33:54 +0200 Christoph B=C3=B6hmwalder wrote:
> The new flags in the genetlink-legacy spec that are required for
> existing consumers to keep working are:
>=20
>   "default": a literal value or C define that sets the default value
>   for an attribute, consumed by set_defaults().
>=20
>   "required": if true, from_attrs() returns an error when this
>   attribute is missing from the request message.
>=20
>   "nla-policy-type": can be used to override the NLA type used in
>   policy arrays. This is needed when the semantic type differs from
>   the wire type for backward compatibility: genl_magic maps s32 fields
>   to NLA_U32/nla_get_u32, and existing userspace might depend on this
>   encoding. The immediate motivation is DRBD, whose genl spec
>   definition predates the addition of signed types in genl. However,
>   this is a generic issue that potentially affects multiple families:
>   for example, nftables has NFTA_HOOK_PRIORITY as s32 in the spec but
>   NLA_U32 in the actual kernel policy.

The series doesn't apply for me (neither to Linus's tree nor=20
to networking trees), so I didn't experiment with this code.

Are the new code gen additions purely for the kernel?
Can we just commit the code they output and leave the YNL itself be?
Every single legacy family has some weird quirks the point of YNL
is to get rid of them, not support them all..
