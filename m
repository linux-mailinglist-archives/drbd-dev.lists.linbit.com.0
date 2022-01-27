Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC3C49EE44
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 23:51:09 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EA22742A58A;
	Thu, 27 Jan 2022 23:51:07 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 512 seconds by postgrey-1.31 at mail19;
	Thu, 27 Jan 2022 23:51:06 CET
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5884B4201E3
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 23:51:06 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 99871B8238C;
	Thu, 27 Jan 2022 22:42:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93342C340E4;
	Thu, 27 Jan 2022 22:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1643323352;
	bh=ybh+vNa1e2zVCBIHmgIav4rSBCIa4tEXBrjj/Zvd9DM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lD8DNYdSP5VgdUVvLTzLs87NT6X2RUv/tVO0wVWZV57Mo8tiF+Cy9CVqnSr4Mr28N
	/4z/vln9zP3ZnibjoeX42f/bT+EANd4Y6/PvlZ8IiaLj4IayJe8a69r3sno42DD5jQ
	fiofeE7oSvVhmRsxcbaFoTER4oAWLDgl8zvqXutM=
Date: Thu, 27 Jan 2022 14:42:29 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: NeilBrown <neilb@suse.de>
Message-Id: <20220127144229.a7109a508521db5e8ddda09c@linux-foundation.org>
In-Reply-To: <164325106958.29787.4865219843242892726.stgit@noble.brown>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Cc: "Darrick J. Wong" <djwong@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
	Miklos Szeredi <miklos@szeredi.hu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Philipp@linbit.com, Chao Yu <chao@kernel.org>,
	linux-block@vger.kernel.org,
	Paolo Valente <paolo.valente@linaro.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Axboe <axboe@kernel.dk>,
	linux-nfs@vger.kernel.org, Jens@linbit.com,
	Jeff Layton <jlayton@kernel.org>,
	Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 0/9] Remove remaining parts of congestions
 tracking code.
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

On Thu, 27 Jan 2022 13:46:29 +1100 NeilBrown <neilb@suse.de> wrote:

> Congestion hasn't been reliably tracked for quite some time.
> Most MM uses of it for guiding writeback decisions were removed in 5.16.
> Some other uses were removed in 17-rc1.
> 
> This series removes the remaining places that test for congestion, and
> the few places which still set it.
> 
> The second patch touches a few filesystems.  I didn't think there was
> much value in splitting this out by filesystems, but if maintainers
> would rather I did that, I will.
> 
> The f2fs, cephfs, fuse, NFS, and block patches can go through the
> respective trees proving the final patch doesn't land until after they
> all do - so maybe it should be held for 5.18-rc2 if all the rest lands
> by 5.18-rc1.

Plan B: I'll just take everything.  While collecting tested-bys and
acked-bys from filesystem maintainers (please).

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
