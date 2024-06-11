Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC1B9044A9
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 21:32:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 78F424209C0;
	Tue, 11 Jun 2024 21:32:08 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A0B6342092C
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 21:31:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4VzJhC6RZtzlgMVP;
	Tue, 11 Jun 2024 19:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	s=mr01; t=1718134291; x=1720726292; bh=Cf7GcJGKcu7D5BiBoZvRx6x3
	LTfH72Sz+jyW+IP4PGw=; b=d+QkU/8VZ6Dq+WOkUNTA34lPXUILl3LVbu6kO4uj
	dRf9ZLceTOdlVMVrbZoxWEf4u5ywVZd7xmS7z7Qu9fGFq3c09JpTwe9Izw4JtWWY
	tHhkQiq7BjVQmgAeymktZWCjgXvLtR18TTk9AbAP5hLoxcQzO5YN29aNyMj+6U8N
	mnLgDc3DfcoUZU+HIpoj33PjIC9sY+avSJ5HN8s208j4yIUXD3pm8VAHyLZOImgN
	bjIvKsv7Fn1K4+4dykzuQT4iVGBagOEJKDZaAYW7tHizV3z3TzNCBZqR7MTEAs6D
	ikorZXLPiNhCfCU2hPtZjpFb2ahQxj4wO1mOgHFaYmHiNQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
	by localhost (009.lax [127.0.0.1]) (mroute_mailscanner,
	port 10029) with LMTP
	id DQP8SoW0yS3G; Tue, 11 Jun 2024 19:31:31 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4VzJgv1SgJzlgMVN;
	Tue, 11 Jun 2024 19:31:22 +0000 (UTC)
Message-ID: <8206c0cf-1787-4282-bcec-746d7c7f3880@acm.org>
Date: Tue, 11 Jun 2024 12:31:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/26] loop: fold loop_update_rotational into
	loop_reconfigure_limits
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-8-hch@lst.de>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240611051929.513387-8-hch@lst.de>
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
> This prepares for moving the rotational flag into the queue_limits and
> also fixes it for the case where the loop device is backed by a block
> device.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
