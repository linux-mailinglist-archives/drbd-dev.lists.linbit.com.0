Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B03306E91
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:17:31 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 52B9142060D;
	Thu, 28 Jan 2021 08:17:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 301 seconds by postgrey-1.31 at mail19;
	Thu, 28 Jan 2021 08:16:59 CET
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 83A23420356
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:16:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818219; x=1643354219;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=wUwjN0vBouMAu1m5itQWMc9ceGIiyWjYqyXKNeHEsnQ=;
	b=DObA2uoIJrk9RLDpCbcAzvlCybuPDEQVNYkFy0BWgEbugwTz47CDM2mG
	1U5yF88Jb4QKm5DRUKsjPB/t3iXKcsTsy2AKsaCdEBjP0cGY7QbxBhR+c
	bhUtrBKKswP+lTIrsKVQqiB8hoPkiDsh4DsFVJLEJKGUQ9ULIIza2eJlh
	SfSMdg6sDT7shARQYzqlevcprBurj5l8u9qM9QGWj57sLhwNVuiZx1rif
	PZst86/lmXsG5dmd0JMvqM1w9/mWep/ej0Czbm/zD746072ovtPY1aNaW
	f2QZeCmo49G+J10Q+SCa8A2RWWnR6QZ9kYPTPhuOFQXkTkrXOFn6GTbwa g==;
IronPort-SDR: dkkWUz0GbO3N1xCsdjFkCfkxzhyGfsaDTHajNU8oxIB0hWZrrsUkkx2VvD/JdbCM6aEY3RWeYp
	CRxdG30QOlvvcxNSqpJpkqwgHTb4Eg3fDt6+Km993c+1N+BkcuPmbSqGy0qhyYP2zfJzGyAQTo
	M3LX4gB4Uzj5VgnBNxuOwHaxDBsF83+y0oE/JoCF8HvocECsGZ73BSSo1uZOFmKa9l3s2RSYuN
	m1z4v/FWlHPuF84UFyPhkDsxRfEnyG/nqKFYmXnv7McEy7ByGEsk8i1VLYeX9owlybrioRflRg
	Fto=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="159693877"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:54 +0800
IronPort-SDR: uL9Ig3Muk4sCLK8sR7ywXYMEGj6dIbSW9tvzyJVdsoVxr7U1k2aQOjbb8PTGvkRHdVy1oTN5Vq
	tP08MuT8SIIgZTtWj9R+JrJh34g7hz59p6OUoOYXkTIuOYSMAH1IlEJn2+48pke5eIGdU8/Gbd
	jFi/mFM4BLh3p/YsnN4blxJT3S5Wehd7JKDeMsRXuiKLyITEpsm3Yq19bUOSYQi/1DW3/F/g8n
	KSKC7Zfcxz7OfqLOagvxiMVHERnV9pMsivmeDsJxol11ENm8SgJRGLS9lk9pmG93M8qq55lGrZ
	a5vbPxILZFM8fXRNhwCV+zRu
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:56:12 -0800
IronPort-SDR: pB2cXSth9j9iO8qI9kro9aUnzxe7uC+CM4R5ezhi5mkNe3QJ3MeSZh+GGUOxW9ROBr/hgtgk35
	3kQYC2KUTB+4qbQnoUg89GyqXiUICL6Lbb6/fLgPHrp+IuvY60iwR3VPtR6IrHib1STZYvjFII
	G0U9LFUNwbOn5ju9S5MOKHMAKhFoQxnYNKdJKA68HgaqnFN4j9YRc5HgIY3H1XVVcQBHwY13od
	d8yfo6WXgScVxvO/+aDCj5bBUi8Qq8LHMuAKgJFuukK9k/tSzy9sPaWEv7Xl8jluo8DC44HSzF
	bXE=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:54 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:14 -0800
Message-Id: <20210128071133.60335-16-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 15/34] fscrypt: use bio_new in
	fscrypt_zeroout_range
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
 fs/crypto/bio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/crypto/bio.c b/fs/crypto/bio.c
index b048a0e38516..20dab9bdf098 100644
--- a/fs/crypto/bio.c
+++ b/fs/crypto/bio.c
@@ -148,12 +148,11 @@ int fscrypt_zeroout_range(const struct inode *inode, pgoff_t lblk,
 		return -EINVAL;
 
 	/* This always succeeds since __GFP_DIRECT_RECLAIM is set. */
-	bio = bio_alloc(GFP_NOFS, nr_pages);
+	bio = bio_alloc(inode->i_sb->s_bdev, 0, REQ_OP_WRITE, 0, nr_pages,
+			GFP_NOFS);
 
 	do {
-		bio_set_dev(bio, inode->i_sb->s_bdev);
 		bio->bi_iter.bi_sector = pblk << (blockbits - 9);
-		bio_set_op_attrs(bio, REQ_OP_WRITE, 0);
 
 		i = 0;
 		offset = 0;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
