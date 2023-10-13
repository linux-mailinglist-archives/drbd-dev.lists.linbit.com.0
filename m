Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D57CBA46
	for <lists+drbd-dev@lfdr.de>; Tue, 17 Oct 2023 07:45:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3CE0B42683B;
	Tue, 17 Oct 2023 07:45:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from jari.cn (unknown [218.92.28.115])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E420D4201C5
	for <drbd-dev@lists.linbit.com>; Fri, 13 Oct 2023 05:46:24 +0200 (CEST)
Received: from chenguohua$jari.cn ( [182.148.14.172] ) by
	ajax-webmail-localhost.localdomain (Coremail) ;
	Fri, 13 Oct 2023 11:37:49 +0800 (GMT+08:00)
X-Originating-IP: [182.148.14.172]
Date: Fri, 13 Oct 2023 11:37:49 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: chenguohua@jari.cn
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.1-cmXT6 build
	20230419(ff23bf83) Copyright (c) 2002-2023 www.mailtech.cn
	mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
MIME-Version: 1.0
Message-ID: <4b210be.94a.18b271ca056.Coremail.chenguohua@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwDHZD+Nuyhl5djBAA--.681W
X-CM-SenderInfo: xfkh0w5xrk3tw6md2xgofq/1tbiAQADEWUnvzMAGQAcsY
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Mailman-Approved-At: Tue, 17 Oct 2023 07:45:19 +0200
Cc: linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: Clean up errors in drbd.h
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

Fix the following errors reported by checkpatch:

ERROR: spaces required around that '=' (ctx:VxW)

Signed-off-by: GuoHua Cheng <chenguohua@jari.cn>
---
 include/linux/drbd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/drbd.h b/include/linux/drbd.h
index 5468a2399d48..3a8c60eaf3bd 100644
--- a/include/linux/drbd.h
+++ b/include/linux/drbd.h
@@ -139,7 +139,7 @@ enum drbd_ret_code {
 	ERR_CSUMS_ALG_ND	= 145, /* DRBD 8.2 only */
 	ERR_VERIFY_ALG		= 146, /* DRBD 8.2 only */
 	ERR_VERIFY_ALG_ND	= 147, /* DRBD 8.2 only */
-	ERR_CSUMS_RESYNC_RUNNING= 148, /* DRBD 8.2 only */
+	ERR_CSUMS_RESYNC_RUNNING = 148, /* DRBD 8.2 only */
 	ERR_VERIFY_RUNNING	= 149, /* DRBD 8.2 only */
 	ERR_DATA_NOT_CURRENT	= 150,
 	ERR_CONNECTED		= 151, /* DRBD 8.3 only */
-- 
2.17.1
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
