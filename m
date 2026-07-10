Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MTsvJBgLUWrf+QIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Jul 2026 17:09:12 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 1B79973C133
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Jul 2026 17:09:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=kernel-dk.20251104.gappssmtp.com header.s=20251104 header.b=OGrCwuws;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of drbd-dev-bounces@lists.linbit.com designates 159.69.154.96 as permitted sender) smtp.mailfrom=drbd-dev-bounces@lists.linbit.com
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F2C9C1655F4;
	Fri, 10 Jul 2026 17:09:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
	[209.85.210.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 44D6C1627A5
	for <drbd-dev@lists.linbit.com>; Fri, 10 Jul 2026 17:09:07 +0200 (CEST)
Received: by mail-ot1-f45.google.com with SMTP id
	46e09a7af769-7e9f69ee6f4so901872a34.2
	for <drbd-dev@lists.linbit.com>; Fri, 10 Jul 2026 08:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1783696146;
	x=1784300946; darn=lists.linbit.com; 
	h=content-transfer-encoding:content-type:mime-version:date:message-id
	:subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to:content-type;
	bh=8czkgUXRj6O1Wp+SDMx8lgL+MynprJo1fYUcHuIszUY=;
	b=OGrCwuwsiK7YhQjbA/r0rl2N3Ylf0Wu5Dd6tM3mbouBdzqCG1XWXP5/BIaE1rOOEIx
	GPWmzU8ndxUgLM+u4fI6SGAkZTIt3eqwxHlgLcGLDHujIBGfMzrvs4u/Q6Jg/xSUVa53
	DusAyjvk8fSz6U3YzLb6b8V6ZWul2oSL565klSu5y7JjpO8GIT1OUL7CyG/wpPwwL2Kr
	mTV7wVFzQC42JI9Y7rQk4U7B+XbuWajWacy+wq7JeEeqrgRjixig/TFhtQFzRdQosUwN
	Nhf8yQmAxicOhRRMF7TFZcQTLFqODeRYbg1QMwsq9XcAt820sAPwigtA7I/1oO9uiMGK
	Dbnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1783696146; x=1784300946;
	h=content-transfer-encoding:content-type:mime-version:date:message-id
	:subject:references:in-reply-to:cc:to:from:x-gm-gg
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
	:content-type;
	bh=8czkgUXRj6O1Wp+SDMx8lgL+MynprJo1fYUcHuIszUY=;
	b=XCQt0ua1wwS8ZhE18NLfbg8r02LEzdXUtBrHkByNLFIQquegSEdPZYzz8rO6+Fvvar
	BaPoInFVuA+yPaecl1GJuiXlq5H3sDgN68J/BEiGJ1W93mC4CWpUWpcr58ftTMQyaXYc
	WtpVSnGVAYj7mnsCJf78UgBvLvCoyGwDZllpowHduJx5++OTES7wTBaKfL2WWgJDXK6b
	IDluSIMdRxgqc9EysrpFfZHsnvE0uRwkv1OwK9PFqwTkimqEy08oa+nisJtad56y2/Vw
	NQTit2O8lU1te1H4RFtaID6iWloMo6ult0S63ou7SFZvUuipnFlVxFYsMs+Eekg+NTGE
	+dWw==
X-Gm-Message-State: AOJu0YwmmYUvMH2Mr/4ipmo53nd5hBhe8XmWq6Vsxf5NUp7J7EVA488l
	n1x834w84eUHohoa4L4NY1sQqWhUeKksrH5kkRyVPXe1TLQSeCcm+lo5S6veLl0M6QI=
X-Gm-Gg: AfdE7ckS6rcqPHdeZhYuqEkUokNat0J5+Myy09SuYFRXLwWYFjn5VBQBQu5KnuBNW4B
	Vg4lJMTzwrwHw+jILruUtueQDXqLjjNCwEitJ+ifI8T0hpJ9tL/wDYUmbZFjpP+X4Ld9IPZPXWV
	qqyKaURy6Sp39ZPOcdDPiXUMRnyRrXYe9f221acvgbitulKPqy8uWZP2XWY6eTBm43IyONBen4M
	ZiTKInX/oaoXy2OiXq8nfFyU9M+kyl7p0K8GqeC7fEF7jeb92Q61NBtOHhjgj41+5DLy6OczjYf
	7DCGAYYNMccBIQ2aMGxO764eOvYW1pFz8GBILem9svDuSFnJKvqeA3HyuBS88dNhaiFpbir/U7p
	ce2m5ujHhZxwyECYEFGFjgWNaFnjzDsYqMZTAj8aEmKwEvPmYbsJX4aMv7pt1Da9MFjIPh39Q3j
	Mqh9d7nwrmErxIzlGrAjnktb5Pz/wnerOIrc23Xn0KjmLGqfJ+664tJ92YGqBG7mmzaA==
X-Received: by 2002:a05:6830:4387:b0:7e9:ead3:4449 with SMTP id
	46e09a7af769-7ebcfe1da0emr8679171a34.6.1783696146204; 
	Fri, 10 Jul 2026 08:09:06 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	46e09a7af769-7ebcae177c5sm6709330a34.5.2026.07.10.08.09.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jul 2026 08:09:05 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Philipp Reisner <philipp.reisner@linbit.com>, 
	Lars Ellenberg <lars.ellenberg@linbit.com>, 
	Christoph Boehmwalder <christoph.boehmwalder@linbit.com>, 
	Michael Bommarito <michael.bommarito@gmail.com>
In-Reply-To: <20260710022837.3738461-1-michael.bommarito@gmail.com>
References: <20260710022837.3738461-1-michael.bommarito@gmail.com>
Subject: Re: [PATCH] drbd: reject data replies with an out-of-range payload
	size
Message-Id: <178369614511.284240.12733294719230479134.b4-ty@b4>
Date: Fri, 10 Jul 2026 09:09:05 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.09 / 15.00];
	R_DKIM_REJECT(1.00)[kernel-dk.20251104.gappssmtp.com:s=20251104];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:michael.bommarito@gmail.com,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:michaelbommarito@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linbit.com,gmail.com];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[kernel.dk];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel-dk.20251104.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1B79973C133


On Thu, 09 Jul 2026 22:28:37 -0400, Michael Bommarito wrote:
> recv_dless_read() receives a P_DATA_REPLY from a peer into the bio of an
> outstanding read request. The peer-supplied payload length reaches it as
> the signed int data_size, and two peer-controlled inputs can make it
> negative. With a negotiated data-integrity-alg the digest length is
> subtracted first, so a reply whose payload is smaller than the digest
> underflows data_size. With no integrity algorithm (the default) data_size
> is assigned from the unsigned h95/h100 wire length and drbdd() never
> bounds it for a payload-carrying command, so a length above INT_MAX casts
> it negative; this path needs no non-default feature. The bio receive loop
> then computes expect = min_t(int, data_size, bv_len), which is negative,
> and drbd_recv_all_warn(mapped, expect) receives with a size_t of SIZE_MAX
> into the first mapped page.
> 
> [...]

Applied, thanks!

[1/1] drbd: reject data replies with an out-of-range payload size
      commit: bd910a7660d280595ef94cb6d193951d855d330f

Best regards,
-- 
Jens Axboe



