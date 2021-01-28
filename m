Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C1F306F67
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:31:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 327C8420823;
	Thu, 28 Jan 2021 08:31:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 04AA542062F
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:20:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818418; x=1643354418;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=Co0rYGelfI2tueL8o6ihJdxL5NS5pM4BZ/hI8135Y8w=;
	b=BxxY9BD4MS0IVbD8jizJEBynazrPJZICA+yec1/uOd/pPVb/krGNiO5x
	Av7UWiwblGGdIFBRVWYAieB/Cnk5XN29X/xnSwaNipIS5fpM64ml+QtEp
	3Ix3L492Y/m1MigEdF1NooD8qH5fwIIdhgCi7y1NDVksYrhVQAtoS/tWj
	xsO9vvzPTi9Ody4ncHrRlU9RkbpiXaiwCMEl/bFMV2JI7gTXF5SVxwrXg
	veaOZgyR7JDqDX3q8KXx0hSDyIU/MpgpnH3JLJsiH7IFLo5gszGZivEv3
	PQQIxABRtjLTeCyCQ8/vt3ljHLdT3Qy438eqNFtazS8kWDFlSY8Z04fv1 w==;
IronPort-SDR: 4r/vpPVIs+Nm4Ar4Q35PzWthzcffw/Qi49RerVKSy2fd13VOrcy+UjsLDB4Hpzka5JWS7sB8NM
	EHmq07gqnshbpR2rgpIzZi2DF2Mx0bk3tj+QOxYfnvFDaNdoO8b06HgBGsngGIScTTXNGis/r8
	2MkBWA66TXqi7Czoq8r8EWIEehN1dJq1bQhpHx4Em0t5je+pYeY2rUH26A/2nVyklBhLeusz1T
	VH4DjE6xrX9X7m+1WIAaDfMcZOwvQmQb3ry0R7Cxs3xhfewXoa5diICKdeNKwP4vj8KcDifsjv
	XMc=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158517317"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:11 +0800
IronPort-SDR: I+wOc3wP1Duis/8p29HsWwnI9rGiKrk6GNqY9ZCfpTjkfxdgKrOBd5gRxGAbf4wkS61STQyoeH
	tV44ytojUCZmEaWz9nby4KFQt9vf4vIgUi17k7Cew+BAZvg0vJM1o4PA3INTg9J5yMV19dHHEl
	jKCypfr7DCqglxxQxkFCnCd4j77QMq9sBEX3/lG/hudjAdo7XMUHmmHqGxSdG3QgRGdue4RjVv
	pZPs5hFvTQES3DddGQLTUmluypWUAymAzFM31Wbu2TwuNaUVwQXpiqWkdqWLtdBneopFLtlPt/
	lgwl+PakQa6LI8idPx2Kya75
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:55:29 -0800
IronPort-SDR: B3g2yURiLlkRDJQjiSw5Axb2Dh2vXpaNrKE/QAQl3YC0d9KYF6ZY/2WEGrs8Ad4s6CTMSYijlI
	As81DRh7fxTUcG6XscFZ0dEUGMxghLXCUSNbFTul1lhg8N84M173b0zoMSc59+C6RPGCZyVbXT
	e5q9NGchuukS+6n/XolnPl9CgZkf3lpSTdPe2xwj7IsZkLY+Q3H2m4972b6vr4aHe8P7F7VrjW
	YTjKY9EpCmYYdyolrCzI7bP6MpRPHgjkbRdfoyYEpwC7inxXY41c/i8ke9uNT4EC8+Q8lA/Kgh
	6rI=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:11 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:09 -0800
Message-Id: <20210128071133.60335-11-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 10/34] dm-zoned: use bio_new in dmz_rdwr_block
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
 drivers/md/dm-zoned-metadata.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index fa0ee732c6e9..5b5ed5fce2ed 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -755,13 +755,11 @@ static int dmz_rdwr_block(struct dmz_dev *dev, int op,
 	if (dmz_bdev_is_dying(dev))
 		return -EIO;
 
-	bio = bio_alloc(GFP_NOIO, 1);
+	bio = bio_new(dev->bdev, dmz_blk2sect(block), op,
+		      REQ_SYNC | REQ_META | REQ_PRIO, 1, GFP_NOIO);
 	if (!bio)
 		return -ENOMEM;
 
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
-	bio_set_op_attrs(bio, op, REQ_SYNC | REQ_META | REQ_PRIO);
 	bio_add_page(bio, page, DMZ_BLOCK_SIZE, 0);
 	ret = submit_bio_wait(bio);
 	bio_put(bio);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
