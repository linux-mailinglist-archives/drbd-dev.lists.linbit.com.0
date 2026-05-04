Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMI/I4Nh+GlJtgIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Mon, 04 May 2026 11:06:11 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 370964BABF6
	for <lists+drbd-dev@lfdr.de>; Mon, 04 May 2026 11:06:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F01A3164D75;
	Mon,  4 May 2026 11:06:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 94E86164D3A
	for <drbd-dev@lists.linbit.com>; Mon,  4 May 2026 11:06:00 +0200 (CEST)
Received: by mail-wm1-f52.google.com with SMTP id
	5b1f17b1804b1-48374014a77so43680605e9.3
	for <drbd-dev@lists.linbit.com>; Mon, 04 May 2026 02:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1777885560;
	x=1778490360; darn=lists.linbit.com; 
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=Jk8DjIwtSgRzibN3X2t/wMdUSa6oMFBpDIDWhZbYEIU=;
	b=Zq0ic4DQpwL+szFaLQmo557lw1d90AHl9AxDMo17hCgPnPg115YlvV3/xCv9KTVvV5
	QN4bPJ1kwNU2ygYWnqdgCLCtIIbqdd33WGw2mRPvEn2QIPm6T1TkQDKukfH4u5fPPIFI
	84W/CXecJQ5pAkLSCdGDvANeunNpSMOmc5U3PVq1O3XH3w0KL6A1lTUyxBKp1gUiczTg
	sWxW0xcCyNAUijtO2dXlWK40fvil3MVXmSKSFoxirCuzTOho1jnKov7J4Sl7IFVyoJc/
	8VGedVCJn5//AhSCh4CQGIsT2r/+wxGpW0/+ctTy6O3KRSivMADw4QBt+Icn844ca5Et
	r/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1777885560; x=1778490360;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Jk8DjIwtSgRzibN3X2t/wMdUSa6oMFBpDIDWhZbYEIU=;
	b=JnSOGHOc70AMlB19LvpDMbpVUH8E1THfkB59RYHIN/BtV9Bk/lsoDUGRrC1YFtTN8d
	4DdHMM/2tVJlrbmFs/ZVEAyYU05MP3WUWk9yTO9WN5tTbg++RBBNQ/qUpHogAVlMPtp8
	alDczuNc7EdnJGDW0jmNLjNOHJiHdEYKpHm+XadFj6HdysAvaF8Dnal7X+vxM7LY/eRE
	16gAIOpOHUrlQZ1RUQb9SZ6jOokVeNJ7f8VqrbQaz3q62rL2LvCUXRspk6OBsB9ICBt+
	a/xMOi5kBLk8B0kAYFj876PdRe+uydFhugvSajvaiqcAEj952kKLXEyVa1BaXMwXfkmL
	1CNQ==
X-Forwarded-Encrypted: i=1;
	AFNElJ9gPSYyr6MVvKVzUEQKRwDPkJtZMdjJgmfJoToEYQVa5CUSn4McoCRnvKL2zKtkm/iqKsnW1b7nig==@lists.linbit.com
X-Gm-Message-State: AOJu0YzrbcBSnYsfdguV50qDmdNt7yU84HdYeiYzusKF3VPNOr4LvIJn
	Xmomm97dekvZl9dJdVj7z29RbWXpoC3CyPtGbOnFMIK+SBSvdc0a7vUtdyG56vg5QVMSGA==
