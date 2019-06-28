Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 789265BADA
	for <lists+drbd-dev@lfdr.de>; Mon,  1 Jul 2019 13:39:25 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 832061028A6F;
	Mon,  1 Jul 2019 13:39:23 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id B22911011BF7
	for <drbd-dev@lists.linbit.com>; Mon,  1 Jul 2019 13:39:21 +0200 (CEST)
Received: by mail-wr1-f65.google.com with SMTP id f9so13419043wre.12
	for <drbd-dev@lists.linbit.com>; Mon, 01 Jul 2019 04:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NQrLAHec6ZFSeCAw7w8J5S1GYNaZWnqjTjdv38X/dqo=;
	b=V895178FajutAxAcjzZGbOr4lWZsdlM0NUvjX0/ut8NKrhWD9hyB07duoJjkATXJYw
	57+WPtx5FaUfwIPEA+uRe+J83DfH8I13HsAvtXUog4CRKKms/ELWEfkX0dldsxTL5cDN
	jxW4dZ46257vVHBMhlaYi5DhvIWDzmS8D80HafWQygp1a7otk0hPBedIOI33Y0CzMEvq
	PI5SOKeaT2VyEt10ypYP/vGkQREJLaYI3JMaFrV91oe14/HfThQbgKCH74hh01hohNkE
	p22Va0kAsr5y7S/rx4NtyvKBVMVtNzAR4C2d/ZICbfpCufoAqyZfhkvjsVf8C7JrN1Qn
	M4hg==
X-Gm-Message-State: APjAAAVzfW1wB2BsPQXvU2qKV+WsX5tt4d3H2uCg217S6f9nuckdGWba
	6DCu/vnQW4ldn5pj8FizvpoAgqdk/SKNitcQ
X-Google-Smtp-Source: APXvYqyYUyiJ6wswXUB/Yw5dCtS68CcdXFbIRuRxWUMn+SWBMcx+Q+VUccJ4DPO3LJtpOdbmDzuQIQ==
X-Received: by 2002:a5d:53c2:: with SMTP id a2mr19459494wrw.8.1561981160378;
	Mon, 01 Jul 2019 04:39:20 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id e4sm9399930wme.16.2019.07.01.04.39.19
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 01 Jul 2019 04:39:20 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 1 Jul 2019 13:39:18 +0200
Resent-Message-ID: <20190701113918.GC6950@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1761 seconds by postgrey-1.31 at mail09;
	Fri, 28 Jun 2019 15:00:08 CEST
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 759E51028A6B
	for <drbd-dev@lists.linbit.com>; Fri, 28 Jun 2019 15:00:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NQrLAHec6ZFSeCAw7w8J5S1GYNaZWnqjTjdv38X/dqo=;
	b=FBHE1tLP1XqPvu9XV1YZSBv0AA
	1BX6NruIUfDALUsI/yFKXfeP23MtTtA1djhx1azVtguWE/hrRQNMTyDcq+VRq2pqHjCE/MZz+zxOH
	/YNqiZixsQv5Th8/cuG62h0I61yKT0XvieG+UtWaO4/GsmxXey4EfOio3XWFR42puI3Q6w7Gtrkjy
	ch0KPxpgSi+t9C6H3CVZjw2nlTZSDW4Tcv/R1nPvOESMHqHZ7TftSgL1TrITKfr1mQcY7Jpc6SW5r
	o7hKUcrIG23NP1u2J9+q/dmWs2RXZ0T6qTlX2IfzYSwmKtdigkkprhR5C+yccbqrMEB7oeDPcV1S4
	rvrauXCw==;
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hgq1U-00055P-Fc; Fri, 28 Jun 2019 12:30:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
	(envelope-from <mchehab@bombadil.infradead.org>)
	id 1hgq1S-0005SR-EJ; Fri, 28 Jun 2019 09:30:34 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Date: Fri, 28 Jun 2019 09:30:12 -0300
Message-Id: <a4437f5438f2ce9e220d0910a4d98a832810479b.1561724493.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Cc: Jens Axboe <axboe@kernel.dk>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jiri Kosina <jikos@kernel.org>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	nbd@other.debian.org, Nitin Gupta <ngupta@vflare.org>,
	linux-kselftest@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Mauro Carvalho Chehab <mchehab@infradead.org>,
	Josef Bacik <josef@toxicpanda.com>, Tim Waugh <tim@cyberelk.net>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 19/39] docs: blockdev: add it to the admin-guide
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

