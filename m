Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFB02B49D5
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 16:48:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 08293420856;
	Mon, 16 Nov 2020 16:48:21 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AB0D8420841
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 16:46:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AZC0zIud/sy36HL3UqpdhruuJxaP+dAsE+XWl7N2xio=;
	b=hC2kUAEWCYh9OryEptbmVZ4ebz
	NJfypqCrjvekFThEDQHeAH+KnX3FgqoOh2oFdElpy2UOUU8OYvMVMyDtZx5PgsNNgO5KvLRJtcx2F
	8Z2wJ6ZAecQ/tCcYHLbAlAGK62e/LPO1anzZqXyhoiZcnyM456rb6Ib/pV9REehr8DlazH4amfdur
	a7V1kHvqoU8gZ+KDoDs23F8OiOCpjlxcgAWIv7ZpBKEh+7hc5sOGW+853KLP0z+7cruWtWsL7L99a
	DSrjRt5uLPvZTcUNxbnqe7Ie7DIj2M7MWaG8rzW38nm4RM1CwtXe4KSgUM8q+WHYxhoTnZfd7fBBR
	Uej9O+GQ==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyd-000470-B8; Mon, 16 Nov 2020 14:59:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:48 +0100
Message-Id: <20201116145809.410558-58-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201116145809.410558-1-hch@lst.de>
References: <20201116145809.410558-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Justin Sanders <justin@coraid.com>, Mike Snitzer <snitzer@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, linux-nvme@lists.infradead.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	drbd-dev@lists.linbit.com, linux-scsi@vger.kernel.org,
	xen-devel@lists.xenproject.org, Ilya Dryomov <idryomov@gmail.com>,
	Jack Wang <jinpu.wang@cloud.ionos.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
	linux-raid@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [Drbd-dev] [PATCH 57/78] init: refactor devt_from_partuuid
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

The code in devt_from_partuuid is very convoluted.  Refactor a bit by
sanitizing the goto and variable name usage.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 init/do_mounts.c | 68 ++++++++++++++++++++++--------------------------
 1 file changed, 31 insertions(+), 37 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index aef2f24461c7f1..afa26a4028d25e 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -105,13 +105,10 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
  */
 static dev_t devt_from_partuuid(const char *uuid_str)
 {
-	dev_t res = 0;
 	struct uuidcmp cmp;
 	struct device *dev = NULL;
-	struct gendisk *disk;
-	struct hd_struct *part;
+	dev_t devt = 0;
 	int offset = 0;
-	bool clear_root_wait = false;
 	char *slash;
 
 	cmp.uuid = uuid_str;
@@ -120,52 +117,49 @@ static dev_t devt_from_partuuid(const char *uuid_str)
 	/* Check for optional partition number offset attributes. */
 	if (slash) {
 		char c = 0;
+
 		/* Explicitly fail on poor PARTUUID syntax. */
-		if (sscanf(slash + 1,
-			   "PARTNROFF=%d%c", &offset, &c) != 1) {
-			clear_root_wait = true;
-			goto done;
-		}
+		if (sscanf(slash + 1, "PARTNROFF=%d%c", &offset, &c) != 1)
+			goto clear_root_wait;
 		cmp.len = slash - uuid_str;
 	} else {
 		cmp.len = strlen(uuid_str);
 	}
 
-	if (!cmp.len) {
-		clear_root_wait = true;
-		goto done;
-	}
+	if (!cmp.len)
+		goto clear_root_wait;
 
-	dev = class_find_device(&block_class, NULL, &cmp,
-				&match_dev_by_uuid);
+	dev = class_find_device(&block_class, NULL, &cmp, &match_dev_by_uuid);
 	if (!dev)
-		goto done;
-
-	res = dev->devt;
+		return 0;
 
-	/* Attempt to find the partition by offset. */
-	if (!offset)
-		goto no_offset;
+	if (offset) {
+		/*
+		 * Attempt to find the requested partition by adding an offset
+		 * to the partition number found by UUID.
+		 */
+		struct hd_struct *part;
 
-	res = 0;
-	disk = part_to_disk(dev_to_part(dev));
-	part = disk_get_part(disk, dev_to_part(dev)->partno + offset);
-	if (part) {
-		res = part_devt(part);
-		put_device(part_to_dev(part));
+		part = disk_get_part(dev_to_disk(dev),
+				     dev_to_part(dev)->partno + offset);
+		if (part) {
+			devt = part_devt(part);
+			put_device(part_to_dev(part));
+		}
+	} else {
+		devt = dev->devt;
 	}
 
-no_offset:
 	put_device(dev);
-done:
-	if (clear_root_wait) {
-		pr_err("VFS: PARTUUID= is invalid.\n"
-		       "Expected PARTUUID=<valid-uuid-id>[/PARTNROFF=%%d]\n");
-		if (root_wait)
-			pr_err("Disabling rootwait; root= is invalid.\n");
-		root_wait = 0;
-	}
-	return res;
+	return devt;
+
+clear_root_wait:
+	pr_err("VFS: PARTUUID= is invalid.\n"
+	       "Expected PARTUUID=<valid-uuid-id>[/PARTNROFF=%%d]\n");
+	if (root_wait)
+		pr_err("Disabling rootwait; root= is invalid.\n");
+	root_wait = 0;
+	return 0;
 }
 
 /**
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
