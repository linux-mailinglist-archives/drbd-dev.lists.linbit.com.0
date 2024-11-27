Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B9A9DA6EB
	for <lists+drbd-dev@lfdr.de>; Wed, 27 Nov 2024 12:40:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5EE874207C5;
	Wed, 27 Nov 2024 12:40:08 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m247.xmail.ntesmail.com (mail-m247.xmail.ntesmail.com
	[45.195.24.7])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BEC64202D7
	for <drbd-dev@lists.linbit.com>; Wed, 27 Nov 2024 12:40:02 +0100 (CET)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1edf6a5c;
	Wed, 27 Nov 2024 19:20:48 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] drbd: Fix memory leak
Date: Wed, 27 Nov 2024 19:20:47 +0800
Message-ID: <20241127112048.1460255-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHh5IVkIdTEweGR4eQ0xMSFYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a936d5a35a40227kunm1edf6a5c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PVE6ETo5HzcRST4WTiMYDx8Y
	VhcwCjJVSlVKTEhJTEtNT05LS05JVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUhNSEo3Bg++
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
 drbd/drbd_main.c  |  2 ++
 drbd/drbd_state.c | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drbd/drbd_main.c b/drbd/drbd_main.c
index 86535080f..48c9588eb 100644
--- a/drbd/drbd_main.c
+++ b/drbd/drbd_main.c
@@ -3765,6 +3765,8 @@ struct drbd_resource *drbd_create_resource(const char *name,
 
 	list_add_tail_rcu(&resource->resources, &drbd_resources);
 
+	resource->state_change_err_str = NULL;
+
 	return resource;
 
 fail_free_pages:
diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
index 24ff7ab30..4102f2a04 100644
--- a/drbd/drbd_state.c
+++ b/drbd/drbd_state.c
@@ -1566,6 +1566,9 @@ static __printf(2, 3) void _drbd_state_err(struct change_context *context, const
 		*context->err_str = err_str;
 	if (context->flags & CS_VERBOSE)
 		drbd_err(resource, "%s\n", err_str);
+
+	if (!context->err_str)
+		kfree(err_str);
 }
 
 static __printf(2, 3) void drbd_state_err(struct drbd_resource *resource, const char *fmt, ...)
@@ -1582,6 +1585,9 @@ static __printf(2, 3) void drbd_state_err(struct drbd_resource *resource, const
 		*resource->state_change_err_str = err_str;
 	if (resource->state_change_flags & CS_VERBOSE)
 		drbd_err(resource, "%s\n", err_str);
+
+	if (!resource->state_change_err_str)
+		kfree(err_str);
 }
 
 static enum drbd_state_rv __is_valid_soft_transition(struct drbd_resource *resource)
@@ -5586,6 +5592,7 @@ static enum drbd_state_rv twopc_after_lost_peer(struct drbd_resource *resource,
 		.target_node_id = -1,
 		.flags = flags | (resource->res_opts.quorum != QOU_OFF ? CS_FORCE_RECALC : 0),
 		.change_local_state_last = false,
+		.err_str = NULL,
 	};
 
 	/* The other nodes get the request for an empty state change. I.e. they
@@ -5915,7 +5922,8 @@ enum drbd_state_rv change_repl_state(struct drbd_peer_device *peer_device,
 			.mask = { { .conn = conn_MASK } },
 			.val = { { .conn = new_repl_state } },
 			.target_node_id = peer_device->node_id,
-			.flags = flags
+			.flags = flags,
+			.err_str = NULL,
 		},
 		.peer_device = peer_device
 	};
-- 
2.43.0

