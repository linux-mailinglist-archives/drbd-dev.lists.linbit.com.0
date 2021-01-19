Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B09D2FB338
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:18 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7B96B4207F7;
	Tue, 19 Jan 2021 08:37:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3B1A44205FB
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:15:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033306; x=1642569306;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=tvJHgqE+W7G2ML+CypUNmJZ3x4g/IlwhC+0r2ps0VWM=;
	b=kQRShYp6IYNgk1KLf9XGJPFQMfl8T114ko4KP+DNJRjz4aHfRo6IY6jz
	fFzKZIJHZaQY0iK9C9ZCx3jE7wg9n7PawUu98WACBN3/vtkVo4+S4iEAc
	r/3WBXTiPe8voIDpYLytRu9WsF5maZsLlzVKCB6JyY2GTFjtS/6FRaXT4
	2NbFMDSeZsioaBDreRQ6JjbGL01Nef9zFgB5fOwdJ2gUdYsv42NayCNLl
	wybSEo8DJsfhAyw7oRgWlLiPwf2ilMWL7GBJd8Mqs2sEXCXWKGvGvhH62
	oLgu3PlK89m0UxFdN23+eliqE2Bde4sTCBErL293LPzycqdimScccggfD Q==;
IronPort-SDR: bYJP7WirPXC89C7jCpeoTBk9Kg8mpGJ4pJ1nhl5G2DIEQLPuDjrzTT+2lW5sALTjpwwrfHpmt5
	l3OVWqy2egK8tVxXGSUUlM73QzNc0JiqV41+lSOcNXmK1CtVMI8rH1TpeIZrFKjr/jcOqkq87s
	c1YFeM6JizAsi0r5Om016D8wBDBMp/weiqEocU3ySo/f0fU5fVG55Uj66TSPLUqg4rAQdgH8xJ
	ySPbARUtFl/U7yxwL9qkTQMqriOGhMUrKjejcFoCtu1kKux49/SvQnfTYBi3+txOpkpDfJfwfu
	VTs=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157758564"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:07:54 +0800
IronPort-SDR: KdCoVVZw3wfQ7q1MwxmUi31yTseq5ffoxvIqxAgiINWvK1VWsm0AeegrvBo0CZfQyi7uX9DgQo
	W6sfpNZakY/MUqPsHjoJdy0O1GqJbPGpeYOd/iNrY1L5PeEnH4vmOhgaSYjo55/gtog1Kymyth
	KcD+YTDvvDJfnIQMpxf1wAdCgNdpefm/OeVx0oFadrk490bQo8rZMa/1cDj+CrzLRg4gvCxidQ
	E24YpLz8lLLEfBXWxosQ5XkuQ92vqcqYW7amIHz/0Nxr1X2Y5Y6X7PnCowZCi507NMHdpSzhqI
	MTyu4BH8KhMUeCiJC9GI3hPM
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:50:29 -0800
IronPort-SDR: HfWY3om+yf0xJZDCeO7vzX4qVknDvDGJ6ma4/WV7I62vTgKsXgZzhM0ZULmlPQ+OArppKpZagb
	2D+mRhA2IGb1emIpbOZ6FTF970SZgSIja2ei7WMigALEAQdtMpSzVo//nIAbZ1wNVJo/414BKz
	A1WUO/T5vGii4BJKAkPud7zlDfpbr9iZjAmuNFOXPO1Y6zbT0Inzt3aMei0oz3YT9sfu+Dztk5
	Fg0ppCRIMSkEdmvmSQl8FchZI4H3p6KBElZq4HVESV4gQgEhlwohxssYunDRqcI1BVUhdQDk7h
	o0c=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:54 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:05 -0800
Message-Id: <20210119050631.57073-12-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 11/37] jfs: use bio_init_fields in logmgr
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
 fs/jfs/jfs_logmgr.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/fs/jfs/jfs_logmgr.c b/fs/jfs/jfs_logmgr.c
index 9330eff210e0..ee7407ca32c0 100644
--- a/fs/jfs/jfs_logmgr.c
+++ b/fs/jfs/jfs_logmgr.c
@@ -1980,15 +1980,11 @@ static int lbmRead(struct jfs_log * log, int pn, struct lbuf ** bpp)
 	bp->l_flag |= lbmREAD;
 
 	bio = bio_alloc(GFP_NOFS, 1);
-
-	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
-	bio_set_dev(bio, log->bdev);
-
+	bio_init_fields(bio, log->bdev, bp->l_blkno << (log->l2bsize - 9),
+			log->bdev, 0, lbmIODone, bp, 0, 0);
 	bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
 
-	bio->bi_end_io = lbmIODone;
-	bio->bi_private = bp;
 	bio->bi_opf = REQ_OP_READ;
 	/*check if journaling to disk has been disabled*/
 	if (log->no_integrity) {
@@ -2125,14 +2121,10 @@ static void lbmStartIO(struct lbuf * bp)
 	jfs_info("lbmStartIO");
 
 	bio = bio_alloc(GFP_NOFS, 1);
-	bio->bi_iter.bi_sector = bp->l_blkno << (log->l2bsize - 9);
-	bio_set_dev(bio, log->bdev);
-
+	bio_init_fields(bio, log->bdev, bp->l_blkno << (log->l2bsize - 9),
+			log->bdev, 0, lbmIODone, bp, 0, 0);
 	bio_add_page(bio, bp->l_page, LOGPSIZE, bp->l_offset);
 	BUG_ON(bio->bi_iter.bi_size != LOGPSIZE);
-
-	bio->bi_end_io = lbmIODone;
-	bio->bi_private = bp;
 	bio->bi_opf = REQ_OP_WRITE | REQ_SYNC;
 
 	/* check if journaling to disk has been disabled */
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
