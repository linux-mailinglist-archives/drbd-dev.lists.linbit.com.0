Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EC942DDCF
	for <lists+drbd-dev@lfdr.de>; Thu, 14 Oct 2021 17:14:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87530420FE5;
	Thu, 14 Oct 2021 17:14:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E1B5F420FDA
	for <drbd-dev@lists.linbit.com>; Thu, 14 Oct 2021 17:14:33 +0200 (CEST)
Received: by mail-pl1-f182.google.com with SMTP id n11so4400757plf.4
	for <drbd-dev@lists.linbit.com>; Thu, 14 Oct 2021 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=kk58q1N6iOKJV9MmXM4g94KiVUwgBacQdDgb8dq+Hqc=;
	b=mlZB9Nj4m8jk1JFv+iCH7Znrwanh3CDPQczVzomtmeQ5BLbFN1inwmhXkfQwL1sdEQ
	hih7m3SNinxkOxv1CMzByR9lFDUUB4oAxo3E3cDYo/S67L6xZfuz5zRsWVJKP1+73Scy
	QCwjhJQjGzKf7SNt+QV8U3nYErgEHf4yODN/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=kk58q1N6iOKJV9MmXM4g94KiVUwgBacQdDgb8dq+Hqc=;
	b=2IfJ/hA3z15EXQWVAGVkxKzTZlLWmRJ0o3Ka+Ls/vawKnRs0Zbjfm5ZJ8y7dZ7EMU3
	ACCR77AqDcF5ySFM6e2RdK9eHh/1neCXlr2e8MVj2BJSCs7cM4vxQh6LZtftMgUK1OZg
	+gjOUNSPloEdkMYb65HcEDMEdl9zIyIcvGG7tM5hqRYSbvouLSo/MIhai5gszECS78+n
	agaDwiI8PyhBUiyC+qBkFCiIv+3d+sMIVcq7HPqudSRFLE0IeEPuL5kX45kFqiahU+fi
	zoGlEQqW2Osfuvrui/6rzTFfje35xLtl2Pgcg+8OAsxTDKE0i+V4ZdQxwMrsXJ2+lX81
	8/GA==
X-Gm-Message-State: AOAM532In7hqzlwxvUeXQolSu+Vn/uQV4TkkwcrjXrs9eOxk1A/o2dHm
	/Nt+bZ8207755aeD7BJ8wrVa1Q==
X-Google-Smtp-Source: ABdhPJz+A28iMSsGMew00w4bTffNulDM4PlP1p1A1+RouZBKHQoPJUsZrDvvxCBzVTavFWwP5kdepA==
X-Received: by 2002:a17:90a:86:: with SMTP id
	a6mr20774739pja.190.1634224472530; 
	Thu, 14 Oct 2021 08:14:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id w4sm2822114pfb.3.2021.10.14.08.14.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Oct 2021 08:14:32 -0700 (PDT)
Date: Thu, 14 Oct 2021 08:14:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Dave Kleikamp <dave.kleikamp@oracle.com>
Message-ID: <202110140813.44C95229@keescook>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211014062844.GA25448@lst.de>
	<3AB8052D-DD45-478B-85F2-BFBEC1C7E9DF@tuxera.com>
	<a5eb3c18-deb2-6539-cc24-57e6d5d3500c@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a5eb3c18-deb2-6539-cc24-57e6d5d3500c@oracle.com>
Cc: "jfs-discussion@lists.sourceforge.net"
	<jfs-discussion@lists.sourceforge.net>, Mike Snitzer <snitzer@redhat.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Anton Altaparmakov <anton@tuxera.com>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jens Axboe <axboe@kernel.dk>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, "linux-ntfs-dev@lists.sourceforge.net"
	<linux-ntfs-dev@lists.sourceforge.net>, Jan Kara <jack@suse.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Drbd-dev] don't use ->bd_inode to access the block device size
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

On Thu, Oct 14, 2021 at 08:13:59AM -0500, Dave Kleikamp wrote:
> On 10/14/21 4:32AM, Anton Altaparmakov wrote:
> > Hi Christoph,
> > 
> > > On 14 Oct 2021, at 07:28, Christoph Hellwig <hch@lst.de> wrote:
> > > 
> > > On Wed, Oct 13, 2021 at 07:10:13AM +0200, Christoph Hellwig wrote:
> > > > I wondered about adding a helper for looking at the size in byte units
> > > > to avoid the SECTOR_SHIFT shifts in various places.  But given that
> > > > I could not come up with a good name and block devices fundamentally
> > > > work in sector size granularity I decided against that.
> > > 
> > > So it seems like the biggest review feedback is that we should have
> > > such a helper.  I think the bdev_size name is the worst as size does
> > > not imply a particular unit.  bdev_nr_bytes is a little better but I'm
> > > not too happy.  Any other suggestions or strong opinions?
> > 
> > bdev_byte_size() would seem to address your concerns?
> > 
> > bdev_nr_bytes() would work though - it is analogous to bdev_nr_sectors() after all.
> > 
> > No strong opinion here but I do agree with you that bdev_size() is a bad choice for sure.  It is bound to cause bugs down the line when people forget what unit it is in.
> 
> I don't really mind bdev_size since it's analogous to i_size, but
> bdev_nr_bytes seems good to me.

I much prefer bdev_nr_bytes(), as "size" has no units.

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
