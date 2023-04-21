Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2886EB4FC
	for <lists+drbd-dev@lfdr.de>; Sat, 22 Apr 2023 00:36:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 43C5D4252CB;
	Sat, 22 Apr 2023 00:36:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CB4EC4252C1
	for <drbd-dev@lists.linbit.com>; Sat, 22 Apr 2023 00:36:19 +0200 (CEST)
Received: by mail-pj1-f53.google.com with SMTP id
	98e67ed59e1d1-2497d8066c9so497171a91.0
	for <drbd-dev@lists.linbit.com>; Fri, 21 Apr 2023 15:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20221208.gappssmtp.com; s=20221208; t=1682116578;
	x=1684708578; 
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:from:to:cc:subject:date:message-id:reply-to;
	bh=15RShbsbHafAtkHP7bE1KcywW8eNaWBCC5WwysBd87o=;
	b=X268rOQmAauSwpFpkoX8A+VMI3nbTHDxHe03vObHL12UvaNQ9OZDDghjH9vFasft+g
	PYxDZ2ddlEnrBvSZCCswbGQjuj0a4dR+kh2mJ0z22UZa2NwQu3fbel/NVm1GcQyaY2D+
	O50k+TmBf4HHRjAIC8Ls3kC3p1dwuD7vfBIye6nZ4HPWbaqWdHXW444BirS8nDiLAtUU
	iCsGJUjimDoRzGfcImcCPFqeDTmyul4Bzysh1Fcv0SrV/e/frNSAMaHCrzc2xVjC/QHk
	wid15bGQMFWU0GREAmCPjVoJuZjI3Ed7vrEJlHnKEii0hoXezMgBGw0KFsqu2RUatHhR
	JkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20221208; t=1682116578; x=1684708578;
	h=content-transfer-encoding:in-reply-to:from:content-language
	:references:cc:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=15RShbsbHafAtkHP7bE1KcywW8eNaWBCC5WwysBd87o=;
	b=DenZGUdWhWpuANGv7MzabUhLdgyPyK59jgN5EX+EV61kDnfZqirEIbdXgObXS2Xxc2
	89NBKr4MtFmnNQSshWKn0GlzJsrMXhE0eV3Q0FUSxNjtsmBWrLimAgIV0d7uuhuyfvv4
	O6pq/LCfyaJuS0BWTYtn8T49IOIGnlRXkdjIRzu6oTIOytv4xYUSjWltd+RMZK6MqlVk
	Aw1Qjz6Fyi1g0P/pKyvOp/0GN7fBTt23cQB5Z3kZw9Zgbmx/uXTCu6czrAw/RsO/OvS+
	iMkiw1I9mixSfvYfRiuCUrnScngLDDzo3F6p09bUf4uj7j3YVgVrTg64YKLl0/Mdb/lB
	8shQ==
X-Gm-Message-State: AAQBX9cJZ9ZWTHtsKDvdlOiDsSPmeMt+vc25Ttfg2kET9beEJnyi7rBm
	0TLGT+5JL2sHqlYQLZdkvGIzrQ==
X-Google-Smtp-Source: AKy350Y1d3Fo78/V0SBbMlTnA/KEzF4Q+15jV06Q1VNcWOt1KOIozBpCp75pUHwmvH01uVtRJ4USXg==
X-Received: by 2002:a17:90a:195d:b0:247:446f:7d05 with SMTP id
	29-20020a17090a195d00b00247446f7d05mr6076988pjh.0.1682116578148;
	Fri, 21 Apr 2023 15:36:18 -0700 (PDT)
Received: from [192.168.1.136] ([198.8.77.157])
	by smtp.gmail.com with ESMTPSA id
	il7-20020a17090b164700b00247150f2091sm5021149pjb.8.2023.04.21.15.36.15
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 21 Apr 2023 15:36:17 -0700 (PDT)
Message-ID: <e032f210-f8cc-6441-2481-3c5341f8e72f@kernel.dk>
Date: Fri, 21 Apr 2023 16:36:13 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
	Thunderbird/102.9.0
To: Luis Chamberlain <mcgrof@kernel.org>
References: <20230421195807.2804512-1-mcgrof@kernel.org>
	<20230421195807.2804512-4-mcgrof@kernel.org>
	<ZELuiBNNHTk4EdxH@casper.infradead.org>
	<ZEMH9h/cd9Cp1t+X@bombadil.infradead.org>
	<47688c1d-9cf1-3e08-1f1d-a051b25d010e@kernel.dk>
	<ZEMOeb9Bt60jxV+d@bombadil.infradead.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <ZEMOeb9Bt60jxV+d@bombadil.infradead.org>
Cc: djwong@kernel.org, philipp.reisner@linbit.com, linux-mm@kvack.org,
	dm-devel@redhat.com, agk@redhat.com, drbd-dev@lists.linbit.com,
	Matthew Wilcox <willy@infradead.org>, hch@infradead.org,
	p.raghav@samsung.com, senozhatsky@chromium.org,
	snitzer@kernel.org, linux-block@vger.kernel.org, hare@suse.de,
	kbusch@kernel.org, da.gomez@samsung.com,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	minchan@kernel.org, patches@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [PATCH 3/5] iomap: simplify iomap_init() with
	PAGE_SECTORS
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

On 4/21/23 4:30?PM, Luis Chamberlain wrote:
> On Fri, Apr 21, 2023 at 04:24:57PM -0600, Jens Axboe wrote:
>> On 4/21/23 4:02?PM, Luis Chamberlain wrote:
>>> On Fri, Apr 21, 2023 at 09:14:00PM +0100, Matthew Wilcox wrote:
>>>> On Fri, Apr 21, 2023 at 12:58:05PM -0700, Luis Chamberlain wrote:
>>>>> Just use the PAGE_SECTORS generic define. This produces no functional
>>>>> changes. While at it use left shift to simplify this even further.
>>>>
>>>> How is FOO << 2 simpler than FOO * 4?
>>>>
>>>>> -	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
>>>>> +	return bioset_init(&iomap_ioend_bioset, PAGE_SECTORS << 2,
>>>
>>> We could just do:
>>>
>>>
>>> -	return bioset_init(&iomap_ioend_bioset, 4 * (PAGE_SIZE / SECTOR_SIZE),
>>> +	return bioset_init(&iomap_ioend_bioset, 4 * PAGE_SECTORS,
>>>
>>> The shift just seemed optimal if we're just going to change it.
>>
>> It's going to generate the same code, but the multiplication is arguably
>> easier to read (or harder to misread).
> 
> Then let's stick with the 4 * PAGE_SECTORS. Let me know if you need another
> patch.

Just send out a v2 at some point, you've also got a number of cases
where there are superfluous parenthesis, at least in patch 4, and Willy
pointed one out in an earlier patch too. Didn't check the last one.

This will be 6.5 anyway I think, I already sent out the changes for the
6.4 merge window.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
