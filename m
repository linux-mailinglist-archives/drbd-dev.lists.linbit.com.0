Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMWkMZLGumlobwIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:36:50 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 6DAC42BE5C0
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:36:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 42BD9162805;
	Wed, 18 Mar 2026 16:36:38 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 35430160904
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 16:36:35 +0100 (CET)
Received: by mail-wm1-f48.google.com with SMTP id
	5b1f17b1804b1-486507134e4so24073995e9.0
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1773848195;
	x=1774452995; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=2z7/lL0P74ieZc6NvB+xXjYjCxDI3Y0Z54tFhE7jN5g=;
	b=1u6mzNCY3BN2tV371uYY/pr6UMqKCeIFluBTzYHW9D4yF9mIVHudIwyZe7Q+FWIf/x
	oOATkG0ncrzfNJcYmHhzpzgPS0apRQbp6X/VzdpQCO3Pf0mz8PYWAoqhLPve37c1d7IN
	3v0u/hQSZ8ZBuVC1oFepf5XBbF2lBx9lHEpDjhyJYj+JpQbcbWxyZRIMRSkjLkgXMwRq
	NzYpPqBeM2Hwh51ImRCIKG97NCThAvd7BcDXceiVucb1NVChbPBBeD3xlEneZqVQWpRf
	nrZJM6RKNO5R3LbXgY1BsU2CAcklarwEu3en9/j/z9TxlezkHmc8Vn8ZY8PxkhxTWGCs
	lv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773848195; x=1774452995;
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=2z7/lL0P74ieZc6NvB+xXjYjCxDI3Y0Z54tFhE7jN5g=;
	b=hpQz00ImidSFh5OxqU5mt2wJmJMkMIkBIEsJnOlOAulVuDWIX7Ou8MzxGKTRE8Z74k
	70Uy8EWJNO5z+bFz4jVy7u9GsQzCsJIMqIn/nRC1ebmIPWf80XWNGJa3YOn4+8nScylA
	WR0rvGX8VbWw2wzFOKqWGVWYI8yr3bA+jaLJeV3Z/rAHKXE8immytlc5faark0jtNU+x
	b2G5ftlxDYn4xUH9TZOaLnn6a6+CooOeECmeuRbbo4jKUQvcIg98kGO/+dVLorjMf+p8
	SPDB072nU4CLAnfWPhxm2Um+uZp5D4011YRWrawDrIJlea9zZmLNE1d2qlijxLaRwBmd
	Mi/w==
X-Forwarded-Encrypted: i=1;
	AJvYcCXNwKQcnPKcIP90j8uOcSOIXi0RVm96aHdIj9uuL1j8R5ccd3xWak7Nm0fUgPJJ074jsS4CP3yM4g==@lists.linbit.com
X-Gm-Message-State: AOJu0Yw/sKBZQrF+BkKnJJa/qKYvsFvilbVEJ9YXlhsm9VG+8Pf5g65r
	cXD9BIm6xYUH3zLSaY5iJ0hKHcUNHk635GTuOTY2RrImvgYj5Awdj1XerrT++wkn3CGPKw==
X-Gm-Gg: ATEYQzw9hsvD4/Hji5O4NzSPqDBcDxchlQUeFE0u3rSNgNbx6f7/Vbvqt/+25SYQPQB
	E19wWF2jclwn2MOFmz8gQRfRjOJW9ejU4cHiMwSzPrpiIGHBPYM9MNseWXE1RFZA2lgo1S09Km2
	RXNyfmEZSJEqQmI4zygbpGyMXdB/EMWM5Qp3fZuC42gytPJpC0w2QJCAujBbonf1TRdcA8mzs1S
	jv22kzW3MlZdi9uNVsFGGD6IEyX6F1Wh7nfBrNbgGWBI2oV6PMi45uKq88t4atVOhuiqq3P9edz
	7MKPLqJN9d4gcSnhd1w6xGXFA5Q2qPbVOc/zSDtMgA2ALfVBcAzXkrl7A1sidDbQ57t2eNXTMSZ
	ZTccYMj5AS8CifDt0IG9IJ6GwNcIDP+CM7uXsUYwW7FSydaPsk+uYyJ8DVK1fKUQ6tg9lNvf5GD
	6XtJCxGaEw/OegG2JGDDKtVyjOmQOfjcR3zB7WcoFgHL052UpVKxGTX/Vu8KQ1JRVSXgHZz3YO5
	cHWxKYpd6NF2i8=
