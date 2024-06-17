Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 5070890A4D6
	for <lists+drbd-dev@lfdr.de>; Mon, 17 Jun 2024 08:13:41 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 43ED842065B;
	Mon, 17 Jun 2024 08:13:40 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1ED3742062A
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2024 08:13:38 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 79463CE0FD1;
	Mon, 17 Jun 2024 06:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26F1C2BD10;
	Mon, 17 Jun 2024 06:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718604815;
	bh=i+c+RpVRjeaE7WIb31u0YOButoWpoMUXbmMH2ED9KM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NGDwf0zXEmzo9+7Yx4d9cGXV793JqUi91piwr9DLQr9gvYLzjssulS3nd0FDXod4o
	1NiEaNf9DKv91oATngwE6MlpuTxufePFFAUPAiGTMSZ8Iyqb43pbMY/AWpT0yfgG9x
	h7tK/rGWoSYR5lk30x+/zxQfjGaL8mJv2SH7mMjlqBwSC3JpHWjWgqv3xYEnVpUZ3T
	GLm2uelJLLxYyxbZLJP4lmiyxvgd2hfNI8V/LV1wIStwKjwJDXjuh7JmDm0LI0dTdZ
	pEsb3rbnrZU0AByYnkj2ZCWuHVBzn8LtTQfnCUTAC98K23Vza+t2P0C82aHVfqiJXZ
	7lE9UMorz5Ztg==
Message-ID: <72e2cebc-a748-4e39-8783-440a82cd40c1@kernel.org>
Date: Mon, 17 Jun 2024 15:13:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/26] loop: regularize upgrading the block size for
	direct I/O
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240617060532.127975-1-hch@lst.de>
	<20240617060532.127975-7-hch@lst.de>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240617060532.127975-7-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
	linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	Hannes Reinecke <hare@suse.de>, xen-devel@lists.xenproject.org,
	ceph-devel@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
	linux-bcache@vger.kernel.org, linux-block@vger.kernel.org,
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

On 6/17/24 15:04, Christoph Hellwig wrote:
> The LOOP_CONFIGURE path automatically upgrades the block size to that
> of the underlying file for O_DIRECT file descriptors, but the
> LOOP_SET_BLOCK_SIZE path does not.  Fix this by lifting the code to
> pick the block size into common code.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Hannes Reinecke <hare@suse.de>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>

Looks good to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

