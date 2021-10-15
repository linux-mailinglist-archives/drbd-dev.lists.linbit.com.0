Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 558E442F91B
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 18:55:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3344B421071;
	Fri, 15 Oct 2021 18:55:26 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
	[209.85.215.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3B60C42106D
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 18:54:56 +0200 (CEST)
Received: by mail-pg1-f169.google.com with SMTP id e7so9141272pgk.2
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 09:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=SGOpzYQsZVxiJYbDiHH5De0/7WPNstxhmFZjyDhxXSM=;
	b=fs2nTqRo7F1ZHnAQpHrc4ABoCfv10ucgSRl5XyF5Dl0EU+kq5CLj40RrhqmGKfYBdE
	srWd8WSfQrAgtx4IytED1edJOCHp8619TxpM3AEsBF+FDwK3nXgnkT7wtVpp+hLrbcJ8
	Rg3NqIIsXlTg4ynBFyVvaBOq2w7XptVlu38kk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=SGOpzYQsZVxiJYbDiHH5De0/7WPNstxhmFZjyDhxXSM=;
	b=5wzXt++29/dJb/45aOnL9RCDOvdK0wuYM88dTe/cPlOpxqJwW0neNXRtUM07uxrpnD
	tevOYT4RWjjIi/fBJqbT9daxatq+3acvN6FzJHSL0sghA2VGtZaFgAlFh1GXe0M8ttEK
	AVF9X0xdaRGdcWenKwudWmd+MrvSog16Olz6MRN/HV36EwouNMsdewQ4G8NlowIej/p0
	VE/o6R4VQFR+w3pLIJP7R7wOgr5vEJmSGpkmHGS+cC5X+OEXn/GVl50c9t3bLbbkAEPf
	VrFO8ZTgZfbxa3XuY94mxRvR14uREkoCCxMLgl0kcIZJDNO6s8+7FtYKl/NmOoGeQaa3
	SOgQ==
X-Gm-Message-State: AOAM531iy8gFeOGHV2W4wJ7k9OxHveZDdoiscuWIPKogCVitHCY6ynko
	NLWN42XM4S8aqT6FBg4V0v02GA==
X-Google-Smtp-Source: ABdhPJyWeQQaxN3OVR9dpjDI7bcixMoFds0uTAEJpzN0+vwQj4qrWqnY4m/W/UbgYRyhJ3miirXMyQ==
X-Received: by 2002:a62:1596:0:b0:44c:f7b3:df74 with SMTP id
	144-20020a621596000000b0044cf7b3df74mr12889236pfv.60.1634316896184;
	Fri, 15 Oct 2021 09:54:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	h3sm6042497pfv.166.2021.10.15.09.54.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Oct 2021 09:54:55 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:54:55 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110150954.FE37F8CF00@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-21-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-21-hch@lst.de>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
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
Subject: Re: [Drbd-dev] [PATCH 20/30] ntfs3: use bdev_nr_bytes instead of
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

On Fri, Oct 15, 2021 at 03:26:33PM +0200, Christoph Hellwig wrote:
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
