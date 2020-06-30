Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CFE20F8AC
	for <lists+drbd-dev@lfdr.de>; Tue, 30 Jun 2020 17:43:37 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8077E4203DE;
	Tue, 30 Jun 2020 17:43:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B218420385
	for <drbd-dev@lists.linbit.com>; Tue, 30 Jun 2020 17:43:34 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id 67so5518784pfg.5
	for <drbd-dev@lists.linbit.com>; Tue, 30 Jun 2020 08:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:from:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Czyj7qztvQ/ET90pA6Cgm802J9mg/c4CrHX1EyYszQQ=;
	b=GFGPy40KuPsHkZUJdbeyZcQSvGfgs5FvnkigPPk9SV7CG59Zt39VKpM1zlVSVXoRDt
	yCeVdinmT/3C3Jtmhrs/ytEmj7Wsnn2qAcbIAA0lgRJAkDSMH3qtVX2x5ups9P63e9d7
	P9x2xILnsZVnyM3LolHHJ5MFrhP7fYB+ZvvgJsDeODXoJ2PGrPKhFRUVpy4BweeZ7T88
	7TInXYSLaUF36rQyQh/ug2yeZtWjhx06VQWrVd2dOvf947KJmX/LErgbh6FwQ3ULFM07
	+NsZiEDxchja6NsLMdoWiv7fTvOttuxXSfOyaHVhHUidelj6tLF2XevCAgd1imXsny29
	D7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Czyj7qztvQ/ET90pA6Cgm802J9mg/c4CrHX1EyYszQQ=;
	b=oNTuNvl0QM6Xi6yk9lRpuyjZPS2dBzD4790/w9NHEHZcOYlSArFoGyUFijDSxhPnrq
	ZjbtTvhYJiogCoO8/Ox3LXKezgWnbRVOVH7omPAEy7B6MqhvKsHguM53yPfn5Pqbf0Sb
	mmZXUeNeaor65e8kGQA+dLAE+n+ShIhQi8B3kI+5E4/AhKVVJIzVUzN5ov9Dh7/6MsUi
	ggZ2y8IApoLjzTMXzF33JCuBzvSrFRfFs9wTYvb+xYnLJJSwk05XcRWfXGwjYGesxOg2
	4lCAhyV8Y+aQNrwqdpMkp8DDlC1hUGzSfgdLVtxKsNbZ0rj55Wt/QDIQf03lotOfnyhZ
	Rx5Q==
X-Gm-Message-State: AOAM530Ew0wR2J2w82q6f6vHPgdvSuxo3XpiRX/TgTV49LQHnTkcB1KY
	TlQsU45872+HHvpOrariut0nNQ==
X-Google-Smtp-Source: ABdhPJx6lEIGGyQAAazhh6sEGODM0EvGn2wcc8uAkFeSAVS9hqQhG93iUqi0nvo2CJcI+RwKQRfdOw==
X-Received: by 2002:a65:5a0f:: with SMTP id y15mr15197406pgs.6.1593531813542; 
	Tue, 30 Jun 2020 08:43:33 -0700 (PDT)
Received: from ?IPv6:2605:e000:100e:8c61:4113:50ea:3eb3:a39b?
	([2605:e000:100e:8c61:4113:50ea:3eb3:a39b])
	by smtp.gmail.com with ESMTPSA id
	w68sm3185027pff.191.2020.06.30.08.43.31
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 30 Jun 2020 08:43:32 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
	<bd1443c0-be37-115b-1110-df6f0e661a50@kernel.dk>
Message-ID: <6ddbe343-0fc2-58c8-3726-c4ba9952994f@kernel.dk>
Date: Tue, 30 Jun 2020 09:43:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <bd1443c0-be37-115b-1110-df6f0e661a50@kernel.dk>
Content-Language: en-US
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] rename ->make_request_fn and move it to the
 block_device_operations
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

