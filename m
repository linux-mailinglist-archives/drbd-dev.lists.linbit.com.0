Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DE442B662
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:09:23 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 680C6420FE4;
	Wed, 13 Oct 2021 08:09:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 89651420FD6
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:09:20 +0200 (CEST)
Received: by mail-pf1-f169.google.com with SMTP id c29so1531860pfp.2
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=Qqwh23O6V/63P0yRnTO77bOtLRcytQL2fAyeRI5kB34=;
	b=CXM9rJHHK73rEQgm0mgdKmXS/wAofOl4OFPnwKac/DX3XFO3SZF+VUOO6mlfTZkIDy
	UTW+b9/6/6WoMA5ZI2y3esBG93Aw5k00FZrNw4PEm0iPy6yRGylzqCSKEzZCYiYZiEa0
	Gvi4MQ98yBAEGpxPU0vceWRTRPKnOulu8VFrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Qqwh23O6V/63P0yRnTO77bOtLRcytQL2fAyeRI5kB34=;
	b=khxjbzSVaPsBh86jnFjfo1WYOMQr5NvEroN3WMQrmDgabK8MtBwFgi1gjXNoloYG8I
	aNilIfFiZCaLZMifV7gLpiUdZ6H33Dq6ZUV05jMYn/08tyPu6dDrGtM025vie5CdghPt
	gedR1qqub7OSjmAlXUt6E2+Uann+p80PU9kJy7ghgOVWwMcvTOO7u1SynJRiZHOKL7uH
	WayJO46VhA0SBlF6mo/q80oiXD8dQC3MeEPwMWReYUcYLo+eSDLlPfZd10VukCiyUVvK
	pbnQNxSw/SEwP4QMY4FXWusDFNVWsARDSIr/k3dDRF0iBO1tmoUDOutvvqhnQ89tc0Ja
	Jpyw==
X-Gm-Message-State: AOAM530ogTAQ1amwc3ezONwgeJuIGOOrdRCqEnA88JJ4GNRZrC3CWvhs
	x22J102VDogaYOi6ych9o52HRg==
X-Google-Smtp-Source: ABdhPJzPVB6suksbrVxsW8arxDgbrt+zmZKpBhbvkmkjyXI+mBKX9gJNh2h2afCA7c0GFA7FKUgXzA==
X-Received: by 2002:a63:d40a:: with SMTP id a10mr26426089pgh.7.1634105359458; 
	Tue, 12 Oct 2021 23:09:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	e6sm12787858pfm.212.2021.10.12.23.09.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:09:18 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:09:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122309.010F81F49A@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-2-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 01/29] bcache: remove bdev_sectors
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

On Wed, Oct 13, 2021 at 07:10:14AM +0200, Christoph Hellwig wrote:
> Use the equivalent block layer helper instead.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
