Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 776AF9033B4
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 09:32:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C50344208E5;
	Tue, 11 Jun 2024 09:32:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22FA64208DB
	for <drbd-dev@lists.linbit.com>;
	Tue, 11 Jun 2024 09:32:32 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 32D5260C47;
	Tue, 11 Jun 2024 07:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0F2C2BD10;
	Tue, 11 Jun 2024 07:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718091151;
	bh=AF+zG6ZFufj7ktoeAMS7+47wp+ON6l7hR24Gr5fCwt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SPZjzavtcTKyCdC4WGEmHFxtV9LSffVVHpZkghrgh94KIDRkU8Rgia29Z6gttxoe9
	zOX7C6t8muRYmEJZDxtGZLcKQdFby+uhJ+qwHFKzMHofsRuUcCtmhO2REjHrW7IVjC
	7C0j0tRe+awY6OwUGv767JT4KMLbYhYrBxC1MF4vQdaDAWH1YkqCVa5cS1IpTDl7jQ
	DwpBzOgI8vuLSRr2nP+6MuC1MYxBAnJs8yxlw2hav/xabgNZGi1G1i8tZ6aqMjzXS4
	h+CSlB5tmAFTFG1Iuv9NHsTDXLnN731DIz3tGAdH8iuIjAV/89MvaPrp5ZojK8LhAf
	PBu9mWf+fZU2w==
Message-ID: <77ea357f-f73f-4524-8995-ed204d5f3431@kernel.org>
Date: Tue, 11 Jun 2024 16:32:26 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/26] block: freeze the queue in queue_attr_store
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-12-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-12-hch@lst.de>
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
> queue_attr_store updates attributes used to control generating I/O, and
> can cause malformed bios if changed with I/O in flight.  Freeze the queue
> in common code instead of adding it to almost every attribute.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

