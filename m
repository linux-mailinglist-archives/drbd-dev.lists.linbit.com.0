Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0364C724B
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 18:13:53 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C468E421783;
	Mon, 28 Feb 2022 18:13:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
	[209.85.218.52])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4B2EB420347
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 12:08:58 +0100 (CET)
Received: by mail-ej1-f52.google.com with SMTP id qx21so23946499ejb.13
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 03:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HpiN/zwO1wBD5W8vJ5qwHzWs2Mz8GYwVSPoaDyTc8jQ=;
	b=hjvTHeqAC17Nm2rqJFqOWVUlo+eMrb6KCGjEjnmUhT0UbOoSD99k2xAziOpWZa+Icu
	SPp4Zg1lqK8FLNpUHi/iGpToynAZh7AAx7I6BqkiBOWQWPIrLjejJ7mt0E6lp79jr43P
	Z8Tz3UxSCHK1qzDcri6ZY14M8lx9G0bi6GCGQHl0DVbHpgXti6eqzCprjBZYIcyI1uce
	Dn/lOukn9J64/ASqyssuY+hk5ExgHfhAh8xyytTN1bW2SLq53AUCqmHXOqxQHzvGm8yg
	Hb8Tr+NdyPNcInoLFcy82stmYANyPP1+b2zh81uncpq/hmnHTquj2t004aepXQhNWxPC
	QShA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HpiN/zwO1wBD5W8vJ5qwHzWs2Mz8GYwVSPoaDyTc8jQ=;
	b=W8+MbPQd+LA069ZVPVe4GFPmBg/B+KoflV4wkSRt9F6fRTlO4Nq4osM4V8eJu/cc+q
	hh0Mvb0PJx51CCIge96KJbtSEoafXsdYMOfuU+EaACQKx7PZUToo3yTza8rSkj+h5V5I
	qu4ZQLqe1Dns22V6LrKbb9Vayi5O+/Eg7E381voXskC5upr/AGdLFt31Ubz3y7z41kKD
	KlnHfbHmc7MIaG974PE9AlKwCTMpnt3RbuP3RADLZmjroKbdfhK21Kn/MFVialdPq3Lf
	Fml3nTUYcC/ycg5O19bHPdFOxx5jZZzosd3F83HK0TcCgW5o7nGsCYfOh2Ugd+KuPL6X
	Qnnw==
X-Gm-Message-State: AOAM533SHUYyNl+1hV3kE9Ejkdtb3SJ43/3vzs1q6hODrdpFAH3JwgNz
	Jk5SzwRVes71rYDerKKw4hM=
X-Google-Smtp-Source: ABdhPJwIz1+OuMm91LqO5/9SwgL6U3RC8rZg6hPrO7zQUYJxh0T24GQzaSGRh+uNCyYPoPAvBQZaKw==
X-Received: by 2002:a17:906:3803:b0:6cf:56b9:60a9 with SMTP id
	v3-20020a170906380300b006cf56b960a9mr14108161ejc.716.1646046537823;
	Mon, 28 Feb 2022 03:08:57 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl.
	[77.250.38.153]) by smtp.googlemail.com with ESMTPSA id
	z22-20020a17090655d600b006d229436793sm4209049ejp.223.2022.02.28.03.08.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Feb 2022 03:08:57 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:08:19 +0100
Message-Id: <20220228110822.491923-4-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220228110822.491923-1-jakobkoschel@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Feb 2022 18:13:47 +0100
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
	amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
	linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
	linux-arch <linux-arch@vger.kernel.org>,
	linux-cifs@vger.kernel.org, kvm@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
	Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
	kgdb-bugreport@lists.sourceforge.net,
	bcm-kernel-feedback-list@broadcom.com,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Arnd Bergman <arnd@arndb.de>, linux-pm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
	linux-block@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	tipc-discussion@lists.sourceforge.net,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Subject: [Drbd-dev] [PATCH 3/6] treewide: fix incorrect use to determine if
	list is empty
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

