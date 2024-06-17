Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743D90A7CF
	for <lists+drbd-dev@lfdr.de>; Mon, 17 Jun 2024 09:55:57 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8DE5142064D;
	Mon, 17 Jun 2024 09:55:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F4FC420607
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2024 09:55:52 +0200 (CEST)
Received: by mail-qt1-f178.google.com with SMTP id
	d75a77b69052e-4405743ac19so35246081cf.0
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2024 00:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=citrix.com; s=google; t=1718610952; x=1719215752;
	darn=lists.linbit.com; 
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:message-id:subject:cc:to:from:date:from:to
	:cc:subject:date:message-id:reply-to;
	bh=6I7HjTVD0FYGpGJyzdWr9lYyHGbtAeqv6wNa85E5Tlk=;
	b=MRsdVHNZ12RHBQtxJnejwB5VJvlwSdTnfLW9sj1PJ364JNOC2eL8IZL6Zvj9QsEPQg
	pdPHS1SkJ1gjJ1vBB+3zwDjIuNrk8HX/5eRI5V6Ygwpa+GrSN/tkWA4sz/H4clNuUNZL
	HDxbrIkKlJvWB+DFas3rHYSHpUaIx7Ym1yR78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1718610952; x=1719215752;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:message-id:subject:cc:to:from:date
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=6I7HjTVD0FYGpGJyzdWr9lYyHGbtAeqv6wNa85E5Tlk=;
	b=kc/bAVzIXrDrDja8ojav2rCkp4LZXPUjFtlFHrW25FdrediDRRoZs5IvejAbzL+yzP
	+p8uKFV8EsB4P04NveHloPZbeXXjemjuvdqIbxtahGC0NjfnzFqb83r9mpjkVjT5LmXd
	+hrG5GUT+2WuAkag+N36M50bjsJo0bjJDl7ZgqK67/Vuwuk6/PmLQ5XFZmSpumqxcNwx
	mT6/8qu1q8mO29Hw/B6G9N7haGDACZH10pYVLmCzx8UYaX90ZtPU5YL+n6YIcxKwNGUx
	P1hN/6uViEib2UdlEwSjiDkGpG20HXCjkBBbvAuWE7XRpDbXGg2SlaeZXJANePzHtfVn
	24Gw==
X-Forwarded-Encrypted: i=1;
	AJvYcCWNZyZCHoXsiJLdujfUu+brRKfsjgP95Gd6dpL9MMRfdPPEgmXXIb+LCDyqiY06Tl+wK9JNlthUGwoz/ISpYDym0IZ9IvlF45Ib
X-Gm-Message-State: AOJu0YzIe3BvvlykJ+/g0rljOLCMnKE2p1Pqr5WRNll7cshN9AaQOGey
	hFee1zFiKSfTS/JLtUn01j+fusx8EKN7s7FPJ0VfSDfovkolyd/hgfwB95w5pkk=
X-Google-Smtp-Source: AGHT+IFxBb+fxu+zFP9/mPYH5nZSCdE6S/NGqQ55TdkfvSsNQ6okiuS1Itv2iysUUW0wZGmJIGDYbg==
X-Received: by 2002:ac8:5e11:0:b0:440:10be:3ecf with SMTP id
	d75a77b69052e-4417ac402c0mr199666251cf.22.1718610952095; 
	Mon, 17 Jun 2024 00:55:52 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
	d75a77b69052e-441ef4eefaesm44094171cf.21.2024.06.17.00.55.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Jun 2024 00:55:51 -0700 (PDT)
Date: Mon, 17 Jun 2024 09:55:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/26] xen-blkfront: don't disable cache flushes when
	they fail
Message-ID: <Zm_sBInagtSkOZtg@macbook>
References: <20240617060532.127975-1-hch@lst.de>
	<20240617060532.127975-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617060532.127975-2-hch@lst.de>
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
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	nbd@other.debian.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org
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

On Mon, Jun 17, 2024 at 08:04:28AM +0200, Christoph Hellwig wrote:
> blkfront always had a robust negotiation protocol for detecting a write
> cache.  Stop simply disabling cache flushes in the block layer as the
> flags handling is moving to the atomic queue limits API that needs
> user context to freeze the queue for that.  Instead handle the case
> of the feature flags cleared inside of blkfront.  This removes old
> debug code to check for such a mismatch which was previously impossible
> to hit, including the check for passthrough requests that blkfront
> never used to start with.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.