On 6/30/20 7:57 AM, Jens Axboe wrote:
> On 6/29/20 1:39 PM, Christoph Hellwig wrote:
>> Hi Jens,
>>
>> this series moves the make_request_fn method into block_device_operations
>> with the much more descriptive ->submit_bio name.  It then also gives
>> generic_make_request a more descriptive name, and further optimize the
>> path to issue to blk-mq, removing the need for the direct_make_request
>> bypass.
> 
> Looks good to me, and it's a nice cleanup as well. Applied.

Dropped, insta-crashes with dm:

[   10.240134] BUG: kernel NULL pointer dereference, address: 0000000000000000
[   10.241000] #PF: supervisor instruction fetch in kernel mode
[   10.241666] #PF: error_code(0x0010) - not-present page
[   10.242280] PGD 0 P4D 0 
[   10.242600] Oops: 0010 [#1] PREEMPT SMP
[   10.243073] CPU: 1 PID: 2110 Comm: systemd-udevd Not tainted 5.8.0-rc3+ #6655
[   10.243939] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.13.0-1ubuntu1 04/01/2014
[   10.245012] RIP: 0010:0x0
[   10.245322] Code: Bad RIP value.
[   10.245695] RSP: 0018:ffffc900002f7af8 EFLAGS: 00010246
[   10.246333] RAX: ffffffff81c83520 RBX: ffff8881b805dea8 RCX: ffff88819e844070
[   10.247227] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88819e844070
[   10.248112] RBP: ffffc900002f7b48 R08: ffff8881b6f38800 R09: ffff88818ff0ea58
[   10.248994] R10: 0000000000000000 R11: ffff88818ff0ea58 R12: ffff88819e844070
[   10.250077] R13: 00000000ffffffff R14: 0000000000000000 R15: ffff888107812948
[   10.251168] FS:  00007f5c3ed66a80(0000) GS:ffff8881b9c80000(0000) knlGS:0000000000000000
[   10.252161] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.253189] CR2: ffffffffffffffd6 CR3: 00000001b2953003 CR4: 00000000001606e0
[   10.254157] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   10.255279] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   10.256365] Call Trace:
[   10.256781]  submit_bio_noacct+0x1f6/0x3d0
[   10.257297]  submit_bio+0x37/0x130
[   10.257780]  ? guard_bio_eod+0x2e/0x70
[   10.258418]  mpage_readahead+0x13c/0x180
[   10.259096]  ? blkdev_direct_IO+0x490/0x490
[   10.259654]  read_pages+0x68/0x2d0
[   10.260051]  page_cache_readahead_unbounded+0x1b7/0x220
[   10.260818]  generic_file_buffered_read+0x865/0xc80
[   10.261587]  ? _copy_to_user+0x6d/0x80
[   10.262171]  ? cp_new_stat+0x119/0x130
[   10.262680]  new_sync_read+0xfe/0x170
[   10.263155]  vfs_read+0xc8/0x180
[   10.263647]  ksys_read+0x53/0xc0
[   10.264209]  do_syscall_64+0x3c/0x70
[   10.264759]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   10.265200] RIP: 0033:0x7f5c3fcc9ab2
[   10.265510] Code: Bad RIP value.
[   10.265775] RSP: 002b:00007ffc8e0cf9c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
[   10.266426] RAX: ffffffffffffffda RBX: 000055d5eca76c68 RCX: 00007f5c3fcc9ab2
[   10.267012] RDX: 0000000000000040 RSI: 000055d5eca76c78 RDI: 0000000000000006
[   10.267591] RBP: 000055d5eca44890 R08: 000055d5eca76c50 R09: 00007f5c3fd99a40
[   10.268168] R10: 0000000000000008 R11: 0000000000000246 R12: 000000003bd90000
[   10.268744] R13: 0000000000000040 R14: 000055d5eca76c50 R15: 000055d5eca448e0
[   10.269319] Modules linked in:
[   10.269562] CR2: 0000000000000000
[   10.269845] ---[ end trace f09b8963e5a3593b ]---

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
