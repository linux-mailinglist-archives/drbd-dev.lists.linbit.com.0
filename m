Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83321AC692B
	for <lists+drbd-dev@lfdr.de>; Wed, 28 May 2025 14:24:08 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2DCD6160996;
	Wed, 28 May 2025 14:24:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B9BE0160996
	for <drbd-dev@lists.linbit.com>; Wed, 28 May 2025 12:08:44 +0200 (CEST)
Received: by mail-wr1-f47.google.com with SMTP id
	ffacd0b85a97d-3a4db4d1bd7so466902f8f.3
	for <drbd-dev@lists.linbit.com>; Wed, 28 May 2025 03:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1748426923; x=1749031723; darn=lists.linbit.com;
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:to:subject:user-agent:mime-version:date:message-id:from
	:to:cc:subject:date:message-id:reply-to;
	bh=BC3nHwQQeoDPjc2bVo1nfNvTPHK0wSLFtOd124snpco=;
	b=K1vUsbN+aYc0bo4Z3NB2sI/bxXTPHyAxSPi5h1k9EAu5F3CV46pqoV9XoXlXl7w28s
	9XUHij9eALeBqmkSKwKazqHS8bh1NkAQTV5Vj3nyED1+AwER52Z6wHXcvM9kVz0iN8LS
	2lz2W0sANu3Xcpm9OkExnCdViyBsXBVXarsNyYJnPoEb0m7ow4C0kfV4Hx+SxBemNRqZ
	ijZhgUzlekTKRB7m95LkBq1Jj7tGGSfR/fgwcs8ZKbatr89SWrEbVNd7mHlfrFeQmaJV
	+Mq48zQBIaZ+UrtGTPfveNQxVlAFnLKkonVn08EG7LJFnx1MXyvoRjyG10QDPv5A4tOo
	fqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1748426923; x=1749031723;
	h=content-transfer-encoding:in-reply-to:content-language:from
	:references:to:subject:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=BC3nHwQQeoDPjc2bVo1nfNvTPHK0wSLFtOd124snpco=;
	b=PPva+laSjs1zKYXNDvO4g50XXErz4x8XKQsJl3M08aiFogigxrlqoQ3Av7/WAsvV9K
	vGKeXuuq4JFYRYmpe9d8KjUUtXa4zpEAExkVE7XFWsgUWIA6LHT1+ZO44ekAYnuTBCf3
	2mjisHXZKPAtrJOGBpBRpa6ibpUmNvDj3yxV3hOuuRPEOEsG+MRnD4G3EwMG8KStGOsv
	WPMrszwNmEt/W8I5sjOW05vnTCWjoGGxiR/iOJM+kCjkI/IrQ7/SUVU8S6+DZL6ua1os
	mZ/1phM+PpYjtZBeOywr/S3XJWgH+f5iWArdLsWaf2EY6BpDUJozmUADyGsAEnhQG0t/
	5WEA==
X-Gm-Message-State: AOJu0Yz+xxBLTUqk5VUqTenQT9ZaYKDTaGXsBgUtyBzt06UJoB+I3YNa
	kYorM2Fw60zaxv+8txXWql6YNPH4uygeUzNexi7nG8IYh0WuzWrz6p+sVQS2rTOdkQphotEAyY/
	6miQx8r8=
X-Gm-Gg: ASbGncvIu5/l/RMz1c+HERm5ficXcKZxQZ5cnhAS14MM7tMCcJ3BHFzavQdZOKUUt7e
	iD1aRL/dy0gObkRgKWO9Yyn9XC976trq1LuBIjA6u2JTtewRqA35HSv2jMdQXa4eM3UzuFLgpGn
	map/2wcmIz3DhsXKaW/Z0W04jKUli1y/vs3/hPe3GT76IfuH4gK0Sj0rvcZQRZ6bX21YkoRH/iC
	t1RYGF/HVa4iHJ/iyeA+ZczW9/PmB4Q8AbbD7OHK37AseIclzVrWdKQmaBiQrAI2FsWSiMzrIrB
	LqO++JU42TTJh0N5r7H5QG08xO5Dj800MZ4KKb4BB5GogOnyuMVUz6p+Zg==
X-Google-Smtp-Source: AGHT+IEBgSumkrUtQzFfN1BqhMAvuia9ORwt8ggt1sjshpIzXqvS/hB6bt5psoeIft1BUsFocZqeSw==
X-Received: by 2002:a5d:5f8b:0:b0:3a3:6a3d:163a with SMTP id
	ffacd0b85a97d-3a4cb483096mr4588153f8f.12.1748426923380; 
	Wed, 28 May 2025 03:08:43 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
	by smtp.gmail.com with ESMTPSA id
	41be03b00d2f7-b2d99e1e78asm837158a12.30.2025.05.28.03.08.42
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 28 May 2025 03:08:42 -0700 (PDT)
Message-ID: <b4759d0b-3d65-4a87-99e3-a12882749218@suse.com>
Date: Wed, 28 May 2025 18:08:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] build: changing SUSE release file
To: drbd-dev@lists.linbit.com
References: <20250515024817.25717-1-heming.zhao@suse.com>
	<20250515024817.25717-2-heming.zhao@suse.com> <aDbDWc6dB05icJgO@arm64>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <aDbDWc6dB05icJgO@arm64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 28 May 2025 14:23:51 +0200
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

On 5/28/25 16:03, Roland Kammerer wrote:
> On Thu, May 15, 2025 at 10:48:14AM +0800, Heming Zhao wrote:
>> This commit changes /etc/SuSe-release to /etc/os-release.
>> The SuSe-release file disappeared a long time ago.
>>
>> Signed-off-by: Heming Zhao <heming.zhao@suse.com>
>> ---
>>   configure.ac | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/configure.ac b/configure.ac
>> index 282fdf1584e3..883fe3e5cdb3 100644
>> --- a/configure.ac
>> +++ b/configure.ac
>> @@ -402,7 +402,7 @@ else
>>      if test -z $DISTRO; then
>>         AC_CHECK_FILE(/etc/redhat-release, [DISTRO="redhat"])
>>         AC_CHECK_FILE(/etc/debian_version, [DISTRO="debian"])
>> -      AC_CHECK_FILE(/etc/SuSE-release, [DISTRO="suse"])
>> +      AC_CHECK_FILE(/etc/os-release, [DISTRO="suse"])
> 
> Hi,
> 
> everything that has a /etc/os-release (which by now is basically every
> distribution on this planet) is suse? No.
> 
> This (not only this) part of the automagic in drbd-utils is a mess and
> I'm currently in the process of cleaning that up a bit. I will not take
> this patch as is, IMO it is just wrong, please just wait, this should
> improve in a week or two.
> 
> Regards, rck

Thanks for the explanation.
Indeed, I didn't check other distribution styles. Let's wait for your
fix for this build issue.

- Heming
