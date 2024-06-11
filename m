Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C083904198
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 18:51:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 325EF4205CB;
	Tue, 11 Jun 2024 18:51:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
	[209.85.128.172])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 028534203C1
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 18:50:57 +0200 (CEST)
Received: by mail-yw1-f172.google.com with SMTP id
	00721157ae682-627f3265898so62729737b3.3
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 09:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toxicpanda-com.20230601.gappssmtp.com; s=20230601; t=1718124657;
	x=1718729457; darn=lists.linbit.com; 
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
	bh=k7qH/Egkqtc5OmSCKcG8suDn1pwScsKWRQ+gioBgKgY=;
	b=LkceflPWitWrzMiJNQspso0YYlJ0cqt1NTYoZ3xl8R83uLEfjzxXFeJQwHQ+ryAbpm
	0vygGy9s7KO4FzQnvkbwiwkV0FiIZTS/dFMl+FyrV89lj5TmGgcZ0Qo96ocF65j4BB3i
	CHKol2LwA6amI8XU0gA7IQFES25nmMhY8N6mR4Wh/VUgLr3oWPfTuX6fgRC2yu2UPOoY
	DulcPCGPAcSjlG9L9jFZe48pogAelsPx12g5PLh7FTcF3zPXp8GoZ7TrAliNrc/Cq6jr
	SWyh+qisstDEHMaFy0slKN8wRWMYC/bYpxoaw7I1jz5Jheummz+7zbPWEFQFQ5ttn46/
	oOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1718124657; x=1718729457;
	h=in-reply-to:content-disposition:mime-version:references:message-id
	:subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=k7qH/Egkqtc5OmSCKcG8suDn1pwScsKWRQ+gioBgKgY=;
	b=YNUtbahy7GqcrDDLVPp3hBVNJQleIMaQRv12RBgxT8YBqA8DSYJHjQRorOdLi8QdKJ
	eZ/jOZktn6KMsjeAAYUpNU3gEb4UXzbi+ydHzxR/dt13v5cc9usyhyfrrjW6GPvsR9F1
	UjjqtL9b6oLyTgjU26slbNwSyruQetMuijfc6DSOSMFflmeuQi9LZHRpwQTju07RBaBd
	j+n9pFqzR5AP9BbrF7XPkB+K56G6UtfZtKU+ru2Ap4PS6NWhXrqwNfV779ZwGySSwgWC
	PfFsdXaNbaXy8fu1A04gXH0Gh8FA8+y42C1QcrMigMKth7ywD1AjrRd18fwXIwZ8XIKZ
	x5xg==
X-Forwarded-Encrypted: i=1;
	AJvYcCXujbeVx4N9fq9sb70k68upcd3oJ8G3DOIBpcFv8jg/F7/ceyP0k/t23Gp/esYz7IAbbQ33PxDKslbLrTn8B+ZtMg/qZQWJSXKb
X-Gm-Message-State: AOJu0Yx/pl+0id2rs3q11GP5NozAn4Bc6hpRaiaXed9cP8wAcfvYXTVj
	6ENxb8jfxU+Yfm877FbzYjvOQChsUL7RBwQwb2YD6iXlFJz4O/8DWIr7M69dhfg=
X-Google-Smtp-Source: AGHT+IFLbNcRGoXteJvsvQz9ePKtTqtffGprFSIVvQoC+S7q0aJ0DFFhhqHjAFy+KyUVXYjD8ktBew==
X-Received: by 2002:a0d:d851:0:b0:618:95a3:70b9 with SMTP id
	00721157ae682-62cd565129cmr130634777b3.36.1718124656832; 
	Tue, 11 Jun 2024 09:50:56 -0700 (PDT)
Received: from localhost (syn-076-182-020-124.res.spectrum.com.
	[76.182.20.124]) by smtp.gmail.com with ESMTPSA id
	00721157ae682-62ccaef2825sm20935207b3.139.2024.06.11.09.50.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Jun 2024 09:50:56 -0700 (PDT)
Date: Tue, 11 Jun 2024 12:50:55 -0400
From: Josef Bacik <josef@toxicpanda.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 09/26] nbd: move setting the cache control flags to
	__nbd_set_size
Message-ID: <20240611165055.GD247672@perftesting>
References: <20240611051929.513387-1-hch@lst.de>
	<20240611051929.513387-10-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611051929.513387-10-hch@lst.de>
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
	virtualization@lists.linux.dev, Ming Lei <ming.lei@redhat.com>,
	linux-raid@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	nbd@other.debian.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, linuxppc-dev@lists.ozlabs.org,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
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

On Tue, Jun 11, 2024 at 07:19:09AM +0200, Christoph Hellwig wrote:
> Move setting the cache control flags in nbd in preparation for moving
> these flags into the queue_limits structure.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef
