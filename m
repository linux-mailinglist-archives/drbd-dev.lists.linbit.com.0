Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0D1306F34
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:28:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 30BB3420806;
	Thu, 28 Jan 2021 08:28:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C010742062B
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:19:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818353; x=1643354353;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=jUCaPFeDv057fdkiILPSRkCuXPSAzqxSiECC+FKJaMI=;
	b=N+ghJIFkqaNf043VwOOcFMWru95V3/8iJngl7csKkaOtTyYFgeV0gDeB
	OJO/1eefCM8sCsL+hCikO3e/EnUs2GUZlxYpK0lDkw82oNxBw2nYlqeDn
	lB3QTZDRKvbjTvfo0YlD1cOtVXOjO1/9tQqsPJdOqzvpbPR6pL+wMOSug
	WadXe4mroHaTYtZusSQimbeGf8fl5mQQqkFZ25QX/WNsBlMsBCtGQJ6p7
	UXknfPh9g0vj5W0DRxaTKU8+DrIe2P2cXHXWAQy5k60Z3KMvZdXTb8iiX
	Cy5YQ8fifwH0yqqkZ3tsHb11xRhpuCQrylu7GLur+Ref120yHY4C+UJL6 A==;
IronPort-SDR: p+qrC7rSq8tS5mSWGaO2jHuNaNRn7z4VV9XC7J+dh4eKLPUi6GeLSbyhQTld40bfkpGYePrm0v
	cPam68wXF5cEoIB1diMhq8uj8m11vbOrAi2Lpfsmhi2lfwdbq0Eq26ZkOcFL16LqJqdYu2LDrP
	1TrWXbVHssOsqyco61Z3hSKvrJUiy2KYs5vCEhaN8pOQuz+bxWOeC5US8etameag4n3a3Ajy+e
	ZleNFxfbRCfuQJlcMmYWkRy/cURAOph2+/PLzBbZPwQDY52ozDvjgAJzki1RENM5f3GDVNc+xo
	qFk=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="158517229"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:12:06 +0800
IronPort-SDR: 2Kp/IhgYksMJohu1ghIylony3JUbohuRULHAB9ZcDoTYZICevhwt3bhhgFfbk0jRGedmuuk5Ce
	yCg/NTtDczSLXagtQlDMKT5dQ6i62SfkghpTAXtwJ+cI+rFz5SDXOc2U8ZiVT0x90IFa4aWxYD
	l7BBc9N0gIOLOVG1jlXkS7jP1dQfq8jXGbFL6IJIxWeUG27dC4Ofjn0zPcYMjNFMftWcnPuo+/
	grYsDK4U2Fp/c7c3bGAvhfaKLB+6ivQ58pyPTK4AEfInWBWVOIOBfdDgid7UwyJCUYSyMhL8E8
	lfwhXXL0b5saT91GfJcMbI8K
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:56:26 -0800
IronPort-SDR: d5xTirF8Ys37shQjxL90xQdmAvrvSyaDd23k+ldZQk6g8Gmyh3lDvEoGm16xcyp5mSBaZTpxOa
	PvC1PFp6twA2TpPlG+Ql+/AG65S9RMLgGFawcQCbg9J6k/x2AMPUiKYtsSCC84Z+EGYfmFKoID
	N3xp6Srvi9c6y+EZp98pFBd59WcY1NGSO1F5aHMorlNIT26uZMyL8pegMXpgjACziNosRf/+TT
	qFeHE9fwJbeXCBkPpJ7sXhYMSQdfV8ojzZIb3gXAYZT1zkKG2mcOAVOk/sf7gRxWJd9WgQISSA
	lhk=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:12:06 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:02 -0800
Message-Id: <20210128071133.60335-4-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 03/34] drdb: use bio_new in drdb
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
 drivers/block/drbd/drbd_receiver.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 09c86ef3f0fd..e1cd3427b28b 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1643,6 +1643,7 @@ int drbd_submit_peer_request(struct drbd_device *device,
 	struct bio *bio;
 	struct page *page = peer_req->pages;
 	sector_t sector = peer_req->i.sector;
+	struct block_device *bdev = device->ldev->backing_bdev;
 	unsigned data_size = peer_req->i.size;
 	unsigned n_bios = 0;
 	unsigned nr_pages = (data_size + PAGE_SIZE -1) >> PAGE_SHIFT;
@@ -1687,15 +1688,12 @@ int drbd_submit_peer_request(struct drbd_device *device,
 	 * generated bio, but a bio allocated on behalf of the peer.
 	 */
 next_bio:
-	bio = bio_alloc(GFP_NOIO, nr_pages);
+	bio = bio_new(bdev, sector, op, op_flags, GFP_NOIO, nr_pages);
 	if (!bio) {
 		drbd_err(device, "submit_ee: Allocation of a bio failed (nr_pages=%u)\n", nr_pages);
 		goto fail;
 	}
 	/* > peer_req->i.sector, unless this is the first bio */
-	bio->bi_iter.bi_sector = sector;
-	bio_set_dev(bio, device->ldev->backing_bdev);
-	bio_set_op_attrs(bio, op, op_flags);
 	bio->bi_private = peer_req;
 	bio->bi_end_io = drbd_peer_request_endio;
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
