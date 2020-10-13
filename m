Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2777428E1F7
	for <lists+drbd-dev@lfdr.de>; Wed, 14 Oct 2020 16:11:59 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8ED68420383;
	Wed, 14 Oct 2020 16:11:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CC3A94202FA
	for <drbd-dev@lists.linbit.com>; Tue, 13 Oct 2020 22:51:15 +0200 (CEST)
IronPort-SDR: lvEswaWEFgp+7ZXChSLvT28a3NE95aIybcGfPxDyqIeijTUFhiXF1ibnW6fMMNkiBVzfvkF17L
	NM93L6VlffBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="183474331"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="183474331"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	13 Oct 2020 13:50:14 -0700
IronPort-SDR: tBU8Od+WgzKnoE84+DWDWPkln+je7r0O2Nptsn2TVKPsgnriflj5gQkH1GYPWlpzBZ1iqAqtCk
	/srhQcj0pjbQ==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="318439699"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by orsmga006-auth.jf.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2020 13:50:12 -0700
Date: Tue, 13 Oct 2020 13:50:12 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20201013205012.GI2046448@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-34-ira.weiny@intel.com>
	<CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
	<20201013193643.GK20115@casper.infradead.org>
	<20201013200149.GI3576660@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013200149.GI3576660@ZenIV.linux.org.uk>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Mailman-Approved-At: Wed, 14 Oct 2020 16:11:48 +0200
Cc: linux-aio@kvack.org, linux-efi <linux-efi@vger.kernel.org>,
	KVM list <kvm@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
	Linux MM <linux-mm@kvack.org>, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Thomas Gleixner <tglx@linutronix.de>, drbd-dev@lists.linbit.com,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, X86 ML <x86@kernel.org>,
	ceph-devel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	io-uring@vger.kernel.org, cluster-devel@redhat.com,
	Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, bpf@vger.kernel.org,
	linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
	Netdev <netdev@vger.kernel.org>,
	Kexec Mailing List <kexec@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Drbd-dev] [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize new
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

On Tue, Oct 13, 2020 at 09:01:49PM +0100, Al Viro wrote:
> On Tue, Oct 13, 2020 at 08:36:43PM +0100, Matthew Wilcox wrote:
> 
> > static inline void copy_to_highpage(struct page *to, void *vfrom, unsigned int size)
> > {
> > 	char *vto = kmap_atomic(to);
> > 
> > 	memcpy(vto, vfrom, size);
> > 	kunmap_atomic(vto);
> > }
> > 
> > in linux/highmem.h ?
> 
> You mean, like
> static void memcpy_from_page(char *to, struct page *page, size_t offset, size_t len)
> {
>         char *from = kmap_atomic(page);
>         memcpy(to, from + offset, len);
>         kunmap_atomic(from);
> }
> 
> static void memcpy_to_page(struct page *page, size_t offset, const char *from, size_t len)
> {
>         char *to = kmap_atomic(page);
>         memcpy(to + offset, from, len);
>         kunmap_atomic(to);
> }
> 
> static void memzero_page(struct page *page, size_t offset, size_t len)
> {
>         char *addr = kmap_atomic(page);
>         memset(addr + offset, 0, len);
>         kunmap_atomic(addr);
> }
> 
> in lib/iov_iter.c?  FWIW, I don't like that "highpage" in the name and
> highmem.h as location - these make perfect sense regardless of highmem;
> they are normal memory operations with page + offset used instead of
> a pointer...

I was thinking along those lines as well especially because of the direction
this patch set takes kmap().

Thanks for pointing these out to me.  How about I lift them to a common header?
But if not highmem.h where?

Ira
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
