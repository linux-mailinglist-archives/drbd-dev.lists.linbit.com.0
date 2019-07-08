Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C35A627A5
	for <lists+drbd-dev@lfdr.de>; Mon,  8 Jul 2019 19:51:01 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 9DD891028A76;
	Mon,  8 Jul 2019 19:50:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 2A3A41011BF7
	for <drbd-dev@lists.linbit.com>; Mon,  8 Jul 2019 19:50:54 +0200 (CEST)
Received: by mail-io1-f52.google.com with SMTP id q22so15415245iog.4
	for <drbd-dev@lists.linbit.com>; Mon, 08 Jul 2019 10:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=BvgJU6FmsxJnBulPUwhy8gynB1OG4+WOpxndDrPf10s=;
	b=XHF0UzE/WYAaRrLHIZG1eLhYqPMKOT+9rzBSpod8GCJ0O+DfOu7/5sZetsYlDojCBi
	Pz7n+QDvJQSwGvtW2qbgT1W/k755R5ceqhaodsUL3S+g1ElrPZHeIAdnQtynQu4ja4UL
	hBfsOMwTPUou6Kh2RRYzhfcPYKxZEj0uMg4e4ZaDajLAFMTs3XFb4FuxDa8/ObGzpMs5
	qXJlnpRCtI2GuST29mnM+1PRazM+cwYm4hywdJQ6RkPcz+jCsxcTtOWpv65HYLMhDYx3
	gFXj/p1lo4/tyMH5ylYQC7adeBNijYG3+LQ0KdtVHn09578z0VsRAFWpzYf6RjRNq3Vr
	Pq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-language:content-transfer-encoding;
	bh=BvgJU6FmsxJnBulPUwhy8gynB1OG4+WOpxndDrPf10s=;
	b=Xpz2MD46qA8fjFmVX/g/zD/3+eE9Pnmqgnei/cUWUn0B4lx2A4mQ8dYOw4FkzzK2jI
	U2sJ7nqxfzVEEkPwPGIunKxPyVltZP+cXgyrvEjfM7LMOLtbENjQE/zApOe4njtxP+jt
	Py0lmF1Mzgb70chs0fr2+09OMgL8vy2YZtDJeOQdKufec8iIPXV5N2FUcPLxHzdA5TwA
	FAHyTSouNArgbr3xJXm/niNhzVL6K/R5vsWtVQj5h8s1ZdPXcj8UJWoW8ihKPkHDBPgz
	zWLt/4RUYYwoTblOF32vW+lQr4kHxi7QRYG1u/9cAmsoyNfT7p49BDDU928XNNHPliZ0
	8p/w==
X-Gm-Message-State: APjAAAXNYYSBAF5V34ibYyF+S36qws+3bb8qcjQhyO628sD0cPOIaAEQ
	vK9MkLONUhOX6YZkw6+fFmjCPVWy
X-Google-Smtp-Source: APXvYqydDeGchJdvv+tjiFi7spUERrQdW5L4XMlPOWLA/To4BDMtCgD67LLVndUQ3+TOHTtn2m8e6A==
X-Received: by 2002:a5d:8d12:: with SMTP id p18mr20038714ioj.251.1562608253385;
	Mon, 08 Jul 2019 10:50:53 -0700 (PDT)
Received: from [192.168.1.20] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	k5sm22441946ioj.47.2019.07.08.10.50.51
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jul 2019 10:50:52 -0700 (PDT)
To: drbd-dev@lists.linbit.com
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <bd96aeb1-ac7c-1da4-bebf-e4f28d0e0313@gmail.com>
Date: Mon, 8 Jul 2019 11:50:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
Content-Language: en-US
Subject: [Drbd-dev] rcu_dereference() called when not under rcu_read_lock().
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

It seems that in general rcu_dereference() is expected to be called under rcu_read_lock().

I've observed that it is sometimes called without rcu_read_lock() -- for example the two call
stacks below that traverse the idr list.  Is something else protecting such that the
rcu_read_lock() is unnecessary in some cases?

idr_get_next() calls rcu_dereference(), but is called not under rcu_read_lock()
 [02]   0x5e9eeb  rwlock_assert_readlocked usermode_lib.h:1016 (discriminator 5)
 [03]   0x5fa816  idr_get_next idr.c:602
 [04]   0x5684b7  adm_new_connection drbd_nl.c:3774
 [05]   0x569643  drbd_adm_new_peer drbd_nl.c:4070

idr_find() calls rcu_dereference(), but is called not under rcu_read_lock()
 [02]   0x5e9eeb  rwlock_assert_readlocked usermode_lib.h:1016 (discriminator 5)
 [03]   0x5fa582  idr_find idr.c:507
 [04]   0x536970  minor_to_device drbd_int.h:1418
 [05]   0x546625  drbd_create_device drbd_main.c:3709
 [06]   0x570b85  drbd_adm_new_minor drbd_nl.c:5858
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