The blockdev book basically contains user-faced documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 .../blockdev/drbd/DRBD-8.3-data-packets.svg    |  0
 .../blockdev/drbd/DRBD-data-packets.svg        |  0
 .../blockdev/drbd/conn-states-8.dot            |  0
 .../blockdev/drbd/data-structure-v9.rst        |  0
 .../blockdev/drbd/disk-states-8.dot            |  0
 .../drbd/drbd-connection-state-overview.dot    |  0
 .../blockdev/drbd/figures.rst                  |  0
 .../{ => admin-guide}/blockdev/drbd/index.rst  |  0
 .../blockdev/drbd/node-states-8.dot            |  1 -
 .../{ => admin-guide}/blockdev/floppy.rst      |  0
 .../{ => admin-guide}/blockdev/index.rst       |  2 --
 .../{ => admin-guide}/blockdev/nbd.rst         |  0
 .../{ => admin-guide}/blockdev/paride.rst      |  0
 .../{ => admin-guide}/blockdev/ramdisk.rst     |  0
 .../{ => admin-guide}/blockdev/zram.rst        |  0
 Documentation/admin-guide/index.rst            |  1 +
 .../admin-guide/kernel-parameters.txt          | 18 +++++++++---------
 MAINTAINERS                                    | 10 +++++-----
 drivers/block/Kconfig                          |  8 ++++----
 drivers/block/floppy.c                         |  2 +-
 drivers/block/zram/Kconfig                     |  6 +++---
 tools/testing/selftests/zram/README            |  2 +-
 22 files changed, 24 insertions(+), 26 deletions(-)
 rename Documentation/{ => admin-guide}/blockdev/drbd/DRBD-8.3-data-packets.svg (100%)
 rename Documentation/{ => admin-guide}/blockdev/drbd/DRBD-data-packets.svg (100%)
 rename Documentation/{ => admin-guide}/blockdev/drbd/conn-states-8.dot (100%)
 rename Documentation/{ => admin-guide}/blockdev/drbd/data-structure-v9.rst (100%)
 rename Documentation/{ => admin-guide}/blockdev/drbd/disk-states-8.dot (100%)
 rename Documentation/{ => admin-guide}/blockdev/drbd/drbd-connection-state-overview.dot (100%)
 rename Documentation/{ => admin-guide}/blockdev/drbd/figures.rst (100%)
 rename Documentation/{ => admin-guide}/blockdev/drbd/index.rst (100%)
 rename Documentation/{ => admin-guide}/blockdev/drbd/node-states-8.dot (99%)
 rename Documentation/{ => admin-guide}/blockdev/floppy.rst (100%)
 rename Documentation/{ => admin-guide}/blockdev/index.rst (94%)
 rename Documentation/{ => admin-guide}/blockdev/nbd.rst (100%)
 rename Documentation/{ => admin-guide}/blockdev/paride.rst (100%)
 rename Documentation/{ => admin-guide}/blockdev/ramdisk.rst (100%)
 rename Documentation/{ => admin-guide}/blockdev/zram.rst (100%)

