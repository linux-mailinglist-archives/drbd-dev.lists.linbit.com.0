Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D3306EDE
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:20:32 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 06EE542065F;
	Thu, 28 Jan 2021 08:20:32 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 306 seconds by postgrey-1.31 at mail19;
	Thu, 28 Jan 2021 08:17:24 CET
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BDAD7420607
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:17:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818244; x=1643354244;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=SCctODBcoMVRMibJjtR9kI3GnL0tVZIiIK8qwMLhuQk=;
	b=WjHGqoKx+2b8rNmNphVvm6XSGcGJCZKe3Q9MKdRMA5lkOjNZmKVTktCD
	wCjtZBoQIS6UrRGPUqm1Dw6AjzEPu8wCHqFErlWi/2Zmt2DAviJorvo+3
	WeMk+4s7IKpccqkKZGo89+6q4cTujGAunNStKc3ubfr1QZOtyn6/hCDtO
	n/4HnyJOw8nvV5HAvh6uxkv71s1NN1FfgqEPrvXEzjZwUlvtwzN4euOOB
	LN9swHdSPYjh76nCmjBdIzheU7y0sOtLRma79aT+dLhpgGKc6XJCURBCh
	CiUTAFpcS2r4BHoJ8Dqskkjfo5tol7EmDac1ESRjH39y4JxImygTiX1+g g==;
IronPort-SDR: ekxaLqgPOg0zMmB3FIASEnGZkqUMwRaeA+Lr8inu1jh4SsFNlzGQim/80EAzRcKRZ/bTR6FHf1
	w5fqATZix6ZQAbUpesU1FrkX6/scqrlUcC3zrW5uPjZxr63SuZU+V9l6xzmkCs4c1tNfSoTFWo
	z4SR2kU38vfyfP8j3mvhAsi11KmmJS3EHc2M5LiMuejHdFdYgY7P7YrNlFCy6fz3BPOd13jQYx
	swX3Z539Totk6lLrVhxkMsja3fdgyDiJoyL7X+c7QW3ngXRIIe6S5K6cAnqsm/nZSwnzKoGE/p
	IGU=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="162963318"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:18 +0800
IronPort-SDR: azOSJJHLgbk4bg13FyrL1sgMc48Iad5BZdX9qJY16VRyIr6kKrhYg7ZPo7IeQgnQnHRvzWlG4s
	+belwISF0d9z5vbA2SCIa9h1B8VINEkq/Go3ldKBfnnaBxTo7jubkZ8Xpwiy9MEvOx32bFESWt
	OlFlHvE4DNBuo/dvZKt1PallBkgrr8WaSEMsaa2BlaU7WzTwojyX6d+B41GfsYrTTuqURxR8+G
	VXIusnD09xrLla4ChEq5puXJ8yAvjE4aXxeAFjHY6EQ/fqcQi0vltZNIZQfonIQguG3+exIvcI
	JF5RxQDqu2rsNd96AJZ6HLxb
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:58:38 -0800
IronPort-SDR: SE/7jhzj8mUN4IuNpOkC3snrZ8NJ1clnXy6y5ds9FsX94ZBtriQ4uRa7QWKdGcnXbjLMCBoUCV
	muTlW54Qa3qPh6fwMtXMlfwP2+yfKLqOcAu45V7pI+dpenWI0L1OM9udcXtJMTQueAmHig5gDN
	d6OcRwyGrT7GxH48PliS/P58sqmLq3e242QCy6iyXTMgFXRd2EClUAs64FPFphS/GBkZYgQLMx
	xAByTj3G42kPYoeBIsWoRZMAgUwhHcuqehcOxGoJkKVhb66+D9X5hujEyFAgPHDC4Sd1jNsKev
	N7A=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:18 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:17 -0800
Message-Id: <20210128071133.60335-19-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
References: <20210128071133.60335-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Cc: shaggy@kernel.org, sergey.senozhatsky.work@gmail.com, snitzer@redhat.com,
	tiwai@suse.de, djwong@kernel.org, gustavoars@kernel.org,
	joseph.qi@linux.alibaba.com, pavel@ucw.cz,
	alex.shi@linux.alibaba.com, hch@lst.de, agk@redhat.com,
	naohiro.aota@wdc.com, sagi@grimberg.me, mark@fasheh.com,
	osandov@fb.com, ebiggers@kernel.org, ngupta@vflare.org,
	len.brown@intel.com, chaitanya.kulkarni@wdc.com,
	konrad.wilk@oracle.com, hare@suse.de, ming.lei@redhat.com,
	viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com,
	jaegeuk@kernel.org, konishi.ryusuke@gmail.com,
	bvanassche@acm.org, axboe@kernel.dk, damien.lemoal@wdc.com,
	tytso@mit.edu, akpm@linux-foundation.org,
	martin.petersen@oracle.com, rjw@rjwysocki.net,
	philipp.reisner@linbit.com, minchan@kernel.org, tj@kernel.org,
	lars.ellenberg@linbit.com, jth@kernel.org,
	asml.silence@gmail.com, jlbec@evilplan.org, roger.pau@citrix.com
Subject: [Drbd-dev] [RFC PATCH 18/34] iomap: use bio_new in
	iomap_dio_bio_actor
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

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
---
 fs/iomap/direct-io.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/iomap/direct-io.c b/fs/iomap/direct-io.c
index f6c557a1bd25..0737192f7e5c 100644
--- a/fs/iomap/direct-io.c
+++ b/fs/iomap/direct-io.c
@@ -267,9 +267,8 @@ iomap_dio_bio_actor(struct inode *inode, loff_t pos, loff_t length,
 			goto out;
 		}
 
-		bio = bio_alloc(GFP_KERNEL, nr_pages);
-		bio_set_dev(bio, iomap->bdev);
-		bio->bi_iter.bi_sector = iomap_sector(iomap, pos);
+		bio = bio_new(iomap->bdev, iomap_sector(iomap, pos), 0, 0,
+			      nr_pages, GFP_KERNEL);
 		bio->bi_write_hint = dio->iocb->ki_hint;
 		bio->bi_ioprio = dio->iocb->ki_ioprio;
 		bio->bi_private = dio;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
