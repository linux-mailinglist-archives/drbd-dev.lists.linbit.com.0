Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0dJwMqQVu2nYewIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 22:14:12 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9802C2E48
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 22:14:12 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DD90D1627FF;
	Wed, 18 Mar 2026 22:13:59 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 150D51622B5
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 22:13:56 +0100 (CET)
Received: by mail-wm1-f53.google.com with SMTP id
	5b1f17b1804b1-48538c5956bso2098375e9.0
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 14:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1773868436;
	x=1774473236; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=K2kU43AlMQDJ+y4iCNAzBB3zEZFAq2dkQy3AbLDN39A=;
	b=sNJbA68FF8k2sYUorigf7gB8LPMRzQpfafl335gPXfurEThPvCMEEfwlizD1NQym32
	PBrngQQMtXIw4aWgAcDy4eMIn8cXHkzpyEwzamPpRLQ1QgP5mVsb61Sf0M7+/Fr8ALDF
	Lx+n+4soa6zJGC81Z4jCWrQd1dwzFen2hKXwssXyUQAcsHzMNr8d0U85yXy+VxwKZVaw
	qOAJA8zuI0QR6re4nvrRFbn4JIMRosoeycPfslwgw5zTYybMIJ3TgfTZF5EPJiO2uZ2C
	ozdUKg4pG/aIHAd6DJIPsAd+56DGsGywGtHOKISVxWGVZ6gAmrcVMgxYRIXlZq8pFOVp
	vjCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773868436; x=1774473236;
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=K2kU43AlMQDJ+y4iCNAzBB3zEZFAq2dkQy3AbLDN39A=;
	b=W3B6KxiSAHJxwrugfAK8YMWDf3LOUvzUGYKABdWmc7FA+0VdW1fn5DO3CbiQif+g9m
	BfRNX5iURAG80EywmSa8zRLHduIWuu0sYKL4i6mCU39sTsDB0IVj7nsR2f6wTQZK1BKX
	oXmdREhDbs8kWG6sS2UEK7lSsESUXqlTQ+i3+R9pJignUnFzhtxXgJ2aAP/x+1JtI99t
	i8ZFTWLyRduxvJTUvlNdMvmlvcGMGUyLir0hwDrmPy0gODDYYS0Wva6EQe+APWKeIulj
	NAEC1ezivPkVxJhYjQu5nK4uO6d46RuHosD0GSMbejra3BaQ/B8pk1KZpbT/xznMFqMn
	T3ow==
X-Forwarded-Encrypted: i=1;
	AJvYcCXSQSYMwkiCAzYYXEh9X0+VflSBTnUCpP7lfKy39DmOpYBKh2K5NxkeHkYqbWRvi27GleRG/fb5Eg==@lists.linbit.com
X-Gm-Message-State: AOJu0YxSA4+IxQX+ixl9VpP6jX3+BvYXX7AIpuyxnECG6SklCMe6k4TB
	bS0V2FKTdC44NFYv2BKZrmxt4uxLYZmC0gtmXMLuqiHOuEgfa0nOzBjd19YL97eHUns22g==
X-Gm-Gg: ATEYQzyEgge7XE0SlpKbEGg8W23O9qFSqRdduyLOKMd1niehSzqu9wqPT5aoFGL296p
	0taQzBtGbLb3hY2xGf5Qf02/U8VdgcNkoZDX0b++FjzU/mktS5QOR6oAPQLnfWSnYkhUJ0Jnd5h
	LjATFzkA72YTQaF9wXtGVLYrFjruUry25Z1IozPoqNinaMoeURx6kImIUkgWe2jtNhJq4zGBk3Z
	of5LNFqdZSx73bkNZEGp5OnvDIIoZBGktblrfngrMQurEphF8KmqdQVlC7QzIqhZR0w6K/1iprR
	mtlszOX6AFRFVlV4jc1MP4U0mj7oeUBhXjqYeyo+Jo5XI2pYm85kecbWRvmmRvF9r01zS6T+tkZ
	F71Ill0koCvU3seUgA0rWQFC3p73sqXuRdpE8VS00Cfd3Mf1lpYMjcvTQOdRkis7TzCrabP06rH
	1A1+CyjoB/DJ5kYkoBLxh+EpvhFdWz/aH0Tow3pbx9enqUWSwyTlhfxHd0Frge7sSOjc1lQ836S
	0rxrkiBIMVrmXc=
X-Received: by 2002:a05:600c:c493:b0:47e:e59c:67c5 with SMTP id
	5b1f17b1804b1-486f8b32877mr19492525e9.8.1773868436229; 
	Wed, 18 Mar 2026 14:13:56 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-486f4bc0187sm30798895e9.29.2026.03.18.14.13.53
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Mar 2026 14:13:54 -0700 (PDT)
Message-ID: <f67a657b-bec5-404f-9435-a69f11b7e396@linbit.com>
Date: Wed, 18 Mar 2026 22:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drbd: Fix typos: "receive_peer_dagatg" ->
	"receive_peer_dagtag"
To: Jens Axboe <axboe@kernel.dk>, Colin Ian King <colin.i.king@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com, 
	linux-block@vger.kernel.org
References: <20260316202549.33978-1-colin.i.king@gmail.com>
	<ea558bc4-3efe-4eca-9da6-56f4a5302056@kernel.dk>
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
In-Reply-To: <ea558bc4-3efe-4eca-9da6-56f4a5302056@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [0.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linbit.com,none];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linbit-com.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:colin.i.king@gmail.com,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:linux-block@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coliniking@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[kernel.dk,gmail.com,linbit.com,lists.linbit.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 6F9802C2E48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



Am 18.03.26 um 20:05 schrieb Jens Axboe:
> On 3/16/26 2:25 PM, Colin Ian King wrote:
>> There are a couple of typos in drbd_info and drbd_err messages.
>> Fix them.
> 
> Doesn't apply against for-next?
> 

This is against the drbd-next tree, which is included in linux-next
since a few days.

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Next/Trees#n267

I realize this is a bit awkward, since there is no way to really know
which patches target linux-next and which block/for-next.
Is there any specific way we could handle this to make it easier for you?

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

