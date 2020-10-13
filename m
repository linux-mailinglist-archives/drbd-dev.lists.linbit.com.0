Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D861728E1F3
	for <lists+drbd-dev@lfdr.de>; Wed, 14 Oct 2020 16:11:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EBDF342032B;
	Wed, 14 Oct 2020 16:11:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 82DFC420305
	for <drbd-dev@lists.linbit.com>; Tue, 13 Oct 2020 21:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=julNFvrjaFWkGS8+6W5JRZKKlBpdy19jf/hCoUdzdEM=;
	b=iOPFuszmnN+d5S+Ahd5uX1N4pM
	9RF6NzOI8Sd5OvAHWw4A5T4V7HBzV5SYmEitcrT6L9uijzivpv3AAlrlQ+EeeMBwBERzfaRW96tDf
	PKzX+Sl2uCT2ULOLsIaATERkdV1cx8TAcLFUKC9PDDXh3BUb0PThsEH5DExMv1qS5B9SNDc+ifGE8
	i5adkcq3oTTGJk72Oatktad6H8mS4gZ84Snyq0JJxGsD2588n+HRQh2ps2O3qrgewJ3m2qt+GgsvN
	M0CVp3vtxwWhumjXm1Xcpjg1G/4g9JvOqlT5q+mB/7fQkjMGPjGhStjIFbjEA/fecM1aATnK3yCCv
	pha3ulKA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1kSQ6F-000768-Gq; Tue, 13 Oct 2020 19:36:43 +0000
Date: Tue, 13 Oct 2020 20:36:43 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20201013193643.GK20115@casper.infradead.org>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-34-ira.weiny@intel.com>
	<CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
X-Mailman-Approved-At: Wed, 14 Oct 2020 16:11:48 +0200
Cc: linux-aio@kvack.org, linux-efi <linux-efi@vger.kernel.org>,
	KVM list <kvm@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
	Linux MM <linux-mm@kvack.org>, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
	samba-technical@lists.samba.org, "Weiny,
	Ira" <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi <linux-scsi@vger.kernel.org>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, X86 ML <x86@kernel.org>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	io-uring@vger.kernel.org, cluster-devel@redhat.com,
	Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
	Netdev <netdev@vger.kernel.org>,
	Kexec Mailing List <kexec@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, bpf@vger.kernel.org,
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

On Tue, Oct 13, 2020 at 11:44:29AM -0700, Dan Williams wrote:
> On Fri, Oct 9, 2020 at 12:52 PM <ira.weiny@intel.com> wrote:
> >
> > From: Ira Weiny <ira.weiny@intel.com>
> >
> > The kmap() calls in this FS are localized to a single thread.  To avoid
> > the over head of global PKRS updates use the new kmap_thread() call.
> >
> > Cc: Nicolas Pitre <nico@fluxnic.net>
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > ---
> >  fs/cramfs/inode.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> > index 912308600d39..003c014a42ed 100644
> > --- a/fs/cramfs/inode.c
> > +++ b/fs/cramfs/inode.c
> > @@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
> >                 struct page *page = pages[i];
> >
> >                 if (page) {
> > -                       memcpy(data, kmap(page), PAGE_SIZE);
> > -                       kunmap(page);
> > +                       memcpy(data, kmap_thread(page), PAGE_SIZE);
> > +                       kunmap_thread(page);
> 
> Why does this need a sleepable kmap? This looks like a textbook
> kmap_atomic() use case.

There's a lot of code of this form.  Could we perhaps have:

static inline void copy_to_highpage(struct page *to, void *vfrom, unsigned int size)
{
	char *vto = kmap_atomic(to);

	memcpy(vto, vfrom, size);
	kunmap_atomic(vto);
}

in linux/highmem.h ?
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
