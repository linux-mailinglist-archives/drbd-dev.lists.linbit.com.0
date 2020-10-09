Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E75A28BCF7
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:54:07 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A6B1D4207BD;
	Mon, 12 Oct 2020 17:54:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D2A2E4203CE
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:52:30 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id n18so19760060wrs.5
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:52:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:ironport-sdr:ironport-sdr:from:to:cc:subject:date
	:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Pq+5H0Tb8kpWR+AdJnT+a+sSRzDgUP6g7wD70nRElTg=;
	b=sFjWrGxWyXIxEWnWdnT2cRGlid0uoOX7epMH8Cy28c6CAhseS72ePr1rMZ4w12/BZl
	XqRRNSWrtG0wTy2SXizs0D0Epyzux5qhWvUXPwh8K85FowbksrXyFCj4ymmCu8kIskzm
	3WDcUVhWAr9My06hRD+Uae0FKZBHdpkwd5h3z8r4aWVhWQH3cL90XMT4D9gpRZli2fIW
	5iY3MbrNxclsEAwVDkVA1ch4TR2GtskSNegT3oxrPdGdcC12OWaczGf8X1jBCej8NQDQ
	fqHd7sWtOZejL+RurCu2f5BrTYcfiUnTSP2ODAQdvIbbX4z5hNh+fxb4zI5hJvzrz6qk
	3jiQ==
X-Gm-Message-State: AOAM531src8ozVrIsJHsZh/5PLr0y4ODWjXjJMhEdfA7PNvcV6xsZ8P7
	HLzV5PdWtQ6yZe8OTZRVdOlkVXqVwu4TdoCP6U0=
X-Google-Smtp-Source: ABdhPJyI/SquNZ8UrGEV7mrGMu2iY8n1xDwxOhFrGXJd2Q8OBuulx2Q4EC6AznfjIcETm0rX4jpH/w==
X-Received: by 2002:adf:ee4c:: with SMTP id w12mr1040041wro.22.1602517950240; 
	Mon, 12 Oct 2020 08:52:30 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	z64sm5831141wmg.19.2020.10.12.08.52.29
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:52:29 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:52:27 +0200
Resent-Message-ID: <20201012155227.GD2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 98C0C423AE4
	for <drbd-dev@lists.linbit.com>; Fri,  9 Oct 2020 22:00:41 +0200 (CEST)
IronPort-SDR: XLCUytUQh44wGvFbWgpgg98KP2NJUjMPazR6sPwM6HR6XqcJkVaWd1tl+ybeIgQ5rDQuCG5xz4
	ZkCmRDLB8b8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="162067773"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="162067773"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	09 Oct 2020 12:50:59 -0700
IronPort-SDR: /j9oTf64Lc/fwCVe0LT3Z3/pz5zJXnOJNQAbfqyJqoBSoEhIO3zt/eOhOuH8Xl1K1eBwx2q0zq
	2edyiKrU43UQ==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="519846797"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
	by fmsmga005-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2020 12:50:59 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:49:39 -0700
Message-Id: <20201009195033.3208459-5-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 12 Oct 2020 17:54:04 +0200
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
Subject: [Drbd-dev] [PATCH RFC PKS/PMEM 04/58] kmap: Add stray access
	protection for device pages
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

From: Ira Weiny <ira.weiny@intel.com>

Device managed pages may have additional protections.  These protections
need to be removed prior to valid use by kernel users.

Check for special treatment of device managed pages in kmap and take
action if needed.  We use kmap as an interface for generic kernel code
because under normal circumstances it would be a bug for general kernel
code to not use kmap prior to accessing kernel memory.  Therefore, this
should allow any valid kernel users to seamlessly use these pages
without issues.

Because of the critical nature of kmap it must be pointed out that the
over head on regular DRAM is carefully implemented to be as fast as
possible.  Furthermore the underlying MSR write required on device pages
when protected is better than a normal MSR write.

