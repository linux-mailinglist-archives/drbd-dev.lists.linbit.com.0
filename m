Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C018642CCB5
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 23:22:08 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8DD05420FFC;
	Wed, 13 Oct 2021 23:22:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 439 seconds by postgrey-1.31 at mail19;
	Wed, 13 Oct 2021 23:22:05 CEST
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 40EB9420FF2
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 23:22:05 +0200 (CEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0E7F61165
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 21:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634159685;
	bh=SlbEmP0SftpYg5Qzgl+3uhbNwtKN42MS1eJbqRVvz8o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hiKscGct16rhTAVFUvB8ulUGFNYX0XJpF+2YqPKF0No0/OTxa8B+FbCYvPeznM3IT
	o7+9DVjPYoKAxa50QdWsJ1gL4J+4wBU1jNZrm6P/FvNKQ8G7E2qrXO9VM2GBzVJvw8
	S/gFZjYpmMou1VruRE19i94wuylZi24lJbQ6yAN6OeRqXntYIE5B0JYh+T/uz9ctke
	L86OtKTf7XCkJxLOyXfeIFv5kZLrR3s6zlWx8Mcxq8cYKDBsASwSQxb8GUZPcnzqgT
	VFHmPHbz4NrsEHQ/qmk1iEmYL+m9W0ImnKdxKKKAOXKE+hMXaoTAVCJomjq0s1kTjo
	7pgsY+NMeWiSg==
Received: by mail-lf1-f47.google.com with SMTP id j21so17933679lfe.0
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 14:14:45 -0700 (PDT)
X-Gm-Message-State: AOAM532Jz0F2vaTwPMe1wIg6vggfkBNNawyTFTyzLrG8BtlEI+4NOmNI
	+hhCQGnaLfDLBwk32GrtnkCeqVqltO1ECf9G0Uo=
X-Google-Smtp-Source: ABdhPJy4PwudaFsA5k7zIKbmlSW7M8/j3iWHJKEthDYdjnMO754KPa3JLlK+wmXJkye7TEJ2vXHzCCixulymuZnDiqk=
X-Received: by 2002:a2e:6e0b:: with SMTP id j11mr1736234ljc.527.1634159683768; 
	Wed, 13 Oct 2021 14:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-5-hch@lst.de>
	<202110122311.B43459E21@keescook>
In-Reply-To: <202110122311.B43459E21@keescook>
From: Song Liu <song@kernel.org>
Date: Wed, 13 Oct 2021 14:14:32 -0700
X-Gmail-Original-Message-ID: <CAPhsuW6MFRmKfpUxLL3=TRAgNTuTMFySc=_-NA7YOWDAvYAxyQ@mail.gmail.com>
Message-ID: <CAPhsuW6MFRmKfpUxLL3=TRAgNTuTMFySc=_-NA7YOWDAvYAxyQ@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, reiserfs-devel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-raid <linux-raid@vger.kernel.org>,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 04/29] md: use bdev_nr_sectors instead of
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

On Tue, Oct 12, 2021 at 11:12 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Oct 13, 2021 at 07:10:17AM +0200, Christoph Hellwig wrote:
> > Use the proper helper to read the block device size.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> I think it might make sense, as you suggest earlier, to add a "bytes"
> helper. This is the first user in the series needing:
>
>         bdev_nr_sectors(...bdev) << SECTOR_SHIFT
>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Acked-by: Song Liu <song@kernel.org>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
