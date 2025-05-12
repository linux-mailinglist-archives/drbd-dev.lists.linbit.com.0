Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3915FAB2F28
	for <lists+drbd-dev@lfdr.de>; Mon, 12 May 2025 07:50:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3EDF116096D;
	Mon, 12 May 2025 07:50:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 302 seconds by postgrey-1.31 at mail19;
	Mon, 12 May 2025 07:49:56 CEST
Received: from mail-m1973171.qiye.163.com (mail-m1973171.qiye.163.com
	[220.197.31.71])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A0050160930
	for <drbd-dev@lists.linbit.com>; Mon, 12 May 2025 07:49:56 +0200 (CEST)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 989bf758;
	Mon, 12 May 2025 13:44:49 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] drbd: Fix kernel hangs issue
Date: Mon, 12 May 2025 13:44:49 +0800
Message-ID: <20250512054449.1876131-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSR0fVkxMTUtIHk9OTR5OGlYVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a96c30644400227kunm989bf758
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OT46TCo5VjcNHR8VIjkDMj4a
	LxowCxdVSlVKTE9MS0lDTUJLQk9KVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQU9LQkI3Bg++
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

Kernel hangs:
[433091.237135] BUG: scheduling while atomic: swapper/27/0/0x00000100
[433091.392756] CPU: 27 PID: 0 Comm: swapper/27 Kdump: loaded Tainted: G
OE    --------- -  - 4.18.0-372.19.1.es8_10.aarch64 #1
[433091.406962] Hardware name: WUZHOU S627K2/BC82AMDQ, BIOS 6.70
04/03/2024
[433091.414645] Call trace:
[433091.418157]  dump_backtrace+0x0/0x158
[433091.422867]  show_stack+0x24/0x30
[433091.427215]  dump_stack+0x5c/0x74
[433091.431582]  __schedule_bug+0x74/0x88
[433091.436260]  __schedule+0x794/0x860
[433091.440760]  schedule+0x48/0xc8
[433091.444888]  schedule_timeout+0x1ac/0x2c0
[433091.449903]  __dtr_disconnect_path+0x28c/0x520 [drbd_transport_rdma]
[433091.457229]  dtr_disconnect_path.part.3+0x20/0x78 [drbd_transport_rdma]
[433091.464879]  dtr_remove_path+0x24/0x30 [drbd_transport_rdma]
[433091.471553]  drbd_destroy_path+0x34/0x60 [drbd]
[433091.477144]  drbd_reclaim_path+0x44/0x50 [drbd]
[433091.482683]  rcu_do_batch+0x178/0x438
[433091.487319]  rcu_core+0x1d4/0x2f8
[433091.491635]  rcu_core_si+0x14/0x20
[433091.496021]  __do_softirq+0x118/0x320
[433091.500656]  irq_exit_rcu+0x10c/0x120
[433091.505243]  irq_exit+0x14/0x20
[433091.509293]  __handle_domain_irq+0x70/0xc0
[433091.514266]  gic_handle_irq+0xd4/0x178
[433091.518891]  el1_irq+0xb8/0x140
[433091.522877]  arch_cpu_idle+0x20/0x28
[433091.527295]  default_idle_call+0x54/0x158
[433091.532154]  do_idle+0x208/0x278
[433091.536230]  cpu_startup_entry+0x28/0x30
[433091.540977]  secondary_start_kernel+0x150/0x160

(gdb) l *__dtr_disconnect_path+0x28c
0xa3c is in __dtr_disconnect_path
(/usr/src/debug/kmod-drbd-kmodtool-9.2.9-10.es8_19.k372.mlnx.23.04.aarch64/obj/default-OFED/drbd/drbd_transport_rdma.c:2772).
2771            case PCS_FINISHING:
2772                    t = wait_event_timeout(path->cs.wq,
2773				atomic_read(&path->cs.passive_state) == PCS_INACTIVE,
2774                                           HZ * 60);

So, the problem is that schedule is called in the softirq.

We should remove ops.remove_path() from call_rcu() to avoid this problem.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_main.c | 5 +++--
 drbd/drbd_nl.c   | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drbd/drbd_main.c b/drbd/drbd_main.c
index f058736a1..d3912e019 100644
--- a/drbd/drbd_main.c
+++ b/drbd/drbd_main.c
@@ -3078,6 +3078,9 @@ static void drbd_remove_all_paths(struct drbd_connection *connection)
 	smp_wmb();
 
 	list_for_each_entry_safe(path, tmp, &transport->paths, list) {
+
+		transport->class->ops.remove_path(path);
+
 		/* Exclusive with reading state, in particular remember_state_change() */
 		write_lock_irq(&resource->state_rwlock);
 		list_del_rcu(&path->list);
@@ -3963,8 +3966,6 @@ void drbd_destroy_path(struct kref *kref)
 	struct drbd_connection *connection =
 		container_of(path->transport, struct drbd_connection, transport);
 
-	connection->transport.class->ops.remove_path(path);
-
 	kref_debug_put(&connection->kref_debug, 17);
 	kref_put(&connection->kref, drbd_destroy_connection);
 	kfree(path);
diff --git a/drbd/drbd_nl.c b/drbd/drbd_nl.c
index 3a7991e74..bb5d531bf 100644
--- a/drbd/drbd_nl.c
+++ b/drbd/drbd_nl.c
@@ -4810,6 +4810,8 @@ adm_del_path(struct drbd_config_context *adm_ctx,  struct genl_info *info)
 		/* Ensure flag visible before list manipulation. */
 		smp_wmb();
 
+		transport->class->ops.remove_path(path);
+
 		/* Exclusive with reading state, in particular remember_state_change() */
 		write_lock_irq(&resource->state_rwlock);
 		list_del_rcu(&path->list);
-- 
2.43.0

