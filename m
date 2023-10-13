Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 386A27CBA45
	for <lists+drbd-dev@lfdr.de>; Tue, 17 Oct 2023 07:45:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 191C6426837;
	Tue, 17 Oct 2023 07:45:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 358 seconds by postgrey-1.31 at mail19;
	Fri, 13 Oct 2023 05:45:25 CEST
Received: from jari.cn (unknown [218.92.28.115])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 15C464201C5
	for <drbd-dev@lists.linbit.com>; Fri, 13 Oct 2023 05:45:24 +0200 (CEST)
Received: from chenguohua$jari.cn ( [182.148.14.172] ) by
	ajax-webmail-localhost.localdomain (Coremail) ;
	Fri, 13 Oct 2023 11:36:56 +0800 (GMT+08:00)
X-Originating-IP: [182.148.14.172]
Date: Fri, 13 Oct 2023 11:36:56 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: chenguohua@jari.cn
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	christoph.boehmwalder@linbit.com
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.1-cmXT6 build
	20230419(ff23bf83) Copyright (c) 2002-2023 www.mailtech.cn
	mispb-4e503810-ca60-4ec8-a188-7102c18937cf-zhkzyfz.cn
MIME-Version: 1.0
Message-ID: <505ab7d2.949.18b271bd108.Coremail.chenguohua@jari.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAfwBn+D1Yuyhl3NjBAA--.686W
X-CM-SenderInfo: xfkh0w5xrk3tw6md2xgofq/1tbiAQADEWUnvzMAGQAbsf
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-Mailman-Approved-At: Tue, 17 Oct 2023 07:45:19 +0200
Cc: linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] kallsyms: Clean up errors in module.h
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

ERROR: space required after that ',' (ctx:VxV)

Signed-off-by: GuoHua Cheng <chenguohua@jari.cn>
---
 include/linux/module.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index a98e188cf37b..48aebea72d3a 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -152,7 +152,7 @@ extern void cleanup_module(void);
 #define __initconst_or_module
 #define __INIT_OR_MODULE	.text
 #define __INITDATA_OR_MODULE	.data
-#define __INITRODATA_OR_MODULE	.section ".rodata","a",%progbits
+#define __INITRODATA_OR_MODULE	.section ".rodata", "a", %progbits
 #else
 #define __init_or_module __init
 #define __initdata_or_module __initdata
@@ -802,7 +802,7 @@ static inline bool within_module(unsigned long addr, const struct module *mod)
 }
 
 /* Get/put a kernel symbol (calls should be symmetric) */
-#define symbol_get(x) ({ extern typeof(x) x __attribute__((weak,visibility("hidden"))); &(x); })
+#define symbol_get(x) ({ extern typeof(x) x __attribute__((weak, visibility("hidden"))); &(x); })
 #define symbol_put(x) do { } while (0)
 #define symbol_put_addr(x) do { } while (0)
 
-- 
2.17.1
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
