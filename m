Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0082FB324
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:37:58 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 350AF4205FF;
	Tue, 19 Jan 2021 08:37:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 509424202DB
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:12:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033898; x=1642569898;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=ak2/nt3tgSZKwQ0NZJ3HfvxP0O9v+7+P6nv4xqLM7/Q=;
	b=V+ptagt4HiBofd9bNak01OPmLxVSY2lxKO16Sxkijdrg1e2G0w2OLlXl
	oURy4X0m/16RyT26lyuOeLr63LjPhdqX9n6RJSyiVDD9nw4GahpVhDL3R
	c/lCnEDASW4lVlyNHx18fPGL3IfcbhZsQpdJZnGyX9nS73bSHRUMstyYx
	dAjvttsIo55WuYkBXwt7UehCPYhRs8CcxmnzderXMPOm8UF3iW3Yftqza
	uKhiIlc20qvPNe31NJgMylXF3jkDgla2Eao/xLYPDLZS0c+CELXjLU89j
	uKWdBnS8GZw+tW+5LFC+0h7X30n/SmEfnz5+Sj3zWm3wlkVJdBBMpCq6i g==;
IronPort-SDR: 0wR+55n2qnEf7rjDxeAMUeQ1yVHcDimsCIDWsvnQoFF+E24/qG2v3ldIaFk80mngmOvGERJpIm
	BdKI8V6nG2GQO6uinJRr7qfFvgHGyrlTT6AnVmI0ASAZeff+k1SDXe3cSC+kvh2YYMaCmLxIeh
	E8ssvcC99AZ01YkrXSO1wUTQ9Ubakkng/ali35+G2yGH3IktX+QWT6Xz89Ysia522KM16DBxNX
	3x5Pf9+Qo7BW6BT+O2Z3Sqd2GWcHkYN2UwbOAUbWOIwFdAU4X9jfpdziSVhJ2lYayk65jsFOzx
	I5c=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="261722157"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:17:46 +0800
IronPort-SDR: mNbNL047JEqmCyZyGNrkwGZMD9ed4uMwyGGThq6ROWS05kxYA3Pe9WSZkNFN/YY6PxamjWnNoX
	WPfCJITV2P7j4ROiUdk1ZybbIdrB7pZcVVEXs7uWVjpPasui9L8KI4uPfFjDi6L31QC/Jal/8y
	oZ/BKdf8yvjk/6REPPRiBEG4ZLUu6eCI//zmodHF3ywvI5vBAN1HKhRjmN/gOTYIR3qOBbHnwz
	zbaDuOrnjACpTXCBOsFoLej+hx3KpaHe0bE9ONRZH3yPY5aqT0kUkXF4oueRwQvMm7c96+Ck5d
	RJiF9mnn0ujNN4sldAsbIN8G
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:50:08 -0800
IronPort-SDR: XuHiYNQi6H/F+p2JRpeqvKepY/gWFggYc3PK+RX4NWnH2J++ktvqaZn+XFm15C5dMKrEJfHz0B
	tcx/8H8EcZQjAkvVLLfd960MjBgFb7S9i+JAaGulJ1Ed6y5pQvCWzQsDBAb4mxWFQRcOQm2sQh
	InLeUCQ8BhpQ0hg7T5JV8TxNze71LOROzEztByIwFHi0muZ5jMuDAa0BYs0z85+J0ujkGowHhy
	B7cEPZDWrY2+Vnoe2urCnxNw5+yxuKbmlE5yr1VYKmzFzJMkDPxkr8LEyEvcKah9eb96VGIlX+
	j4Y=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:07:33 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:02 -0800
Message-Id: <20210119050631.57073-9-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 08/37] gfs2: use bio_init_fields in ops_fstype
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
 fs/gfs2/ops_fstype.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 61fce59cb4d3..32506d5615f4 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -255,12 +255,9 @@ static int gfs2_read_super(struct gfs2_sbd *sdp, sector_t sector, int silent)
 	lock_page(page);
 
 	bio = bio_alloc(GFP_NOFS, 1);
-	bio->bi_iter.bi_sector = sector * (sb->s_blocksize >> 9);
-	bio_set_dev(bio, sb->s_bdev);
+	bio_init_fields(bio, sb->s_bdev, sector * (sb->s_blocksize >> 9), page,
+			end_bio_io_page, 0, 0);
 	bio_add_page(bio, page, PAGE_SIZE, 0);
-
-	bio->bi_end_io = end_bio_io_page;
-	bio->bi_private = page;
 	bio_set_op_attrs(bio, REQ_OP_READ, REQ_META);
 	submit_bio(bio);
 	wait_on_page_locked(page);
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
