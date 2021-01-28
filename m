Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 43547306E96
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:19:01 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1B653420629;
	Thu, 28 Jan 2021 08:19:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 83BBF4203D0
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:17:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818234; x=1643354234;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=mzuBJgEjO7736zP2e3T55gtpCfO2cszPJHhO/o9ayC4=;
	b=YRmsGlVY7rSiMmEmAnRvgTXaP6I1Jrjx9MtdeqNdT4p7+xSRwPSdVu9i
	maSsUBx/y2u2Dc5wysenB4OD9+wjueNJOrnrekiOUZjdgI9sn6r/52UCa
	ep1qVfzPkSKqW7Em/S5vO4e4VJ+qpOGoGdRekC1V513WGNFsA/wLaH75i
	Hw+0HYp7DM5XrFBJ9jcDRI2Y4qLDM2fkC7X8pie2FI9Qy7TeQpFrv/3yx
	pdOgAq2AOZVUuF1IQFQX7d5zKhgijXi9USvo2BEwBN/eKC/XDZblpNOXe
	i5bEq7niNsFPL5Zl9GL0n0fMgXqlqGAGv0J4GU7LLTAZflVJvS10xVNmO A==;
IronPort-SDR: aDbCRDx4x741KIdXD7tBW/M6PAyrS0Z0Al9NUVWHs+EWkglqWLJo2e05wjMVhqoQIVvWyWtlBW
	ZqBjgHkVyJCSsr8NT3B1uUav3NYQ9yGFnZng4EMCaYSnnlRVyvLaOtJM2n7orvmf+ATOGJ3uVg
	ikX64gCqxUuYbpFvG6r7+U1Ap0Y502qh0SYKzdOsDgnZ3KGk3O1YGE04a4KdlRFHX4o/WSjAMZ
	rZoLWstlgt+IqW9yia9CGWL1ERizXuunkEZslDzKi4hnyAlsgM91A6Xg2WAoppmZq3K7Elllx0
	lG8=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="159694084"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:16:11 +0800
IronPort-SDR: xpDfbls0r9IabVCgRasyhtrbo/1nk9XdwZwU5V2jgoLx23PY1F0YBSAaALjRkDVK4hErILWxn3
	xHcVptVFaM15R70kzdgLd8PH98rn0Yv3Ith1pCG5fSnN0l6kQPOUJLyvPsVA7NWnUtVD4tD/7a
	mPoDdQGbkdWsquvbyLktAB9u84Zg9xpCZW2TArh3wbnDq3qOX18TzpoilduXV+AkSdgDgAvcny
	HADda+y6Plq8C3QtLIg6D4Wp7QwxcjYXa5YkAlNTHEQ5jrs71srAlJ+t8TNqarw5zwSOfc9ABd
	AZAXm3zzWPwqITxIOEgeERyp
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 23:00:31 -0800
IronPort-SDR: g9DYrZw82vrtcoqwLuT41C5LPwtay4x47njX4TQvn100PG3qzIQDYIPSbD2aKZ0nambVfkCSmu
	JHC6z8/1ifbcXhuz1R2nfguMjBFRQ4RaTCr3wehJDb3ERuWQ1NBrP8es0szoYDQyY3216WdfEV
	JcMopMzzk+/Wudlq5O10ELulyKCOeTk+PuDGw5+9rtJas4CG58lZZY6nLuQYmFyKdDpDYbQYnL
	x05lIaxi3M2yfAJSgs6mfnc20aeVZIpUbieSq2c4z3+si2ic8ziehclZMxZZAWaM0XsUZa2+hJ
	/C8=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:16:11 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:32 -0800
Message-Id: <20210128071133.60335-34-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 33/34] mm: use bio_new in swap_readpage
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
 mm/page_io.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 25b321489703..7579485ccb5e 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -342,7 +342,7 @@ int __swap_writepage(struct page *page, struct writeback_control *wbc,
 		return 0;
 	}
 
-	bio = bio_alloc(sis->bdev, swap_page_sector(page), REQ_OP_WRITE,
+	bio = bio_new(sis->bdev, swap_page_sector(page), REQ_OP_WRITE,
 			REQ_SWAP | wbc_to_write_flags(wbc), 1, GFP_NOIO);
 	bio->bi_end_io = end_write_func;
 	bio_add_page(bio, page, thp_size(page), 0);
@@ -406,10 +406,8 @@ int swap_readpage(struct page *page, bool synchronous)
 	}
 
 	ret = 0;
-	bio = bio_alloc(GFP_KERNEL, 1);
-	bio_set_dev(bio, sis->bdev);
-	bio->bi_opf = REQ_OP_READ;
-	bio->bi_iter.bi_sector = swap_page_sector(page);
+	bio = bio_new(sis->bdev, swap_page_sector(page), REQ_OP_READ, 0, 1,
+			GFP_KERNEL);
 	bio->bi_end_io = end_swap_bio_read;
 	bio_add_page(bio, page, thp_size(page), 0);
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
