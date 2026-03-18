Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCwZCjMXu2kffAIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 22:20:51 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id C5D0F2C2ED8
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 22:20:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 15CFF162ECD;
	Wed, 18 Mar 2026 22:20:50 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
	[209.85.161.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 162A21622B5
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 22:20:46 +0100 (CET)
Received: by mail-oo1-f41.google.com with SMTP id
	006d021491bc7-67bb4e8955aso231093eaf.0
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 14:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1773868845;
	x=1774473645; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=0xibiGMBk9lH88oePns/vWYwaj+whDxl4whT6dU143Y=;
	b=BPvWogGhliVAy28M4R61NMkYmCYCNDtX11NtXVUtNDLpMTWdbL16YjzzyMh2wFUmpR
	Mg9QHNt2YSiUIhbZfjF7f3AXe4t2fBC9IEbkO1GRlqF7sbFn1/BLWMSuy08jmxHVHjMR
	ZbkIyqJYXx87mub2T9fs04fNzydhQhQf93j+7C/UI9a3kB/mSyHQbqg8J2lXU+YbN/gf
	OXJTONZM6vrPj+N6q7bVgPT0Vq2P+ao8RkrqR5HAqBpqpexK31Gg+KpJAiiwbpX+HM08
	0bLaTZ802H0+/0zEWi+2WVfnygY0Lxzt2eepcseuMmo42qNoQAm+4eBTtb06x/2hPRTI
	DUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773868845; x=1774473645;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=0xibiGMBk9lH88oePns/vWYwaj+whDxl4whT6dU143Y=;
	b=iDptD5sZlowigmKKaHbJCo9r5x/9e+GNpRdqO706I2+YpnpstNbHgpYsBOxz1cLBOV
	DB1AMLfR6h+YEbBGPCQeGsZ7UloBpwj0HFca6ebzqaM/muU9hiZ94tVJPSBdgZQawvBP
	ZN/SmkuiWJos/vFg/s5HSA6gfhbADc1ZqsPnKHEtCSXoZNFdT/EP4ihB+uBup/fwKdTT
	WeGlyG5A6qR1uucmjfjZjE47SLnjnuVYv+ykXAz+i7F85etKvdmOLu9LWtKn2YaLuDjo
	V6nqnCRxmyoz5ZfoZMIYUuFMrWa3xJnk5hYnktixSNIFDzBWBxfvGwsUT95JuVKctv5Z
	aRKg==
X-Forwarded-Encrypted: i=1;
	AJvYcCXZaBHUFSePWHLjG+YfUdH6e4I0tp9bT8XXREi3jBfbZjQ2wZAu6+efhjWsZAPMajULrh/gYAymXA==@lists.linbit.com
X-Gm-Message-State: AOJu0YxDtA8gvcC4FPXp2EZeDoiOZ1MxXsClJWBN6XEG/rVlrINNCvN1
	BkFeBIB7kyxBPI2jFIo4IjylClfxczfGG+uUiWM+subgpcDZGvuDsy8R7/vbp0AkTmM=
X-Gm-Gg: ATEYQzzLf223X77tM5H2lqigvO4bKUFw2F698VdfyYnedYcUFIF4oXogdkkYeM11Utk
	gqnUDFFbUkbr4MTJaMn5XR2tIU4XKZbiv6/zVMkHy37JdzIvk/R+hflLL1phSuzOx2YpT83Wcd1
	Bjw1Dxd51+4g2/ev2I64Ihq9PYEPppDMRd/BbUksRNfE7u5MYCY5VQ247g0VA4tVxDhfHiCXXga
	lEs76I4TsZpoTcCDrajrVw2kpIvqK1dUtJBo1j7T8NGNBMW8+nZBrnj2jjq9Ush4CLbeYxtcrbB
	CJjFIg6xhLmD7LlZJSrCTP/Q2USHC+UM9Jd2PtkT40aY2K7VqyuYgC1CpgU2fvZxldusF3alIhB
	tFqgtQGWr4iusLBZfCHEmPSJQ975X1dK85dDBN2r+j0B5PsxqgPgB5rjALIvdWOJdEb77xoRA78
	+GBBiodR0FYI11ZUBEvZY7rwMYVHfxnpzARwSSw6trqNbtzb49pKaa1R0MH90FovpVAF+2CccR0
	Cpfxw2s/3ULVC2jgv0=
X-Received: by 2002:a05:6820:1505:b0:67b:e4a1:9e66 with SMTP id
	006d021491bc7-67c0da88405mr2941966eaf.22.1773868844883; 
	Wed, 18 Mar 2026 14:20:44 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
	by smtp.gmail.com with ESMTPSA id
	006d021491bc7-67c0d89ca52sm2373456eaf.12.2026.03.18.14.20.41
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Mar 2026 14:20:42 -0700 (PDT)
Message-ID: <af209f39-b2d6-4573-b05b-286f849fd815@kernel.dk>
Date: Wed, 18 Mar 2026 15:20:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drbd: Fix typos: "receive_peer_dagatg" ->
	"receive_peer_dagtag"
To: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	Colin Ian King <colin.i.king@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com, 
	linux-block@vger.kernel.org
References: <20260316202549.33978-1-colin.i.king@gmail.com>
	<ea558bc4-3efe-4eca-9da6-56f4a5302056@kernel.dk>
	<f67a657b-bec5-404f-9435-a69f11b7e396@linbit.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <f67a657b-bec5-404f-9435-a69f11b7e396@linbit.com>
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
X-Spamd-Result: default: False [-0.61 / 15.00];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[kernel-dk.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:colin.i.king@gmail.com,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:linux-block@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coliniking@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel-dk.20230601.gappssmtp.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linbit.com,gmail.com,lists.linbit.com,vger.kernel.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[kernel.dk];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: C5D0F2C2ED8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 3:13 PM, Christoph Böhmwalder wrote:
> 
> 
> Am 18.03.26 um 20:05 schrieb Jens Axboe:
>> On 3/16/26 2:25 PM, Colin Ian King wrote:
>>> There are a couple of typos in drbd_info and drbd_err messages.
>>> Fix them.
>>
>> Doesn't apply against for-next?
>>
> 
> This is against the drbd-next tree, which is included in linux-next
> since a few days.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Next/Trees#n267
> 
> I realize this is a bit awkward, since there is no way to really know
> which patches target linux-next and which block/for-next.
> Is there any specific way we could handle this to make it easier for you?

Yes, send the patches so they end up in the block tree rather than add
another tree.

-- 
Jens Axboe

