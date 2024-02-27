Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE25869A4F
	for <lists+drbd-dev@lfdr.de>; Tue, 27 Feb 2024 16:26:18 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D5DB3420303;
	Tue, 27 Feb 2024 16:26:16 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 59BB5420230
	for <drbd-dev@lists.linbit.com>; Tue, 27 Feb 2024 16:26:12 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 479A968D05; Tue, 27 Feb 2024 16:26:10 +0100 (CET)
Date: Tue, 27 Feb 2024 16:26:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Yu Kuai <yukuai1@huaweicloud.com>
Subject: Re: [PATCH 06/16] md/raid1: use the atomic queue limit update APIs
Message-ID: <20240227152609.GA14782@lst.de>
References: <20240226103004.281412-1-hch@lst.de>
	<20240226103004.281412-7-hch@lst.de>
	<b4828284-87ec-693b-e2c3-84bdafcbda65@huaweicloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4828284-87ec-693b-e2c3-84bdafcbda65@huaweicloud.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, Mike Snitzer <snitzer@kernel.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Song Liu <song@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, "yukuai \(C\)" <yukuai3@huawei.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Mon, Feb 26, 2024 at 07:29:08PM +0800, Yu Kuai wrote:
> Hi,
>
> 在 2024/02/26 18:29, Christoph Hellwig 写道:
>> Build the queue limits outside the queue and apply them using
>> queue_limits_set.  Also remove the bogus ->gendisk and ->queue NULL
>> checks in the are while touching it.
>
> The checking of mddev->gendisk can't be removed, because this is used to
> distinguish dm-raid and md/raid. And the same for following patches.

Ah.  Well, we should make that more obvious then.  This is what I
currently have:

http://git.infradead.org/?p=users/hch/block.git;a=shortlog;h=refs/heads/md-blk-limits

particularly:

http://git.infradead.org/?p=users/hch/block.git;a=commitdiff;h=24b2fd15f57f06629d2254ebec480e1e28b96636

