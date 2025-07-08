Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C35DAFC825
	for <lists+drbd-dev@lfdr.de>; Tue,  8 Jul 2025 12:19:54 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 62ADC162281;
	Tue,  8 Jul 2025 12:19:41 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 4003 seconds by postgrey-1.31 at mail19;
	Tue, 08 Jul 2025 12:19:23 CEST
Received: from mail-m1973171.qiye.163.com (mail-m1973171.qiye.163.com
	[220.197.31.71])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0F1C3160991
	for <drbd-dev@lists.linbit.com>; Tue,  8 Jul 2025 12:19:21 +0200 (CEST)
Received: from hzb-HP-Laptop-14s-cr2xxx.. (unknown [218.94.118.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id cb35d841;
	Tue, 8 Jul 2025 14:50:41 +0800 (GMT+08:00)
From: "zhengbing.huang" <zhengbing.huang@easystack.cn>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 2/3] rdma: ratelimit error log
Date: Tue,  8 Jul 2025 14:50:39 +0800
Message-ID: <20250708065040.4043169-2-zhengbing.huang@easystack.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708065040.4043169-1-zhengbing.huang@easystack.cn>
References: <20250708065040.4043169-1-zhengbing.huang@easystack.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQ01MVhhNGE4eHh0dGkNLH1YVFAkWGhdVGRETFh
	oSFyQUDg9ZV1kYEgtZQVlJSkNVQk9VSkpDVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a97e8cd0c1d0227kunm79295d308d0d7e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NlE6MRw*SDdWNg4dKxQfIzIL
	KBxPFENVSlVKTE5KQk5MT09JTUhIVTMWGhIXVQETHhUcGRIVHFUTDhoVHDseGggCCA8aGBBVGBVF
	WVdZEgtZQVlJSkNVQk9VSkpDVUJLWVdZCAFZQUlOSkg3Bg++
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

Have a crash call trace as follow:
  ? bit_clear+0x120/0x120
  fbcon_putcs+0xe7/0x100
  fbcon_redraw.isra.20+0xfd/0x1e0
  fbcon_scroll+0x8c9/0xde0
  con_scroll+0x20b/0x220
  ? bit_clear+0x120/0x120
  lf+0xa0/0xb0
  vt_console_print+0x310/0x400
  console_unlock+0x35f/0x4a0
  vprintk_emit+0x14d/0x250
  printk+0x58/0x6f
  dtr_tx_cq_event_handler+0x895/0x8a0 [drbd_transport_rdma]
  ? sched_clock+0x5/0x10
  ? do_IRQ+0x7f/0xd0
  mlx5_eq_comp_int+0xb0/0x1d0 [mlx5_core]
  notifier_call_chain+0x47/0x70
  atomic_notifier_call_chain+0x16/0x20
  irq_int_handler+0x11/0x20 [mlx5_core]

and the code is:
(gdb) l *dtr_tx_cq_event_handler+0x894
0x3404 is in dtr_tx_cq_event_handler (.../drbd_transport_rdma.c:1935).
1930                    if (stream_nr != ST_FLOW_CTRL) {
1931                            err = dtr_repost_tx_desc(cm, tx_desc);
1932                            if (!err)
1933                                    tx_desc = NULL; /* it is in the air again! Fly! */
1934                            else
1935                                    tr_warn(transport, "repost of tx_desc failed! %d\n", err);
1936                    }

This problem is that too many logs print in irq, cause the kernel crash.

So, we ratelimit error log

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
---
 drbd/drbd_transport_rdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index 5270e503a..30edfaf96 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -1920,7 +1920,7 @@ static int dtr_handle_tx_cq_event(struct ib_cq *cq, struct dtr_cm *cm)
 			err = dtr_repost_tx_desc(cm, tx_desc);
 			if (!err)
 				tx_desc = NULL; /* it is in the air again! Fly! */
-			else
+			else if(__ratelimit(&rdma_transport->rate_limit))
 				tr_warn(transport, "repost of tx_desc failed! %d\n", err);
 		}
 	}
-- 
2.43.0

