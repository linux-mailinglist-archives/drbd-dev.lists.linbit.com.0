Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPLlK2vrjWnG8gAAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 12 Feb 2026 16:02:03 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 3167412EB88
	for <lists+drbd-dev@lfdr.de>; Thu, 12 Feb 2026 16:02:02 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DBA7D162ECC;
	Thu, 12 Feb 2026 16:01:48 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F3EF3162EE8
	for <drbd-dev@lists.linbit.com>; Thu, 12 Feb 2026 16:01:45 +0100 (CET)
Received: by mail-wr1-f46.google.com with SMTP id
	ffacd0b85a97d-43284ed32a0so5562424f8f.3
	for <drbd-dev@lists.linbit.com>; Thu, 12 Feb 2026 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1770908505;
	x=1771513305; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=+5IOSasBlsX0Zq7MQwRuynmqCbpOzr3vQNsDoSWsb48=;
	b=yAtI5hFKz4NuZTDBg2wgkssCiSfvbwcGc02N5a7QMsvVep2gItmY0m4sz8tLhaO4gQ
	n/GCjN2i2UMxkGlQjoVNJ+U/qlV9rvub0sl2nckXngWnNTRM7bQUAgNiBhIAoEku3eDF
	YwnURHrn8KoWrn8ZGxxvbkuIU2aGyp7yDVgmN6EO6JuQvjD80bsr6ylov1LWlRnGuO3V
	FDIl9wZcoj6vqPhfPYJRY7o2H+IWImyKgBvRKoNECDRHmYoKCbRszvhKFd1IokIrea+m
	jwN3iRFGZ40WOdTVrILavbIHfGlMTTHdb3YQcgATVRtjDwKBp8wpgCciYMWNNhAHl5GT
	Lxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1770908505; x=1771513305;
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=+5IOSasBlsX0Zq7MQwRuynmqCbpOzr3vQNsDoSWsb48=;
	b=kYCQpOT0P6xph6jjJx1thmtRHwLBJ0Y5ARFpqpUDyNs7LjzdY1/GnIyppavHz1z/MO
	MMgwoWRjmpQoPy92/4xvZqiLjYLqAohAYMD1B4qsFeetm4+u/2yOIBRA5fuTOeNEKmVc
	nvL94AExjPMV1rakS9bc22yJ3F8HXayo0sP0yNqCOxxYDQXtf4JMXZaa+GEVGagKaRiI
	CwopA64z8DSBI4qsiVWStBwhsNu4m739XNrmhLReg65ErGrdhfabai9o1jxSCY9RqKqd
	YcHuFOR5xD7JENiIKvEJz0XZIrZoP/pZhGZx2JFc3P6npHuKM2rcQJsA814Ido+bGCGn
	0ldQ==
X-Forwarded-Encrypted: i=1;
	AJvYcCVaQIfDCubRk0FnURZytpf3DKMkiBEXz+s7XGlPSTKQs0W3FxQG7KXkG+vPtZKDX51S2RmqKDj/pQ==@lists.linbit.com
X-Gm-Message-State: AOJu0YzD1BdWpy05Ps0YszmFlb1JF8EOg77OA6A+Q3JYbj21iCOkrmKg
	2oI24WuSGfiBH3KPAFPRyd8oWJzhemplNJU/c3IJYxs0HKRSwAph0Uyv0QzDVdXNmajgqQ==
X-Gm-Gg: AZuq6aJghu8rVxw6GbLMMZe9Z2L3uj3puNOgtMOArEMEZML04lyjwjEjaSzT027Xb73
	6f7S9QDbRG0pNzTlNuJ9/WZzZVqw1pDK5Q0/LLpkQaIaj5d1RPA7OZLfe4gNR4McN1GTVVYkwbK
	O25Xel1p3hlw3aKc02AHopzRc84l8gOhyGcQkQj2NHZ0TjhXSYzjdiW9xv4dj1HqUF6oiKsJnSy
	/dyiOvFh8GdghHspG1Yz89Jb/1P6ktBdHz3UhMjVxGaEYoVyXZHG8iJ4+FPDc+J/U7BFKxsIfAS
	eqP3t0ievPrZrBYpCMWfZoXctTBjECc9twiPE6xAg2f4GDMI6i2J8hDyzkz+J/ej80FQcIeHv8R
	XkPnviU1Nfyg4iOw3xmnP6TAVBalAgWRmCWeQ7krbujSZeJw11Q2D5rDb7RR3sPgq66ODTI5bho
	YQmN+RUCGrWCI9px5BIGRKZH0iHQJyQYJWwM6U6NuZ677HetQD1CjsnEr6W5z6vcIntEwWoxXDN
	lXUta9qzvYafLGAUjW7CfMFSQ==
X-Received: by 2002:a5d:5f84:0:b0:435:e436:7fb with SMTP id
	ffacd0b85a97d-4378acaba28mr5911570f8f.50.1770908505145; 
	Thu, 12 Feb 2026 07:01:45 -0800 (PST)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43783e5be13sm12942474f8f.35.2026.02.12.07.01.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 12 Feb 2026 07:01:44 -0800 (PST)
Message-ID: <eaa83421-a07a-4ee7-81ad-f32d4a237ff8@linbit.com>
Date: Thu, 12 Feb 2026 16:01:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drbd: always set BLK_FEAT_STABLE_WRITES
To: Christoph Hellwig <hch@infradead.org>
References: <20260205173928.3166880-2-christoph.boehmwalder@linbit.com>
	<aYWNhtixUGuj3hat@infradead.org>
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
In-Reply-To: <aYWNhtixUGuj3hat@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.35 / 15.00];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 3167412EB88
X-Rspamd-Action: no action

Am 06.02.26 um 07:43 schrieb Christoph Hellwig:
> On Thu, Feb 05, 2026 at 06:39:29PM +0100, Christoph Böhmwalder wrote:
>> DRBD requires stable pages because it may read the same bio data
>> multiple times for local disk I/O and network transmission, and in
>> some cases for calculating checksums.
>>
>> The BLK_FEAT_STABLE_WRITES flag is set when the device is first
>> created, but blk_set_stacking_limits() clears it whenever a
>> backing device is attached. In some cases the flag may be
>> inherited from the backing device, but we want it to be enabled
>> at all times.
> 
> This looks like a bug.  If an underlying device requires
> BLK_FEAT_STABLE_WRITES, the upper device needs to inherit it.

The current block layer logic actually seems correct to me. The
underlying device may or may not require stable writes, but regardless
of that, DRBD itself definitely does need it. In blk_stack_limits, DRBD
is the top device, and DRBD's backing disk is the bottom device. If the
backing disk happens to require stable writes, this would indeed be
correctly inherited.

So the only missing logic is that DRBD still wants to enable stable
writes for itself even if the backing disk does *not* request it.
So it seems to me that this patch is the correct fix for DRBD's special
case.

Is it not supposed to work like that?

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

