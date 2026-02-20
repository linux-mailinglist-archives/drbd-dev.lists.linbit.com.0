Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEENMCNrmGlXIQMAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Feb 2026 15:09:39 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 63C291682F8
	for <lists+drbd-dev@lfdr.de>; Fri, 20 Feb 2026 15:09:39 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 089D91627B9;
	Fri, 20 Feb 2026 15:09:27 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
	[209.85.160.41])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F3126160922
	for <drbd-dev@lists.linbit.com>; Fri, 20 Feb 2026 15:09:24 +0100 (CET)
Received: by mail-oa1-f41.google.com with SMTP id
	586e51a60fabf-4152698e745so751333fac.1
	for <drbd-dev@lists.linbit.com>; Fri, 20 Feb 2026 06:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1771596563;
	x=1772201363; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=6agG1a/ZZ7prFDRVGuF7sIP7aaRyumONnsIWUYhmn9E=;
	b=1jPQetTEPts/6lolrPT3Xwq3oor2EI+PUfxmBePsGPP7UX67q+XX3qR+1qxJwwYwuO
	ZaVqJaBJ/9wOGsLoMOcSEhgOS8hSHbowzS4fFRuAY0OWUROv2EmyS+Uy1cFLs2GjQ8xM
	hG9dbCKA6XBjVp2RGnY+UGtW30ZJuT0sZ5ZygD5FvGW3uvCngaExSHTfeav86LGYM2En
	s1tV18tR+575bMCRXYQoINzDSO0pEhb4dDOsKbzxH2F7NyqSiDe/rf44d83yhCATxulZ
	Bqcukb9DgArzs8HGkzSApM7IWQdkyTE9sLe6ixryU05pOWCluUwCFNnFWhXQJ/OjISXk
	MmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1771596563; x=1772201363;
	h=content-transfer-encoding:mime-version:date:message-id:subject
	:references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=6agG1a/ZZ7prFDRVGuF7sIP7aaRyumONnsIWUYhmn9E=;
	b=wtkPwNd84bUWVuW9b9uPy3WYFXIKLPSnf26Lc1pSGUvlRIf0Bj7gIbVUrFa9ruAij8
	54VJ+NHXY1Gy8jbhxd4FAMMLZcg8fHkPmtxMt+HLFik/qkNU4fIIwKIgb0Bmeqrt/LBc
	BpRM18+d3XRyKikaxWiJzb3KtijfyMrylY34iew2Ub/tpIQ0vOe9NhsILp2COvmqRXbk
	Y+uvYtcXzX77mPLwSSpxUXVTOhqYa/GUJyKf8vxU8AI4UBpAcSR2zFBBeoAE1RqYHv4J
	zrSLdZ7U0lOtyoq4Z3Gp42ihNVctQeqo2rWfiz8CtmVbEQfo7Uogzyc27P6RigiKLpoI
	Voig==
X-Gm-Message-State: AOJu0YxFmwiIOHa9pRE6mw2IOlh64InnK7Y2wsCbeL4FCt5+AzVfvvJT
	sPN1FuIVOvqdLFUjaoMjRaOIASKAnC9VpMeOsM5zkkRrxKjrcF8ynNIHaFkYAEeMWgs=
X-Gm-Gg: AZuq6aIMLqOiODqYzTT5Kp5/HJ8p3x35BdW1wKe4+s4RSmIoozmBA0Px0W5cNXx7mZO
	ky67VbyERrXVw+111Mp+aGvKbV+/NItN2G0ZcoSBJgPVE5r21jzZlaNYQ+wGpxSuKkDob07UvIz
	LGA3/9RKatTIOtWkrJOJT3B5BC+2vjIwwV3vsw1tghtkqppyg6KAF5lWywnZPmKY9IZJ9gY7/Iq
	EgIIQU1pqoPeBBrG10U7FqmIP2TvBMreNPqbHm76ifkYYzvp/rMIHzG4yubZmTxUNL9Cnx6MS+q
	RfOrPcFRjLQTnym3OFS6vTWM4ux6RWvka5owjGXgGnE4DxjMCObxVx9UNhUlA98hdoDfktK36O8
	F0wnBk+9D3FpRpn+EwmLBCIhEUZfIFm/zKK+azSZjLt+8P3+g3LLkmmWGiEYEkFIkGLiYJxeT0V
	HPhzjomj0Pz6S3UvKlmY6jF01dWGLqvwMX5rQyAC+GGSusY9MFkD0N0Fb84/MUUISAaXgVwb1Jm
	eNsGg==
X-Received: by 2002:a05:6870:6b0a:b0:40e:dcbd:e92d with SMTP id
	586e51a60fabf-40f0d1bbcafmr13285290fac.0.1771596563456; 
	Fri, 20 Feb 2026 06:09:23 -0800 (PST)
Received: from [127.0.0.1] ([187.199.77.89]) by smtp.gmail.com with ESMTPSA id
	586e51a60fabf-40eaeb42708sm27916776fac.0.2026.02.20.06.09.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Feb 2026 06:09:22 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260220113937.2691322-1-christoph.boehmwalder@linbit.com>
References: <20260220113937.2691322-1-christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH] drbd: fix null-pointer dereference on local read error
Message-Id: <177159656185.567740.9381187974299808709.b4-ty@kernel.dk>
Date: Fri, 20 Feb 2026 07:09:21 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
Cc: Philipp Reisner <philipp.reisner@linbit.com>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Tuo Li <islituo@gmail.com>, drbd-dev@lists.linbit.com
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[kernel.dk];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:philipp.reisner@linbit.com,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,m:islituo@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linbit.com,vger.kernel.org,gmail.com,lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[kernel-dk.20230601.gappssmtp.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.964];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[axboe@kernel.dk,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kernel.dk:mid]
X-Rspamd-Queue-Id: 63C291682F8
X-Rspamd-Action: no action


On Fri, 20 Feb 2026 12:39:37 +0100, Christoph Böhmwalder wrote:
> In drbd_request_endio(), READ_COMPLETED_WITH_ERROR is passed to
> __req_mod() with a NULL peer_device:
> 
>   __req_mod(req, what, NULL, &m);
> 
> The READ_COMPLETED_WITH_ERROR handler then unconditionally passes this
> NULL peer_device to drbd_set_out_of_sync(), which dereferences it,
> causing a null-pointer dereference.
> 
> [...]

Applied, thanks!

[1/1] drbd: fix null-pointer dereference on local read error
      commit: 0d195d3b205ca90db30d70d09d7bb6909aac178f

Best regards,
-- 
Jens Axboe



