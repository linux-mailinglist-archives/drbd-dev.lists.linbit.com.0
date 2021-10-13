Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B35B842B6EB
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:17:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9D051420FEF;
	Wed, 13 Oct 2021 08:17:15 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 449DD420FF2
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:16:44 +0200 (CEST)
Received: by mail-pg1-f179.google.com with SMTP id g184so1315598pgc.6
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=WC8qlO5hS71mDqsT8bl0w3ijZFYGEZDCAo8tBaqenJs=;
	b=aGzx5g9EmfagK2VYJKbeonxVbvTyFyy8ubTg44u1Ahx/MTDIDSZon1W91/+YJyEM+w
	qj/Bi7I6qMRTurFfMFJfRoGMnC8vVMBa/lQEQP7VCzyqkR4kCDSqk5gFGwAkYxrRmLwC
	vKA47OmSM4jrpJqdnIRH8x1Z1vvipau07Niuo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=WC8qlO5hS71mDqsT8bl0w3ijZFYGEZDCAo8tBaqenJs=;
	b=7Ivu1m7L9klOlyLrxTGVs5pKhRIiNgR94OpUV8FT3OdWZnTDzurpzD85lLtN1QipiJ
	w2g91OxxfH979fEEFYzSj/yQur/4QTXvVAO7uuCIrfpQ8cZCWtaEOUXzOdzK+Ptx8qNC
	Wwy+njDpenQVA4OrQ7pv2/sgTj8RHapgpvfZgCnoy+0+sTto74VnfzxM74Af1ch92h/1
	+XwZxBjY1o2agbaPp9RWrFa6YKsjk6/nMg3RLD18vNIpUwnupgGg3ta40RoTjeCU4azt
	AAxLLGuRGp6mzC+aDS1o+yl6yAHsQle8GMXv9YjPGw3FR5F5K0SeNwOVEVwia9JGEuUv
	/hfQ==
X-Gm-Message-State: AOAM532dprZOzcOeE2HtsNdkCCsonv331lMu/wa+b9WcPqUHkQUBpYYJ
	JVmoDi9s7uaffrnnrMKu9QDNMg==
X-Google-Smtp-Source: ABdhPJywBNvyfgfyQbknPTYchwSJjS8lkA7Ed3FT30CWk3r+y/Lrw7XBaVRa792lS0jCj03fnTC0tQ==
X-Received: by 2002:a62:1b8e:0:b0:44c:9318:f6e1 with SMTP id
	b136-20020a621b8e000000b0044c9318f6e1mr36636622pfb.84.1634105804176;
	Tue, 12 Oct 2021 23:16:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	z4sm13596761pfz.99.2021.10.12.23.16.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:16:43 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:16:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122316.C8D15CD2@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-15-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-15-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 14/29] hfs: use bdev_nr_sectors instead of
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

On Wed, Oct 13, 2021 at 07:10:27AM +0200, Christoph Hellwig wrote:
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
