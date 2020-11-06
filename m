Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 477E32A9D0B
	for <lists+drbd-dev@lfdr.de>; Fri,  6 Nov 2020 20:04:41 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 08F1A4207B5;
	Fri,  6 Nov 2020 20:04:41 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F127142079F
	for <drbd-dev@lists.linbit.com>; Fri,  6 Nov 2020 20:04:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=stmwFAlkeYayJwqxLAzxAb5snaHT5ewOrHfW4MD4mwk=;
	b=tB2Wdu/PMT4HaSqbNXLjbJSinK
	5hsrT8s37btBvfcSB9O4uU93SD5PFBnxHXny99OrIualpr25xUxUD6huKCkWn/+mqbBjsPu8GBT2K
	BThvX+OWl/FleZFRHiOhjc346V7c34ia1qBhD1BbATvc5xUrGPzH/rmzYuoB0ZX7+lPL+RKQlCljc
	jG3EgsYXLaMRAjav+9rOo/D7/8GwP4iHme6XgziXy4nXb8g0UObGiuuRw0pjd58Xmnsj883VpUPPn
	/WqbOngIbQjdRi22wAva6IBkP7TmfNzppcbD1VYiYpN4uQufsS9sHdI0GfKYll6bY7LU3TdfwkqXU
	DJQocnLQ==;
Received: from [2001:4bb8:184:9a8d:9e34:f7f4:e59e:ad6f] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb71X-0000tW-UC; Fri, 06 Nov 2020 19:03:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri,  6 Nov 2020 20:03:13 +0100
Message-Id: <20201106190337.1973127-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106190337.1973127-1-hch@lst.de>
References: <20201106190337.1973127-1-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 01/24] block: remove the call to
	__invalidate_device in check_disk_size_change
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

__invalidate_device without the kill_dirty parameter just invalidates
various clean entries in caches, which doesn't really help us with
anything, but can cause all kinds of horrible lock orders due to how
it calls into the file system.  The only reason this hasn't been a
major issue is because so many people use partitions, for which no
invalidation was performed anyway.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/block_dev.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/block_dev.c b/fs/block_dev.c
index 9e84b1928b9401..66ebf594c97f47 100644
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@ -1334,12 +1334,6 @@ static void check_disk_size_change(struct gendisk *disk,
 		i_size_write(bdev->bd_inode, disk_size);
 	}
 	spin_unlock(&bdev->bd_size_lock);
-
-	if (bdev_size > disk_size) {
-		if (__invalidate_device(bdev, false))
-			pr_warn("VFS: busy inodes on resized disk %s\n",
-				disk->disk_name);
-	}
 }
 
 /**
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
