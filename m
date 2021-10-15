Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C7642F8FB
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 18:54:25 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9BDD8421069;
	Fri, 15 Oct 2021 18:54:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2CDE9421064
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 18:54:02 +0200 (CEST)
Received: by mail-pf1-f169.google.com with SMTP id o133so8848248pfg.7
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 09:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=+MbYp/9I6HwSPkAmORgtqKp7aAXKpROAHsI0KkahVSk=;
	b=ikEdVtNf9eRQss1RELdYd+gQGtRkJJNUyxABmsyhavxmXS/GWW1GmjaIFqcZC+V7d0
	jxPVuirO3PDa+xeNqLrVJO8s8KcCPrKVcuz5mnU+QJTWjswUytrClmIjf52ECv87VZwj
	IWYURypnyInULxZ6QO8cmc8sNxz7IQsLEMu78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=+MbYp/9I6HwSPkAmORgtqKp7aAXKpROAHsI0KkahVSk=;
	b=gwTvHMrMZnzRBkpiP6mobbui40QyqOb7a42MInFiISNi7pW2zSjZvPALJcq2ZStMZb
	REOoPKs+bie2FQSkOKsDMaDMblkcsZQqax3iiD8ZO7hd2P92Axmxqu9MQvtl0/ZzWHLN
	QOCoJA+p4K70mCbElYXTcd5ludn7BcOucjMqReFjNxoHDKguSHkx1jvwfwF88EdNnMZv
	ABsCxD4+5dAFLIRA4mPaT1/FJ7dxjWcpv6pr4FwfYfgfpo+PpXK9LIOGY9qEnL3BSvkZ
	W7qRl+RmI7fe1wBU8uEzEPLiTt1JRqswMKHhGF2enxbOiSTKbolGwxrVUgj/ptLVza9N
	4rOw==
X-Gm-Message-State: AOAM530yl8QwSToSo80cXY0uqy79OywgpGVUdhu7plkC5fpqPnygl7zo
	SvciY1LqI4+1xPUav874VK5Tag==
X-Google-Smtp-Source: ABdhPJxRzD0WBfqSsRnsWWctoiC4ZL/68Vbzs2wYW5pL6AgqTKpTz7zCXFAYZWzBRrc637AgBAl43A==
X-Received: by 2002:a63:7f0e:: with SMTP id a14mr3656783pgd.390.1634316842164; 
	Fri, 15 Oct 2021 09:54:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	b8sm5387267pfi.103.2021.10.15.09.54.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Oct 2021 09:54:01 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:54:01 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110150953.4A7CC49DC@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-19-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-19-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 18/30] nfs/blocklayout: use bdev_nr_bytes
 instead of open coding it
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

On Fri, Oct 15, 2021 at 03:26:31PM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
