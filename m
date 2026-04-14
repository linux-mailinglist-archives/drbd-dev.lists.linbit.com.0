Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDsvNtte3mn+CQAAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 14 Apr 2026 17:35:55 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 7FFD73FBF46
	for <lists+drbd-dev@lfdr.de>; Tue, 14 Apr 2026 17:35:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0E7A71630D2;
	Tue, 14 Apr 2026 17:35:54 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CFDB116087D
	for <drbd-dev@lists.linbit.com>; Tue, 14 Apr 2026 17:35:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C9CD60018;
	Tue, 14 Apr 2026 15:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8741AC19425;
	Tue, 14 Apr 2026 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776180949;
	bh=Zhi6g3yPEN2uxSDsN/A+28ZL8C5VnyvQTTqEpnhvRt8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nfzn1n6EpTRAHbECrupVQDjIyO5XV3ORmBRDv9vlk16b97BBjwTuMakAhbFBCCLtg
	IkSqhUIv6HlzkTsjhZMglROyvsNSR81THgTs/RmzdGbrJSeMEGbf1hf5Kt3kUXBKLj
	3O7sQq60IGLEViV0G/KNk89EpAnPZLeJxP9y1XvetJ0vR70JKTYMbciK0IxOQAiDvp
	MgcSLFRwTF8XHGUgqE+6Qq4e4ZXWvp+6HPPNt0nVv/9lNm6Qo2w1mx4e5ayVA8PPHq
	1qsW/kto0s0mY3MjD9Qls+58BgpZpuOvAOxk8Z7Kj75oCjqGSv1G5hGDEZDr/ogO0W
	7fNeh5J64VZzw==
Date: Tue, 14 Apr 2026 08:35:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Christoph =?UTF-8?B?QsO2aG13YWxkZXI=?= <christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH 2/4] tools: ynl-gen-c: optionally emit structs and helpers
Message-ID: <20260414083548.02f76970@kernel.org>
In-Reply-To: <ad4ox7ibZoiW-tje@localhost.localdomain>
References: <20260407173356.873887-1-christoph.boehmwalder@linbit.com>
	<20260407173356.873887-3-christoph.boehmwalder@linbit.com>
	<20260412125502.3f8ff576@kernel.org>
	<adzVUdf74CVk2DwJ@localhost.localdomain>
	<20260413104939.5ef4d9dc@kernel.org>
	<ad4ox7ibZoiW-tje@localhost.localdomain>
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
	R_SPF_ALLOW(-0.20)[+a];
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
	NEURAL_SPAM(0.00)[0.904];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[drbd-dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 7FFD73FBF46
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 14 Apr 2026 14:08:58 +0200 Christoph B=C3=B6hmwalder wrote:
> But we still need to support the current family via a compat path, and
> I would much rather have two YNL-based families than one genl_magic and
> one YNL-based. Carrying both sounds like a nightmare.
>=20
> So the spec proposed in this series would never actually be used to
> generate a userspace client, if that's what you're asking. We would
> continue to use the current libgenl-based approach, with some userspace
> compat shims to make it work with YNL. Then, when "drbd2" comes along,
> we could "do things properly".

Let's jump to the drbd2 work.
