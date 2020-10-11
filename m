Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF6628BBC3
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:25:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9AEA1420309;
	Mon, 12 Oct 2020 17:25:03 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 584924202B6
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:25:02 +0200 (CEST)
Received: by mail-wm1-f67.google.com with SMTP id b127so5107194wmb.3
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:message-id:from:date:subject:to:cc;
	bh=xgVU10m8OyFKDL+QiwgX+6IVvh+MglCX/whWbe6QuYg=;
	b=XRYtZK3kcY0FPbKbvjJN+drduQLG094n3fqH/MtkTUz0rcBU8wWaJpeNYaiTXALxFq
	D4TeCfmYeXQQzCwOm78R5EyPcaS3xRzB30Z1uDbD+FQU3Is+SsHQw8DPBAZajNHAwIoo
	31DTGCJjexH49ObcH6O4FcIbyjZySr22D7gw1TusVub550XtWVipHVpUO178aRhBITmE
	lf1mkI+kJPmNNcS+nEhE1ywK2fRNVdciieMct72OfrJxa+CQc2TyYDpuqGk6rii9EIum
	xEOfdeg3pjRFGUCCG8Lhx2EodZzR25itsy9Be54ViwZFzOiX2VGCoacbkTkXcuXPElL4
	2wRQ==
X-Gm-Message-State: AOAM530xwV7RGQzF6BJXmoOvJdnCACQhfQfC9iVmM+Yfa1ECcDmcnCfC
	W5i7QZRhEEqhsJ93JtdJeqziKMlBpI4GpMm3
X-Google-Smtp-Source: ABdhPJzD9nSu5dc3DtrwSqBh5DRzB+52MZKjmVfJG5iua43DZLWnONA7P7PUtEEmTGgRim+YPDQmEA==
X-Received: by 2002:a7b:ca42:: with SMTP id m2mr11699702wml.145.1602516301043; 
	Mon, 12 Oct 2020 08:25:01 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	c68sm23191432wmd.34.2020.10.12.08.25.00
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:25:00 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:24:58 +0200
Resent-Message-ID: <20201012152458.GA2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 360 seconds by postgrey-1.31 at mail19;
	Sun, 11 Oct 2020 18:13:36 CEST
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net
	[176.9.242.62])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B47CF420067
	for <drbd-dev@lists.linbit.com>; Sun, 11 Oct 2020 18:13:36 +0200 (CEST)
Received: from h08.hostsharing.net (h08.hostsharing.net
	[IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "*.hostsharing.net",
	Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 3CEB3100CF144;
	Sun, 11 Oct 2020 18:07:36 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id F3E6E81FAA; Sun, 11 Oct 2020 18:07:35 +0200 (CEST)
Message-Id: <1c700caab1ce71fa144116541471b3f7bb4629fa.1602432204.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sun, 11 Oct 2020 18:07:36 +0200
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
Cc: Michael Hierweck <michael.hierweck@hostsharing.net>,
	Elimar Riesebieter <riesebie@lxtec.de>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH drbd-9.0] compat: __vmalloc() pgprot argument was
 removed in v5.8
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Commit torvalds/linux@88dca4ca5a93 removed the pgprot argument from
__vmalloc().  There's a single invocation in drbd_bitmap.c.  Drop the
argument to stay as close as possible to upstream and apply a cocci
patch for older kernels which reinstates the additional argument.

Reported-by: Michael Hierweck <michael.hierweck@hostsharing.net>
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drbd/drbd-kernel-compat/cocci/__vmalloc__no_has_2_params.cocci | 3 +++
 drbd/drbd-kernel-compat/gen_patch_names.c                      | 3 +++
 drbd/drbd-kernel-compat/tests/__vmalloc_has_2_params.c         | 8 ++++++++
 drbd/drbd_bitmap.c                                             | 3 +--
 4 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 drbd/drbd-kernel-compat/cocci/__vmalloc__no_has_2_params.cocci
 create mode 100644 drbd/drbd-kernel-compat/tests/__vmalloc_has_2_params.c

diff --git a/drbd/drbd-kernel-compat/cocci/__vmalloc__no_has_2_params.cocci b/drbd/drbd-kernel-compat/cocci/__vmalloc__no_has_2_params.cocci
new file mode 100644
index 0000000..335581d
--- /dev/null
+++ b/drbd/drbd-kernel-compat/cocci/__vmalloc__no_has_2_params.cocci
@@ -0,0 +1,3 @@
+@@ expression S, G; @@
+- __vmalloc(S, G)
++ __vmalloc(S, G, PAGE_KERNEL)
diff --git a/drbd/drbd-kernel-compat/gen_patch_names.c b/drbd/drbd-kernel-compat/gen_patch_names.c
index 8d5af81..86e9d02 100644
--- a/drbd/drbd-kernel-compat/gen_patch_names.c
+++ b/drbd/drbd-kernel-compat/gen_patch_names.c
@@ -323,6 +323,9 @@ int main(int argc, char **argv)
 	patch(1, "part_stat_h", true, false,
 	      COMPAT_HAVE_PART_STAT_H, "present");
 
+	patch(1, "__vmalloc", true, false,
+	      COMPAT___VMALLOC_HAS_2_PARAMS, "has_2_params");
+
 /* #define BLKDEV_ISSUE_ZEROOUT_EXPORTED */
 /* #define BLKDEV_ZERO_NOUNMAP */
 
diff --git a/drbd/drbd-kernel-compat/tests/__vmalloc_has_2_params.c b/drbd/drbd-kernel-compat/tests/__vmalloc_has_2_params.c
new file mode 100644
index 0000000..00e2c28
--- /dev/null
+++ b/drbd/drbd-kernel-compat/tests/__vmalloc_has_2_params.c
@@ -0,0 +1,8 @@
+/* { "version": "v5.8-rc1", "commit": "88dca4ca5a93d2c09e5bbc6a62fbfc3af83c4fca", "comment": "pgprot argument to __vmalloc was removed", "author": "Christoph Hellwig <hch@lst.de>", "date": "Mon Jun 1 21:51:40 2020 -0700" } */
+
+#include <linux/vmalloc.h>
+
+void foo(void)
+{
+	__vmalloc(0, 0);
+}
diff --git a/drbd/drbd_bitmap.c b/drbd/drbd_bitmap.c
index 4dbed26..e23ed5a 100644
--- a/drbd/drbd_bitmap.c
+++ b/drbd/drbd_bitmap.c
@@ -366,9 +366,7 @@ static struct page **bm_realloc_pages(struct drbd_bitmap *b, unsigned long want)
 	new_pages = kzalloc(bytes, GFP_NOIO | __GFP_NOWARN);
 	if (!new_pages) {
 		new_pages = __vmalloc(bytes,
-				GFP_NOIO | __GFP_HIGHMEM | __GFP_ZERO,
-				PAGE_KERNEL);
+				      GFP_NOIO | __GFP_HIGHMEM | __GFP_ZERO);
 		if (!new_pages)
 			return NULL;
 	}
-- 
2.27.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
