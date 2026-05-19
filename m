Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLWRLnXNDGrAlwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 19 May 2026 22:52:05 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA91584E08
	for <lists+drbd-dev@lfdr.de>; Tue, 19 May 2026 22:52:05 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 30997164D68;
	Tue, 19 May 2026 22:51:53 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B9029163174
	for <drbd-dev@lists.linbit.com>; Tue, 19 May 2026 22:51:49 +0200 (CEST)
Received: by mail-wr1-f46.google.com with SMTP id
	ffacd0b85a97d-448528f4e69so2774116f8f.3
	for <drbd-dev@lists.linbit.com>; Tue, 19 May 2026 13:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1779223909;
	x=1779828709; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=6WCYsOu0Hdsv3nYRv+K8TQXlAkq1BjCEa9xNFJ1ynkw=;
	b=BEM3EGY2Io4iOOdlszah8rZFQWtvBtqzqSRa0yESMCLDInxKV1yOiXC9ncwb1Rg76s
	L51jUWLK1hxkYr1tim4vTYw6xdUWCfKvbaiOv6LBkTptOfj7YPL7+ap6p8CHj55y4aAN
	b2qed2udFpVax+3CPSZaBY+UsbdnaIelUKHksbJrharzhe/o6BvPBlNXmvMOVOYJKR6S
	KR60q+Fq9nWg2yK343VV3Cx5AhlUa6BO72wQTDerZeeojAcdeFm1kAHzw4Ca46zzKRsR
	1y6CxN0799cNvUlLatbSLRRkSC1DLOz6Tv/kAbyfABTX7+Q+yzvAxFPrlA8n39w/XHCv
	Oy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1779223909; x=1779828709;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=6WCYsOu0Hdsv3nYRv+K8TQXlAkq1BjCEa9xNFJ1ynkw=;
	b=ktZLEtKoQHU8nQIoNiCTpwwzpmy8X4hMMr2DwDVrRxVmotoEk2XHodavA9VluNzrPE
	Z8aKGbropAnLuedQGYByocmleIRBN/QVfNWVXVHo7pfCYtcvb97Jasr4cym8vKJdUf1h
	cdjXnmYVeVeVLE6gPBVn9YJi5bDrROSNjDN5+AWAGB9SBRNl2uTRbAYhxRHWK7a4AU7t
	PMVg+2dGvMham9KiIiz621e/Nbi7IvMvP7V9vkY3EAWEZhcjLTpOQpjrxM8O5Ap5Up4w
	jnqIF6cQMBOEh3JCoQ2j8xc30jYMvqiBEAKBUImUSXhjowy5olWV/YsV8Ehso7qoSZpQ
	yP4A==
X-Forwarded-Encrypted: i=1;
	AFNElJ+pbegpp2ZkJZPrQFjphAhVBJJ3JeRFclKPYKaGXwBK7RSjXqi84zHrIhMBHBWU7StsPFV7G9MIuQ==@lists.linbit.com
X-Gm-Message-State: AOJu0YwG9Wb+I8sqTWW2W+0e3Vqv3szi9AsXPew99SC787TNQ1+HtKoP
	Z1HjfIfcadXE+btzwOIuQee29oa6zVpSW23GmYeLZrUyJdUL373YeXG6Fmge4IbyxaG3lg==
X-Gm-Gg: Acq92OEhGnDWabqUYboxONLrHKt6+3VRBRg+83un61Z6mW/MkHTjbbfWGiY+mfRNVaI
	HbKskqVMQo3dvxKffTINnb/OD2Hqcf6kgjHruZY52brvbAqL4yJLrLFIakzMZQvmQrt5zsFAqwW
	1iIOLTIRp7zk2ODkFKT5N6vY3mx3xLNfovpwFoZkl48HF25AfJSWxQFdYBLGc/P5rj0YOnlGksk
	xQDL1LAzRVAyC7HRrkgHIwdzO6tmc4CW2yucfzi60Knmcn5HZCG0jddzpu5utf87+ydfwYFmsWz
	zHt9i4uHx406i1jLGEGckvFytYLPoaRF4CAGHT9hh4aAnu5JXGB6lPtQHrpul/zB/v/AUw+uKSh
	T3PQGrZOxBSnmvRv8Qnt0mATJoMB9t9p5173zz8Am8/x2uWHV+wBLn/kIe4UR+PrxTx808/htrw
	r59KzjEuWC+GyF8gVWpFnu82Md5k/tVEtB+RxrUQLa2aFyBrzGk0pNO0z5iNZ5vzXXlHBE8jt26
	AIP3lqgomlXw2cJwngP0CfrUindj/JnsPI=
X-Received: by 2002:a05:600c:8901:b0:48e:526e:1040 with SMTP id
	5b1f17b1804b1-48fe63021f9mr298522225e9.23.1779223909230; 
	Tue, 19 May 2026 13:51:49 -0700 (PDT)
Received: from [10.61.154.145] (91.141.120.117.wireless.dyn.drei.com.
	[91.141.120.117]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-45d9e767cb9sm46504270f8f.2.2026.05.19.13.51.45
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 19 May 2026 13:51:48 -0700 (PDT)
Message-ID: <65088b94-a603-4e84-8601-0663f85303b9@linbit.com>
Date: Tue, 19 May 2026 22:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drbd: remove unused drbd_nl_mcgrps[] array
To: Arnd Bergmann <arnd@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	Jakub Kicinski <kuba@kernel.org>
References: <20260519203057.1340528-1-arnd@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260519203057.1340528-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-block@vger.kernel.org, drbd-dev@lists.linux.dev,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
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
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_SPAM(0.00)[0.461];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	FORGED_RECIPIENTS(0.00)[m:arnd@kernel.org,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:axboe@kernel.dk,m:kuba@kernel.org,m:linux-block@vger.kernel.org,m:drbd-dev@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:arnd@arndb.de,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,linbit.com:mid,linbit.com:email,mail19.linbit.com:rdns,mail19.linbit.com:helo]
X-Rspamd-Queue-Id: 6DA91584E08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 22:30, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After the rework, two files have a copy of drbd_nl_mcgrps[], but one
> of them has no references:
> 
> drivers/block/drbd/drbd_nl_gen.c:641:42: error: 'drbd_nl_mcgrps' defined but not used [-Werror=unused-const-variable=]
>    641 | static const struct genl_multicast_group drbd_nl_mcgrps[] = {
>        |                                          ^~~~~~~~~~~~~~
> 
> At the default warning level, -Wunused-const-variables is turned off,
> so this has gone unnoticed.
> 
> Remove the extra variable.
> 
> Fixes: 8098eeb693c4 ("drbd: replace genl_magic with explicit netlink serialization")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Oops, looks like a copy/paste error on my side.
Thanks for noticing and fixing.

Reviewed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
