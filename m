Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AD19F246D
	for <lists+drbd-dev@lfdr.de>; Sun, 15 Dec 2024 15:46:35 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8C3B416B80D;
	Sun, 15 Dec 2024 15:46:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 12434 seconds by postgrey-1.31 at mail19;
	Sun, 15 Dec 2024 15:46:28 CET
Received: from mail-m10149.netease.com (mail-m10149.netease.com
	[154.81.10.149])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 938FA160644
	for <drbd-dev@lists.linbit.com>; Sun, 15 Dec 2024 15:46:27 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2b8c66e9;
	Sun, 15 Dec 2024 14:50:56 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH v2] drbd: Fix memory leak
Date: Sun, 15 Dec 2024 14:50:56 +0800
Message-ID: <20241215065056.879266-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEJNVksfHh1KGRpPSRpMHlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxKVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a93c9159c530227kunm2b8c66e9
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OBQ6Sgw5GDcXSRg6DjcOTysR
	MCIKCTJVSlVKTEhPSU9OT05MTEtJVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUlDS0o3Bg++
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

In the output of kmemleak, we have the followe backtrace:

unreferenced object 0xffff8885b57cda80 (size 64):
  comm "drbd_r_testimg4", pid 37104, jiffies 4494192827 (age 127162.843s)
  hex dump (first 32 bytes):
    31 20 6f 66 20 32 20 6e 6f 64 65 73 20 76 69 73  1 of 2 nodes vis
    69 62 6c 65 2c 20 6e 65 65 64 20 32 20 66 6f 72  ible, need 2 for
  backtrace:
    [<000000006d641d68>] __kmalloc_track_caller+0x15c/0x270
    [<000000006a7ffbcf>] kvasprintf+0xa7/0x120
    [<000000002d2f15b3>] drbd_state_err+0xa9/0x190 [drbd]
    [<000000006aa2f3df>] __is_valid_soft_transition+0xe99/0xec0 [drbd]
    [<0000000009d68cc7>] try_state_change+0x4f0/0x840 [drbd]
    [<00000000d5640f06>] ___end_state_change+0x140/0x12a0 [drbd]
    [<000000009f4b8d71>] __end_state_change+0xa1/0x130 [drbd]
    [<000000001c6de1a7>] change_connection_state+0x5ee/0xbd0 [drbd]
    [<00000000ce4408d6>] process_twopc+0x1d3e/0x2ce0 [drbd]
    [<00000000df3af6e8>] receive_twopc+0x17b/0x2b0 [drbd]
    [<000000009701f919>] drbd_receiver+0x311/0x6e0 [drbd]
    [<0000000092c4aeb1>] drbd_thread_setup+0x19d/0x430 [drbd]
    [<0000000098e316ab>] kthread+0x19c/0x1c0
    [<000000004c72b3a8>] ret_from_fork+0x1f/0x40

This is a memory leak.

In drbd_state_err() function, if resource->state_change_err_str is a null pointer,
the err_str will not be free.
And _drbd_state_err() has same issues.

So, if err_str has not put to up layer, free it in current function.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_state.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
index 24ff7ab30..bd3410f98 100644
--- a/drbd/drbd_state.c
+++ b/drbd/drbd_state.c
@@ -1562,10 +1562,13 @@ static __printf(2, 3) void _drbd_state_err(struct change_context *context, const
 	va_end(args);
 	if (!err_str)
 		return;
-	if (context->err_str)
-		*context->err_str = err_str;
 	if (context->flags & CS_VERBOSE)
 		drbd_err(resource, "%s\n", err_str);
+
+	if (context->err_str)
+		*context->err_str = err_str;
+	else
+		kfree(err_str);
 }
 
 static __printf(2, 3) void drbd_state_err(struct drbd_resource *resource, const char *fmt, ...)
@@ -1578,10 +1581,13 @@ static __printf(2, 3) void drbd_state_err(struct drbd_resource *resource, const
 	va_end(args);
 	if (!err_str)
 		return;
-	if (resource->state_change_err_str)
-		*resource->state_change_err_str = err_str;
 	if (resource->state_change_flags & CS_VERBOSE)
 		drbd_err(resource, "%s\n", err_str);
+
+	if (resource->state_change_err_str)
+		*resource->state_change_err_str = err_str;
+	else
+		kfree(err_str);
 }
 
 static enum drbd_state_rv __is_valid_soft_transition(struct drbd_resource *resource)
-- 
2.43.0

