Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C90324FF075
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Apr 2022 09:21:01 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BB7B7420332;
	Wed, 13 Apr 2022 09:21:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5B47D4201FB
	for <drbd-dev@lists.linbit.com>; Wed, 13 Apr 2022 09:20:59 +0200 (CEST)
Received: by mail-wr1-f52.google.com with SMTP id t1so1264239wra.4
	for <drbd-dev@lists.linbit.com>; Wed, 13 Apr 2022 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20210112.gappssmtp.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dN8/EWn03K8QZqsDcM1GMmg+mjspxDPQzum3c+cYxe8=;
	b=IC2m187Sisv5zfb5Xcb0AF1RxNoLEdnJ9uGhDEhpalphuOcA//Ej59yCLqU/D7lTUS
	XdW3RrCguLnbgewBWejumIPNmqEwWrxx+Erdyzam/anv28EFCeqSB8CYTlQWohVxHCjX
	KcT71UZCYePGlmXUdbeh+BbN3pupQQkj721PQAWEQSpuT5qy5U+XcIdT2GKMzxlYgZKk
	vXumBihHEcRxl8aiPjcstHb1+MntJB1h2/BfYJwhSKUrBaA9hmSCjwY86TGbw4zBmwUq
	sEgWdG0eAmN24KQ0EUClv36kLkdXiXXvEJgkov2NIF367aUDxrMHyPdeJ51VYvCbUGRT
	nO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dN8/EWn03K8QZqsDcM1GMmg+mjspxDPQzum3c+cYxe8=;
	b=K9HOJi7b6PoFZIH+dC9/gIFEecBPNlNT6QG2qbJe3LOcf1lXwswWUAR7m/afbJ8JUC
	2uU70KWJj/JhVKFBMdkYNxH+CeMxHmCQWsDA2z+uPadWEY36JaXWcK/TYP3yHqGwK8vS
	SXD+RT02XxYbveHjf9hM5e/mi5poQNsi1Bs7S/9t3H9clWBK3LEQnqdtqVjXnYw13sAA
	fUETnvv/FRd5jjSwK7Rmp1yrd88Ghw3W15HZLl0ajeyt+9Poz4YElE2HqtzeV3VbGDr2
	xDVY9RiO3xZ7a57Zfh7SuU2EjzBmMoWceLLsOE9NSzPQdWUe36PFR2ssH5vUztISm1OJ
	3QKg==
X-Gm-Message-State: AOAM532pcLesO0pZSSKxNLPwbinlg+tmD/hC0HU1CN7cCkvCZ0GYJArp
	hdq4mkebf63B2bYQTRlB+bl6uKoX6fCUUEHZTo2p9e5PfVZrEg==
X-Google-Smtp-Source: ABdhPJwh+Y9j0rcFrMKPmTgtwTHPm27XFQ8IFeC9X9Qfmi5gxYNBN856aJj6YmNVTBOv40YIq/+cl1/NoJ9UGAh4ObA=
X-Received: by 2002:a5d:5988:0:b0:207:b84e:5769 with SMTP id
	n8-20020a5d5988000000b00207b84e5769mr833861wri.251.1649834458594;
	Wed, 13 Apr 2022 00:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <a630a6ec-422d-3799-7781-3469fc698ba7@hierweck.de>
In-Reply-To: <a630a6ec-422d-3799-7781-3469fc698ba7@hierweck.de>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Wed, 13 Apr 2022 09:20:45 +0200
Message-ID: <CADGDV=UQO9MuHpo=h5R4b+8B=BWY-nPeaf1OZbSo765+4rP+sQ@mail.gmail.com>
To: Michael Hierweck <michael@hierweck.de>
Cc: drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev]
	=?utf-8?q?DRBD_Lockups=3A_We_did_not_send_a_P=5FBARRIE?=
	=?utf-8?q?R_=E2=80=93_drbd_kernel_thread_blocked?=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Hello Michael,

