Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 278F4306E90
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:17:03 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 12F374205E5;
	Thu, 28 Jan 2021 08:17:02 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Thu, 28 Jan 2021 08:16:42 CET
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4DAF2420341
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:16:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818202; x=1643354202;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=mX0lBXgZV5dDDUNO5/xUPQTxA6WXojrnDbaB4rJIAQ4=;
	b=OgRyydZvRUT+EDqSBKpCWDoQpnRKiL+D0owBvpcfqmq14icBZyo1T7M0
	WiEBycLT+qMRhzsOJQLES3IstEz6U19/h6G8n1DJfNvkH+e5AMksYdgLm
	EHxgg6SvjX/C+Zd2QqpldiybaaPhJoha1uu6EB3FzLT7fgYdo6FI7kRn4
	geJT/MQsIjHMUMFuX3/5sVYwofw3W0EU+N75u2qkuPIzyaoLEFiZVUEYH
	TH9JGRTU3k0dQdzdZJPJLGZX5AAu/Z5UKUHHvPHO3zm21EsDYvRaJn6HI
	ye+Zo12weUqeQ1y9WBSQHFHp/Q9bIIAujzKvphZ4oRIXGQ+oUtgph8eOG Q==;
IronPort-SDR: q8a6/CUpMYVpHkpxs2L3fGaoHhWQgPOcl1n3j8G23eXG7zs/gCHRxuvRZDuR2vT1KGyUexJuVM
	Lpi+rfMrkqZNsQ+AARjVsecYgQHRxTHIj3h8ErT4dddd0M7pbtz1BIQJmxZemZILICIa+mHIVL
	iOXDLPPfpVIkMg7TVxfOZeaXk8uLJ/rSbcTCt/UZxqtt1gAeM/H2KHL9Val/tYGfDdkTCuUQON
	R93v/9ZLp0IwxTSjVauwJYNjJ4FhcW7xmLNkrUT63laeWGCIZbD1k0hcSlowYVCLq+ZPMJw/k7
	IG4=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="268892671"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:39 +0800
IronPort-SDR: ca5pj8INTJ8VWk+s1SsLUGU6vlfpQo+YQhpA5ivmcj28G43zslkIbdsTnLyGXriBbHOrC45Tt8
	9wUp4Uw7VscgJv5z24VHHZSbxnHTdjcLVOBCFvOQz2GtXH/wzQVOjPypmCRUTFeDX+dEXZucZd
	1qijgiaVC6Dii44d9/6rsFneiS/cYgQ4tC7fsGIUeG24XktcUV2zvfDzlI5+SO66vR6hLkBxHY
	AvXRMdLQCeGY7Kh4Uw2H3E9RZnwwxUHfg/auTAb9J/+rFS3N9vlVkUJB9GqTJcAwRGEv2b6C/H
	S5fCzEkgZP6OIDyzXQGL7Q7T
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:59:59 -0800
IronPort-SDR: +tiKd6++/IklFSy7iDJaHbayhG5AQMYy46sQaNwq7O80dac1IZ8ZNlxjx4DxYbXvKYV6ua9+Jn
	RJlpIO7cWN3eoJjRXIKMWDgWPb2hxGv4A2WF6qkOCUmJWGu679NggrholDw0Y/zhUvvPmDPwT6
	YMwbiHmVzfz4ihKs4Lc84G8Ml2oUugQkKwA3saHG7RouPgTCEOWIbUjZGA0E7lav6RMiRyuWgb
	NQVibBmtLzaPM7sNDSYSURpVt5muhPgCfKQdUKPwhH4mY9hUDkI5QyIoSDd8h2S0Ai5kAfU9pn
	AHM=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:39 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:28 -0800
Message-Id: <20210128071133.60335-30-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 29/34] power/swap: use bio_new in
	hib_submit_io
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
 kernel/power/swap.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/kernel/power/swap.c b/kernel/power/swap.c
index c73f2e295167..e92e36c053a6 100644
--- a/kernel/power/swap.c
+++ b/kernel/power/swap.c
@@ -271,13 +271,12 @@ static int hib_submit_io(int op, int op_flags, pgoff_t page_off, void *addr,
 		struct hib_bio_batch *hb)
 {
 	struct page *page = virt_to_page(addr);
+	sector_t sect = page_off * (PAGE_SIZE >> 9);
 	struct bio *bio;
 	int error = 0;
 
-	bio = bio_alloc(GFP_NOIO | __GFP_HIGH, 1);
-	bio->bi_iter.bi_sector = page_off * (PAGE_SIZE >> 9);
-	bio_set_dev(bio, hib_resume_bdev);
-	bio_set_op_attrs(bio, op, op_flags);
+	bio = bio_new(hib_resume_bdev, sect, op, op_flags, 1,
+		      GFP_NOIO | __GFP_HIGH);
 
 	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
 		pr_err("Adding page to bio failed at %llu\n",
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
