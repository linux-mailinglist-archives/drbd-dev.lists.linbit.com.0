Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIVIK0UWu2nYewIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 22:16:53 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 613E82C2E88
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 22:16:53 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 69FCC162809;
	Wed, 18 Mar 2026 22:16:42 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 88B74162774
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 22:16:37 +0100 (CET)
Received: by mail-wm1-f42.google.com with SMTP id
	5b1f17b1804b1-4853f2826f7so2522745e9.1
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 14:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1773868597;
	x=1774473397; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=6JSbsrYhFg+Au4jgvX758AnPNxCSSto/QgL2aLSvMGI=;
	b=pUnn/pPgqpnT1UwoSEzq+AUUt6YrxSnXxVx2O8DTXGjqiQMZ+8eXZTPcIWpFaRGy6t
	CWyQOVtbkSzmcQMoPFcufv7uACInGVsxeO7CNAS1nl4oAeF1S/6N8LoEX1SJf0cotQis
	iM2FPICwVH5vwWcL17GR+8JSRfQAlDPfQzw+Uceet/ayZuX8pWg1XWwnPtUOkIbILlEP
	2xPgNdnLy2sy4SN1UrR/gAELK5j7mxMmqt0kNYjg2HNx1KyrzrMKWH4M6hRr9G/qPoQe
	RkrQaecHZJnl8+QhNZUs5QkkPcFHeoICZjyovjA3YnGuuwZ3ok6VEkhLw8yrjY9bHVPr
	F4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773868597; x=1774473397;
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=6JSbsrYhFg+Au4jgvX758AnPNxCSSto/QgL2aLSvMGI=;
	b=qQ8afzrgqj3oMI5kjyXud0QeNQBy0ywuNAA32Nep8bIcs70tOh3ZELV9WpVYeBq9Xs
	LZiIjk21/iAJ0VQh889hy+UwHhXXu5fJGxbe+6mqQsrmew3jG9ZoYPlRzfBbwFBQab4L
	Zk12RgM2Y0eMW9ERoRvLspQg7BoZGk8yZCWpFaxgj7vih5tgWJIhI3hipcqSIvRWYTMJ
	rjCWS1Kd9xcidDl00v8iVdLnNtffxrvOxBFRDn8dRMrbui12I4pMFhUrlf/GkCS9EeGk
	c3rWBdPxwfHsPJ2VOsgAOhuZm6usxoDjwISLZ3o8AA7DHDceosZ1cryXHZZqaDOQ6h1S
	i0Sg==
X-Forwarded-Encrypted: i=1;
	AJvYcCUoChOBS56cCeQS2OU05MtMzoNRtVu2Pa3VNTsShBdfAuiJs9EuWcVCKxKKwbwip7uozIv0qsMIAQ==@lists.linbit.com
X-Gm-Message-State: AOJu0Yzkm2iDcd7MkgpnpLmLR8GLvXR7A+0rHCa5+GzFrGnmLTuGszE9
	XTdyeYZWYAYx8PEriDX6YsOBVMhLX6fcBZU5i+XGgjEjma8Lp0NVHRH1+mCiP5qsipRRmg==
X-Gm-Gg: ATEYQzxUEj8VnADiWkvh7OWpcBJA8PFhOPhEcRkeMj2UC6/iniadhjRks421CI67kAE
	62zSjNI1lFKpi26pIc8PVh6XBDinDdA0BDQcMIU6wSsKwVlsgQ9/aZE4ejAscjYiEvrh+0HxSp5
	p6h8ucdk/lxo3z+pLinXMe7T7hmzSiSKtxF5ZvYq5yL1x6hkSRSLGdCV3DQMGT89tnby8qrRaIH
	urb5AT+ZSIlJIw/qzR4DFWrs76qvxAh0JQrGi/oHX0am4meuIB4TRoQA3ay/KpaAn47j22h7sTM
	dH0MSkRMusnYI9BW685p5xHJIJsipKsLOwc2LXCJWjZ5csRDZ19Phq1TCg/7dzB7E0CnFcCsiBz
	seIwEWvvJXXNqNqpYDE/zJsocBIWCtp9o162ug+m17udueJ64G5/tjuL7DVMmm3thrPKzg9IBdR
	Av3//xvPncTFX/yegodycls//ZPiGFqGAM30zMWqQDwTAz46B9xOYhGbx/W3+/O/zafCZqYkGlf
	IE8Lmg/jH/Q1x8=
