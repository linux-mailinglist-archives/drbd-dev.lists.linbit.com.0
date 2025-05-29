Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0709AC79FE
	for <lists+drbd-dev@lfdr.de>; Thu, 29 May 2025 09:59:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC85616091D;
	Thu, 29 May 2025 09:58:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0B72F16091D
	for <drbd-dev@lists.linbit.com>; Thu, 29 May 2025 09:58:53 +0200 (CEST)
Received: by mail-wr1-f49.google.com with SMTP id
	ffacd0b85a97d-3a4ef892ab2so51095f8f.3
	for <drbd-dev@lists.linbit.com>; Thu, 29 May 2025 00:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1748505533; x=1749110333; darn=lists.linbit.com;
	h=content-transfer-encoding:in-reply-to:content-language:references
	:to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
	:subject:date:message-id:reply-to;
	bh=rHcmbChkE7svmojsWu8CU0NoWlM0ftpXyPqYJ2dMJv8=;
	b=Wie5h6hhbAmvJFJM72TytcLma/rIY9CKVtBKC1daGnjrpUCcWAJOaaOYwL5Kkrvpd4
	0CJGFXR6Tct7qNeyK4s0EdrD3VIZTOsld/tk6HxjQ6OetNZZrd/OZdl3nKB3H1JAqPW7
	P/tXk+Shx8X/q22I62y4ggPpNRlMiZ72aB3E50KQQKYBH8hkv40ATw2Uw/D0Q8XYj1ep
	gVHkNK4cwATlbXepmS9o3qiD6MlegLvlu1x0tMQcldKWjaMzgNELtOzD5MSKFpKWSdfz
	iilI7+AucB0BnwBpbJ/XhwVQwM/5Pt5bZVfy28ofbuhSJc6luP0OBQqMM7vt4M3s2B9M
	PxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1748505533; x=1749110333;
	h=content-transfer-encoding:in-reply-to:content-language:references
	:to:from:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=rHcmbChkE7svmojsWu8CU0NoWlM0ftpXyPqYJ2dMJv8=;
	b=IaKRjb9MsfAomIjeq+Ow0GmoV1wcKHEXBhGm8VtmWyNpA+AE9TzF2PmlkP5dLeMt6Y
	pmbj8nyAvpbySnndGcckOITj7T4ZY48iIWbLU4bX5U0rJL/jJJPFG3bgXx+svl8zt+pT
	fWC91muYANyQajt3Pzt3XJyIv8iBQU+cYWYYFacBm/U6wbIUgG4k3Jw+0CM6ux4CgqJK
	JlSnvAQRzTLhtHTm6t3B/q0fZA94w0H7nGURdWsScByF5vLqNnqFpLmwZpONiDRk86wA
	JLz8UGqyhbmIh6Hgs5p9YudSn3P9+OujAUqGvekYDKhbxTgk3nB+VkDCCWKW8lkGaxYc
	3OZg==
X-Gm-Message-State: AOJu0YwhEYp2GsEN1NhaFjmeCgkDsDi9K3JUnaCnFG2aypCPSIS2BPaV
	mN2unE2c3bv1ASFXryPhJXhKrq5h3eEXMZ/6dGiV/BmSeVLN9lyTBT0UdqR0D3byRNSZZmTscXZ
	/NVC+
X-Gm-Gg: ASbGncvwDsKKaTmhhJ0//OUjJ+kyiMgqLMYucFbg60X3IRtGP8OaGcba4SZGAXQH1HX
	95yJrJFkwPmOl0KVVx23L6KPKf6vF8JYW7jxOcX+AvyCZwTciPZUJ0Kke+zIFr4O8PLwtyGHIlS
	9z1+4ZMzr14jgqXm+UWwsXdhJMLfl7fA1yqI6Iw4skegY4vU9YyCXndc/IEONKvAjuoow6k5ykh
	grI65KV1GwNFLwQ8Z2ov36jaeYAjCuPrW5ay0YOqdPCfKGP3+8GK05Z+McysTeU3snfNgycbtMu
	sQxQD3wV86jzRI1YGxFhNAvaAHvq0az1YFbeR/NmjsFOrBX0IT4SVl1+
X-Google-Smtp-Source: AGHT+IFwJyZn9VGYwD+6vt8d/I6KRzUoChpm9Xb7QajcHHSVSP2TTtyHpkFLSApVPfvwEL7b0QLOyQ==
X-Received: by 2002:a05:6000:18a3:b0:3a3:7049:f947 with SMTP id
	ffacd0b85a97d-3a4cb483184mr6446092f8f.10.1748505532711; 
	Thu, 29 May 2025 00:58:52 -0700 (PDT)
Received: from [10.202.32.28] ([202.127.77.110])
	by smtp.gmail.com with ESMTPSA id
	98e67ed59e1d1-3121b71b249sm914468a91.11.2025.05.29.00.57.44
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 29 May 2025 00:58:52 -0700 (PDT)
Message-ID: <da45db79-5b36-486f-9af4-df8a2971e39b@suse.com>
Date: Thu, 29 May 2025 15:57:25 +0800
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
