Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD652FB344
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:28 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1AED4420837;
	Tue, 19 Jan 2021 08:38:05 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 68FA54203D0
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:16:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033381; x=1642569381;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=tRNHR3soK1Jmg8jV6+zLlFyC0jOJz82j7hH7LUdTG30=;
	b=cnimzgZjifJcsOqGfo53PgxWCyalRQN6SwWgbpTkVTJYsYCVdSJn5P54
	ueIMpVh6lJLxGQfkDkqWVn3pvOHsvKFHXzSYIKm6QMqXnFpmCkVZzibq+
	Kg04Oi2PcQT7+h2SNVMUXO4hauhcsggmHfJVnjgMJz87McLIhTXBjVusV
	P2ttEmWEjsDi3EIqPhzpVYgt06T6BjuVuEQLmWunuQu8Khzv+HqBZbJsm
	g5QJDfi1DqqaasIICH3BCIRCrOiMbLgR9JMlQaEsPvIoOq2GdldimiwpK
	Is+7MgVQCF2D30xhwxJmXgNgSiA5UaxguZBimHrifYE6oRSPI3QW44lGC g==;
IronPort-SDR: v6Djik8xp2Rp1r7cwbIiqyvQp5zZ6brLXpa3GsaqNi0HDcYgaA9PmXS7J/F2oM5Ih2A/8b9Bom
	A2k7IL1n5T/8+o1Fw+BiJ7uXpa4RDa8NlVk/LvNm5JHI2cmt4YOz9Z3aOgSvgKKgJphrFQQmAJ
	hVLTn6ZpGQnhVtCt4uon8HW5U0jwaHnf6TSUJoY+T5mYneKum8ClNHQWtxL2Hsb55v3F4pfKz7
	3f+R90PQR28XFA+PyrEr/MzHQWvOhzhAwndif+MAYbcsJNyBe9gfkpmUE5DOk26o9V+ToIPYXN
	PMA=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="268080923"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:07:12 +0800
IronPort-SDR: q5eNvGosIMgZqjNV6ckPw6H0ccrimGjtn8QxayT1qNcYK5fLUfb1WArEjImwhTBKtvLT9Czfdg
	w5UDKjnRq8BnmP4fu0rEw9u3hMX8iREu+ypubBvIx7+JRJ5pS8qBb2GFWGV3vF3ZEtgrj8npOt
	fguuIKjA5oT8TZPllmKBCJv3vKC7i2KPrrHiAzXloRnO7wMlC0urpqteIR3lnpYcW3MZpqfCqi
	q3W2Koib0SQxVZu4fWrW35q2SoDzJ3gncnEcY/8Q6UOmt3OEPhjiIcalm0qrjWBOpCXUFk51eW
	FZXEWcjC+N0pn4oBAJr5j8K6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:49 -0800
IronPort-SDR: GDd4J6YTFP8HhrZnL/kPcBPBHOjVMkqjgTSYePXIN1p6VjbBUOlt/t7knTI78j01lupweBVXBE
	Qrf/3CuakDKuhfZFB9YorM1NE5OYf/fNye+BAXuLpvEgn+mQDBn/ePyPBWiXAz5XnISDPfEpam
	WLSsiz8QPhiv+mHlZ3XmyQpDw+MKe+Vz4c2sB+5IGEUQ1QQKIMcPMlMUElLMqb4wubx9smdtxD
	/qANSSO3eFYpLv+9iWpFZEjNiZX8CfoH3PB920NT0je34xsn6+9qoX8nDurumB5w1MB8IpLJkr
	gR8=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:12 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:05:59 -0800
Message-Id: <20210119050631.57073-6-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 05/37] ext4: use bio_init_fields in page_io
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
 fs/ext4/page-io.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 03a44a0de86a..53a79a7aac15 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -400,10 +400,8 @@ static void io_submit_init_bio(struct ext4_io_submit *io,
 	 */
 	bio = bio_alloc(GFP_NOIO, BIO_MAX_PAGES);
 	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
-	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
-	bio_set_dev(bio, bh->b_bdev);
-	bio->bi_end_io = ext4_end_bio;
-	bio->bi_private = ext4_get_io_end(io->io_end);
+	bio_init_fields(bio, bh->b_bdev, bh->b_blocknr * (bh->b_size >> 9),
+			ext4_get_io_end(io->io_end), ext4_end_bio, 0, 0);
 	io->io_bio = bio;
 	io->io_next_block = bh->b_blocknr;
 	wbc_init_bio(io->io_wbc, bio);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
