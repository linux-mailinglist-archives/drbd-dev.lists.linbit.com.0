Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4007028BCAC
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:44:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 248674207A9;
	Mon, 12 Oct 2020 17:44:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4CE1B4206D0
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:43:15 +0200 (CEST)
Received: by mail-wm1-f66.google.com with SMTP id 13so17548467wmf.0
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:subject:from:to:cc:references:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=YL5AsViXRIQPP3nnxcSAhXVd5Sclqys9qPKvqwTLE3s=;
	b=UWWp4BZFErE8EkLOXl3eb8kjpquH54EI3+v3ItDX36znwaQU+olIOlu6+hBwxOZpWl
	v92DyGIAB9TCV6FrOfh67OmTPeAQaSjqFEvpT1b79dNplZDD0kzPClP+0JGMOFAwpZAm
	EG3gqRHNJbvSs5IY9tU1YScASUk1SV7K9H+lZuDkkZJu2vb0dghRv33ksDUxk085WCVI
	Lo6n8r1yPlLcNlBxlYI1QnHE+t4EmByip0hlTOKrzHbYKgNPGIPzOfLMB2+Sdecb2+s5
	vsrb5l7qVJEirANW+4u1Yo4rsIeaYM82NxzE3urzWo+AqTDOh5c2fSV7TvQN+JPJnrYF
	Wyrg==
X-Gm-Message-State: AOAM530JRm14F0co2SRvyZIJtCzO4SXv6GE5v/8VR19lwvMDYXU3PbbW
	5A+oa8UEe/4W0Go+EHYeM+VTKCJzRWYQTBB1
X-Google-Smtp-Source: ABdhPJznVttuWTmD81qe5+CSpbgeVvasc0rcSmbWYP+/E+cDx1Dsk1faZLJPi6NdYLS0UU3ZF6o1Nw==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr11416954wmc.4.1602517394845; 
	Mon, 12 Oct 2020 08:43:14 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	71sm24524930wrm.20.2020.10.12.08.43.14
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:43:14 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:43:13 +0200
Resent-Message-ID: <20201012154313.GZ2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CD8CB42034D
	for <drbd-dev@lists.linbit.com>; Wed,  8 Jul 2020 19:46:41 +0200 (CEST)
Received: by mail-ed1-f66.google.com with SMTP id a8so41317434edy.1
	for <drbd-dev@lists.linbit.com>; Wed, 08 Jul 2020 10:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cloud.ionos.com; s=google;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=YL5AsViXRIQPP3nnxcSAhXVd5Sclqys9qPKvqwTLE3s=;
	b=BqwoeXzur9qY11GAMh8iUS8wGsJEaXOu2GlYF9jXCFgA4X/LbKWhkRlLbsGxsG4quO
	f/4ysQmlHFGhJyoq10wTbkMfhmiaBsNc/6LD79S5LL7nk8O5mZQQFIFcRS9uWFgy4IIQ
	tB6N3b53MhWziui+miF3b0ZhtRstiXMCJNKJwdMbglH0Nq4IXSPvcNMvQ2dNhF2iyTnN
	QIDtf/436iYjsDa7O1Dp18YI0wV83hP9tp0QVsGMC9Ckd7z/HknurMgHhL1EgFxJFAcZ
	5rKUOn6Wj07Oexl0x6NksHsjJEyaH6pkSntiMwZfbtFTQ5mYC+OxC6OuMo4+8q/PFLaO
	kc1w==
X-Received: by 2002:a50:fa07:: with SMTP id b7mr66457602edq.298.1594230400781; 
	Wed, 08 Jul 2020 10:46:40 -0700 (PDT)
Received: from [192.168.178.33] (i5C746C99.versanet.de. [92.116.108.153])
	by smtp.gmail.com with ESMTPSA id o15sm166196edv.55.2020.07.08.10.46.39
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 08 Jul 2020 10:46:40 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: Ming Lei <ming.lei@redhat.com>
References: <20200708075819.4531-1-guoqing.jiang@cloud.ionos.com>
	<20200708075819.4531-2-guoqing.jiang@cloud.ionos.com>
	<20200708132704.GB3340386@T590>
	<ad89a0b2-3b40-b515-2120-85bc0274165b@cloud.ionos.com>
Message-ID: <1796891f-66c3-09c4-559f-15d1d350d817@cloud.ionos.com>
Date: Wed, 8 Jul 2020 19:46:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ad89a0b2-3b40-b515-2120-85bc0274165b@cloud.ionos.com>
Content-Language: en-US
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH RFC 1/5] block: return ns precision from
 disk_start_io_acct
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 7/8/20 3:53 PM, Guoqing Jiang wrote:
>>
>> Cost of ktime_get_ns() can be observed as not cheap in high IOPS device,
>
> Could you share some links about it? Thanks.
>
>> so not sure the conversion is good. Also could you share what benefit 
>> we can
>> get with this change?
>
> Without the conversion, we have to track io latency with jiffies in 
> 4th patch.
> Then with HZ=100, some rows (such as 1ms, 2ms and 4ms) in that table
> don't make sense. 

Hmm, I can still output those rows based on HZ_TO_MSEC_NUM, which means
this patch can be dropped since the cost of ktime_get_ns is more expensive.

Thanks,
Guoqing
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
