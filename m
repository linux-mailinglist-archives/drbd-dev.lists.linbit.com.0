Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7F228E1F8
	for <lists+drbd-dev@lfdr.de>; Wed, 14 Oct 2020 16:12:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AF9FF420395;
	Wed, 14 Oct 2020 16:11:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1C836420305
	for <drbd-dev@lists.linbit.com>; Tue, 13 Oct 2020 22:54:37 +0200 (CEST)
IronPort-SDR: +KtMTMFW/0uhul72QAwtVL3vAkB++2si1GMGrum1HrayvuMz9w1Pg4KuDYIa+jh2nITpByJChU
	2inUiECtVh0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="166045665"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="166045665"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	13 Oct 2020 13:53:36 -0700
IronPort-SDR: 6pC5EU5QwoXbsJ9AhSALdpEnefHex0iyEFu7THvX1eaSFNd77CbWePaQQdxa3yUvYDZ6VBgRvg
	Vwn0OOQPMwwA==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="313946459"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga003-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 13:53:35 -0700
Date: Tue, 13 Oct 2020 13:52:49 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20201013205248.GJ2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-25-ira.weiny@intel.com>
	<20201013112544.GA5249@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013112544.GA5249@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Mailman-Approved-At: Wed, 14 Oct 2020 16:11:48 +0200
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, ceph-devel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org,
	cluster-devel@redhat.com, Ingo Molnar <mingo@redhat.com>,
	intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
	linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
	linux-afs@lists.infradead.org, linux-um@lists.infradead.org,
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

On Tue, Oct 13, 2020 at 12:25:44PM +0100, Christoph Hellwig wrote:
> > -	kaddr = kmap(pp);
> > +	kaddr = kmap_thread(pp);
> >  	memcpy(kaddr, vip->vii_immed.vi_immed + offset, PAGE_SIZE);
> > -	kunmap(pp);
> > +	kunmap_thread(pp);
> 
> You only Cced me on this particular patch, which means I have absolutely
> no idea what kmap_thread and kunmap_thread actually do, and thus can't
> provide an informed review.

Sorry the list was so big I struggled with who to CC and on which patches.

> 
> That being said I think your life would be a lot easier if you add
> helpers for the above code sequence and its counterpart that copies
> to a potential hughmem page first, as that hides the implementation
> details from most users.

Matthew Wilcox and Al Viro have suggested similar ideas.

https://lore.kernel.org/lkml/20201013205012.GI2046448@iweiny-DESK2.sc.intel.com/

Ira
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
