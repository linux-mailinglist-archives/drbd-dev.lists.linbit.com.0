Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8964425BACD
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Sep 2020 08:04:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 787284253EA;
	Thu,  3 Sep 2020 08:04:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2A9CB425102
	for <drbd-dev@lists.linbit.com>; Thu,  3 Sep 2020 08:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s8HG+OT+zVZj1jlfaUP4te9YgvmBvwjID4JpAmGK/9I=;
	b=SgDwCvCGmU8dQ4w1tb9WIoCAyB
	9gQjPkgyNg6bOj1P1lmFu5bW8WYyGOVWZapXh8d7AIUMGwQVGbDUICc3bsDnhD6AwYhEELAhaRB4j
	LaknkiI3mauYg6otb1zGs2vOXGq1FyIOfPm4NuXLCNtu3YK7A6FCkTM1L7hMtz0nnLlMaKwyl0iv9
	/2I035vDB7gwXBgOpZTil4BdoKT0CWNWZKpQeUEVP0/ojxWN+iG8jcV1XNwJRUOjUr5poVEyXvGCw
	Deu0cvknLyzczN9AJbYdlaYAVUS1SLkF0SvqhoNxBh6aJOFMIYPPqOBLm9J4lEoPYwEX8iQzuvVtf
	6Qw+JtNQ==;
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhzg-0007OS-OT; Thu, 03 Sep 2020 05:41:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Sep 2020 07:40:58 +0200
Message-Id: <20200903054104.228829-4-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903054104.228829-1-hch@lst.de>
References: <20200903054104.228829-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 3/9] md: compare bd_disk instead of bd_contains
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

To check for partitions of the same disk bd_contains works as well, but
bd_disk is way more obvious.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/md.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 9562ef598ae1f4..3f33562d10d6f5 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -2322,8 +2322,7 @@ static int match_mddev_units(struct mddev *mddev1, struct mddev *mddev2)
 			    test_bit(Journal, &rdev2->flags) ||
 			    rdev2->raid_disk == -1)
 				continue;
-			if (rdev->bdev->bd_contains ==
-			    rdev2->bdev->bd_contains) {
+			if (rdev->bdev->bd_disk == rdev2->bdev->bd_disk) {
 				rcu_read_unlock();
 				return 1;
 			}
@@ -5944,8 +5943,8 @@ int md_run(struct mddev *mddev)
 		rdev_for_each(rdev, mddev)
 			rdev_for_each(rdev2, mddev) {
 				if (rdev < rdev2 &&
-				    rdev->bdev->bd_contains ==
-				    rdev2->bdev->bd_contains) {
+				    rdev->bdev->bd_disk ==
+				    rdev2->bdev->bd_disk) {
 					pr_warn("%s: WARNING: %s appears to be on the same physical disk as %s.\n",
 						mdname(mddev),
 						bdevname(rdev->bdev,b),
-- 
2.28.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
