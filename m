Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F7949F7CD
	for <lists+drbd-dev@lfdr.de>; Fri, 28 Jan 2022 12:05:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F24F74201F8;
	Fri, 28 Jan 2022 12:05:08 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
	[209.85.217.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6CEB7420012
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jan 2022 10:38:08 +0100 (CET)
Received: by mail-vs1-f47.google.com with SMTP id g10so2276675vss.1
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jan 2022 01:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szeredi.hu; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E/VIyc5JpK2Sy5loT9a2HcHWg2TrorJJxRaogeKP25w=;
	b=EibPllimp8WZIwxJdUGUIFAlIuZdyznPvrXJ7caP5EDkiBNUVM4ihiUoIfNxC6TVSx
	YE207qfvpl7N/VHWz1SefuMcAFD5mqGieRSegzXNyYGWfyIdkPkwWByrIvqWimbKQ8Un
	/lbUGxvPlDX06Jf/32nPUu5Q90vZSrQ0/ovfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E/VIyc5JpK2Sy5loT9a2HcHWg2TrorJJxRaogeKP25w=;
	b=zoRl041nfR6iEDZJzMvXT90YOxQa08sAmlUpCTtPH8O5f02xHUCJ/k41wUWIQji8FS
	yA3EXlp7r/1nuQs8xT0WQ5Z+wP7cyBWx6kW4NMRystwO6jnCrJXkkxL7WKUjKib++iC6
	JYgvhRa1e62E2P1gsRJiEPrV+FqbGpC/15C/5dgNZEBCLyP40J12H6dsptxQ/kEnutyy
	xkgdB3xUVOfloDo4lQ5qs0thmbEpH/zZtIptWWM3w5tSaxyi71EElzhWbo7DRqthcaWT
	msVDqJbLZ3+FCikQPX24NGlJjN7/OZb3hfhOP/KlDibq95eLgBzQumfy3jOFrm4NjBBI
	PX5A==
X-Gm-Message-State: AOAM532mfBa4lvHuB+SoPq8x23Qa9y8To9RtT+rUZenZLLJZsgKDu9BT
	kg/7jGSQ/XQrH7AVeGyfYV7pE/RPoAIeiTToWvgeaQ==
X-Google-Smtp-Source: ABdhPJwGf3F8vVWMx/hAPOM/tzuC6mlnTkkNvV3zFtYKADK7sTRpnxjvKNE9DMzHauL+NEVwnl4j38I6/K9jRDhQk7E=
X-Received: by 2002:a67:c390:: with SMTP id s16mr3769368vsj.61.1643362687362; 
	Fri, 28 Jan 2022 01:38:07 -0800 (PST)
MIME-Version: 1.0
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>
	<164325158954.29787.7856652136298668100.stgit@noble.brown>
In-Reply-To: <164325158954.29787.7856652136298668100.stgit@noble.brown>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 28 Jan 2022 10:37:56 +0100
Message-ID: <CAJfpegt-igF8HqsDUcMzfU0jYv8WpofLy0Uv0YnXLzsfx=tkGg@mail.gmail.com>
To: NeilBrown <neilb@suse.de>
X-Mailman-Approved-At: Fri, 28 Jan 2022 12:05:07 +0100
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mm <linux-mm@kvack.org>, drbd-dev@lists.linbit.com,
	Paolo Valente <paolo.valente@linaro.org>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	Ilya Dryomov <idryomov@gmail.com>,
	Ext4 <linux-ext4@vger.kernel.org>, Chao Yu <chao@kernel.org>,
	linux-block@vger.kernel.org, linux-nilfs@vger.kernel.org,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	Linux NFS list <linux-nfs@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jeff Layton <jlayton@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Drbd-dev] [PATCH 1/9] Remove inode_congested()
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

On Thu, 27 Jan 2022 at 03:47, NeilBrown <neilb@suse.de> wrote:
>
> inode_congested() reports if the backing-device for the inode is
> congested.  Few bdi report congestion any more, only ceph, fuse, and
> nfs.  Having support just for those is unlikely to be useful.
>
> The places which test inode_congested() or it variants like
> inode_write_congested(), avoid initiating IO if congestion is present.
> We now have to rely on other places in the stack to back off, or abort
> requests - we already do for everything except these 3 filesystems.
>
> So remove inode_congested() and related functions, and remove the call
> sites, assuming that inode_congested() always returns 'false'.

Looks to me this is going to "break" fuse; e.g. readahead path will go
ahead and try to submit more requests, even if the queue is getting
congested.   In this case the readahead submission will eventually
block, which is counterproductive.

I think we should *first* make sure all call sites are substituted
with appropriate mechanisms in the affected filesystems and as a last
step remove the superfluous bdi congestion mechanism.

You are saying that all fs except these three already have such
mechanisms in place, right?  Can you elaborate on that?

Thanks,
Miklos
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
