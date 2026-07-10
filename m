Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P/azCtXKUGq25AIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Jul 2026 12:35:01 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id B8EFC739C11
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Jul 2026 12:35:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=linbit-com.20251104.gappssmtp.com header.s=20251104 header.b="X5HH/bxG";
	dmarc=pass (policy=none) header.from=linbit.com;
	spf=pass (mail.lfdr.de: domain of drbd-dev-bounces@lists.linbit.com designates 159.69.154.96 as permitted sender) smtp.mailfrom=drbd-dev-bounces@lists.linbit.com
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 09C731655F2;
	Fri, 10 Jul 2026 12:34:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8AFEE160846
	for <drbd-dev@lists.linbit.com>; Fri, 10 Jul 2026 12:34:44 +0200 (CEST)
Received: by mail-wr1-f51.google.com with SMTP id
	ffacd0b85a97d-472326ca506so593290f8f.2
	for <drbd-dev@lists.linbit.com>; Fri, 10 Jul 2026 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1783679684;
	x=1784284484; darn=lists.linbit.com; 
	h=in-reply-to:content-disposition:content-type:mime-version
	:references:mail-followup-to:message-id:subject:cc:to:from:date:from
	:to:cc:subject:date:message-id:reply-to:content-type;
	bh=0hNKws68GKcsqG1qn9goDkKgmOz4q7bVaIJzV/ptteo=;
	b=X5HH/bxGQmnefBQE7P+jUlGCLcxM+6Rdaw+vLXzaeDCjAZvt+5JElpWLQACCVSIydg
	9Zq0MwnW1a3Av4ZvP44tVqPUrWBDlnfV2h6pouRKPJs/43GzA/HXMWlgtxQ1F0Agoo+N
	NhVYOB8HE87drxvLg59fIEKTcL7S+gyPLehvueLJ/M1f8Larw3e75AybNhl3EDMGjfTV
	Sbq5PJG0vyuYSxxHCiAR2EytIuKdDP+zg5jj2pXg2h2fN7K3ety2nsHtg6luoKdseCpQ
	nExF0gDwtwJGWvyPDKBZb4mYE87JWIYIAPek2Ej0EeU55q/TajTsp0piXXGL9+m8kiu2
	KvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1783679684; x=1784284484;
	h=in-reply-to:content-disposition:content-type:mime-version
	:references:mail-followup-to:message-id:subject:cc:to:from:date
	:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to:content-type;
	bh=0hNKws68GKcsqG1qn9goDkKgmOz4q7bVaIJzV/ptteo=;
	b=gtt9hTpBlAYwB+nWDQmEsYejCmFEwbd5V0xhSCyy0EkNIQY9bos0de+g/waQANNaiB
	GqQ20fnN3DUARVltbnJlagwC1ir6R4iRCJMIdhjDLkZ+jHpogJ0Cm30zXGvE7R9uFtJZ
	kuEC6sgjbLaKcnoD81MLbMbXdJvPow7zK4wFcjCByzMGtSCfytJM5zsOyGmldfO8XKzq
	SweLyW7s2vXaOr6N34PejgEFmsp40tXP8rROPY2pvEsJSMhJ9OiM+/aqtbTyYZTZmOo0
	zE5MdQ3ZKki+JwlJMJfWON8CGdSB3l9uLzgHlclc7nczf9x1rjm6yE+4ron87/6AG1XH
	vUVA==
X-Forwarded-Encrypted: i=1;
	AHgh+RrTilrDXzVuYOxUAzJKWWkwSNqsPX9YuJpGEVyVSu27ntJ8KrD0xh9sUogkT4Fz9cgdzg59VfidPA==@lists.linbit.com
X-Gm-Message-State: AOJu0Yx2jT6atXMQkcYgNaCxGukCsGeR+mJmTnnIPISC5oHBDA+ZqVqg
	MiaoRNrm0UFSX8MVfDsqLaxswP8g7Rt+UeepNAxxjH5PAmMvLgQW2bcNHiAJewAM0IGYBg==
X-Gm-Gg: AfdE7ckFlUSXNHUc8Y7AE8B7YZpZi2Jp+ggwgUJxy+rNQgcAy11QFtzU/NYbeKhyx91
	1rr5JGKsX1ToM9fL6NhXN+4Seq4wyOSXuKpiwBkEuaA9pDk3y8oJsvbF6TMyuaU16lUDlApnV8G
	8sWeCVJ0TWkTjkNce7GxzLm5JRr8Gi3qmsP2YV2RQTb4kMGIg6zuUfyEgSh/4sxIw+/81/wiKLy
	2Rvg0D98khlmMhJFg0Y1enirz+M5XtJWt569Bbgt+cOzVVFSk8PGze5dTaZ+7ivelHhjpaYlHUF
	CVZdWf9gdoKJtEDEwYTiUJduWNXEWIczJ8dQJrZSYqknl19RLs55jGLCS49Rfr1hGvOAxnpISLy
	3q39H6bG9PFOr9czWInGztgHef7gjNTjSYexnrJ5n0gPchf8R7zWz2RMwolv3qPZSJ2vMMQ9qzM
	8xGKDzHK710JVOxh5KTBqfVSDnQhkVjiPvbuwWohLejBJ52vIVjGmFl5ms
X-Received: by 2002:a05:6000:26c2:b0:47d:f01d:104b with SMTP id
	ffacd0b85a97d-47df077657cmr11701617f8f.46.1783679683738; 
	Fri, 10 Jul 2026 03:34:43 -0700 (PDT)
Received: from localhost (h082218129081.host.wavenet.at. [82.218.129.81])
	by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-47aa039bcdasm61474279f8f.21.2026.07.10.03.34.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jul 2026 03:34:43 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:34:42 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Tianchu Chen <tianchu.chen@linux.dev>
Subject: Re: [PATCH] drbd: reject oversized DataReply before signed conversion
Message-ID: <alDJWJYBNGpugftk@localhost.localdomain>
Mail-Followup-To: Tianchu Chen <tianchu.chen@linux.dev>, 
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	axboe@kernel.dk
References: <d4924afb559896a4a22258f14e4a97c8d12d8527@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d4924afb559896a4a22258f14e4a97c8d12d8527@linux.dev>
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.91 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tianchu.chen@linux.dev,m:axboe@kernel.dk,m:linux-kernel@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,linbit.com:from_mime,localhost.localdomain:mid,tencent.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8EFC739C11

On Tue, Jun 30, 2026 at 10:59:31AM +0000, Tianchu Chen wrote:
>From: Tianchu Chen <flynnnchen@tencent.com>
>
>Discovered by Atuin - Automated Vulnerability Discovery Engine.
>
>Reject DataReply payload lengths that cannot fit in recv_dless_read()'s
>signed size argument so a bogus remote peer cannot wrap the length negative
>and turn it into a huge heap OOB-write.
>
>Fixes: b411b3637fa7 ("The DRBD driver")
>Cc: stable@vger.kernel.org
>Signed-off-by: Tianchu Chen <flynnnchen@tencent.com>

This is similar to [0], but the mentioned patch is a more complete fix. 
There is also a case in recv_dless_read where data_size can underflow 
when a data-integrity-alg is configured.

The other patch catches this case as well by placing the guard later, so 
I would prefer to apply that one instead of this.

Thanks,
Christoph

[0] https://lore.kernel.org/all/20260710022837.3738461-1-michael.bommarito@gmail.com/
