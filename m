Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9249E893
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 18:11:48 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F389F42A596;
	Thu, 27 Jan 2022 18:11:46 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 342F542A590
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 18:11:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=xtKZnu3m4MJ1lsPgVyhgN06mFCH9uLK+At7c0q3e4j8=;
	b=AFHVdg9YeOJzzFFrx/7E18O8JX3NXr+8U6sxjHMYXC60HkQ4iBuut6RFsiFEECwsyrRUEo
	Kj172Hgpj3KINmcxdlmsdv35rAn1msIZq0vr35wHbuX96W04DGBQqmkIwjOWWG39+zcLdN
	t4FWNvmSC1Y+WPAZn7OnBAUT9xHQV6M=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-456-Umj0Te8mM_mJ82A6uGE62w-1; Thu, 27 Jan 2022 12:11:42 -0500
X-MC-Unique: Umj0Te8mM_mJ82A6uGE62w-1
Received: by mail-qk1-f199.google.com with SMTP id
	j66-20020a375545000000b004e0e071f37eso287925qkb.23
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 09:11:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=xtKZnu3m4MJ1lsPgVyhgN06mFCH9uLK+At7c0q3e4j8=;
	b=CyvcaHxbHW+134LWIn7HfJJo9tl5xrCsL7wgDaYKELHE823SlflObo2vTXinZfUoKY
	K9EJVGfrNl4RmmBihvWVhSuyDXYwrA3W+PoISsOd7cvmq0BnL19Mza+ucIJ7GKh4h1nK
	c1zYqtPOjLIeBHAEmKViQcfkxYsCYTkScEfTsUtVYEmHC+c/5vskWEFKc/j3GZsA763F
	zS5Z7yxF9b5vrUJMyGygPwXnzmn5RzI5z0WpRSGMIjONSfWRnUAlR9j+WeATyWSaFu3v
	vEZSUztuAUCVcOfKlOS3Ii2InOqp8yXZCp3unLxPY3f9Ab1xvRA/Bu3lZj6CbjNNX8Cn
	IkxQ==
X-Gm-Message-State: AOAM531BVEhxwOp3IMAbGWf9IUXmeo0nksHIM6RbFBJEf+/cavN8VkGW
	AsC4eT2w3+jgYw6DvqRhrs0DesZvnvsvk/AZOtJeJEY1cDHlex2ud1zFznYJI+u9m6Y0DU5vhBE
	tS8Os7KFqPw00s3Qn/UI=
X-Received: by 2002:ad4:5968:: with SMTP id eq8mr3808190qvb.80.1643303501910; 
	Thu, 27 Jan 2022 09:11:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztPCW/ls/HGsD9xe/WMaahh4UjrJsfEVpwqwRI5tHMnXcgyiZLuuvrhgvmY/MRUsNQeYYfvQ==
X-Received: by 2002:ad4:5968:: with SMTP id eq8mr3808154qvb.80.1643303501730; 
	Thu, 27 Jan 2022 09:11:41 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id w8sm119796qti.21.2022.01.27.09.11.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Jan 2022 09:11:41 -0800 (PST)
Date: Thu, 27 Jan 2022 12:11:40 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YfLSTPB7UUZKqQKL@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
	<20220124091107.642561-9-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-9-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.co>,
	dm-devel@redhat.com, "Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 08/19] dm-thin: use blkdev_issue_flush
 instead of open coding it
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

On Mon, Jan 24 2022 at  4:10P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> Use blkdev_issue_flush, which uses an on-stack bio instead of an
> opencoded version with a bio embedded into struct pool.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
