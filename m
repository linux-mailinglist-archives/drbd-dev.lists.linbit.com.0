Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id A45625801C
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jun 2019 12:22:17 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id D548F1028A78;
	Thu, 27 Jun 2019 12:22:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 467971011B9A
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jun 2019 12:22:13 +0200 (CEST)
Received: by mail-wm1-f52.google.com with SMTP id v19so5086688wmj.5
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jun 2019 03:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=4C33zeX0C3oHqhGACjvRI1N/UHELWCKA1W07cUuOHVg=;
	b=XRLQR6fMlhkkbUZHXs1wDkMS2mQAIHkxZj8GRtF1+LIwpl928s2OgIeciGEliPMZB+
	X9MCAuCMXpWwRph0R00Zzr75RcqcxhHVwJc3HyDzA9fk4dZue1aDCI8TvQCP4IXMNZdr
	8z2Hp+lSwWV2bwag8VkpiowKViUf5KGOtuzzaUzO2pPvSCZiFZOPmliD7GO3IJrgU3GU
	5Zrzez2FvEWvrCyhazQzutr0D4kxD1jG08hO12DpCmfNpAIASC3bRC6je+DExfHEQ4uu
	8RRRsR2GiXluSk+Q83c2PzICHWFOjRZ6poUkch6molfegtxb57ZR9qsO6o9B6MKF09kT
	h3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=4C33zeX0C3oHqhGACjvRI1N/UHELWCKA1W07cUuOHVg=;
	b=Xztsord/8Bz72TJsUKFcF6/2OqQWeLeJGqAbi/rB4tbXzNTLnDf0e/LTQZK9/wzIYK
	nUrJZabkb39S/iwr0XzazOQifwlqKnsuCyMC8emv/jimuA4cnPMX3rltQRmXi6/c61RX
	1IBw3q3U8rWTp/g5B/MDn150M+gp0RunUha5b5LhpeUcPD0Wq3PUBfFiqq+QbbjWibIU
	LTuR2dIp9MMDFBVB1M1mAac6QGen972R/rYiZVEBv0e7sTcwHkrLVmzpCU7x0uyLCVPE
	nDwmhiwEKN86o359luTDHGv5RJmjcJ5eQ0ETns6KiNn/geFcBzS/m3T0GTe8WF6hUoHF
	SD/g==
X-Gm-Message-State: APjAAAXXCty70w3i53DjL747pufIYsa6ViSzt/BOl3dNdOemgZSNA26A
	Jh/y71pVavXz4S0Tu/OQe8k4RBQWXCHF6S71
X-Google-Smtp-Source: APXvYqwu562T9i8j/4a7enPu3IXdjqRAXvTw9n6zdlDTW4EjJ6WABIECyMdMAs/LTFE3qNVMsrIIhg==
X-Received: by 2002:a05:600c:c4:: with SMTP id u4mr2761961wmm.96.1561630933033;
	Thu, 27 Jun 2019 03:22:13 -0700 (PDT)
Received: from ?IPv6:2001:858:107:1:b121:699b:66ac:c10?
	([2001:858:107:1:b121:699b:66ac:c10])
	by smtp.gmail.com with ESMTPSA id x6sm2355968wru.0.2019.06.27.03.22.12
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jun 2019 03:22:12 -0700 (PDT)
To: drbd-dev@lists.linbit.com
References: <alpine.LRH.2.11.1906210638010.3326@mx.ewheeler.net>
	<20190624154946.GU30528@soda.linbit>
	<alpine.LRH.2.11.1906261914150.1114@mx.ewheeler.net>
From: Robert Altnoeder <robert.altnoeder@linbit.com>
Message-ID: <27d9a6d5-6ee7-be44-8d46-2dc15d466307@linbit.com>
Date: Thu, 27 Jun 2019 12:22:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.1906261914150.1114@mx.ewheeler.net>
Content-Language: en-US
Subject: Re: [Drbd-dev] Checksum based resync block size
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 6/26/19 9:20 PM, Eric Wheeler wrote:
> On Mon, 24 Jun 2019, Lars Ellenberg wrote:
>
>> As our in-sync/out-of-sync bitmap tracks 4k blocks,
>> we want to compare 4k checkesums.
>>
>> Yes, that generates "a lot" of requests, and if these are not merged by
>> some IO scheduler on the lower layers, that may seriously suck.
>>
>> make_ov_request() is what generates the online-verify requests.
>>
>> What we potentially could do is issue the requests in larger chunks,
>> like (1 MiB) to the backends, then calculate and communicate the
>> checksum per each 4k, as well as the result.
> What if it were to calculate 1MiB chunks (configurable) and then 
> invalidate all 4k bitmap entries in that 1MiB range if the hash 
> mismatches?

Is your intention to reduce the number of packets with checksums that
are being sent, and/or the number of checksum comparisons for the same
amount of data?

Both could have a positive impact on performance, but the question is,
whether the difference is big enough to be relevant. On the other hand,
hashing more data per checksum increases the chance of hash collisions.

br,
Robert

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
