Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC3242B6ED
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:17:45 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D085D420FF9;
	Wed, 13 Oct 2021 08:17:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 577A2420FEA
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:16:52 +0200 (CEST)
Received: by mail-pj1-f51.google.com with SMTP id om14so1362961pjb.5
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=Vr2Ti0XXPw/GzVjOiY0OfTomtbZYRULNYJUDEzmrzO4=;
	b=K4nvDpNl1g5m539wsQDBpCbf3zo170v/GW6ZnHLXNDrULUU4yYZgBZyGAb+wBnnkpe
	Kw4TilugsMOouo/bETIRMTNNbwFs2By6YycSQiwP6WhM+z5A0iE/rlwHD7YheTZVwxWg
	UujJ8p17bj864LNgI93in3n9RRNxotwxYx6iE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Vr2Ti0XXPw/GzVjOiY0OfTomtbZYRULNYJUDEzmrzO4=;
	b=Amv4kZHiT08Lk/1HJ37X6obqd1ysqOIwKQyckT9pkdxyZ3IcGN6QDPkw6wngv6OIgd
	kmvZXI1nfFji5w3AWu5eYbGmHRiHb/oLLObHslioDN3a0mYiAbmA3XaqDlVRvJd9HuM7
	Vm/8XKW+/23fnTTvRPK2WtdeLnTgkdAQBrVDg3ZO1i49vKylB9kk0Oe0DQCEi16oB33j
	lrztTRsVsRGXqIaxpNUyuPslZi2TJE2cr4VSHvfR0+ogor1BShRJmYa2qr4PNfKYQAEf
	LYRZgpMxdeaDmynbyG24hX5LQqwNpB94oPRuJ+mNtz/4RJReJbWYUW3L7bM9r6dNEOm7
	Z2Jg==
X-Gm-Message-State: AOAM530++5SiVPq30V0zqMA9wb3lnT06MNUYHvhKRyNZz/yw7NPqXqDD
	2/zGjG5gceQ39tlT3cCn/xXL4g==
X-Google-Smtp-Source: ABdhPJyviIqYDhsPW2xustTPT0ttTkhiIBbQskiTA4bVnp1eNaDrTHxU5FKFz1farm1RVUHRoFmswQ==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id
	oo15mr11110082pjb.169.1634105812260; 
	Tue, 12 Oct 2021 23:16:52 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	c64sm7486893pga.40.2021.10.12.23.16.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:16:51 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:16:51 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122316.9C54C2F@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-16-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-16-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 15/29] hfsplus: use bdev_nr_sectors instead
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

On Wed, Oct 13, 2021 at 07:10:28AM +0200, Christoph Hellwig wrote:
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
