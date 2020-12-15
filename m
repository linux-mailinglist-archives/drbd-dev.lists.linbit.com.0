Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F022DB5F3
	for <lists+drbd-dev@lfdr.de>; Tue, 15 Dec 2020 22:37:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5F7414207CD;
	Tue, 15 Dec 2020 22:37:36 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 03D3C42066C
	for <drbd-dev@lists.linbit.com>; Tue, 15 Dec 2020 22:37:34 +0100 (CET)
Received: by mail-qt1-f177.google.com with SMTP id y15so15793496qtv.5
	for <drbd-dev@lists.linbit.com>; Tue, 15 Dec 2020 13:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:message-id:from:to:subject;
	bh=q3Jgj33vgvGRODK/IyCAKMe5oqBoKFZcmZU0+rY/cwQ=;
	b=cliULWUQWQu87M06y2Nk/I4MwERfrjxczKhl0Y0bHnOcpCfOeWhnCSw4qKyXq/mxpW
	SGrm+4BXswYNd03OUWTXt13M43GnSZVtju+ElYskU1FXgTHCfCnzwiZU/6aM+Ac6kC/e
	uG2GGEUYVNpOx+EyID/9QTsxJ58NLXDROgPXsxNOs+295GKn82iwTlqORMHMwAk7yARY
	Fr0YLhTD2sAeE/GgaeXpwOXJnv4bw8d7B2tcrxmb3WVsEC4q0hKkTQAd6WFNt5xr2vze
	6u5OCpC2UZ/bpQ4s9eaWMoOkIHtekpqw12PIeckaT9QMM3+EwpB9tbSn+gfoycOvg+3K
	06nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:subject;
	bh=q3Jgj33vgvGRODK/IyCAKMe5oqBoKFZcmZU0+rY/cwQ=;
	b=B1ospi46zPEU3x9dDM2iisTX2Z5diClq5p6bmkEs7sDn863Ar/IuhHN0vlMbLEK/16
	d6ylbyBqTW0r7Wntjtku8LFvgUcWsgbebuwNn4i6T+U7io9lqT6k8rgeslHC2vZZu1wS
	YWYKWOHUzk4iMTWQc+itcb2pc4WOEyESy0yOADDtD859GcYl02J8Dq7vYwa2lFFCpz+8
	vUWzK19qFD1SkWeBj3s3bmwfZAJcEQZCpkPUS/9aOzMC2vknlZccHD7CJiylX4UyDNLC
	oRPQf/UupEkWmcEgz3WE3Iwbf06AQ1gP9xKJHDjsDv0SQK3v/xN/AGotgRVCRIJrhmAm
	EbjQ==
X-Gm-Message-State: AOAM531zNZ6VsqYjdYTPasidFSH21GpfAZVREG7UJMyU1Q718/r1DO1/
	mnKjej0a3zt1ZjgyoNyVqeyci52Hm+3nPg==
X-Google-Smtp-Source: ABdhPJwfGuVAuwh9v8uReIXor1/INl6izeeaFf/dCpjMB2B2qaXLHtpshJIyi+8W13TbBnZ5RCr/rQ==
X-Received: by 2002:aed:3064:: with SMTP id 91mr39354113qte.151.1608068253463; 
	Tue, 15 Dec 2020 13:37:33 -0800 (PST)
Received: from aldarion (pool-74-97-22-49.prvdri.fios.verizon.net.
	[74.97.22.49]) by smtp.gmail.com with ESMTPSA id
	q194sm18189357qka.102.2020.12.15.13.37.32
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 15 Dec 2020 13:37:33 -0800 (PST)
Date: Tue, 15 Dec 2020 16:37:29 -0500
Message-Id: <2n7dpisqcm.fsf@aldarion.sourceruckus.org>
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Subject: [Drbd-dev] size zero read from upper layers warning in 9.0.26-rc4
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hmm.  I'm testing on Linux 5.10.1, along with the latest ZFS which
you'll see in the following WARNING I'm getting.  I seem to recall
seing a commit about zero-size reads w/ ZFS a few days ago while
perusing the drbd commit logs.  What I don't remember is if I should
be worried.

Was the WARNING we stuck in the code warning me, the user, whose data
might got kabloom, or a warning I should pass on to the ZFS folks
because they're doing something wrong that they should fix?  Or
perhaps both?

