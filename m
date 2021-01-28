Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 108A1306F17
	for <lists+drbd-dev@lfdr.de>; Thu, 28 Jan 2021 08:24:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DC8C44207CF;
	Thu, 28 Jan 2021 08:24:03 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F266142061F
	for <drbd-dev@lists.linbit.com>; Thu, 28 Jan 2021 08:18:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611818301; x=1643354301;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=MfH3EN2qKmNoDMJp2ceJniIXfb1rQ8RA/+9VrY6oRvA=;
	b=LGM/O5wYV4HLPVtniy4xsJ/ylmH2J4d8qrkGI8QZCiJrdydOMZHTdyE+
	8tus3aG/GoqO2cf+xcpOuKnmAJ/Qq+3OiUzEosjroCGTqHk8qnR4oT8X9
	2oNapzgNQnck4s61ed+PLg3doAVMJCQfnYtwc0inl5kU15cwxHGUcfJqW
	GLHKU9weQ/Uf2UIjSwmZFeRvhUHQYMVRqVuxW/NTJOGdOT5A0gAVHzDaq
	T/DErgWjyvgagFGjDOfflJ5yf+dRJhQgroGJQd7P/8EibCz+Iq0TwWMEt
	rVPnZdD3CwcoegM8Btro6iQxXctHDt1v/jxWPKL/+Z8WjpuFJ2VXewI/i g==;
IronPort-SDR: sTTZSiahlTOih5u+MVGkf50ppBnr2h+n46u1wC8tHYsueq7+P3Ss/sGfwCly41x+vhND0BNhYi
	vtVpZMhFXQjtD+wnE68LQgtxavL41x/09itS7H85ceXA6orWcByaDMPOOPPoTXBinpTqWeOd0M
	BnhycwCQSWqdIjIALTlEPEdXKEEoK/btOrxjH94LgWjda2XWZWNLqQ+CSbAGUfYADDtJr7rsDz
	4e7QcfWKvfR1nfFsRzeu+RBpmN3lBmdZXYDDxvE7vwhu+tmCornIau9vJ06JGK3qwmUhe6z6gf
	GbM=
X-IronPort-AV: E=Sophos;i="5.79,381,1602518400"; d="scan'208";a="162963425"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 28 Jan 2021 15:15:09 +0800
IronPort-SDR: ogvmirWpMGQXWyz1aul4dYtwJESHOyWIYm9nYsgMHexnMHMi8c4y+mz8u82ycpsNTFcv849dag
	KC3Ogtjcmzyj5CSSg1PjDyPddTqNjxkcLPhNNsAN39mg73ZQ7ceTyt/xlraXIC48Dt7Ueqb1sC
	wNXYYTP88uBj7rnFCdNgOkyvvQLGq2jaSI6Xcb2RzjILJac56VgI5TsWobpjJ9qyVtzzwyHnNJ
	IVxaNwgrHgJ/8Q/t6woBGBue4PRPQt7jJNWBG4/MapPNfw2henOOSO+eFz72jBESxRdeBkcSPE
	9VdtsKfUX0JC6TWZ6Fd4STKL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Jan 2021 22:59:28 -0800
IronPort-SDR: +1TgXZ9HjoaS+86zh+aLwx6S7ZpAYQ4FpPhwS5t1uQfka+31mML1LQsLKCwFYYGr030vY+BCmC
	AGfrPosPVl95WjEssU5DCDJZAyR1khEX1jpqrqTT8P7u968xhLua2/lVUN5jQ7ABVZJAwAp2MY
	3XKOPyoMsT52VNuagfol6rCenkg2OIsIErUkF58mfwGPLsAlDeR+kVK0eqUX532NsUF4ctVre4
	Iqd0vyO+udw10x//vZBdiK4usAo9yvQxvOxxYG203IoYDBmyGC3oa9VGSQBs+2yVysQ7ZPCJPH
	kDc=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 27 Jan 2021 23:15:08 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	dm-devel@redhat.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com,
	xen-devel@lists.xenproject.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, jfs-discussion@lists.sourceforge.net,
	linux-nilfs@vger.kernel.org, ocfs2-devel@oss.oracle.com,
	linux-pm@vger.kernel.org, linux-mm@kvack.org
Date: Wed, 27 Jan 2021 23:11:24 -0800
Message-Id: <20210128071133.60335-26-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 25/34] ocfs/cluster: use bio_new in
	dm-log-writes
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
 fs/ocfs2/cluster/heartbeat.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 0179a73a3fa2..b34518036446 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -515,12 +515,13 @@ static struct bio *o2hb_setup_one_bio(struct o2hb_region *reg,
 	unsigned int cs = *current_slot;
 	struct bio *bio;
 	struct page *page;
+	sector_t sect = (reg->hr_start_block + cs) << (bits - 9);
 
 	/* Testing has shown this allocation to take long enough under
 	 * GFP_KERNEL that the local node can get fenced. It would be
 	 * nicest if we could pre-allocate these bios and avoid this
 	 * all together. */
-	bio = bio_alloc(GFP_ATOMIC, 16);
+	bio = bio_new(reg->hr_bdev, sect, op, op_flags, 16, GFP_ATOMIC);
 	if (!bio) {
 		mlog(ML_ERROR, "Could not alloc slots BIO!\n");
 		bio = ERR_PTR(-ENOMEM);
@@ -528,11 +529,8 @@ static struct bio *o2hb_setup_one_bio(struct o2hb_region *reg,
 	}
 
 	/* Must put everything in 512 byte sectors for the bio... */
-	bio->bi_iter.bi_sector = (reg->hr_start_block + cs) << (bits - 9);
-	bio_set_dev(bio, reg->hr_bdev);
 	bio->bi_private = wc;
 	bio->bi_end_io = o2hb_bio_end_io;
-	bio_set_op_attrs(bio, op, op_flags);
 
 	vec_start = (cs << bits) % PAGE_SIZE;
 	while(cs < max_slots) {
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
