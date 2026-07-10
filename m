Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7f6aACTJUGpV5AIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Jul 2026 12:27:48 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 7B714739AE5
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Jul 2026 12:27:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=linbit-com.20251104.gappssmtp.com header.s=20251104 header.b=HJMGOVvn;
	dmarc=pass (policy=none) header.from=linbit.com;
	spf=pass (mail.lfdr.de: domain of drbd-dev-bounces@lists.linbit.com designates 159.69.154.96 as permitted sender) smtp.mailfrom=drbd-dev-bounces@lists.linbit.com
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 356C81655EA;
	Fri, 10 Jul 2026 12:27:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 03E6A160846
	for <drbd-dev@lists.linbit.com>; Fri, 10 Jul 2026 12:27:30 +0200 (CEST)
Received: by mail-wm1-f49.google.com with SMTP id
	5b1f17b1804b1-493ae59eca6so3686125e9.1
	for <drbd-dev@lists.linbit.com>; Fri, 10 Jul 2026 03:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1783679250;
	x=1784284050; darn=lists.linbit.com; 
	h=in-reply-to:content-transfer-encoding:content-disposition
	:content-type:mime-version:references:mail-followup-to:message-id
	:subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
	:content-type; bh=mfNY5/wKTualPtKnvnjNxkREzGzIwpXhaTyFMqtYbU8=;
	b=HJMGOVvnWtG7/lfkXE8e7T6BrtD/KuXxJ+2Gazo8mG+GEo4kaG7oDdsgd0CcsgGi0f
	vYdcDvCzEAbJ3w4mhwmtpOJr0y/8fNBOUd56xPSX6clHbNT9nOAq1xPZt6S4kf9zkx2d
	AuaL842oqWmDJsE3dAw8a820Cd37VEoe0dXvD6Zaynur/KZmLq3qpKxY9LXVySxcbqCU
	CQpAA5TCj8Lkyqh8S2OE46vl29lQm9jg3xdmaWrHsvg0PmsZmzJnjm1PSh0dEI9Aed4S
	VDhKn3Zl24Ufo/VPDI6L1HebA9q5Bn/rbONbu4mCgfypM7xCRhoabgnaiHLFGdb5QJAU
	AAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1783679250; x=1784284050;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:content-type:mime-version:references:mail-followup-to:message-id
	:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to:content-type;
	bh=mfNY5/wKTualPtKnvnjNxkREzGzIwpXhaTyFMqtYbU8=;
	b=Qi+oM/lLXIs5fbUCByRpKs/pps/jhFGdyHoW/SEIZ61cKWEZx3CopJRNNOrERWuiIU
	owbE918ALN2UCHWJzjN7VpWUQ4v4J0HmL8v/VVv6QIL9TzfjEOKTEi2be0OakwxkU32Q
	OIAIEiT66c4zAPIsToyNOj8v//nxqN7BcAuf8+Ku0f9ve8iQLeZtrPk/Bf+mr8DOr1iT
	v34dCJUE+LbnWGwzKRaahsrpMlKgdTFwiz5HC/pzfGqRmKizwr/w+22nOAo79yoD42OO
	hP8KDqEV1k5D3MABrBOaL6oU3QNY5GWysI1gmLSo41PgLJ9Z0ySDlvUhm7KQgtN2SPyb
	uLHg==
X-Forwarded-Encrypted: i=1;
	AHgh+Ro+gQ1EJPS0VBuiPA96BG9v92XE3y9q+q9AMbCuS0Rm+OhJ3pHGRHwWa6g0I/T7ZYm/Kl2F469Ucg==@lists.linbit.com
X-Gm-Message-State: AOJu0Yyrb/qNLavutflpkgUyEjW9qAioChiv/e/Nbv7VA/wudhavymBM
	mH7Aj0UdW0EOaKZZyMaRQKq5fwoZN46nYuIqPnNLLhFn5pZ4h/kMzGK+0gg29v2yHxSl2A==
