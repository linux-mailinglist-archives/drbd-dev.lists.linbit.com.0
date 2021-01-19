Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1492FB322
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:37:56 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D17C94203D7;
	Tue, 19 Jan 2021 08:37:54 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 302 seconds by postgrey-1.31 at mail19;
	Tue, 19 Jan 2021 06:12:17 CET
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C4E80420231
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:12:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033896; x=1642569896;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=xjsJb5PcJFfs7EA4rzkbsgQNMxTmWsRroHWsaZepkNU=;
	b=TCJ6AWSlVeCqFUl18mjhN9OGD9H7bM3YGiDNW2JWgUBdodIY2e5h4rZk
	QkfXT+rGhlaBc5Q8BudP7tTq0888GHIKtG7KquCwP+ZEfiP88Z+4wDRup
	xlMGDs7oxYPC5qmMmJo/6sRgy2KCTmcInH8ydjqOkBjevYiL2bbDEZ6nB
	QUAfptj9zfRpi0q1ROBrvMBZe/Fg8yIog5GbXs9KxpFBCq4MX2tMWfFAX
	XLRRaNeWllhdQtvceXH9siXeohL40XfYWhpXPA0ymoxDUWe3hM9awWDy9
	ZsM5swQ6jxS8O2iTfzB7XUUD/iEJIpqujhKFLvnLkw1lr9jVQFULSrR7s g==;
IronPort-SDR: 71jXauv4+2owagctq/csPJfsqEc9L/KkUvrft/gkCkza9s0KGpxzRwmZn55KmgZwZd+NPNQmIz
	YE9WAFr04NSr6zExdwD6NSGaQdzhyTbGNM8aM6rdak9l31FvmQSfURLF6xIZ47oM5BxT6MscyJ
	1dPH4ldwiI4LesX3Qr+o++p3SOEX7Xih9SVXz49ctvRPx51Ojg3kEKF1yVftPZ+ZqkJSXBKUah
	Hi15hMNDisFlP9YKpauOGcEbUKNoRhY6EoEII+XhEqO3Kl9mXfabo4jzjdvwBoEhFGIon8e56R
	jnU=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="261722456"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:21:46 +0800
IronPort-SDR: Ung5jhBw3U91PbsPdjdCKfzuRVvAo7SOnupEsKAuv0MdVm5EoCyCsiSoreUc1Qz75aLKV3842S
	2WSU5OAwOLMdmkjzQvYrCWRXVJkeSUUGZxplU8JbescGV0S07OCic36ijevOra91pKVIQJW5eC
	L2ywjpgcH3qrUEB68kAuyXVwKIhSiYd0uKCRsh50peETQ3I3kIcAQSCL2+QMQnYpmWTavT6Lmu
	dkT2LTwhfJEH+MJpwXL9I74q5SoYyFDTWIugwK+7WJ2NrYZ8qOoN3xk+V455sAqVxx3bNTuPFf
	xMey0YIE7d2HNXGiQKvulew9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:54:48 -0800
IronPort-SDR: sUJEXVVGtr6hdXWriU6va4OHVDFOeCqexBkNQgHd29bupqR1FAk1FagKslaqLW3ZUUxGQzR8Ug
	NtO68JgANUVdRxpoSQWII/hxMhExDp+a994ofqnoDT8BbVyZ1XbW5GYb7r0UZsyIyvfIjO50yw
	MZh/UChC09g0/v2Fmm2Ka8Iym4W7jfv3l61pY/GYFfEKqEthOGPxecFMe1viLbkfMh+TmPOZOJ
	niLv3X9jvTg8OiAwbkqtrE2GRDLktY9HmYFpEeDkaOstLITBHpJmhuyQTx4ICZPfsDRpeUTWvU
	THQ=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:11 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:24 -0800
Message-Id: <20210119050631.57073-31-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 30/37] fs: use bio_init_fields in buffer
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
 fs/buffer.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 32647d2011df..32e9f780e134 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -3027,16 +3027,13 @@ static int submit_bh_wbc(int op, int op_flags, struct buffer_head *bh,
 
 	fscrypt_set_bio_crypt_ctx_bh(bio, bh, GFP_NOIO);
 
-	bio->bi_iter.bi_sector = bh->b_blocknr * (bh->b_size >> 9);
-	bio_set_dev(bio, bh->b_bdev);
+	bio_init_fields(bio, bh->b_bdev, bh->b_blocknr * (bh->b_size >> 9),
+			bh, end_bio_bh_io_sync, 0, 0);
 	bio->bi_write_hint = write_hint;
 
 	bio_add_page(bio, bh->b_page, bh->b_size, bh_offset(bh));
 	BUG_ON(bio->bi_iter.bi_size != bh->b_size);
 
-	bio->bi_end_io = end_bio_bh_io_sync;
-	bio->bi_private = bh;
-
 	if (buffer_meta(bh))
 		op_flags |= REQ_META;
 	if (buffer_prio(bh))
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
