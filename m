Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7162F4A9B27
	for <lists+drbd-dev@lfdr.de>; Fri,  4 Feb 2022 15:43:41 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5CBFF4205D7;
	Fri,  4 Feb 2022 15:43:40 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
	[209.85.216.53])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B541D4201F8
	for <drbd-dev@lists.linbit.com>; Fri,  4 Feb 2022 15:43:39 +0100 (CET)
Received: by mail-pj1-f53.google.com with SMTP id
	g15-20020a17090a67cf00b001b7d5b6bedaso6299669pjm.4
	for <drbd-dev@lists.linbit.com>; Fri, 04 Feb 2022 06:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kernel-dk.20210112.gappssmtp.com; s=20210112;
	h=from:to:cc:in-reply-to:references:subject:message-id:date
	:mime-version:content-transfer-encoding;
	bh=WutBl0QBGx1pfuztZArDy53so35nYoGLBU641tHFA5E=;
	b=5gLVPsHkRMBCV3E2Lf+LAZfl+lzQIxL8Dx8Ab7iW8SOaOjyaFuD4bPeO6+4n7dxN4f
	iRduYxxz46TcrYyX+1Ap0liSOrAFAXvfPsN4qY3fQaX+BVHW9pb73FM1FKbk7roOUQRO
	0BjkojN1tKKuNenJkR7GBuZ5Mb+ArbvidZ2wkuyKdKG57XlG1tBiNfGikC8Iame6xsTe
	jtDZ/jbvWCD9VvaWHpQSPrbCiRdCsHkigU+lcXMijK7epLnz6DEi/Jo9+lafuDW94ZRb
	ysIOKKVQL32DJkrl070vAgP97yYeEKcA0rVgMzTgfSbXDdyOKCYNziiX6F6rYHWr/JQm
	u8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:in-reply-to:references:subject
	:message-id:date:mime-version:content-transfer-encoding;
	bh=WutBl0QBGx1pfuztZArDy53so35nYoGLBU641tHFA5E=;
	b=gAV7L9sQgtAwS/90XyACYIjYVbQHJRkJGpRlN0/6STspSyE0HOqcFLj5dcnpg+bple
	OISQrkVYODRlZnQTPIs+ScaOP8cQBrTg/ZgE7BvXCZ/nU1DSwlojOXMKIKjrl5DAouir
	oYZ7VGIp4PdTlCelsdjEZdlU3fHb/mTE2C49RzclnmCjKrDnPu2m4WwYpv+Emrz2VTp3
	iDGCSdPQK/gW2273Tm12NvJxGOilJKFih5sQyR0Wn2rDHQgvciQ9GcaUl9cGDd5j3RJv
	HhIBSVudpJBkHvacHzTYrNzLo0zMkKjSN0tUmu88MJxfxEeu/ep9g8zqOan3u9ONh6hb
	obIA==
X-Gm-Message-State: AOAM531Pl0ZBeV9cPzqKtTe1hJMrWHoG0EA0V3pcF7I0KkFdhrUiCN15
	KPGuvkuGtgPS4mhuE2Piyjyj41o1TpMnkw==
X-Google-Smtp-Source: ABdhPJyjdkHc+scNtjJ/hehBMbW1t656mFAyg1ZRbmeSiQlqVZ7Age59IT9W0N6D7yrhQorPc/BDeA==
X-Received: by 2002:a17:90a:741:: with SMTP id
	s1mr3528802pje.161.1643985818424; 
	Fri, 04 Feb 2022 06:43:38 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
	by smtp.gmail.com with ESMTPSA id
	pf4sm15474779pjb.35.2022.02.04.06.43.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 04 Feb 2022 06:43:37 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Christoph Hellwig <hch@lst.de>
In-Reply-To: <20220202160109.108149-1-hch@lst.de>
References: <20220202160109.108149-1-hch@lst.de>
Message-Id: <164398581785.446137.16953674702943074856.b4-ty@kernel.dk>
Date: Fri, 04 Feb 2022 07:43:37 -0700
MIME-Version: 1.0
Cc: Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] improve the bio cloning interface v2
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

On Wed, 2 Feb 2022 17:00:56 +0100, Christoph Hellwig wrote:
> this series changes the bio cloning interface to match the rest changes
> to the bio allocation interface and passes the block_device and operation
> to the cloning helpers.  In addition it renames the cloning helpers to
> be more descriptive.
> 
> To get there it requires a bit of refactoring in the device mapper code.
> 
> [...]

Applied, thanks!

[01/13] drbd: set ->bi_bdev in drbd_req_new
        commit: c347a787e34cba0e5a80a04082dacaf259105605
[02/13] dm: add a clone_to_tio helper
        commit: 6c23f0bd7f16d88c774db37b30c5da82811c41be
[03/13] dm: fold clone_bio into __clone_and_map_data_bio
        commit: b1bee79237ce0ab43ef7fe66aa6e5c4783165012
[04/13] dm: fold __send_duplicate_bios into __clone_and_map_simple_bio
        commit: 8eabf5d0a7bd9226d6cc25402dde67f372aae838
[05/13] dm: move cloning the bio into alloc_tio
        commit: dc8e2021da71f6b2d5971f98ee3e528cf30c409c
[06/13] dm: pass the bio instead of tio to __map_bio
        commit: 1561b396106d759fdf5f9a71b412e068f74d2cc9
[07/13] dm: retun the clone bio from alloc_tio
        commit: 1d1068cecff70cb8e48c7cb0ba27cc3fd906eb31
[08/13] dm: simplify the single bio fast path in __send_duplicate_bios
        commit: 891fced644a7529bfd4b1436b2341527ce8f68ad
[09/13] dm-cache: remove __remap_to_origin_clear_discard
        commit: 3c4b455ef8acdacd0e5ecd33428d4f32f861637a
[10/13] block: clone crypto and integrity data in __bio_clone_fast
        commit: 56b4b5abcdab6daf71c5536fca2772f178590e06
[11/13] dm: use bio_clone_fast in alloc_io/alloc_tio
        commit: 92986f6b4c8a2c24d3a36b80140624f80fd93de4
[12/13] block: initialize the target bio in __bio_clone_fast
        commit: a0e8de798dd6710a69d69ec57b246a0e34c4a695
[13/13] block: pass a block_device to bio_clone_fast
        commit: abfc426d1b2fb2176df59851a64223b58ddae7e7

Best regards,
-- 
Jens Axboe


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
