Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D981211040
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Jul 2020 18:08:31 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 090BF4203ED;
	Wed,  1 Jul 2020 18:08:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A4F544203EA
	for <drbd-dev@lists.linbit.com>; Wed,  1 Jul 2020 18:08:28 +0200 (CEST)
Received: by mail-ed1-f68.google.com with SMTP id d16so13799441edz.12
	for <drbd-dev@lists.linbit.com>; Wed, 01 Jul 2020 09:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NgtGRFNzMUt8UwQnpVLH6Q0lK3Q/pmzbcISwUTSvZp4=;
	b=sgyWg0odMXUUNA+ymUvc43LaYs2s/aJwbFyXWRoPjxwdAxwM/8NDCnpUaFI4p3liR0
	gB3SPFv0A/WozVPJacrsy3TT9HIOMMCESTpphsqE92coNdoMTDE/jB5/k99TrA7k0WXT
	HwfvYQsx393r8hZTsu6RX5RUEhIafmeLpfC5Xxvgan8YQB6lIclWByvvZYmq9DcmZLWN
	JlL5WK7hHhUXeDny6LC8Ts2exiDWCHCRjEx+DVoYVUZMCGpeUSrXG6yeqYlDTXCkU+hk
	g1qHbmn4FwKHi5mTo+XYno4GD6wFdoeaM1etI9G0XSOMB6JxPVUPvp1yv+DnjQn7iHAQ
	vT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NgtGRFNzMUt8UwQnpVLH6Q0lK3Q/pmzbcISwUTSvZp4=;
	b=pB1tkmnbc0MMDWux7E/AfkGBYLk+C7xgpbLd6WjCyPSFuSdK2Cr2tZGO2K6LgQZPP7
	2EN1FV5yjNUSvcOs+V9H9L6jlRbQ9IUMPj6IA99VJJN27YsfpOO6fuFgZ5++K7O2QYS0
	Pveqb/dA2v494XWqyvqtApzYkFGoCCihTakAY9IKOF8zfaVL7fmz9pptB4uvkrhOUPmu
	1RWvZFI+6TRA/4Yc9lph7As5AZlgDQ+p+2ZQpEpKOk6j9EjwMkS8+JReXpw0CoYcdV62
	pSjOpoLqKOSGK8cezuB+Cg6CMfXD1lTxfMAcpBaVrWIQj6dJbSfX7utlQFlvlbcEKg/C
	m6ug==
X-Gm-Message-State: AOAM531o5sFnAAHOFBiiCVxAh+7xTuNFD1xjRTpXMSax6RSi9koXJ2T5
	o8uqbWZt5D8cjMr2AHIbtVKds5v4ZM3PHe2Br6eTKQ==
X-Google-Smtp-Source: ABdhPJwTtEaJeqUJmjVrnga0zb3T87bQXg/qHVHNHjeT7uurwTRSLAeKnsyE6dqNxhAJ1jQ5OrZ9KB+p0GzE9WKAsFg=
X-Received: by 2002:a05:6402:21c2:: with SMTP id
	bi2mr29609575edb.296.1593619707927; 
	Wed, 01 Jul 2020 09:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200701085947.3354405-1-hch@lst.de>
	<20200701085947.3354405-17-hch@lst.de>
In-Reply-To: <20200701085947.3354405-17-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 1 Jul 2020 09:08:17 -0700
Message-ID: <CAPcyv4hELsX=dnqppbL72Tg2k8xMm-5ZaEsxM98eQ7XPoG5NGg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	linux-s390 <linux-s390@vger.kernel.org>,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-raid <linux-raid@vger.kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-bcache@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 16/20] block: move ->make_request_fn to
	struct block_device_operations
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

On Wed, Jul 1, 2020 at 2:01 AM Christoph Hellwig <hch@lst.de> wrote:
>
> The make_request_fn is a little weird in that it sits directly in
> struct request_queue instead of an operation vector.  Replace it with
> a block_device_operations method called submit_bio (which describes much
> better what it does).  Also remove the request_queue argument to it, as
> the queue can be derived pretty trivially from the bio.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
[..]
>  drivers/nvdimm/blk.c                          |  5 +-
>  drivers/nvdimm/btt.c                          |  5 +-
>  drivers/nvdimm/pmem.c                         |  5 +-

For drivers/nvdimm

Acked-by: Dan Williams <dan.j.williams@intel.com>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
