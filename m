Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D161C2FB325
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:37:58 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5BD03420619;
	Tue, 19 Jan 2021 08:37:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 309 seconds by postgrey-1.31 at mail19;
	Tue, 19 Jan 2021 06:12:37 CET
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DF2DD420329
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:12:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033157; x=1642569157;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=dUZxU7BncWFawkbUm0QHtY0n6f/CWqD/WEdprzvrR/c=;
	b=lUiL9llGs8m6HC9b/GCHilqaeryissSBDx85vgqkiblJxj1PAN/kLigM
	85PNR2CXJzMg3ohJcyFyZgKXYuJml8S4FI3ZOrDuIW5isSw8xkNxDZD8/
	HxAYO835xI/3xfrs7RGiUrXPjsdM4Zg7gHkbGxSLJbBZBCWxw/BcHiIzJ
	ooOj5l4xDYihppbvY4Lr8SO5NAUY9fBHsOvWq8zDZWABki7MkAdg1S0vN
	WdZeEHXSUgJbdtdARyQgQ8Z10fdY//Xb/MZm1n1VCkOYwcuVHzRYC6ZTG
	EJWpdhR7biGl7SlB+mE/B8HPT3Z9cbOfVY4nFye8Bk80iQovA90MpNRtN A==;
IronPort-SDR: sBbqu3pu3+jEFWvHBrot7B9/6e1A+j0gM2ly1bPJSfnSeL1bQKJTvXpw9tCDZPmeFhrXheACOX
	28fF3Q5XpwfhDH1DGzPLJCg6mLt3WstqzjEATHiwRMIkIDrEjjuc+iWtw32/epq1MBhsWnUZrK
	az9aP4DskSyeTF5dL1O4n63+xxly2ySr7cEvVboGtL6u1SVimlPXy+MOmaIHe3hUfb5LwIg9lv
	nn+QyP+Y0tE72DYJnuelHIsyrzzOsxU+NU64i0dY97HAztpPtRve6/qP9IrypsfB4A+flkuzs0
	608=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157758857"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:10:49 +0800
IronPort-SDR: n7S+huvmI7Bz26AZl2Bww/BgVVlQHQsVy6Lj0WKiShlrLEsO7kY3jnprI7VSefvkfMdwVg8cKA
	j03sHDhro924Ta0pg//xd32ZNlRE+uf26bvC6ZaYek+LrgmQpWMPNJQu0VhTJy0Bc4mW3E5fZ2
	SqZzLRFs6Ldw/5zG0CqM542aDr6L9xPTfn/Xx3aC5vWuFoVfaqUfrWtV1BK8+1e+lwdGmzxl8J
	HA8u/Mhh7q8SKh0jU+sHeGEU/AeBxmWg85f5xk25Ji6Xz/mucpxPbSQ7t5xjO+dA7jWA6Dwlt0
	L2JMFsW0ApKNx3JwGRm7K2aW
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:53:25 -0800
IronPort-SDR: l/PshN71cWYbTK1WTMMOJErnyUYZ9w/R4z1nl3IAFxlbXv4liArup+WsFD5ickHhD3utQPm1yk
	sDJR5xYPW7Rk4AOBaj9ddtkrfHNoDjxcLvYwqKoJ+zSMrb2LgwmOyjvRLWCwQh66m+L31DF3GG
	cbQQZKVcF02VZtZcPCLoG656Pl8BFav/PRzS4RekqjE2nR1vtzK5A4F7XeBguGBUnZrVICH30u
	hENXcQH2DncOb3p9BCQrIXCeB58uVf13+u9S+duV8v8olXF+1fRyqTUCKPFMBWOtqHC+TvB1s2
	T2w=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:10:49 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:29 -0800
Message-Id: <20210119050631.57073-36-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 35/37] ocfs: use bio_init_fields in heartbeat
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
 fs/ocfs2/cluster/heartbeat.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
index 0179a73a3fa2..dd37aaac4f32 100644
--- a/fs/ocfs2/cluster/heartbeat.c
+++ b/fs/ocfs2/cluster/heartbeat.c
@@ -528,10 +528,8 @@ static struct bio *o2hb_setup_one_bio(struct o2hb_region *reg,
 	}
 
 	/* Must put everything in 512 byte sectors for the bio... */
+	bio_init_fields(bio, reg->hr_bdev, 0, wc, o2hb_bio_end_io, 0, 0);
 	bio->bi_iter.bi_sector = (reg->hr_start_block + cs) << (bits - 9);
-	bio_set_dev(bio, reg->hr_bdev);
-	bio->bi_private = wc;
-	bio->bi_end_io = o2hb_bio_end_io;
 	bio_set_op_attrs(bio, op, op_flags);
 
 	vec_start = (cs << bits) % PAGE_SIZE;
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
