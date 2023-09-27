Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 136BB7B0683
	for <lists+drbd-dev@lfdr.de>; Wed, 27 Sep 2023 16:19:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 184A542683C;
	Wed, 27 Sep 2023 16:19:41 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
	[209.85.208.170])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D70D8426837
	for <drbd-dev@lists.linbit.com>; Wed, 27 Sep 2023 16:19:39 +0200 (CEST)
Received: by mail-lj1-f170.google.com with SMTP id
	38308e7fff4ca-2bfe9447645so40486431fa.0
	for <drbd-dev@lists.linbit.com>; Wed, 27 Sep 2023 07:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1695824379;
	x=1696429179; darn=lists.linbit.com; 
	h=content-transfer-encoding:in-reply-to:content-language:references
	:cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
	:cc:subject:date:message-id:reply-to;
	bh=Wwk46okUDVQfnnelgDDAXJI2PyNHcNwKe3ka13udWbU=;
	b=a1si7fPns95bpiUo9XfsJtEbETggjkQ7yp94gQuYfBwml/OwxDYlogbSHjoh0v6f9A
	GRMZzaTtFg1pyWvMLY0OG/Xo1G84F7wyXipsdc9wI7i8vTww064XVcczd+VdD/HX/Sdb
	OWeR2Y2+cGHCUGhRyqjcyaPQX9T9hRdhtWXUdTIskndf7Ts/OjJtvox5sbSE6mZP1L9F
	JgE+DoL8TaZT9WYvxZf4NU7TWTzcNRX2cn/L8arKQSQkelkxjZp2L3Wz1Qir0IPJ9xaF
	v12rg6PfDw5LtTXg0LHif2NBTy60MO+m0Z7xzNs2aIvGfRgDBtHcJFkrROBcrJHCl5S7
	8r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1695824379; x=1696429179;
	h=content-transfer-encoding:in-reply-to:content-language:references
	:cc:to:subject:from:user-agent:mime-version:date:message-id
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=Wwk46okUDVQfnnelgDDAXJI2PyNHcNwKe3ka13udWbU=;
	b=n3GKIVHa/pmX/A71A6KVZUfhc9Bjr6WwQ7j++dN7lxvN3tKVH357QOManM875/eu3c
	ydz4gOD4isXa/Jv9E+fVdChc21ENGNdFw9WMNH3rFCKDiyxZ9tAIO9jDyGuMI7gfrzAi
	y6N4M9xI9qPJV/h+CXP8cW4YAglwHaPDeIaEx/jUBkkDvcpp0oun2FBerev9dEWK/gyW
	TeNRRcOlIKtnP5gO0FvLICxd/WonXtaN4XWQ2Q2GKZBZ+ePuopdqZoaTUb+flrgtLegE
	l4BtvKSnAexqVxGpJ9gW3BQd477ZAY7OD7s9ajEHvyGYsKCx5Ngm1h+/tbxn5/PJYW63
	qw/A==
X-Gm-Message-State: AOJu0YxSM8NT82KFx9W5ma1/gUYJdaBcUu/OTDYbz+eaPNBwdJNQR0lx
	edl02mvyXHwLU/T9JGf+h56MOA==
X-Google-Smtp-Source: AGHT+IExVCqrFIxKzo43T8FMa/9T5rz6/xdccYRyI4cqxFk27k3RqgKqbk6x0v1Y5TMyg8NtKFdEkg==
X-Received: by 2002:a05:651c:3cf:b0:2b6:cd7f:5ea8 with SMTP id
	f15-20020a05651c03cf00b002b6cd7f5ea8mr1801740ljp.1.1695824378667;
	Wed, 27 Sep 2023 07:19:38 -0700 (PDT)
Received: from [172.20.13.88] ([45.147.210.162])
	by smtp.gmail.com with ESMTPSA id
	mh2-20020a170906eb8200b00992b2c55c67sm9370253ejb.156.2023.09.27.07.19.36
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 27 Sep 2023 07:19:37 -0700 (PDT)
Message-ID: <9cc59d88-4b77-4e56-ae54-737baca1d435@kernel.dk>
Date: Wed, 27 Sep 2023 08:19:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jens Axboe <axboe@kernel.dk>
To: Jan Kara <jack@suse.cz>
References: <20230818123232.2269-1-jack@suse.cz>
Content-Language: en-US
In-Reply-To: <20230818123232.2269-1-jack@suse.cz>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
	linux-nvme@lists.infradead.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	Jack Wang <jinpu.wang@ionos.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
	Christoph Hellwig <hch@infradead.org>,
	xen-devel@lists.xenproject.org, Gao Xiang <xiang@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
	Mike Snitzer <snitzer@kernel.org>, Chao Yu <chao@kernel.org>,
	Joern Engel <joern@lazybastard.org>, linux-nfs@vger.kernel.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-raid@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
	linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	linux-mm@kvack.org, Song Liu <song@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-xfs@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, Anna Schumaker <anna@kernel.org>,
	linux-fsdevel@vger.kernel.org, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH v4 0/29] block: Make blkdev_get_by_*() return
	handle
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

On Wed, Sep 27, 2023 at 3:34?AM Jan Kara <jack@suse.cz> wrote:
>
> Hello,
>
> this is a v3 of the patch series which implements the idea of blkdev_get_by_*()

v4?

> calls returning bdev_handle which is then passed to blkdev_put() [1]. This
> makes the get and put calls for bdevs more obviously matching and allows us to
> propagate context from get to put without having to modify all the users
> (again!). In particular I need to propagate used open flags to blkdev_put() to
> be able count writeable opens and add support for blocking writes to mounted
> block devices. I'll send that series separately.
>
> The series is based on Btrfs tree's for-next branch [2] as of today as the
> series depends on Christoph's changes to btrfs device handling.  Patches have
> passed some reasonable testing - I've tested block changes, md, dm, bcache,
> xfs, btrfs, ext4, swap. More testing or review is always welcome. Thanks! I've
> pushed out the full branch to:
>
> git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdev_handle
>
> to ease review / testing. Christian, can you pull the patches to your tree
> to get some exposure in linux-next as well? Thanks!

For the block bits:

Acked-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
