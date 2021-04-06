Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1A235579C
	for <lists+drbd-dev@lfdr.de>; Tue,  6 Apr 2021 17:22:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 937064205F5;
	Tue,  6 Apr 2021 17:22:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
	[209.85.216.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 979724205D5
	for <drbd-dev@lists.linbit.com>; Tue,  6 Apr 2021 17:22:17 +0200 (CEST)
Received: by mail-pj1-f54.google.com with SMTP id bg21so5063174pjb.0
	for <drbd-dev@lists.linbit.com>; Tue, 06 Apr 2021 08:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=E6z5kWwAl+1QNK1u0OVgaasZnxxYZm0UhtDBQU9NQyM=;
	b=Mv8FIUEgsM18zskQs7tY7B/k0o7lz07YKooRJA46pT3T4Fujs2+EngigMWz1SeXxk2
	408Wr1wqz8H6xFLG9imGxTklpi19vPMezpxq7NkXPUKoqZtcOp236xq6iXS6PZgoWnSY
	u9svYa3oMjpxZyz71mbTc+/G0S+PY7LxLoupiSd3xqQjmTjJNd/QITXAcJMPpdI9cmuN
	0v2+mgf65BG6o1u6vK2WY1mJSCLMXdZxysUQKoCdJcdHM3Q/Zv0GKV1ct2mwjmxokKcW
	NPW3PoCso53PC6Np4rG6b49qINu/V7X4j/Wi0lAHyHKj84Z+mD17W0DnEuxRS/v2fLyy
	mQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=E6z5kWwAl+1QNK1u0OVgaasZnxxYZm0UhtDBQU9NQyM=;
	b=SR4aZNNd8fJCgdiXkRm1MfrnZtSdr5ZZnYFqsA0bmAhb1ZZV9fRz+LYzLzEWJIuXcY
	WRin8IHcT81QCmb7Vq38m4pgumh2lYZvMBcDUV59lVmURLgUlb6n8n3LWblch/XOFKza
	A3cQqHaJE6/s6BfjRu8xa0IDrpAly0KQl+oiBMvgQdfvyOf5s1m+yeInBjFE91WURwrQ
	aC+hWt0k/+aM/Vg9x6af0aLPYahBoURrkhzUORwS/FJ8YuVwknYqzZokjjUyk5Uj4bi1
	RMHo9d18bSoC+5GsEk0BgcEiCw92hGkbfoiYJY7/zSfQMgDC5iUE1lUuYMmCDjNtlkgb
	bjNA==
X-Gm-Message-State: AOAM5316TVRE+m8/jU5wnQoHk7KKua8uYGlkKdPIO+0JTT3O+aAhYGb3
	EQuNGW9A7iKnPnhTTOKeB3a6xQ==
X-Google-Smtp-Source: ABdhPJwN5ZKGULvml9xEQa+VKvFePdAogoclt6woGJtjAIRk5kqlNGGROJTag2OMaBAe3myOkBprWA==
X-Received: by 2002:a17:90b:a0c:: with SMTP id
	gg12mr4750699pjb.184.1617722536134; 
	Tue, 06 Apr 2021 08:22:16 -0700 (PDT)
Received: from [192.168.4.41] (cpe-72-132-29-68.dc.res.rr.com. [72.132.29.68])
	by smtp.gmail.com with ESMTPSA id
	q22sm17686696pfk.2.2021.04.06.08.22.14
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 06 Apr 2021 08:22:15 -0700 (PDT)
To: Lee Jones <lee.jones@linaro.org>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <33a06c9d-58b6-c9bf-a119-6d2a3e37b955@kernel.dk>
Date: Tue, 6 Apr 2021 09:22:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210312105530.2219008-1-lee.jones@linaro.org>
Content-Language: en-US
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	xen-devel@lists.xenproject.org, Philip Kelleher <pjk1939@linux.ibm.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	Joshua Morris <josh.h.morris@us.ibm.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 00/11] Rid W=1 warnings from Block
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 3/12/21 3:55 AM, Lee Jones wrote:
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.

Applied 2-11, 1 is already in the my tree.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
