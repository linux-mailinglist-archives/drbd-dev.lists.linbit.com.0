Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF5B2FB342
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:26 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C3DC04205E5;
	Tue, 19 Jan 2021 08:38:02 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1D5C742038D
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:16:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033375; x=1642569375;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=7b7Ba/mkSpgZ58joyvKPrAaGG8qz0lkQcstbC0iRpPI=;
	b=Z25F3Omkf1jOceQvwnwoPQjtHDOHlOhVpcjhkcI5S0DXbsoCgoExf8si
	DcJglA/6XRlKLW4E+VfJxQXRJXY+iOhvDkwLivbE7tWkcRbpID41Trt1S
	SWVglT2/YyWtupZxUJq7HhTD9vdxoZT6G9TPWnXYXHdfTaFYW9/aHADqZ
	3dHVGN+MVM8MkeKyfDDIH9xmW0I/wfqFGnzrFlGnbZUtaAQDE+3GeCEpH
	SX3XXS3GwssLDgs0yHtu7i3wIU7D6fJM66PYuuhL3bQ8Id0uHmGLBLP1K
	80Hv7bGYC2VwLbG8dw9XJcQi8JifJfV5HbBrt1ZrWaPr921ZrlrAe9rR4 Q==;
IronPort-SDR: BvXWIITvdU9cUvjkFxxdcgD1kaIKPBJB0y8MNOD3wt2+kyDXrGhRi4UvsLAuQfXkJwQUJugQaq
	awxcrIy6v74en4OC8pONLycfL0nbI+Q/SHJol2blzPBLsyAlxyOJcwoRggnE/iqKGAeO75nT0E
	T21ZCWm04z6cxwr5hAOIELLwil722K64vHQqj8yVPSUcOCXIzw67RAuH97pqumRGBmmv3U6oOF
	muSQ7vg22tYUAsFtWkhg07JWB3xwDLnn1x+/i3Hiv5NIuT0ZBvhxOYpeaUkHmqunn88KjqQPv/
	1dE=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940594"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:08:31 +0800
IronPort-SDR: K1VOh3EuHJyCgnFmPe9ST2NCkEfvJHvY6LHvxLf32bFm3iS/OiMEIxRuDdR8PElSrrJoXfJdQ4
	NesEOGuaHzvwu3BSY2NtuyTd3bkF/kUyq/votRRv6vbobSulAiIhL93uy353tLBE4fgHwPhqj+
	5aTCiLN+gsbm+fmYvvqWQCnDbvf3uMCcrRQYx4vmaM0RPk5RnomX6Dyn0MsbtxLkLkNJCmB81c
	66r/P8IWkGp/R3xbqsmoXACJyVChvcpLaFsMaE4kgN1vT3jaapA40TH94YY9r38t0N5Yz7Ihj/
	qgmYL6fp5HawuU7VSB6ZMt18
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:53:07 -0800
IronPort-SDR: P5c68+r5a8DOSQsRGC/PLvFBWof3CYBSZ78/AjZxxbqEhqAxt84O9ZWicHnuz+rOOqV7roKTgj
	twniYUPk2fiAD8Xe2xt0+bCng/kmhe4tRAPsXmMChVmLYeVESDqX1Ch12ppq+swuJrohwMf670
	nW4oFOXw5mZvfoBvM6DRJldmElTkBvSEiHsn4Z6Lj6HNC6nwKfOy7ls60P38dBSPu32aUdCyrJ
	9Xni8CwHGVPZR+TCQgcaFbT87hN7DOlLc38PrOokHP4ypmvZX5OCF+2Q9DRTOOHIgCBKFlVNcC
	QQI=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:08:30 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:10 -0800
Message-Id: <20210119050631.57073-17-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 16/37] floppy: use bio_init_fields
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
 drivers/block/floppy.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index dfe1dfc901cc..1237b64bb37b 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4219,13 +4219,10 @@ static int __floppy_read_block_0(struct block_device *bdev, int drive)
 	cbdata.drive = drive;
 
 	bio_init(&bio, &bio_vec, 1);
-	bio_set_dev(&bio, bdev);
+	bio_init_fields(&bio, bdev, 0, &cbdata, floppy_rb0_cb, 0, 0);
 	bio_add_page(&bio, page, block_size(bdev), 0);
 
-	bio.bi_iter.bi_sector = 0;
 	bio.bi_flags |= (1 << BIO_QUIET);
-	bio.bi_private = &cbdata;
-	bio.bi_end_io = floppy_rb0_cb;
 	bio_set_op_attrs(&bio, REQ_OP_READ, 0);
 
 	init_completion(&cbdata.complete);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
