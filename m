Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE9C4BFDC6
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Feb 2022 16:53:44 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8E5A442177E;
	Tue, 22 Feb 2022 16:53:44 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BAE964201FE
	for <drbd-dev@lists.linbit.com>; Tue, 22 Feb 2022 16:52:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=S8+4S3H0UDzuRr7Ri+YrsH/T52KS45+3M/mJXJ1lDz4=;
	b=u6BHbjkrjI9nVGrOchcq76/SSQ
	je48CtuVFE3/xb8Ni2UAW//vQ5vcj6gIWiRaOkjwy7XBxtOqepLlCzveme9E/3UETUyFIRgaTKwlY
	/WlyIlIQvqaNXwxZvvFWlfP9lTuTfCbGs66YZo50d2MeersSpvzkv/eD0Dk2TukzekCDR1LhmQLiS
	dl9KPrlw+/NzFsgfaV/fXP0REElbMOTDkplElq9yaFieHC2qMNyXYF43ykp+jZm0xjzN45WYRyJaN
	acOnoXVl0PeKl8BON27DJ93h3t8sjblsvfBrELXJ3lfN6+joud3zPH0vH3Q6t0YotP1iRAxjFUv0W
	KvSOPW1g==;
Received: from [2001:4bb8:198:f8fc:c22a:ebfc:be8d:63c2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMXSW-00APue-Ss; Tue, 22 Feb 2022 15:52:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Feb 2022 16:51:51 +0100
Message-Id: <20220222155156.597597-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222155156.597597-1-hch@lst.de>
References: <20220222155156.597597-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Chris Zankel <chris@zankel.net>, Justin Sanders <justin@coraid.com>,
	Minchan Kim <minchan@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>,
	linux-xtensa@linux-xtensa.org,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Denis Efremov <efremov@linux.com>, Coly Li <colyli@suse.de>,
	linux-block@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
	linux-bcache@vger.kernel.org, nvdimm@lists.linux.dev,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 05/10] nvdimm-blk: use bvec_kmap_local in
	nd_blk_rw_integrity
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

Using local kmaps slightly reduces the chances to stray writes, and
the bvec interface cleans up the code a little bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvdimm/blk.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/nvdimm/blk.c b/drivers/nvdimm/blk.c
index c1db43524d755..0a38738335941 100644
--- a/drivers/nvdimm/blk.c
+++ b/drivers/nvdimm/blk.c
@@ -88,10 +88,9 @@ static int nd_blk_rw_integrity(struct nd_namespace_blk *nsblk,
 		 */
 
 		cur_len = min(len, bv.bv_len);
-		iobuf = kmap_atomic(bv.bv_page);
-		err = ndbr->do_io(ndbr, dev_offset, iobuf + bv.bv_offset,
-				cur_len, rw);
-		kunmap_atomic(iobuf);
+		iobuf = bvec_kmap_local(&bv);
+		err = ndbr->do_io(ndbr, dev_offset, iobuf, cur_len, rw);
+		kunmap_local(iobuf);
 		if (err)
 			return err;
 
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
