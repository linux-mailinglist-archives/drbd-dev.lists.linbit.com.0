Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D96306E92
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:18:01 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8C96742061D;
	Thu, 28 Jan 2021 08:18:01 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AB3D44205FB
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:17:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818228; x=1643354228;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=gllqHMP2deuE0vZ0qLUvAasM9UgJt1wGssSRSahQx/E=;
	b=go5sXx6FU1JCEin3By3AnBF1FpKXtWS7Ipbcl5IywosDnUAKtfTA98dI
	nRhLOzvem1rFtCV/E1smdPVMlbsODxNVZxR//8WeOErKOyKEJSh9QSEMr
	29JHQk/Cf6o65ij60EWK3ljXO4UmjcIkzgG9wRGg/0ShhDrblz8AQQK+o
	0yMr/BvPsYmyfo7Ya5Lu8jDueTbW4cHYe081Grz+lA6NikClNtKKhc4uZ
	K/Of08ySpjv/XM4tJPUkVzckMyk62CBCsbGmYfwz1IXcMEid7uRcTzQXy
	wbEUYGVl1hWf4g2frXg2+20tjsA+cmFbg6//4VVjGvpyj81omSjnjYD04 g==;
IronPort-SDR: c5K1J8b/A1Qv5DcpK33w10bqK8y1TmbQ6cPTGEjiy+nIHZtRkdQURJ+BHutKboaTCl4ULe8ZNG
	8Kp7G7LkTbwRPNiffm4nnFzWpVtq4BVBxlLpbjAvTbbFAGhz95GvNSSQ/uuj1Mgvb/uXlNhzBI
	KCk2VTXGv4NNoZ+hQ80mgfi79IB2DyxdUC88Vm021HL0S56NyUmFy49Cfghkz9TkHD11Lj7xOM
	01jdo00KGyXTlCjewKa6Ohl+FpYxNoatkMMjtN005xAuRJHZRs5HuAfiAzFGlLyjIHCbooPgtj
	j88=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="159694069"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:16:04 +0800
IronPort-SDR: lYLJOVLZnlwArU4BZk4d219V0P8czh0WM/8yONC6DPIbobp9sziiHsHzFA3Isuniofthq+5R8E
	VdqSge3WbhT/a5TvPRc58aTwcmS/7GQ3k/SGSeLSMxtgCnb5/wfai84pnVthj1V8NVWaJAoSCM
	W0744cQqrqKrLPnvljVTeeLwrpaLC3Xa8TYZAekkwM+ldgIdfB1G4h8CoBBJEqfjw/TTOn+FyX
	3f/UOj0qu6UdFEXYlEAOKb6PBTjFgJPnZwa0LIAptTpnOCYYVk++TJIQNNcQk0cGK7cEcTeOVs
	s61I9HKDuR8+f9rwJ3zMK1l2
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 23:00:24 -0800
IronPort-SDR: Grws0RkRukNGo7nyou8ZmIctRPf+YpsLcKEKHc3Y9j2gH1wu+DvtqTycxE/+Um75XSsvYHsJz2
	XuCl7g+xJPknbJtkfE6+aL2ksGkx9esZlvJSCaOOok8lPoOpNpuMTJUvJF76PXh6twtzc4hV4l
	Ck271Nzyl0bN3jPxPpXSp854weGQ+wyoheQ1qJh2ewh7GEZUQlec6Cx5gMyzUS7NDfOacpsNSA
	i4cQzL4qbQiTmP11yVUjlWBUXU4/5eKNIGO+C/0onsAsvTsPxAAYkHYwd4fug7gJV2TpCU6JnF
	3ZY=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:16:04 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:31 -0800
Message-Id: <20210128071133.60335-33-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 32/34] mm: use bio_new in __swap_writepage
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
 mm/page_io.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/mm/page_io.c b/mm/page_io.c
index 92f7941c6d01..25b321489703 100644
--- a/mm/page_io.c
+++ b/mm/page_io.c
@@ -342,10 +342,8 @@ int __swap_writepage(struct page *page, struct writeback_control *wbc,
 		return 0;
 	}
 
-	bio = bio_alloc(GFP_NOIO, 1);
-	bio_set_dev(bio, sis->bdev);
-	bio->bi_iter.bi_sector = swap_page_sector(page);
-	bio->bi_opf = REQ_OP_WRITE | REQ_SWAP | wbc_to_write_flags(wbc);
+	bio = bio_alloc(sis->bdev, swap_page_sector(page), REQ_OP_WRITE,
+			REQ_SWAP | wbc_to_write_flags(wbc), 1, GFP_NOIO);
 	bio->bi_end_io = end_write_func;
 	bio_add_page(bio, page, thp_size(page), 0);
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
