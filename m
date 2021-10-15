Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 205FC42F949
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 18:57:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EB0B642107E;
	Fri, 15 Oct 2021 18:57:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6D79642106D
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 18:57:05 +0200 (CEST)
Received: by mail-pf1-f180.google.com with SMTP id q19so8873488pfl.4
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=K+6isvwekOgtvopkqE4I0h7AgNguipVYqeEY21w12Mo=;
	b=XiV2alQ2bCUhPKCRDy35L10uw/QVL0RMTX2wcoCawcZP+N544npMKl6qJHVNuREVMJ
	/3k+gOTpyuD9GvBFRwBhJkrM/MdxCBPLCnVY/0SS1G/dQv3yvOXHSbjERi1b1HJ8bt6c
	zWuPktMOT2lWvGeRm1bA9Ib7yGAG3xwtDOTDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=K+6isvwekOgtvopkqE4I0h7AgNguipVYqeEY21w12Mo=;
	b=OrkR5cfUaz6eL9SNQwe2qx31biO9en5dFCgG0nMUwtcdFi20yrbo+e7uV0LD6DHfuF
	Fsn1+fvuVj9/Hl2UR0YJlkSHonMFfr9F+Xry2HYUPExnpXAoGLhalekgAzHXp+yvvnL/
	0oKaz1xYSBaGNGDeX7o2jHYl2hQ4+ZuT4IDBPIPTb1qvCqn9+1aczbONgLEzLiUTWsw6
	y/6EfoHspKfmgTpWIHem6w18pmKbESkU0JLWToCyCUfaGncyWhSBk4XrGGW5v7SAk0rr
	C5g82GhmtBScG8owZHSFyZzoW/T2tSJiWfHCtk/sJrduXLW4X0daSra1pteXrvpKhqfN
	4YmA==
X-Gm-Message-State: AOAM530KEkruRSUwZ7g2/qUCwx41xW32YCmxpNp3B/6p7SKvT+y3BzrR
	dJZ9VjsgDTl6BGjnN9MCHMBq8A==
X-Google-Smtp-Source: ABdhPJy+YUT6npY/fZ/G9URvGOZpt9eamOIJH1D5JMCGxtLxyzdwQfs5MmBQFVKQI/Zn2W8hW6yLYA==
X-Received: by 2002:a05:6a00:1309:b0:44d:4d1e:c930 with SMTP id
	j9-20020a056a00130900b0044d4d1ec930mr12851663pfu.65.1634317024412;
	Fri, 15 Oct 2021 09:57:04 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	b16sm5793589pfm.58.2021.10.15.09.57.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Oct 2021 09:57:04 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:57:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110150957.38CBB0C08@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-24-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-24-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 23/30] squashfs: use bdev_nr_bytes instead of
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

On Fri, Oct 15, 2021 at 03:26:36PM +0200, Christoph Hellwig wrote:
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
