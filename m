Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A29B42B687
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:12:57 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 39656420FD9;
	Wed, 13 Oct 2021 08:12:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE225420FD9
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:12:54 +0200 (CEST)
Received: by mail-pf1-f178.google.com with SMTP id w6so1496229pfd.11
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=1H1JJFKjz05y5oj0p755Wd9Nps08CHOHEplJ5Y1g+2w=;
	b=FnlM9CdvccmU4HmqmwsZQ6mwcBwOhpuSMmvAcPJz12hGrzMLx0wE72HESKXT/FSdf4
	7+542Lua7V4TbazDGNap5DO9Pfw7c/uG+qyBy3qJkapOn+6ER85tMNMzt8DzCatnHQL8
	8qEBnbzhJGY53T8EWVA6JlX/GqGluU0pFlO7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=1H1JJFKjz05y5oj0p755Wd9Nps08CHOHEplJ5Y1g+2w=;
	b=KUREGLLvf0mU0RMJ+PMneFW658/KYvtWRdYv7cPj8wOdKBieSGLtPH0vl9uAAb5D/k
	0+aK1oH4LNo5HdTX/e2GvtfoY1DH9HpHz2dXmmMs9gvqd7dW9FCbhP72pBOin8w0O0g0
	ErMGM5nEJAE1PO8JwuBF/vkv7Orf40w4lKgzK2zzm/27Aauot6qcFVQgVVdlj4HLmoA+
	y2+HkbkntbkPl44uepa7wUYusmNN+UpgKV7ZJYgqBco6cFc8ObkwtCo7Qp4aAsAHp0DB
	q/9r++LHib3Lq08P5KCWf66N76aAtA/84aXbTgsWX8nX8TPupZ2LcdHBf4wbEei6MtL3
	kp8w==
X-Gm-Message-State: AOAM532vS9FDUspIZmgklMGpaVdQRKGF2mF1f5+k0WcEy5gMhAaL7+ER
	ISuoNZiPtNamFgGbFfLBRNBDbg==
X-Google-Smtp-Source: ABdhPJyo2VCUKF6kjMdrI9PCDmpBjFpUCoF94Pv9htxPPsmjtX3akcms7YpvLn8ozHxuI/GsrlutsQ==
X-Received: by 2002:aa7:91c2:0:b0:44c:a5a4:43d4 with SMTP id
	z2-20020aa791c2000000b0044ca5a443d4mr35433093pfa.20.1634105573663;
	Tue, 12 Oct 2021 23:12:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	z124sm12774767pfb.108.2021.10.12.23.12.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:12:53 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:12:52 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122311.B43459E21@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-5-hch@lst.de>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	reiserfs-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
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
Subject: Re: [Drbd-dev] [PATCH 04/29] md: use bdev_nr_sectors instead of
	open coding it
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

On Wed, Oct 13, 2021 at 07:10:17AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

I think it might make sense, as you suggest earlier, to add a "bytes"
helper. This is the first user in the series needing:

	bdev_nr_sectors(...bdev) << SECTOR_SHIFT

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
