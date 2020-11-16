Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id A12DC2B4B29
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Nov 2020 17:32:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7045A420883;
	Mon, 16 Nov 2020 17:32:14 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 04AC84207E5
	for <drbd-dev@lists.linbit.com>; Mon, 16 Nov 2020 17:31:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ISq8BehFRmfA7X2bUEKuKNCEzkzF+ixwO2P3vH2Ca4g=;
	b=d73ns3M7F3JRR21anbEXFxuf9g
	A1xWTv4tBpopyBGHuve4hdPzPLwGluE0C2j9u+A4uk1WzPvrWwUq+wvI0IfwLikycPsXYuDfNoqOe
	m8TfyEmDYqxSeCEPv8OHRnRxlZa2BK0Mb/DUIm1Z0f6pGaDzcvBobxYIJlmaIdSdeUSaf89GVeTXM
	JufiFirvEUqjxlNXxHVTpo2WhwYvjUKrOkF5h55ecknCMyA1me/y2F2FdynUFWj9zZc5XKzC9ijl9
	HJGyPVpfezAKOMvhyISvMkEFsLN1uvdIFVszTvvkCN35wOb/aMbNL+Xc75GBLtiIukt+24033x1tu
	55Dk0zgg==;
Received: from [2001:4bb8:180:6600:255b:7def:a93:4a09] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kefyD-0003xZ-0p; Mon, 16 Nov 2020 14:59:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 16 Nov 2020 15:57:30 +0100
Message-Id: <20201116145809.410558-40-hch@lst.de>
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
	linux-raid@vger.kernel.org, Hannes Reinecke <hare@suse.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Minchan Kim <minchan@kernel.org>, linux-fsdevel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [Drbd-dev] [PATCH 39/78] block: add an optional probe callback to
	major_names
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

Add a callback to the major_names array that allows a driver to override
how to probe for dev_t that doesn't currently have a gendisk registered.
This will help separating the lookup of the gendisk by dev_t vs probe
action for a not currently registered dev_t.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 block/genhd.c         | 21 ++++++++++++++++++---
 include/linux/genhd.h |  5 ++++-
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/block/genhd.c b/block/genhd.c
index 8391e7d83a6920..dc8690bc281c16 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -399,6 +399,7 @@ static struct blk_major_name {
 	struct blk_major_name *next;
 	int major;
 	char name[16];
+	void (*probe)(dev_t devt);
 } *major_names[BLKDEV_MAJOR_HASH_SIZE];
 static DEFINE_MUTEX(major_names_lock);
 
@@ -441,7 +442,8 @@ void blkdev_show(struct seq_file *seqf, off_t offset)
  * See Documentation/admin-guide/devices.txt for the list of allocated
  * major numbers.
  */
-int register_blkdev(unsigned int major, const char *name)
+int __register_blkdev(unsigned int major, const char *name,
+		void (*probe)(dev_t devt))
 {
 	struct blk_major_name **n, *p;
 	int index, ret = 0;
@@ -480,6 +482,7 @@ int register_blkdev(unsigned int major, const char *name)
 	}
 
 	p->major = major;
+	p->probe = probe;
 	strlcpy(p->name, name, sizeof(p->name));
 	p->next = NULL;
 	index = major_to_index(major);
@@ -502,8 +505,7 @@ int register_blkdev(unsigned int major, const char *name)
 	mutex_unlock(&major_names_lock);
 	return ret;
 }
-
-EXPORT_SYMBOL(register_blkdev);
+EXPORT_SYMBOL(__register_blkdev);
 
 void unregister_blkdev(unsigned int major, const char *name)
 {
@@ -1030,6 +1032,19 @@ static ssize_t disk_badblocks_store(struct device *dev,
 
 static void request_gendisk_module(dev_t devt)
 {
+	unsigned int major = MAJOR(devt);
+	struct blk_major_name **n;
+
+	mutex_lock(&major_names_lock);
+	for (n = &major_names[major_to_index(major)]; *n; n = &(*n)->next) {
+		if ((*n)->major == major && (*n)->probe) {
+			(*n)->probe(devt);
+			mutex_unlock(&major_names_lock);
+			return;
+		}
+	}
+	mutex_unlock(&major_names_lock);
+
 	if (request_module("block-major-%d-%d", MAJOR(devt), MINOR(devt)) > 0)
 		/* Make old-style 2.4 aliases work */
 		request_module("block-major-%d", MAJOR(devt));
diff --git a/include/linux/genhd.h b/include/linux/genhd.h
index 8427ad8bef520d..04f6a6bf577a90 100644
--- a/include/linux/genhd.h
+++ b/include/linux/genhd.h
@@ -366,7 +366,10 @@ extern void blk_unregister_region(dev_t devt, unsigned long range);
 
 #define alloc_disk(minors) alloc_disk_node(minors, NUMA_NO_NODE)
 
-int register_blkdev(unsigned int major, const char *name);
+int __register_blkdev(unsigned int major, const char *name,
+		void (*probe)(dev_t devt));
+#define register_blkdev(major, name) \
+	__register_blkdev(major, name, NULL)
 void unregister_blkdev(unsigned int major, const char *name);
 
 void revalidate_disk_size(struct gendisk *disk, bool verbose);
-- 
2.29.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
