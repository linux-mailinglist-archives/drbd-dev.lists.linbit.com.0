Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGE0OAofl2m9uwIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Feb 2026 15:32:42 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 7941815F852
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Feb 2026 15:32:42 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 681F41630D3;
	Thu, 19 Feb 2026 15:32:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F2D7C160922
	for <drbd-dev@lists.linbit.com>; Thu, 19 Feb 2026 15:32:25 +0100 (CET)
Received: by mail-wm1-f41.google.com with SMTP id
	5b1f17b1804b1-480706554beso11638045e9.1
	for <drbd-dev@lists.linbit.com>; Thu, 19 Feb 2026 06:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1771511545;
	x=1772116345; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=X1aygOr2SiR46cucNthKeoKXJ2dYog6+H1Q6WGVnZgI=;
	b=edQCyw9GutigKvLVPFUeRM+uU94QSR51k2KytyXtltIoyZNyCC32S7nGtGMYUexG8b
	iKocVVFYXKtVUhZar6vyyuA3I9JC3cjnAHOB2Acp0H5gFM8xkY6kOb06pMg87jAhUqvG
	D/RPGb8TcaTTR1uF0GfKgY+OSJDexb23jtPrRPAe8wPImgX7O1t0cxQf5ECSjuEa3sbK
	faMZCx+Qmn/E7JgwT7lt1ntfX4JPAR1UOgSaZ9jJSua1rir8Rxlcti9b7oWHFagg+6C1
	HuVPmzRnyrJraU3pDXy8fDh/7FSLWxRax9Ns1rfvnLNp4lS9SB1vXWvnKNcnaVMXNvv1
	esTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1771511545; x=1772116345;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=X1aygOr2SiR46cucNthKeoKXJ2dYog6+H1Q6WGVnZgI=;
	b=VaPmM/Fp2Y3+XwR1/cPfUZI56CrIagtVxrzqepC8tlGnd2orE/hpmGdzQltOQ+N2MJ
	iXhcQKTBQbAwy+r4zbBydq2gBB/lNtwNCmOKzQm7xw7PbYRQgp73oz23qjoOO5ZwUtyh
	X/7tm7YVaCt+3c0ICq2w2rE4+Vt5q1QU7N+lGAu3VP5Nke/TerTySHY7vt730viY5Ml6
	xCmBYmHICFR36nPFABdiSYt9SFqvCkYxXcjmsmQGoGDhypOo+JdV2AlxMRWhpaFuEthZ
	sVsNCmwCEeIfAMocISj0nJ1sozEufmu02B3uD8tTXVpJiZORoFyNuBTpxJQ7/63UIpms
	FjCw==
X-Gm-Message-State: AOJu0YyenxJyKt5s0KDg+yol0WAVJoLkei9GTsYi5VR9nIT93El73OSB
	NKQm0vUIo1zHcXT4xF63P1X04Km7tKuCoGZt5NEEFb71Zny66LafTgbqcNJpGBC/QUO6JA==
X-Gm-Gg: AZuq6aL6kpnKnKRWDY3hbi5E/ysCjB2NaBIxAH2cfNVlVk8kIAVQ48u+Nw8QSY65rOp
	++7tkR7mGW5kmySdjzQhlehWdasi8QeiiSj9lLXCJcEx+vqRs0w6YydGPRNDzhfKWBxKubFnqZh
	C5I3Letos0nIu5pBM7KRnnF3EDUTgsxsWfA3qWDGmkjLJpZb0ZXbo13aRU+qS76tr1B3RgYAp3o
	DB6RdUXvzBSLvIB0EL28693QqYPdSWvtMUFw5EFcqO7LhFP2SI7Ex2y15vLeJMOuUTVHf+T5cF3
	sNBs/uXJX95qR6wkwwLJOkHAAoCmwZ6vjmywVSw/1lsKRiB6ZSOgQgw86uxKdgFGXy0d6pqEefR
	KTaE7n7+BNkmN9yGF1PWI5CYZjAGoCZsyBSGh6IhirW3OcEanjHOZcaazu8yl2YR5KYhRwswTg0
	i0T6gvwWDgJ3XKch7SlNCMP/cv8cxbef9Q5Rw7UmUMAnZUdIxRRSRZbSuWh1FiE/i2ZNPB5uxks
	mUAGCR1k31dloVLzY8CHGRG5vnesA==
X-Received: by 2002:a05:600c:8b61:b0:480:1b65:b744 with SMTP id
	5b1f17b1804b1-48379bf7907mr277885095e9.28.1771511545296; 
	Thu, 19 Feb 2026 06:32:25 -0800 (PST)
Received: from [10.43.5.171] (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-483a31f9475sm6559915e9.14.2026.02.19.06.32.24
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 19 Feb 2026 06:32:24 -0800 (PST)
Message-ID: <432b20cd-9ef0-4335-b8da-425d9a441c34@linbit.com>
Date: Thu, 19 Feb 2026 15:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drbd: Replace deprecated strcpy with strscpy
To: Thorsten Blum <thorsten.blum@linux.dev>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
References: <20260112170412.741013-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260112170412.741013-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_SPAM(0.00)[0.716];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,linux.dev:email,linbit.com:mid,linbit.com:email]
X-Rspamd-Queue-Id: 7941815F852
X-Rspamd-Action: no action

On 1/12/26 18:04, Thorsten Blum wrote:
> strcpy() has been deprecated [1] because it performs no bounds checking
> on the destination buffer, which can lead to buffer overflows. Replace
> it with the safer strscpy().  No functional changes.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy [1]
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   drivers/block/drbd/drbd_main.c     | 14 +++++++++-----
>   drivers/block/drbd/drbd_receiver.c |  4 ++--
>   2 files changed, 11 insertions(+), 7 deletions(-)

Looks good, thanks.

Reviewed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
