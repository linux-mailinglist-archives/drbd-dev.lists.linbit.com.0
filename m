Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 138789035D4
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 10:21:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5F846420948;
	Tue, 11 Jun 2024 10:21:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6389B420914
	for <drbd-dev@lists.linbit.com>;
	Tue, 11 Jun 2024 10:21:13 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9FE0660C54;
	Tue, 11 Jun 2024 08:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC86FC2BD10;
	Tue, 11 Jun 2024 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718094072;
	bh=JnxwCboQk8q7RlLZlW4EySiyxLKgUjk778Traf3fmoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T4lYpc9oPKzbZgXNScRXj6fCCJuF2imMpVDO2TmKoprDVoEMAifMh8yJGso4Vfp5y
	OgmplPRZ+vOoc/3W5Z2/vvUR59B9dvvmiJ3TXlfZjt80a4a+B616vcQsbnQtB8TQlx
	hCCsxl7ULUCU4AFz7+jEuDHX9a+L+WI83HnZLceoWGeScqnvdznMEcmPFZA+cvHULW
	tsWbQ1wsp08S3pZw6QSDKAzAlfLw76qcbODE/Rb62WAcCaMIMds4nLrdbgO640++hO
	MSBTvFYh9It5CVDUDafarknsby40aO62VVd0BASXyBUwrOv7fDEDdarOIcY3IX1DTf
	+T3qkIPPHiYZg==
Message-ID: <d1775d3f-daaa-4193-9f68-06ec47563b35@kernel.org>
Date: Tue, 11 Jun 2024 17:21:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/26] block: move the poll flag to queue_limits
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-22-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-22-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, linux-bcache@vger.kernel.org,
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

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the poll flag into the queue_limits feature field so that it
> can be set atomically and all I/O is frozen when changing the flag.
> 
> Stacking drivers are simplified in that they now can simply set the
> flag, and blk_stack_limits will clear it when the features is not
> supported by any of the underlying devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Kind of the same remark as for io_stat about this not really being a device
feature. But I guess seeing "features" as a queue feature rather than just a
device feature makes it OK to have poll (and io_stat) as a feature rather than
a flag.

So:

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

