Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C2E49EDF1
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 23:10:26 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7392542A584;
	Thu, 27 Jan 2022 23:10:25 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 592324201E3
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 23:10:24 +0100 (CET)
Received: by mail-lj1-f181.google.com with SMTP id t14so6313648ljh.8
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 14:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pkUjSb/fdfaa3FAu68ePw4JIYSvRfOC6qyjCilb3MLA=;
	b=RZypLcBcYIUdWY9vV42TppO4LaQPblBv+kCbhi7sSIeity0kCuHxjxBkOW+017vQfl
	mGJzLUkiIibnMnTTVFBLt50VetVg1KzsVDl5jUao0XF5T7oAmS+N8pzAB7j2FNpZGYiq
	xbHy2XvQvsScldzehtVeFOoApJ3rHFqpSLvhJxxrFdkCY4SBOyNaqvrt+GIQFpxxuFFh
	CmyJh/SQOY6vLReOapEDPt77zxgz4JT8F/AZF2zWXE0KCoQ1ChkpEBN24khQj5g1i9qq
	aguCWoq8pgm51d0p5z0SrS13R+0j/TGLyIS5NFK+7PHw2xgpowySjWS1of9EUGPSq6jn
	/AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pkUjSb/fdfaa3FAu68ePw4JIYSvRfOC6qyjCilb3MLA=;
	b=1H8hR0YM6y9eQ8r9b2hdxbo5sTxtY89gUFYd4h/nXQfU1ReagYJM6kwFFLWhAC1vmv
	6KjGXMdhG4dx/y102eyhPrJCIGFn2PHXeeMNqRm82s4pby2ReTKRhIfTepSJMIYINMJC
	lrJspQ/03GwIYIyZzDDlC6j85UznVrdpvSCvowL3vwhifdVrXPux4v+nUF68qB6V+KmS
	KfcVGJCSk4eA1OcmL3iffx1s4gSJJ5Q7gzFbtjVECLiB8XpRWyigmsb/WtX9soEZc6+r
	wwZCAUYswgTkYchNvn6s1/9Juy0JfjaItCd6jojl40KmAQUEszIIZNbr9LIWWQqkxg58
	xQrA==
X-Gm-Message-State: AOAM5320jsfL2Mdz4BSHiNCWZZuTkzSIOeTNZ98PeQkpy/JcJj2Yk8iS
	EETvCWn4/S0SpAKGO0mpCnxnx380OdjZDPzffgo=
X-Google-Smtp-Source: ABdhPJy9dJl6L/bnRQi8tK1Am+5DPjPBZvatcTyLSMpbpD4vy19hTtp8mGF/Cl1TBx2f3Cw7TL+lgScx4mlljQ4behg=
X-Received: by 2002:a2e:5d3:: with SMTP id 202mr3981304ljf.330.1643321423317; 
	Thu, 27 Jan 2022 14:10:23 -0800 (PST)
MIME-Version: 1.0
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
	<164325158955.29787.4769373293473421057.stgit@noble.brown>
In-Reply-To: <164325158955.29787.4769373293473421057.stgit@noble.brown>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 28 Jan 2022 07:10:11 +0900
Message-ID: <CAKFNMom4Z76ti4fp69UeKYf0d4x635OR7Q_CjVnBj+vQSuhESg@mail.gmail.com>
To: NeilBrown <neilb@suse.de>
Cc: "Darrick J. Wong" <djwong@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
	Linux MM <linux-mm@kvack.org>, drbd-dev@lists.linbit.com,
	Paolo Valente <paolo.valente@linaro.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
	Chao Yu <chao@kernel.org>, linux-block@vger.kernel.org,
	linux-nilfs <linux-nilfs@vger.kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Jeff Layton <jlayton@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 2/9] Remove bdi_congested() and
	wb_congested() and related functions
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

On Thu, Jan 27, 2022 at 11:47 AM NeilBrown <neilb@suse.de> wrote:
>
> These functions are no longer useful as the only bdis that report
> congestion are in ceph, fuse, and nfs.  None of those bdis can be the
> target of the calls in drbd, ext2, nilfs2, or xfs.
>
> Removing the test on bdi_write_contested() in current_may_throttle()
> could cause a small change in behaviour, but only when PF_LOCAL_THROTTLE
> is set.
>
> So replace the calls by 'false' and simplify the code - and remove the
> functions.
>
> Signed-off-by: NeilBrown <neilb@suse.de>
> ---
>  drivers/block/drbd/drbd_int.h |    3 ---
>  drivers/block/drbd/drbd_req.c |    3 +--
>  fs/ext2/ialloc.c              |    2 --
>  fs/nilfs2/segbuf.c            |   11 -----------
>  fs/xfs/xfs_buf.c              |    3 ---
>  include/linux/backing-dev.h   |   26 --------------------------
>  mm/vmscan.c                   |    4 +---
>  7 files changed, 2 insertions(+), 50 deletions(-)

for nilfs2 bits,

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
