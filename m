Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDD0572DE4
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Jul 2022 08:09:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C1C7242097A;
	Wed, 13 Jul 2022 08:09:29 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9E0A742097A
	for <drbd-dev@lists.linbit.com>; Wed, 13 Jul 2022 08:08:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=20fYCpa6V6Ap10mEOQh3cL90/z7nSmsIewaP84vytaE=;
	b=qh0sF5wn2Ta7HQYLFlY/P/Q9Wi
	DS2ijefXpSBdkMRpGE9Xk4pb6JYtV2a3YEQtifKPjKehtbR6ZvnECB9ae8ReP2XIadd8BoIMUsgwv
	8yjoGchrDeEgcwI9LNlYEKD1U6bj16k1Ha8HxlK5UrRBqbSo7xJEYeen35qZ9zzFDFe/jv2yZwMtS
	hI1ykmF+ndaa1FvAd0SZcSbb7CcwoVicWCK915yEKaJFEgPS7XM+KzrdcPqjCz9HPCJi3u8Hj+RAr
	M5AVOo+lJIjwhmLkaBi87rz7EH6i8wgeIjc+GTplUECFn0Diq3CizjrqPhTdnsXn1/eCIGeNWVM4u
	iXwU2e5Q==;
Received: from ip4d15c27d.dynamic.kabel-deutschland.de ([77.21.194.125]
	helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBVJQ-000NR5-KG; Wed, 13 Jul 2022 05:53:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 13 Jul 2022 07:53:11 +0200
Message-Id: <20220713055317.1888500-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220713055317.1888500-1-hch@lst.de>
References: <20220713055317.1888500-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	Song Liu <song@kernel.org>, Mark Fasheh <mark@fasheh.com>,
	linux-raid@vger.kernel.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Joel Becker <jlbec@evilplan.org>, Jan Kara <jack@suse.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	linux-ext4@vger.kernel.org, Jack Wang <jinpu.wang@ionos.com>,
	ocfs2-devel@oss.oracle.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 3/9] drbd: stop using bdevname in
	drbd_report_io_error
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

Just use the %pg format specifier instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_req.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index e64bcfba30ef3..6d8dd14458c69 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -523,16 +523,14 @@ static void mod_rq_state(struct drbd_request *req, struct bio_and_error *m,
 
 static void drbd_report_io_error(struct drbd_device *device, struct drbd_request *req)
 {
-        char b[BDEVNAME_SIZE];
-
 	if (!__ratelimit(&drbd_ratelimit_state))
 		return;
 
-	drbd_warn(device, "local %s IO error sector %llu+%u on %s\n",
+	drbd_warn(device, "local %s IO error sector %llu+%u on %pg\n",
 			(req->rq_state & RQ_WRITE) ? "WRITE" : "READ",
 			(unsigned long long)req->i.sector,
 			req->i.size >> 9,
-			bdevname(device->ldev->backing_bdev, b));
+			device->ldev->backing_bdev);
 }
 
 /* Helper for HANDED_OVER_TO_NETWORK.
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
