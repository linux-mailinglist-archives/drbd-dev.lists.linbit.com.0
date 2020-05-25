Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 071411E0D52
	for <lists+drbd-dev@lfdr.de>; Mon, 25 May 2020 13:32:55 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E856E4203F1;
	Mon, 25 May 2020 13:32:54 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6BFD34203D7
	for <drbd-dev@lists.linbit.com>; Mon, 25 May 2020 13:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=6q0JZlv6yk8CHhGPFeT7uICF95ljL7cHdN6LUQXOkNk=;
	b=ldwlZKv1HI1TjI572L0NqiGrY5
	Dw+zIeRHjvNa1t18biM/jI9PjQwjir0TcLv1jyJSG/uAIYBeC3W1zJd+DRVX2rzmh9a3XNEquIWvq
	95P2v9xOuQWyvb4ggBjW79fYVsBTu6Al1JN9SczCfg2zt/kcDTVxJoTvPgtb7IjKlX+vAkQNEdZQ9
	ymFv7xBo8JaHLBqJD2XTmTiIjTHSvdRonnXUdTdCxxYPd2UvbvQUIJfw8WbCLUkLf0M/4kzxqMhZ/
	mntxpjRh0kJFMIb22sEo4gL/Bft/rHtRKS9yDmIDCjaadrkTss9FKqsoiitau1J2hAf58pojKEpjr
	GtYctC3Q==;
Received: from [2001:4bb8:18c:5da7:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdBJM-0002Oe-UX; Mon, 25 May 2020 11:30:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 25 May 2020 13:30:02 +0200
Message-Id: <20200525113014.345997-5-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200525113014.345997-1-hch@lst.de>
References: <20200525113014.345997-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-nvdimm@lists.01.org,
	Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
	dm-devel@redhat.com, Nitin Gupta <ngupta@vflare.org>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 04/16] lightnvm/pblk: use bio_{start, end}_io_acct
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

Switch rsxx to use the nicer bio accounting helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/lightnvm/pblk-cache.c |  8 +++-----
 drivers/lightnvm/pblk-read.c  | 11 ++++-------
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/lightnvm/pblk-cache.c b/drivers/lightnvm/pblk-cache.c
index 5c1034c22197c..f185f1a000083 100644
--- a/drivers/lightnvm/pblk-cache.c
+++ b/drivers/lightnvm/pblk-cache.c
@@ -21,16 +21,14 @@
 void pblk_write_to_cache(struct pblk *pblk, struct bio *bio,
 				unsigned long flags)
 {
-	struct request_queue *q = pblk->dev->q;
 	struct pblk_w_ctx w_ctx;
 	sector_t lba = pblk_get_lba(bio);
-	unsigned long start_time = jiffies;
+	unsigned long start_time;
 	unsigned int bpos, pos;
 	int nr_entries = pblk_get_secs(bio);
 	int i, ret;
 
-	generic_start_io_acct(q, REQ_OP_WRITE, bio_sectors(bio),
-			      &pblk->disk->part0);
+	start_time = bio_start_io_acct(bio);
 
 	/* Update the write buffer head (mem) with the entries that we can
 	 * write. The write in itself cannot fail, so there is no need to
@@ -79,7 +77,7 @@ void pblk_write_to_cache(struct pblk *pblk, struct bio *bio,
 	pblk_rl_inserted(&pblk->rl, nr_entries);
 
 out:
-	generic_end_io_acct(q, REQ_OP_WRITE, &pblk->disk->part0, start_time);
+	bio_end_io_acct(bio, start_time);
 	pblk_write_should_kick(pblk);
 
 	if (ret == NVM_IO_DONE)
diff --git a/drivers/lightnvm/pblk-read.c b/drivers/lightnvm/pblk-read.c
index 8efd14e683dc4..140927ebf41e9 100644
--- a/drivers/lightnvm/pblk-read.c
+++ b/drivers/lightnvm/pblk-read.c
@@ -187,12 +187,11 @@ static void pblk_end_user_read(struct bio *bio, int error)
 static void __pblk_end_io_read(struct pblk *pblk, struct nvm_rq *rqd,
 			       bool put_line)
 {
-	struct nvm_tgt_dev *dev = pblk->dev;
 	struct pblk_g_ctx *r_ctx = nvm_rq_to_pdu(rqd);
 	struct bio *int_bio = rqd->bio;
 	unsigned long start_time = r_ctx->start_time;
 
-	generic_end_io_acct(dev->q, REQ_OP_READ, &pblk->disk->part0, start_time);
+	bio_end_io_acct(int_bio, start_time);
 
 	if (rqd->error)
 		pblk_log_read_err(pblk, rqd);
@@ -263,17 +262,15 @@ static void pblk_read_rq(struct pblk *pblk, struct nvm_rq *rqd, struct bio *bio,
 
 void pblk_submit_read(struct pblk *pblk, struct bio *bio)
 {
-	struct nvm_tgt_dev *dev = pblk->dev;
-	struct request_queue *q = dev->q;
 	sector_t blba = pblk_get_lba(bio);
 	unsigned int nr_secs = pblk_get_secs(bio);
 	bool from_cache;
 	struct pblk_g_ctx *r_ctx;
 	struct nvm_rq *rqd;
 	struct bio *int_bio, *split_bio;
+	unsigned long start_time;
 
-	generic_start_io_acct(q, REQ_OP_READ, bio_sectors(bio),
-			      &pblk->disk->part0);
+	start_time = bio_start_io_acct(bio);
 
 	rqd = pblk_alloc_rqd(pblk, PBLK_READ);
 
@@ -283,7 +280,7 @@ void pblk_submit_read(struct pblk *pblk, struct bio *bio)
 	rqd->end_io = pblk_end_io_read;
 
 	r_ctx = nvm_rq_to_pdu(rqd);
-	r_ctx->start_time = jiffies;
+	r_ctx->start_time = start_time;
 	r_ctx->lba = blba;
 
 	if (pblk_alloc_rqd_meta(pblk, rqd)) {
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
