Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4EE904489
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 21:27:08 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id ECCA6420948;
	Tue, 11 Jun 2024 21:27:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 92E9F420910
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 21:27:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4VzJWL4fk8zlgMVV;
	Tue, 11 Jun 2024 19:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	s=mr01; t=1718133830; x=1720725831; bh=rZhPumdb2n42pDla++r+0nDR
	HS4rqP791XrFPg2G27s=; b=tf12JUS8O/vzIYeKCwJjv+pwBfVWJQo9KgcDGp0z
	zC7lV0/c/f2ThXKlndGod8/GtTQwAvp2FqIrETvuNz72J0EV/Nq7OLg2Ro3uTx1k
	a3Lag73AcQE3SA5r4iVyJOxbBbB3z7MfHM9AUAy4N74Z8QUhqfhGTIxZ6DcyQWB0
	8Q6dtcQ0sUi3rbVLLp7uCK5xx11aui7r2k4FrkxildcMH3hs4D+DUFLmfX5g1L14
	BQ47XWYzIYACtm6ChhwhZqZfg6iWXjIO/WaP2y1Mjt4ULw04tLtnXIqdkxdlkhKw
	j/QTJWPUoPxIYeArXQy68tOsZbpeaOqMb660pTcOxJP27w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
	by localhost (009.lax [127.0.0.1]) (mroute_mailscanner,
	port 10029) with LMTP
	id zYqmexEwqHMb; Tue, 11 Jun 2024 19:23:50 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4VzJVz4rs6zlgMVT;
	Tue, 11 Jun 2024 19:23:39 +0000 (UTC)
Message-ID: <165613a2-237d-4f2b-9843-75ce0f928dff@acm.org>
Date: Tue, 11 Jun 2024 12:23:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/26] loop: always update discard settings in
	loop_reconfigure_limits
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-5-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240611051929.513387-5-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 6/10/24 10:19 PM, Christoph Hellwig wrote:
> Simplify loop_reconfigure_limits by always updating the discard limits.
> This adds a little more work to loop_set_block_size, but doesn't change
> the outcome as the discard flag won't change.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
