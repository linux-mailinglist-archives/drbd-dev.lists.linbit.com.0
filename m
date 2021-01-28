Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B7017306EFA
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:23:33 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9FE574207CD;
	Thu, 28 Jan 2021 08:23:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DD49B42060D
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:18:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818288; x=1643354288;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=hTRBelY7PTDZbFRPdQdHgUhYseaoF0bY2tLyF8ypbSg=;
	b=TI6GPPiCKpe5gRhG+Ji+DnAq5WqFYnAfGyTbfZjMCm9oKBJHnsx7b+9e
	hXt1ZJ/1nkoyljM5E8wY/W3T8woOPd5p1HYGzL6zRKtynefjbwoNCKJPM
	88OVmamBFF984CpRLCSH2DI5xUMSpW+/WnGKDdgP7mGkw60woKmcxUYo2
	TvjRQW229MWvtkLd+IluR1aXVkjwDaH1CdurAbYnvsQAgpH+BObh1vcNY
	53sxNpqYMq3ya2TNxSH2XtLrWQtZbDEjzjV6weKMaVHuO2az0b1hFzcFN
	QfRjBW53qyIGTrRDjom8aAxwNtpTPLpD2JGQak3hQsaMtevk3XnqYHIq6 Q==;
IronPort-SDR: mL5YKxqZE7HwQNEtrY6OHE/wzDurZbUMuOaY8t/DTDg7nFkvdGq/2UBpFfp2Kzdmcx1WsGiAla
	OLxOh2LWCfi6hhyGTdjlEM4RqYmvMvHtMV4ofSu90EMUhmbLFNag+wb7bhvg7awTT3onSj2be5
	PKqIbIaxp+uAazrYQRafsAwP2dpkyhGScHwCHJv6vzs1AokNF7ncH8WCACCPWFOH1ZE0JwDA6n
	6EnTmAzn3m+MiXi636gdaCrARpdcauI6eLvZUHxMsMELfcitfNbwT205rA9kbefvh0+lrHmlMv
	FIk=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="268892612"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:02 +0800
IronPort-SDR: 0UcDtaBy/Anl70e/sDQiauMtDX9QjRl28Hk+RWXOEiSgk0kT9z4LnCNoVz0wnZ+byTGOitb5hV
	yB8N5KjmYJUZQprvrB8C5UhP4mEAtxXhAPE5+ClE/H53mPh2WyVFI+BSk0YmFdwp08vrwgOPvm
	DptIhq4cbXXDj0bCBgFbOXATHP2mGU7JH8OXZ5NtBAcTeXalh67m79Sj1dCUI8ws09G/eGpDha
	gXLXkpKL2Fw3/yBtg+8YFkxn6RxJ+UWgWaPK3IEYR6KYC70ExlUFcZO0FpeX4QaHBuDLuqWH5n
	vLx9gTtLUAXeIzeaoRuRG5nT
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:59:22 -0800
IronPort-SDR: RvbuIrKpOmmqZ+oQPbnvg4P9b6yDctCj11PDSHseFUe3NzGe7aNswGzNT7aYrNNymGc7RRLBwA
	EyS5TC5ya2f1DBzchV289rrRJN4G30R6UcKQHWHLCT1EqyVYm8BdK2p8B74xj927ubYpSXJJYX
	yqNCzY6cgWt8a45E/OUvNDiMBg+lmhS8FA2ZqgTfl/62S3ZiS0x0JS7q7oikS9hfGQV2kW1Mb+
	vR4fnDhlmPbHKapqq2eTmDAeG1Ipck513pFwPBeDtMk5IkG3qgl83KvWp5povuzxSWxrnJjDon
	5kw=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:02 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:23 -0800
Message-Id: <20210128071133.60335-25-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 24/34] fs/nilfs: use bio_new
	nilfs_alloc_seg_bio
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
 fs/nilfs2/segbuf.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/nilfs2/segbuf.c b/fs/nilfs2/segbuf.c
index 1e75417bfe6e..df352cab7a93 100644
--- a/fs/nilfs2/segbuf.c
+++ b/fs/nilfs2/segbuf.c
@@ -383,15 +383,9 @@ static int nilfs_segbuf_submit_bio(struct nilfs_segment_buffer *segbuf,
 static struct bio *nilfs_alloc_seg_bio(struct the_nilfs *nilfs, sector_t start,
 				       int nr_vecs)
 {
-	struct bio *bio;
+	sector_t sect = start << (nilfs->ns_blocksize_bits - 9);
 
-	bio = bio_alloc(GFP_NOIO, nr_vecs);
-	if (likely(bio)) {
-		bio_set_dev(bio, nilfs->ns_bdev);
-		bio->bi_iter.bi_sector =
-			start << (nilfs->ns_blocksize_bits - 9);
-	}
-	return bio;
+	return bio_new(nilfs->ns_bdev, sect, 0, 0, nr_vecs, GFP_NOIO);
 }
 
 static void nilfs_segbuf_prepare_write(struct nilfs_segment_buffer *segbuf,
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
