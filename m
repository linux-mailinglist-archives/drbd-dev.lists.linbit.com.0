Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB8D42C6B5
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 18:49:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 95BFA421002;
	Wed, 13 Oct 2021 18:49:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 367 seconds by postgrey-1.31 at mail19;
	Wed, 13 Oct 2021 18:49:23 CEST
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 58FFB420FF4
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 18:49:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634143762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=DvE9A+LL2XADoLsMv/QT6HGglilUC7cXAXtJNsfa8lA=;
	b=eu5v7fHAQ7weGHtFmCi/WDyDV/xOaxOEgIGcFvPOPhNOoJi8xRtBHsEKepsVtPazK44OxY
	KaWnbTbvNrBVKd72t5FQKk7DSPBw802h5QzoinGn9Mlv5hxC3vMd3WpUjVi5zPOoPCgogw
	PpURz8fe3Tj0xaK05ouFcOzFK9Xo1m8=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-220-GxPoESTsMpmvQzBRj-0clA-1; Wed, 13 Oct 2021 12:43:14 -0400
X-MC-Unique: GxPoESTsMpmvQzBRj-0clA-1
Received: by mail-qt1-f197.google.com with SMTP id
	t9-20020a05622a180900b002a71f83a1cdso2478259qtc.17
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 09:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=DvE9A+LL2XADoLsMv/QT6HGglilUC7cXAXtJNsfa8lA=;
	b=Giix1oIKMzmPAsfzlEzBpNkCQsH585R6vjr6C2HDHccGzZrSMZdqvKBKXSLHWVv25k
	X7+kEF83T3OnJ1/BH83l7H3Z2Jrg0fFtIBMCr+qEo7bH4R4CNNcv45JM0LvFe95uvALq
	16V55PYcpjfhcglNllflR9CPKJCyAe1DqBi+mQUeGDGGRxIgtRsYkrX3f+aZarMbgcLc
	EOuSh9GgbSWB0XgMWUo1Lr7KOl1cqcmwnmcmeWadRXIJqMCd6zVvxujIx+9SWF3qbF84
	extsgyutHmU67sCWpS5nug9hNy0FwPinS9gX1yVTzs+QkSc2oSWWQQKsK4ZUiLO4X3J4
	BjQA==
X-Gm-Message-State: AOAM531q0g6WEIK01QgjAlXHq8G+IhnyT58O3rDCQ3U5lu6Fan8qebCZ
	PeHJhiV3dsbafmcRRZU3mRwfDtKcxjHm57yr2fnB6XtzKZx4VdBrOlJZqaagQb2+fOoATJFW3F0
	YDZFJ6MthXOktQGwEbxk=
X-Received: by 2002:ac8:7d02:: with SMTP id g2mr450206qtb.66.1634143393829;
	Wed, 13 Oct 2021 09:43:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4uQGBl82DdkygPL4oygkwPDtljuRYBV8+ESqW4tKnOahM7pZ+SYljUTQ3BKpa4FdVi33PjA==
X-Received: by 2002:ac8:7d02:: with SMTP id g2mr450159qtb.66.1634143393507;
	Wed, 13 Oct 2021 09:43:13 -0700 (PDT)
Received: from localhost ([45.130.83.141])
	by smtp.gmail.com with ESMTPSA id q14sm77870qtl.73.2021.10.13.09.43.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Oct 2021 09:43:13 -0700 (PDT)
Date: Wed, 13 Oct 2021 12:43:12 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <YWcMoCZxfpUzKZQ+@redhat.com>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-4-hch@lst.de>
MIME-Version: 1.0
In-Reply-To: <20211013051042.1065752-4-hch@lst.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=snitzer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, reiserfs-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 03/29] dm: use bdev_nr_sectors instead of
	open coding it
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

On Wed, Oct 13 2021 at  1:10P -0400,
Christoph Hellwig <hch@lst.de> wrote:

> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Mike Snitzer <snitzer@redhat.com>

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