Specifically, WRMSR(MSR_IA32_PKRS) is not serializing but still
maintains ordering properties similar to WRPKRU.  The current SDM
section on PKRS needs updating but should be the same as that of WRPKRU.
So to quote from the WRPKRU text:

	WRPKRU will never execute speculatively. Memory accesses
	affected by PKRU register will not execute (even speculatively)
	until all prior executions of WRPKRU have completed execution
	and updated the PKRU register.

Still this will make accessing pmem more expensive from the kernel but
the overhead is minimized and many pmem users access this memory through
user page mappings which are not affected at all.

Cc: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 include/linux/highmem.h | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 14e6202ce47f..2a9806e3b8d2 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -8,6 +8,7 @@
 #include <linux/mm.h>
 #include <linux/uaccess.h>
 #include <linux/hardirq.h>
+#include <linux/memremap.h>
 
 #include <asm/cacheflush.h>
 
@@ -31,6 +32,20 @@ static inline void invalidate_kernel_vmap_range(void *vaddr, int size)
 
 #include <asm/kmap_types.h>
 
+static inline void dev_page_enable_access(struct page *page, bool global)
+{
+	if (!page_is_access_protected(page))
+		return;
+	dev_access_enable(global);
+}
+
+static inline void dev_page_disable_access(struct page *page, bool global)
+{
+	if (!page_is_access_protected(page))
+		return;
+	dev_access_disable(global);
+}
+
 #ifdef CONFIG_HIGHMEM
 extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
 extern void kunmap_atomic_high(void *kvaddr);
@@ -55,6 +70,11 @@ static inline void *kmap(struct page *page)
 	else
 		addr = kmap_high(page);
 	kmap_flush_tlb((unsigned long)addr);
+	/*
+	 * Even non-highmem pages may have additional access protections which
+	 * need to be checked and potentially enabled.
+	 */
+	dev_page_enable_access(page, true);
 	return addr;
 }
 
@@ -63,6 +83,11 @@ void kunmap_high(struct page *page);
 static inline void kunmap(struct page *page)
 {
 	might_sleep();
+	/*
+	 * Even non-highmem pages may have additional access protections which
+	 * need to be checked and potentially disabled.
+	 */
+	dev_page_disable_access(page, true);
 	if (!PageHighMem(page))
 		return;
 	kunmap_high(page);
@@ -85,6 +110,7 @@ static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
 {
 	preempt_disable();
 	pagefault_disable();
+	dev_page_enable_access(page, false);
 	if (!PageHighMem(page))
 		return page_address(page);
 	return kmap_atomic_high_prot(page, prot);
@@ -137,6 +163,7 @@ static inline unsigned long totalhigh_pages(void) { return 0UL; }
 static inline void *kmap(struct page *page)
 {
 	might_sleep();
+	dev_page_enable_access(page, true);
 	return page_address(page);
 }
 
@@ -146,6 +173,7 @@ static inline void kunmap_high(struct page *page)
 
 static inline void kunmap(struct page *page)
 {
+	dev_page_disable_access(page, true);
 #ifdef ARCH_HAS_FLUSH_ON_KUNMAP
 	kunmap_flush_on_unmap(page_address(page));
 #endif
@@ -155,6 +183,7 @@ static inline void *kmap_atomic(struct page *page)
 {
 	preempt_disable();
 	pagefault_disable();
+	dev_page_enable_access(page, false);
 	return page_address(page);
 }
 #define kmap_atomic_prot(page, prot)	kmap_atomic(page)
@@ -216,7 +245,8 @@ static inline void kmap_atomic_idx_pop(void)
 #define kunmap_atomic(addr)                                     \
 do {                                                            \
 	BUILD_BUG_ON(__same_type((addr), struct page *));       \
-	kunmap_atomic_high(addr);                                  \
+	dev_page_disable_access(kmap_to_page(addr), false);     \
+	kunmap_atomic_high(addr);                               \
 	pagefault_enable();                                     \
 	preempt_enable();                                       \
 } while (0)
-- 
2.28.0.rc0.12.gb6a658bd00c9

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
