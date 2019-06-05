Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 49474427FA
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 15:51:01 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id E91C71028A6D;
	Wed, 12 Jun 2019 15:50:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-it1-f178.google.com (mail-it1-f178.google.com
	[209.85.166.178])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 382D61028A61
	for <drbd-dev@lists.linbit.com>; Wed,  5 Jun 2019 17:57:35 +0200 (CEST)
Received: by mail-it1-f178.google.com with SMTP id l21so4277116ita.2
	for <drbd-dev@lists.linbit.com>; Wed, 05 Jun 2019 08:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:references:organization:subject:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=MTDweo6KYdHarvp4OW1hK+9nw0LYJ4MTwzTggkc3BXg=;
	b=q1u/Pdicz290dovo8ZELxz3Ma1qnkOilEsFDWPdQueyN0aB4itUBFWhkUn1G9AihZW
	Fv0PLd5/IooqTL2eTAtEF8CO5DMfgaNE4+0lEnr1+rGyZ3TfUeCla5KdUTq7lXbGO/55
	V3IjSTGJGmQRXPvtF8jHRWo/JlJ1TeY0a7e/WvGSZ/88dMEugbnOR4/vyOLkjVamOhUC
	cRkXeNjt7TKlBNhLHy7t0PzSQmOkMQMcZ6KFM5nVodsfI2Aambv8ptPUXsbiLzUpcJQN
	fQYcAGzyAstDT0lezQMSGJsMIdBGWkiqSzUncSWznCS8g8/NFmNNsYTBgFp2Ms+fCcNQ
	N9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:references:organization:subject
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=MTDweo6KYdHarvp4OW1hK+9nw0LYJ4MTwzTggkc3BXg=;
	b=TGsUZGAYxVIuCK01rWNsaCJYu4IItZK4OmmBTDyXDWyy63D40GYz5MuJ1WXNkj8h05
	rzLuNj9UrwyjQqZsOAvHGzzfcn8CB5T4TmX5jIrqvmfsOupz7gMv4SfYF6dk06mwkNHJ
	5rSEnmNke7w6Hp/SGhFl3s98l4RP64M4XRSUD3QlTqSHsvp+UGMu7tzAEp7mojPMk0Xn
	i/Ku/SfLDUTspZxCDxhQzOHW4Ri4klQWVPvfJe74+c7zdck05BnrikidE002EGxhkPrV
	P5lnyv+l0UPQzHebs8PvyYPWIZRm/p507GOOgigr36NzOFC6tT3Dp3yl9l8SKJq3nIRg
	8voQ==
X-Gm-Message-State: APjAAAW+09A0nnpAXWASLZNG28pLv9KklqQ7HHLcTsnxpZrFCeRqlssE
	YXzTYD68xf9noHOip2gAAzYEhSWv
X-Google-Smtp-Source: APXvYqyf1CcILqgF+JNWJOTnHW+bN6GaIdWQbrWqyEzJbRHb/43m4tgbpHTecK3WfIk/xxYvoknEvA==
X-Received: by 2002:a02:aa0d:: with SMTP id r13mr21196200jam.129.1559750254988;
	Wed, 05 Jun 2019 08:57:34 -0700 (PDT)
Received: from [192.168.1.9] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191])
	by smtp.gmail.com with ESMTPSA id j9sm661519itk.23.2019.06.05.08.57.33
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 08:57:33 -0700 (PDT)
From: David Butterfield <dab21774@gmail.com>
To: drbd-dev@lists.linbit.com
References: <f5c1cf53-0eb7-35ab-7fbb-cb64e5f16305@gmail.com>
	<cf05cd9c-687f-6264-0bc3-aefa90c91b3a@gmail.com>
	<CANr6vz8kxacCYSb38G464Y2c1xw1ZqZAddN45LTwEcnE_Y2dsA@mail.gmail.com>
	<7b015341-f9f7-e207-84d7-61ab8f0d5a7b@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <74882b72-57a9-bc45-76af-0be4b11a5327@gmail.com>
Date: Wed, 5 Jun 2019 09:57:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <7b015341-f9f7-e207-84d7-61ab8f0d5a7b@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 12 Jun 2019 15:50:54 +0200
Subject: [Drbd-dev] history uuids misaligned within device_statistics
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

While playing with DRBD I've noticed a few things I'll mention here.
I already pointed out the problem that was most clearly a bug (indexing drbd_genl_ops by command number).
I'll put most of these comments into separate e-mail messages to facilitate their separate dispositions.

Regards,
David Butterfield
-----

The history_uuids in the device_statistics are 64 bits wide, but they are defined as a
__bin_field which does not align to a 64-bit boundary.  The history_uuids field follows a 32-bit
field and is always 64-bit MIS-aligned.

This leads to a misaligned access at runtime during a "drbdsetup attach" command.  On x86 the 
misaligned access will work (for non-atomic operations), but not as fast as an aligned access.
Other architectures may produce a runtime fault.

In drbd_nl.c:
257 GENL_struct(DRBD_NLA_DEVICE_STATISTICS, 20, device_statistics,
258         __u64_field(1, 0, dev_size)  /* (sectors) */
259         __u64_field(2, 0, dev_read)  /* (sectors) */
260         __u64_field(3, 0, dev_write)  /* (sectors) */
261         __u64_field(4, 0, dev_al_writes)  /* activity log writes (count) */
262         __u64_field(5, 0, dev_bm_writes)  /*  bitmap writes  (count) */
263         __u32_field(6, 0, dev_upper_pending)  /* application requests in progress */
264         __u32_field(7, 0, dev_lower_pending)  /* backing device requests in progress */
265         __flg_field(8, 0, dev_upper_blocked)
266         __flg_field(9, 0, dev_lower_blocked)
267         __flg_field(10, 0, dev_al_suspended)  /* activity log suspended */
268         __u64_field(11, 0, dev_exposed_data_uuid)
269         __u64_field(12, 0, dev_current_uuid)
270         __u32_field(13, 0, dev_disk_flags)
271         //XXX This misaligns the 64-bit history_uuids, leading to misaligned CPU access
272         __bin_field(14, 0, history_uuids, HISTORY_UUIDS * sizeof(__u64))
273 )

drbd_nl.c:5089:21: runtime error: store to misaligned address 0x7f82417efffc for type 'u64', which requires 8 byte alignment
0x7f82417efffc: note: pointer points here
  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
              ^
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
