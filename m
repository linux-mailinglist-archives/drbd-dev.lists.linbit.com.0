Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8557642F74C
	for <lists+drbd-dev@lfdr.de>; Fri, 15 Oct 2021 17:49:40 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6A04742104F;
	Fri, 15 Oct 2021 17:49:39 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
	[209.85.214.175])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6507342104C
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 17:49:37 +0200 (CEST)
Received: by mail-pl1-f175.google.com with SMTP id c4so6646207pls.6
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 08:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to;
	bh=Ph+oZ8UT4h1HTx6qQ3UwPOnmmXuejFlF+FpHdhVkhfw=;
	b=iSbFTO7hl5wsHi/v9726DpD3kjwHBmUweM5nSVDlyWBslMc3wVKEMvQCq5pVO/6MpZ
	QpL/26LdJe7GrULqRDxfawSnvbruhiXNd7VKIbgGj0HAHUSD4T22YVTuGUCVLgeYQ9DD
	YRPQKjchN3EU8Gz5xfRwkBHxJQvIPm4lQcdPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Ph+oZ8UT4h1HTx6qQ3UwPOnmmXuejFlF+FpHdhVkhfw=;
	b=M9XBQiJ0/l34PnixkikWPycdI05rDYjPhKpx+T+yyepj4TPdEdsbTejDqECWWf1mPT
	e7U+EsmQQETPYg0+bKzq4b2JBABJK0bAaf/0CLAeWYvg1m7gG9QyM+s4ZOIxTY4wc0P7
	67a7s9dzWeOmZ3in3w6gzpnglJsPVsUnJ9DnltFPK5yOV2+GeO/Fv/FOWgyZuDYzfoJ+
	btYC96tEejC+a7YEYwImPfxg0n25zD15U+7VnQ7suwZM5J7aXeQzZlMGptvOz6akMqeX
	PH8oogU9oXZNVIcO7idDs9RhxBIebGogd8eyyoWoCvXBxR/KDMX1azM47Xw//RRWofWb
	3YYA==
X-Gm-Message-State: AOAM530uExPOae+fJiePlb9kVjfELB4H01tPFYYUpMWDH/F3HZYvkodw
	axogDnNdPt3ijz9zO0fGoenBkQ==
X-Google-Smtp-Source: ABdhPJz6i9tGVLgkq0eULPGyuk5x/dLn8xi+sif8q9XJ9Fat4Z2U3sGqOIlP99kszRnqXPDgBVaPnw==
X-Received: by 2002:a17:903:234d:b0:13f:3180:626a with SMTP id
	c13-20020a170903234d00b0013f3180626amr11815749plh.49.1634312976314;
	Fri, 15 Oct 2021 08:49:36 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	v22sm5451930pff.93.2021.10.15.08.49.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Oct 2021 08:49:35 -0700 (PDT)
Date: Fri, 15 Oct 2021 08:49:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Anton Altaparmakov <anton@tuxera.com>
Message-ID: <202110150848.375151B3@keescook>
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-3-hch@lst.de>
	<7C4AC4BD-B62D-41B3-AAF7-46125D1A1146@tuxera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7C4AC4BD-B62D-41B3-AAF7-46125D1A1146@tuxera.com>
Cc: Dave Kleikamp <shaggy@kernel.org>, "jfs-discussion@lists.sourceforge.net"
	<jfs-discussion@lists.sourceforge.net>, Mike Snitzer <snitzer@redhat.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"reiserfs-devel@vger.kernel.org" <reiserfs-devel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	"linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
	"linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
	David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Jens Axboe <axboe@kernel.dk>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, "linux-ntfs-dev@lists.sourceforge.net"
	<linux-ntfs-dev@lists.sourceforge.net>, Jan Kara <jack@suse.com>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	"ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
	"linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Subject: Re: [Drbd-dev] [PATCH 02/30] block: add a bdev_nr_bytes helper
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

On Fri, Oct 15, 2021 at 02:37:41PM +0000, Anton Altaparmakov wrote:
> Hi Christoph,
> 
> > On 15 Oct 2021, at 14:26, Christoph Hellwig <hch@lst.de> wrote:
> > 
> > Add a helpe to query the size of a block device in bytes.  This
> > will be used to remove open coded access to ->bd_inode.
> 
> Matthew already pointed out the return type for bdev_nr_bytes() but also your commit message has a typo: "Add a helpe" -> "Add a helper".

Right. With these fixed, I'm a fan. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

-- 
Kees Cook
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
