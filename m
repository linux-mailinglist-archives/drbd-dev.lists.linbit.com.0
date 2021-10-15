Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C01DD42F92D
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 18:56:50 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A4517421079;
	Fri, 15 Oct 2021 18:56:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9FD4942106F
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 18:56:49 +0200 (CEST)
Received: by mail-pl1-f179.google.com with SMTP id i5so523406pla.5
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 09:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=vfh8ldDPWodO2+NAKgs+77i4cirGVTrsvlhR7sq6n14=;
	b=MF0yf140gbDAdW4BxnOXdsQIbZ1Zs20bgZWJgGQJccJRdMKWf0Z7qJMeg/xUZ/rSs6
	VG3QCkdC2Gak2gGrkvLjpOyqG7g5cIFwioohIVF4DnPVlIrbB81BnizHen6OonQjrvMj
	EAa7kecUI8Ha/nnI/LS4mNOBQr2yiVBjBbg4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=vfh8ldDPWodO2+NAKgs+77i4cirGVTrsvlhR7sq6n14=;
	b=wmS6CU6NvapL0Pgz8fW9QViBp4IwGuEy3emv8SJ6Imow5eZAo2ZPWT4jt3RWhp903q
	xjtbByWDdhQe157Z9ruIEvTN62QyS5Lr7f3ODZeGgzHHkYwmRSJLbkIq314xn+cp5/0t
	b8Xgome4LLUfsXxH6cfCyPogfTDN+aw6dnkrL7houUBym/rQOG7EPKmreAGDMsX8aRkg
	XJ8A7x79m6f5l68ZknQkzn5kEtmMhtO/tt+P+VJn8l5M3flyOpPALH7K6WWoH9PlSlbV
	V3wwxduqEnGAN73XndkAk2f2v/iPqwp7Amp7DHRR5Rx8dtbKpPI5h0y/sh5mJZFhjPfM
	bcUw==
X-Gm-Message-State: AOAM5301pE7pinJ0ZWP/F8kdxJdu0HruWdFJ/ZqMBPFGe9nV8MyCYVsX
	jbFyLmr10WcFnDSfoD/NaD0S8g==
X-Google-Smtp-Source: ABdhPJwnnQ3ulrXVGFg4s+UA3ddGM8HwmAEnk5XYfNq6HtGw+i5b3OvChqf29ta/Idk60aluKwm2lg==
X-Received: by 2002:a17:903:18d:b0:13e:f1ef:d80c with SMTP id
	z13-20020a170903018d00b0013ef1efd80cmr11974419plg.63.1634317008672;
	Fri, 15 Oct 2021 09:56:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	t125sm5518370pfc.119.2021.10.15.09.56.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Oct 2021 09:56:48 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:56:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110150956.A0360E2D01@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-23-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-23-hch@lst.de>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 22/30] reiserfs: use bdev_nr_bytes instead of
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

On Fri, Oct 15, 2021 at 03:26:35PM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size and remove two
> cargo culted checks that can't be false.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
