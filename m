Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 61952AFDDC3
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Jul 2025 05:01:25 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 60D34162283;
	Wed,  9 Jul 2025 05:01:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 304 seconds by postgrey-1.31 at mail19;
	Wed, 09 Jul 2025 05:01:03 CEST
Received: from mail-m81225.netease.com (mail-m81225.netease.com [47.88.81.225])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 20D5E162276
	for <drbd-dev@lists.linbit.com>; Wed,  9 Jul 2025 05:01:02 +0200 (CEST)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id cbe5d3ed;
	Wed, 9 Jul 2025 10:55:54 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 1/3] rdma: Fix kernel crash in dtr_create_rx_desc()
Date: Wed,  9 Jul 2025 10:55:50 +0800
Message-ID: <20250709025553.694792-1-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGElDVk1DSBkfQkJLTUJCQ1YVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a97ed1c73860227kunm0bf5c36f9d5904
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NhA6PSo6MjdRIgwBUUgdMkhW
	LxwKCyFVSlVKTE5JS0lCTE5OSE5PVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQU9OS0M3Bg++
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

Have the crash info as follow:
BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
PGD 0
Oops: 0000 [#1] SMP NOPTI
CPU: 51 PID: 748 Comm: kworker/51:1 Kdump: loaded Tainted: G           OE    --------- -  - 4.18.0-372.19.1.es8_10.x86_64 #1
Hardware name: SuperCloud R5215 G13/R5215 G13, BIOS EG6.17.12 12/20/2024
Workqueue: events dtr_refill_rx_descs_work_fn [drbd_transport_rdma]
RIP: 0010:dtr_create_rx_desc+0xe1/0x310 [drbd_transport_rdma]
Code: 48 85 db 0f 84 85 01 00 00 48 89 5d 20 48 8b 0d e5 dd 4f c7 4c 89 7d 00 4c 8b 05 ea dd 4f c7 c7 45 18 00 00 00 00 48 8b 43 28 <8b> 00 89 45 34 48 8b 53 08 4c 89 f8 48 29 c8 48 8b 12 48 c1 f8 06
RSP: 0018:ff8baaf70e6a3e28 EFLAGS: 00010286
RAX: 0000000000000000 RBX: ff4b9894e7f1f800 RCX: ffdcf32780000000
RDX: 0000000000000002 RSI: ff8baaf70e6a3dc0 RDI: ff4b98b3edac2fa8
RBP: ff4b989488700280 R08: ff4b989340000000 R09: ff4b989488700280
R10: 0000000000001000 R11: 0000000000000009 R12: ff4b989e12a2b648
R13: ff4b989c5fbaca60 R14: 0000000000001000 R15: ffdcf328136d5100
FS:  0000000000000000(0000) GS:ff4b98b33fac0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 00000015d3410004 CR4: 0000000000773ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe07f0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 __dtr_refill_rx_desc+0x5d/0xb0 [drbd_transport_rdma]
 process_one_work+0x1a7/0x360
 ? create_worker+0x1a0/0x1a0
 worker_thread+0x30/0x390
 ? create_worker+0x1a0/0x1a0
 kthread+0x10a/0x120
 ? set_kthread_struct+0x40/0x40
 ret_from_fork+0x1f/0x40

(gdb) l *dtr_create_rx_desc+0xe1
0x1e01 is in dtr_create_rx_desc (/.../drbd_transport_rdma.c:2093).
2088                    goto out;
2089            }
2090            rx_desc->cm = cm;
2091            rx_desc->page = page;
2092            rx_desc->size = 0;
2093            rx_desc->sge.lkey = dtr_cm_to_lkey(cm);
2094            rx_desc->sge.addr = ib_dma_map_single(cm->id->device, page_address(page), alloc_size,
2095                                                  DMA_FROM_DEVICE);

static u32 dtr_cm_to_lkey(struct dtr_cm *cm)
{
	return cm->pd->local_dma_lkey;
}

It is safe to obtain cm through dtr_path_get_cm(), so cm is not a null pointer.

In the dtr_path_prepare() function, it first replaces the cm of the path.
After the replacement is successful,
it will alloc pd in the subsequent dtr_cm_alloc_rdma_res() function.

So if in the __dtr_refill_rx_desc() function,
the cm of the path is replaced with a cm that has no pd yet,
this problem will occur.

In the dtr_path_get_cm() function, check the cm status,
if it is not connected, return null.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 14392a33b..442dd8e89 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -842,6 +842,20 @@ static struct dtr_cm *dtr_path_get_cm(struct dtr_path *path)
 {
 	struct dtr_cm *cm;
 
+	rcu_read_lock();
+	cm = __dtr_path_get_cm(path);
+	if (cm && cm->state != DSM_CONNECTED) {
+		kref_put(&cm->kref, dtr_destroy_cm);
+		cm = NULL;
+	}
+	rcu_read_unlock();
+	return cm;
+}
+
+static struct dtr_cm *dtr_path_get_cm_raw(struct dtr_path *path)
+{
+	struct dtr_cm *cm;
+
 	rcu_read_lock();
 	cm = __dtr_path_get_cm(path);
 	rcu_read_unlock();
@@ -2567,9 +2581,6 @@ static int _dtr_cm_alloc_rdma_res(struct dtr_cm *cm,
 		goto createqp_failed;
 	}
 
-	for (i = DATA_STREAM; i <= CONTROL_STREAM ; i++)
-		dtr_create_rx_desc(&path->flow[i], GFP_NOIO);
-
 	return 0;
 
 createqp_failed:
@@ -2756,7 +2767,7 @@ static void __dtr_disconnect_path(struct dtr_path *path)
 		break;
 	}
 
-	cm = dtr_path_get_cm(path);
+	cm = dtr_path_get_cm_raw(path);
 	if (!cm)
 		return;
 
-- 
2.43.0

