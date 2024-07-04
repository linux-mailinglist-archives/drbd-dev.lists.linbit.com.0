Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E63292749B
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jul 2024 13:11:27 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 93634420653;
	Thu,  4 Jul 2024 13:11:24 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 885A54205C7
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jul 2024 13:11:20 +0200 (CEST)
Received: by mail-wr1-f45.google.com with SMTP id
	ffacd0b85a97d-3626c29d3f0so329821f8f.1
	for <drbd-dev@lists.linbit.com>; Thu, 04 Jul 2024 04:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1720091479; x=1720696279;
	darn=lists.linbit.com; 
	h=to:references:message-id:content-transfer-encoding:cc:date
	:in-reply-to:from:subject:mime-version:from:to:cc:subject:date
	:message-id:reply-to;
	bh=qwBmB9TZGFjcG5R2+2N2tz93DvezoEGxh6PsIk8IO/w=;
	b=QcRPW8uqsNukmJdY/oXkvDt1K1SyzZUI/U1vsyMMYrpDas/u14fiYC/irYOS2IPkDG
	k0gDDXkj2c/Yqe09c26WlodAYgmYuHwhGZjWFywEKb1Nw0/XHdizVq2yNMmdUly/Tk3w
	3IXcWDX5TIc5NbmpiW94ZkT0HYGJVrlz3xmR+EFXMnEirmgeu7TtX5+698ihj+csVxeU
	jgroFu5JTRntABOIYkby+cebqynSTj+kCWqAPu0wjJNaLciQW21aXhWIZGmUqGN+UWE6
	g6j0HLbjKYiE6+Ss9KxxWHg1ZJD+99Zmw+pCYaFMmTqBis64rODgQz9AevuXQU9TbHpP
	W6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1720091479; x=1720696279;
	h=to:references:message-id:content-transfer-encoding:cc:date
	:in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=qwBmB9TZGFjcG5R2+2N2tz93DvezoEGxh6PsIk8IO/w=;
	b=F/KpIn0pkbQGd28yNza40APV8f2ckrGBz7+eXkzFx02/keCBaE8Y4I3uxXnvMRq75q
	zo0VrQR+5Lbf+0N+6MBctoTi6uwSI9rvK8BlJVcSAPmpQ+S4IDR2BrTOu+Z9mVVBtOY5
	/yGA02Wv07I95DkZHGrJBRiQyeYqyOmBqePG8hHNw0pcFNX+nIWdRgx7YChuZ5RaVuz7
	4zrFdkCSfSw3yIiNJ5G62g/di6VIqMz4CW4pZ6D1EamySxw96L05yLBnloWkrKyr+sfL
	0YZnIuzg5H+YC5HaWlzg0Y+RzASSzP9ZWyccJi17MqW4LWz25eaHLBKiCFujGs4DmLH+
	VmEg==
X-Forwarded-Encrypted: i=1;
	AJvYcCVi2NiAL//wW1DPMQHjNSTMUQ8XqPnvhqUNEgqHzyKbtCeJNRyedP2cxDf4BVm78n2nPoaSfOVw2/NGs6dU4tHocDZqqCqB9r0w
X-Gm-Message-State: AOJu0Ywkc2+izoaDy+1CM2DcU8Q1X5QvaPSdNdoKTT4IsvpXhv5S6ENZ
	UGCL0E+Hu4xcnJPryESaDNodNK4HWeUAarv4m5VDMlMq5V3fEERy
X-Google-Smtp-Source: AGHT+IFEzvL2jC2faLe/uaMvaq/UCJ26KrH1XFm9Ol6h8w0Rebt6hjx4X+gdY7pIVUfbtqQYexMuPw==
X-Received: by 2002:a5d:5712:0:b0:367:94e7:958a with SMTP id
	ffacd0b85a97d-3679dd17ec1mr1153338f8f.6.1720091479417; 
	Thu, 04 Jul 2024 04:11:19 -0700 (PDT)
Received: from [10.14.0.2] ([139.28.176.164]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-36787db4d12sm6821051f8f.110.2024.07.04.04.11.17
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jul 2024 04:11:18 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
From: Simon Fernandez <fernandez.simon@gmail.com>
In-Reply-To: <ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
Date: Thu, 4 Jul 2024 12:11:16 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <78BDDF6A-1FC7-4DD7-AABF-E0B055772CBF@gmail.com>
References: <20240617060532.127975-1-hch@lst.de>
	<20240617060532.127975-15-hch@lst.de>
	<ZnmoANp0TgpxWuF-@kbusch-mbp.dhcp.thefacebook.com>
To: Keith Busch <kbusch@kernel.org>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Cc: nvdimm@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, linux-mtd@lists.infradead.org,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yu Kuai <yukuai3@huawei.com>, dm-devel@lists.linux.dev,
	linux-um@lists.infradead.org, Mike Snitzer <snitzer@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Ming Lei <ming.lei@redhat.com>, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Damien Le Moal <dlemoal@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	xen-devel@lists.xenproject.org, ceph-devel@vger.kernel.org,
	nbd@other.debian.org, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-mmc@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	virtualization@lists.linux.dev, Lars Ellenberg <lars.ellenberg@linbit.com>,
	linuxppc-dev@lists.ozlabs.org,
	=?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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

Hi folks, how can I unsubscribe from this group.?
Thanks in advance.
S

> On 24 Jun 2024, at 18:08, Keith Busch <kbusch@kernel.org> wrote:
>=20
> On Mon, Jun 17, 2024 at 08:04:41AM +0200, Christoph Hellwig wrote:
>> -#define blk_queue_nonrot(q)	test_bit(QUEUE_FLAG_NONROT, =
&(q)->queue_flags)
>> +#define blk_queue_nonrot(q)	((q)->limits.features & =
BLK_FEAT_ROTATIONAL)
>=20
> This is inverted. Should be:
>=20
> #define blk_queue_nonrot(q)	(!((q)->limits.features & =
BLK_FEAT_ROTATIONAL))
>=20

