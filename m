Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3604AEC58
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 09:29:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7C2D44205D8;
	Wed,  9 Feb 2022 09:29:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 52F114202D9
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 09:28:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=OEk2XaHb/rIimZjLxXur2nVVRIHACoTITsr2juHinrU=;
	b=IWwc9YcE+T5I1KZX+iZQFBfo8s
	KqCPMQVK2jizPUXyJzEj5gFfV2vJjVKBTqkaYzxbZ0FmcN8NyTvegdeaeG0kQG5Cmw3jDEcu+iAAN
	Mtdb5PFwL/3TYzxq9Xncw6uNog4v729g/7S19ffEiK6ua785n8bH1lwlEOMw+UznkTm//CaQ3vuNl
	htQXLe8Vmsehp6tMVwAYl6EdfWOlpivdIiP3Un+S3aIHQdK5FAHEKGMWZJtxqtQ/7M6XrXeY3ebk9
	U5DfMStSECKMOWMIwFNYgq23XBgRG0tXdj6m645JXOssrtce9mvxDHVB/pjjweJUDr18JDFzyMhzu
	hi8lCXpA==;
Received: from [2001:4bb8:188:3efc:ea2:7599:7eeb:4b5a] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHiL4-00Gc81-RG; Wed, 09 Feb 2022 08:28:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: axboe@kernel.dk, martin.petersen@oracle.com, philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com, target-devel@vger.kernel.org,
	haris.iqbal@ionos.com, jinpu.wang@ionos.com, manoj@linux.ibm.com,
	mrochs@linux.ibm.com, ukrishn@linux.ibm.com
Date: Wed,  9 Feb 2022 09:28:22 +0100
Message-Id: <20220209082828.2629273-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220209082828.2629273-1-hch@lst.de>
References: <20220209082828.2629273-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-scsi@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/7] cxlflash: query write_zeroes limit for
	zeroing
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

The write_same and write_zeroes limits for SCSI are effectively the
same, so the current code works just fine.  But we plan to remove
REQ_OP_WRITE_SAME support, so switch to quering the write zeroes
limit for a zeroing WRITE SAME operation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/scsi/cxlflash/vlun.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/cxlflash/vlun.c b/drivers/scsi/cxlflash/vlun.c
index 01917b28cdb65..5c74dc7c22889 100644
--- a/drivers/scsi/cxlflash/vlun.c
+++ b/drivers/scsi/cxlflash/vlun.c
@@ -430,8 +430,8 @@ static int write_same16(struct scsi_device *sdev,
 	struct device *dev = &cfg->dev->dev;
 	const u32 s = ilog2(sdev->sector_size) - 9;
 	const u32 to = sdev->request_queue->rq_timeout;
-	const u32 ws_limit = blk_queue_get_max_sectors(sdev->request_queue,
-						       REQ_OP_WRITE_SAME) >> s;
+	const u32 ws_limit =
+		sdev->request_queue->limits.max_write_zeroes_sectors >> s;
 
 	cmd_buf = kzalloc(CMD_BUFSIZE, GFP_KERNEL);
 	scsi_cmd = kzalloc(MAX_COMMAND_SIZE, GFP_KERNEL);
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