Thanks!

[  365.901499] ------------[ cut here ]------------
[  365.901502] size zero read from upper layers
[  365.901528] WARNING: CPU: 2 PID: 1794 at drbd_submit_bio+0xe6/0x100 [drbd]
[  365.901529] Modules linked in: wireguard curve25519_x86_64 libcurve25519_generic libchacha20
poly1305 chacha_x86_64 libchacha poly1305_x86_64 libblake2s blake2s_x86_64 libblake2s_generic d
rbd_transport_tcp drbd lru_cache rfkill xen_netfront crc32c_intel aesni_intel glue_helper crypt
o_simd cryptd parport_pc ppdev lp parport sunrpc autofs4 xen_blkfront loop
[  365.901553] CPU: 2 PID: 1794 Comm: txg_sync Not tainted 5.10.1-mdl+ #7
[  365.901562] RIP: 0010:drbd_submit_bio+0xe6/0x100 [drbd]
[  365.901565] Code: c0 99 9a c1 48 89 df e8 88 f3 ff ff 48 83 c4 08 b8 ff ff ff ff 5b c3 48 c7
 c7 a0 ce 2a c0 c6 05 09 7f 05 00 01 e8 2a 5f 22 c0 <0f> 0b 48 8b 34 24 e9 64 ff ff ff 0f 1f 44
 00 00 66 2e 0f 1f 84 00
[  365.901567] RSP: 0018:ffffc90001e27aa8 EFLAGS: 00010282
[  365.901570] RAX: 0000000000000000 RBX: ffff888005497000 RCX: 0000000000000001
[  365.901572] RDX: 0000000080000001 RSI: ffffffff818b1556 RDI: 00000000ffffffff
[  365.901573] RBP: ffffc90001e27b20 R08: 0000000000000000 R09: 0000000000000001
[  365.901574] R10: ffffc90001e27b40 R11: ffffc90001e278c8 R12: 00000000ffffffff
[  365.901575] R13: ffff8880051cdca0 R14: ffff888005494800 R15: ffff88801ff9f440
[  365.901630] FS:  0000000000000000(0000) GS:ffff888103d00000(0000) knlGS:0000000000000000
[  365.901632] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  365.901633] CR2: 0000556f4bb8a038 CR3: 0000000004f7a000 CR4: 00000000003506e0
[  365.901636] Call Trace:
[  365.901643]  submit_bio_noacct+0x14c/0x410
[  365.901647]  ? submit_bio+0x40/0x130
[  365.901650]  submit_bio+0x40/0x130
[  365.901654]  vdev_disk_io_start+0x946/0x9f0
[  365.901658]  ? kmem_cache_alloc+0x1c/0x140
[  365.901661]  ? preempt_count_add+0x63/0x90
[  365.901665]  ? _raw_spin_lock+0xe/0x30
[  365.901668]  ? zio_add_child+0x13f/0x160
[  365.901671]  ? taskq_init_ent+0x33/0x70
[  365.901674]  ? zio_create+0x405/0x4b0
[  365.901677]  ? zio_vdev_io_start+0x120/0x2d0
[  365.901679]  ? zio_ready+0x27d/0x450
[  365.901681]  zio_vdev_io_start+0x120/0x2d0
[  365.901685]  zio_nowait+0x9e/0x160
[  365.901688]  zio_ioctl+0x7c/0xe0
[  365.901691]  zio_flush+0x1f/0x30
[  365.901695]  vdev_config_sync+0xcc/0x230
[  365.901699]  spa_sync+0xbba/0xf70
[  365.901703]  txg_sync_thread+0x281/0x410
[  365.901707]  ? txg_quiesce_thread+0x380/0x380
[  365.901709]  ? __thread_exit+0x10/0x10
[  365.901712]  thread_generic_wrapper+0x6a/0x80
[  365.901714]  kthread+0x134/0x160
[  365.901717]  ? kthread_park+0x80/0x80
[  365.901720]  ret_from_fork+0x22/0x30
[  365.901724] ---[ end trace 628d60b3830d674a ]---
[  368.576735] EXT4-fs (zd0): mounted filesystem with ordered data mode. Opts: (null)


-- 
Michael D Labriola
21 Rip Van Winkle Cir
Warwick, RI 02886
401-316-9844 (cell)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
