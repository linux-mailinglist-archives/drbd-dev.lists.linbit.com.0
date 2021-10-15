Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BAB42F967
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 18:58:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 63194421083;
	Fri, 15 Oct 2021 18:58:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D6B8D42106D
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 18:58:08 +0200 (CEST)
Received: by mail-pf1-f179.google.com with SMTP id m26so8881214pff.3
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=D4ik1Lt2fUu7rVQyF8CllyYkKQv1Uz9xzDA6N8pwEt0=;
	b=Wa0EACpWQ8IomuSobKiAJDXNIo9H/HSTHk3bhesUYAYHCsUAKK+Bjrkw13ye1TxZcf
	TuQa8RCxeCC8IVmjTZdx5iQYLmOHoIRbNEFY9PFnqm6LcjTjI/8URYdBHdOJCis8Hcgz
	7OkB4Z6yrhdMDXf4pPYVZP18IZMykjhm0o16E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=D4ik1Lt2fUu7rVQyF8CllyYkKQv1Uz9xzDA6N8pwEt0=;
	b=EPsUHG7Rcxy15XYHo+/mQ0S3hzs7VjnY0nSpcKHAvt7nhWxfi7zCb6/EUaUJfOy5bh
	YQ6ZfDpDBGPdw8T3G2n0MWFMaVPnboIeLlu7jW6iKucdLueBPLtSfPM0xw5knC8ficRx
	n2ObGlPasAXCG4/WCAURqeCeLUx6ejAX1vMirnUb/2wiUEAQCurBbdoyZt9UE6rUO3wY
	4NwwYkeD26QsIKK71yn7eLHpUmy/5NQ5q5SheUMkl1dDMFjfcXxUbMqKyvkRB6gQkHDX
	3+K1puiwriWI5UwzXEJU2RLwUcjlbULQDMIFoNJ8dhpckrkWul267cUBXCMWr2gWloEE
	6osg==
X-Gm-Message-State: AOAM531lF0OMES7+9lDgO31xMQ0KwkP5WzJQvea/8qSzRCLhB9wQfTgP
	kjlMIK/bBK4vG5ffFmWFegpkEQ==
X-Google-Smtp-Source: ABdhPJwjs+d5iHomMRfB84u/9uN/BXfrv3rJikQOTGFeQP4iBMjOf7nvTwY+G4DJFOV8bNrfnz+CuA==
X-Received: by 2002:a63:4766:: with SMTP id w38mr10056849pgk.104.1634317087874;
	Fri, 15 Oct 2021 09:58:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id e1sm5367341pgi.43.2021.10.15.09.58.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Oct 2021 09:58:07 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:58:06 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <202110150957.44EE74B5@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-26-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015132643.1621913-26-hch@lst.de>
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
Subject: Re: [Drbd-dev] [PATCH 25/30] block: add a sb_bdev_nr_blocks helper
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

On Fri, Oct 15, 2021 at 03:26:38PM +0200, Christoph Hellwig wrote:
> Add a helper to return the size of sb->s_bdev in sb->s_blocksize_bits
> based unites.  Note that SECTOR_SHIFT has to be open coded due to
> include dependency issues for now, but I have a plan to sort that out
> eventually.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

You can adjust this changelog to remove the note about SECTOR_SHIFT
now. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
