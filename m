Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC52B4991
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 16:40:15 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3B7A2420812;
	Mon, 16 Nov 2020 16:40:14 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 48EB242080F
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 16:40:12 +0100 (CET)
Received: by mail-io1-f45.google.com with SMTP id s24so17793324ioj.13
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 07:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tp0p5PHbr2FkOYp8vx6enMy9SJ7npMGO8ToOlTZAVD0=;
	b=vJHuCgkLtyaYNtKWJGKWTC2HAaX7Y9m8y1VpqDKgvUWa8d0I51VY3ALJeXJtOlsGpr
	QzxZZWfSIBe9Z9YJVgCkUF04iuHI0uFspV4JwGcoTFtYktgjnY7A8CRm243mremkxSFW
	/W8ZuC0hXxmoHn+ezTFvYhGe2XU1ttQu6xlHRIQZSFb9V/9nguKyH01uIZBsQIBla1sm
	kSpCVk0QJdWteogX0XEWe3MJV6jr1Lh++tWh99mrFKS4zYsaeRBflt08zg4X1OBFoLaD
	OZKwfBprL/CxXZIUp5e8ounGHLLXOFSswyyzQU1smV5YfKh+taZ0KanaNv47asHmejvk
	eLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tp0p5PHbr2FkOYp8vx6enMy9SJ7npMGO8ToOlTZAVD0=;
	b=C2KhMEtF2eAN2HqYEHXA9JA7k0zU2nAYWbmUNNzCrsue/V9TvmjwOPgmQYEsq6nD/m
	iMDP/o66WnKB8S1mXL3ChTIBa9dznVaw/Ji3hK6uzTpuTWM1i8baWJXvVaPXA2cKJKqc
	idbj6cZMPpXFyfTbrFdY3JffMJpPwHtXNWox5nLeX7oyRzX0FOT8Ztw+ZTXpYyd22OXG
	oGRs/4YxXq+27mUso4SC7+vzZikNYYZr0m96qMV8PjyANZ2pNFT1F5V90PWwgsfPduVa
	xSCz3YwKcIykRJj9uHHA8J4j0cFFZgiUmcsIZ+U1LKEbZZnzFEk4srK5sJfGzCw0qsv8
	L0Ag==
X-Gm-Message-State: AOAM531/6bq7t7cip86jKB5jva0SyQhaJG+y03sB6KOBb8w10gGEgonY
	eqtsfx1sG6Moh0RqKhok5AxzGw==
X-Google-Smtp-Source: ABdhPJzORiPywjBgXN2NzytHbmvXHQyepXDfzUWSZfRzXJXzcmliMaw8xrhzAaFsEhdxvHHHShuK7g==
X-Received: by 2002:a5e:9e0b:: with SMTP id i11mr3534187ioq.33.1605541212314; 
	Mon, 16 Nov 2020 07:40:12 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
	by smtp.gmail.com with ESMTPSA id
	i82sm10491839ill.84.2020.11.16.07.40.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 16 Nov 2020 07:40:11 -0800 (PST)
To: Christoph Hellwig <hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <506876ff-65b0-7610-6f9e-8228fcd201c8@kernel.dk>
Date: Mon, 16 Nov 2020 08:40:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
Content-Language: en-US
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Subject: Re: [Drbd-dev] cleanup updating the size of block devices v3
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

On 11/16/20 7:56 AM, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series builds on top of the work that went into the last merge window,
> and make sure we have a single coherent interfac for updating the size of a
> block device.
> 
> Changes since v2:
>  - rebased to the set_capacity_revalidate_and_notify in mainline
>  - keep the loop_set_size function
>  - fix two mixed up acks

Applied 1-23 for 5.11, thanks.

-- 
Jens Axboe

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
