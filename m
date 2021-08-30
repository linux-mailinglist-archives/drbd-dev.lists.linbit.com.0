Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 008413FC2A5
	for <lists+drbd-dev@lfdr.de>; Tue, 31 Aug 2021 08:17:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AC2B4420BA8;
	Tue, 31 Aug 2021 08:16:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5C65F42061C
	for <drbd-dev@lists.linbit.com>; Tue, 31 Aug 2021 01:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=hX7HRTcv4QfX8vcdgUwPONffQyFjE2f8SSCFViSYJH8=;
	b=0e8f1gVleL+xeNyRndnSQ8MsoM
	R7hquXfqn2bRJ9h/SwbMOe57+vv9uBmTnONlUMrGcoWlLzaS/TZiRJPGLY56cGFwKyT8grpYK8AJg
	EkU2q1IqxEEYrfKdG6umd2+I+3djwPkGRnPJRHRvu4xnZ54P+elZThpyn2dUD8QKDeukkhDmMrW75
	Ii26qjx31okgyenvglZfgJ1y8nxSRxY8VI4nlqGuewquUECgwZwlvhbuJtl/gPYn46yryIDd6UF1X
	ffLroqGM9MtGzBhDqcDaFPf3/8p3VxMZ6Z/dzRSuFkNfFjA1FH3J3t1uSat5boFMD5DdNGhrd4hon
	YviAMKxw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mKpTk-000khk-DF; Mon, 30 Aug 2021 22:10:08 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 30 Aug 2021 15:10:00 -0700
Message-Id: <20210830221000.179369-16-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830221000.179369-1-mcgrof@kernel.org>
References: <20210830221000.179369-1-mcgrof@kernel.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 31 Aug 2021 08:16:44 +0200
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Luis Chamberlain <mcgrof@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 15/15] pd: add error handling support for
	add_disk()
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

We never checked for errors on add_disk() as this function
returned void. Now that this is fixed, use the shiny new
error handling.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/paride/pd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/block/paride/pd.c b/drivers/block/paride/pd.c
index 500b89a4bdaf..226ed5c93b68 100644
--- a/drivers/block/paride/pd.c
+++ b/drivers/block/paride/pd.c
@@ -938,8 +938,12 @@ static int pd_probe_drive(struct pd_unit *disk, int autoprobe, int port,
 	if (ret)
 		goto put_disk;
 	set_capacity(disk->gd, disk->capacity);
-	add_disk(disk->gd);
+	ret = add_disk(disk->gd);
+	if (ret)
+		goto cleanup_disk;
 	return 0;
+cleanup_disk:
+	blk_cleanup_disk(&disk);
 put_disk:
 	put_disk(p);
 	disk->gd = NULL;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