diff --git a/Documentation/blockdev/drbd/DRBD-8.3-data-packets.svg b/Documentation/admin-guide/blockdev/drbd/DRBD-8.3-data-packets.svg
similarity index 100%
rename from Documentation/blockdev/drbd/DRBD-8.3-data-packets.svg
rename to Documentation/admin-guide/blockdev/drbd/DRBD-8.3-data-packets.svg
diff --git a/Documentation/blockdev/drbd/DRBD-data-packets.svg b/Documentation/admin-guide/blockdev/drbd/DRBD-data-packets.svg
similarity index 100%
rename from Documentation/blockdev/drbd/DRBD-data-packets.svg
rename to Documentation/admin-guide/blockdev/drbd/DRBD-data-packets.svg
diff --git a/Documentation/blockdev/drbd/conn-states-8.dot b/Documentation/admin-guide/blockdev/drbd/conn-states-8.dot
similarity index 100%
rename from Documentation/blockdev/drbd/conn-states-8.dot
rename to Documentation/admin-guide/blockdev/drbd/conn-states-8.dot
diff --git a/Documentation/blockdev/drbd/data-structure-v9.rst b/Documentation/admin-guide/blockdev/drbd/data-structure-v9.rst
similarity index 100%
rename from Documentation/blockdev/drbd/data-structure-v9.rst
rename to Documentation/admin-guide/blockdev/drbd/data-structure-v9.rst
diff --git a/Documentation/blockdev/drbd/disk-states-8.dot b/Documentation/admin-guide/blockdev/drbd/disk-states-8.dot
similarity index 100%
rename from Documentation/blockdev/drbd/disk-states-8.dot
rename to Documentation/admin-guide/blockdev/drbd/disk-states-8.dot
diff --git a/Documentation/blockdev/drbd/drbd-connection-state-overview.dot b/Documentation/admin-guide/blockdev/drbd/drbd-connection-state-overview.dot
similarity index 100%
rename from Documentation/blockdev/drbd/drbd-connection-state-overview.dot
rename to Documentation/admin-guide/blockdev/drbd/drbd-connection-state-overview.dot
diff --git a/Documentation/blockdev/drbd/figures.rst b/Documentation/admin-guide/blockdev/drbd/figures.rst
similarity index 100%
rename from Documentation/blockdev/drbd/figures.rst
rename to Documentation/admin-guide/blockdev/drbd/figures.rst
diff --git a/Documentation/blockdev/drbd/index.rst b/Documentation/admin-guide/blockdev/drbd/index.rst
similarity index 100%
rename from Documentation/blockdev/drbd/index.rst
rename to Documentation/admin-guide/blockdev/drbd/index.rst
diff --git a/Documentation/blockdev/drbd/node-states-8.dot b/Documentation/admin-guide/blockdev/drbd/node-states-8.dot
similarity index 99%
rename from Documentation/blockdev/drbd/node-states-8.dot
rename to Documentation/admin-guide/blockdev/drbd/node-states-8.dot
index 4a2b00c23547..bfa54e1f8016 100644
--- a/Documentation/blockdev/drbd/node-states-8.dot
+++ b/Documentation/admin-guide/blockdev/drbd/node-states-8.dot
@@ -11,4 +11,3 @@ digraph peer_states {
 	Unknown   -> Primary           [ label = "connected" ]
 	Unknown   -> Secondary         [ label = "connected" ]
 }
-
diff --git a/Documentation/blockdev/floppy.rst b/Documentation/admin-guide/blockdev/floppy.rst
similarity index 100%
rename from Documentation/blockdev/floppy.rst
rename to Documentation/admin-guide/blockdev/floppy.rst
diff --git a/Documentation/blockdev/index.rst b/Documentation/admin-guide/blockdev/index.rst
similarity index 94%
rename from Documentation/blockdev/index.rst
rename to Documentation/admin-guide/blockdev/index.rst
index a9af6ed8b4aa..20a738d9d047 100644
--- a/Documentation/blockdev/index.rst
+++ b/Documentation/admin-guide/blockdev/index.rst
@@ -1,5 +1,3 @@
-:orphan:
-
 ===========================
 The Linux RapidIO Subsystem
 ===========================
diff --git a/Documentation/blockdev/nbd.rst b/Documentation/admin-guide/blockdev/nbd.rst
similarity index 100%
rename from Documentation/blockdev/nbd.rst
rename to Documentation/admin-guide/blockdev/nbd.rst
diff --git a/Documentation/blockdev/paride.rst b/Documentation/admin-guide/blockdev/paride.rst
similarity index 100%
rename from Documentation/blockdev/paride.rst
rename to Documentation/admin-guide/blockdev/paride.rst
diff --git a/Documentation/blockdev/ramdisk.rst b/Documentation/admin-guide/blockdev/ramdisk.rst
similarity index 100%
rename from Documentation/blockdev/ramdisk.rst
rename to Documentation/admin-guide/blockdev/ramdisk.rst
diff --git a/Documentation/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
similarity index 100%
rename from Documentation/blockdev/zram.rst
rename to Documentation/admin-guide/blockdev/zram.rst
diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 65e821a03aca..c073af461cdf 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -73,6 +73,7 @@ configure specific aspects of kernel behavior to your liking.
    java
    ras
    bcache
+   blockdev/index
    ext4
    pm/index
    thunderbolt
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 9b535c0e22f3..49ad034c4675 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1249,7 +1249,7 @@
 			See also Documentation/fault-injection/.
 
 	floppy=		[HW]
-			See Documentation/blockdev/floppy.rst.
+			See Documentation/admin-guide/blockdev/floppy.rst.
 
 	force_pal_cache_flush
 			[IA-64] Avoid check_sal_cache_flush which may hang on
@@ -2247,7 +2247,7 @@
 	memblock=debug	[KNL] Enable memblock debug messages.
 
 	load_ramdisk=	[RAM] List of ramdisks to load from floppy
-			See Documentation/blockdev/ramdisk.rst.
+			See Documentation/admin-guide/blockdev/ramdisk.rst.
 
 	lockd.nlm_grace_period=P  [NFS] Assign grace period.
 			Format: <integer>
