Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B97F49BC7
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Jun 2019 10:12:32 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 21E1A1028A76;
	Tue, 18 Jun 2019 10:12:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id CB1C11028A66
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jun 2019 09:29:21 +0200 (CEST)
Received: by mail-io1-f54.google.com with SMTP id n5so27447665ioc.7
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jun 2019 00:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=g7PYCOJJ5klKVsHc66GvL4aL9SBlectB9tBR99rwT9w=;
	b=B7U07u7x4RO02RKabPvyvs8ou7eg3KARUhgxrB6A/9t1PRMBQ0o6LL1+xMlQKeujbv
	L8JUjocvyGyfPQ9sIrI2sCAG9o774jhR2H+K/PPFvK5fdLPYKvnRY68T3pSqRDorO1IR
	qHVVbAG6OsIvTMoeQ7ysjwl57qOMRZnzm9Ue7idkIp3eyYdzLiAh14MV3PsRieYNHueM
	EFYXfVWFVVtb8sG1aWjH6qd7JyIIGJJpvgTvs8HmahfLrT6kxPsaEhVBi1GZMtidb/Vl
	ppWTLnC1D+ked0xeZmo93AEOanvcZ7JSTvPyUIi2R9wvl5MAdeSYtUzn4k0qhm6Y9Ln3
	JfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=g7PYCOJJ5klKVsHc66GvL4aL9SBlectB9tBR99rwT9w=;
	b=JFoK1Br9skQPuuxoAmB/T4scRRniCbYJzrogXW9XAWc18wPgStDy/iAYVU3MrT5iUo
	A7FgDV14+q02v2vQXSoyYwR/LZb8H9BAmDkmlQiFniAzzjxDQHlKjuTNLaUjZI8QMer5
	CvBwQMgiX1jKmMDDDGrAr+uTGb2Scj39iUF6Ph/BJ00/OjS89IUcr14Ae1sPKJNU/oFA
	c8zuRPNm3lhk53nthLRdC4DVO4ZRxcI5DuyRkzlsXeHfW9zYTw/WimJ4nmMEEykQZ938
	DfFSIZbbvXXGyiB52yEpOOnR8409e5qm0KlK80tidUm2jViaWQFCZtOg7dNFRIoDIspa
	N63g==
X-Gm-Message-State: APjAAAUqt1gF29H41dva0D2omNdavFI7hr4p422pbkAtwDcCAStWbGfT
	IkD0WYTBqb4l41KBEWGpRSg=
X-Google-Smtp-Source: APXvYqw1rQj/eSRe8PvvGUayFTpFX+A8HBFhfmAVUXl93edtrkVq4zxsDj6CxB+k6xX6Ettluqtj8A==
X-Received: by 2002:a5e:8913:: with SMTP id k19mr48831796ioj.155.1560842960710;
	Tue, 18 Jun 2019 00:29:20 -0700 (PDT)
Received: from [192.168.1.20] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	x22sm13596952iob.84.2019.06.18.00.29.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 00:29:20 -0700 (PDT)
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>
References: <8ceba717-542f-5898-d5d4-890945a022fb@gmail.com>
	<20190612140615.GX5803@soda.linbit>
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <dc406c3e-a45b-a3d2-20ef-652736d7615d@gmail.com>
Date: Tue, 18 Jun 2019 01:29:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612140615.GX5803@soda.linbit>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Jun 2019 10:12:27 +0200
Subject: Re: [Drbd-dev] integer overflow in dagtag_newer_eq(0, 1ULL<<63)
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

On 6/12/19 8:06 AM, Lars Ellenberg wrote:
> On Wed, Jun 05, 2019 at 10:01:27AM -0600, David Butterfield wrote:
>> drbd_sender.c:maybe_send_unplug_remote() can assign (1ULL << 63) to unplug_dagtag_sector[i]:
>>
>> 1674                 connection->todo.unplug_dagtag_sector[connection->todo.unplug_slot] =
>> 1675                         connection->send.current_dagtag_sector + (1ULL << 63);
>>
>> Later it reaches dagtag_newer_eq(0, unplug_dagtag_sector[i]) which converts its arguments to
>> signed before subtracting.
>>
>> 272 #define dagtag_newer_eq(a,b)      \
>> 273         (typecheck(u64, a) && \
>> 274          typecheck(u64, b) && \
>> 275         ((s64)(a) - (s64)(b) >= 0))
>>
>> But (signed)(1ULL << 63) is the maximum negative integer, and the value of
>> (0 - (signed)(1ULL << 63)) cannot be represented.  So the subtraction ends in integer overflow.
>>
>> drbd_sender.c:1660:9: runtime error: signed integer overflow: 0 - -9223372036854775808 cannot be represented in type 'long i
> 
> I don't care ;-)
> but we can add in a -1, if it makes the world a better place

Or maybe start the dagtags out at one instead of zero.  This might appear as a
"low probability occurrence" due to requiring such specific numbers, but it always
happens because the two numbers are initialized that way.  I can observe the
overflow happen, but I don't understand well enough the meanings of the numbers
involved to know if it is harmful.

The question I haven't analyzed is whether the intent of the code gets carried
out properly when this overflow happens (which it does -- this was another libubsan
discovery).  I guess I'll try to do that now:

The (1<<63) appears intended to mean "larger than any other dagtag".  If that's
correct, then the plain meaning of "dagtag_newer_eq(0, 1<<63)" should lead to a
desired return of "false".  So if the dagtag_newer_eq() comparison returns false,
despite the overflow, then the overflow cannot be harmful.

What is actually returned by the comparison?  I think: the cast to signed changes
the meaning of (1<<63) from a big positive number to INT_MIN (-9223372036854775808).
Then the signed subtraction (0 - INT_MIN) overflows from INT_MAX+1 back to INT_MIN
again.  That leaves the result negative, which will cause the macro to return false.

So I think the macro will return the correct answer despite the overflow, and this
is one of those cases where the modulo arithmetic works out the right answer.
So probably nothing but libubsan will ever notice this.

Regards,
David Butterfield
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
