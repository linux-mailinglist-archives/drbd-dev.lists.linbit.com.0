Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7614C724A
	for <lists+drbd-dev@lfdr.de>; Mon, 28 Feb 2022 18:13:52 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 981AF42177F;
	Mon, 28 Feb 2022 18:13:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
	[209.85.218.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A6D0E4201F2
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 12:08:56 +0100 (CET)
Received: by mail-ej1-f51.google.com with SMTP id vz16so24083847ejb.0
	for <drbd-dev@lists.linbit.com>; Mon, 28 Feb 2022 03:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sNYkGUT1b39g11ICdbmY5PrBerSJts/Bm2Fwecgn+7Q=;
	b=SG7X651hZKMvfAijAjNUODidn7ro9rS5bzCj/5cDImBaS5a1Qtotnd0xvbaBDCL4jA
	4xEzq95SKk90hMirwVISFDpnE1c+M6BGkBGYK/iCPR3I3GgeuxGBVATFL/mbvlw4g/oj
	bO1MgjkGBLHU4lSziwM8CSSY6Rf7Go9XXWkOm7Wr/HOgKnPx8WpGK4RuoYvpaOrVauor
	62cYY7x66WWO/1B7l5U8/t6d4bhYKpm9vGkEnowzG5LRT1I0tjFH2l5pQXcOBIFLcyDt
	HIkOp6gurQ5ZB50JFtpyyHWF/V8dvxeQ1dAOOjgYayX1+s/xpsPtqJBQ0NDidsMDIrIl
	46qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sNYkGUT1b39g11ICdbmY5PrBerSJts/Bm2Fwecgn+7Q=;
	b=4ZlxaT92HAKKcfGNRpeBA5Sb2Aq4rgapyTQsoFgTFd9LfzUQcdVssj5PIsd6PTXHyX
	N+M4eyAca/J6tdUxQyPvxmr28ZHHGxi/wj6gXne7PfUZ09eF4mObwyWH61rpRvbe4RCt
	LeZuukXv983/M4a9crAMSu2fxGY1Upnm6l3zkymrjo+96Rqwac6Tua/k/YDU+ntNPiZ/
	TXWM5old6qoQlBHxY996jiQjqgYnldaWPtXUVaXA30K12bOm2O7eOgqkBfUmOTPpQcwd
	X+mTELbkt2r27ry1swzr2P6dnigoeSRNGSyGrZJCag/k6qXombrRDubVNYziOEnjiYud
	5aYA==
X-Gm-Message-State: AOAM531Vli8kHFpOyHLZDSQKN6LVLF7wWKcDF1tMWo3rjOugGgMqlkqF
	1xr9kBy1MN80NfXDRyQyesU=
X-Google-Smtp-Source: ABdhPJzb2IicnaS2bEVPvOWjl8uhSqTZxOfebaMPruujktD/AHD7IBcvO2+N0N5JDSsC/IlMBvCxrA==
X-Received: by 2002:a17:906:264d:b0:6b1:13e0:9981 with SMTP id
	i13-20020a170906264d00b006b113e09981mr14248136ejc.611.1646046536214;
	Mon, 28 Feb 2022 03:08:56 -0800 (PST)
Received: from localhost.localdomain (dhcp-077-250-038-153.chello.nl.
	[77.250.38.153]) by smtp.googlemail.com with ESMTPSA id
	z22-20020a17090655d600b006d229436793sm4209049ejp.223.2022.02.28.03.08.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 28 Feb 2022 03:08:55 -0800 (PST)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Feb 2022 12:08:18 +0100
Message-Id: <20220228110822.491923-3-jakobkoschel@gmail.com>
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
Subject: [Drbd-dev] [PATCH 2/6] treewide: remove using list iterator after
	loop body as a ptr
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

If the list does not contain the expected element, the value of
list_for_each_entry() iterator will not point to a valid structure.
To avoid type confusion in such case, the list iterator
scope will be limited to list_for_each_entry() loop.

In preparation to limiting scope of a list iterator to the list traversal
loop, use a dedicated pointer to point to the found element.
Determining if an element was found is then simply checking if
the pointer is != NULL.

Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 arch/x86/kernel/cpu/sgx/encl.c       |  6 +++--
 drivers/scsi/scsi_transport_sas.c    | 17 ++++++++-----
 drivers/thermal/thermal_core.c       | 38 ++++++++++++++++++----------
 drivers/usb/gadget/configfs.c        | 22 ++++++++++------
 drivers/usb/gadget/udc/max3420_udc.c | 11 +++++---
 drivers/usb/gadget/udc/tegra-xudc.c  | 11 +++++---
 drivers/usb/mtu3/mtu3_gadget.c       | 11 +++++---
 drivers/usb/musb/musb_gadget.c       | 11 +++++---
 drivers/vfio/mdev/mdev_core.c        | 11 +++++---
 9 files changed, 88 insertions(+), 50 deletions(-)

diff --git a/arch/x86/kernel/cpu/sgx/encl.c b/arch/x86/kernel/cpu/sgx/encl.c
index 48afe96ae0f0..6c916416decc 100644
--- a/arch/x86/kernel/cpu/sgx/encl.c
+++ b/arch/x86/kernel/cpu/sgx/encl.c
@@ -450,7 +450,8 @@ static void sgx_mmu_notifier_release(struct mmu_notifier *mn,
 				     struct mm_struct *mm)
 {
 	struct sgx_encl_mm *encl_mm = container_of(mn, struct sgx_encl_mm, mmu_notifier);
-	struct sgx_encl_mm *tmp = NULL;
+	struct sgx_encl_mm *found_encl_mm = NULL;
+	struct sgx_encl_mm *tmp;

 	/*
 	 * The enclave itself can remove encl_mm.  Note, objects can't be moved
@@ -460,12 +461,13 @@ static void sgx_mmu_notifier_release(struct mmu_notifier *mn,
 	list_for_each_entry(tmp, &encl_mm->encl->mm_list, list) {
 		if (tmp == encl_mm) {
 			list_del_rcu(&encl_mm->list);
+			found_encl_mm = tmp;
 			break;
 		}
 	}
 	spin_unlock(&encl_mm->encl->mm_lock);

-	if (tmp == encl_mm) {
+	if (found_encl_mm) {
 		synchronize_srcu(&encl_mm->encl->srcu);
 		mmu_notifier_put(mn);
 	}
diff --git a/drivers/scsi/scsi_transport_sas.c b/drivers/scsi/scsi_transport_sas.c
index 4ee578b181da..a8cbd90db9d2 100644
--- a/drivers/scsi/scsi_transport_sas.c
+++ b/drivers/scsi/scsi_transport_sas.c
@@ -1060,26 +1060,29 @@ EXPORT_SYMBOL(sas_port_get_phy);
  * connected to a remote device is a port, so ports must be formed on
  * all devices with phys if they're connected to anything.
  */
-void sas_port_add_phy(struct sas_port *port, struct sas_phy *phy)
+void sas_port_add_phy(struct sas_port *port, struct sas_phy *_phy)
 {
 	mutex_lock(&port->phy_list_mutex);
-	if (unlikely(!list_empty(&phy->port_siblings))) {
+	if (unlikely(!list_empty(&_phy->port_siblings))) {
 		/* make sure we're already on this port */
+		struct sas_phy *phy = NULL;
 		struct sas_phy *tmp;

 		list_for_each_entry(tmp, &port->phy_list, port_siblings)
-			if (tmp == phy)
+			if (tmp == _phy) {
+				phy = tmp;
 				break;
+			}
 		/* If this trips, you added a phy that was already
 		 * part of a different port */
-		if (unlikely(tmp != phy)) {
+		if (unlikely(!phy)) {
 			dev_printk(KERN_ERR, &port->dev, "trying to add phy %s fails: it's already part of another port\n",
-				   dev_name(&phy->dev));
+				   dev_name(&_phy->dev));
 			BUG();
 		}
 	} else {
-		sas_port_create_link(port, phy);
-		list_add_tail(&phy->port_siblings, &port->phy_list);
+		sas_port_create_link(port, _phy);
+		list_add_tail(&_phy->port_siblings, &port->phy_list);
 		port->num_phys++;
 	}
 	mutex_unlock(&port->phy_list_mutex);
diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 82654dc8382b..97198543448b 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -625,24 +625,30 @@ int thermal_zone_bind_cooling_device(struct thermal_zone_device *tz,
 {
 	struct thermal_instance *dev;
 	struct thermal_instance *pos;
-	struct thermal_zone_device *pos1;
-	struct thermal_cooling_device *pos2;
+	struct thermal_zone_device *pos1 = NULL;
+	struct thermal_zone_device *tmp1;
+	struct thermal_cooling_device *pos2 = NULL;
+	struct thermal_cooling_device *tmp2;
 	unsigned long max_state;
 	int result, ret;

 	if (trip >= tz->trips || trip < 0)
 		return -EINVAL;

-	list_for_each_entry(pos1, &thermal_tz_list, node) {
-		if (pos1 == tz)
+	list_for_each_entry(tmp1, &thermal_tz_list, node) {
+		if (tmp1 == tz) {
+			pos1 = tmp1;
 			break;
+		}
 	}
-	list_for_each_entry(pos2, &thermal_cdev_list, node) {
-		if (pos2 == cdev)
+	list_for_each_entry(tmp2, &thermal_cdev_list, node) {
+		if (tmp2 == cdev) {
+			pos2 = tmp2;
 			break;
+		}
 	}

-	if (tz != pos1 || cdev != pos2)
+	if (!pos1 || !pos2)
 		return -EINVAL;

 	ret = cdev->ops->get_max_state(cdev, &max_state);
@@ -1074,15 +1080,18 @@ void thermal_cooling_device_unregister(struct thermal_cooling_device *cdev)
 	const struct thermal_zone_params *tzp;
 	struct thermal_zone_device *tz;
 	struct thermal_cooling_device *pos = NULL;
+	struct thermal_cooling_device *tmp;

 	if (!cdev)
 		return;

 	mutex_lock(&thermal_list_lock);
-	list_for_each_entry(pos, &thermal_cdev_list, node)
-		if (pos == cdev)
+	list_for_each_entry(tmp, &thermal_cdev_list, node)
+		if (tmp == cdev) {
+			pos = tmp;
 			break;
-	if (pos != cdev) {
+		}
+	if (!pos) {
 		/* thermal cooling device not found */
 		mutex_unlock(&thermal_list_lock);
 		return;
@@ -1335,6 +1344,7 @@ void thermal_zone_device_unregister(struct thermal_zone_device *tz)
 	const struct thermal_zone_params *tzp;
 	struct thermal_cooling_device *cdev;
 	struct thermal_zone_device *pos = NULL;
+	struct thermal_zone_device *tmp;

 	if (!tz)
 		return;
@@ -1343,10 +1353,12 @@ void thermal_zone_device_unregister(struct thermal_zone_device *tz)
 	tz_id = tz->id;

 	mutex_lock(&thermal_list_lock);
-	list_for_each_entry(pos, &thermal_tz_list, node)
-		if (pos == tz)
+	list_for_each_entry(tmp, &thermal_tz_list, node)
+		if (tmp == tz) {
+			pos = tmp;
 			break;
-	if (pos != tz) {
+		}
+	if (!pos) {
 		/* thermal zone device not found */
 		mutex_unlock(&thermal_list_lock);
 		return;
diff --git a/drivers/usb/gadget/configfs.c b/drivers/usb/gadget/configfs.c
index d4a678c0806e..99f10cbd8878 100644
--- a/drivers/usb/gadget/configfs.c
+++ b/drivers/usb/gadget/configfs.c
@@ -418,7 +418,8 @@ static int config_usb_cfg_link(

 	struct usb_function_instance *fi =
 			to_usb_function_instance(usb_func_ci);
-	struct usb_function_instance *a_fi;
+	struct usb_function_instance *a_fi = NULL;
+	struct usb_function_instance *tmp;
 	struct usb_function *f;
 	int ret;

@@ -428,11 +429,13 @@ static int config_usb_cfg_link(
 	 * from another gadget or a random directory.
 	 * Also a function instance can only be linked once.
 	 */
-	list_for_each_entry(a_fi, &gi->available_func, cfs_list) {
-		if (a_fi == fi)
+	list_for_each_entry(tmp, &gi->available_func, cfs_list) {
+		if (tmp == fi) {
+			a_fi = tmp;
 			break;
+		}
 	}
-	if (a_fi != fi) {
+	if (!a_fi) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -882,15 +885,18 @@ static int os_desc_link(struct config_item *os_desc_ci,
 	struct gadget_info *gi = os_desc_item_to_gadget_info(os_desc_ci);
 	struct usb_composite_dev *cdev = &gi->cdev;
 	struct config_usb_cfg *c_target = to_config_usb_cfg(usb_cfg_ci);
-	struct usb_configuration *c;
+	struct usb_configuration *c = NULL;
+	struct usb_configuration *tmp;
 	int ret;

 	mutex_lock(&gi->lock);
-	list_for_each_entry(c, &cdev->configs, list) {
-		if (c == &c_target->c)
+	list_for_each_entry(tmp, &cdev->configs, list) {
+		if (tmp == &c_target->c) {
+			c = tmp;
 			break;
+		}
 	}
-	if (c != &c_target->c) {
+	if (!c) {
 		ret = -EINVAL;
 		goto out;
 	}
diff --git a/drivers/usb/gadget/udc/max3420_udc.c b/drivers/usb/gadget/udc/max3420_udc.c
index d2a2b20cc1ad..d1b010b5f4a0 100644
--- a/drivers/usb/gadget/udc/max3420_udc.c
+++ b/drivers/usb/gadget/udc/max3420_udc.c
@@ -1044,22 +1044,25 @@ static int max3420_ep_queue(struct usb_ep *_ep, struct usb_request *_req,

 static int max3420_ep_dequeue(struct usb_ep *_ep, struct usb_request *_req)
 {
-	struct max3420_req *t, *req = to_max3420_req(_req);
+	struct max3420_req *t = NULL;
+	struct max3420_req *req = to_max3420_req(_req);
+	struct max3420_req *tmp;
 	struct max3420_ep *ep = to_max3420_ep(_ep);
 	unsigned long flags;

 	spin_lock_irqsave(&ep->lock, flags);

 	/* Pluck the descriptor from queue */
-	list_for_each_entry(t, &ep->queue, queue)
-		if (t == req) {
+	list_for_each_entry(tmp, &ep->queue, queue)
+		if (tmp == req) {
 			list_del_init(&req->queue);
+			t = tmp;
 			break;
 		}

 	spin_unlock_irqrestore(&ep->lock, flags);

-	if (t == req)
+	if (t)
 		max3420_req_done(req, -ECONNRESET);

 	return 0;
diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 43f1b0d461c1..c37e3148a208 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -1413,18 +1413,21 @@ __tegra_xudc_ep_dequeue(struct tegra_xudc_ep *ep,
 			struct tegra_xudc_request *req)
 {
 	struct tegra_xudc *xudc = ep->xudc;
-	struct tegra_xudc_request *r;
+	struct tegra_xudc_request *r = NULL;
+	struct tegra_xudc_request *tmp;
 	struct tegra_xudc_trb *deq_trb;
 	bool busy, kick_queue = false;
 	int ret = 0;

 	/* Make sure the request is actually queued to this endpoint. */
-	list_for_each_entry(r, &ep->queue, list) {
-		if (r == req)
+	list_for_each_entry(tmp, &ep->queue, list) {
+		if (tmp == req) {
+			r = tmp;
 			break;
+		}
 	}

-	if (r != req)
+	if (!r)
 		return -EINVAL;

 	/* Request hasn't been queued in the transfer ring yet. */
diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 9977600616d7..2e4daaa081a0 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -323,7 +323,8 @@ static int mtu3_gadget_dequeue(struct usb_ep *ep, struct usb_request *req)
 {
 	struct mtu3_ep *mep = to_mtu3_ep(ep);
 	struct mtu3_request *mreq = to_mtu3_request(req);
-	struct mtu3_request *r;
+	struct mtu3_request *r = NULL;
+	struct mtu3_request *tmp;
 	struct mtu3 *mtu = mep->mtu;
 	unsigned long flags;
 	int ret = 0;
@@ -336,11 +337,13 @@ static int mtu3_gadget_dequeue(struct usb_ep *ep, struct usb_request *req)

 	spin_lock_irqsave(&mtu->lock, flags);

-	list_for_each_entry(r, &mep->req_list, list) {
-		if (r == mreq)
+	list_for_each_entry(tmp, &mep->req_list, list) {
+		if (tmp == mreq) {
+			r = tmp;
 			break;
+		}
 	}
-	if (r != mreq) {
+	if (!r) {
 		dev_dbg(mtu->dev, "req=%p not queued to %s\n", req, ep->name);
 		ret = -EINVAL;
 		goto done;
diff --git a/drivers/usb/musb/musb_gadget.c b/drivers/usb/musb/musb_gadget.c
index 51274b87f46c..26b61ad7ab1b 100644
--- a/drivers/usb/musb/musb_gadget.c
+++ b/drivers/usb/musb/musb_gadget.c
@@ -1266,7 +1266,8 @@ static int musb_gadget_dequeue(struct usb_ep *ep, struct usb_request *request)
 {
 	struct musb_ep		*musb_ep = to_musb_ep(ep);
 	struct musb_request	*req = to_musb_request(request);
-	struct musb_request	*r;
+	struct musb_request	*r = NULL;
+	struct musb_request	*tmp;
 	unsigned long		flags;
 	int			status = 0;
 	struct musb		*musb = musb_ep->musb;
@@ -1278,11 +1279,13 @@ static int musb_gadget_dequeue(struct usb_ep *ep, struct usb_request *request)

 	spin_lock_irqsave(&musb->lock, flags);

-	list_for_each_entry(r, &musb_ep->req_list, list) {
-		if (r == req)
+	list_for_each_entry(tmp, &musb_ep->req_list, list) {
+		if (tmp == req) {
+			r = tmp;
 			break;
+		}
 	}
-	if (r != req) {
+	if (!r) {
 		dev_err(musb->controller, "request %p not queued to %s\n",
 				request, ep->name);
 		status = -EINVAL;
diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
index b314101237fe..52cfa44c24a7 100644
--- a/drivers/vfio/mdev/mdev_core.c
+++ b/drivers/vfio/mdev/mdev_core.c
@@ -337,16 +337,19 @@ int mdev_device_create(struct mdev_type *type, const guid_t *uuid)

 int mdev_device_remove(struct mdev_device *mdev)
 {
-	struct mdev_device *tmp;
+	struct mdev_device *tmp = NULL;
+	struct mdev_device *iter;
 	struct mdev_parent *parent = mdev->type->parent;

 	mutex_lock(&mdev_list_lock);
-	list_for_each_entry(tmp, &mdev_list, next) {
-		if (tmp == mdev)
+	list_for_each_entry(iter, &mdev_list, next) {
+		if (iter == mdev) {
+			tmp = iter;
 			break;
+		}
 	}

-	if (tmp != mdev) {
+	if (!tmp) {
 		mutex_unlock(&mdev_list_lock);
 		return -ENODEV;
 	}
--
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
