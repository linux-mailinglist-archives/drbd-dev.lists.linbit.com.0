Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBDB4BFDD9
	for <lists+drbd-dev@lfdr.de>; Tue, 22 Feb 2022 16:56:15 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E3ABE421783;
	Tue, 22 Feb 2022 16:56:14 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6DCD142011D
	for <drbd-dev@lists.linbit.com>; Tue, 22 Feb 2022 16:54:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ISvKp3WNThdGNNdE3CYZoY0ytkmqO3Mj6EgB8eb205Y=;
	b=EipywGk+8rUluKSC8VJJUrQ5mC
	KYd2nprYD3H2ROhE8ZIXmDUTrpFIxjjP/oau+TXm8s/WVq3PCNfEbV4ULA6kEV1JpOE1saNgFYc4W
	2DBn4YhI22xv6nV0h+xGZQLeDtZongs1oQlQjjrV9Ie2q/k0YQCzlv4SBwfNhCEvXF/3ol66ADtc/
	xBEadeDJN9vlSFQaCsj+bpdvXCrdFIn7bwmJM+IaA8Iq9VpGpo5gWvv0VUJXf9xy+r/0DphqCGwQ3
	ZVMtViuZzKYYLlYXnCr6N3vjSrhFj9jyC4e5QkJEAOgnwCa5ipXwPNVMKQUWtaO9drkB6G9HuGeKC
	UB7j9zmQ==;
Received: from [2001:4bb8:198:f8fc:c22a:ebfc:be8d:63c2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMXSO-00APq7-Gi; Tue, 22 Feb 2022 15:52:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 22 Feb 2022 16:51:48 +0100
Message-Id: <20220222155156.597597-3-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 02/10] aoe: use bvec_kmap_local in bvcpy
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
 drivers/block/aoe/aoecmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
index cc11f89a0928f..093996961d452 100644
--- a/drivers/block/aoe/aoecmd.c
+++ b/drivers/block/aoe/aoecmd.c
@@ -1018,7 +1018,7 @@ bvcpy(struct sk_buff *skb, struct bio *bio, struct bvec_iter iter, long cnt)
 	iter.bi_size = cnt;
 
 	__bio_for_each_segment(bv, bio, iter, iter) {
-		char *p = kmap_atomic(bv.bv_page) + bv.bv_offset;
+		char *p = bvec_kmap_local(&bv);
 		skb_copy_bits(skb, soff, p, bv.bv_len);
 		kunmap_atomic(p);
 		soff += bv.bv_len;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
