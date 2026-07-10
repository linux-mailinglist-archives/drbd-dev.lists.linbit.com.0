Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OWnICvzTUGp35gIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Jul 2026 13:14:04 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id AB80873A056
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Jul 2026 13:14:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=linbit-com.20251104.gappssmtp.com header.s=20251104 header.b=BjgqajfF;
	dmarc=pass (policy=none) header.from=linbit.com;
	spf=pass (mail.lfdr.de: domain of drbd-dev-bounces@lists.linbit.com designates 159.69.154.96 as permitted sender) smtp.mailfrom=drbd-dev-bounces@lists.linbit.com
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 68D7F1655E9;
	Fri, 10 Jul 2026 13:13:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E4F41160846
	for <drbd-dev@lists.linbit.com>; Fri, 10 Jul 2026 13:13:47 +0200 (CEST)
Received: by mail-wr1-f52.google.com with SMTP id
	ffacd0b85a97d-475417f010dso393352f8f.2
	for <drbd-dev@lists.linbit.com>; Fri, 10 Jul 2026 04:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1783682027;
	x=1784286827; darn=lists.linbit.com; 
	h=in-reply-to:content-transfer-encoding:content-disposition
	:content-type:mime-version:references:mail-followup-to:message-id
	:subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
	:content-type; bh=ODgufXz1PhelMlB2W5pp8vf7ivTLwxqDccyqSe9smQ8=;
	b=BjgqajfFJt1LWFWdV5JQ7ABjPXXhFskSAIGvBAeZRB89zk6w3ynHedAzlnh0BSTHvY
	QrAKJXYKP6Zde28/zjLs7InV7Dvy/7r+4X116xXkNL1xVASURjeMdyv/rX1m+x8FPQZ5
	ffqb7A3t+pArdeHW+RC5FclU+NWppX/u0S+UwAgjgIjBuIEtzMkX+zdprrg1epeMRowz
	zgCceIwGyeLM/1RXh+qDkW4HqKzskbOrBqYlrp4J3kIQVPeQ+DPxSo99FhYS0t8jKCkA
	s/O4LlSQAbPJ2bvSqyTpTiT4XtLrpm35eF5mT4sZtXw8CWM5AClxh6O92RZIx3GK2KvN
	G+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1783682027; x=1784286827;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:content-type:mime-version:references:mail-followup-to:message-id
	:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to:content-type;
	bh=ODgufXz1PhelMlB2W5pp8vf7ivTLwxqDccyqSe9smQ8=;
	b=PP7Zr2zLhct8Dn2g0T7vAqP1yFlOL8YnvZOyuVtXJrAYlmxXlr7rxPb4l6BqnXG09L
	6s87TiHH2bFa7uOKjvRgYWTK6so7u9a0b6CDMCLOkVkHFdXQO+o+ZM4Pp9fsxmoSw938
	3m4dV8aJWYoHr1xJj6NfzEq0p8CzsJH0ilmVD7mr42gDUgHzn+6W6FKoTd2buHBn+jFi
	QKT15NWONR2v8WXrxeQ8W2k3e3dGImw3qWOcLYg2HSDRv74/+BE62Gy016uF6WAEGocf
	Cbqug6FfNCnQKHjNzRERlu0o4gG7Ach4xwuOOAK2ZHbrOcQz4FrBIxQFozxreCAngDcb
	eCmA==
X-Forwarded-Encrypted: i=1;
	AHgh+RprUNDcnG1OZjWQKDovhbktl+SAVq3n7ryphqQ67uKfjGjAsaB2UyS5syoM4lIgq0uI9q9WlW3Aiw==@lists.linbit.com
X-Gm-Message-State: AOJu0Yw0vyNhzyXTFUzUjf4to3bmAwWlhiR2+fNj8F2kKCLO228/nnit
	pmlnqtFVB/GF59O2eMJkfqczzF4XdCh/dFdGYkFxYq/baw7ZGxZfhoNILYBmRmbNTP09vg==
X-Gm-Gg: AfdE7clSI36/4ksuQmlATnGZxvD0WxDUpEL9Ix/qVCrDj9t5Kn0fn4tcKOKnq/ZW6yy
	CIkb9eKK2un3VWrzfA+pdf49+Ob8DJtgFohYxz5g/VRSvYOKBAHxSwaAMBkG309/Xw1GCnNLzjB
	Uvc7UNkmIeQQUnxXCxbOTfwEQzX4Eg8r5mZijf01/lRwWIJsb3tVhSySAqdCVKpQCCOjbcLPFih
	pP8oKL4dwfJS/SLOeJhRb3CaUkZRt81P2lpgxbVeYFovD+bytKGl53/Gr4bfSHxd5FWjt7rbQKr
	K1IEKLPabnoBH3m7khbJxpxvN2yHDexNM8OZMNg6xt6rps8HXGL+ONi7OekN6G3ixnY7zgG0cFa
	BTO8LWY5BHu7sKvTE9JfnwPOfmVM/sKEtJCZK+/JxwdLtgQwAnMLJQQDat3bRBMkw5KE4U07A1d
	D+sOu0dMsPsTbybINVAzlu6ZmYO4TfaUNW8yPG9IUTvp6KObUiOEjDzgUF
