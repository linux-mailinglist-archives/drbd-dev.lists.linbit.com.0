Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE893091BF
	for <lists+drbd-dev@lfdr.de>; Sat, 30 Jan 2021 04:57:08 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DAFA54203D1;
	Sat, 30 Jan 2021 04:57:06 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 100EE420341
	for <drbd-dev@lists.linbit.com>; Sat, 30 Jan 2021 04:57:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DenP85I1Njjb0sm/Pv5awH6u78JiwmjeMN74Dl7XDmA=;
	b=H8SDl3brId4iyEQMOwW4BfEUQ2
	Xy9mZcqFmFvcWvR6dxLgQ3QUwF+RwC9GNnBM28jr+2J7JQ5Bm8pWtzkJy9Bu5683unOHOgLMv+gFM
	jYIfOM6Ao2NNEjEzqoWU83ro0i2k1QtT++2jpOr8mpPL1+MxGJTvy2GRgyUg+z6xssmGMSAnWY2zd
	lqlVaZEtkQfNNrYTdAkx5Dh4tKL60XSKbWMPsTXg7ShS8Q1MALyQ1L4XvADIPpEa3DQT7A35auYCK
	RYKeUzMDMR7ROqaOWCMHMSpzECR3dkUR8mtXMmO0lgMzXZcgza2tXYiFwaZvQ9UvVr3UoISIOLjsY
	syMo01WQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1l5hNO-00Afhm-T1; Sat, 30 Jan 2021 03:56:47 +0000
Date: Sat, 30 Jan 2021 03:56:46 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20210130035646.GH308988@casper.infradead.org>
References: <20210126145247.1964410-1-hch@lst.de>
	<20210126145247.1964410-5-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210126145247.1964410-5-hch@lst.de>
Cc: Mike Snitzer <snitzer@redhat.com>, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	Naohiro Aota <naohiro.aota@wdc.com>, linux-nilfs@vger.kernel.org,
	Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Damien Le Moal <damien.lemoal@wdc.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-nfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 04/17] block: split bio_kmalloc from
	bio_alloc_bioset
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

On Tue, Jan 26, 2021 at 03:52:34PM +0100, Christoph Hellwig wrote:
> bio_kmalloc shares almost no logic with the bio_set based fast path
> in bio_alloc_bioset.  Split it into an entirely separate implementation.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/bio.c         | 167 ++++++++++++++++++++++----------------------
>  include/linux/bio.h |   6 +-
>  2 files changed, 86 insertions(+), 87 deletions(-)

This patch causes current linux-next to OOM for me when running xfstests
after about ten minutes.  Haven't looked into why yet, this is just the
results of a git bisect.

The qemu command line is:

qemu-system-x86_64 -nodefaults -nographic -cpu host -machine accel=kvm,nvdimm -m 2G,slots=8,maxmem=1T -smp 6 -kernel /home/willy/kernel/folio/.build_test_kernel-x86_64/kpgk/vmlinuz -append console=hvc0 root=/dev/sda rw log_buf_len=8M ktest.dir=/home/willy/kernel/ktest ktest.env=/tmp/build-test-kernel-nJO6QgxOmo/env quiet systemd.show_status=0 systemd.log-target=journal crashkernel=128M no_console_suspend -device virtio-serial -chardev stdio,id=console -device virtconsole,chardev=console -serial unix:/tmp/build-test-kernel-nJO6QgxOmo/vm-kgdb,server,nowait -monitor unix:/tmp/build-test-kernel-nJO6QgxOmo/vm-mon,server,nowait -gdb unix:/tmp/build-test-kernel-nJO6QgxOmo/vm-gdb,server,nowait -device virtio-rng-pci -virtfs local,path=/,mount_tag=host,security_model=none -device virtio-scsi-pci,id=hba -nic user,model=virtio,hostfwd=tcp:127.0.0.1:24674-:22 -drive if=none,format=raw,id=disk0,file=/var/lib/ktest/root.amd64,snapshot=on -device scsi-hd,bus=hba.0,drive=disk0 -drive if=none
 ,format=raw,id=disk1,file=/tmp/build-test-kernel-nJO6QgxOmo/dev-1,cache=unsafe -device scsi-hd,bus=hba.0,drive=disk1 -drive if=none,format=raw,id=disk2,file=/tmp/build-test-kernel-nJO6QgxOmo/dev-2,cache=unsafe -device scsi-hd,bus=hba.0,drive=disk2 -drive if=none,format=raw,id=disk3,file=/tmp/build-test-kernel-nJO6QgxOmo/dev-3,cache=unsafe -device scsi-hd,bus=hba.0,drive=disk3

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
