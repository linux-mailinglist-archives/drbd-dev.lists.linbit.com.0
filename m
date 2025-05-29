Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id C26FFAC79F8
	for <lists+drbd-dev@lfdr.de>; Thu, 29 May 2025 09:55:28 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5F90416091D;
	Thu, 29 May 2025 09:55:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4207116091D
	for <drbd-dev@lists.linbit.com>; Thu, 29 May 2025 09:55:16 +0200 (CEST)
Received: by mail-wr1-f54.google.com with SMTP id
	ffacd0b85a97d-3a4d1e8e02dso90724f8f.1
	for <drbd-dev@lists.linbit.com>; Thu, 29 May 2025 00:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1748505316; x=1749110116; darn=lists.linbit.com;
	h=content-transfer-encoding:in-reply-to:content-language:references
	:to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
	:subject:date:message-id:reply-to;
	bh=rHcmbChkE7svmojsWu8CU0NoWlM0ftpXyPqYJ2dMJv8=;
	b=bOd68+05gVUXJpQubNpjubI20N1D5Ry1hwrIiZsY18XbLc5G5YrOoW1A+WoJEaSlr0
	ZStawT89mk1hnVR2PvbkXJIu4ZGwU2Cpu8AMkXjzNn8BoIi/E5+JbO5bhBuLtqZibA4l
	BJorx2sDw+ATAyHeoQjaxwL+EhILJBa76ugx/Kdpe3PxTGoIJE2ga07+TUykl95/QwAD
	VUy+qjx6ncnqlcxqPh9/eTecqiNNxm1a7p7CNSBveV8NnvQo19trsfQqQORHH2/F2Rfk
	cHwcFwab41eRx7Pvs7cfc33+s4Ta4+pAbqAh8X7QbzKOwJ7cpGuYFh24j8YZiqRpNDd8
	oOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1748505316; x=1749110116;
	h=content-transfer-encoding:in-reply-to:content-language:references
	:to:from:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=rHcmbChkE7svmojsWu8CU0NoWlM0ftpXyPqYJ2dMJv8=;
	b=kL1lPV7klbZa1QDpS6//XyswOBJSbLK61fYDDCioVHNvjLgZsNqgoTG5n8GA8VB4rZ
	XnxWWWymUAd4rrNahEXTlre4bUdKdkfHon1saNLEHEdRyhVQUws7pyZ4vOc2NNRN/qkM
	BajwNDswWraZ3lkr16k/u0nItZhCrRBfJGACNJJ9bkjYKHn969cyPRG8S2zvZ3RF76ov
	DG+2kvxSeJRiRBzCaZsxG3DGyLKRbLqYqG5NLql4gBtomzqm3oC3oXeUm5vrcnR+M7mt
	LmF81Kjy/HOJOgPj6Yng0yc57UrFyYy2oPnYp78RFCW9I7Wr2hcYUKX52+arjQsekb6b
	c2Iw==
X-Gm-Message-State: AOJu0YxnmOP5yqaKLzaQuCpYTXI0znlBDU7FAS/Q5Pv4ucAcFLQgroFA
	FJr0VZfCdKTfqzW6HpNByfcAScgZr4Lj3ORea6sIrdG867ZAV4cLXK1GERBAuFPbDi2JhZLZ2CX
	1ZxJ9
X-Gm-Gg: ASbGnctmIpQVBgRgfYGA4nEpOlrFYkQmDXn0Psf48V+geLe8ViMDyZQoyNGVouinmCR
	DeA8jrdPqweAfJhhl1I5G39mzT91lytrYjh01oMIHJW7/XkRco7GRh2z9G2EaU263ab0PHKelzq
	jUlFi8OuBptqvYHwMHNwwZsVEOcPzXQCM3Om9lvIOzU7fh7IPIZMx5dAKO+/XzRR938kd2h3SA8
	U1qfw578oguwMa3LZg9omrK43pMZb97tCjSrpqC5ELP4lbM7SdDmRYo6ToKiVcyZSx2sbea6LzM
	cAwgvPuO1Km3/QK710VPk3ccq6x4VYizy6eCyo74wXOUL7x5o6DTCjBf
X-Google-Smtp-Source: AGHT+IEiwv75TDKa1V2RnbSBeBV7bI/lGTAgkCNPKViKv89IPijFrnPtJzguoDgZxllIcIryNmiQrg==
X-Received: by 2002:a05:6000:26d1:b0:3a3:7bbc:d938 with SMTP id
	ffacd0b85a97d-3a4cb444125mr5931821f8f.4.1748505316062; 
	Thu, 29 May 2025 00:55:16 -0700 (PDT)
Received: from [10.202.32.28] ([202.127.77.110])
	by smtp.gmail.com with ESMTPSA id
	d9443c01a7336-23506d14c58sm7133185ad.217.2025.05.29.00.55.12
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 29 May 2025 00:55:15 -0700 (PDT)
Message-ID: <e9147e87-0a09-41d0-827a-b007d9a30f3a@suse.com>
Date: Thu, 29 May 2025 15:55:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] remove lock file after using it
From: Heming Zhao <heming.zhao@suse.com>
To: drbd-dev@lists.linbit.com, roland.kammerer@linbit.com
References: <20250515024817.25717-1-heming.zhao@suse.com>
	<20250515024817.25717-3-heming.zhao@suse.com> <aDbFRcFQpEbhG9E1@arm64>
	<6f471202-c821-4d73-ac3c-96b07f605cf1@suse.com>
Content-Language: en-US
In-Reply-To: <6f471202-c821-4d73-ac3c-96b07f605cf1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 5/29/25 14:59, Heming Zhao wrote:
> Hello,
> 
> On 5/28/25 16:11, Roland Kammerer wrote:
>> On Thu, May 15, 2025 at 10:48:15AM +0800, Heming Zhao wrote:
>>> In a SELinux env, if a user runs as root to set up a DRBD device,
>>> it will leave a lock file in "/var/run/drbd/lock/". Then HA pacemaker
>>> will fail to set up DRBD because of a permission issue.
>>
>> ... ...
> 
> 
> ---- following are the reproducible steps -----
> 
> ## setup vm
> 
> create two VMs:
> - 4 VCPU, 4G mem, one 100M *shared* disk for sbd, one 1G disk for drbd.
> - the sbd is using scsi bus type, drbd disk is using virtio bus type
> 
> 

I forgot to mention that to reproduce this issue, please make sure SELinux
is enabled (default configuration) and the port 7799 is open (or disable firewalld).

- Heming
