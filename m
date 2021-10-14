Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E03242D4C9
	for <lists+drbd-dev@lfdr.de>; Thu, 14 Oct 2021 10:25:28 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 69647421042;
	Thu, 14 Oct 2021 10:25:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 441 seconds by postgrey-1.31 at mail19;
	Thu, 14 Oct 2021 04:52:04 CEST
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E9AA0420FF6
	for <drbd-dev@lists.linbit.com>; Thu, 14 Oct 2021 04:52:04 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94F2A610E7;
	Thu, 14 Oct 2021 02:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634179482;
	bh=It2mkzx6TjfzrxKa1z+glKX99V3LF5sLjb+XStt8Wuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mzz6lXM/GRSQKnipiuaTPceCHZUCG+Zwebj9V2e3D3u8BDYOSVlhmPweg8g6YiI8d
	r+FzG9sPVr+Hk4H2lOIBtjdINIDEutvPeEs53/z+5bq+4EPnsRZGELeTPAvwoMl5bY
	D5WR/vTtqwKDBMa4OMVf2PvJL0TBX8SE4EyM+00T66l6gCQbaCkFBvjZHr4BqEXJ5u
	yuO9zeVQIl48uQmyOc9Be0MLM+3GoQiZYDItlKL+q86y0ZlJKAGDhfO7K6kMaufy3f
	D7Hd7Q0saLd9aej/pORbgOIvPmwFjh+idyJi5NYgYOFIwSmTP7R1qlYbeAyhEajjn0
	kkbqUUfNjdm3A==
Date: Wed, 13 Oct 2021 19:44:38 -0700
From: Keith Busch <kbusch@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20211014024438.GG1594461@dhcp-10-100-145-180.wdc.com>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-12-hch@lst.de>
X-Mailman-Approved-At: Thu, 14 Oct 2021 10:25:15 +0200
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	reiserfs-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Kees Cook <keescook@chromium.org>,
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
Subject: Re: [Drbd-dev] [PATCH 11/29] btrfs: use bdev_nr_sectors instead of
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

On Wed, Oct 13, 2021 at 07:10:24AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.

Just IMO, this patch looks like it wants a new bdev_nr_bytes() helper
instead of using the double shifting sectors back to bytes.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
