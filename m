Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 880AD42F91E
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 18:56:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6BFDF421075;
	Fri, 15 Oct 2021 18:56:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1546F421066
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 18:56:05 +0200 (CEST)
Received: by mail-pf1-f169.google.com with SMTP id d9so1668907pfl.6
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 09:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=dBqAYLNOJEEerwqZkr8h1WW5rIZpnbVROvIlOTScyoI=;
	b=a7qtweAUbS8K+NvWs4UCJMddQ3rECf/7QZ6zgMst5BcQ7TbdTIW8B/A36zncKdA0GG
	8KMhkxj+OzPkhorCWgeiV72Q4Wcq28WkBpsAyjDJDIhvh57vqCJGOPQwvw9YxRM4d1BS
	rdcHafc3+6KUZpEfQohGLoX5kTVxG/qsPhu90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=dBqAYLNOJEEerwqZkr8h1WW5rIZpnbVROvIlOTScyoI=;
	b=KoGcwfw089IQkbEojVE92IzyEkOR9zc92J1eaN6XH3kTGyxUMGd1o1WVLrMVW3KypY
	M1tUnDBZsxlmjhRKFSdJsI6q5cchyHndbDWOTpRjBWAWdq82AyxZK03KpvOWS/AfsLQN
	lV2RcC/kV7OS7AJm0T5LCThex21s31Fc65t85tmg9grgRcITw6XDjG3c1zAXHy/RC3Pd
	dEL1xbFngnLwGG+5X23wG9fdROzCJ8OJAVhEMSL6XfKilRcrnnMa5PXxxsjiTrleXycc
	f5n3fL8px79RWoLt6YuUPJ2/gatlLfj3QXKlUq2iCjCcvGGirblhic2A95Wd1jOts7uc
	0FYA==
X-Gm-Message-State: AOAM5331qmTrbV3hBmRyelVRguMDTmjbSmoNK7u3/Pzt4BbvhEVbfsbq
	vn34PZ/Rb2N+e806l5e87r9FnQ==
X-Google-Smtp-Source: ABdhPJwArKSP1GbQ25tbhNDvzZCNcxogaP2mPI5IH6CBqZA2sACP5s1J2IGQKikEyZ/PadmXHII8iA==
X-Received: by 2002:a63:1266:: with SMTP id 38mr9960371pgs.219.1634316964288; 
	Fri, 15 Oct 2021 09:56:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	m12sm5254518pjv.29.2021.10.15.09.56.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Oct 2021 09:56:04 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:56:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110150955.495735B@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-22-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-22-hch@lst.de>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 21/30] pstore/blk: use bdev_nr_bytes instead
 of open coding it
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

On Fri, Oct 15, 2021 at 03:26:34PM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks for the bdev_by_bytes() helper; this is more readable now. :)

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