Unfortunately, it is hard to tell what went wrong from the log
messages. In recent development (after 9.1.6 before 9.1.7-rc.2) there
were some fixes that cured some bugs that led to the same symptom
(=log messages).
I do not know if that also eliminated what you see. My asks are:
 * Please verify with 9.1.7-rc.2 if you can reproduce the issue.
 * If yes, try, step by step to create the minimal reproducing
scenario and send it to us in a way that we can reproduce it.

thanks in advance.

best regards,
 Phil



On Tue, Apr 12, 2022 at 11:36 AM Michael Hierweck <michael@hierweck.de> wrote:
>
> Dear DRBD Developers,
>
> we successfully used using a rather simple IO Stack with two nodes for many years:
>
> DRBD 8.x => KVM/QEMU => XFS
>
>
> In late 2020 we migrated to:
>
> DRBD 9.x => KVM/QEMU => XFS
>
>
> With both the 9.0 and 9.1 series of DRBD we experienced that the invokation of "fstrim" inside
> the VMs can lead to lookups of the corresponding DRBD device, especially when using HDD based
> backing storage. We experienced the problem with NVMe based backing though. If this happens the
> VM cannot perform IO anymore and the host has to be rebooted.
>
> [1664789.544862] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 43656ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1664832.555478] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 86668ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1664875.558517] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 129672ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1664900.134277] INFO: task kworker/u192:2:90254 blocked for more than 120 seconds.
> [1664900.134336]       Tainted: P           OE     5.10.0-0.bpo.12-amd64 #1 Debian
> 5.10.103-1~bpo10+1
> [1664900.134377] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [1664900.134415] task:kworker/u192:2  state:D stack:    0 pid:90254 ppid:     2 flags:0x00004000
> [1664900.134493] Workqueue: drbd21440_submit do_submit [drbd]
> [1664900.134496] Call Trace:
> [1664900.134509]  __schedule+0x2be/0x770
> [1664900.134520]  ? prepare_al_transaction_nonblock+0x202/0x320 [drbd]
> [1664900.134521]  schedule+0x3c/0xa0
> [1664900.134529]  do_submit+0x3c6/0x690 [drbd]
> [1664900.134539]  ? finish_wait+0x80/0x80
> [1664900.134545]  process_one_work+0x1aa/0x340
> [1664900.134547]  worker_thread+0x30/0x390
> [1664900.134550]  ? create_worker+0x1a0/0x1a0
> [1664900.134551]  kthread+0x116/0x130
> [1664900.134553]  ? __kthread_cancel_work+0x40/0x40
> [1664900.134558]  ret_from_fork+0x22/0x30
> [1664918.565217] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 172680ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1664961.571983] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 215688ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665004.578843] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 258696ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665020.962904] INFO: task kworker/u192:2:90254 blocked for more than 241 seconds.
> [1665020.962951]       Tainted: P           OE     5.10.0-0.bpo.12-amd64 #1 Debian
> 5.10.103-1~bpo10+1
> [1665020.962982] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [1665020.963008] task:kworker/u192:2  state:D stack:    0 pid:90254 ppid:     2 flags:0x00004000
> [1665020.963031] Workqueue: drbd21440_submit do_submit [drbd]
> [1665020.963033] Call Trace:
> [1665020.963045]  __schedule+0x2be/0x770
> [1665020.963057]  ? prepare_al_transaction_nonblock+0x202/0x320 [drbd]
> [1665020.963059]  schedule+0x3c/0xa0
> [1665020.963067]  do_submit+0x3c6/0x690 [drbd]
> [1665020.963075]  ? finish_wait+0x80/0x80
> [1665020.963081]  process_one_work+0x1aa/0x340
> [1665020.963084]  worker_thread+0x30/0x390
> [1665020.963086]  ? create_worker+0x1a0/0x1a0
> [1665020.963088]  kthread+0x116/0x130
> [1665020.963090]  ? __kthread_cancel_work+0x40/0x40
> [1665020.963094]  ret_from_fork+0x22/0x30
> [1665047.585837] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 301704ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665090.592449] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 344712ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665133.599392] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 387720ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665141.791772] INFO: task kworker/u192:2:90254 blocked for more than 362 seconds.
> [1665141.791827]       Tainted: P           OE     5.10.0-0.bpo.12-amd64 #1 Debian
> 5.10.103-1~bpo10+1
> [1665141.791865] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [1665141.791901] task:kworker/u192:2  state:D stack:    0 pid:90254 ppid:     2 flags:0x00004000
> [1665141.791927] Workqueue: drbd21440_submit do_submit [drbd]
> [1665141.791930] Call Trace:
> [1665141.791944]  __schedule+0x2be/0x770
> [1665141.791959]  ? prepare_al_transaction_nonblock+0x202/0x320 [drbd]
> [1665141.791962]  schedule+0x3c/0xa0
> [1665141.791973]  do_submit+0x3c6/0x690 [drbd]
> [1665141.791982]  ? finish_wait+0x80/0x80
> [1665141.791989]  process_one_work+0x1aa/0x340
> [1665141.791993]  worker_thread+0x30/0x390
> [1665141.791996]  ? create_worker+0x1a0/0x1a0
> [1665141.791999]  kthread+0x116/0x130
> [1665141.792001]  ? __kthread_cancel_work+0x40/0x40
> [1665141.792006]  ret_from_fork+0x22/0x30
> [1665176.606182] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 430728ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665219.613011] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 473736ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665262.619975] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 516744ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665262.620472] INFO: task kworker/u192:2:90254 blocked for more than 483 seconds.
> [1665262.620520]       Tainted: P           OE     5.10.0-0.bpo.12-amd64 #1 Debian
> 5.10.103-1~bpo10+1
> [1665262.620550] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [1665262.620576] task:kworker/u192:2  state:D stack:    0 pid:90254 ppid:     2 flags:0x00004000
> [1665262.620599] Workqueue: drbd21440_submit do_submit [drbd]
> [1665262.620601] Call Trace:
> [1665262.620613]  __schedule+0x2be/0x770
> [1665262.620624]  ? prepare_al_transaction_nonblock+0x202/0x320 [drbd]
> [1665262.620626]  schedule+0x3c/0xa0
> [1665262.620633]  do_submit+0x3c6/0x690 [drbd]
> [1665262.620642]  ? finish_wait+0x80/0x80
> [1665262.620648]  process_one_work+0x1aa/0x340
> [1665262.620651]  worker_thread+0x30/0x390
> [1665262.620653]  ? create_worker+0x1a0/0x1a0
> [1665262.620654]  kthread+0x116/0x130
> [1665262.620657]  ? __kthread_cancel_work+0x40/0x40
> [1665262.620661]  ret_from_fork+0x22/0x30
> [1665305.626858] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 559752ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665348.633505] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 602760ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665383.448906] INFO: task kworker/u192:2:90254 blocked for more than 604 seconds.
> [1665383.448944]       Tainted: P           OE     5.10.0-0.bpo.12-amd64 #1 Debian
> 5.10.103-1~bpo10+1
> [1665383.448965] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [1665383.448988] task:kworker/u192:2  state:D stack:    0 pid:90254 ppid:     2 flags:0x00004000
> [1665383.449009] Workqueue: drbd21440_submit do_submit [drbd]
> [1665383.449011] Call Trace:
> [1665383.449021]  __schedule+0x2be/0x770
> [1665383.449029]  ? prepare_al_transaction_nonblock+0x202/0x320 [drbd]
> [1665383.449030]  schedule+0x3c/0xa0
> [1665383.449036]  do_submit+0x3c6/0x690 [drbd]
> [1665383.449043]  ? finish_wait+0x80/0x80
> [1665383.449048]  process_one_work+0x1aa/0x340
> [1665383.449051]  worker_thread+0x30/0x390
> [1665383.449052]  ? create_worker+0x1a0/0x1a0
> [1665383.449053]  kthread+0x116/0x130
> [1665383.449054]  ? __kthread_cancel_work+0x40/0x40
> [1665383.449058]  ret_from_fork+0x22/0x30
> [1665391.640337] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 645768ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665434.647471] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 688776ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665477.654117] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 731784ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665504.277746] INFO: task kworker/u192:2:90254 blocked for more than 724 seconds.
> [1665504.277802]       Tainted: P           OE     5.10.0-0.bpo.12-amd64 #1 Debian
> 5.10.103-1~bpo10+1
> [1665504.277841] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [1665504.277877] task:kworker/u192:2  state:D stack:    0 pid:90254 ppid:     2 flags:0x00004000
> [1665504.277902] Workqueue: drbd21440_submit do_submit [drbd]
> [1665504.277904] Call Trace:
> [1665504.277916]  __schedule+0x2be/0x770
> [1665504.277927]  ? prepare_al_transaction_nonblock+0x202/0x320 [drbd]
> [1665504.277929]  schedule+0x3c/0xa0
> [1665504.277937]  do_submit+0x3c6/0x690 [drbd]
> [1665504.277946]  ? finish_wait+0x80/0x80
> [1665504.277951]  process_one_work+0x1aa/0x340
> [1665504.277954]  worker_thread+0x30/0x390
> [1665504.277956]  ? create_worker+0x1a0/0x1a0
> [1665504.277959]  kthread+0x116/0x130
> [1665504.277961]  ? __kthread_cancel_work+0x40/0x40
> [1665504.277965]  ret_from_fork+0x22/0x30
> [1665520.661045] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 774792ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665563.667635] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 817800ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665606.674604] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 860808ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665625.106375] INFO: task kworker/u192:2:90254 blocked for more than 845 seconds.
> [1665625.106422]       Tainted: P           OE     5.10.0-0.bpo.12-amd64 #1 Debian
> 5.10.103-1~bpo10+1
> [1665625.106454] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [1665625.106483] task:kworker/u192:2  state:D stack:    0 pid:90254 ppid:     2 flags:0x00004000
> [1665625.106560] Workqueue: drbd21440_submit do_submit [drbd]
> [1665625.106563] Call Trace:
> [1665625.106576]  __schedule+0x2be/0x770
> [1665625.106588]  ? prepare_al_transaction_nonblock+0x202/0x320 [drbd]
> [1665625.106590]  schedule+0x3c/0xa0
> [1665625.106598]  do_submit+0x3c6/0x690 [drbd]
> [1665625.106607]  ? finish_wait+0x80/0x80
> [1665625.106613]  process_one_work+0x1aa/0x340
> [1665625.106616]  worker_thread+0x30/0x390
> [1665625.106619]  ? create_worker+0x1a0/0x1a0
> [1665625.106620]  kthread+0x116/0x130
> [1665625.106623]  ? __kthread_cancel_work+0x40/0x40
> [1665625.106627]  ret_from_fork+0x22/0x30
> [1665649.681308] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 903816ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665692.688072] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 946824ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665735.695099] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 989832ms >
> ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665745.935255] INFO: task kworker/u192:2:90254 blocked for more than 966 seconds.
> [1665745.935309]       Tainted: P           OE     5.10.0-0.bpo.12-amd64 #1 Debian
> 5.10.103-1~bpo10+1
> [1665745.935347] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [1665745.935382] task:kworker/u192:2  state:D stack:    0 pid:90254 ppid:     2 flags:0x00004000
> [1665745.935410] Workqueue: drbd21440_submit do_submit [drbd]
> [1665745.935413] Call Trace:
> [1665745.935426]  __schedule+0x2be/0x770
> [1665745.935440]  ? prepare_al_transaction_nonblock+0x202/0x320 [drbd]
> [1665745.935443]  schedule+0x3c/0xa0
> [1665745.935454]  do_submit+0x3c6/0x690 [drbd]
> [1665745.935463]  ? finish_wait+0x80/0x80
> [1665745.935470]  process_one_work+0x1aa/0x340
> [1665745.935474]  worker_thread+0x30/0x390
> [1665745.935477]  ? create_worker+0x1a0/0x1a0
> [1665745.935480]  kthread+0x116/0x130
> [1665745.935482]  ? __kthread_cancel_work+0x40/0x40
> [1665745.935487]  ret_from_fork+0x22/0x30
> [1665778.701745] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1032840ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665821.708739] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1075848ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665864.715639] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1118856ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665866.763823] INFO: task kworker/u192:2:90254 blocked for more than 1087 seconds.
> [1665866.763881]       Tainted: P           OE     5.10.0-0.bpo.12-amd64 #1 Debian
> 5.10.103-1~bpo10+1
> [1665866.763923] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [1665866.763952] task:kworker/u192:2  state:D stack:    0 pid:90254 ppid:     2 flags:0x00004000
> [1665866.764033] Workqueue: drbd21440_submit do_submit [drbd]
> [1665866.764035] Call Trace:
> [1665866.764050]  __schedule+0x2be/0x770
> [1665866.764061]  ? prepare_al_transaction_nonblock+0x202/0x320 [drbd]
> [1665866.764063]  schedule+0x3c/0xa0
> [1665866.764071]  do_submit+0x3c6/0x690 [drbd]
> [1665866.764080]  ? finish_wait+0x80/0x80
> [1665866.764086]  process_one_work+0x1aa/0x340
> [1665866.764089]  worker_thread+0x30/0x390
> [1665866.764091]  ? create_worker+0x1a0/0x1a0
> [1665866.764093]  kthread+0x116/0x130
> [1665866.764095]  ? __kthread_cancel_work+0x40/0x40
> [1665866.764099]  ret_from_fork+0x22/0x30
> [1665907.722451] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1161864ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665950.729230] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1204872ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1665987.592801] INFO: task kworker/u192:2:90254 blocked for more than 1208 seconds.
> [1665987.592858]       Tainted: P           OE     5.10.0-0.bpo.12-amd64 #1 Debian
> 5.10.103-1~bpo10+1
> [1665987.592898] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [1665987.592933] task:kworker/u192:2  state:D stack:    0 pid:90254 ppid:     2 flags:0x00004000
> [1665987.592961] Workqueue: drbd21440_submit do_submit [drbd]
> [1665987.592964] Call Trace:
> [1665987.592976]  __schedule+0x2be/0x770
> [1665987.592990]  ? prepare_al_transaction_nonblock+0x202/0x320 [drbd]
> [1665987.592992]  schedule+0x3c/0xa0
> [1665987.593003]  do_submit+0x3c6/0x690 [drbd]
> [1665987.593014]  ? finish_wait+0x80/0x80
> [1665987.593021]  process_one_work+0x1aa/0x340
> [1665987.593024]  worker_thread+0x30/0x390
> [1665987.593027]  ? create_worker+0x1a0/0x1a0
> [1665987.593029]  kthread+0x116/0x130
> [1665987.593032]  ? __kthread_cancel_work+0x40/0x40
> [1665987.593036]  ret_from_fork+0x22/0x30
> [1665993.735884] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1247880ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666036.742693] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1290888ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666079.749605] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1333896ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666122.756349] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1376904ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666165.763367] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1419912ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666208.770063] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1462920ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666251.776837] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1505928ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666294.787710] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1548940ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666337.790495] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1591944ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666380.797514] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1634952ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666423.804168] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1677960ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666466.811307] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1720968ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666509.817810] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1763976ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666552.824635] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1806984ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666595.831476] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1849992ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666638.838345] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1893000ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666681.845180] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1936008ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666724.852146] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 1979016ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666767.858782] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2022024ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666810.865844] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2065032ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666853.872441] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2108040ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666896.879251] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2151048ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666939.886162] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2194056ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1666982.893049] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2237064ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1667025.900021] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2280072ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1667068.906827] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2323080ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1667111.913419] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2366088ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1667154.920471] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2409096ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1667197.927280] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2452104ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1667240.933904] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2495112ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
> [1667283.941107] drbd vm2144/0 drbd21440 host101020: We did not send a P_BARRIER for 2538120ms
>  > ko-count (7) * timeout (60 * 0.1s); drbd kernel thread blocked?
>
> [...]
>
> We already tried to analyze the DRBD code in order to develop (and provide) a patch.
>
> Can we provide more information or run some tests in order to be able to identify the root cause?
>
> Thanks in advance,
>
> Michael
>
> _______________________________________________
> drbd-dev mailing list
> drbd-dev@lists.linbit.com
> https://lists.linbit.com/mailman/listinfo/drbd-dev
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
