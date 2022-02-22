Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E82A74BFDCA
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Feb 2022 16:54:14 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CF40E4205EC;
	Tue, 22 Feb 2022 16:54:14 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9E1744202C4
	for <drbd-dev@lists.linbit.com>; Tue, 22 Feb 2022 16:52:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=f0NF498hDCrz75r99TeO+EjHW8Kl3t4Al355uemFwlc=;
	b=37zJuMF9dgCA4QvIj001HeKVod
	iq1ff2Yd/eEwLZrB+5j9muZtNqaRLraBd4ZYvO0ckSDoPfCcxozaJa0fiTUcWRY/i1eqVgW6cu9ET
	p5KbiI+r2NKlvgUmKKEQrUC02MmduqovdVGY6Af0A6ezQi+2gacmeew4b3nMAM/sThVlQOMETyIKW
	O7TOyNV7rxTb8dYP4broU6NvJBSlQdgYmH/t77uliSjKa0dEUO+i/6pQrlAlEERXL7UXPOwMJ30MW
	tttO0W8K7T1YoOyopfjb/IJME2ZK0lWij1jXRt4u3fkD1GOUYxnLCjPsDatBF17s4YijYRfpxZuhg
	pUzpNPWg==;
Received: from [2001:4bb8:198:f8fc:c22a:ebfc:be8d:63c2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMXSZ-00APw8-Nq; Tue, 22 Feb 2022 15:52:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Feb 2022 16:51:52 +0100
Message-Id: <20220222155156.597597-7-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 06/10] nvdimm-btt: use bvec_kmap_local in
	btt_rw_integrity
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
 drivers/nvdimm/btt.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index cbd994f7f1fe6..9613e54c7a675 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1163,17 +1163,15 @@ static int btt_rw_integrity(struct btt *btt, struct bio_integrity_payload *bip,
 		 */
 
 		cur_len = min(len, bv.bv_len);
-		mem = kmap_atomic(bv.bv_page);
+		mem = bvec_kmap_local(&bv);
 		if (rw)
-			ret = arena_write_bytes(arena, meta_nsoff,
-					mem + bv.bv_offset, cur_len,
+			ret = arena_write_bytes(arena, meta_nsoff, mem, cur_len,
 					NVDIMM_IO_ATOMIC);
 		else
-			ret = arena_read_bytes(arena, meta_nsoff,
-					mem + bv.bv_offset, cur_len,
+			ret = arena_read_bytes(arena, meta_nsoff, mem, cur_len,
 					NVDIMM_IO_ATOMIC);
 
-		kunmap_atomic(mem);
+		kunmap_local(mem);
 		if (ret)
 			return ret;
 
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
