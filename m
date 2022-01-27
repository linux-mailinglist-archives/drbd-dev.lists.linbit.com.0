Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FB749E86F
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 18:09:41 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 767CF42A590;
	Thu, 27 Jan 2022 18:09:41 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 00BCB4201BE
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 18:09:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=+dhUoO5mtU5C6v7W8MZ+6HMQJZitoVQcF/qB+IF1Jr0=;
	b=Gy8LmpFXxAOAGU7wRpJYDntrcuVCM/U9IaryiMmxjzahqE+OOGqUfNitsw1fmHcJ6nz+w4
	cki2C0YmkAod280gOQQRXPn2SMs0uiYX+AZTdh58R7eU9uHOdlYpRG2yid3l6SN89qdQDQ
	W3IziguawlapZVvthny9kdx9gifJfKk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-19-CkjxJhaVNy-cZHUoDJBtxg-1; Thu, 27 Jan 2022 12:09:38 -0500
X-MC-Unique: CkjxJhaVNy-cZHUoDJBtxg-1
Received: by mail-qk1-f197.google.com with SMTP id
	k190-20020a37a1c7000000b0047d8a74b130so2840851qke.10
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 09:09:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=+dhUoO5mtU5C6v7W8MZ+6HMQJZitoVQcF/qB+IF1Jr0=;
	b=a/bC3o2/JtX1E5TYRyLQHOcaf4XvHojhXXoisDJDGhLWur0ktSeVTiqpiZtwhM3YxM
	/giYjKvuRRhE4SqOyqB9L1LD1wd5IUVotA1RT8i+3WknmFCY2oHqSw1eT40RUyPqf+Jm
	i2N/7APyXUXhamHDryxu4P0MfiDM+OHs36uadYoT3EdaitSX6bwy8b7N0g54eidQzDTq
	w7VTg/rvRC9i5x63D3No1v0i/EVAwEHV1/7PdDMVUcRlmg0BFE7LNcX0Tpxurl2yjKaU
	WGIAfsFphZoFNRIlN+prXiLs6xzhKKmTsvU15K7GelZVpCcCJIytl2JsAiH6+PuUvCuL
	iFUA==
X-Gm-Message-State: AOAM533D/dA7dLdRp5W2dxbGlEZ09TZGu7u5Cni9DhGXWPk8XWlhNxHK
	3IIGmrKAyoMyOUrrfgCnfCGNeTZH1sUsAdPBeqiRpQydroLf7jTRvvimwXfolh0t1TxFMIXbU2m
	AEZd+3HW6OW/6QQX5czY=
X-Received: by 2002:a05:620a:1671:: with SMTP id
	d17mr3422687qko.683.1643303377469; 
	Thu, 27 Jan 2022 09:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyie4bqi26jfgNY8Cjw+Pn5xYBOKV6NvnkIoBYF0/ZaizWWrCUD9ZTrfOlIA4zvFGF0i2/RFw==
X-Received: by 2002:a05:620a:1671:: with SMTP id
	d17mr3422658qko.683.1643303377286; 
	Thu, 27 Jan 2022 09:09:37 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id i8sm1628636qti.52.2022.01.27.09.09.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Jan 2022 09:09:36 -0800 (PST)
Date: Thu, 27 Jan 2022 12:09:36 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YfLR0DPcDOYO65Hp@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
	<20220124091107.642561-7-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-7-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 06/19] dm-crypt: remove clone_init
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

> Just open code it next to the bio allocations, which saves a few lines
> of code, prepares for future changes and allows to remove the duplicate
> bi_opf assignment for the bio_clone_fast case in kcryptd_io_read.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
