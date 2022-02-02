Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C5E4A78D3
	for <lists+drbd-dev@lfdr.de>; Wed,  2 Feb 2022 20:42:42 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1AE754201FA;
	Wed,  2 Feb 2022 20:42:41 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DFD76420026
	for <drbd-dev@lists.linbit.com>; Wed,  2 Feb 2022 20:42:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643830959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=Ll15QSD/t84/Hy62h63iGXwWFrEUBsyZcwen7Ur2tv4=;
	b=KTuxIipNg2mQme5hRcAIVKUsDP9GSldUys1qDuYzZDhiImVKHedCAeB2tOyLfFZ0as+H8r
	VZGCuqUsR4LAu1O0k2sr2+mEpF5c5J8TaidDdQk/MceEmSELiUWImox583YBWtzcZ0aZhS
	jjV2wuof5hee3cUCNxqORsNtkJ4fqaE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-392-ovFzRRhtNWG9WMBezVAfWQ-1; Wed, 02 Feb 2022 14:42:35 -0500
X-MC-Unique: ovFzRRhtNWG9WMBezVAfWQ-1
Received: by mail-qt1-f198.google.com with SMTP id
	e28-20020ac8415c000000b002c5e43ca6b7so156670qtm.9
	for <drbd-dev@lists.linbit.com>; Wed, 02 Feb 2022 11:42:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Ll15QSD/t84/Hy62h63iGXwWFrEUBsyZcwen7Ur2tv4=;
	b=wiEgjmXS1qMWJdjgk/bggKNOfDEMF7cuezSooEDmgWsf7uHFXuZUPd3Fy7GetxiSii
	VVE8okUBLfvxIMCAnOhY7L1MtVlakQpgPXDPwT6mvbvJH9Op9+tVSlPYeZMDwZtlqqSR
	gdXmb5tj1aXwxuemUMh4tIInUaYQyEGN167VxkGizcvXppj9zHv2XR7Gk9mbDsjfwyb6
	mu1u2+dfdedyXFBcyzq8Fcns+5AC1cLPzw2Wr+96tQo1abADlbWb+xVWXUmON8QMH73j
	sh+AFOnClF2h6pMmPpSKsrgK2bdB5i2rgc/NIOE5ltf1H7N5QamiuqF+IRNleaT2zzJk
	Ld/w==
X-Gm-Message-State: AOAM53076tj1N9Xotkd/NMAVS0saWJZKs8l27W/BqHwyTHhaSBdqdAoZ
	Xr+086H0ItMQO5+vhJ3hQOLiz5Dcj6T9A8zOp3YJespFbTkLxjWOvL5AGHodPx79JQvENq752IM
	N8bnYxv9ZeNN85kt9uBk=
X-Received: by 2002:a05:6214:1d0b:: with SMTP id
	e11mr28129209qvd.50.1643830955516; 
	Wed, 02 Feb 2022 11:42:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzd2HY0NfWrAJF52rEsggSv2Saz5rMDX7hMk30XVxVEf046yTiVaBhX0lsvYwv7x9JpaXU/Wg==
X-Received: by 2002:a05:6214:1d0b:: with SMTP id
	e11mr28129197qvd.50.1643830955330; 
	Wed, 02 Feb 2022 11:42:35 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id h6sm14065391qko.7.2022.02.02.11.42.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Feb 2022 11:42:34 -0800 (PST)
Date: Wed, 2 Feb 2022 14:42:33 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YfreqbCOPYFrQm73@redhat.com>
References: <20220202160109.108149-1-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220202160109.108149-1-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] improve the bio cloning interface v2
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

On Wed, Feb 02 2022 at 11:00P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Hi Jens,
> 
> this series changes the bio cloning interface to match the rest changes
> to the bio allocation interface and passes the block_device and operation
> to the cloning helpers.  In addition it renames the cloning helpers to
> be more descriptive.
> 
> To get there it requires a bit of refactoring in the device mapper code.
> 
> Changes since v1:
>  - rebased to the lastest for-5.18/block tree
>  - fix a fatal double initialization in device mapper
> 
> A git tree is also available here:
> 
>     git://git.infradead.org/users/hch/block.git bio_alloc-cleanup-part2
> 
> Gitweb:
> 
>     http://git.infradead.org/users/hch/block.git/shortlog/refs/heads/bio_alloc-cleanup-part2
> 
> Diffstat:
>  Documentation/block/biodoc.rst   |    5 -
>  block/bio-integrity.c            |    1 
>  block/bio.c                      |  106 +++++++++++++-----------
>  block/blk-crypto.c               |    1 
>  block/blk-mq.c                   |    4 
>  block/bounce.c                   |    3 
>  drivers/block/drbd/drbd_req.c    |    5 -
>  drivers/block/drbd/drbd_worker.c |    4 
>  drivers/block/pktcdvd.c          |    4 
>  drivers/md/bcache/request.c      |    6 -
>  drivers/md/dm-cache-target.c     |   26 ++----
>  drivers/md/dm-crypt.c            |   11 +-
>  drivers/md/dm-zoned-target.c     |    3 
>  drivers/md/dm.c                  |  166 +++++++++++++--------------------------
>  drivers/md/md-faulty.c           |    4 
>  drivers/md/md-multipath.c        |    4 
>  drivers/md/md.c                  |    5 -
>  drivers/md/raid1.c               |   34 +++----
>  drivers/md/raid10.c              |   16 +--
>  drivers/md/raid5.c               |    4 
>  fs/btrfs/extent_io.c             |    4 
>  include/linux/bio.h              |    6 -
>  22 files changed, 183 insertions(+), 239 deletions(-)
> 

Looks good, for all:

Reviewed-by: Mike Snitzer <snitzer@redhat.com>

I have some DM core changes for 5.18 that I need to make and this
patchset offers enough DM churn that I'd like to base my changes
ontop.  So I'd appreciate it if this patchset could land in block's
for-5.18 ASAP.

Thanks,
Mike

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
