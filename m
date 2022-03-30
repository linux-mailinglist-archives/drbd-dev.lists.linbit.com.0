Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 324984ECB80
	for <lists+drbd-dev@lfdr.de>; Wed, 30 Mar 2022 20:13:07 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 197764205F5;
	Wed, 30 Mar 2022 20:13:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 302 seconds by postgrey-1.31 at mail19;
	Wed, 30 Mar 2022 20:13:04 CEST
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A1D64202BA
	for <drbd-dev@lists.linbit.com>; Wed, 30 Mar 2022 20:13:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648663983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=uWSt8FFFTI4rhck3dPnwbJuLsSit8PUXxQiArFyosm8=;
	b=T/gt+m+MHGOb3YLOI+b2E/N9+fA8BTno/A6clmPZCCQZs0PaZS4JuXxNUJfGCEV1p+qC1t
	Nw8ZS7kyGQCjd+fyiWLtKtyQBZxIcjbqaXnRL3i7dhlwBjkz22NlC87UInxj8Kll23Fzuv
	OTZ2y/rFQKQt2/64vfGTuIj93B1rgMs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
	[209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-31-lY4NXrr6NL-5bhBLqMeOuQ-1; Wed, 30 Mar 2022 14:06:27 -0400
X-MC-Unique: lY4NXrr6NL-5bhBLqMeOuQ-1
Received: by mail-qv1-f71.google.com with SMTP id
	x6-20020ad44626000000b0044119c7bf4aso16629853qvv.12
	for <drbd-dev@lists.linbit.com>; Wed, 30 Mar 2022 11:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=uWSt8FFFTI4rhck3dPnwbJuLsSit8PUXxQiArFyosm8=;
	b=VDSV+WdrYv6ld947TjJkE5HqYyjPF6j6Gl8pGz666Lgj0rUnoSOS0fo9bhiQVmD0Cf
	tcHlOX8YJprL5ANPc3n7IvsrlsTtnAW4fY6BY4d8E5nfuEZwJB3j9bHYq0UkAnhL8k7H
	BbQLKQZYGKDF3SIw6tUpIw4XEoXUgBFqsK2eW/dXNU1Ezlgp7uFWA0AYm7EMiMA2o4R/
	lb6FcMSAG1IlETT2miSWbhk874pTxRZ9QsamxaXwEzNM88mofAyE5oI3wu387iHLqQ6o
	2hUIyxrbC4uN0zrlf/ZuBrbGu7tGc69Xd7WE+CQlOclw/b9Iu3sV+/QC6D/3iG+8NqEe
	1Dkw==
X-Gm-Message-State: AOAM533+71iyg1NLwZopujlK80oC5NMtNTLRxz3D1uFQsolP6rOuMgPd
	n5sYUxcbBhUmXNHFLFnJOzBJe33J81lTECMeFf0knZTX9vzhApwT/griVSKFj4upbxiGnqv8nts
	BKKR60eUqYZ1rdJFKZC8=
X-Received: by 2002:ad4:5be3:0:b0:441:7bd1:29bd with SMTP id
	k3-20020ad45be3000000b004417bd129bdmr733380qvc.14.1648663586924;
	Wed, 30 Mar 2022 11:06:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkima55vXfIXB4/YhL8vxRAGITI8NXaa0gII7X9gZDBJaWlIZfDnbZH36cgG+Ixq8NEncA6A==
X-Received: by 2002:ad4:5be3:0:b0:441:7bd1:29bd with SMTP id
	k3-20020ad45be3000000b004417bd129bdmr733356qvc.14.1648663586730;
	Wed, 30 Mar 2022 11:06:26 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	u20-20020a05620a455400b0067ec0628661sm12639056qkp.110.2022.03.30.11.06.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 30 Mar 2022 11:06:26 -0700 (PDT)
Date: Wed, 30 Mar 2022 14:06:25 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Philipp Reisner <philipp.reisner@linbit.com>
Message-ID: <YkScIas+/Ev0trcZ@redhat.com>
References: <20220329070618.GA20396@lst.de>
	<CADGDV=UgjZAbmAN-2bO1nyDvA=XCC9Lf2dxWHZ0BwxF12nnztQ@mail.gmail.com>
	<20220329073254.GA20691@lst.de>
	<CADGDV=U5jwe0CZ12174cMahfD_h-GsBswWaA1VOJbHaC1nsrUw@mail.gmail.com>
	<f9d89282-3a67-ad97-149f-52325e23607c@kernel.dk>
	<CADGDV=WN2TFR6dO7ZdiQ2ijPjs+7HSsvk0ZCHsHj6ZG5t-oEdA@mail.gmail.com>
	<3c42b1ed-7c03-64e6-409e-e92247288cac@kernel.dk>
	<CADGDV=WcTSSC70yG61dazo-WyoLOzp3r+nOk-Eg2x_Ncx=3nRg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADGDV=WcTSSC70yG61dazo-WyoLOzp3r+nOk-Eg2x_Ncx=3nRg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] state of drbd in mainline
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

On Wed, Mar 30 2022 at 11:23P -0400,
Philipp Reisner <philipp.reisner@linbit.com> wrote:

> > > Jens, my intention is to keep it in-tree, and at some point update it.
> > > Regarding your questions:
> >
> > That'd be great, but it's been years since there was any significant
> > updates to the in-kernel drbd... I would strongly suggest that the
> > in-kernel be brought closer to what people are mostly running, as it
> > stands it's basically unmaintained.
> 
> The changes we worked on over many Years in the more recent drbd-9.x
> branches are just too fundamental to do them in small chunks, we could
> upstream bit by bit.  We need to get that reviewed in a big series.  If I
> started to dump them on linux-block right away, nobody would look at it
> seriously, since it would be too much.  I intend to get people from red
> hat/suse assigned to do such a review. Then we will do that on linux-block,
> so that everyone who cares sees what happens.

Why do you think Red Hat, SUSE or any other distro vendor's engineers
should be made to review what amounts to be a massive dump of changes
you developed over years?

Presummably you have heard of "upstream first"!?  Why do you think it
doesn't apply to drbd?

It'd be one thing if drbd never went upstream but _it did_.  As is
your development model is completely wrong.

Mike

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
