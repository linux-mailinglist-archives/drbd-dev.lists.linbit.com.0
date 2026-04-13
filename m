Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNiIHyTY3GmcWQkAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Mon, 13 Apr 2026 13:48:52 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 04DED3EB81D
	for <lists+drbd-dev@lfdr.de>; Mon, 13 Apr 2026 13:48:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 39440162EFD;
	Mon, 13 Apr 2026 13:48:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1C5F616094D
	for <drbd-dev@lists.linbit.com>; Mon, 13 Apr 2026 13:48:34 +0200 (CEST)
Received: by mail-wr1-f41.google.com with SMTP id
	ffacd0b85a97d-43d74086e5bso907486f8f.0
	for <drbd-dev@lists.linbit.com>; Mon, 13 Apr 2026 04:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1776080913;
	x=1776685713; darn=lists.linbit.com; 
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=A0t/PovMpIgnGwUGYbYpIowv0ZhNrCZg5yAKqxRoCRU=;
	b=0EhMtKwXD4kxqp6eTtqmGDf1+Kb0T7tTyZocKmlrFZnc7P6ptaV29nGpD46gbTZAzl
	Gyxi6vTBVi/CpPU2iv3giI9WiNgWoTI1TcRcaCuFuMV7EtlQrh1B1lIQvPJz85KdFtcf
	wASWGGSwTeKsNPzz2Z0p/m0qL2pvaTi3wIwH2kSkr+/Q776RS7pgbsAmg3tRlpnRAc0E
	DuaQ7EC00+lsXGqM+v5IkgtZfBjv5MfPDf8jSJpT+0cin//d/EX5bJ1QwOP9GnUPFoCm
	LUDCxB750PGyInH2eXIoga2rPWcISz3jvBQM4TuGkbmOUleKjdOBkZkEQ8CAcAFRPCIY
	YnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1776080913; x=1776685713;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:mail-followup-to:message-id:subject:cc:to
	:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=A0t/PovMpIgnGwUGYbYpIowv0ZhNrCZg5yAKqxRoCRU=;
	b=KDhxNP6EPk/L0LPtOfAQBmeQrwofwcdWEusOyhrnYmFLKm1qV081dTBqDXBdd4HLHN
	kRU2U/y7e+tJ4Qu73ixDI6g/ThthwpaILLEe7vfDnRfBJlMjem7z2OSskKBmsjXeiJ9S
	rY95ktNqo1rJbYdWFGLxpuFaG5JHqR1EifPaBp5XofqKBaUb+t+sEkByVbPk/doNImTl
	xiH+rYxvBwGshS/92BXIaHPqwGgiZSikl/57RftRubFXDDjEdXczHnv8cvEvFNGMwfw4
	4evFj92uC/6TI1C6eWSw/Hu0f5WS9WKqmxpqfCWbE04N07aT9j3Zm6bgbbDWlziLk/jJ
	ff2w==
X-Forwarded-Encrypted: i=1;
	AFNElJ9D0mnXc3teDmrdjQJOccZxsuQ9fXLiBZKVJGC+Bh2c9F11/fvdjWrKQNpnUkVXsWBxlrUsOrlP4w==@lists.linbit.com
X-Gm-Message-State: AOJu0YztSIgP1rmhoZIf3tc+kofIZRlFsJR/sj1BKLBZ1ejDYthdDtJz
	jJzviBxEc9BdOSsYZqPq2XO8+Hk8tNkO7Z55ABdl47FFydHZOYiNQYB2wqQ0KDiiNfYCbA==
