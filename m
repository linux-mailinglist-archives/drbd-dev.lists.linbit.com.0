Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7E5AFDDC4
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Jul 2025 05:01:46 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2E7731622B1;
	Wed,  9 Jul 2025 05:01:40 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 303 seconds by postgrey-1.31 at mail19;
	Wed, 09 Jul 2025 05:01:03 CEST
Received: from mail-m81229.netease.com (mail-m81229.netease.com [47.88.81.229])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 32F65162282
	for <drbd-dev@lists.linbit.com>; Wed,  9 Jul 2025 05:01:02 +0200 (CEST)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id cbe5d3f1;
	Wed, 9 Jul 2025 10:55:55 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 2/3] drbd: Fix kernel crash in drbd_find_path_by_addr()
Date: Wed,  9 Jul 2025 10:55:51 +0800
Message-ID: <20250709025553.694792-2-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709025553.694792-1-zhengbing.huang@easystack.cn>
References: <20250709025553.694792-1-zhengbing.huang@easystack.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUhPVk4dQk0eTktOHx5IS1YVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a97ed1c78b90227kunm0bf5c36f9d591c
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ky46Cyo4NTdODAwSPk85MlEP
	H0xPChpVSlVKTE5JS0lCTE5MS01CVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQU9MS0g3Bg++
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

We hava the crash info as follow:
 BUG: unable to handle kernel NULL pointer dereference at 0000000000000000
 Workqueue: ib_cm cm_work_handler [ib_cm]
 RIP: 0010:drbd_find_path_by_addr+0x6c/0xd0 [drbd]
 Call Trace:
  dtr_cma_event_handler+0x1c1/0x4ee [drbd_transport_rdma]
  cma_cm_event_handler+0x25/0xd0 [rdma_cm]
  cma_ib_req_handler+0x7cd/0x1250 [rdma_cm]
  ? addr4_resolve+0x67/0xd0 [ib_core]
  cm_process_work+0x22/0xf0 [ib_cm]
  cm_req_handler+0x7ed/0xf40 [ib_cm]
  ? __switch_to_asm+0x35/0x70
  cm_work_handler+0x798/0xf30 [ib_cm]
  ? finish_task_switch+0x18e/0x2e0
  process_one_work+0x1a7/0x360
  ? create_worker+0x1a0/0x1a0
  worker_thread+0x30/0x390
  ? create_worker+0x1a0/0x1a0
  kthread+0x10a/0x120
  ? set_kthread_struct+0x40/0x40
  ret_from_fork+0x1f/0x40

The code that crash is traverse the listener->waiters list:
struct drbd_path *drbd_find_path_by_addr(struct drbd_listener *listener, struct sockaddr_storage *addr)
{
	struct drbd_path *path;

	list_for_each_entry(path, &listener->waiters, listener_link) {
		if (addr_equal(&path->peer_addr, addr))
			return path;
	}

	return NULL;
}

The listener->waiters list has a Path node:
crash> struct dtr_listener ff4ba75054797c00
struct dtr_listener {
  listener = {
    kref = {
      refcount = {
        refs = {
          counter = 2
        }
      }
    },
    resource = 0xff4ba766cc325000,
    transport_class = 0xffffffffc037f080 <rdma_transport_class>,
    list = {
      next = 0xff4ba766cc325500,
      prev = 0xff4ba766cc325500
    },
    waiters = {
      next = 0xff4ba74fd578e138,
      prev = 0xff4ba74fd578e138
    },
 ...
}

but this Path has been released:
crash> struct drbd_path 0xff4ba74fd578e000
struct drbd_path {
  my_addr = {
    ss_family = 1,
    __data = "\000\000\000\000"
  },
  peer_addr = {
    ss_family = 0,
    __data = "\000\000\000\000\000\000\0"
  },
  kref = {
    refcount = {
      refs = {
        counter = 0
      }
    }
  },
  net = 0x0,
  my_addr_len = 0,
  peer_addr_len = 0,
  flags = 0,
  // all zero
  ...
}

So this path has been released, but it is still on the listener->waiters list,
which cause problem when traverse the list later.

And the scenario of this problem should be like this:
thread_1:
  remove_path()
    dtr_remove_path()
      drbd_put_listener()
        list_del(&path->listener_link)
                                          thread_2:
                                            ...
                                            dtr_activate_path()
                                              drbd_get_listener()
                                                list_add(&path->listener_link, &listener->waiters);
                                            ...
   ...
   kfree(path)

thread_3:
connect request come in:
dtr_cma_event_handler()
  dtr_cma_accept()
    drbd_find_path_by_addr()
    crash

To avoid this use-after-free, we hold an additional reference to drbd_path
whenever it is added to the listener->waiters list, and drop it when removed.

This ensures the path memory remains valid during list traversal.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drbd/drbd_transport.c b/drbd/drbd_transport.c
index 00e7f9269..aff96716f 100644
--- a/drbd/drbd_transport.c
+++ b/drbd/drbd_transport.c
@@ -224,6 +224,7 @@ int drbd_get_listener(struct drbd_path *path)
 
 	spin_lock_bh(&listener->waiters_lock);
 	list_add(&path->listener_link, &listener->waiters);
+	kref_get(&path->kref);
 	path->listener = listener;
 	spin_unlock_bh(&listener->waiters_lock);
 	/* After exposing the listener on a path, drbd_put_listenr() can destroy it. */
@@ -258,6 +259,7 @@ void drbd_put_listener(struct drbd_path *path)
 
 	spin_lock_bh(&listener->waiters_lock);
 	list_del(&path->listener_link);
+	kref_put(&path->kref, drbd_destroy_path);
 	spin_unlock_bh(&listener->waiters_lock);
 	kref_put(&listener->kref, drbd_listener_destroy);
 }
-- 
2.43.0