X-Gm-Gg: AfdE7cmGxNLxlH7BlHdKcNTH/7YPZksVwaRD6brMAKmlBRq8fxjANQTEebR//JNo0nm
	ZQW/TsXXSmdW4xSzpDQOMr9Id+rJJvy/ntv48HeTMsv905J562Zh0bE7tpH3s/V5XshhwwA8eJ0
	tx7eXxy9yGdXgHVXrq/8/qKu5z81qWSUZsfr6CoNWPt77UBMFVd28afMcjx5SoG8U+uAb1VQF+L
	hsnitYzwb3L/6EYLejOUPuv2nslbp+zHzLXq3mtdtLSbUpGIF/+oah6WoGP4CqS8bZHvvFKbht0
	5N9vOEDtQJ8MVhHs/I3SbvLpkR++m9BSi+wMqhiKLZ5WTz2s+DNETLegbsTmcg1tjN/RDWc4OSN
	vDebCta3+hhyqEJXAzcRd8xPmXp7FSYndi+xEtKXxLkPEIqrgrNsVy1GdXc+da4ip/pEjiDng65
	/hOK0B7SeOrGhaLOKtJOPQI241UPKD1Yx0EQOretuvP45sFO2ONs5mIsBh
X-Received: by 2002:a05:600c:4fc6:b0:493:b729:3a9 with SMTP id
	5b1f17b1804b1-493e68cbf1dmr111119535e9.27.1783679250286; 
	Fri, 10 Jul 2026 03:27:30 -0700 (PDT)
Received: from localhost (h082218129081.host.wavenet.at. [82.218.129.81])
	by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-47aa0f214d2sm57826881f8f.33.2026.07.10.03.27.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jul 2026 03:27:29 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:27:28 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Michael Bommarito <michael.bommarito@gmail.com>
Subject: Re: [PATCH] drbd: reject data replies with an out-of-range payload
	size
Message-ID: <alDISEFL7wuNO_VW@localhost.localdomain>
Mail-Followup-To: Michael Bommarito <michael.bommarito@gmail.com>, 
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, 
	Jens Axboe <axboe@kernel.dk>, drbd-dev@lists.linbit.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710022837.3738461-1-michael.bommarito@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710022837.3738461-1-michael.bommarito@gmail.com>
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michael.bommarito@gmail.com,m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,m:michaelbommarito@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[drbd-dev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[localhost.localdomain:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B714739AE5

On Thu, Jul 09, 2026 at 10:28:37PM -0400, Michael Bommarito wrote:
>recv_dless_read() receives a P_DATA_REPLY from a peer into the bio of an
>outstanding read request. The peer-supplied payload length reaches it as
>the signed int data_size, and two peer-controlled inputs can make it
>negative. With a negotiated data-integrity-alg the digest length is
>subtracted first, so a reply whose payload is smaller than the digest
>underflows data_size. With no integrity algorithm (the default) data_size
>is assigned from the unsigned h95/h100 wire length and drbdd() never
>bounds it for a payload-carrying command, so a length above INT_MAX casts
>it negative; this path needs no non-default feature. The bio receive loop
>then computes expect = min_t(int, data_size, bv_len), which is negative,
>and drbd_recv_all_warn(mapped, expect) receives with a size_t of SIZE_MAX
>into the first mapped page.
>
>The sibling receive path read_in_block() is not affected: it uses an
>unsigned size and rejects it against DRBD_MAX_BIO_SIZE before receiving.
>Reject a data reply whose size is negative after the optional digest
>subtraction, covering both triggers.
>
>Impact: a malicious or man-in-the-middle DRBD peer copies attacker-chosen
>bytes past a bio page in the receiver, corrupting kernel memory. A node
>that reads from its peer (a diskless node, or read-balancing to the peer)
>is exposed in the default configuration; data-integrity-alg is not
>required.
>
>Fixes: b411b3637fa7 ("The DRBD driver")
>Cc: stable@vger.kernel.org
>Assisted-by: Codex:gpt-5-5-xhigh
>Assisted-by: Claude:claude-opus-4-8
>Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>

Looks correct, thanks.

Note that DRBD usually chooses to trusts its peers by design, but I
agree that memory corruption is a bad enough consequence that we
should put the guard there regardless.

Reviewed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
