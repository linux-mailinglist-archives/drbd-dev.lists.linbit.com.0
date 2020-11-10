Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B932AD394
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Nov 2020 11:23:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A5C534207F2;
	Tue, 10 Nov 2020 11:23:07 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1E9DC4205FD
	for <drbd-dev@lists.linbit.com>; Tue, 10 Nov 2020 05:59:58 +0100 (CET)
IronPort-SDR: Kj7RCLu7Bb6Zy/HZtlO9IOKdJsdh6U++eXHkviBpardx9vnhhu868DmIdr2lbQ/igCrkxb7cAp
	9bBsgyChgG7A==
X-IronPort-AV: E=McAfee;i="6000,8403,9800"; a="170071605"
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; d="scan'208";a="170071605"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Nov 2020 20:59:56 -0800
IronPort-SDR: hhtGbVHiYEduO62f/jUORNlQE29+PA61IlKuvPXTtZvvOlHxHT75TW+y4i0J9B1O2lrgZ7K2Sp
	gskiAxl5TCew==
X-IronPort-AV: E=Sophos;i="5.77,465,1596524400"; d="scan'208";a="531063331"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga005-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2020 20:59:54 -0800
Date: Mon, 9 Nov 2020 20:59:54 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20201110045954.GL3976735@iweiny-DESK2.sc.intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-6-ira.weiny@intel.com>
	<87h7pyhv3f.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h7pyhv3f.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:23:02 +0100
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org,
	x86@kernel.org, amd-gfx@lists.freedesktop.org,
	io-uring@vger.kernel.org, cluster-devel@redhat.com,
	Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
	xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
	Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH RFC PKS/PMEM 05/58] kmap: Introduce
	k[un]map_thread
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

On Tue, Nov 10, 2020 at 02:13:56AM +0100, Thomas Gleixner wrote:
> Ira,
> 
> On Fri, Oct 09 2020 at 12:49, ira weiny wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> >
> > To correctly support the semantics of kmap() with Kernel protection keys
> > (PKS), kmap() may be required to set the protections on multiple
> > processors (globally).  Enabling PKS globally can be very expensive
> > depending on the requested operation.  Furthermore, enabling a domain
> > globally reduces the protection afforded by PKS.
> >
> > Most kmap() (Aprox 209 of 229) callers use the map within a single thread and
> > have no need for the protection domain to be enabled globally.  However, the
> > remaining callers do not follow this pattern and, as best I can tell, expect
> > the mapping to be 'global' and available to any thread who may access the
> > mapping.[1]
> >
> > We don't anticipate global mappings to pmem, however in general there is a
> > danger in changing the semantics of kmap().  Effectively, this would cause an
> > unresolved page fault with little to no information about why the failure
> > occurred.
> >
> > To resolve this a number of options were considered.
> >
> > 1) Attempt to change all the thread local kmap() calls to kmap_atomic()[2]
> > 2) Introduce a flags parameter to kmap() to indicate if the mapping should be
> >    global or not
> > 3) Change ~20 call sites to 'kmap_global()' to indicate that they require a
> >    global enablement of the pages.
> > 4) Change ~209 call sites to 'kmap_thread()' to indicate that the mapping is to
> >    be used within that thread of execution only
> >
> > Option 1 is simply not feasible.  Option 2 would require all of the call sites
> > of kmap() to change.  Option 3 seems like a good minimal change but there is a
> > danger that new code may miss the semantic change of kmap() and not get the
> > behavior the developer intended.  Therefore, #4 was chosen.
> 
> There is Option #5:

There is now yes.  :-D

> 
> Convert the thread local kmap() invocations to the proposed kmap_local()
> interface which is coming along [1].

I've been trying to follow that thread.

> 
> That solves a couple of issues:
> 
>  1) It relieves the current kmap_atomic() usage sites from the implict
>     pagefault/preempt disable semantics which apply even when
>     CONFIG_HIGHMEM is disabled. kmap_local() still can be invoked from
>     atomic context.
> 
>  2) Due to #1 it allows to replace the conditional usage of kmap() and
>     kmap_atomic() for purely thread local mappings.
> 
>  3) It puts the burden on the HIGHMEM inflicted systems
> 
>  4) It is actually more efficient for most of the pure thread local use
>     cases on HIGHMEM inflicted systems because it avoids the overhead of
>     the global lock and the potential kmap slot exhaustion. A potential
>     preemption will be more expensive, but that's not really the case we
>     want to optimize for.
> 
>  5) It solves the RT issue vs. kmap_atomic()
> 
> So instead of creating yet another variety of kmap() which is just
> scratching the particular PKRS itch, can we please consolidate all of
> that on the wider reaching kmap_local() approach?

Yes I agree.  We absolutely don't want more kmap*() calls and I was hoping to
dovetail into your kmap_local() work.[2]

I've pivoted away from this work a bit to clean up all the
kmap()/memcpy*()/kunmaps() as discussed elsewhere in the thread first.[3]  I
was hoping your work would land and then I could s/kmap_thread()/kmap_local()/
on all of these patches.

Also, we can convert the new memcpy_*_page() calls to kmap_local() as well.
[For now my patch just uses kmap_atomic().]

I've not looked at all of the patches in your latest version.  Have you
included converting any of the kmap() call sites?  I thought you were more
focused on converting the kmap_atomic() to kmap_local()?

Ira

> 
> Thanks,
> 
>         tglx
>      
> [1] https://lore.kernel.org/lkml/20201103092712.714480842@linutronix.de/

[2] https://lore.kernel.org/lkml/20201012195354.GC2046448@iweiny-DESK2.sc.intel.com/
[3] https://lore.kernel.org/lkml/20201009213434.GA839@sol.localdomain/
    https://lore.kernel.org/lkml/20201013200149.GI3576660@ZenIV.linux.org.uk/

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
