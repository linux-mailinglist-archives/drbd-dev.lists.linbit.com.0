Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2713DD200
	for <lists+drbd-dev@lfdr.de>; Mon,  2 Aug 2021 10:31:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 73BB54205FE;
	Mon,  2 Aug 2021 10:31:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from baidu.com (mx20.baidu.com [111.202.115.85])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 569A64203D2
	for <drbd-dev@lists.linbit.com>; Mon,  2 Aug 2021 10:16:12 +0200 (CEST)
Received: from BC-Mail-Ex29.internal.baidu.com (unknown [172.31.51.23])
	by Forcepoint Email with ESMTPS id B73066283537FD28EB0C;
	Mon,  2 Aug 2021 16:00:30 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
	BC-Mail-Ex29.internal.baidu.com (172.31.51.23) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.2242.12; Mon, 2 Aug 2021 16:00:30 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
	BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.2308.14; Mon, 2 Aug 2021 16:00:30 +0800
From: Cai Huoqing <caihuoqing@baidu.com>
To: <philipp.reisner@linbit.com>, <lars.ellenberg@linbit.com>,
	<axboe@kernel.dk>
Date: Mon, 2 Aug 2021 16:00:23 +0800
Message-ID: <20210802080023.1259-3-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210802080023.1259-1-caihuoqing@baidu.com>
References: <20210802080023.1259-1-caihuoqing@baidu.com>
MIME-Version: 1.0
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-MAIL-EX04.internal.baidu.com (10.127.64.14) To
	BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Mailman-Approved-At: Mon, 02 Aug 2021 10:31:27 +0200
Cc: Cai Huoqing <caihuoqing@baidu.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/2] drbd: Replace "unsigned" with "unsigned int"
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

when run checkpath.pl for the first patch, found that
WARNING: Prefer 'unsigned int' to bare use of 'unsigned'.
so fix it. BTW

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/block/drbd/drbd_receiver.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 8a73d7d3d16f..cf8c71a3ea91 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -364,7 +364,7 @@ drbd_alloc_peer_req(struct drbd_peer_device *peer_device, u64 id, sector_t secto
 	struct drbd_device *device = peer_device->device;
 	struct drbd_peer_request *peer_req;
 	struct page *page = NULL;
-	unsigned nr_pages = PFN_UP(payload_size);
+	unsigned int nr_pages = PFN_UP(payload_size);
 
 	if (drbd_insert_fault(device, DRBD_FAULT_AL_EE))
 		return NULL;
@@ -1643,9 +1643,9 @@ int drbd_submit_peer_request(struct drbd_device *device,
 	struct bio *bio;
 	struct page *page = peer_req->pages;
 	sector_t sector = peer_req->i.sector;
-	unsigned data_size = peer_req->i.size;
-	unsigned n_bios = 0;
-	unsigned nr_pages = PFN_UP(data_size);
+	unsigned int data_size = peer_req->i.size;
+	unsigned int n_bios = 0;
+	unsigned int nr_pages = PFN_UP(data_size);
 	int err = -ENOMEM;
 
 	/* TRIM/DISCARD: for now, always use the helper function
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
