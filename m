Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B805739C7
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Jul 2022 17:10:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C6573420FBA;
	Wed, 13 Jul 2022 17:10:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 338 seconds by postgrey-1.31 at mail19;
	Wed, 13 Jul 2022 17:10:46 CEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 58B36420FAF
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 17:10:46 +0200 (CEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 2CE4933EBC;
	Wed, 13 Jul 2022 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1657724708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=3UthFAv3XYV85llf1wlYTZ00AmCnaMVjVxb5nRXSeSw=;
	b=SwqlHRDxgN7Jzn2rO6klx+TGxsb5kYnOmvpEnxIg442V/TJzgxweZNo1LA6Ou5tZZYxHC6
	t41LQy7I8A6ZbJwe+P2NX8LDtAf1Zc5eL+wOkIHnF2nXws/Mlsw50FBKcAPRTIpieoP3zd
	kHWda9H3XDl8OidcG3UyH52gQDD9QPE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1657724708;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=3UthFAv3XYV85llf1wlYTZ00AmCnaMVjVxb5nRXSeSw=;
	b=WYu1r+884kvySXmy1H9WTd4t806hphyxPIyqSBY+c85qDWJ77/AiWD6xWQ3IX8zhNjROLV
	1s/OrNwCvZyDTfBQ==
Received: from quack3.suse.cz (unknown [10.163.28.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id EE9CE2C141;
	Wed, 13 Jul 2022 15:05:07 +0000 (UTC)
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id A1E4BA0635; Wed, 13 Jul 2022 17:05:07 +0200 (CEST)
Date: Wed, 13 Jul 2022 17:05:07 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20220713150507.6bvq4bidmirs2mql@quack3>
References: <20220713055317.1888500-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713055317.1888500-1-hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>, Song Liu <song@kernel.org>,
	Mark Fasheh <mark@fasheh.com>, linux-raid@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Joel Becker <jlbec@evilplan.org>, Jan Kara <jack@suse.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	linux-ext4@vger.kernel.org, Jack Wang <jinpu.wang@ionos.com>,
	ocfs2-devel@oss.oracle.com, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] remove bdevname
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

On Wed 13-07-22 07:53:08, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series removes the final uses and the implementation of the bdevname()
> function.

All patches look good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> 
> Diffstat:
>  block/bdev.c                        |   10 ++---
>  block/blk-lib.c                     |    6 +--
>  block/genhd.c                       |   23 ------------
>  drivers/block/drbd/drbd_req.c       |    6 +--
>  drivers/block/pktcdvd.c             |   10 +----
>  drivers/block/rnbd/rnbd-srv-dev.c   |    1 
>  drivers/block/rnbd/rnbd-srv-dev.h   |    1 
>  drivers/block/rnbd/rnbd-srv-sysfs.c |    5 +-
>  drivers/block/rnbd/rnbd-srv.c       |    9 ++---
>  drivers/block/rnbd/rnbd-srv.h       |    3 -
>  drivers/md/md.c                     |    2 -
>  drivers/md/raid1.c                  |    2 -
>  drivers/md/raid10.c                 |    2 -
>  fs/ext4/mmp.c                       |    9 ++---
>  fs/jbd2/journal.c                   |    6 ++-
>  fs/ocfs2/cluster/heartbeat.c        |   64 ++++++++++++++++--------------------
>  include/linux/blkdev.h              |    1 
>  kernel/trace/blktrace.c             |    4 +-
>  18 files changed, 62 insertions(+), 102 deletions(-)
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
