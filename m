Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB142FB335
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:15 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DCCFE4207DA;
	Tue, 19 Jan 2021 08:37:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AFFBF4203D7
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:15:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033304; x=1642569304;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=AAA7t74fBBFYvhmmUXL9ltnfWbGOnWjeqm/UNzN2uR4=;
	b=j3hPcsrhL+5IDgspVLRizEmtYKJO5a98KUjEp5lHyIk+Juh98Yuzh13C
	c50wtZvPHXT6jeECWX3FSNlH701231u6Gd82dKuJaVU6NVrlzubwDlOt2
	7v8jAJkcVJaQSM3czd4Y5KISfztIER7RMw6qnQEBdrHgxXox9U7mpguCv
	55Il/Oh9iyEWknivaC1htwGkoZudkSnxFIp0+pV2PEnQkyy6e3WQGs7Te
	1TwH3g0grCJShMVyaOukZDujVmL0T4GXdn/FLUHt8NjaOvjOzezPZEGQ4
	5dv/AEZ39CJEg+Nr6kuzSS6L553HKHkTNH/xWoBufTSfdcnKnI+OZX0M0 g==;
IronPort-SDR: KRTvA0z0YXT2EkOKzFj13jmrfTO0xGJ6cZVkjp8u41Q3rJY2eU9hiABdOqA6j/ZLc7GRZ8m4RZ
	FKgsM5szhyIrjZ9LTUVzpVTs8XHkzPAr0uDS0aQsR6sH5QflvE/1DMfG7cliWVEXyVuQ08stq9
	w2d8KC2k+PqEtMQVIySd4bG2R+fSpVEotnoMYCI5U5GRKiQDuz59XC318Dpw4aNzPyvZfLIaln
	D+Itq535fQvkBxnFJ37Kx4O6krHPf+eXWzp3waiViWZHsnGiNZpZ5yNZ9p65d1pKEJR0duHSaL
	8CY=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940763"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:10:19 +0800
IronPort-SDR: pimCBhoL0HDSw+/4CEkueGT/B138zSpiPwrGPZ3fwhCzKbYr3yXVtkTi9QEHZP/01XP02TlTnq
	osuzlc7CvhJEjUM7osssD6WcgX5oZevyzMswGbmonin7ERzGnBRNkk/tA0LVjQpiWlfB7xelqj
	8tZxbPjOJwChksJZSDlJMgBvuvSD+2fteZcDYZFx2rmaGZ1daV76UxeuvNQffMwrd7nBo+UpCG
	Y7652Vf8vgDja6miJBvdUcqF64d+OMz6VpumjYoL/TXBJA83tCAdxXpwEjKqnN/oYqXgWYD4Af
	L8F8Bpf/dszx1TefLH8TXfoO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:54:55 -0800
IronPort-SDR: cPCtUc/IRHJ6v0mRHjS8V8MFIsoN0oL2wMbe6Ozxyn7u6Jlq2FjrgvACBEr/lheyPR/5wD4N+M
	KEDIu5wE7UWz8Cv9qJDWZum4DMbM7mOvzj/7tfqqgYPHbQ1LhSR/PgR8NGyaDkjJQEt2LBkn32
	1OZrCSpTxv+AMTCn8V0WZgKvKOAI/tj1Sffo8uYhn7bxkZYYg0/EqRTNAqMwUOaWkw/9SrZbM5
	n6bVFFI/rd2QJwwAKHXPwXh+bmpzJXrCR4jV/u3YAVKTR0Pw0jMhQst/htFOvMCrlOnknkAxQ9
	MSM=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:18 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:25 -0800
Message-Id: <20210119050631.57073-32-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 31/37] eros: use bio_init_fields in data
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
 fs/erofs/data.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index ea4f693bee22..15f3a3f01fa3 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -220,10 +220,8 @@ static inline struct bio *erofs_read_raw_page(struct bio *bio,
 
 		bio = bio_alloc(GFP_NOIO, nblocks);
 
-		bio->bi_end_io = erofs_readendio;
-		bio_set_dev(bio, sb->s_bdev);
-		bio->bi_iter.bi_sector = (sector_t)blknr <<
-			LOG_SECTORS_PER_BLOCK;
+		bio_init_fields(bio, sb->s_bdev, (sector_t)blknr <<
+			LOG_SECTORS_PER_BLOCK, NULL, erofs_readendio, 0, 0);
 		bio->bi_opf = REQ_OP_READ | (ra ? REQ_RAHEAD : 0);
 	}
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
