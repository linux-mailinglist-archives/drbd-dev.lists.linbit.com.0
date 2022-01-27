Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBBE49E884
	for <lists+drbd-dev@lfdr.de>; Thu, 27 Jan 2022 18:11:11 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BBAC542A594;
	Thu, 27 Jan 2022 18:11:11 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1092 seconds by postgrey-1.31 at mail19;
	Thu, 27 Jan 2022 18:11:10 CET
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0AC7F42A590
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 18:11:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643303469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=hISkPgWXBvxaPJR1A6cjvL239jVaZB/M99kE10NpdT4=;
	b=T+O7ZF/7JwGOGUIvTZg6eaQYi/o72n7QCPHbJSfgPmX6HDEXWnmZUPSVEdm8lDarNlmoJQ
	GhtzkmbItddRzZOso6KBieqZ7OBdv9/4kj0uaa5kTqtOwbux3JqkjCuyDbpdZkqKk5FAVM
	VrNTQbAElD3bR/3I/u1QNS555vRbMQw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
	[209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-472-3HytFbnKPKCW_LPsFCpqMA-1; Thu, 27 Jan 2022 12:11:08 -0500
X-MC-Unique: 3HytFbnKPKCW_LPsFCpqMA-1
Received: by mail-qk1-f200.google.com with SMTP id
	q5-20020a05620a0d8500b004738c1b48beso2845230qkl.7
	for <drbd-dev@lists.linbit.com>; Thu, 27 Jan 2022 09:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=hISkPgWXBvxaPJR1A6cjvL239jVaZB/M99kE10NpdT4=;
	b=HxjMrGtKUZ2RETuFEI039qFEqAzY6yyGzMW7MOlijp9Ra3QEi1n3fjKqyat8wmrYfy
	9v6tIxpI3Zevmc2WRlAR7oBDlmKP+exq4cO5BZucwODXQswWku8JjTbmiLq5ZWNM8aZk
	lBq+9yAT+Fq8IDb1JVVnRitIyLmzPa6oQGmHjqi+rWFyZb0jawHVKHnvlP3J824YCawW
	89EPY7iz9aDv6k+7fmFXGsFDyNPOrO2kxlQIKGyECUrT+Hy3wLPI/9anFyg+MbV3m8Vg
	meztU8P3omxvu1NfwMIzsi+eSjGuMOZrOYI4WqRWiNAGX3PhkrlgQgcVJcH3ca8h/sCS
	y2uA==
X-Gm-Message-State: AOAM531ykAlFsSMTkT9kJ7H4mBrCL/37GaPbePNpm07vt9Qgk0Di2amv
	8Aaib3m3vQz4hJ4lsVFVUSuO69szJse2nW/ir6ZiBxyIVhELO2vwXuOiSMmasYkrRMNI5WscWYQ
	e83M0EBhzsWrALYEH4ak=
X-Received: by 2002:a05:6214:c2a:: with SMTP id
	a10mr4419660qvd.42.1643303467585; 
	Thu, 27 Jan 2022 09:11:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQanMj7Y00ur/yzuLmY8gwfKPDXJeoixdwOU4KzNAVApl7lAtazZ8/rD9LIFjZrTulwd1nlg==
X-Received: by 2002:a05:6214:c2a:: with SMTP id
	a10mr4419637qvd.42.1643303467335; 
	Thu, 27 Jan 2022 09:11:07 -0800 (PST)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52])
	by smtp.gmail.com with ESMTPSA id h6sm1661870qtx.43.2022.01.27.09.11.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Jan 2022 09:11:06 -0800 (PST)
Date: Thu, 27 Jan 2022 12:11:06 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YfLSKlF89y3Cbf+S@redhat.com>
References: <20220124091107.642561-1-hch@lst.de>
	<20220124091107.642561-8-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20220124091107.642561-8-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 07/19] dm-snap: use blkdev_issue_flush
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
> opencoded version with a bio embedded into struct dm_snapshot.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
