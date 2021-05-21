Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D3838C053
	for <lists+drbd-dev@lfdr.de>; Fri, 21 May 2021 09:05:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7F6D7420602;
	Fri, 21 May 2021 09:05:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 88DEE4205C8
	for <drbd-dev@lists.linbit.com>; Fri, 21 May 2021 09:03:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=vrlb3gpQ3AYuNPBe0/RrPeHNlWaUD2yiPPU9OkXw7SA=;
	b=VQHH4gc8hGbhrYI2cy69ffXSDw
	oYi4GpD7bbQjpNMBTtJ8H9VWdXRHozJga5WXgc+9I+NN8vamOZmNK8lS+l0UT65h5rNf9NOpp13V1
	4QW/UNF3EXrAbDo7ddmrGYPkPd1cSg4hFC+kF64Z5p75U6OB0xSvA0RA+NY/1GAY+F6pkw9zs//Sk
	zuR8KWVZ7sREZnzaV0cRQLytTYXotXfjDgYFhL8LG2gme3KttVFeM+XHyiptWcjFGI1D2zp5HtJUr
	ILl0ngtiAnyd8HBFksjcytYqjrZ5HvQXpfvczpCNHtsGFTbWzmCQdtltW/wUx6BwPF4Z59m7YLR10
	v0V40Ilw==;
Received: from [2001:4bb8:180:5add:4fd7:4137:d2f2:46e6] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1ljy4D-00Gpwy-OY; Fri, 21 May 2021 05:51:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jim Paris <jim@jtan.com>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Philip Kelleher <pjk1939@linux.ibm.com>, Minchan Kim <minchan@kernel.org>,
	Nitin Gupta <ngupta@vflare.org>, Matias Bjorling <mb@lightnvm.io>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	Song Liu <song@kernel.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>,
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>
Date: Fri, 21 May 2021 07:50:52 +0200
Message-Id: <20210521055116.1053587-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210521055116.1053587-1-hch@lst.de>
References: <20210521055116.1053587-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-raid@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-s390@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	linuxppc-dev@lists.ozlabs.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 02/26] block: move the DISK_MAX_PARTS sanity
	check into __device_add_disk
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

Keep this together with the first place that actually looks at
->minors and prepare for not passing a minors argument to
alloc_disk.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/genhd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 2c00bc3261d9..7f9beaeede11 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -491,6 +491,12 @@ static void __device_add_disk(struct device *parent, struct gendisk *disk,
 	 */
 	if (disk->major) {
 		WARN_ON(!disk->minors);
+
+		if (disk->minors > DISK_MAX_PARTS) {
+			pr_err("block: can't allocate more than %d partitions\n",
+				DISK_MAX_PARTS);
+			disk->minors = DISK_MAX_PARTS;
+		}
 	} else {
 		WARN_ON(disk->minors);
 		WARN_ON(!(disk->flags & (GENHD_FL_EXT_DEVT | GENHD_FL_HIDDEN)));
@@ -1264,13 +1270,6 @@ struct gendisk *__alloc_disk_node(int minors, int node_id)
 {
 	struct gendisk *disk;
 
-	if (minors > DISK_MAX_PARTS) {
-		printk(KERN_ERR
-			"block: can't allocate more than %d partitions\n",
-			DISK_MAX_PARTS);
-		minors = DISK_MAX_PARTS;
-	}
-
 	disk = kzalloc_node(sizeof(struct gendisk), GFP_KERNEL, node_id);
 	if (!disk)
 		return NULL;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
