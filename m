Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2DD4C648
	for <lists+drbd-dev@lfdr.de>; Thu, 20 Jun 2019 06:38:18 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id D51BD1028A72;
	Thu, 20 Jun 2019 06:38:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id DB9181028A6B
	for <drbd-dev@lists.linbit.com>; Thu, 20 Jun 2019 06:38:14 +0200 (CEST)
Received: by mail-io1-f43.google.com with SMTP id m24so1111075ioo.2
	for <drbd-dev@lists.linbit.com>; Wed, 19 Jun 2019 21:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=wtAy89EY6wbPtTogXJhLnFynyMSnhKpPYpCpvLh/2Ic=;
	b=cb7AJwGok6t2KwSpZfnOEMnr8c52QvOCmoQ8qj75WVSODARQgHqEDFPQfuUh0AmK/4
	EBJRDYjS189OGYWLz/UAjLfPVujqEkgDbNcWww/HZzSeOngYdGcY3tHCZK/SSJ7JU1E5
	w6M43pXTwv4eYvahLvWhniMoTwg0HALEQ19SKYzmrzRXc6EBf/xncnu/Av/aGnIIlCg+
	mdzAJ6tPdi3hTomnLzhiu6nb9Pr8GDyyLFY1j5jzzciyHFDCQCC5e+kWqcPTp0OFVxlA
	FpZ0W95Jjepicz4dfhjieBOgitSO2gm34Nl3TunVcU8lFQm2Zp1VWjIuIyfIqzd4wRGk
	QTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=wtAy89EY6wbPtTogXJhLnFynyMSnhKpPYpCpvLh/2Ic=;
	b=MwSBR0hc3lUZYFk+vMfnUM/Hgr3VfuarmfrUVPojtwZxEy5GTenYjiw6oZ/CCoR+n0
	xKhuIZUzSRlnLg5+rCnxryYwqcsbBKr6KhRDnayHAXeM+u1LkggvttMav1ek0TJ/iJsq
	s5ZN2FKFWlCiGbQKjKjAGwGiS1QhTwNkuC+F5izlI469ZHa0ciXb8x231WgApnnn5Opp
	DtVPV8uNIZdLX73bF8s97IuWlF8GE4p6NgFR6HHcuAvI76wbgAbG6mQJLOj5QbgnLQiC
	ZlpXQVFdqcwlSZSS0HmsKhyZPNI+FQdN2UBJmZszrujOgLC4XC1XS+JtwPJLTUg5zOkt
	kGVQ==
X-Gm-Message-State: APjAAAUD9R6DKNn4X0oYENHYrk9TgV1bbzmvngMO4LptJQZDowyRkchz
	vsf/zueXknYvtPEVHKMtwAgEct08
X-Google-Smtp-Source: APXvYqzjm+S1QX20CVP9ba/zm5NSaysx+Zav4H5bpMFWTFTnFIyI2+CzY37k6fIENBVjtnEoAehtqQ==
X-Received: by 2002:a6b:1cc:: with SMTP id 195mr14387620iob.87.1561005493444; 
	Wed, 19 Jun 2019 21:38:13 -0700 (PDT)
Received: from [192.168.1.20] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	e84sm39789297iof.39.2019.06.19.21.38.12
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 21:38:12 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <2ee5a185-a0c0-0a4f-a356-e40c0b9fc501@gmail.com>
Date: Wed, 19 Jun 2019 22:38:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Drbd-dev] leak of rs_plan_s in drbd_attach_peer_device()
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

Hello again,

Valgrind reported a memory leak of one instance of rs_plan_s, which appears to be genuine.

==23562== 104 bytes in 1 blocks are definitely lost in loss record 96 of 279 

Pointers to two instances of the structure get assigned to peer_device->rs_plan_s, both on the 
netlink receive thread from drbdsetup commands, with the second overwriting the first:

 First:   drbd_adm_new_peer --> adm_new_connection --> create_peer_device --> ... --> fifo_alloc
 Second:  drbd_adm_attach --> drbd_attach_peer_device

When drbd_attach_peer_device() allocates the second instance, it does not check for an "old"
instance in peer_device->rs_plan_s before writing the pointer to the new plan over it. 

I added a statement there (at 1586 below) to issue a stacktrace before the overwrite if the old 
peer_device->rs_plan_s isn't NULL.  That is the "Overwriting call stack" below.  The "Allocating
call stack" was issued by valgrind as its record of where the lost memory was allocated.

1586 expect_eq(rcu_dereference(peer_device->rs_plan_s), NULL, "overwriting rs_plan_s=%p with %p",
1587                                     rcu_dereference(peer_device->rs_plan_s), resync_plan);
1588 rcu_assign_pointer(peer_device->rs_plan_s, resync_plan);
1589 peer_device->resync_lru = resync_lru;
1590 err = 0;

drbd_main.c:1587: overwriting rs_plan_s=0x4e8bf40 with 0x4aeb6e00

Overwriting call stack:
==23562==    by 0x4890CC1: mte_backtrace (mte_debug.c:371)
==23562==    by 0x1E80E1: drbd_attach_peer_device (drbd_main.c:1586)
==23562==    by 0x20ACD1: drbd_adm_attach (drbd_nl.c:2979)
==23562==    by 0x2981E4: genl_rcv_msg (UMC_genl.c:566)

Allocating call stack:
==23562==    by 0x486E5E2: MEM_zalloc (mte_service.c:24)
==23562==    by 0x24EA8A: fifo_alloc (drbd_sender.c:552)
==23562==    by 0x1FD912: adjust_resync_fifo (drbd_nl.c:3551)
==23562==    by 0x20BA84: drbd_create_peer_device_default_config (drbd_nl.c:3666)
==23562==    by 0x1EBA2F: create_peer_device (drbd_main.c:3625)
==23562==    by 0x20EFE1: adm_new_connection (drbd_nl.c:3778)
==23562==    by 0x20F7E7: drbd_adm_new_peer (drbd_nl.c:4070)
==23562==    by 0x2981E4: genl_rcv_msg (UMC_genl.c:566)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
