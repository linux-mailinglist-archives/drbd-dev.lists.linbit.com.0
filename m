Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BE02AD393
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Nov 2020 11:23:16 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1FDD84207EE;
	Tue, 10 Nov 2020 11:23:07 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 581 seconds by postgrey-1.31 at mail19;
	Tue, 10 Nov 2020 02:23:38 CET
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7218B420666
	for <drbd-dev@lists.linbit.com>; Tue, 10 Nov 2020 02:23:38 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1604970836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=UkwosGD4CNwpr5O4mn7FToWEjHCGounmVIqa5vjwzhQ=;
	b=DRjXCHfaWTV+37wSriT1BjBgrVPE6jdQ5QSgYOIapfxJkFIwaFOAyxB9axkmnF7jwFoYyj
	IwVALzvZ0PuA7RxNph9leDCS6B9rTa4rL3nKcIBy/Am24PTMh01e/A2SQWp6LTkOQfBaj6
	TPNYDFf29DCqNiv3sgD8nE6enYeIlsYkCGyKDzwB1FGN01/Y3vKoJQtpchwkYWrvNb9W70
	4PCnBA8S0oYM/XwkwwZotKzR9vmT9oC6FdGvh5lMI1bLUaS0qdB+ZPTGprUeJSBjnvH0Xv
	xyRk7zOTS6b0OUuDBNt+X1xYcMB1KSB7gGowiPoSA5hPR5omsqQ5g20Kt4+uKg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1604970836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=UkwosGD4CNwpr5O4mn7FToWEjHCGounmVIqa5vjwzhQ=;
	b=acv/dHWHYYmtT1/z0brDNSAmBtlvEk8c07ItXmS/RUDap25yEm8biO9jTMWItRsTlNRTeF
	x/KI3sqvslL8SkDg==
To: ira.weiny@intel.com, Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>
In-Reply-To: <20201009195033.3208459-6-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-6-ira.weiny@intel.com>
Date: Tue, 10 Nov 2020 02:13:56 +0100
Message-ID: <87h7pyhv3f.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Nov 2020 11:23:02 +0100
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samba-technical@lists.samba.org,
	Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-rdma@vger.kernel.org, x86@kernel.org,
	amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
	cluster-devel@redhat.com, linux-cachefs@redhat.com,
	intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
	linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
	io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
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

Ira,

On Fri, Oct 09 2020 at 12:49, ira weiny wrote:
> From: Ira Weiny <ira.weiny@intel.com>
>
> To correctly support the semantics of kmap() with Kernel protection keys
> (PKS), kmap() may be required to set the protections on multiple
> processors (globally).  Enabling PKS globally can be very expensive
> depending on the requested operation.  Furthermore, enabling a domain
> globally reduces the protection afforded by PKS.
>
> Most kmap() (Aprox 209 of 229) callers use the map within a single thread and
> have no need for the protection domain to be enabled globally.  However, the
> remaining callers do not follow this pattern and, as best I can tell, expect
> the mapping to be 'global' and available to any thread who may access the
> mapping.[1]
>
> We don't anticipate global mappings to pmem, however in general there is a
> danger in changing the semantics of kmap().  Effectively, this would cause an
> unresolved page fault with little to no information about why the failure
> occurred.
>
> To resolve this a number of options were considered.
>
> 1) Attempt to change all the thread local kmap() calls to kmap_atomic()[2]
> 2) Introduce a flags parameter to kmap() to indicate if the mapping should be
>    global or not
> 3) Change ~20 call sites to 'kmap_global()' to indicate that they require a
>    global enablement of the pages.
> 4) Change ~209 call sites to 'kmap_thread()' to indicate that the mapping is to
>    be used within that thread of execution only
>
> Option 1 is simply not feasible.  Option 2 would require all of the call sites
> of kmap() to change.  Option 3 seems like a good minimal change but there is a
> danger that new code may miss the semantic change of kmap() and not get the
> behavior the developer intended.  Therefore, #4 was chosen.

There is Option #5:

Convert the thread local kmap() invocations to the proposed kmap_local()
interface which is coming along [1].

That solves a couple of issues:

 1) It relieves the current kmap_atomic() usage sites from the implict
    pagefault/preempt disable semantics which apply even when
    CONFIG_HIGHMEM is disabled. kmap_local() still can be invoked from
    atomic context.

 2) Due to #1 it allows to replace the conditional usage of kmap() and
    kmap_atomic() for purely thread local mappings.

 3) It puts the burden on the HIGHMEM inflicted systems

 4) It is actually more efficient for most of the pure thread local use
    cases on HIGHMEM inflicted systems because it avoids the overhead of
    the global lock and the potential kmap slot exhaustion. A potential
    preemption will be more expensive, but that's not really the case we
    want to optimize for.

 5) It solves the RT issue vs. kmap_atomic()

So instead of creating yet another variety of kmap() which is just
scratching the particular PKRS itch, can we please consolidate all of
that on the wider reaching kmap_local() approach?

Thanks,

        tglx
     
[1] https://lore.kernel.org/lkml/20201103092712.714480842@linutronix.de/

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