X-Received: by 2002:a05:6000:608:b0:439:c69f:503a with SMTP id
	ffacd0b85a97d-43b527c4df0mr8143039f8f.27.1773868596733; 
	Wed, 18 Mar 2026 14:16:36 -0700 (PDT)
Received: from [192.168.178.55] (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43b51892244sm11628020f8f.22.2026.03.18.14.16.35
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Mar 2026 14:16:36 -0700 (PDT)
Message-ID: <6b696861-ac39-4a87-a2fa-ad47a75031c6@linbit.com>
Date: Wed, 18 Mar 2026 22:16:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drbd: select CONFIG_NET_HANDSHAKE
To: Arnd Bergmann <arnd@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20260318104858.1868731-1-arnd@kernel.org>
	<20260318104858.1868731-2-arnd@kernel.org>
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Content-Language: en-US
In-Reply-To: <20260318104858.1868731-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@google.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Simon Horman <horms@kernel.org>,
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:axboe@kernel.dk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:arnd@arndb.de,m:ebiggers@google.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:horms@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.612];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,linbit.com:mid]
X-Rspamd-Queue-Id: 613E82C2E88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am 18.03.26 um 11:48 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The TLS handshake code is optional and has to be enabled for DRBD:
> 
> ERROR: modpost: "tls_handshake_cancel" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
> ERROR: modpost: "tls_server_hello_x509" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
> ERROR: modpost: "tls_client_hello_x509" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
> ERROR: modpost: "tls_get_record_type" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
> ERROR: modpost: "tls_alert_recv" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
> 
> Select the option whenever DRBD is eanbled and rework the dependency in
> the symbol so it can be selected more easily.
> 
> Fixes: fa8ef6960ebd ("drbd: add TCP transport implementation")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/block/drbd/Kconfig | 1 +
>  net/Kconfig                | 4 +---
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
> index 29ec6ed84251..de9e232d6479 100644
> --- a/drivers/block/drbd/Kconfig
> +++ b/drivers/block/drbd/Kconfig
> @@ -11,6 +11,7 @@ config BLK_DEV_DRBD
>  	depends on PROC_FS && INET
>  	select LRU_CACHE
>  	select CRC32
> +	select NET_HANDSHAKE
>  	help
>  
>  	  NOTE: In order to authenticate connections you have to select
> diff --git a/net/Kconfig b/net/Kconfig
> index 62266eaf0e95..769880113740 100644
> --- a/net/Kconfig
> +++ b/net/Kconfig
> @@ -92,9 +92,7 @@ source "drivers/dibs/Kconfig"
>  source "net/xdp/Kconfig"
>  
>  config NET_HANDSHAKE
> -	bool
> -	depends on SUNRPC || NVME_TARGET_TCP || NVME_TCP
> -	default y
> +	def_bool SUNRPC || NVME_TARGET_TCP || NVME_TCP
>  
>  config NET_HANDSHAKE_KUNIT_TEST
>  	tristate "KUnit tests for the handshake upcall mechanism" if !KUNIT_ALL_TESTS

Thanks for the fix, I applied it to our drbd-next tree (which should end
up in linux-next).

I would prefer to squash these kinds of fixups to keep the history in
our patch series clean.
Arnd, does that work for you? How do you prefer we handle attribution?

Unfortunately I couldn't really find a clear precedence pattern for
this, how is this usually handled?

-- 
Christoph Böhmwalder
LINBIT | Keeping the Digital World Running
DRBD HA —  Disaster Recovery — Software defined Storage

