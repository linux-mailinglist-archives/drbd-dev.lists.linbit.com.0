Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB4F306F8F
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:33:34 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 602E942066A;
	Thu, 28 Jan 2021 08:33:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 94D3342066A
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:20:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818453; x=1643354453;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=ph9rmwEURyYiJjcGgT3e2aApJZNJOSNpUoZqKSV1dx8=;
	b=DkGSnjL/CHR/aVPwgyZN7sn0kvyoDancb8iRUeUPwC2P17qvB372pLP1
	iekvB6A05Hd+mW7i+fE5GiNZgJRuuSwJ7xfbaunwryxbLbO/eXv8zda9H
	8tKUbW3B2cIbErXgTaX5lOCUyECmF7pD4LLpxcCUsQhbTMvpxYyc8Un/l
	1GnbjHvZpEr/o38YIr7hFOcfVPMoo8xD4XxCDS8ddCHw1+OKqgE6B6gAL
	HA+kq1ZDuh9OUqY1Y0+XQHRfuJsjwimJrIYQHPQsUuFFfKPJC9k2luvOg
	fms8XmGzwPJRypmAHRPqW8RTALobCA0uY4eaEIec52Xti3yNCg5gXYALr Q==;
IronPort-SDR: ZQEIlSfwJjYThB1uK8zoF4Mhbo47Fitj0dHk6mGn87Yg1bfPH0J3om1/VBEtIRnHoQd42/yScb
	gSVvdQ3EZHABydeIv854lCRnWNH1L09HhDjs2wqbR6LF0jaf/8nn3JatTy4EsJoyJv7HA833pp
	JZOhwDrzQr8X8fk/gOt9n1jp+xUIWlvs5oyRTYFldb7J7ytLaAMkv9wAxJRp+HDACkOMxK2hA4
	7fDk+VFfkr7YfNTxonyAiACTW80Z7tDvhWxOQrsL5mJR7WkoXlNklNQaiXvBDD/7lXpXq9GMGS
	cdQ=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="159693867"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:13:46 +0800
IronPort-SDR: qrSzVcWh5XKYCo2zDDOEZj4qpl2gxzyNfSnzYyJNRGIRagyLyPtvOo6U3Yni/2tFvTNYLIk94X
	SQgt2sGRgtR1Fo1x1dpTecZfeTa8n0DlSfzHvhe1azB/oGdedZDnvgjqxE6Yj0KK2wdVI6vIHm
	LyJYYhio/87q8TuRmI0qWyQdB1yOLkZj+VXb8yDAh2i6Q3T6gdf9shUOTD7a3uqolR18Hfjo9A
	9cYkY3ijCnUEDQ4uZ8NJs3+S4TiaFTSQ7Qzq+piDYgKNDKtDmpmG9OUoGHW0eRw9BAMJB57mq5
	cUncpgrrhh/4mpg2K40iOaIL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:56:04 -0800
IronPort-SDR: 2qgPwD8neR80/SdtH4pRH50bxmDr7msnaiMmu0nET+XLf24Atsm9LH9w2S7p7pMRphnBeo5pVx
	VOFkyyTuzt5tWdOljMzaLRlQ/2Y+vBgbMl5P6BLyAgHROT8V3ajdo6WQ+YwR34TObygZuUERZX
	rfU+sPmHgGS1V+3dgxOeo8REERCKgWHIYxzhiuWRBtY6dBheQaeAr6VP4LTAPeLl+kd1iFUoyd
	mqKwU7dlwbyE4M8F7GURh/yglDYKxcs47wr8oitkT1bgU4EtSPSZoGcLrNM5tqqKQP8I79UW3Y
	S3E=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:13:46 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:13 -0800
Message-Id: <20210128071133.60335-15-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 14/34] fs/buffer: use bio_new in submit_bh_wbc
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
 fs/buffer.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 32647d2011df..fcbea667fa04 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -3023,12 +3023,16 @@ static int submit_bh_wbc(int op, int op_flags, struct buffer_head *bh,
 	if (test_set_buffer_req(bh) && (op == REQ_OP_WRITE))
 		clear_buffer_write_io_error(bh);
 
-	bio = bio_alloc(GFP_NOIO, 1);
+	if (buffer_meta(bh))
+		op_flags |= REQ_META;
+	if (buffer_prio(bh))
+		op_flags |= REQ_PRIO;
+
+	bio = bio_new(bh->b_bdev,  bh->b_blocknr * (bh->b_size >> 9), op,
+		      op_flags, GFP_NOIO, 1);
 
 	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
 
-	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
-	bio_set_dev(bio, bh->b_bdev);
 	bio->bi_write_hint = write_hint;
 
 	bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
@@ -3037,12 +3041,6 @@ static int submit_bh_wbc(int op, int op_flags, struct buffer_head *bh,
 	bio->bi_end_io = end_bio_bh_io_sync;
 	bio->bi_private = bh;
 
-	if (buffer_meta(bh))
-		op_flags |= REQ_META;
-	if (buffer_prio(bh))
-		op_flags |= REQ_PRIO;
-	bio_set_op_attrs(bio, op, op_flags);
-
 	/* Take care of bh's that straddle the end of the device */
 	guard_bio_eod(bio);
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
