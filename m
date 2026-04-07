Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ma9TK4Tk1GluygcAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 07 Apr 2026 13:03:32 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 4B1943AD71E
	for <lists+drbd-dev@lfdr.de>; Tue, 07 Apr 2026 13:03:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC38E1627C2;
	Tue,  7 Apr 2026 13:03:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D99A9160849
	for <drbd-dev@lists.linbit.com>; Tue,  7 Apr 2026 13:03:16 +0200 (CEST)
Received: by mail-wm1-f41.google.com with SMTP id
	5b1f17b1804b1-4888375f735so44526055e9.3
	for <drbd-dev@lists.linbit.com>; Tue, 07 Apr 2026 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1775559796;
	x=1776164596; darn=lists.linbit.com; 
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=m6TtVGHE2sfWKmKHTfD7B+wW30vSxCVJuqgVacPiiPs=;
	b=pCn35e25txrx7lvnD4exnPONibsmJDqCk+VD0L8bszm5VdY92jogHn3go3PA/tHonP
	6b9K1t1/Ofj4uJRaHAwzFK0SpYySFo88s0bvkqcXvePrXIpO4obhc0qEjcWfTwxabiCw
	QN/ou9x9XqaVgzlyPo9cFVZPioLms8c9JusPHhK26DkBElAyhoikKLxTGRvtMciEO6yz
	ECP1sJ2N/hx0Xhi70kG1RaqNl3vM2vuZ4VLZFvSOkqTUv2LzxI6KdnTnmQMT3EzI/aeB
	9NvWD7uDxNAPaWcGpODRNpSrvhDYneMPhxw1QE+bXORzHhwz1ZEwePkwmf2pQ/Xfu9zA
	flCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775559796; x=1776164596;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=m6TtVGHE2sfWKmKHTfD7B+wW30vSxCVJuqgVacPiiPs=;
	b=Mg915rkAGYp9jEzV5YA+qIO8CE24/kQzh2XtsTNRIKAvVY2HLpuc1rtw+Wzxl9chyk
	6pkwr/LYVcjOxGXCkBheQn6Vrpz96Fx9smODYa7VHQKTiXbN3aKWxmUiKkpAKe4pPbK3
	qwBvEzoGXCr4b5b/LkbBUIiL0D4+pJJRUAxRmyGYswwDlMm/ncffet94CfVm8tRr0SFO
	K8hZjQDPFtp+xDTrghDtUjgO5m8eHAvHcHNGx4L7EYmAmKnyWEtD0GPZwsOocpWAXp3d
	oT8VFfpR+IMst3neUs8cUfkthpsOxWO/lYp0ZQPd2nSsIAxoql3fb0XtKFMIqXebAgY3
	piGQ==
X-Forwarded-Encrypted: i=1;
	AJvYcCVuQEPXGyqOFNS/1pCG3unvFWoLrpd2pTnq8ItGFIrbvAonqu+zohOnKJ5iWPqJWsUMYgJEPtG7ZQ==@lists.linbit.com
X-Gm-Message-State: AOJu0YyDk1mLKvIAtbbSJmidB9XsLb5yzDIMPc1+lRKDYJ/9EY8X2vTv
	hDP7UnVs8IT2V/yhgUWYcWgirgPXcxqNHQa5Oy9KDAg/ESzmzo+dFO/vXpAGcz7Niz66Gw==
X-Gm-Gg: AeBDieseaIoroawsMsIVYDJtnqNPBY7Oq98qoHlU2ZduwrTQeWk9+uj/S+3uPcWhvYp
	hdQMhmALE4Hcm6qqU/VaUtZrdtmcAskUlk3QNjUaVmrH2bWxHza7TVPNYXpaG2LVNwCR0D8ZAVs
	8UvnGEFK4hbdvdSnlWHUV8Pm4+ww/l+8TD8NZfdHXSQPwJXM4hqqLbkV93hd2EZQhTJOxVA8LBW
	MsxpToF4o9Ih0XL5GMejYQB7QQ/lY2Gp9A7m7Z4+pEUtQxKtYD9EGA82R3zUDmv/mFLITVrq4fU
	gfIx3NobWcT0sB3PwdesO5PGbGw0Fi7yesl6h/m8QhiF91VAAqj5FYBL9jkvEk96J6YIGLeRf7g
	yBwlCfjbHZ7Krs+KVpuQnCNhKZLg+at9PvPRIoPUFFIY25rjufL0Rma6eg+bGGCr09eRcwm0Y9i
	9aNT8uPORskUY6BTUphY2250OVwj5B/6CT6Jlubb3UOoVFZlweTbQUJu83Vm99GdNZi9+UEUvgh
	uyREw==
X-Received: by 2002:a05:600c:c090:b0:488:b683:a421 with SMTP id
	5b1f17b1804b1-488b692e9ebmr50994655e9.19.1775559795818; 
	Tue, 07 Apr 2026 04:03:15 -0700 (PDT)
Received: from localhost (h082218028181.host.wavenet.at. [82.218.28.181])
	by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43d1e1fe0b0sm50289928f8f.0.2026.04.07.04.03.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Apr 2026 04:03:15 -0700 (PDT)
Date: Tue, 7 Apr 2026 13:03:14 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: David Carlier <devnexen@gmail.com>
Subject: Re: [PATCH v3] drbd: use get_random_u64() where appropriate
Message-ID: <adTj5DBxjUjVkx82@localhost.localdomain>
Mail-Followup-To: David Carlier <devnexen@gmail.com>, 
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, 
	Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260405154704.4610-1-devnexen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260405154704.4610-1-devnexen@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
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
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_SPAM(0.00)[0.813];
	FORGED_RECIPIENTS(0.00)[m:devnexen@gmail.com,m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns,linbit.com:email]
X-Rspamd-Queue-Id: 4B1943AD71E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 05, 2026 at 04:47:04PM +0100, David Carlier wrote:
>Use the typed random integer helpers instead of
>get_random_bytes() when filling a single integer variable.
>The helpers return the value directly, require no pointer
>or size argument, and better express intent.
>
>Signed-off-by: David Carlier <devnexen@gmail.com>
>---
> drivers/block/drbd/drbd_main.c | 4 ++--
> drivers/block/drbd/drbd_nl.c   | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)

Maybe I just missed it, but v1 and v2 of this don't seem to exist?
Anyway, the patch itself looks good, thanks.

Reviewed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
