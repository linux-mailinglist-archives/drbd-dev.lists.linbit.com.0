Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DADE2FB329
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:04 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E7FC342062E;
	Tue, 19 Jan 2021 08:37:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B38842038D
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:12:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033175; x=1642569175;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=fhRK4lG765wlnY3VYWw46zVxpefVZCaV0gGjGdWEZQs=;
	b=nyue64SnxSR+MkvMnbnmpJgn2j2D9P2r5ZhnhOCrLCiztP0gESFuB8og
	vJZK/4YgfuIBkAMK7gLSmkbgQB+2wusigD02F9bDyX6WwYDaKzhZqGB93
	WvFMpiHezZIcM2akDMs7YJoVGepT05EzVw7V5TIJjVXAckYVWm6qh7ZWQ
	nXY5cPrmMVtfSPRNY4c7p/7CLaUsEYb56ZfJZm+1XRyuuBoLG3OL6RH5m
	vKBAjH7v8n53SXtI86aCwCd5bf1WDcs/U6bDukJbiJtkAj5p+rV6xPuc5
	N2TcBqDX/LXW1v1An+SUU9S7IGtBEhXoe6JbkQhNttTCZpMic3JZTfFCC A==;
IronPort-SDR: BmWmOrn/Nz5p8wcA1MQw+Fs4WbPMWnbfWF3uvfWbvfMA8AgmZIT/jWqC5VpvBG7HlTKhJv8ohF
	bI+s9VBboj5fSkHVEWCJPP7KCN9ibMtf6qAzRvvjh5i1LC7pxWGVqHeK0ESVuiuKQIG5WsFTM2
	Al/h3Y8BLT/c9ilGLoqWkSHKw/bZcjPmJ7hLdlXJu3GBmlIUJmQlulRlohVMkaxujlzc7vkuuo
	OqBD36FUskCOYexsNPKrQvl/wzc0Bis9r/Lml8xqcvfXfHj1w0zuAVRs2VyRv4/b5ufmV5d2in
	Llg=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="158940708"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:09:51 +0800
IronPort-SDR: js7yau4y+Y+z4CUOGHBdS88fW8Hj5EOLa7WQ+ttixv0vuT0/XJU1Ja0VJB8bl+QVVwyKNpu4Ld
	7w2/NZUqT0HldYnJS3S5l0EsG73dOJ3innNskoz4yY85geVDoNghpavy+dJawO6a+HeIGPyxb3
	32eqCI/yJLCi6LK+mr0I1eArqjnBF12Y8GNcj6DoLbCQosboazEdmbDyvchcmJuzaf9fiejw+H
	pznJOeOhaYDln3X9ybRvDrweO38U/+VFDYLGoSh4KIQTCOjdgcrXuHIyGji19o76kxA12tSyc6
	7ZgC3AfkMfKx9jvmwh3aeOZD
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:52:25 -0800
IronPort-SDR: JLU8nMTD+NZGhpcLc6bx6NezWoOxG1kLxe+XONRlNiEvcpn5x3JxGCWrI6N+TlSlWzGV1Q0IZH
	sVnYt6tKGijbl+nT2mxOo5/rgMe/5l4KRxVV0eiBp02GobWze2qiJQgHs9JNJvbu9kV03QI256
	THC/6jLcI9qR4UKAPS2gqtOtR4DwAg8fBaFWS2YCr+JhQOYLTSPNhMAbcyMh5IWuS0/MKfxvtN
	xPuF9hOwrup1UYc8D7gXKUTo1HoUHkPFFr+UvCvYhNW2SXbqPm5T4xFixZZesNSvVigWeniTT3
	7fA=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:50 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:21 -0800
Message-Id: <20210119050631.57073-28-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 27/37] nvmet: use bio_init_fields in bdev-ns
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
 drivers/nvme/target/io-cmd-bdev.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-cmd-bdev.c
index 125dde3f410e..302ec6bc2a55 100644
--- a/drivers/nvme/target/io-cmd-bdev.c
+++ b/drivers/nvme/target/io-cmd-bdev.c
@@ -323,9 +323,7 @@ static void nvmet_bdev_execute_flush(struct nvmet_req *req)
 		return;
 
 	bio_init(bio, req->inline_bvec, ARRAY_SIZE(req->inline_bvec));
-	bio_set_dev(bio, req->ns->bdev);
-	bio->bi_private = req;
-	bio->bi_end_io = nvmet_bio_done;
+	bio_init_fields(bio, req->ns->bdev, 0, req, nvmet_bio_done, 0, 0);
 	bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
 
 	submit_bio(bio);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
