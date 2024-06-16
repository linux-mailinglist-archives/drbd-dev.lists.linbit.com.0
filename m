Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E1990A0A2
	for <lists+drbd-dev@lfdr.de>; Mon, 17 Jun 2024 01:01:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9593E420216;
	Mon, 17 Jun 2024 01:01:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B91A42012B
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2024 01:01:12 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 522C7CE0E5D;
	Sun, 16 Jun 2024 23:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAA0C2BD10;
	Sun, 16 Jun 2024 23:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718578869;
	bh=K48GiByJehCmQjwi20pmfnU+WsCyr4S6WxHNS+fcYIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gczAGXT2JgNBboue0aH6XDCajaGt0Tn9T6RNwUC8NdBoTEgjtTbwpmUfCPkjFQ9wM
	MM968k+DIaMHgn73yxqDo9X2C3EJ5/755Y+99nXMZx497l32DWuxyKEgkUS1Mfauzi
	zlSFlVj6tWpctoPTJ+wOY0xCMexSj4HtxdjXI3+rZfPjj6bie6Cukz6u7sVo5A7bEU
	9rKTuHOjY9Tr5Ii5b3jprMmIgspdDlLslR4qSbgMPqGu86/2ypBmGpS+m4Lh9tPaWA
	jbUd1obFjKTKufNm0BQAftChaDznmaK4Iq8S3q+7ZRNQrBkFu3/tvjG2xwv4gQQlB4
	JHm9Ls++1gm6g==
Message-ID: <5a697233-0611-459d-b889-2e0133bbb541@kernel.org>
Date: Mon, 17 Jun 2024 08:01:04 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/26] sd: move zone limits setup out of
	sd_read_block_characteristics
To: Christoph Hellwig <hch@lst.de>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-3-hch@lst.de>
	<40ca8052-6ac1-4c1b-8c39-b0a7948839f8@kernel.org>
	<20240613093918.GA27629@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240613093918.GA27629@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-bcache@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
	drbd-dev@lists.linbit.com, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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

On 6/13/24 18:39, Christoph Hellwig wrote:
> On Tue, Jun 11, 2024 at 02:51:24PM +0900, Damien Le Moal wrote:
>>> +	if (sdkp->device->type == TYPE_ZBC)
>>
>> Nit: use sd_is_zoned() here ?
> 
> Actually - is there much in even keeping sd_is_zoned now that the
> host aware support is removed?  Just open coding the type check isn't
> any more code, and probably easier to follow.

Removing this helper is fine by me. There are only 2 call sites in sd.c and the
some of 4 calls in sd_zbc.c are not really needed:
1) The call in sd_zbc_print_zones() is not needed at all since this function is
called only for a zoned drive from sd_zbc_revalidate_zones().
2) The calls in sd_zbc_report_zones() and sd_zbc_cmnd_checks() are probably
useless as these are called only for zoned drives in the first place. The checks
would be useful only for passthrough commands, but then we do not really care
about these and the user will get a failure anyway if it tries to do ZBC
commands on non-ZBC drives.
3) That leaves only the call in sd_zbc_read_zones() but that check can probably
be moved to sd.c to conditionally call  sd_zbc_read_zones().

-- 
Damien Le Moal
Western Digital Research

