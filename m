Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 644A24CDD55
	for <lists+drbd-dev@lfdr.de>; Fri,  4 Mar 2022 20:30:43 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1C07D4201B9;
	Fri,  4 Mar 2022 20:30:41 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D7A60420060
	for <drbd-dev@lists.linbit.com>; Fri,  4 Mar 2022 20:30:38 +0100 (CET)
Received: by mail-pj1-f48.google.com with SMTP id
	v1-20020a17090a088100b001bf25f97c6eso2070994pjc.0
	for <drbd-dev@lists.linbit.com>; Fri, 04 Mar 2022 11:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:in-reply-to:references:subject:message-id:date
	:mime-version:content-transfer-encoding;
	bh=ngnYdHqHX0ob26fBskLNuWtCgUWkLmLTIT0t9WbICL4=;
	b=Rnbcg4cjSLMt35FRWfDoCNwLG8yqIEcNC/4CDuqOeWUL2UbhD5icci+r2Vs6F+oKhv
	Dm/P2jTtoALbDOce0IyLxnV8wEwzldwUNzUPSlySLaTJ19yqxQq+RGOiGpGrynEfk5gY
	9tmt52DxY7GoyUlHxtomylt6F+cJdeiwaGHaspEoiRImWbfOqPglCdayEgI0ElKkMIyW
	qtpd7NFyo8640nNaWdjrLgIJBNVGdwKCwS9yqD3zx4MgtHstP9TlXS3cUCKxGI88CTJZ
	EEiFM/Lnz9ee2vdwEll1E5aN0rWTm0fqNv8DEwiAJn8YTbqzl+wE3dG3W6oPutlaw/SW
	f5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
	:message-id:date:mime-version:content-transfer-encoding;
	bh=ngnYdHqHX0ob26fBskLNuWtCgUWkLmLTIT0t9WbICL4=;
	b=r5P68AT0JfNyf7faIa5AySiiKmlWMHnwx9p4ZaySDFLt0luruPwP7xGoTpzH8yyasD
	WcdYpsKBJ71J8X3jIXx+/5i68PiHjciXwCJ+CX5sSWIkMqtwPKAHlebdT4YK8BXaWtiy
	cKiM1RFLAswLyRS8u38V8irabjep/STiyhpJndSXij+YOKHqUCeQcTyDGq2X9xyYSLHZ
	DCNRiDEZ/4r2dYMM5pGqpOWSsMjI3ZerP6tN2PkGLfdjPZkJDMfQMmZMJsI8QcK26E6A
	m05egVe1SHXnvpN/ZiLz0n/zODI+mgKkgYqFQub/NwD02gdd4gFstfiXverSb+cXbBZz
	8OMA==
X-Gm-Message-State: AOAM5313RYfippcuruv7KTZ7aKffZcDB4n2G4vfbEkmx3t+2Rl40ilB9
	bUaviQzUzJiR7tJ8CbWKjqtQEw==
X-Google-Smtp-Source: ABdhPJxOOPisoZmDfj6F3/n1EIPu2+rUEXchMh8/8sGgVHx2B8DfMALx8wwjZbLjjoqkE4MjHXrmVQ==
X-Received: by 2002:a17:90b:1c8e:b0:1bf:364c:dd7a with SMTP id
	oo14-20020a17090b1c8e00b001bf364cdd7amr173281pjb.103.1646422177250;
	Fri, 04 Mar 2022 11:29:37 -0800 (PST)
Received: from [127.0.1.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
	mu1-20020a17090b388100b001bedddf2000sm5521490pjb.14.2022.03.04.11.29.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 04 Mar 2022 11:29:36 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20220303111905.321089-2-hch@lst.de>
References: <20220303111905.321089-1-hch@lst.de>
	<20220303111905.321089-2-hch@lst.de>
Message-Id: <164642217510.204397.18145743592419266706.b4-ty@kernel.dk>
Date: Fri, 04 Mar 2022 12:29:35 -0700
MIME-Version: 1.0
Cc: nvdimm@lists.linux.dev, Justin Sanders <justin@coraid.com>,
	linux-xtensa@linux-xtensa.org, Max Filippov <jcmvbkbc@gmail.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Denis Efremov <efremov@linux.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	linux-bcache@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Chris Zankel <chris@zankel.net>, Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 01/10] iss-simdisk: use bvec_kmap_local in
	simdisk_submit_bio
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

On Thu, 3 Mar 2022 14:18:56 +0300, Christoph Hellwig wrote:
> Using local kmaps slightly reduces the chances to stray writes, and
> the bvec interface cleans up the code a little bit.
> 
> 

Applied, thanks!

[01/10] iss-simdisk: use bvec_kmap_local in simdisk_submit_bio
        commit: 143a70b8b4300faa92ad82468f65dccd440e7957
[02/10] aoe: use bvec_kmap_local in bvcpy
        commit: b7ab4611b6c793100197abc93e069d6f9aab7960
[03/10] zram: use memcpy_to_bvec in zram_bvec_read
        commit: b3bd0a8a74ab970cc1cf0849e66bd0906741105b
[04/10] zram: use memcpy_from_bvec in zram_bvec_write
        commit: bd3d3203eb84d08a6daef805efe9316b79d3bf3c
[05/10] nvdimm-blk: use bvec_kmap_local in nd_blk_rw_integrity
        commit: 20072ec828640b7d23a0cfdbccf0dea48e77ba3e
[06/10] nvdimm-btt: use bvec_kmap_local in btt_rw_integrity
        commit: 3205190655ea56ea5e00815eeff4dab2bde0af80
[07/10] bcache: use bvec_kmap_local in bio_csum
        commit: 07fee7aba5472d0e65345146a68b4bd1a8b656c3
[08/10] drbd: use bvec_kmap_local in drbd_csum_bio
        commit: 472278508dce25316e806e45778658c3e4b353b3
[09/10] drbd: use bvec_kmap_local in recv_dless_read
        commit: 3eddaa60b8411c135d1c71090dea9b59ff3f2e26
[10/10] floppy: use memcpy_{to,from}_bvec
        commit: 13d4ef0f66b7ee9415e101e213acaf94a0cb28ee

Best regards,
-- 
Jens Axboe


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
