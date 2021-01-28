Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFB5306EE0
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:21:31 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 94B584207A3;
	Thu, 28 Jan 2021 08:21:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BFDDB420618
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:17:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818259; x=1643354259;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=WN34YNrFVBX2exPMiNFaWJshviC5HdAH5Y1CjLjlB3Y=;
	b=RhwRTxm2+JKSVBsFZ65bSrk/xZ+ii5u4B96bORB/lq5K5TxNZHTYRrl7
	SIulpzYWJ60IkO63ys/Y3mOYakIqlx42Fl1zMz/0VVuaHRSeveoi524/m
	sSfhhIrMVza9mh26EMQW2q/d/tlBj7b+Kgy3FOjIG6Oo1m9PbsX/1pnUy
	MpWnCLYpH03QNpJojPNvj9C54zoYMG1MckvnatS3H/wjZmlK7To04IQHo
	xXnqXWHDQsE1OAuH9w19sAB9OJUNQNFpmK6PX3pJvZojajQfcPk+DYQZ/
	zEd4a51B8qYsvXQYb1WApy7HAzjLTRsMaWAg1bX3190kO+E+5fYOplXx3 A==;
IronPort-SDR: 33DmKw8YBTWyXh17i2golDnmMuw1ZwLIsS3jimBtsiiYOVNlyc7Xhj3Qa8zHp4+pdSF7Qct1yd
	eRTEUfXO1U/KxyzC+S7mga+vPr7uASld9DbA4eK9AER4Jb4JmIa9sNMD/h4eBRxd24K7T6Iubt
	eUdj6ZUHd8GAtz2u1VZcBMqzzX1Fip3nZWEEHYOdQQdbQOgcfj1ltMtb4bcTa25RV0+Xoz7RDo
	vJ/GqAC52DiiGgz3c+E3wpYJ2Zv4hQ1mMdxEk4jk2YBF4WIp9j+zDc54aOywoLz9wT+EYNn54Q
	NQY=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="162963339"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:14:33 +0800
IronPort-SDR: kFDA+Ce6P1NftBEvoFr5JUbIoXD4c+Yek1p7uQ2V3aZruXOMLWVEihJFQNkKwavrX5PHsGVfIS
	AfLeHXOZCNDfzo6rQpzFqHsMI1aAhvvEQu0Bxqm1ljdT+bBcYo1/jL2SfHSQWp5+Qqxz5o31i0
	M2/wWOgMrsgXdsux3mYpNwJ/yuYl6H15Fs3YDKj+RBoNEJckRpb8RL+KpCu98UhdSCPY6/jV0/
	AchYy0ggvPrj3TZ7ZAp31h1nC4/j3PI9gg1e+T5OU202NA2Jnyf6Q9NQCDr1koMOfRz1U3pQ3n
	Jzck04ERXAIulXpDDM3u9btp
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:58:53 -0800
IronPort-SDR: hgdemKPG/3HHgXRADNUaRfIeto8NmW8LEHR468JLI5qNdwJ9I/Vz7EOVIHe6ux2OR8aMkXbCb+
	hHmOp4ZL4+H3N5KG2012DyI6S+0eAji83o59kSvMRJsf1lkWorl0McE4AqjKkZANcW6TxQu0db
	Rg6QKY68t8KKdoDxgIWM8St6Q8n+pLj6fbsJ1LpjtPi/SVOVdnUNhjzT9HNr2ak6ECZBXsF3YT
	a/oz2zpRpm0NjKofMt8jO2sCHWsfpktQx0L5tGvTxbU6SR20ACdGgmG00/Fl2WObQ2KsI7nqdc
	S2A=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:33 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:19 -0800
Message-Id: <20210128071133.60335-21-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 20/34] fs/jfs/jfs_logmgr.c: use bio_new in
	lbmStartIO
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
 fs/jfs/jfs_logmgr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index 4481f3e33a3f..bb25737d52f6 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -2121,16 +2121,14 @@ static void lbmStartIO(struct lbuf * bp)
 
 	jfs_info("lbmStartIO");
 
-	bio = bio_alloc(GFP_NOFS, 1);
-	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
-	bio_set_dev(bio, log->bdev);
+	bio = bio_new(log->bdev, bp->l_blkno << (log->l2bsize - 9),
+			REQ_OP_WRITE | REQ_SYNC, 0, 1, GFP_NOFS);
 
 	bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
 
 	bio->bi_end_io = lbmIODone;
 	bio->bi_private = bp;
-	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC;
 
 	/* check if journaling to disk has been disabled */
 	if (log->no_integrity) {
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
