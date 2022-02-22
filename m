Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDD54BFD9A
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Feb 2022 16:52:42 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 10837421781;
	Tue, 22 Feb 2022 16:52:42 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E7368420060
	for <drbd-dev@lists.linbit.com>; Tue, 22 Feb 2022 16:52:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=aN/osrpoBd93lFAdSfaCdvaW2yQTD+I1EmrK67O47xo=;
	b=ymFEIIWRPVZXMO4JkLMfHN4H+o
	7lzhP/9wb5ws8ulA8vXqpL6Gnf5WCXLcVGI7F2t9VyOMuRbtoPZlJVUhojPyi+S4FRfvDhJWxlhnd
	VoASMEVXyotQDu2MRwUOaAP5BrK3099mEr7Jx/fY5YXGi0w9SHbxIv6Snf6d6iK3gNnUorFTXZot/
	m/T+Fcpv85Pv+MVabQuyRdgiQ73dUKa2KA4SAOoGctusaJfKEqtvWoZtDXyoogI4YAAk1XTAR0yMg
	lTynV8r5Vd22j5Svs1gzYSKHlSLIpZlXBew3dr8n26Py8vMubO6fI98CHaLTcF7Kd9TMcWgLC3mKk
	XYuBufXQ==;
Received: from [2001:4bb8:198:f8fc:c22a:ebfc:be8d:63c2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMXSL-00APog-La; Tue, 22 Feb 2022 15:52:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Feb 2022 16:51:47 +0100
Message-Id: <20220222155156.597597-2-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 01/10] iss-simdisk: use bvec_kmap_local in
	simdisk_submit_bio
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
 arch/xtensa/platforms/iss/simdisk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/xtensa/platforms/iss/simdisk.c b/arch/xtensa/platforms/iss/simdisk.c
index 8eb6ad1a3a1de..0f0e0724397f4 100644
--- a/arch/xtensa/platforms/iss/simdisk.c
+++ b/arch/xtensa/platforms/iss/simdisk.c
@@ -108,13 +108,13 @@ static void simdisk_submit_bio(struct bio *bio)
 	sector_t sector = bio->bi_iter.bi_sector;
 
 	bio_for_each_segment(bvec, bio, iter) {
-		char *buffer = kmap_atomic(bvec.bv_page) + bvec.bv_offset;
+		char *buffer = bvec_kmap_local(&bvec);
 		unsigned len = bvec.bv_len >> SECTOR_SHIFT;
 
 		simdisk_transfer(dev, sector, len, buffer,
 				bio_data_dir(bio) == WRITE);
 		sector += len;
-		kunmap_atomic(buffer);
+		kunmap_local(buffer);
 	}
 
 	bio_endio(bio);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
