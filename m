Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5044AB26
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Jun 2019 21:45:28 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 9D1F91028A72;
	Tue, 18 Jun 2019 21:45:26 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
	[209.85.166.42])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id EB2361019AC6
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jun 2019 21:45:24 +0200 (CEST)
Received: by mail-io1-f42.google.com with SMTP id u13so32744695iop.0
	for <drbd-dev@lists.linbit.com>; Tue, 18 Jun 2019 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ViLueyRTs5Zvvw8Xq6qWH1/1lTWQfqwkqjBNTdxsaCE=;
	b=j/zKVPTF8xNxGzFH7YvM6Mmnt2ykF3x1i9QRn5ZzgKBAF1POpaoC7/IcjbH6Elyctb
	4wPlWwtewCBRxEe9xJefcCM+IzLMdRGLFdhgJs3wDLvmF9Vw8jlV7FoPEOLTsJLypDn4
	oLkvONC9xc8UPajOTnbtH7Vrkj9ZPd5taipQ5nhMYjY0/6ZvLi2xbrwPBAChi8F/TZZS
	qx8w9zLjQpp18H8b+G3pb8TpCOH/ODWNSUhC6mRqJwuMRSEIw+Hf78yQjrnzn1adD7vM
	iJHRySUZIOih6ANjhCX/gc/68hUjqsuO5VeRh6su4CpHSRwbzXQh1iDD7JLmNAap32Jw
	qVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ViLueyRTs5Zvvw8Xq6qWH1/1lTWQfqwkqjBNTdxsaCE=;
	b=nqahilsa6ZKMzjjNyZEM7x4Jffp1lfD3bKrig8owuuw4cWt1ws9i5PUFbuaTXeiEGc
	cjEsAN+i+Lu8zgcwtNRRLJbnykq5jsbQuLOb4FbjryH4nKImjQocfmeXzcArNewY4mB+
	8Ps9RX0mirizUCeLRSgDDGJSlNP7cmdkAWJrv5Vq/lisKYRt4q+3BiZuVMEHVYkdeyCE
	0K4bZSXVJwU3yQRHQy4mim3E/kksWE8xYZ9w3Ta4tasravCasYWifth8EPMfnmIwTqNn
	E2bs5EDR05hFpBwzo6hltfjDPdHeW0RfEItlJH3z4k5tPTCaFciY7UFMUPWyGH1TqEDA
	uBAA==
X-Gm-Message-State: APjAAAXGsGoivCF0PX4dqRLY0c2p0HHrwwlgPt46HovdAf6zFuF/KxF1
	Pf1iwVj0EhqkPS+kwtQZW/s=
X-Google-Smtp-Source: APXvYqz26/BE/YsiHMl9tDKOH9g6ZL4Mz0WEGh2DGrNSW8tJz3VMVN4hv0avzlgqaCZ2/Q3gTYXRDg==
X-Received: by 2002:a02:9143:: with SMTP id b3mr4214070jag.12.1560887123744;
	Tue, 18 Jun 2019 12:45:23 -0700 (PDT)
Received: from [192.168.1.20] (c-73-78-150-191.hsd1.co.comcast.net.
	[73.78.150.191]) by smtp.gmail.com with ESMTPSA id
	20sm16389244iog.62.2019.06.18.12.45.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Jun 2019 12:45:23 -0700 (PDT)
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>
References: <28397d5c-72ca-e4b5-fb00-7b55466e7441@gmail.com>
	<20190612142612.GB5803@soda.linbit>
From: David Butterfield <dab21774@gmail.com>
Organization: PGP: 70C7 0309 E859 40AB 4D1F CDC5 F7CE 9A64 95EB 9D1B
Message-ID: <53823072-4be7-dc0c-5abe-08588ba5b68e@gmail.com>
Date: Tue, 18 Jun 2019 13:45:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190612142612.GB5803@soda.linbit>
Content-Language: en-US
Subject: Re: [Drbd-dev] q->queue_lock initialization
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

Regarding initialization of q->queue_lock:

Apparently the DRBD source requires that
    !defined(COMPAT_HAVE_BLK_QUEUE_FLAG_SET)  implies  defined(blk_queue_plugged)

So I suppose that must be true in all Linux kernel versions at or above 2.6.32.

But I did not implement or #define blk_queue_plugged, so the initialization of
q->queue_lock at drbd_main.c:3773 did not happen, so the spin_lock_irqsave() in the
compatibility version of blk_queue_flag_set:1942 would use the NULL q->queue_lock.