@@ -3294,7 +3294,7 @@
 
 	pcd.		[PARIDE]
 			See header of drivers/block/paride/pcd.c.
-			See also Documentation/blockdev/paride.rst.
+			See also Documentation/admin-guide/blockdev/paride.rst.
 
 	pci=option[,option...]	[PCI] various PCI subsystem options.
 
@@ -3538,7 +3538,7 @@
 			needed on a platform with proper driver support.
 
 	pd.		[PARIDE]
-			See Documentation/blockdev/paride.rst.
+			See Documentation/admin-guide/blockdev/paride.rst.
 
 	pdcchassis=	[PARISC,HW] Disable/Enable PDC Chassis Status codes at
 			boot time.
@@ -3553,10 +3553,10 @@
 			and performance comparison.
 
 	pf.		[PARIDE]
-			See Documentation/blockdev/paride.rst.
+			See Documentation/admin-guide/blockdev/paride.rst.
 
 	pg.		[PARIDE]
-			See Documentation/blockdev/paride.rst.
+			See Documentation/admin-guide/blockdev/paride.rst.
 
 	pirq=		[SMP,APIC] Manual mp-table setup
 			See Documentation/x86/i386/IO-APIC.rst.
@@ -3668,7 +3668,7 @@
 
 	prompt_ramdisk=	[RAM] List of RAM disks to prompt for floppy disk
 			before loading.
-			See Documentation/blockdev/ramdisk.rst.
+			See Documentation/admin-guide/blockdev/ramdisk.rst.
 
 	psi=		[KNL] Enable or disable pressure stall information
 			tracking.
@@ -3690,7 +3690,7 @@
 	pstore.backend=	Specify the name of the pstore backend to use
 
 	pt.		[PARIDE]
-			See Documentation/blockdev/paride.rst.
+			See Documentation/admin-guide/blockdev/paride.rst.
 
 	pti=		[X86_64] Control Page Table Isolation of user and
 			kernel address spaces.  Disabling this feature
@@ -3719,7 +3719,7 @@
 			See Documentation/admin-guide/md.rst.
 
 	ramdisk_size=	[RAM] Sizes of RAM disks in kilobytes
-			See Documentation/blockdev/ramdisk.rst.
+			See Documentation/admin-guide/blockdev/ramdisk.rst.
 
 	random.trust_cpu={on,off}
 			[KNL] Enable or disable trusting the use of the
diff --git a/MAINTAINERS b/MAINTAINERS
index 4c622a19ab7d..3f0f654d1166 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4974,7 +4974,7 @@ T:	git git://git.linbit.com/drbd-8.4.git
 S:	Supported
 F:	drivers/block/drbd/
 F:	lib/lru_cache.c
-F:	Documentation/blockdev/drbd/
+F:	Documentation/admin-guide/blockdev/
 
 DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
@@ -11024,7 +11024,7 @@ M:	Josef Bacik <josef@toxicpanda.com>
 S:	Maintained
 L:	linux-block@vger.kernel.org
 L:	nbd@other.debian.org
-F:	Documentation/blockdev/nbd.rst
+F:	Documentation/admin-guide/blockdev/nbd.rst
 F:	drivers/block/nbd.c
 F:	include/trace/events/nbd.h
 F:	include/uapi/linux/nbd.h
@@ -12028,7 +12028,7 @@ PARIDE DRIVERS FOR PARALLEL PORT IDE DEVICES
 M:	Tim Waugh <tim@cyberelk.net>
 L:	linux-parport@lists.infradead.org (subscribers-only)
 S:	Maintained
-F:	Documentation/blockdev/paride.rst
+F:	Documentation/admin-guide/blockdev/paride.rst
 F:	drivers/block/paride/
 
 PARISC ARCHITECTURE
@@ -13310,7 +13310,7 @@ F:	drivers/net/wireless/ralink/rt2x00/
 RAMDISK RAM BLOCK DEVICE DRIVER
 M:	Jens Axboe <axboe@kernel.dk>
 S:	Maintained
-F:	Documentation/blockdev/ramdisk.rst
+F:	Documentation/admin-guide/blockdev/ramdisk.rst
 F:	drivers/block/brd.c
 
 RANCHU VIRTUAL BOARD FOR MIPS
@@ -17672,7 +17672,7 @@ R:	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	drivers/block/zram/
-F:	Documentation/blockdev/zram.rst
+F:	Documentation/admin-guide/blockdev/zram.rst
 
 ZS DECSTATION Z85C30 SERIAL DRIVER
 M:	"Maciej W. Rozycki" <macro@linux-mips.org>
