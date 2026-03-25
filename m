Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONo5MQ3fw2kgugQAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 25 Mar 2026 14:11:41 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEF73257C7
	for <lists+drbd-dev@lfdr.de>; Wed, 25 Mar 2026 14:11:41 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B26971621C0;
	Wed, 25 Mar 2026 14:11:28 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
	[209.85.167.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C5204160849
	for <drbd-dev@lists.linbit.com>; Wed, 25 Mar 2026 14:11:24 +0100 (CET)
Received: by mail-oi1-f181.google.com with SMTP id
	5614622812f47-464ba2bb3aeso555922b6e.1
	for <drbd-dev@lists.linbit.com>; Wed, 25 Mar 2026 06:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1774444283;
	x=1775049083; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=SC2ObV9cdMAzqAZJr551Ymm7rgS2/aiZAzUm2n00eFI=;
	b=NYwyxSoIfptUf9Ucj7QPLDr6okf5IfiJTcOreHwXpICNsfbd3zS/yP22A6QE/NLZDj
	QLLkevyxVd3CdZNqgE9Ce8bIzjNYSRY+Uy2ViP78wrJQSbmRwAlamhNc10S23r24WK7G
	BRKbNTng/A2Tvcs6ZA4q4RokzKaQQisAiHTVG/J+F/O7D64mTz2q6QOkeIvJx//E/gvW
	mqcDyyIx/fyRNBVlocEYsgpnOaj+aETa5Nw9LvtjU7sC9UblpIIrqXBNvlTdAO/ccJdd
	txQQuimq+3meUpuHKQt6sPrLqjCtjxAkOJ/R1Iy4iGT8zA1XvVDQrddrSjf+/8J+aR26
	Dk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774444283; x=1775049083;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=SC2ObV9cdMAzqAZJr551Ymm7rgS2/aiZAzUm2n00eFI=;
	b=Y8BHqVtbSVdkwWt2rXzyL+QFyHmkLQODdkdOXFoRxI9moi3sselYppqsHect1Xud6B
	zbJIiISJULreYBvMHQJNGXXQ3PYCpXRStPXVSFmurRGUwfs+tH4iSD3sY02fwLpTAWiR
	i5BUi27AQ6tEtqPwlwMTedwxbHjkIf8fcUjRjXcqrMb9ZN1SHoIc5fmxRy/CDB1257hr
	wL7c7U1aQjb+2tDkSHs8mn7czBU4nnBLtbyxB77un7cqPYUvsKUMz0JpdtRWXPKxF8qu
	0pXKHO3qEYxetc1IIXrhzTo8ImaYwYHA8R4aVKINr5Y8qLOXkFhiM+AAZyUpNp0oGQ6g
	thBA==
X-Gm-Message-State: AOJu0YwCPfe7EircSY3Dn5axP4PqBtHoGqCt+D3sDOdHrJD1oBQyQAq8
	yBh2tSkYbwFqtKbw8gZbVBjslEhH4eYbDrSO5pWGKOOr0qS0LlhAr+Q7q3EuPkRIRWsWtuh/sp3
	CCWWLjyU=
X-Gm-Gg: ATEYQzyLZSdboswB6NzkgNvIIZBdkd+/9+6nI6JVVKVeR2BSwLEQD6WK9BLNfZ1/e6p
	sY1n4K23k84WRGr0xNK3zlN5mpZxlMuuji3dwjimoowFj+uoXiokYYcEKa5I/0a8mOFGptgAO2D
	wPvaFWz3QXatH5nt8wuANldju8JJaUm5++GSg5AXj/0/Opx3M4vS33fS9TPWjJWjRhtCr8RTqHW
	RxmI4g06vLv/LazbBUR4PPrpeQ/zAOuDvrXjAXBo9lM92BJX9ZvX5ml9ho9fVyai/ffbpRFV8k2
	9linQyJRq/+cixFDV6FnCp+6c+kCFHt26SLuHMTqJSSA6fXSgjOH5xADVIY0CBAdUQSghaKHBg7
	srIUh90+UgSdQuOeEALQbjaQaRo5f3HR1ycR817Klua/F+0a8SAKDWggCaBNxn5chiGjZQfnxFO
	QOi5iNfEWn6lALf0pOmEjXofbG1KwoT1wNE6leHOdYnMWcPHXG6E1jqVwlppPQ/OMY2UIrYC98x
	H0+dG7Zy+s6JaI=
X-Received: by 2002:a05:6808:15a0:b0:45f:ea8:4184 with SMTP id
	5614622812f47-46a5bc3e2c4mr1610795b6e.13.1774444283229; 
	Wed, 25 Mar 2026 06:11:23 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	5614622812f47-467e7d4b19csm11275093b6e.5.2026.03.25.06.11.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 25 Mar 2026 06:11:22 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260324152907.2840984-1-christoph.boehmwalder@linbit.com>
References: <20260324152907.2840984-1-christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH] drbd: use genl pre_doit/post_doit
Message-Id: <177444428198.640671.15773217946231288835.b4-ty@b4>
Date: Wed, 25 Mar 2026 07:11:21 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.1
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [1.09 / 15.00];
	R_DKIM_REJECT(1.00)[kernel-dk.20230601.gappssmtp.com:s=20230601];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[kernel.dk];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[kernel-dk.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	NEURAL_SPAM(0.00)[0.039];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 6AEF73257C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Tue, 24 Mar 2026 16:29:07 +0100, Christoph Böhmwalder wrote:
> Every doit handler followed the same pattern: stack-allocate an
> adm_ctx, call drbd_adm_prepare() at the top, call drbd_adm_finish()
> at the bottom. This duplicated boilerplate across 25 handlers and
> made error paths inconsistent, since some handlers could miss sending
> the reply skb on early-exit paths.
> 
> The generic netlink framework already provides pre_doit/post_doit
> hooks for exactly this purpose. An old comment even noted "this
> would be a good candidate for a pre_doit hook".
> 
> [...]

Applied, thanks!

[1/1] drbd: use genl pre_doit/post_doit
      commit: 630bbba45cfd3e4f9247cefd3e2cdc03fe40421b

Best regards,
-- 
Jens Axboe



