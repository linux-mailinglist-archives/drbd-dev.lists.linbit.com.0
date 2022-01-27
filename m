Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B63B49E864
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 18:09:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 34C8742A58F;
	Thu, 27 Jan 2022 18:09:02 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DAE6C4201BE
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 18:09:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=kAV23rTMcuty4CJFZ8o8ysOxnvRFj2DI1yB1mT746og=;
	b=QU+UARpVft1TH4Ycj9CFqX254OOzM8EVrl3ZtSl6Dm32JTefsVBZbhy/HPfFFespA+mbTR
	N92inGTPutQzpsDrmtG8FbGj739lvdaM7u5zo/Los13xUSThaZNJ09o4q0S2CfBUaczQ+J
	pX2caUc1wui+XiRXE/spsU6KvZ7L4xc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-541-uytTuDC7MF6Lt3zcXP7dmg-1; Thu, 27 Jan 2022 12:08:58 -0500
X-MC-Unique: uytTuDC7MF6Lt3zcXP7dmg-1
Received: by mail-qk1-f197.google.com with SMTP id
	q5-20020a05620a0d8500b004738c1b48beso2838965qkl.7
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 09:08:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=kAV23rTMcuty4CJFZ8o8ysOxnvRFj2DI1yB1mT746og=;
	b=pDIzBWoLLry9veK52QpJ2ytPViX2sXftcqLms5WokobN+llxI7rCPMloCJSQrhkIgF
	qxXEDtbIlGssSWZKHISnmBJIjP1qkNXhUeyGVsMQvKrwnFYEA755rW40hm+AdOWdyVlp
	WmVVqTAFHkoM0DyVp25drlW+T/uJtSapA+Khy4uEoA9dpIRrpMzLt3D8UUsqYNmfMv+f
	wi8WJKesDahLaTL2bqYRIHFX0EB9zAUaPjmlVLOBcX6mEeX1Y/yrBGFXzXU290Th2Cp9
	i6FP4MhIcJx8lfvv0+boUXIlBUoMJcjAlqYXmRbQD2PM4Nd3KXY3WlPbjRCcvTol689Z
	DkUw==
X-Gm-Message-State: AOAM533PegZ78h2u/QcyI9Y0K6weBDV7WMOZWeC8G/XVdg60smrD4ZTS
	dLhCJWOAUnWWKnkKUu1PIF+mmYTFrv2yDMOunouLNvp/DBe7UbK1tDhWvNZx01YMfkqJ3c7amwI
	lfoPutn2Z8g24x9G3hyI=
X-Received: by 2002:ac8:44c9:: with SMTP id b9mr3555327qto.524.1643303338470; 
	Thu, 27 Jan 2022 09:08:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDu0k2yM0Z7B8jNmnNXJFkDazruS7TZzFMNaHKbWmY0JBs9tIC0IfQuLij5Gmty6LtXXG+Yw==
X-Received: by 2002:ac8:44c9:: with SMTP id b9mr3555294qto.524.1643303338263; 
	Thu, 27 Jan 2022 09:08:58 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	a141sm1694826qkc.73.2022.01.27.09.08.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Jan 2022 09:08:57 -0800 (PST)
Date: Thu, 27 Jan 2022 12:08:56 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YfLRqCMAhLH8xhDD@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
	<20220124091107.642561-6-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-6-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 05/19] dm: bio_alloc can't fail if it is
	allowed to sleep
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

> Remove handling of NULL returns from sleeping bio_alloc calls given that
> those can't fail.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
