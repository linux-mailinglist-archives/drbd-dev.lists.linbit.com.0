Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Cd0GpD3umlwdwIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 20:05:52 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4762C1C74
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 20:05:51 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 41DA91627CC;
	Wed, 18 Mar 2026 20:05:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
	[209.85.167.170])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4A34016096B
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 20:05:35 +0100 (CET)
Received: by mail-oi1-f170.google.com with SMTP id
	5614622812f47-4671cbce2feso148091b6e.3
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 12:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1773860735;
	x=1774465535; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=3O9yp9YjA8SKMzZSgAh+Zo3Mazffp8wu/lSnpv1/5u0=;
	b=aQ4V+BZ7Nxa7izq5bcdk8vfWKiKoFZNPfdSPHQHgel4/IsUI4ZEDYm2Rr+pCc7SHvO
	svfBS994QsonE3dV/H2DS/NqnCmbV9hrljHgYRL1o+zRdaq4p/vD2aMS4ZQL851dD7J4
	bVg8Ft+8aBeOVDAHJmsNCINqw4khew+1JZIh9TO94kBW2urLKbOhZodMAQTKwW1FTcux
	9uVnwROopJXX+YSpG2WlRFPH2Pt+OzWB9lM9z6UmHtzfjspDWAXseF77sd5ptdd2pnYc
	4OJoJoU8PrCtNEjzp6DuJe5XBGKP8CueFBmPO+Xo9tRriECzbNDUI3OwvMR7+ChawuDo
	dnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773860735; x=1774465535;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=3O9yp9YjA8SKMzZSgAh+Zo3Mazffp8wu/lSnpv1/5u0=;
	b=dNgc7+IC83cPEcZskGpLpEatMqoARCzBwQPRB4UBMHMWrcpDO1cwQ69FRMMZmWRP1X
	nxOhmEAmLMXJMaJuVXqOAN6pjFWnwp1/NsHlFMTH7ux1TaW50aVdXhJNThEseEHH8mtz
	crb8SvYL4Wv2pJdd06v+oZMm/JbC23xVAUitHivg2vxnjzIVeUp5QnSExsZUcwJnivzP
	4zZML/suaFfy+WbkmTZ8A8R0w6dCT5wXV2fvxM3X7NHQNVZSI9rG2yW6USprA6pEJKMU
	RkEvkbINBq2JaYAR4l18fUJKjdTR76qAG5NrfKSWpVdUK2sQ/ixQudxVp8SOIjrqrB3J
	MAmw==
X-Forwarded-Encrypted: i=1;
	AJvYcCWUXFPc88oUVrPLYAvzP3mIRpAH1HLGITtg3etkb9g1R33NjAf8Qd7VPHQvJ0CHGVigbaizt80K9g==@lists.linbit.com
X-Gm-Message-State: AOJu0YyD1XGjqityHtj/kxT2D+XoP9FIZG/K1tEF9gN+Y8jfyN8QQerU
	HuvDHo1b3zU6JCT2cIJeFsyJnEejxQ4HfRVc0Lan4vOLbq3oValAPH2v1IR2vL/i2g8=
X-Gm-Gg: ATEYQzx2zL748BtB3VJssfe/IGWDHPLY4waiw0EqSNWH3/L2L+3OvG9ZfEkjkmvZDHJ
	sWbPkp16qFX+WvtY3qCb614JmLiH1NSFXsBx7C01Eds3IRAqlaulpClwby+J1t32SGbfC2tteB9
	w5gSnOW1IfdBY9KAKg3MxsDJ2XHq/xqxI1Gt+CQcChqwP/yZn0x2S9rsZzVyDo6RFbj2cenDb2l
	XgvQAIzRA0541pDyWSn8Xwn6bLLkz/3Jt2XanRtilXOqjjUJGzttViEOWaXeVhmrppzbAMQO5cd
	urMFC9oA2DbTjM8fJLa/C9XjU0qgw26jMhE+Ze0k2nv3fH75uhMwKaCvofQJwQKeNLI0WJtHN72
	eFf0wb6PJkEQc5N9a8yHUZ8Jkg4BGvwG0MqdB7RurATKj0kx1mWQJzy5GgZFdkPmMn8VwqtcF5Z
	8P0NKyWl0PQqdVeZpq3vff3kbFOcOV7LcMAp1k/h5/BT7CYIsqI1v9BIZTf4IkoHnmyUWjTd8NT
	fJABBV9
X-Received: by 2002:a05:6808:179d:b0:45e:e07d:4eff with SMTP id
	5614622812f47-467ba216488mr2658412b6e.21.1773860734890; 
	Wed, 18 Mar 2026 12:05:34 -0700 (PDT)
Received: from [192.168.1.102] ([96.43.243.2])
	by smtp.gmail.com with ESMTPSA id
	5614622812f47-467cb465136sm656777b6e.0.2026.03.18.12.05.33
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 18 Mar 2026 12:05:33 -0700 (PDT)
Message-ID: <ea558bc4-3efe-4eca-9da6-56f4a5302056@kernel.dk>
Date: Wed, 18 Mar 2026 13:05:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drbd: Fix typos: "receive_peer_dagatg" ->
	"receive_peer_dagtag"
To: Colin Ian King <colin.i.king@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
	drbd-dev@lists.linbit.com, linux-block@vger.kernel.org
References: <20260316202549.33978-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20260316202549.33978-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[kernel.dk];
	FORGED_RECIPIENTS(0.00)[m:colin.i.king@gmail.com,m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:linux-block@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coliniking@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linbit.com,lists.linbit.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[kernel-dk.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel-dk.20230601.gappssmtp.com:dkim,kernel.dk:mid]
X-Rspamd-Queue-Id: 0B4762C1C74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/16/26 2:25 PM, Colin Ian King wrote:
> There are a couple of typos in drbd_info and drbd_err messages.
> Fix them.

Doesn't apply against for-next?

-- 
Jens Axboe

