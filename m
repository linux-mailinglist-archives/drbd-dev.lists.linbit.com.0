Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 671AB575148
	for <lists+drbd-dev@lfdr.de>; Thu, 14 Jul 2022 17:00:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2C3BA420FBC;
	Thu, 14 Jul 2022 17:00:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 304 seconds by postgrey-1.31 at mail19;
	Thu, 14 Jul 2022 17:00:03 CEST
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CA2F1420F75
	for <drbd-dev@lists.linbit.com>; Thu, 14 Jul 2022 17:00:03 +0200 (CEST)
Received: from cwcc.thunk.org (pool-173-48-118-63.bstnma.fios.verizon.net
	[173.48.118.63]) (authenticated bits=0)
	(User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 26EEsLPg008235
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 14 Jul 2022 10:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1657810466; bh=QawvQ560xdvpwEjmvpfYqk0KReolW7mc5YwpiDi8AfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=pu/S7BHY5/kT9cNJvuSsMX2+ODL61NzBt9WeY0kH2iDG1wLIRcJqXa056UAdnT5+R
	AOBqk+iBbUVfpambcQLLwkcwq41iDUgaWVXHm0jCDFkqWSpDaoESYWo2IWefkCcFPR
	dNlco22a1oOA7NYcLgzPxYPBZPms8A98tFYGPOCk3otxcYnaC30u5O484Q6oS806vX
	nqNfS1uK+j9hjifljIYmah6A264d9whosKObzjpZTzUMGjE7Zx/aXeDSM0PApGB+9y
	avfsuVx4y3MSJ8j+JXl3SVk3a5IQDq2BOebsVOHim9lSZk09zLlA2Qei9BCtXZjSZp
	VkEYcHXptjpPA==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 3753C15C003C; Thu, 14 Jul 2022 10:54:21 -0400 (EDT)
Date: Thu, 14 Jul 2022 10:54:21 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YtAuHaiK+Me08swz@mit.edu>
References: <20220713055317.1888500-1-hch@lst.de>
	<20220713055317.1888500-9-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220713055317.1888500-9-hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>,
	Mark Fasheh <mark@fasheh.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Joel Becker <jlbec@evilplan.org>, Jan Kara <jack@suse.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	linux-ext4@vger.kernel.org, Jack Wang <jinpu.wang@ionos.com>,
	ocfs2-devel@oss.oracle.com, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 8/9] ext4: only initialize mmp_bdevname once
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

On Wed, Jul 13, 2022 at 07:53:16AM +0200, Christoph Hellwig wrote:
> mmp_bdevname is currently both initialized nested inside the kthread_run
> call in ext4_multi_mount_protect and in the kmmpd thread started by it.
> 
> Lift the initiaization out of the kthread_run call in
> ext4_multi_mount_protect, move the BUILD_BUG_ON next to it and remove
> the duplicate assignment inside of kmmpd.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Theodore Ts'o <tytso@mit.edu>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
