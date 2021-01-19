Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBFE2FB33A
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E3DCB420809;
	Tue, 19 Jan 2021 08:37:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 810264205FF
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:15:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033311; x=1642569311;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=cW+SY0F4uLtssGzI42l+SJRJJ7OOq+Ii5A3v3sT7Yes=;
	b=YNkuL6qwR3R49kYuVtZyysuIasGdlTwk0nqS9+cd4rezrPV2zAlNcCvJ
	RocmR2U+AT+KvGPncSMEK6/S22gDijJPiSVZx+ZA2lreiREymjzmixmda
	ffPA00z7yebmMkiKQihw2V7jeUes52UqVPLnJswHYh5By4tR8hfl6yrzM
	9QjI05687fUgHWjiTsFxPuYlvvtCRN6ITgYWgJa3XumA6r2494I0vjiZx
	cv6zQREyTvCIAO/Z8DRSH+7TFiCp9mwTHw0vvdPShv4fgVhivLMcYqnAN
	oTFALreSuZYCNTeXXqgIlt5v2lM/eTTOeRw0mbGzEv9f3vcF3N1KI5vWb g==;
IronPort-SDR: bScGyyM/B04gsEuo1/J5UHClJkUdLb6Z/MnG6ZqH0cmK3Yf51AIZ3jPmlC0ZKSmCkNT2V2bPbf
	mMu+tTDsoMZ9R4wI7rLZG0J9UhpY2qiJcZlTste/QOpKjcjOXaoIOnGsOsphQDo67Xd9BHoCxI
	+fY9yYPuW/MUuvkGBR/s9WlBSFyw6bxPBiZhevHnKQJNJktrYCdl98NeBDT0RIlog6mDvSmxyH
	wO53nn76RHMaSY09oRjPIjU64cr22v+UDtEyqh6bcC31HwFlwDwBcVa/BNt+f9LloPSt/78uwd
	sik=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157764120"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:11:05 +0800
IronPort-SDR: iY5pD5B2RRAFb/WzDiUjZl0fkwkNonmJC2dELbqtycb0R2N9dLfKTmhmbBCcDCps5KqS7JFFde
	lCA5qe+qdtc/HJbI9g8qNPwnwUOzkZUuaRVakN+FVpp35JADLvZvT4I13TEqllyQe0zc6P+dAN
	6ox+by3nsmJIieax5V3XGpRYHWDaLyILlCUF2wy53VwBoC4q/0w8UPUBdLefF5oJ6wMLe9b9nQ
	S4oQR/kMjuT8Az9TxJ04NjLp0PPc9QuAVmp3qlvmD4374QC1Rybm2n+gi8P0/DsHLArJznZVxn
	WSjUiKYIcC8rSnKq9EWrdVCy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:53:41 -0800
IronPort-SDR: JhXhgWS0+e3HTDStYfAXJ39RQBEk0euVnqe58ziJOnn1c9Zev+zyQZ1feT8Pf3jy1k/0jfejeB
	9eRQsJQYlpsXL/MQdwG+RKeojvlhwZb7/kK3K8LYVIUeWuWwf4teK/xrJ6FiTzChv1xe4/bY5+
	eWHUFZ+nWTw4YtzlPxnn6S3DZ4LcVreyfhizYCPM9a4WY7tqwq6bMPlFdYm38BooiwkcJvUlM2
	jto6KJJwnZYWpzG78qeBvec0imqsf+1kIqtJBGsfGtjSerNFR4ZUCja3e3hANc2sx71Lno1zNp
	h1M=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:11:05 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:31 -0800
Message-Id: <20210119050631.57073-38-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
References: <20210119050631.57073-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Jan 2021 08:37:53 +0100
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net, snitzer@redhat.com,
	gustavo@embeddedor.com, clm@fb.com, dm-devel@redhat.com,
	adilger.kernel@dilger.ca, hch@lst.de, agk@redhat.com,
	naohiro.aota@wdc.com, sagi@grimberg.me, darrick.wong@oracle.com,
	osandov@fb.com, kent.overstreet@gmail.com,
	Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	josef@toxicpanda.com, efremov@linux.com, colyli@suse.de,
	tj@kernel.org, viro@zeniv.linux.org.uk, dsterba@suse.com,
	bvanassche@acm.org, agruenba@redhat.com, axboe@kernel.dk,
	damien.lemoal@wdc.com, tytso@mit.edu, martin.petersen@oracle.com,
	song@kernel.org, philipp.reisner@linbit.com,
	jefflexu@linux.alibaba.com, rpeterso@redhat.com,
	lars.ellenberg@linbit.com, jth@kernel.org, asml.silence@gmail.com
Subject: [Drbd-dev] [RFC PATCH 37/37] xfs: use bio_init_fields in xfs_log
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
 fs/xfs/xfs_log.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/xfs/xfs_log.c b/fs/xfs/xfs_log.c
index fa2d05e65ff1..062ee664a910 100644
--- a/fs/xfs/xfs_log.c
+++ b/fs/xfs/xfs_log.c
@@ -1702,10 +1702,8 @@ xlog_write_iclog(
 	}
 
 	bio_init(&iclog->ic_bio, iclog->ic_bvec, howmany(count, PAGE_SIZE));
-	bio_set_dev(&iclog->ic_bio, log->l_targ->bt_bdev);
-	iclog->ic_bio.bi_iter.bi_sector = log->l_logBBstart + bno;
-	iclog->ic_bio.bi_end_io = xlog_bio_end_io;
-	iclog->ic_bio.bi_private = iclog;
+	bio_init_fields(&iclog->ic_bio, log->l_targ->bt_bdev,
+			log->l_logBBstart + bno, iclog, xlog_bio_end_io, 0, 0);
 
 	/*
 	 * We use REQ_SYNC | REQ_IDLE here to tell the block layer the are more
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
