Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id D72C29034E0
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 10:09:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1681E4208F5;
	Tue, 11 Jun 2024 10:09:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 85D0D4205A9
	for <drbd-dev@lists.linbit.com>;
	Tue, 11 Jun 2024 10:09:53 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7900960D2E;
	Tue, 11 Jun 2024 08:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F729C2BD10;
	Tue, 11 Jun 2024 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718093392;
	bh=q0QC/DwdDecsb+SsO2WPgUlAOrUNDUio/s56qnb48bM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ASIoL/u9H/6b4lUyYk5oEzSADY2SPITglYQKbn22RE2v5Zmv+Bdu4yXt2dx4LBuyj
	NVG1rUDMHnNTWyjPGwlGMS7q0dEKke4PAWQg/UzftKu/Ly2DNOhNfxEkKQj6EFDaHU
	gbMPLXlbaDGII4KmlbUUWCoStYYGCahBnCwU3sHyUUKQqZ1YdU0vcRocoxwls2ROg2
	gKF/wxkN6x65ww9rMbS9NJlQNYUg7Y5U2acfwFYdpXRWwDXOcSxo1CVQbqP3uooiqP
	0hvYmqaICGemmnL938SwljJXBPejQKyIB0+ALAtSSclYdQCRHYhtFi/CQNV4wF5aIA
	8HiTkYhUDl6Cg==
Message-ID: <d51e4163-99e3-4435-870d-faef3887ab6a@kernel.org>
Date: Tue, 11 Jun 2024 17:09:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/26] block: move the io_stat flag setting to queue_limits
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-17-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-17-hch@lst.de>
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
> Move the io_stat flag into the queue_limits feature field so that it
> can be set atomically and all I/O is frozen when changing the flag.

Why a feature ? It seems more appropriate for io_stat to be a flag rather than
a feature as that is a block layer thing rather than a device characteristic, no ?

> 
> Simplify md and dm to set the flag unconditionally instead of avoiding
> setting a simple flag for cases where it already is set by other means,
> which is a bit pointless.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

-- 
Damien Le Moal
Western Digital Research

