Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SEhQGidR1mm8DQgAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 08 Apr 2026 14:59:19 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 09AA13BC7E1
	for <lists+drbd-dev@lfdr.de>; Wed, 08 Apr 2026 14:59:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 835C9160920;
	Wed,  8 Apr 2026 14:59:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7CB96160849
	for <drbd-dev@lists.linbit.com>; Wed,  8 Apr 2026 14:59:00 +0200 (CEST)
Received: by mail-ot1-f51.google.com with SMTP id
	46e09a7af769-7dbf23885dfso1380143a34.3
	for <drbd-dev@lists.linbit.com>; Wed, 08 Apr 2026 05:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1775653140;
	x=1776257940; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=Er303R5k9tcmJC1WSDcneFV5oWb+ve6YEYG8d7FI6JU=;
	b=bXgBoPxj+0HGikQPPKYRU49SCP8p7Fz+KErXOd9pW1aDVAgCtUCr/ir2mb+7cmPT2k
	kJq5BtYXd55KkbNF/iC3YX9sRSj0gd/UpuE11EX7MxkH0HYqY2c779G2xCxYgAQo3nd1
	MdVoD3A3VMj9hCGCkubEw2qoRqLbY9nWxrlwbIZJeWIkcKAXi7J2F4ooJgYn2cmXmOcx
	P115Y9b/ax28FJrvmgRfn01tbchgZiP9uuCCTnpAvrwKvcW5x5vbh04Am4NfwGsg6LuS
	XiNmZFhBLHrvL3e73E4hTgOJJS6TMY/faHQrB5pXjqiEmujeFHTlOyrRbepjpVm19akj
	OzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775653140; x=1776257940;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=Er303R5k9tcmJC1WSDcneFV5oWb+ve6YEYG8d7FI6JU=;
	b=nzp+CDQUN6oSV9BdFMFbA7p55wNencyjMqphs7ppnXYaFTGWUuIUiAf/pjr6eteeP5
	UDmvGoIKVbEm1Rp7S1/mGwJLN7ND/KSWGQYFQhM3tnIvQh8dXFEw/9upxY6PdC7rQObq
	kcIr/9w+m5UqhT6H4e/0LLo4kwgPJeLxwWl13fo62ucFoantL3zugyDXx3WaiKL9tZmN
	gGhptbMKQT3yC0s59dZHGegavqNDC/IXtpFfC7Exz0+h+mv3lLAEP5mDRt2A31KQYgpO
	LX+NurAdrUU+TrInlGqUmnuh8lLZ0BNnytS1dzgn78Z6NOwSSJ+d7Y5Lpfy30j15SN8J
	47wA==
X-Forwarded-Encrypted: i=1;
	AJvYcCVt+cy0159/KCMnsHLzQ5gOJvKIrdPyUU4gQTQAKA7Im3nkxj9eLatgeGAC4SES0a61YiEsmpf/Ow==@lists.linbit.com
X-Gm-Message-State: AOJu0YyCzWRUHmuozVrnOfQ/vYNM+2hLcVBjH69VGyRur+so2UO2inQz
	rppj3E3N4z7CC5EKK383vL1Cj25MXmMqV3o9PG/el9aIVQSB/cOsSbviS1QOAHrdduc=
X-Gm-Gg: AeBDiesitP85fAXuKhGayA6LO+hQD+iAtOgyq6xONlD7xcaKR9SL1zfjAfnHjgY5dPd
	3tOySbB/TBSWBNy5RHTLSJ9wJ6uAEzwX0Vdkjsh6ru3g2PzAb1VmTjKIazBcBTJiFL4W8zll/T9
	yYJE9k1L0ksz/psI/2mD/1ugImCe2T8BdtXw+dyf/mqzLX9HkgXAq822caYptweSJ7ISb6N3Ofo
	DZzELXkyaWVQvA5gMNHqhxKUgj6F41oqUy0MzoBEID/d2JByCICJtuzEyMau/2Zq6Wbr7jr+8iy
	9HwzQrMjqHXP1uXENYj3wRLW3IfvJqdTjPWAKHWOdmwg4LqFk2ufpekJgNz164Et5s8jXAiE74Z
	BCu6V9anwPPNQhROBPXSlLMBqsazMfLlnidWcgHmQJsQRB5IgTnaLCxyEWzYB0JTgD/yT4qA4iG
	MHrX+QT9HCErhiXCjv6n4F1KkF44C0XZhPxbEfeNNFN55MgD2+NsiZbH1LYRjYHopYTI5BDCGJW
	Byux1OQ9Q==
X-Received: by 2002:a05:6830:6004:b0:7d7:443b:5679 with SMTP id
	46e09a7af769-7dbb75b877fmr12926447a34.29.1775653139696; 
	Wed, 08 Apr 2026 05:58:59 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	46e09a7af769-7dbf2ddd6c8sm4058683a34.23.2026.04.08.05.58.58
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 08 Apr 2026 05:58:59 -0700 (PDT)
Message-ID: <c92d5318-8c8e-434f-835e-61cf1fae4edf@kernel.dk>
Date: Wed, 8 Apr 2026 06:58:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] DRBD 9 rework
To: Christoph Hellwig <hch@infradead.org>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
	<ecf00b4b-c3f8-4161-a97d-3d23b423cabf@kernel.dk>
	<adXk_m3SbRcWTOIC@infradead.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <adXk_m3SbRcWTOIC@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
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
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[kernel-dk.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[kernel.dk];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel-dk.20251104.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.643];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:mid]
X-Rspamd-Queue-Id: 09AA13BC7E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/7/26 11:17 PM, Christoph Hellwig wrote:
> On Thu, Apr 02, 2026 at 07:30:35PM -0600, Jens Axboe wrote:
>> On 3/27/26 4:38 PM, Christoph Böhmwalder wrote:
>>> As discussed (context: [0]), here is the first version of our DRBD 9
>>> rework series, intended for for-next via for-7.1/drbd.
>>
>> Will you fixup the kerneldoc (nits) and the assigned-but-not-read
>> issues and send out a new version? Also looks this series doesn't
>> actually apply to for-7.1/block, patch 12 fails.
> 
> Looks like all this went in without any review?  Since when have we
> started these grand replacements anyway, as they are known to cause
> bugs and regressions?

See the previous discussion, the goal is to sync the two drbd code
bases. It's followed the "usual" pattern of the in-kernel driver being
neglected and development and users pushed to the out-of-tree one,
which is highly annoying.

As per the previous thread, the intent is not to push to to mainline
right now, but rather give it -next exposure without running into
conflicts between the trees. for-7.x/drbd will be rebased as needed,
and it's only in for-next for the stated reason.

-- 
Jens Axboe

