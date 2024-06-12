Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B1C9063B0
	for <lists+drbd-dev@lfdr.de>; Thu, 13 Jun 2024 08:01:27 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3F20A42081C;
	Thu, 13 Jun 2024 08:01:26 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
	[209.85.219.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 05FA942081C
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2024 17:56:18 +0200 (CEST)
Received: by mail-qv1-f51.google.com with SMTP id
	6a1803df08f44-6b08d661dbaso10317556d6.0
	for <drbd-dev@lists.linbit.com>; Wed, 12 Jun 2024 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=citrix.com; s=google; t=1718207778; x=1718812578;
	darn=lists.linbit.com; 
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:message-id:subject:cc:to:from:date:from:to
	:cc:subject:date:message-id:reply-to;
	bh=0JAgWI6yypeQvJHtBsLjxy9EsiTAtsBZFfQkPH4VMNc=;
	b=k63O/xtZrjhDCb9XNNEgOHoARem+jzSTqEWUM702o9hGJubGcyPYb7F/DCtqjeoS4d
	nnyxEU4G/veAJk7VieJXCHA7jT02WujFuKSYgeLVIs/15Ist1DS3LOPS5Eg7iMc1q9cz
	wwkJBneYguroBWX2ytv8/EeSLvHoDpRINJF8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1718207778; x=1718812578;
	h=in-reply-to:content-transfer-encoding:content-disposition
	:mime-version:references:message-id:subject:cc:to:from:date
	:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
	bh=0JAgWI6yypeQvJHtBsLjxy9EsiTAtsBZFfQkPH4VMNc=;
	b=M7dX/dK3hIzwslP1n7SDk1rYpwWvgFiOw53iTfFWNpeDksR4TPVFMtDpXCSf5aE7jy
	F3nUCOYcfBoy9sMxCCnhu8yo/WmBcA8XyBzeb0szWcsDhkdYhWrUwPxRgffvROqvii0o
	xtAV43wJHshve0LUXDySAeJ77rjBRHhqOMbGVRHSeCsGsxDHN9H+X1yYtiyrDbs4s+M4
	1uVaVFX7LfSUjQz/hrd5rgLN0CBT9gYyHJov5pIr+V8ULvyjGT8b0pcbfnjejUgRqT56
	NOGN8iTtIGt9cdTaPqK+bFlDg16iNF5dm+m5XZqQMM1IOfx/jqKiAxyJP3NZInUUOzbk
	RIYA==
X-Forwarded-Encrypted: i=1;
	AJvYcCVRM8iNVmDvl5aTb0PFnmCD9qByBrL3jVJZBOHMXJqpr+YFhkjOoDrn/sMQVxFPaJquSkZoTh9526pLgc3XhLBuSCFcGOdM0d2g
X-Gm-Message-State: AOJu0YyAQToD8ctCC55uF6TX7rCdCr9Tj8O9uDqqXd4bzNS4Z4BvoqSk
	VyybMXy8YYLCvMFOSfEGb3qRlEX9pMDyXqgf4BPEhZ1IJ3ZXuKHULECwTToBPm8=
X-Google-Smtp-Source: AGHT+IH3vJ/Cfk8LzYoeLv9cXT/SgN6Pt3X56xC7VVYFazmjn8i4deMSmAqg4iM25NKqjeo5TBvU1g==
X-Received: by 2002:a05:6214:2a47:b0:6b0:7365:dde0 with SMTP id
	6a1803df08f44-6b2a33de160mr1306776d6.18.1718207777691; 
	Wed, 12 Jun 2024 08:56:17 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
	6a1803df08f44-6b0884337e9sm22877866d6.16.2024.06.12.08.56.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 12 Jun 2024 08:56:17 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:56:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 10/26] xen-blkfront: don't disable cache flushes when
	they fail
Message-ID: <ZmnFH17bTV2Ot_iR@macbook>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-11-hch@lst.de> <ZmlVziizbaboaBSn@macbook>
	<20240612150030.GA29188@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240612150030.GA29188@lst.de>
X-Mailman-Approved-At: Thu, 13 Jun 2024 08:01:11 +0200
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

On Wed, Jun 12, 2024 at 05:00:30PM +0200, Christoph Hellwig wrote:
> On Wed, Jun 12, 2024 at 10:01:18AM +0200, Roger Pau Monné wrote:
> > On Tue, Jun 11, 2024 at 07:19:10AM +0200, Christoph Hellwig wrote:
> > > blkfront always had a robust negotiation protocol for detecting a write
> > > cache.  Stop simply disabling cache flushes when they fail as that is
> > > a grave error.
> > 
> > It's my understanding the current code attempts to cover up for the
> > lack of guarantees the feature itself provides:
> 
> > So even when the feature is exposed, the backend might return
> > EOPNOTSUPP for the flush/barrier operations.
> 
> How is this supposed to work?  I mean in the worst case we could
> just immediately complete the flush requests in the driver, but
> we're really lying to any upper layer.

Right.  AFAICT advertising "feature-barrier" and/or
"feature-flush-cache" could be done based on whether blkback
understand those commands, not on whether the underlying storage
supports the equivalent of them.

Worst case we can print a warning message once about the underlying
storage failing to complete flush/barrier requests, and that data
integrity might not be guaranteed going forward, and not propagate the
error to the upper layer?

What would be the consequence of propagating a flush error to the
upper layers?

> > Such failure is tied on whether the underlying blkback storage
> > supports REQ_OP_WRITE with REQ_PREFLUSH operation.  blkback will
> > expose "feature-barrier" and/or "feature-flush-cache" without knowing
> > whether the underlying backend supports those operations, hence the
> > weird fallback in blkfront.
> 
> If we are just talking about the Linux blkback driver (I know there
> probably are a few other implementations) it won't every do that.
> I see it has code to do so, but the Linux block layer doesn't
> allow the flush operation to randomly fail if it was previously
> advertised.  Note that even blkfront conforms to this as it fixes
> up the return value when it gets this notsupp error to ok.

Yes, I'm afraid it's impossible to know what the multiple incarnations
of all the scattered blkback implementations possibly do (FreeBSD,
NetBSD, QEMU and blktap at least I know of).

> > Overall blkback should ensure that REQ_PREFLUSH is supported before
> > exposing "feature-barrier" or "feature-flush-cache", as then the
> > exposed features would really match what the underlying backend
> > supports (rather than the commands blkback knows about).
> 
> Yes.  The in-tree xen-blkback does that, but even without that the
> Linux block layer actually makes sure flushes sent by upper layers
> always succeed even when not supported.

Given the description of the feature in the blkif header, I'm afraid
we cannot guarantee that seeing the feature exposed implies barrier or
flush support, since the request could fail at any time (or even from
the start of the disk attachment) and it would still sadly be a correct
implementation given the description of the options.

Thanks, Roger.
