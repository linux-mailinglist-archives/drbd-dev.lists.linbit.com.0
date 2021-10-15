Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A5443107D
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Oct 2021 08:25:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B7E9D420FBA;
	Mon, 18 Oct 2021 08:25:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 843 seconds by postgrey-1.31 at mail19;
	Fri, 15 Oct 2021 16:07:16 CEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 085CA42100F
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 16:07:15 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 288511FD4E;
	Fri, 15 Oct 2021 13:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1634305993;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=XE1Zr0WGvW2BDyQXJdIRIiNu9IGR6oole7AChDGbfow=;
	b=FkrOYMCvwR1WV8YcSADck0o3TXEJmoIrrStNwAyJqd5gJtxOKI0CvnGjbCGyMxwd1yNCeH
	zEBVH7sdh2t2qaGhwsLNHOqdjz5oxqFduSjyptxcsRk7M3YKn/qvXYLrh+ZrHNjtfMqSoR
	o2Vcyhzm0y0ABVfIcRluaAPS8AtvIcI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1634305993;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=XE1Zr0WGvW2BDyQXJdIRIiNu9IGR6oole7AChDGbfow=;
	b=lur2cVP0ZZIUagJCcyCSi3a/9FA4e33CHIEO/wJi1ldSGsZcWVqbr1pPLn6NfTVCjleY7d
	/71NcgdcrKDA81BA==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
	by relay2.suse.de (Postfix) with ESMTP id 05659A3B8D;
	Fri, 15 Oct 2021 13:53:13 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
	id BDFEEDA7A3; Fri, 15 Oct 2021 15:52:47 +0200 (CEST)
Date: Fri, 15 Oct 2021 15:52:47 +0200
From: David Sterba <dsterba@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20211015135247.GD30611@suse.cz>
Mail-Followup-To: dsterba@suse.cz, Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>, Coly Li <colyli@suse.de>,
	Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
	David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Theodore Ts'o <tytso@mit.edu>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	Dave Kleikamp <shaggy@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Kees Cook <keescook@chromium.org>,
	Phillip Lougher <phillip@squashfs.org.uk>, Jan Kara <jack@suse.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, ntfs3@lists.linux.dev,
	reiserfs-devel@vger.kernel.org, Anand Jain <anand.jain@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-13-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-13-hch@lst.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
X-Mailman-Approved-At: Mon, 18 Oct 2021 08:25:41 +0200
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Chaitanya Kulkarni <kch@nvidia.com>,
	Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net,
	Anand Jain <anand.jain@oracle.com>, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 12/30] btrfs: use bdev_nr_bytes instead of
	open coding it
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: dsterba@suse.cz
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

On Fri, Oct 15, 2021 at 03:26:25PM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Anand Jain <anand.jain@oracle.com>
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

Acked-by: David Sterba <dsterba@suse.com>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
