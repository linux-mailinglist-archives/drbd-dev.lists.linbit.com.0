Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEE242B766
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 08:33:38 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A090A420FFE;
	Wed, 13 Oct 2021 08:33:38 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
	[209.85.216.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 18366420FFC
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 08:33:22 +0200 (CEST)
Received: by mail-pj1-f47.google.com with SMTP id
	oa12-20020a17090b1bcc00b0019f715462a8so1447717pjb.3
	for <drbd-dev@lists.linbit.com>; Tue, 12 Oct 2021 23:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=KN0hCxg4qCtDzIgJk5dwSpisgOtLaF48lTZLQMzdZGQ=;
	b=ZSgj9MSpSxiaNFjR5pl+MhsOPNs6TAo40lkstJ1+NMBhxL+4AoJC++ueHgXgDZsxkL
	A4rqeGya73qL9mbxIoCLhchn4/FA1cf285nRCQSnbarbdqSIQhxR7IZtW3h248WE8YVx
	CokTYsr+EOLC9mMcAUh/RiJhbXXJcMY50cpmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=KN0hCxg4qCtDzIgJk5dwSpisgOtLaF48lTZLQMzdZGQ=;
	b=tDgfFY9pUNBqNf66hulYxKkWEl5LNqZmpsIz6pAj8bXXejH3eRk4MaUMmTw8IOu9N6
	pDTomhwUyFsnBjVWrSGymvtJE9iLG2L/Z0RTvkTNxTjiG+o9WwBbLpvT26zgMd5BL79m
	PzJyuhsXDfg0bVpKV+vRzfUPfHNFST1RLODVBLCGCVGPf3oLaf1MyFmOc3nsyOu5dNAQ
	vo6FzCdgT8ni6AGWihV7PW1HT7eTzAb/8xE01ycvk82GWpOCZw+8NdMifkVAW9kzX+F6
	z7xG4HD078FNh0Ho6L94y+zJI/TByIgrHj64oOlujnhwmxUrDGaWyWdePnjwKhsIxAEE
	KB3A==
X-Gm-Message-State: AOAM533GqUz+eIJsCQfVhCukH8gjdyCNbNeGr2hpjyS1rPf0ttj7OlhU
	B6X8Wr6RPHQbqPAVMthsudbfgQ==
X-Google-Smtp-Source: ABdhPJwSbdMnxpZNPs6DEcJzD+WCYFHCQcM73CXxNLIwDuWek8lOvAv7bQAbdyDz750VOQBh4gVb4A==
X-Received: by 2002:a17:902:e5d2:b0:13f:21c1:b44f with SMTP id
	u18-20020a170902e5d200b0013f21c1b44fmr23591611plf.30.1634106800893;
	Tue, 12 Oct 2021 23:33:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	s8sm8887899pfh.186.2021.10.12.23.33.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 Oct 2021 23:33:20 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:33:19 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110122333.7CE920EB9@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-29-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013051042.1065752-29-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 28/29] reiserfs: use sb_bdev_nr_blocks
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

On Wed, Oct 13, 2021 at 07:10:41AM +0200, Christoph Hellwig wrote:
> Use the sb_bdev_nr_blocks helper instead of open coding it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