diff --git a/drivers/block/Kconfig b/drivers/block/Kconfig
index c43690b973d8..1bb8ec575352 100644
--- a/drivers/block/Kconfig
+++ b/drivers/block/Kconfig
@@ -31,7 +31,7 @@ config BLK_DEV_FD
 	  If you want to use the floppy disk drive(s) of your PC under Linux,
 	  say Y. Information about this driver, especially important for IBM
 	  Thinkpad users, is contained in
-	  <file:Documentation/blockdev/floppy.rst>.
+	  <file:Documentation/admin-guide/blockdev/floppy.rst>.
 	  That file also contains the location of the Floppy driver FAQ as
 	  well as location of the fdutils package used to configure additional
 	  parameters of the driver at run time.
@@ -96,7 +96,7 @@ config PARIDE
 	  your computer's parallel port. Most of them are actually IDE devices
 	  using a parallel port IDE adapter. This option enables the PARIDE
 	  subsystem which contains drivers for many of these external drives.
-	  Read <file:Documentation/blockdev/paride.rst> for more information.
+	  Read <file:Documentation/admin-guide/blockdev/paride.rst> for more information.
 
 	  If you have said Y to the "Parallel-port support" configuration
 	  option, you may share a single port between your printer and other
@@ -261,7 +261,7 @@ config BLK_DEV_NBD
 	  userland (making server and client physically the same computer,
 	  communicating using the loopback network device).
 
-	  Read <file:Documentation/blockdev/nbd.rst> for more information,
+	  Read <file:Documentation/admin-guide/blockdev/nbd.rst> for more information,
 	  especially about where to find the server code, which runs in user
 	  space and does not need special kernel support.
 
@@ -303,7 +303,7 @@ config BLK_DEV_RAM
 	  during the initial install of Linux.
 
 	  Note that the kernel command line option "ramdisk=XX" is now obsolete.
-	  For details, read <file:Documentation/blockdev/ramdisk.rst>.
+	  For details, read <file:Documentation/admin-guide/blockdev/ramdisk.rst>.
 
 	  To compile this driver as a module, choose M here: the
 	  module will be called brd. An alias "rd" has been defined
diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index 5c99e52f9dc1..f652c1ac3ae9 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4424,7 +4424,7 @@ static int __init floppy_setup(char *str)
 		pr_cont("\n");
 	} else
 		DPRINT("botched floppy option\n");
-	DPRINT("Read Documentation/blockdev/floppy.rst\n");
+	DPRINT("Read Documentation/admin-guide/blockdev/floppy.rst\n");
 	return 0;
 }
 
diff --git a/drivers/block/zram/Kconfig b/drivers/block/zram/Kconfig
index e06b99d54816..fe7a4b7d30cf 100644
--- a/drivers/block/zram/Kconfig
+++ b/drivers/block/zram/Kconfig
@@ -12,7 +12,7 @@ config ZRAM
 	  It has several use cases, for example: /tmp storage, use as swap
 	  disks and maybe many more.
 
-	  See Documentation/blockdev/zram.rst for more information.
+	  See Documentation/admin-guide/blockdev/zram.rst for more information.
 
 config ZRAM_WRITEBACK
        bool "Write back incompressible or idle page to backing device"
@@ -26,7 +26,7 @@ config ZRAM_WRITEBACK
 	 With /sys/block/zramX/{idle,writeback}, application could ask
 	 idle page's writeback to the backing device to save in memory.
 
-	 See Documentation/blockdev/zram.rst for more information.
+	 See Documentation/admin-guide/blockdev/zram.rst for more information.
 
 config ZRAM_MEMORY_TRACKING
 	bool "Track zRam block status"
@@ -36,4 +36,4 @@ config ZRAM_MEMORY_TRACKING
 	  of zRAM. Admin could see the information via
 	  /sys/kernel/debug/zram/zramX/block_state.
 
-	  See Documentation/blockdev/zram.rst for more information.
+	  See Documentation/admin-guide/blockdev/zram.rst for more information.
diff --git a/tools/testing/selftests/zram/README b/tools/testing/selftests/zram/README
index 5fa378391d3b..110b34834a6f 100644
--- a/tools/testing/selftests/zram/README
+++ b/tools/testing/selftests/zram/README
@@ -37,4 +37,4 @@ Commands required for testing:
  - mkfs/ mkfs.ext4
 
 For more information please refer:
-kernel-source-tree/Documentation/blockdev/zram.rst
+kernel-source-tree/Documentation/admin-guide/blockdev/zram.rst
-- 
2.21.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
