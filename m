Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CB7914250
	for <lists+drbd-dev@lfdr.de>; Mon, 24 Jun 2024 07:52:08 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8A8EB420633;
	Mon, 24 Jun 2024 07:52:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 335 seconds by postgrey-1.31 at mail19;
	Mon, 24 Jun 2024 07:52:01 CEST
Received: from mail-m32121.qiye.163.com (mail-m32121.qiye.163.com
	[220.197.32.121])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E9BCA4205D4
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 07:52:01 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 78DF87E06C5
	for <drbd-dev@lists.linbit.com>; Mon, 24 Jun 2024 13:46:23 +0800 (CST)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 06/11] drbd_transport_rdma: put kref in error path
Date: Mon, 24 Jun 2024 13:46:14 +0800
Message-Id: <20240624054619.23212-6-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
References: <20240624054619.23212-1-zhengbing.huang@easystack.cn>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHUpJVkhLSEIdGRhOSBpIQlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9048c7f9b2022ckunm78df87e06c5
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NU06Iio6FjciPgI*Ny8pHB5K
	HC9PCxdVSlVKTEpCSUtMQkNIQk5JVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUpPTU83Bg++
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

From: Dongsheng Yang <dongsheng.yang@easystack.cn>

Signed-off-by: Dongsheng Yang <dongsheng.yang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 9a6d15b78..c7adc87e3 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -1157,6 +1157,7 @@ static void dtr_cma_connect_work_fn(struct work_struct *work)
 	kref_get(&cm->kref); /* for the path->cm pointer */
 	err = dtr_path_prepare(path, cm, true);
 	if (err) {
+		kref_put(&cm->kref, dtr_destroy_cm);
 		tr_err(transport, "dtr_path_prepare() = %d\n", err);
 		goto out;
 	}
-- 
2.27.0