X-Received: by 2002:a05:600c:34d5:b0:485:40fd:8390 with SMTP id
	5b1f17b1804b1-486f4457b0fmr61544675e9.26.1773848195353; 
	Wed, 18 Mar 2026 08:36:35 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-486f45f7e96sm44031415e9.0.2026.03.18.08.36.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Mar 2026 08:36:33 -0700 (PDT)
Message-ID: <faf5b12f-03a2-4d8c-b333-7fc275ec3191@linbit.com>
Date: Wed, 18 Mar 2026 16:36:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drbd: fix rdma dependency
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
References: <20260318104858.1868731-1-arnd@kernel.org>
	<eeb73048-d5ae-4fbd-9920-1395a3ca51eb@linbit.com>
	<c3daa9b5-3741-4a18-9bbc-7bad1a2e0c1b@app.fastmail.com>
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
In-Reply-To: <c3daa9b5-3741-4a18-9bbc-7bad1a2e0c1b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
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
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:arnd@kernel.org,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:axboe@kernel.dk,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:ardb@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.571];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 6DAC42BE5C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am 18.03.26 um 16:31 schrieb Arnd Bergmann:
> On Wed, Mar 18, 2026, at 16:24, Christoph Böhmwalder wrote:
>> Am 18.03.26 um 11:48 schrieb Arnd Bergmann:
>>
>> Seems like we raced here, I already (supposedly?) fixed this on the
>> drbd-next branch.
> 
> Ok, I assume that will be in linux-next

Correct, should land there today.

> 
>> My fix is this Kconfig:
>>
>> config BLK_DEV_DRBD_RDMA
>> 	tristate "DRBD RDMA transport"
>> 	depends on BLK_DEV_DRBD && INFINIBAND_ADDR_TRANS
>> 	help
>>
>> 	  RDMA transport support for DRBD. This enables DRBD replication
>> 	  over RDMA-capable networks for lower latency and higher throughput.
>>
>> 	  If unsure, say N.
>>
>> And then just this in the Makefile:
>>
>> obj-$(CONFIG_BLK_DEV_DRBD_RDMA) += drbd_transport_rdma.o
>>
>> That should be equivalent, right?
> 
> It's close but not the same: 
> 
> - INFINIBAND_ADDR_TRANS is a 'bool' symbol that can still be =y
>   when CONFIG_INFINIBAND=m, so you'd still fail to build
>   BLK_DEV_DRBD_RDMA. You still need a dependency on INFINIBAND
>   (the tristate symbol) itself, though you probably also
>   need the INFINIBAND_ADDR_TRANS one that I missed
> 
> - I incorrectly assumed from the earlier Makefile logic
>   that the rdma transport exports symbols that are used
>   by the common drbd code, but I now see that the opposite
>   is the case. The difference is that for the case of
>   BLK_DEV_DRBD=y, CONFIG_INFINIBAND=m, my version force-disabled
>   the RDMA transport, while it should be in a loadable module.
> 
> It seems both versions are wrong then, but just adding
> 'depends on INFINIBAND' on top of yours should fix it.

Yes, ADDR_TRANS is needed because we need the infiniband "cm"
infrastructure (for rdma_connect et al).
Right, I did not catch that we need CONFIG_INFINIBAND separately as
well, but that seems logical.
I applied the combined fix now.

Thanks,
Christoph

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

