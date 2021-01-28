Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB8306F64
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:30:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A0F9F42081D;
	Thu, 28 Jan 2021 08:30:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 928DE42002F
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:20:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818400; x=1643354400;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=ebUREFacDD1ljG2MqWB5dUmMjUM91D8UhGi2M79Y0SA=;
	b=RjbEc/uYmLQMrtDxTgy9oeHLJB3E23hfw9lxdwTMLGinIkemnZirhycT
	tRRYceQCGush9BvfNblcmgW5yTKFw7NZaoS/ppzbQ4MBsTQF80am8oHPb
	wFCZFcEzAUEOvRBM2/1wnEDo9OO5XACvRF3c0RMkke13bgouXAJhhXL/P
	0f0nh8EpesnKxpRkkelNl3p29NBuN4bA6xkkztqwkdFYEyxEUqGCtZigt
	6Lg4g9J02fKasbF1cw+eMgPP7p9gifUm81/1a7swYd/hXpUqPcy8HdnaO
	R34dKzP1j8L2G6+HD4k098IdFowOYB0Y1s1OG+wFgzeYZKoVh4CG+VrgK Q==;
IronPort-SDR: 3rwVmx8I/9yAYlDc3HGpaXl4myeq2PrMMDMa69Ygk857s0JPQbU40iuArGg0QCipBoDyWz3JJW
	9Zv3hRnGV+VMJR89zkPHWQyr7aRStCgTMqGM8lZtwOxQM3l6LilzdUZMfVbkelUJj8Gn+0eOV6
	df1iFnbUc5Vcf2zIp5qbwmZEbEtv1Jx7WXrFRb4K+hNrTbSFfaIUfe1uokcfqRulEAc4FmNo84
	rhX9dFkHlTki/4xth620kAn0bVcKqtTJF44X3qH8OZ1sKGpbonS0C2SW2iiBXdLjrV8mr/8XYr
	RQQ=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="159693790"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:12:53 +0800
IronPort-SDR: eEFWd7kJJ5vE4TQLyArR2o3Ca4Es+6eG0Y4F1Ed3liF4hbuMBIaEN8EoBRyvCeyYPKW6BFC0/e
	YcAnvo/lPpzzAss6VsRCR+nDUWtIG12B10X8fuuPYRf2qGGcC0GIpdrcIOgTQUut4qASUHdO7G
	ZmCLcRezkARC9kI0QUx6aaXtfRJjLIWS+WTNNANUcVsaRRLd2my3dBGK9dDtieEHKzsGHtj/l8
	x79bToyZ/ZHURuzT7XZxMgxrchBuqe0mMe8JbMAcIVh1qnhu3Q/d4/X/kPaHGxMTUD08He2ae9
	35fDxcvBfR+Jys2zVpd5O7gK
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:55:11 -0800
IronPort-SDR: PY5y9iQTPaVno0Uv+vDzXalBIBo52CYeNhdpn1c7TxoOle28qWYUG06GBXepBaS7SSBSs9yjco
	7juMCiLNAFC5Fl7+86T3v8dT5wViZ/r3nWsFgtnjfanPUZXEs47a6Ez/SVmFCas+uBcEU4K0rz
	829GMnmof7Vria8o+CPxuoND3CfaQPgb+QYuf0lvO7BAPoDvQAY10VoO7lep1Qta/l6nA5+vbg
	ht+uppfjRckOmE5ekZUsc4vMGzhgqqwVxG/dC7eG99G+et4hw+q4h30FxFyz73HjopgItSw/2N
	PHA=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:12:53 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:07 -0800
Message-Id: <20210128071133.60335-9-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 08/34] dm-zoned: use bio_new in
	get_mblock_slow
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
index 039d17b28938..e6252f48a49c 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -550,7 +550,8 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 	if (!mblk)
 		return ERR_PTR(-ENOMEM);
 
-	bio = bio_alloc(GFP_NOIO, 1);
+	bio = bio_new(dev->bdev, dmz_blk2sect(block), REQ_OP_READ,
+		      REQ_META | REQ_PRIO, 1, GFP_NOIO);
 	if (!bio) {
 		dmz_free_mblock(zmd, mblk);
 		return ERR_PTR(-ENOMEM);
@@ -577,11 +578,8 @@ static struct dmz_mblock *dmz_get_mblock_slow(struct dmz_metadata *zmd,
 	spin_unlock(&zmd->mblk_lock);
 
 	/* Submit read BIO */
-	bio->bi_iter.bi_sector = dmz_blk2sect(block);
-	bio_set_dev(bio, dev->bdev);
 	bio->bi_private = mblk;
 	bio->bi_end_io = dmz_mblock_bio_end_io;
-	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META | REQ_PRIO);
 	bio_add_page(bio, mblk->page, DMZ_BLOCK_SIZE, 0);
 	submit_bio(bio);
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
