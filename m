Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E094282E
	for <lists+drbd-dev@lfdr.de>; Wed, 12 Jun 2019 15:58:12 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id C3EF11028A78;
	Wed, 12 Jun 2019 15:58:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 87AF41028A6C
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 15:58:08 +0200 (CEST)
Received: by mail-wr1-f46.google.com with SMTP id v14so17031481wrr.4
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2019 06:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HivAJWk8xry1r462g3GUil+Qkf2mDBqFoZrnUX8PMFo=;
	b=xGRXE+YySwpss4cbXwV5Qgtq0EvvnZUc+Av3Z6Zre/h7jMlXzK5WPH8KBSM7rMejOs
	pWPz1Az+KY3Zm0o6YHi8ukQTUNHAM6v28NTVn53l6MYb8JOPOVPm/2C1k6VIW7IWJzlX
	G8vfJ1r0xFQm9iMWUvByQrzuKHYYQX2rdHNeWosQpXVi+DIXbRc5UFOt1WarKBA2ptEX
	ACll9FcTrjl7zIabt+UBQuImhOFSk1Yq6YntXq+HSQyL3E51gqEG+xDJhxjdNil3qZzl
	Wo7ASmvEPqj9EyaDM6xwhtfcztzORbkyZPJIeBrHrr9oyKWUjoR9IFEE7JNjOdYZJKcj
	9O/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HivAJWk8xry1r462g3GUil+Qkf2mDBqFoZrnUX8PMFo=;
	b=icUUCov/Z/TGMar+83OlWIlCptl+kOF4QS8IghfZjNJ8/h9wKa3bFLTqZm5LxGcEyc
	j3Hz9KxBKVNoLTDyTfMVGMEfcPQPQF5ZpqEqW6Bdyx50VC3vRMOtlKTsaMY/kiLt7xYC
	nLH8cW/VFemjYxnZGiooYxEtq2UGZSykouFLzKnsWB1chiZPMZs5sKFan91sVWo6j594
	6EEMvxuWs8/bleCtr4P2SXnpnqxTWOOzUI4ox+QYFOOYmK+/rfdQ0aNXe9X3I0X4DFUO
	fJ4cKRpgNfcF8bLb1ho/VUy7BJlc3tGElyx4SDjUc6jZIb8JR8m0+RAgnpxKX9SVWnI/
	XL3Q==
X-Gm-Message-State: APjAAAUdVTPv/5o5rzxAcQU1gcreAA6y95KB7DVB+T7nYJmnPK73bTfa
	Af9klrb4qy4jH3cnobndOfNzG0scztpoEQ==
X-Google-Smtp-Source: APXvYqx5SAbNHE+6qFI8Ny9NK0c91SscRrXHzx7CNWlXFSkJMy3dKirPFrWcHF4/sPi2A4fkHpzAYg==
X-Received: by 2002:adf:f006:: with SMTP id j6mr42889607wro.243.1560347887731; 
	Wed, 12 Jun 2019 06:58:07 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id l190sm75427wml.25.2019.06.12.06.58.06
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 12 Jun 2019 06:58:07 -0700 (PDT)
Date: Wed, 12 Jun 2019 15:58:05 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Message-ID: <20190612135805.GV5803@soda.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <f5c1cf53-0eb7-35ab-7fbb-cb64e5f16305@gmail.com>
	<cf05cd9c-687f-6264-0bc3-aefa90c91b3a@gmail.com>
	<CANr6vz8kxacCYSb38G464Y2c1xw1ZqZAddN45LTwEcnE_Y2dsA@mail.gmail.com>
	<7b015341-f9f7-e207-84d7-61ab8f0d5a7b@gmail.com>
	<74882b72-57a9-bc45-76af-0be4b11a5327@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74882b72-57a9-bc45-76af-0be4b11a5327@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Wed, Jun 05, 2019 at 09:57:32AM -0600, David Butterfield wrote:
> While playing with DRBD I've noticed a few things I'll mention here.
> I already pointed out the problem that was most clearly a bug (indexing drbd_genl_ops by command number).
> I'll put most of these comments into separate e-mail messages to facilitate their separate dispositions.
> 
> Regards,
> David Butterfield
> -----
> 
> The history_uuids in the device_statistics are 64 bits wide, but they are defined as a
> __bin_field which does not align to a 64-bit boundary.  The history_uuids field follows a 32-bit
> field and is always 64-bit MIS-aligned.
> 
> This leads to a misaligned access at runtime during a "drbdsetup attach" command.  On x86 the 
> misaligned access will work (for non-atomic operations), but not as fast as an aligned access.
> Other architectures may produce a runtime fault.
> 
> In drbd_nl.c:
> 257 GENL_struct(DRBD_NLA_DEVICE_STATISTICS, 20, device_statistics,
> 258         __u64_field(1, 0, dev_size)  /* (sectors) */
> 259         __u64_field(2, 0, dev_read)  /* (sectors) */
> 260         __u64_field(3, 0, dev_write)  /* (sectors) */
> 261         __u64_field(4, 0, dev_al_writes)  /* activity log writes (count) */
> 262         __u64_field(5, 0, dev_bm_writes)  /*  bitmap writes  (count) */
> 263         __u32_field(6, 0, dev_upper_pending)  /* application requests in progress */
> 264         __u32_field(7, 0, dev_lower_pending)  /* backing device requests in progress */
> 265         __flg_field(8, 0, dev_upper_blocked)
> 266         __flg_field(9, 0, dev_lower_blocked)
> 267         __flg_field(10, 0, dev_al_suspended)  /* activity log suspended */
> 268         __u64_field(11, 0, dev_exposed_data_uuid)
> 269         __u64_field(12, 0, dev_current_uuid)
> 270         __u32_field(13, 0, dev_disk_flags)
> 271         //XXX This misaligns the 64-bit history_uuids, leading to misaligned CPU access
> 272         __bin_field(14, 0, history_uuids, HISTORY_UUIDS * sizeof(__u64))
> 273 )


I don't think this is "packed",
the compiler is free to align the actual struct however it feels like,
it may or may not have "padding" holes.

struct to skb and back is done by memcpy.

	Lars

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
