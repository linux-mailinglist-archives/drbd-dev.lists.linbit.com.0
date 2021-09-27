Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3341A231
	for <lists+drbd-dev@lfdr.de>; Tue, 28 Sep 2021 00:03:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A80BA420950;
	Tue, 28 Sep 2021 00:03:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 995524205FE
	for <drbd-dev@lists.linbit.com>; Tue, 28 Sep 2021 00:01:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=lal2NXQqjpgVXT5qKBKMi1UaOalfu5XptBbZ07KGrZw=;
	b=yQSS1ENaqP0/EmeOmEA7TaYNbH
	KkQ1/i0F0uNf9lDdAx9K73d02TPmNN3Ivsk8DSXa6F/9zD4EjLag0VZxHuhK3OO8aBPIIbPAiTfbE
	riPJmPJUNubabBALjMrY6x2rg2Vj/2iDryU9nQlzd0PM4Q/guxMrv+dbeUhtqqPg1LXu7cu4WtdiJ
	8yD2V0n2H+6bpHkWVYpEsu4A35PdKy+5XBgzyZcHCiDssQ9mKhBeNpxaB9umX4LZfNdApZ6YwC/X4
	b/+NQPuXMCqj7bKRlJTiaZbfyxe4pi+SsX1p9gL9t9anUIFqPq3xeX+508J+0d7xf0lP3kPhHV31r
	tYpI3naA==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mUygS-004TPk-9U; Mon, 27 Sep 2021 22:01:12 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk, justin@coraid.com, geert@linux-m68k.org,
	ulf.hansson@linaro.org, hare@suse.de, tj@kernel.org,
	philipp.reisner@linbit.com, lars.ellenberg@linbit.com, jdike@addtoit.com,
	richard@nod.at, anton.ivanov@cambridgegreys.com, johannes.berg@intel.com,
	chris.obbard@collabora.com, krisman@collabora.com, zhuyifei1999@gmail.com,
	thehajime@gmail.com, chris@zankel.net, jcmvbkbc@gmail.com, tim@cyberelk.net
Date: Mon, 27 Sep 2021 15:01:09 -0700
Message-Id: <20210927220110.1066271-15-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927220110.1066271-1-mcgrof@kernel.org>
References: <20210927220110.1066271-1-mcgrof@kernel.org>
MIME-Version: 1.0
Cc: linux-xtensa@linux-xtensa.org, linux-um@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	Luis Chamberlain <mcgrof@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 14/15] pcd: capture errors on cdrom_register()
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

No errors were being captured wehen cdrom_register() fails,
capture the error and return the error.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/block/paride/pcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/block/paride/pcd.c b/drivers/block/paride/pcd.c
index 82a654fc4db8..4cc0d141db78 100644
--- a/drivers/block/paride/pcd.c
+++ b/drivers/block/paride/pcd.c
@@ -940,7 +940,9 @@ static int pcd_init_unit(struct pcd_unit *cd, bool autoprobe, int port,
 
 	cd->present = 1;
 	pcd_probe_capabilities(cd);
-	register_cdrom(cd->disk, &cd->info);
+	ret = register_cdrom(cd->disk, &cd->info);
+	if (ret)
+		goto out_pi_release;
 	ret = add_disk(cd->disk);
 	if (ret)
 		goto out_unreg_cdrom;
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
