Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD8A3FC29A
	for <lists+drbd-dev@lfdr.de>; Tue, 31 Aug 2021 08:16:49 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B4A442063C;
	Tue, 31 Aug 2021 08:16:46 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9AE0242061C
	for <drbd-dev@lists.linbit.com>; Tue, 31 Aug 2021 00:59:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=CdTBRsaYmbzthSsnr1IHgRONpjN45dt2OX2o5Pnpc8g=;
	b=QasochLjWuM/fWpbETjT6NRbPr
	jfBiK5VwLfIJLoWFuBDobLG0VuaW/VrXeFne17kWgnub6DKaB5HOmSLj+TExBMY7p705/kWPmq7Cg
	Qx1qXY792zeAPeh0Cd7MRmODdYJ3V3T709fCv3hs0ujOcYEZAAlX9YW5Z0qLxllo5U6TtKwKz42mT
	uyHWs8g3lD4MGPTDIA+ODF/jlhhll9cP5kJTOFMVvDpwYdCHv1FfIelCuRk2y7clnkeqkQNVa5ekJ
	u9icDGdRpVier9ReP4wtRJkZ86LbLuJ+QSNqXppwK8oi0r1tZ4iDgDP52S6wOXrfI8Hft2gbpfP/g
	kj1KP+XQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mKpTk-000khU-2S; Mon, 30 Aug 2021 22:10:08 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 30 Aug 2021 15:09:53 -0700
Message-Id: <20210830221000.179369-9-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830221000.179369-1-mcgrof@kernel.org>
References: <20210830221000.179369-1-mcgrof@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Aug 2021 08:16:44 +0200
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, Christoph Hellwig <hch@lst.de>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 08/15] pcd: move the identify buffer into
	pcd_identify
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

From: Christoph Hellwig <hch@lst.de>

No need to pass it through a bunch of functions.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/paride/pcd.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
index f9cdd11f02f5..8903fdaa2046 100644
--- a/drivers/block/paride/pcd.c
+++ b/drivers/block/paride/pcd.c
@@ -630,10 +630,11 @@ static int pcd_drive_status(struct cdrom_device_info *cdi, int slot_nr)
 	return CDS_DISC_OK;
 }
 
-static int pcd_identify(struct pcd_unit *cd, char *id)
+static int pcd_identify(struct pcd_unit *cd)
 {
-	int k, s;
 	char id_cmd[12] = { 0x12, 0, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0 };
+	char id[18];
+	int k, s;
 
 	pcd_bufblk = -1;
 
@@ -664,15 +665,15 @@ static int pcd_identify(struct pcd_unit *cd, char *id)
  * returns  0, with id set if drive is detected
  *	    -1, if drive detection failed
  */
-static int pcd_probe(struct pcd_unit *cd, int ms, char *id)
+static int pcd_probe(struct pcd_unit *cd, int ms)
 {
 	if (ms == -1) {
 		for (cd->drive = 0; cd->drive <= 1; cd->drive++)
-			if (!pcd_reset(cd) && !pcd_identify(cd, id))
+			if (!pcd_reset(cd) && !pcd_identify(cd))
 				return 0;
 	} else {
 		cd->drive = ms;
-		if (!pcd_reset(cd) && !pcd_identify(cd, id))
+		if (!pcd_reset(cd) && !pcd_identify(cd))
 			return 0;
 	}
 	return -1;
@@ -709,7 +710,6 @@ static void pcd_probe_capabilities(void)
 
 static int pcd_detect(void)
 {
-	char id[18];
 	int k, unit;
 	struct pcd_unit *cd;
 
@@ -727,7 +727,7 @@ static int pcd_detect(void)
 		cd = pcd;
 		if (cd->disk && pi_init(cd->pi, 1, -1, -1, -1, -1, -1,
 			    pcd_buffer, PI_PCD, verbose, cd->name)) {
-			if (!pcd_probe(cd, -1, id)) {
+			if (!pcd_probe(cd, -1)) {
 				cd->present = 1;
 				k++;
 			} else
@@ -744,7 +744,7 @@ static int pcd_detect(void)
 				     conf[D_UNI], conf[D_PRO], conf[D_DLY],
 				     pcd_buffer, PI_PCD, verbose, cd->name)) 
 				continue;
-			if (!pcd_probe(cd, conf[D_SLV], id)) {
+			if (!pcd_probe(cd, conf[D_SLV])) {
 				cd->present = 1;
 				k++;
 			} else
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