The list iterator value will *always* be set by list_for_each_entry().
It is incorrect to assume that the iterator value will be NULL if the
list is empty.

Instead of checking the pointer it should be checked if
the list is empty.
In acpi_get_pmu_hw_inf() instead of setting the pointer to NULL
on the break, it is set to the correct value and leaving it
NULL if no element was found.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 arch/powerpc/sysdev/fsl_gtm.c            |  4 ++--
 drivers/media/pci/saa7134/saa7134-alsa.c |  4 ++--
 drivers/perf/xgene_pmu.c                 | 13 +++++++------
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_gtm.c b/arch/powerpc/sysdev/fsl_gtm.c
index 8963eaffb1b7..39186ad6b3c3 100644
--- a/arch/powerpc/sysdev/fsl_gtm.c
+++ b/arch/powerpc/sysdev/fsl_gtm.c
@@ -86,7 +86,7 @@ static LIST_HEAD(gtms);
  */
 struct gtm_timer *gtm_get_timer16(void)
 {
-	struct gtm *gtm = NULL;
+	struct gtm *gtm;
 	int i;

 	list_for_each_entry(gtm, &gtms, list_node) {
@@ -103,7 +103,7 @@ struct gtm_timer *gtm_get_timer16(void)
 		spin_unlock_irq(&gtm->lock);
 	}

-	if (gtm)
+	if (!list_empty(&gtms))
 		return ERR_PTR(-EBUSY);
 	return ERR_PTR(-ENODEV);
 }
diff --git a/drivers/media/pci/saa7134/saa7134-alsa.c b/drivers/media/pci/saa7134/saa7134-alsa.c
index fb24d2ed3621..d3cde05a6eba 100644
--- a/drivers/media/pci/saa7134/saa7134-alsa.c
+++ b/drivers/media/pci/saa7134/saa7134-alsa.c
@@ -1214,7 +1214,7 @@ static int alsa_device_exit(struct saa7134_dev *dev)

 static int saa7134_alsa_init(void)
 {
-	struct saa7134_dev *dev = NULL;
+	struct saa7134_dev *dev;

 	saa7134_dmasound_init = alsa_device_init;
 	saa7134_dmasound_exit = alsa_device_exit;
@@ -1229,7 +1229,7 @@ static int saa7134_alsa_init(void)
 			alsa_device_init(dev);
 	}

-	if (dev == NULL)
+	if (list_empty(&saa7134_devlist))
 		pr_info("saa7134 ALSA: no saa7134 cards found\n");

 	return 0;
diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
index 2b6d476bd213..e255f9e665d1 100644
--- a/drivers/perf/xgene_pmu.c
+++ b/drivers/perf/xgene_pmu.c
@@ -1460,7 +1460,8 @@ xgene_pmu_dev_ctx *acpi_get_pmu_hw_inf(struct xgene_pmu *xgene_pmu,
 	struct hw_pmu_info *inf;
 	void __iomem *dev_csr;
 	struct resource res;
-	struct resource_entry *rentry;
+	struct resource_entry *rentry = NULL;
+	struct resource_entry *tmp;
 	int enable_bit;
 	int rc;

@@ -1475,16 +1476,16 @@ xgene_pmu_dev_ctx *acpi_get_pmu_hw_inf(struct xgene_pmu *xgene_pmu,
 		return NULL;
 	}

-	list_for_each_entry(rentry, &resource_list, node) {
-		if (resource_type(rentry->res) == IORESOURCE_MEM) {
-			res = *rentry->res;
-			rentry = NULL;
+	list_for_each_entry(tmp, &resource_list, node) {
+		if (resource_type(tmp->res) == IORESOURCE_MEM) {
+			res = *tmp->res;
+			rentry = tmp;
 			break;
 		}
 	}
 	acpi_dev_free_resource_list(&resource_list);

-	if (rentry) {
+	if (!rentry) {
 		dev_err(dev, "PMU type %d: No memory resource found\n", type);
 		return NULL;
 	}
--
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
