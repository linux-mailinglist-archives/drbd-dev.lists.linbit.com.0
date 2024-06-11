Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 5136B903BC3
	for <lists+drbd-dev@lfdr.de>; Tue, 11 Jun 2024 14:22:10 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EBC07420926;
	Tue, 11 Jun 2024 14:22:08 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m17216.xmail.ntesmail.com (mail-m17216.xmail.ntesmail.com
	[45.195.17.216])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8D2C4420671
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 14:22:02 +0200 (CEST)
Received: from localhost.localdomain (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 022EF7E086D
	for <drbd-dev@lists.linbit.com>; Tue, 11 Jun 2024 19:14:07 +0800 (CST)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] rdma: Fix dtr_path use-after-free
Date: Tue, 11 Jun 2024 19:14:06 +0800
Message-Id: <20240611111406.8308-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.17.1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ01DVhoeQx8eTE8ZSUtPQlUZERMWGhIXJBQOD1
	lXWRgSC1lBWUlKQ1VCT1VKSkNVQktZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSktLVUpCS0tZBg
	++
X-HM-Tid: 0a9007015c3c022ckunm022ef7e086d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oio6Dgw*IjciEBIyUQxJIhUf
	DDEwCg9VSlVKTEpDSktPT09DSENIVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUpPSEw3Bg++
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

From: Chen Fan <fan.chen@easystack.cn>

Commit 60a63d648863 has removed for_each_path_ref in rdma,
however in 'for_each_path_ref' it would get-ref for path
after find a path, it will be ok after dtr_activate_path
return error and put-ref for path, but at present if
dtr_activate_path return error, it calls put-ref free
drbd_path directly.

Signed-off-by: Chen Fan <fan.chen@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 65454bac6..3eb8cf39c 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -2970,7 +2970,6 @@ static int dtr_prepare_connect(struct drbd_transport *transport)
 	list_for_each_entry(path, &transport->paths, path.list) {
 		err = dtr_activate_path(path);
 		if (err) {
-			kref_put(&path->path.kref, drbd_destroy_path);
 			goto abort;
 		}
 	}
-- 
2.17.1

