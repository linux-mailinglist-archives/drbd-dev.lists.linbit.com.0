Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC8828E1F0
	for <lists+drbd-dev@lfdr.de>; Wed, 14 Oct 2020 16:11:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6F9F2420309;
	Wed, 14 Oct 2020 16:11:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 224564202F4
	for <drbd-dev@lists.linbit.com>; Tue, 13 Oct 2020 13:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ap+vugPRXoOSJhloW5EJc9FGxy9ZwiLwbnG+7+pEMhA=;
	b=a/Sp1GZZiVtkIrsbDZFKKgQTkQ
	FS+JHTt9pp+5vCrBdk0ac5b7U8ZgZGFScrKiULCJv4PZD4wWqOSzzq06ZoGh/8vFLI33VuvYYBdii
	wZ4VlXJvl5fnmlD+q4pIJJmvrTs/0jX/FIDmEAYUX2+Mt6vIwB3sAbRYRgWIA8hB4i4EWyZuWPFOQ
	rIaV+GwSaVBgBLKvO/SsFSj7I46VHFxg38PLmJQ+Oh1DkRIQcIx5NIWLGcWnDXshQ14JMdlpURiF2
	LxyBxRGv+1Wkfh31jf6dzRr+U4xHgvz3PsshAxeZoaF0OQPY6Fl5VA2XZOxLonra6CTBCfgsfUBp/
	6eTYHzgA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1kSIR6-0001VK-7P; Tue, 13 Oct 2020 11:25:44 +0000
Date: Tue, 13 Oct 2020 12:25:44 +0100
From: Christoph Hellwig <hch@infradead.org>
To: ira.weiny@intel.com
Message-ID: <20201013112544.GA5249@infradead.org>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-25-ira.weiny@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201009195033.3208459-25-ira.weiny@intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Wed, 14 Oct 2020 16:11:48 +0200
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
	devel@driverdev.osuosl.org, cluster-devel@redhat.com,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, ceph-devel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org, linux-um@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH RFC PKS/PMEM 24/58] fs/freevxfs: Utilize new
	kmap_thread()
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

> -	kaddr = kmap(pp);
> +	kaddr = kmap_thread(pp);
>  	memcpy(kaddr, vip->vii_immed.vi_immed + offset, PAGE_SIZE);
> -	kunmap(pp);
> +	kunmap_thread(pp);

You only Cced me on this particular patch, which means I have absolutely
no idea what kmap_thread and kunmap_thread actually do, and thus can't
provide an informed review.

That being said I think your life would be a lot easier if you add
helpers for the above code sequence and its counterpart that copies
to a potential hughmem page first, as that hides the implementation
details from most users.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
