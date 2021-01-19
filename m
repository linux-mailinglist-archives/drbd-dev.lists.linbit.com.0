Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 780B12FB349
	for <lists+drbd-dev@lfdr.de>; Tue, 19 Jan 2021 08:38:32 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 27731420847;
	Tue, 19 Jan 2021 08:38:07 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 491AC42061D
	for <drbd-dev@lists.linbit.com>; Tue, 19 Jan 2021 06:17:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1611033443; x=1642569443;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=BDROplFBhH1R4EEGILjaJK5BhqTJ1siF7I5dea87B68=;
	b=D7nMdFGvmqMDSFpMdjbkETaAO+0dLp+l467xo6QOxp391r7Y90i3WNQg
	x7K0nuD4DBZ6t48fU3aLI9QGUK6jrFVdB+sE4Wdo7D2Rwqx61rd1JuJVL
	B9HP8BNrEzkCOb4yqtgprTwqPuHXIueKbbFfw0ZUxWFrWV9sMmktltkHj
	uMDcDGFifV6XPNhcqC9cwp/w7c1OJWKW86DhgbwNoByJ31wrPrCx9qYDS
	oEhWPYaynXLxZO+P13AVEVVa2qo+TnpB5Gt1z9D00Rt2gU5eEIPRCeV9Z
	YMTZZKuxz0DH+upgs42jxuWuyyEE5KdCrni6J/QUK3C2VIAx2Tr2oUT7K A==;
IronPort-SDR: sBrEm1+x/IoRPbkBCEOCRYu7A3cGSr8jxlPvlTesEEAP0FhrIZ08PuipAbYG2Aoqxm5sy7+if8
	2ZlhgpWSowpsO3gtG7KCEmGpuLxS6w4FUxOESv4KshFMxnVVjgcQMYFuG4b7ib7SXeMw3DN83u
	VaZBIgStI4RvCoL3Gbl/Sp0BmjKjHduLP/57xJz97gouDua4Y2e0MONhEPlc+quBoIoySIsosU
	R7dKRX/A26Jj87he9+wCjqOjXI68X5idIGcuZmHQvhCfr7mzZK0Fy+VZNIKiv3OdirHy0FnWpy
	few=
X-IronPort-AV: E=Sophos;i="5.79,357,1602518400"; d="scan'208";a="157763987"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jan 2021 13:09:14 +0800
IronPort-SDR: ic5sHv6e45Q9g0E/BQLuMzP5G4UqFe3eGA3smTJ+NvfSEvzlWCUt3MwLCKW3Y92izm2yMloNUe
	QBC0GmYH4MLD4dtvtJzWmjaj4Xw/aQ/3zBL8OJd01mUbzdAnMnswMoGMsZ6C7mk8BxJvlxiznY
	F4Cj73hq12nOECKcYsw8OrEODKT2dgT3rEn8FxocLmLsZ3zdE/5f7MyolWqzf80Hpk89t7cnvp
	YxFfL0IRdZml2FhQUSiPMoY31qJ/MFiD2uX9OhzouRsQgkpFe0IAWpRXCD6FWUHCGuWt9ozPDh
	zMtOdW9llj40EjCJ0XVSJXu5
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jan 2021 20:51:50 -0800
IronPort-SDR: TUB4fUCiZmYYR74Zcq3vSkW9sI4g+StmmNi9bjrhbbXw9jVqPyfJUUEFsMQdyN9Xq4K6n7Gn8a
	Xr6vVD5OtZEwhLTDm6sJ+DJHPnZcY1k4fpGLKffcDnsEbkcmhWxrNLKyN/hbblQkxxwTcZE2KU
	qYtpp06Bbo/MdAwTBedKhVuo+MaJ3eMXDG6FXDQH5gjW129P5pemibZ8rtfa1SbEY1fp51cPiu
	ZnsBDBB15dkF/zopQoBN7n0qT3SGiHxK3hsHzU8k+P+0nyNJdJcQLu/AX3kBJLLH5SuOOpZND1
	ur4=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
	by uls-op-cesaip02.wdc.com with ESMTP; 18 Jan 2021 21:09:14 -0800
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com, linux-bcache@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	cluster-devel@redhat.com
Date: Mon, 18 Jan 2021 21:06:16 -0800
Message-Id: <20210119050631.57073-23-chaitanya.kulkarni@wdc.com>
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
Subject: [Drbd-dev] [RFC PATCH 22/37] dm-crypt: use bio_init_fields
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
 drivers/md/dm-crypt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 53791138d78b..b03dbcbff491 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1764,9 +1764,7 @@ static void clone_init(struct dm_crypt_io *io, struct bio *clone)
 {
 	struct crypt_config *cc = io->cc;
 
-	clone->bi_private = io;
-	clone->bi_end_io  = crypt_endio;
-	bio_set_dev(clone, cc->dev->bdev);
+	bio_init_fields(clone, cc->dev->bdev, 0, io, crypt_endio, 0, 0);
 	clone->bi_opf	  = io->base_bio->bi_opf;
 }
 
-- 
2.22.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
