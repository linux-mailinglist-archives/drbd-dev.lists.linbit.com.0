Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFD44B90A5
	for <lists+drbd-dev@lfdr.de>; Wed, 16 Feb 2022 19:45:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 16F044205FC;
	Wed, 16 Feb 2022 19:45:16 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B6DA94201F0
	for <drbd-dev@lists.linbit.com>; Wed, 16 Feb 2022 19:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645037111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=OOx+E3QllfryzTFmIymhQ3ST1693x2OfbOWkWxjfBfw=;
	b=Oe+dcRFirPTE+pPlelh3ymMUBZofMfCtaLd0P/9+2oij9QbNKyeDaXcLYN5F9sMMiVsg1F
	vx8xT5qs3ib9/H22frsbmIMwClKong+MIyQw9xleHTLHhYgoxOqVnWHyjPRJCnbYEpp3uX
	eG43Daxjuc7cj/NgE68kjholOZWYzZs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-586-3eiqwvX9Ne61yzQMp9WOPw-1; Wed, 16 Feb 2022 13:45:10 -0500
X-MC-Unique: 3eiqwvX9Ne61yzQMp9WOPw-1
Received: by mail-qk1-f200.google.com with SMTP id
	q24-20020a05620a0c9800b0060d5d0b7a90so641474qki.11
	for <drbd-dev@lists.linbit.com>; Wed, 16 Feb 2022 10:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=OOx+E3QllfryzTFmIymhQ3ST1693x2OfbOWkWxjfBfw=;
	b=F38aTTX1PWGorPJc/oCxWeXrOAJ7krsQOUtSYCfFxuX6FEuIT0vD+3qj7QOkVYVIKe
	S/mIYdpSyJFMMl8mN5OFL+rFDNxAyPrdffwECDTnQrfjRXCNvHz73ypCh3ztDdG8Z9sp
	hIKMrZX/bf5ZHOsgeb0fa9xedICzjqBZD+E244uuBhONUkzrtp9+o8XTDqIUH5b13U1o
	HBgbTpCYanyfs6NPiVEdeCXh6SXegWJyC/pEwMFmXfVNQ7uqZykUsZWvTyiJERPb1s31
	pa7XGl3oQK26pXznf/K4EY3lMjeixikPM5HcMGX19phmkT3M+vJayISWQxGnPl/AWb20
	gyjA==
X-Gm-Message-State: AOAM5325MSHFButxT59BkaN5ARmBa/x0EZH9Ta2GbGdRQQ+QMdEShZtx
	6EyDnSGaNd5MDWtvotfiivkQ+6+Pm4U/2QpXKF8AypMPCI0jEB/AZvsrQ2PYoazKEjWE18lYUGz
	RuGZoZ4MjjR3zS8SLtgs=
X-Received: by 2002:a05:6214:21ed:b0:42c:11d1:70cd with SMTP id
	p13-20020a05621421ed00b0042c11d170cdmr2797937qvj.115.1645037110075;
	Wed, 16 Feb 2022 10:45:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJgOjhzSS8RxxVMNtzc6xG6mkVlUt//oPzsjAQ7SdjdxSfis7RMELX8WfonQ2JnnKXjLlDqw==
X-Received: by 2002:a05:6214:21ed:b0:42c:11d1:70cd with SMTP id
	p13-20020a05621421ed00b0042c11d170cdmr2797925qvj.115.1645037109867;
	Wed, 16 Feb 2022 10:45:09 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	i4sm20421081qkn.13.2022.02.16.10.45.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Feb 2022 10:45:09 -0800 (PST)
Date: Wed, 16 Feb 2022 13:45:08 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <Yg1GNMD6jIrKOxBE@redhat.com>
References: <20220209082828.2629273-1-hch@lst.de>
	<20220209082828.2629273-7-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220209082828.2629273-7-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: axboe@kernel.dk, manoj@linux.ibm.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, haris.iqbal@ionos.com,
	ukrishn@linux.ibm.com, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com, jinpu.wang@ionos.com, mrochs@linux.ibm.com
Subject: Re: [Drbd-dev] [PATCH 6/7] dm: remove write same support
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

On Wed, Feb 09 2022 at  3:28P -0500,
Christoph Hellwig <hch@lst.de> wrote:

> There are no more end-users of REQ_OP_WRITE_SAME left, so we can start
> deleting it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Thanks.

Reviewed-by: Mike Snitzer <snitzer@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