So I will look into defining blk_queue_plugged in my ~2.6.32 environment.
Thanks for your help understanding this.

From drbd_nl.c:
1937 #ifndef COMPAT_HAVE_BLK_QUEUE_FLAG_SET
1938 static void blk_queue_flag_set(unsigned int flag, struct request_queue *q)
1939 {
1940         unsigned long flags;
1941
1942         spin_lock_irqsave(q->queue_lock, flags);
1943         queue_flag_set(flag, q);
1944         spin_unlock_irqrestore(q->queue_lock, flags);
1945 }

From drbd_main.c:
3772 #ifdef blk_queue_plugged
3773         q->queue_lock = &resource->req_lock; /* needed since we use */
3774         /* plugging on a queue, that actually has no requests! */
3775         q->unplug_fn = drbd_unplug_fn;
3776 #endif

drbdsetup attach leads to spin_lock(NULL):

/usermode_compat/src/usermode_lib.h:1098:19: runtime error: member access within null pointer of type 'struct spinlock_t'
Thread 5 "netlink_recv" received signal SIGSEGV, Segmentation fault.
(gdb)
(gdb) bt
#0  __GI___pthread_mutex_trylock (mutex=0x8) at ../nptl/pthread_mutex_trylock.c:41
#1  0x0000555555c2994a in _spin_lock_try (lock=0x0, whence=0x555555e99859 "drbd_nl.c:1951") at usermode_compat/src/usermode_lib.h:1098
#2  0x0000555555c2a070 in _spin_lock (lock=0x0, whence=0x555555e99859 "drbd_nl.c:1951") at usermode_compat/src/usermode_lib.h:1125
#3  0x0000555555c60f73 in blk_queue_flag_clear (flag=4294967295, q=0x7fff6400c800) at drbd_nl.c:1951
#4  0x0000555555c613c9 in decide_on_discard_support (device=0x7fff6401c400, q=0x7fff6400c800, b=0x5555562374c0, discard_zeroes_if_aligned=true) at drbd_nl.c:1987
#5  0x0000555555c6196d in drbd_setup_queue_param (device=0x7fff6401c400, bdev=0x7fff6405d400, max_bio_size=1048576, o=0x0) at drbd_nl.c:2115
#6  0x0000555555c62194 in drbd_reconsider_queue_parameters (device=0x7fff6401c400, bdev=0x7fff6405d400, o=0x0) at drbd_nl.c:2143
#7  0x0000555555c710b0 in drbd_adm_attach (skb=0x7fff64037d40, info=0x7ffff5626460) at drbd_nl.c:3042
#8  0x0000555555e33586 in genl_rcv_msg (skb=0x7fff64037d40, nlh=0x7fff6405f000) at UMC_genl.c:566
#9  0x0000555555e33cfa in netlink_rcv_skb (skb=0x7fff64037d40, cb=0x555555e32e99 <genl_rcv_msg>) at UMC_genl.c:618
#10 0x0000555555e33ef9 in genl_rcv (skb=0x7fff64037d40) at UMC_genl.c:639
#11 0x0000555555e2d78b in on_netlink_recv (sk=0x555556233098, len=0) at usermode_lib.c:994
#12 0x0000555555e2b9dc in UMC_sock_recv_event (env=0x555556233000, events=1, err=0) at usermode_lib.c:792
#13 0x00007ffff7f5eec3 in callback_deliver (err=0, arg=1, cb=0x5555562357c0) at mte_event_task.c:128
#14 event_poll_deliver (nevents=<optimized out>, events=<optimized out>) at mte_event_task.c:254
#15 event_task_loop (event_task=event_task@entry=0x555556234e00) at mte_event_task.c:741
#16 0x00007ffff7f62d0f in mte_event_task_run (event_task=0x555556234e00) at mte_event_task.c:860
#17 0x0000555555e2276f in UMC_irqthread_fn (v_irqthread=0x555556233a00) at usermode_lib.c:187
#18 0x00007ffff7f4cc05 in sys_thread_fn (env=<optimized out>) at mte_service.c:145
#19 0x00007ffff757d182 in start_thread (arg=<optimized out>) at pthread_create.c:486
#20 0x00007ffff74a6b1f in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95

Nice to be able to use valgrind and gdb and libubsan!
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
