Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Fu0ACm+jGmisgAAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 11 Feb 2026 18:36:41 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 995FB126A8D
	for <lists+drbd-dev@lfdr.de>; Wed, 11 Feb 2026 18:36:40 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF5801630D8;
	Wed, 11 Feb 2026 18:36:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
	[209.85.210.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 42B72163029
	for <drbd-dev@lists.linbit.com>; Wed, 11 Feb 2026 18:36:21 +0100 (CET)
Received: by mail-ot1-f43.google.com with SMTP id
	46e09a7af769-7cfd65ea639so1472298a34.0
	for <drbd-dev@lists.linbit.com>; Wed, 11 Feb 2026 09:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1770831381;
	x=1771436181; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=/rr/w2c7EIo7OZJZ+OxFGePVTYG5jzNDKtZOfHNEMKQ=;
	b=QB51L5VlLQBMTj1zzwSYHhZbkU4OKWUesAQuVpiyuq/SACUg4RMcBoQUyJ5JnXgFrL
	n/pVyGRwPIFz3XaBaczXMp5TNmHW4Ec5z/vp2FQTIffgyPNI4xFDUWYWhv1V2sv7XcJA
	XkazSn9L6CRfQc7WEiZxiHRFg9LeWMxxAVqScuOX5x8SessM2X3Cuf14yK7vR6HPPqtE
	gSd/qNcXbrsYWOVmZcxDUJdSKq4TFqXvjzfR70n4avVxbdbhRgR6wtCmAujx+MdvZuMR
	rIhwOsIzgibgH9PTtg0sn7mclquFnRyF4vBKAYP8+3UyV2n+XfJwhHRX1jjf8ar/W8o6
	mUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1770831381; x=1771436181;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=/rr/w2c7EIo7OZJZ+OxFGePVTYG5jzNDKtZOfHNEMKQ=;
	b=CpMHby8ovhBb5Q1H2Xp768pxeGzH5e0cWGVIFVTUAEzfPd7Dzx/dSqCN3gBebylDd/
	TwJcMCjESeCU5H3R0On8kunLI8F4xB1GEa52pqHIYW5nLTW0T9SeL2KZgWcWNTmNqwf7
	ZTAaZhDMVEhSDS4r45T8ml+jx6Qd//Ryfj9Gxi34wf0a50jGwjlJhC7/FzMJiLf5hGId
	B/zAbvV1W0W2TkHcFP4fokPaNlof/aEKaqWX7Rkc4yvlSVKyprev8YEW0aLj1Xcjk+0u
	+EvYq1tLTAzPk+uUcnTK1UpJc2zjJ6ZgTOlfGGar7vj//YvPPr9IbzmmAcMHufJl8c37
	lfKw==
X-Gm-Message-State: AOJu0YyBvG2HFEtnwjYROmMZUPAiOBvonOIdZbEXxyMO9QknwZfY/RH3
	ykua7spZm5LLylPKM6kwQNEmg7Y/WRx0ksgewX9HiToq7M44T2TfHqqseUjpXD5oyqs=
X-Gm-Gg: AZuq6aLGww8siwScxeyceWgfzw1K+QaCseTLbZh/vs+EFgw0j/d17YlSpttSbvRgfn1
	kUB7e7UBTrA47kvVEBQdctmb4rbQH50WdUvQ2f8YL0D6C4r0vk01JCA+4Mtiaq68Ce7WkVxkfpU
	8cNNovIXJWMXPARaXL+khxUmvymruyImGk+M/jle540RFrZdrN3O67V2f81n9oDwCWr6KvpaNp+
	4gwzGDa9kHSUNpxbWTyLg7zY9qAxSutH54oaOUj/UdJUn/3VxrsFzfknHOQWn2UHu+QUIGnt3CW
	XCL8pGi79+x7AhFrnJ7aHD/b705NfXu14adXOVJVBvUb3uB5JHt+eRWRTkI88DhARfXrx3WD6Gi
	kp39NiVcHXJDrkXBClX5NZaZhKd8TZiKyp7CElD17LPgqV8EWLDXck+1XgteDPfFxU0x1fxdTFj
	ClZw6iVAZpF6TJ/inayJdNA1VOGWvBjCxhq+dbDVMWROHkTTH96YTqq9YVP0OqwfB2whhUswmlZ
	FYcL/W77F1MXg==
X-Received: by 2002:a05:6830:4389:b0:7c7:6043:dd93 with SMTP id
	46e09a7af769-7d46440c084mr11369980a34.13.1770831381098; 
	Wed, 11 Feb 2026 09:36:21 -0800 (PST)
Received: from [127.0.0.1] ([96.43.243.2]) by smtp.gmail.com with ESMTPSA id
	46e09a7af769-7d4a76e1b0csm1640690a34.14.2026.02.11.09.36.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Feb 2026 09:36:20 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260205173928.3166880-2-christoph.boehmwalder@linbit.com>
References: <20260205173928.3166880-2-christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH] drbd: always set BLK_FEAT_STABLE_WRITES
Message-Id: <177083138009.157276.14024749739595076725.b4-ty@kernel.dk>
Date: Wed, 11 Feb 2026 10:36:20 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[kernel-dk.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[kernel.dk];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[kernel-dk.20230601.gappssmtp.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:mid]
X-Rspamd-Queue-Id: 995FB126A8D
X-Rspamd-Action: no action


On Thu, 05 Feb 2026 18:39:29 +0100, Christoph Böhmwalder wrote:
> DRBD requires stable pages because it may read the same bio data
> multiple times for local disk I/O and network transmission, and in
> some cases for calculating checksums.
> 
> The BLK_FEAT_STABLE_WRITES flag is set when the device is first
> created, but blk_set_stacking_limits() clears it whenever a
> backing device is attached. In some cases the flag may be
> inherited from the backing device, but we want it to be enabled
> at all times.
> 
> [...]

Applied, thanks!

[1/1] drbd: always set BLK_FEAT_STABLE_WRITES
      commit: 2ebc8d600fb907fa6b1e7095c0b6d84fc47e91ea

Best regards,
-- 
Jens Axboe



