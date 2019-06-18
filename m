Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 9094A49BC6
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Jun 2019 10:12:29 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id E99931028A70;
	Tue, 18 Jun 2019 10:12:27 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 485841011BF7
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jun 2019 08:16:49 +0200 (CEST)
Received: by mail-io1-f67.google.com with SMTP id k20so27031063ios.10
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2019 23:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=QhDMnleEuUhqW3EhZnu5q6fPRq3ENz6+eZhyEJ/sAgk=;
	b=uMdOc4JmiCUNojEveGsbHklGaW1gDuSFgVXifFjNlD/fwKnbAKBIEcyGCXbIWbGypQ
	IenO/vKOkAwh133+9TU+w7nLg4KvnISG6it/mUcaoK1odliskrStxMrH9OtjRpuyfuLa
	5w6b4SCh/48UwiWh/7hhVHIKRhEcJweFvTKY7E2EdkQzKdKleJ93VA6aBI+MaaLF+93u
	QjA6nyBJIvIK12r7dA8fXW6I/5YZlbdFChxAlQuKCusUOFe0bPh37kUJCq4conxhrvho
	FTI5WynV/OKgXfAf5imOD4FsIbAA1AeLuVVT1LqXKc1LvKNiyu82fwnbSDz5sz6xBjhb
	wmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=QhDMnleEuUhqW3EhZnu5q6fPRq3ENz6+eZhyEJ/sAgk=;
	b=Npm3KMYz9yCyu+R6qp0LYSh+Z9GhcErw/W08/ob/rngjEWQA7Y7v68a1cb6xh8ERfY
	KbYPWIDI1Eur3Y3fFjoCgq8RpJBohRiNEP0pueYhQW4UIGLX/UXR5jXuWO+4r6eX/cNP
	8TiYt1n4TPCuPojoITE6GKF4eituhuJKt0nzgVCUa3nEM8IsDmqen+318ektMq3B2/PZ
	4BEyvjihyEoeGRdqbkKzymMHvPAarLFt73MR3Pi/xTKYn7gCeGugpPfWl4iYLH4pVcT6
	GO3ZcVAmYK0rMBooZ3eXRlSecNm6MH4zIpkOzK9gpXuEdIkzjDZ+A79l4jeTr+eEv+/4
	DQXA==
X-Gm-Message-State: APjAAAXUNZIJxCMZjS0VEueoJ9Gu/uygXOPBC3M8J6V0mn/MjHrrXrLQ
	OvealmCH4zCE5mV0rrVNKKPRJCal
X-Google-Smtp-Source: APXvYqxRfq0CgpJwr/HLNesuhT2t0UlIQJcl8AxOXQoJWDh3pY9TBleplNZHA+BbYDJhds2yUJZ2qg==
X-Received: by 2002:a05:6638:5:: with SMTP id z5mr862032jao.58.1560838608297; 
	Mon, 17 Jun 2019 23:16:48 -0700 (PDT)
Received: from [192.168.1.20] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	c10sm16745373ioh.58.2019.06.17.23.16.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jun 2019 23:16:47 -0700 (PDT)
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>
References: <f5c1cf53-0eb7-35ab-7fbb-cb64e5f16305@gmail.com>
	<cf05cd9c-687f-6264-0bc3-aefa90c91b3a@gmail.com>
	<CANr6vz8kxacCYSb38G464Y2c1xw1ZqZAddN45LTwEcnE_Y2dsA@mail.gmail.com>
	<7b015341-f9f7-e207-84d7-61ab8f0d5a7b@gmail.com>
	<74882b72-57a9-bc45-76af-0be4b11a5327@gmail.com>
	<20190612135805.GV5803@soda.linbit>
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <2f0bb666-e3bf-1f38-025a-910b7a37ac1e@gmail.com>
Date: Tue, 18 Jun 2019 00:16:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612135805.GV5803@soda.linbit>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Jun 2019 10:12:27 +0200
Subject: Re: [Drbd-dev] history uuids misaligned within device_statistics
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

I should clarify that I observed the history_uuids misalignment as a runtime error from libubsan:

drbd_nl.c:5091:21: runtime error: store to misaligned address 0x7fc223ffd33c for type 'u64', which requires 8 byte alignment
0x7fc223ffd33c: note: pointer points here
  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
              ^

5076 static void device_to_statistics(struct device_statistics *s,
5077                                  struct drbd_device *device)
...
5090                 for (n = 0; n < ARRAY_SIZE(md->history_uuids); n++)
5091                         history_uuids[n] = md->history_uuids[n];

The history_uuids are declared with __bin_field() which does not appear to specify an alignment.
It happens to follow a 32-bit field, so that's where it lands.
>> 272         __bin_field(14, 0, history_uuids, HISTORY_UUIDS * sizeof(__u64))

x86 won't have a problem with this; I don't know which architectures would fault.

Perhaps the easiest way to make it legal (if you care about non-x86) would be to use
the "unaligned" family of functions for these assignments, e.g. put_unaligned_le64().

Regards,
David Butterfield

On 6/12/19 7:58 AM, Lars Ellenberg wrote:
> On Wed, Jun 05, 2019 at 09:57:32AM -0600, David Butterfield wrote:
>> The history_uuids in the device_statistics are 64 bits wide, but they are defined as a
>> __bin_field which does not align to a 64-bit boundary.  The history_uuids field follows a 32-bit
>> field and is always 64-bit MIS-aligned.
>>
>> This leads to a misaligned access at runtime during a "drbdsetup attach" command.  On x86 the 
>> misaligned access will work (for non-atomic operations), but not as fast as an aligned access.
>> Other architectures may produce a runtime fault.
>>
>> In drbd_nl.c:
>> 257 GENL_struct(DRBD_NLA_DEVICE_STATISTICS, 20, device_statistics,
>> 258         __u64_field(1, 0, dev_size)  /* (sectors) */
>> 259         __u64_field(2, 0, dev_read)  /* (sectors) */
>> 260         __u64_field(3, 0, dev_write)  /* (sectors) */
>> 261         __u64_field(4, 0, dev_al_writes)  /* activity log writes (count) */
>> 262         __u64_field(5, 0, dev_bm_writes)  /*  bitmap writes  (count) */
>> 263         __u32_field(6, 0, dev_upper_pending)  /* application requests in progress */
>> 264         __u32_field(7, 0, dev_lower_pending)  /* backing device requests in progress */
>> 265         __flg_field(8, 0, dev_upper_blocked)
>> 266         __flg_field(9, 0, dev_lower_blocked)
>> 267         __flg_field(10, 0, dev_al_suspended)  /* activity log suspended */
>> 268         __u64_field(11, 0, dev_exposed_data_uuid)
>> 269         __u64_field(12, 0, dev_current_uuid)
>> 270         __u32_field(13, 0, dev_disk_flags)
>> 271         //XXX This misaligns the 64-bit history_uuids, leading to misaligned CPU access
>> 272         __bin_field(14, 0, history_uuids, HISTORY_UUIDS * sizeof(__u64))
>> 273 )
> 
> I don't think this is "packed",
> the compiler is free to align the actual struct however it feels like,
> it may or may not have "padding" holes.
> 
> struct to skb and back is done by memcpy.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
