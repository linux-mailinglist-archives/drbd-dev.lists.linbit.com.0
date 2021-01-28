Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1516F306F1F
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:27:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F404E4207E1;
	Thu, 28 Jan 2021 08:27:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9AB9242062E
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:19:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818642; x=1643354642;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=ehPvHcNFObZpIErrj099M/D2lwJDNRsp+vZtBu0oImM=;
	b=FStELnau7WQubCfJREplT3FT6yVxghjV4C0PFqMu0IE1j7lqLSZXCH8Z
	k6L4I9ojbGNuWi+8JbEL5wjTO7dcOhkTwoxwFk9OGui2Vad0v7BjhH+wY
	E/CGCzjtx9PXnfWLu/v++KTeIbit17DM//n2oswPCeWTo2ACmXRG15F2H
	oxdvTrpJigVrDstsxnO+N0DuXqJ22pM1cUyI2imPzUnISvK4XDGOkuVxX
	lNIdYd8SjqlZZzGDzojrrsDEEUaDdBe6FxZJhmrSvC9JmEf4BmQmjXEpB
	/8gSaqsUIVmseYSUuSaKO5bEHIbzKETbPRxGEXolEUXPTAnFp0RyfXvKc A==;
IronPort-SDR: CH2F9A95sEi/rhOo54ofhZgfmlXJY00uCR4mKC/ppsR9aQbWXsRJuGhQ4u/uKBC49mviRzMDQN
	pD+I4DDnn2oiPM/IytdlssLePaU1m2fwCBUYEtHwj5PtlnuJGWLoYXYx9H3xgOhIPBmtO3+n+m
	qwnUZYm2ND/GG1PJXnHnugDkkZGdILX8F6WwfRgsIJQOUlec7UcNr6AyzkBdb8mdTXKS0yqwfa
	TVIf4GIFGrDHCyavg+j1PotG9+Bvp3Fh3gexu/TCPVYzNVSIkwGCjgMu41A70Zf0hEU+QzJyU9
	/y8=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="262549078"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:16:53 +0800
IronPort-SDR: wvVs+eBLd/EOIEZC2sA4jm15usOmLprHNQJd5PCN31hINiq7VAc1IBZSGw5fycImy11SsQTtjN
	6RmAlm7tpPU21r/1Fg/xCHRJmWWTaQCzxeIkFLds1Ckz+VjB05WamSyFtKKliiGZysJ1A2ZW10
	SMg7YwsxLCD0zawmXgyhTCUF/qUzEiod6f7XQoixIIVdGyuTlvICEA5tfzLt5IllJlIbqBpUFH
	kGYTfSlI31YVB+2J6+E5fcavYmBfb8WpRnJN+5byVVnfsOWiNseVcCmuOIa7AaWyiuewXUDiiN
	vCihaKZA9AwcXImXZBniBkvr
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:58:46 -0800
IronPort-SDR: 8zWpKV1GG73An1zpnhB0A6RHwKcvj53Vuxf9sCqOuA5ZBa5rmYze0QOVvU8HXRv/G7xpZnMIM1
	owK+1cH03BzVuf34Vf4nPTxb3MJRxKHU7MPVsfYKBvoE5U6OUm3WvlKRFiuZT6me2l9YBpl9Dw
	srBAVfHgvdy6RitQaBWTWMkJB+swHKrWKKu/bnpunnMHs5/vTt80z06ovpDFKB7vDmFytTZ38T
	a/jEmxYBTtNgI1MsJxovm0Lez6j5sfQFarO3Hedm9NgwCWDpXDWzTcx88c/FgbEiOtdVVLfaVV
	avQ=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:14:26 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:18 -0800
Message-Id: <20210128071133.60335-20-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 19/34] fs/jfs/jfs_logmgr.c: use bio_new in
	lbmRead
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
 fs/jfs/jfs_logmgr.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index 9330eff210e0..4481f3e33a3f 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -1979,17 +1979,14 @@ static int lbmRead(struct jfs_log * log, int pn, struct lbuf ** bpp)
 
 	bp->l_flag |= lbmREAD;
 
-	bio = bio_alloc(GFP_NOFS, 1);
-
-	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
-	bio_set_dev(bio, log->bdev);
+	bio = bio_new(log->bdev, bp->l_blkno << (log->l2bsize - 9),
+			REQ_OP_READ, 0, 1, GFP_NOFS);
 
 	bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
 
 	bio->bi_end_io = lbmIODone;
 	bio->bi_private = bp;
-	bio->bi_opf = REQ_OP_READ;
 	/*check if journaling to disk has been disabled*/
 	if (log->no_integrity) {
 		bio->bi_iter.bi_size = 0;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
