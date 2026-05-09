Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGtFJ449/2kn3wAAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Sat, 09 May 2026 15:58:38 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 411014FFF3D
	for <lists+drbd-dev@lfdr.de>; Sat, 09 May 2026 15:58:37 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 35263164D2B;
	Sat,  9 May 2026 15:58:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
	[209.85.161.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C9DD81611C5
	for <drbd-dev@lists.linbit.com>; Sat,  9 May 2026 15:58:20 +0200 (CEST)
Received: by mail-oo1-f51.google.com with SMTP id
	006d021491bc7-6948fb494a0so1584185eaf.2
	for <drbd-dev@lists.linbit.com>; Sat, 09 May 2026 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1778335099;
	x=1778939899; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=JtcoItxJPGzLDup9Ghrw2YhEOUYqeKEI+y1BljciO94=;
	b=G2hw/D1nDF8KjBkAZ5nq3CGvU3q9fBxkvzAlMX7TwW/EaSweC2icG4fn0XSiEjtvqH
	dqR8jDmh79Lg7DClyZeELJU0Dbm/aGeqbD1w6aHIb3Z1I+lXmFltbJWLUJ0Aupg+ScUN
	0HGI4BpeJcspPAvhw0sOydRHif2S9PeGXPTtyC9ASoHvmxTrXM9G6K5jc52fdkmXzxS2
	WoEKhjSXshdy55N+Vj+YHWcRyaIlV5ceWc3C9UfG9584EGxXp0qW2v+9EgsCIvL0cWYf
	X4EvvSyFKpRKCvO62VTE1EqdjaT9kS+1oLmIcx7zBJ1C2qbKjHLHHSDxWvDkueBqbVBQ
	nsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1778335099; x=1778939899;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=JtcoItxJPGzLDup9Ghrw2YhEOUYqeKEI+y1BljciO94=;
	b=bJGPLgXLchUGMp57dnxZcvy5x9ofwYILgn5bGYjU4DDyTDoIONfUtMWavYIvFp3XfL
	vZENvwP8SizUFFq7noiX8JDnXH85w+FM7eMAqOoA78A0XXeVvHfVKZ5cIBnBxjcPVVEc
	xCUKXuzHtwh94gO6oD41bs6/HP5mAQSAHLg+wImydi8jZcy6WTC521Z4d1P3MxBVzp8v
	wQYRP9fZFhzpZcDiZecqlMT9Z5DloIWtfMEeiu5YJqQksUuCPhZGsjLyfAGP4Kr4VUtE
	37LPz2s7gEkS6MsBG8B7GPZVlYUdcWQ1K4ENVe/ZZY0YNMgUyDPVf65OZwFdWnCdMtQ+
	GKDg==
X-Gm-Message-State: AOJu0YzwplaCH15NHgnWVKBXJ8KwNiBiiahMlOZ3cMCmHVFK8PlFclPw
	Gq3oht0W7v+n1rzRNjDms6B/YvusvnAzAnz2vaJ0nxufqU6nqhvcBfl+aE/c+/Zz0Do=
X-Gm-Gg: Acq92OHEy+liiv/3Gsg4wvGPHfhwumBJoYzQCq8utwYM49CaoaWu2nYLX1Ur/eirGQ0
	Kgz0oK1cioShq3csJcFKr5ETgE73fNYTBDWeWgHpc6cOhK5QB2tB4ADXv2XI9/E+eCNj5GtSBpN
	T1+QgLt5qAwzQY6dh5/0WI/+1zK5iKh3h6RA+Qig/AXsObDpi8vMmEGb9u0b92pz2y4NTMTOdYq
	SFYFonzTLE4mmRIrwCQRdEVxDP9Kr3tu6plUw4m19vCtn7ZzKT8PXo2AoabuLdK4ChuL73j04H9
	v1Jj6zYhOvF5ka7+X+S6lbf+kCqltIksmv1eOAaw1XHk72BZCqhgrr8L7nqOnrA1Fyjl+blGQdF
	DMIVH8eehNdSrL0b9HDdvZ3yaSSV8A1hvUCh+KD5KJ0memG7M3mZSmiHWQ55LQtezrMbv53zgCd
	/5MT5CkR9d/BfsZrX7rmHRS3rjOPbqmmNno6mz2u00CIw/dpHwe9rJXgg7xXyN8DnJTbXNtYBP4
	JY4Oq4U6l+gSfI=
X-Received: by 2002:a4a:ee12:0:b0:694:8646:9933 with SMTP id
	006d021491bc7-69998c9f9f4mr9127230eaf.9.1778335099502; 
	Sat, 09 May 2026 06:58:19 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	586e51a60fabf-43556bbebe6sm4395297fac.0.2026.05.09.06.58.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 09 May 2026 06:58:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260506124541.1951772-1-christoph.boehmwalder@linbit.com>
References: <20260506124541.1951772-1-christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH v3 0/2] drbd: switch from genl_magic to YNL
Message-Id: <177833509787.32015.11244289527797673484.b4-ty@b4>
Date: Sat, 09 May 2026 07:58:17 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
Cc: Donald Hunter <donald.hunter@gmail.com>, netdev@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
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
X-Rspamd-Queue-Id: 411014FFF3D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[kernel-dk.20251104.gappssmtp.com:s=20251104];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:donald.hunter@gmail.com,m:netdev@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:edumazet@google.com,m:kuba@kernel.org,m:lars.ellenberg@linbit.com,m:donaldhunter@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[kernel.dk];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel-dk.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.951];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linbit.com,google.com,kernel.org,lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Action: no action


On Wed, 06 May 2026 14:45:39 +0200, Christoph Böhmwalder wrote:
> DRBD's genetlink interface was defined using a custom multi-include
> macro system, genl_magic_{func,struct}.h. This system generated struct
> definitions, netlink policies, serialization functions and more
> from a single "magic" header.
> It never really caught on; DRBD is its only user, its internal macro
> jungle is next to impossible to understand, and even harder to debug.
> 
> [...]

Applied, thanks!

[1/2] drbd: move UAPI headers to include/uapi/linux/
      (no commit info)
[2/2] drbd: replace genl_magic with explicit netlink serialization
      (no commit info)

Best regards,
-- 
Jens Axboe