X-Gm-Gg: AeBDiesXaMSFhPS0YOZnVJZ2+lALXp6mvZoWk65YwvqfAmUM+zvfjwV+/TmaRBdC8yK
	FNZddRJFziWPnWHvkA/greniVmpxsa7jkv328LEYzuJRCgmqPXuv8s1E5SVcpTEFI3nDEjIiGKF
	EA/dLMcOQVrdwVgnX6lJlvO/LqEpeUCIR60tngZQ6rZtgZO1TJfiHmM/Ub4BTi4rGAQIW/T8Xod
	OnlVV7Q/9jRoqbs4q60DK18XruCz65TBcVTIrMWoPGIJRfWMLAZy7oU30vzep5x6Byt8ufPJB9P
	j10C4dUbe/rlqflkglTQ2eaQ/JTd7UkOOMfmuHb7y+kAvaY4VnmBYoZBgI2afAZ5kIsNFg/x0WV
	wBSaspamC+n1zmBcKz831JV0W9NiyCL2pIMouBBRN2uiQOTtAY7smtjnB7VFNA+LWuN8yZiNZQ+
	VCl655tMagV1HZKqzrs64vJB0JNhGemsMgAPfu7Ao0VBK5+dMtVC0DN9pBg/cEYmkF3KyevfSiy
	D56aRTkBuWvWk5/
X-Received: by 2002:a05:600c:4445:b0:48a:52ee:5776 with SMTP id
	5b1f17b1804b1-48a986380ecmr140685845e9.11.1777885558358; 
	Mon, 04 May 2026 02:05:58 -0700 (PDT)
Received: from localhost (h082218028181.host.wavenet.at. [82.218.28.181])
	by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-48a82307f28sm526970305e9.13.2026.05.04.02.05.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 May 2026 02:05:57 -0700 (PDT)
Date: Mon, 4 May 2026 11:05:55 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 2/4] tools: ynl-gen-c: optionally emit structs and helpers
Message-ID: <afhgQgySpoxXFCn1@localhost.localdomain>
Mail-Followup-To: Jakub Kicinski <kuba@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linbit.com,
	linux-kernel@vger.kernel.org, 
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, 
	linux-block@vger.kernel.org, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org
References: <20260407173356.873887-1-christoph.boehmwalder@linbit.com>
	<20260407173356.873887-3-christoph.boehmwalder@linbit.com>
	<20260412125502.3f8ff576@kernel.org>
	<adzVUdf74CVk2DwJ@localhost.localdomain>
	<20260413104939.5ef4d9dc@kernel.org>
	<ad4ox7ibZoiW-tje@localhost.localdomain>
	<20260414083548.02f76970@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260414083548.02f76970@kernel.org>
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
X-Rspamd-Queue-Id: 370964BABF6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	NEURAL_SPAM(0.00)[0.734];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:axboe@kernel.dk,m:donald.hunter@gmail.com,m:netdev@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:edumazet@google.com,m:lars.ellenberg@linbit.com,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FREEMAIL_CC(0.00)[kernel.dk,gmail.com,vger.kernel.org,linbit.com,google.com,lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid]

On Tue, Apr 14, 2026 at 08:35:48AM -0700, Jakub Kicinski wrote:
>On Tue, 14 Apr 2026 14:08:58 +0200 Christoph Böhmwalder wrote:
>> But we still need to support the current family via a compat path, and
>> I would much rather have two YNL-based families than one genl_magic and
>> one YNL-based. Carrying both sounds like a nightmare.
>>
>> So the spec proposed in this series would never actually be used to
>> generate a userspace client, if that's what you're asking. We would
>> continue to use the current libgenl-based approach, with some userspace
>> compat shims to make it work with YNL. Then, when "drbd2" comes along,
>> we could "do things properly".
>
>Let's jump to the drbd2 work.

We have a bit of a chicken-egg situation there.

The drbd2 work depends on the DRBD 9 upstreaming series, since the drbd2
netlink family will use the new DRBD 9 semantics.
However, the DRBD 9 series depends on the current DRBD module already
using YNL (or rather, *not* using genl_magic anymore).

Our plan is to convert the current family to YNL in-place first, then
incrementally add the new modern drbd2 family with DRBD 9 semantics in
another series.

How would you prefer to handle the YNL switch? If it makes it easier for
you, just committing the YNL-generated code without the generator is
fine for me. The old family is effectively frozen, so that would work.

Thanks,
Christoph
