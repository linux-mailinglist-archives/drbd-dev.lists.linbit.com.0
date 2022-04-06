Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB954F6982
	for <lists+drbd-dev@lfdr.de>; Wed,  6 Apr 2022 21:02:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 878614205F5;
	Wed,  6 Apr 2022 21:02:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
	[209.85.208.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2F321420160
	for <drbd-dev@lists.linbit.com>; Wed,  6 Apr 2022 21:02:26 +0200 (CEST)
Received: by mail-ed1-f44.google.com with SMTP id b24so3753391edu.10
	for <drbd-dev@lists.linbit.com>; Wed, 06 Apr 2022 12:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=message-id:date:mime-version:user-agent:subject:content-language:to
	:cc:references:from:in-reply-to:content-transfer-encoding;
	bh=OfpP3FToADthuOwAPWrJH6xPsGNzfbxsbWzPcz+HJUU=;
	b=ICjsAPBiFJ2aL61uaN9fStECKZ8tlA38m/QJg1Y3rfrqAdyBH9toCNpHcn4GvBoRt0
	aCEiEB3mqz7RbUdfXPekJPPvOjHJpqP1ZoxAXv2nvoNuvV/l8QQwls+n50n4O9EE/cGz
	0WCVvkLVU7rVlY0FtKdjG8WUEFYwthIM+Fk4Ze2e9yIwamhGfjcsXgFaY0OlH5s3hQLP
	ZejvNw9JkDZ+AwslyuLl2bTzgpBApAIwr9qaxbQB/bRnS9WGIMUZqWls1gvSkQKWdj6e
	sHMTPw2wxuYxNsbE4PMJx46binGBIcDMXbO9Tp/lYqGSFO/VUI6U6Brx2EJPcv+FO1Cr
	UrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
	:content-language:to:cc:references:from:in-reply-to
	:content-transfer-encoding;
	bh=OfpP3FToADthuOwAPWrJH6xPsGNzfbxsbWzPcz+HJUU=;
	b=jXdyssqxmzag8djmM0NRjZrcb6/2L6ERv5CkUqKJv3UyQ9XQKJ/39zZ8e4Gk9xdV0H
	RxclQGqvwgo2AV7QZlGDm8IExpMMovbXw7SmS/wFrRsRPhE/8t4h+qRp2YCZ71+bKAiY
	YhEh+TzlKIc+Phi0h/9lNaghdXArIrdr5mCTIJxfZYj+Fnp1hPIQYsszjD7J5KgK1SP5
	PlUOSDZE+/YDpHuQ7KQ2KVhYXgsWhFcue15dLV9KMi4cDobf17Wgpe4OGrLT48FAeIVb
	1CDuGbx9PmgPGqJR4lQRjjCT2xoIfSYxgOHluQ3i+1UJxOxtRV5lzbVYFYiIzO85fICB
	k2SQ==
X-Gm-Message-State: AOAM531ifub+EJcT5H6dlLkstovgfCOwJql597EWOcH6QbTu5VGJzcbI
	cdc9PlUg/Z7K6JT6MzLrZGpXVm8D
X-Google-Smtp-Source: ABdhPJykGzEf/jskQs85g2EoyTbW6l43YOfNjRSLzsCjQGo1VYBj01LuJ/RmY17iS4PrdK0lmqa8wg==
X-Received: by 2002:a05:6402:f1c:b0:41b:54d2:ef1b with SMTP id
	i28-20020a0564020f1c00b0041b54d2ef1bmr10247933eda.185.1649271746623;
	Wed, 06 Apr 2022 12:02:26 -0700 (PDT)
Received: from [192.168.178.55] (85-127-190-169.dsl.dynamic.surfer.at.
	[85.127.190.169]) by smtp.gmail.com with ESMTPSA id
	jv20-20020a170907769400b006e7f859e683sm3256460ejc.19.2022.04.06.12.02.25
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 06 Apr 2022 12:02:26 -0700 (PDT)
Message-ID: <2563ca26-cda7-11c7-286a-35d6383f9d00@linbit.com>
Date: Wed, 6 Apr 2022 21:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
	Thunderbird/91.7.0
Content-Language: en-US
To: Jens Axboe <axboe@kernel.dk>
References: <60bf3e8f-9cfb-00d1-5fea-71a72ba93258@linbit.com>
	<e2035fff-01e2-0df7-2508-82b741615519@kernel.dk>
From: =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <e2035fff-01e2-0df7-2508-82b741615519@kernel.dk>
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [GIT PULL] DRBD fixes for Linux 5.18
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

Am 06.04.22 um 14:35 schrieb Jens Axboe:
> On 4/6/22 2:06 AM, Christoph B?hmwalder wrote:
>> Hi Jens,
>>
>> this is the first batch of DRBD updates, catching up from the last few
>> years. These fixes are a bit more substantial, so it would be great if
>> they could still go into 5.18.
> 
> Thanks for sending these, but you based the repo on my 5.19 branch,
> which won't work as pulling your tree will then result in me getting
> your 5.18 changes with my 5.19 as well.
> 
> As it happens, this is also a problem for your 5.19 based changes. My
> for-next branch is not stable, just like linux-next isn't stable. In
> terms of shas, not how it runs...
> 
> In general, for the block tree, here's what you want to base the changes
> on, using 5.18/5.19 as examples as current/next tree.
> 
> - If they are bound for 5.18, base them on block-5.18. That branch may
>   not exist if nothing is queued up yet, in which case just base them on
>   the last -rc1 tag for that series. That'd be 5.18-rc1 in this case.
> 
> - If they are bound for 5.19, usually I will have a 5.19 driver and core
>   block branch. Base them against for-5.19/drivers. If it doesn't exist,
>   previous -rc is a good choice again.
> 
> Usually post -rc2 all of the above branches will exist, during merge
> window and right after things are a bit more influx and haven't really
> settled down yet.
> 
> Now, there's also the fact that you're using a non kernel.org git tree.
> That's fine, but ideally we'd like you to use signed tags in that case.
> But not sure your key has been signed by anyone in the korg ring of
> trust? Since I've already seen these patches this isn't a huge concern
> for now, but something to get sorted out going forward.
> 
> Can you rebase your two pull requests and send them in again? Either
> that, or just git send-email the two series, that'll work too. I'm fine
> applying series from maintainers like that, it doesn't have to be a git
> pull request.
> 

Good to know, thanks for the pointers and sorry for the mess. I'll
resend based on block-5.18 and 5.18-rc1 respectively.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
