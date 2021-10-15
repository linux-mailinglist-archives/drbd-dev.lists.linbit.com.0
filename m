Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FE943107C
	for <lists+drbd-dev@lfdr.de>; Mon, 18 Oct 2021 08:25:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 865A0420FAE;
	Mon, 18 Oct 2021 08:25:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4FF62420FE5
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 15:54:45 +0200 (CEST)
Received: by mail-lf1-f46.google.com with SMTP id n8so41896082lfk.6
	for <drbd-dev@lists.linbit.com>; Fri, 15 Oct 2021 06:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ffV9EXIvpsxi/zzat9M/mXqT6D2BowDOkY1JbwoxMOs=;
	b=dywwSbIGuXR+dXQSROUIhljg5+mHDSiHww9Tc5QE/0KVc6D96c2ocK9S4czPbKsPtz
	ySNRWdT9ve7V2FStFVRj6GJtI3GsO5QLdZltms855+mPxWEcF0y64BVbP3jeqDvlTRSC
	Q0SLO0cmgDLKr6f+MZ/VrWRqoygoePpVOM+o8yB+jCv00rDqDRMVdNenYkm3jQj9uL4k
	E4/MHhOextdkY9W69AUB008H67vZy/HWT7fbCa67+7KfpngwPIaSC4I9QxVoGvAnEL8B
	uHW/dfm/FieH/pIjg0HJFLHL4EoFbkdCY9X4ZyWcCPHq1gpKkT+6jn/WXPUZSeEosezu
	YVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ffV9EXIvpsxi/zzat9M/mXqT6D2BowDOkY1JbwoxMOs=;
	b=XjHMBEg6vfOoKArTrcHNJ3ZD4VVvdOSckWdhzJob6ysPmwjhbXFjEw2d7gCup13fmk
	b7AMvaAR3jrkYxfsNaeG1onQF6/s7JbkDz6QCUleL6O0FnqVZpGYbiwPkjD4Ed/ZpHMG
	QPn3dU7TLxnMHpqcpfhr7IBkg3KhTphfKCjJ96EdjLHltBKLBikmVa7TanoVmw8AeOm2
	TyMnfy/9EQRu1w4Av6Wra65VPcVVhO8kBvTSYcDr44pTFsZP1fmd5RFZinxIscw9OrOV
	OltCaUFqYsiZRD3lQ1AkNxDBYvfEkmsHlRLL5w6ad9XvEMOByn2DQSjGN6vvtlH3AosA
	bn3g==
X-Gm-Message-State: AOAM532lyKlfhc8x30KGitxRG4gwyoAPEH8BchP+NMxG+e74TkRd+tt0
	WKZSJpniQmq7BvoWqTeoK1eJDU2z2ySQ47ZD+rE=
X-Google-Smtp-Source: ABdhPJzz49VguPSiC+Fo0EQ3C2KxuaRWGiHMMcfCON0rRU6wG0keaxKFCd23chpDIT1aQ64ecAbOb/mh29DzHZBz3N0=
X-Received: by 2002:a2e:a170:: with SMTP id u16mr12947954ljl.108.1634306084449;
	Fri, 15 Oct 2021 06:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211015132643.1621913-1-hch@lst.de>
	<20211015132643.1621913-20-hch@lst.de>
In-Reply-To: <20211015132643.1621913-20-hch@lst.de>
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Date: Fri, 15 Oct 2021 22:54:32 +0900
Message-ID: <CAKFNMokH0ZU-zxMe3Wm87hZwVgXPv3nRYBx2gXU98GekaeDFRw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Mon, 18 Oct 2021 08:25:41 +0200
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	target-devel@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-nilfs <linux-nilfs@vger.kernel.org>,
	linux-scsi@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, linux-bcache@vger.kernel.org,
	David Sterba <dsterba@suse.com>, Anton Altaparmakov <anton@tuxera.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 19/30] nilfs2: use bdev_nr_bytes instead of
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

On Fri, Oct 15, 2021 at 10:27 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Use the proper helper to read the block device size.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>

Thanks,
Ryusuke Konishi
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