X-Received: by 2002:a05:6000:2482:b0:477:6874:5415 with SMTP id
	ffacd0b85a97d-47df074605amr11973058f8f.26.1783682027154; 
	Fri, 10 Jul 2026 04:13:47 -0700 (PDT)
Received: from localhost (h082218129081.host.wavenet.at. [82.218.129.81])
	by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-47a9e4d6e4csm56399132f8f.10.2026.07.10.04.13.46
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jul 2026 04:13:46 -0700 (PDT)
Date: Fri, 10 Jul 2026 13:13:45 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
	<a.vatoropin@crpt.ru>
Subject: Re: [PATCH] drbd: Fix potential NULL pointer dereference in
	_drbd_set_state()
Message-ID: <alDRuDisKeheSGc8@linbit.com>
Mail-Followup-To: =?utf-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
	<a.vatoropin@crpt.ru>, 
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, 
	Jens Axboe <axboe@kernel.dk>, Andreas Gruenbacher <agruen@linbit.com>, 
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20260625050016.12004-1-a.vatoropin@crpt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625050016.12004-1-a.vatoropin@crpt.ru>
Cc: Jens Axboe <axboe@kernel.dk>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>,
	Andreas Gruenbacher <agruen@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:a.vatoropin@crpt.ru,m:axboe@kernel.dk,m:lvc-project@linuxtesting.org,m:agruen@linbit.com,m:philipp.reisner@linbit.com,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	ARC_NA(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB80873A056

Thanks for your patch.

On Thu, Jun 25, 2026 at 05:03:06AM +0000, Ваторопин Андрей wrote:
>From: Andrey Vatoropin <a.vatoropin@crpt.ru>
>
>The connection pointer receives a value in the _drbd_set_state()
>function, including through a call to the first_peer_device() function.
>This function returns a pointer to a list element. If the list is empty, it
>returns a NULL pointer, which is later assigned to the connection
>pointer. Subsequently, this pointer will be dereferenced.

Can the list actually be empty at this point?
The peer_device is linked into the list in drbd_create_device(), before
add_disk() and before the device is inserted into connection->peer_devices,
so no state change can reach the device earlier.

It is only unlinked again in drbd_destroy_device(), after the last kref
to the device is gone.
The connection itself is created together with the resource in
drbd_adm_new_resource() and lives until the resource is destroyed.

So for any device this function can be called on, first_peer_device()
returns a valid peer_device.

>
>Add a NULL check for the connection pointer to avoid dereferencing an
>invalid pointer.
>
>Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
>Fixes: a6b32bc3cebd ("drbd: Introduce "peer_device" object between "device" and "connection"")
>Cc: stable@vger.kernel.org
>Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
>---
> drivers/block/drbd/drbd_state.c | 5 +++++
> 1 file changed, 5 insertions(+)
>
>diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
>index adcba7f1d8ea..ea982d48017e 100644
>--- a/drivers/block/drbd/drbd_state.c
>+++ b/drivers/block/drbd/drbd_state.c
>@@ -1281,6 +1281,11 @@ _drbd_set_state(struct drbd_device *device, union drbd_state ns,
> 	if (rv < SS_SUCCESS)
> 		return rv;
>
>+	if (!connection) {
>+		drbd_err(device, "No connection to peer, aborting!\n");
>+		return SS_ALREADY_STANDALONE;
>+	}
>+

Also, even if the condition could happen, its handling here would be 
wrong. Since this check happens before handling hard state changes, 
those could potentially be skipped, which is not allowed.
For example, after a local I/O error (drbd_chk_io_error), if this 
condition would trigger, the detach state change would be silently 
skipped. So in that circumstance, this patch would be actively harmful.

Also, SS_ALREADY_STANDALONE would map to the error message "Can not
disconnect a StandAlone device", which does not make any sense in this 
context.

> 	if (!(flags & CS_HARD)) {
> 		/*  pre-state-change checks ; only look at ns  */
> 		/* See drbd_state_sw_errors in drbd_strings.c */
>-- 
>2.43.0

In summary, unless I missed something major: NAK.

Thanks,
Christoph
