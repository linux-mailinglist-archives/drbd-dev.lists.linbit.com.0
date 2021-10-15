Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C48542F958
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 18:57:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2FA0F421080;
	Fri, 15 Oct 2021 18:57:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5450842106D
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 18:57:20 +0200 (CEST)
Received: by mail-pf1-f178.google.com with SMTP id k26so8864018pfi.5
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 09:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=/eOYGY8U37n2MZu0N4BHYKivX4HrXVHyr5D+KqaWhQU=;
	b=DmViUCP42ryk0/zjuuQaBiRmRe/mzSHK6WDkRvPw/tFoCT41pzGsk6sbtBTGe4K1S5
	OLN5lTFSJc9JHAwBNbm8/vlAKnFBSpj8DIDLl39Onh8N7+06YtLNNZRfLZuy7Z8xH+qc
	GC7tjeAZF2U3l2PkPMfgIzPMHYdB7TC28kw18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=/eOYGY8U37n2MZu0N4BHYKivX4HrXVHyr5D+KqaWhQU=;
	b=2KcQ5mDBZmuF2IWqhUooPFT6yLvD1vvrDt45etyPnkYPlJDgNouyuEtFgKeoHvH8am
	aB152bIGNUeM0zoTtQ86LW+xiWYobee6EVMI47yRT/bpihbMJiT4PR8lgtgQgCWb3z4/
	7OfWMELDRSegFiQ7LWLPUo4hvK91JqbRPwbIQ6qzveLqUGwueEbkUcKIVFYjBO63ENf9
	sJoh4GnY+jdhm5UAAbm2dvzhjI639Tx9n+wu4rNubjjiiHMMzw4d0PGeJRd8j/yUCle2
	fjEg1iTS5oTxRFrpsvJYTB3mkxe68kPNGfgQA1shwXioVQfGRknCfS5UGANoGrW0ypN1
	dgjw==
X-Gm-Message-State: AOAM532KKOv+nSksusQU7Uavzktw738XwGom94Ej8/FQsfH0Yho+p3/s
	hVMrOeyH+f2WdgevUJKH0As3Z8X3FmXzpA==
X-Google-Smtp-Source: ABdhPJyzpBRnickMzNbIwiNU4SlM0+KvU9N1DSuPdJJGXTy9zuESs+0VnjHyi75qB2n8UZERvww2Xg==
X-Received: by 2002:a63:b950:: with SMTP id v16mr5917773pgo.361.1634317039225; 
	Fri, 15 Oct 2021 09:57:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	a20sm11450710pjh.46.2021.10.15.09.57.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Oct 2021 09:57:18 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:57:18 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110150957.C90F687@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-25-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-25-hch@lst.de>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 24/30] block: use bdev_nr_bytes instead of
 open coding it in blkdev_fallocate
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

On Fri, Oct 15, 2021 at 03:26:37PM +0200, Christoph Hellwig wrote:
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