X-Gm-Gg: AeBDieteK9Dq+V9rgO3K9OkxfH/4X9MfAdMNJVNp7nGbBzV3HymQF5ZYUGLTdhxZChh
	rZwFRmlbvrgV4lzIy69nQJMrcMZn7DGOEhd6q8xGcL4nxQNQXuSfQ/+E95dZC8ujsOd5byrL/Ne
	oUKXlcuf8r8RY5runP/t8kAWjVjJqqtRcPABlVweMdHEdX0+YgVe+up5zi0ntWOrvOvyhXgRlNU
	wSlgZ0+a9RU5PPfg5m54qJQjpMCtEgh35PjKq/kIVLK1+RMrJFaty+SCWHKRfVpvk23rqK+5SkR
	buWy2EuQP+K/HI64LINyHF65XmTXLaHvgLtlryIIvxXJz0TYZnEwabcPdvnmOzPBIkhtFm1fv5x
	e5+2a33Z3ygxTaP8PLVRYAw08Sf5xR+NQJ6TYER2SVK7O+wo6WWcB9joT0qqXvbq1XcMzW+Z1UZ
	07zoCY2fK/3pkC2T4v8DV/gLE3gtbJ+drjXewtQGyZ7H4BfNLox9ZElCjI+I2AnDcxOOhO8saS1
	gpZlw==
X-Received: by 2002:a05:6000:1788:b0:439:ccd7:cdb6 with SMTP id
	ffacd0b85a97d-43d642a4dd9mr20596625f8f.14.1776080913515; 
	Mon, 13 Apr 2026 04:48:33 -0700 (PDT)
Received: from localhost (h082218028181.host.wavenet.at. [82.218.28.181])
	by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43d63e50015sm34224996f8f.27.2026.04.13.04.48.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Apr 2026 04:48:32 -0700 (PDT)
Date: Mon, 13 Apr 2026 13:48:32 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH 2/4] tools: ynl-gen-c: optionally emit structs and helpers
Message-ID: <adzVUdf74CVk2DwJ@localhost.localdomain>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260412125502.3f8ff576@kernel.org>
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
	NEURAL_SPAM(0.00)[0.998];
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
X-Rspamd-Queue-Id: 04DED3EB81D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Apr 12, 2026 at 12:55:02PM -0700, Jakub Kicinski wrote:
>On Tue,  7 Apr 2026 19:33:54 +0200 Christoph Böhmwalder wrote:
>> The new flags in the genetlink-legacy spec that are required for
>> existing consumers to keep working are:
>>
>>   "default": a literal value or C define that sets the default value
>>   for an attribute, consumed by set_defaults().
>>
>>   "required": if true, from_attrs() returns an error when this
>>   attribute is missing from the request message.
>>
>>   "nla-policy-type": can be used to override the NLA type used in
>>   policy arrays. This is needed when the semantic type differs from
>>   the wire type for backward compatibility: genl_magic maps s32 fields
>>   to NLA_U32/nla_get_u32, and existing userspace might depend on this
>>   encoding. The immediate motivation is DRBD, whose genl spec
>>   definition predates the addition of signed types in genl. However,
>>   this is a generic issue that potentially affects multiple families:
>>   for example, nftables has NFTA_HOOK_PRIORITY as s32 in the spec but
>>   NLA_U32 in the actual kernel policy.
>
>The series doesn't apply for me (neither to Linus's tree nor
>to networking trees), so I didn't experiment with this code.

It's based on for-7.1/block in Jens' tree because there are some
prerequisite commits on there that haven't made it to master yet.

If required, I can also send the net-specific patches based on another
tree, just thought it made sense to keep it all together to have the
whole context in one place.

>Are the new code gen additions purely for the kernel?

Yes. The DRBD userspace utilities re-use the kernel headers and manually
construct messages using libgenl, so we can just do the same for the
legacy family.

>Can we just commit the code they output and leave the YNL itself be?
>Every single legacy family has some weird quirks the point of YNL
>is to get rid of them, not support them all..

Fair enough, we could also do that. Though the question then becomes
whether we want to keep the YAML spec for the "drbd" family (patch 3 of
this series) in Documentation/.

I would argue it makes sense to keep it around somewhere so that the old
family is somehow documented, but obviously that yaml file won't work
with the unmodified generator.

Maybe keep it, but with a comment at the top that notes that
- this family is deprecated and "frozen",
- the spec is only for documentation purposes, and
- the spec doesn't work with the upstream parser?

Thoughts?
