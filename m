Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD3742B6CF
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:16:45 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 69379420FF5;
	Wed, 13 Oct 2021 08:16:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 32144420FED
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:16:35 +0200 (CEST)
Received: by mail-pl1-f173.google.com with SMTP id t11so1076775plq.11
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=yoKDGyU1IKw4WZcPglkL9qCJyXlf9awotx8P2PTzBWs=;
	b=CfsfnomPleYW4GBsBhk8H6G76FqS7CJ1hCWsqRQNWdP3gBxNE2zoVJGIUrEHECfVKa
	v2cK96TEo8Mw5Ik4Y/ADCAfA/3y7sebWHT8J/KK4oeu3vgk08FAOGIJ4+lA7q9hiMA29
	r2H7qpegYylGn4mcpKE0+qgwtq9QgI8dolIgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=yoKDGyU1IKw4WZcPglkL9qCJyXlf9awotx8P2PTzBWs=;
	b=0aqr03+bcrbOxMQG+7+GQewgRYc2/99L5a6SmjsYw1+u2MgWb2b9J0+hUwfuS/GGHH
	qhN3rgwOLE1Q50hXPwVbFEipTDnKl5i+tXYtRb7kwQeex+zsLqHzWYMTdMXajVJ0QD8G
	LIDrvXOZz+pLOt7j/N2OaixWfVo9DSHUfSVr3Cu42b6YOMJEdwi1q6cGphwlBWzam3F7
	UeklW8ae/o3CQujoKpuAJfp/pGxAhTKOwBVBs8/tv25H7zCarEzXmLMv0spVvZmbxYcg
	3asCErprd5Py0/dpz1zsc9zjAiWKEfk5W8247KJFFivPUtxc3aLxUC9XBNQk4MgOex1L
	VQvQ==
X-Gm-Message-State: AOAM530/UkocznRV04ivKa75aydcAnONo0RJX6XXDgQU8GAaxli/PY2A
	p2qo4dqHODkYJRMZ3+N+RIxlCw==
X-Google-Smtp-Source: ABdhPJxLGyOml5lqe+K0AfHsTHYJz8Z1ysoHhzc/2/LGB5MqaATX0lTpa7QxWtRvvD8zMko7cBuZVA==
X-Received: by 2002:a17:90b:3850:: with SMTP id
	nl16mr11065306pjb.127.1634105795098; 
	Tue, 12 Oct 2021 23:16:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	c11sm4509497pji.38.2021.10.12.23.16.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:16:34 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:16:34 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122316.8ED0742@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-14-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-14-hch@lst.de>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	reiserfs-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
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
Subject: Re: [Drbd-dev] [PATCH 13/29] fat: use bdev_nr_sectors instead of
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

On Wed, Oct 13, 2021 at 07:10:26AM +0200, Christoph Hellwig wrote:
> Use the proper helper to read the block device size.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
