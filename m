Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 487992494A7
	for <lists+drbd-dev@lfdr.de>; Wed, 19 Aug 2020 07:51:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3643A42093F;
	Wed, 19 Aug 2020 07:51:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.prgmr.com (mail.prgmr.com [71.19.149.6])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 850FF42093C
	for <drbd-dev@lists.linbit.com>; Wed, 19 Aug 2020 07:51:52 +0200 (CEST)
Received: from localhost.localdomain (c-174-62-72-237.hsd1.ca.comcast.net
	[174.62.72.237]) (Authenticated sender: srn)
	by mail.prgmr.com (Postfix) with ESMTPSA id 43D77720091;
	Wed, 19 Aug 2020 01:51:21 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com 43D77720091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
	s=default; t=1597816281;
	bh=B2BLIaR3PrzpYx4jUtyvCHNAMuYiyDF0npfKWWz7n28=;
	h=From:To:Cc:Subject:Date:From;
	b=ODQ4NGEVzxGB1RnEVb7kcgAskFwaEVeeh+EN/VU4nd2sYteM0MWzK2Mwn+SZVNOK4
	Q61D24hqg826wikt3PSdruFrJAnTISRVNQ38lAalPDwqjRbJJNvplpfqIRk/KJpadG
	3pkNLZhxcPLIht0Snu3O/Gvvra6IXxRy0zVFFoik=
From: Sarah Newman <srn@prgmr.com>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com
Date: Tue, 18 Aug 2020 22:49:26 -0700
Message-Id: <20200819054926.30758-1-srn@prgmr.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [Drbd-dev] [PATCH] block: drbd: add missing kref_get in
	handle_write_conflicts
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

The other place that drbd_send_acks_wf was called from already
calls kref_get.

This can be reproduced with the following for an existing
connection:

drbdsetup net-options local_addr remote_addr \
  --protocol=C \
  --allow-two-primaries

drbsetup primary minor
dd if=/dev/drbd<minor> of=sector bs=512 count=1
while true; do dd if=sector of=/dev/drbd<minor>; done

During this, if we have function tracing enabled for e_send_superseded, it
  triggers:

$ sudo cat /sys/kernel/tracing/trace_pipe
    kworker/u4:2-14838 [001] .... 113244.465689: e_send_superseded <-drbd_finish_peer_reqs
    kworker/u4:2-14838 [001] .... 113244.468237: e_send_superseded <-drbd_finish_peer_reqs
    kworker/u4:2-14838 [001] .... 113244.482757: e_send_superseded <-drbd_finish_peer_reqs
    kworker/u4:1-15502 [001] .... 113244.485092: e_send_superseded <-drbd_finish_peer_reqs

This eventually results in behavior like:

[113418.435846] watchdog: BUG: soft lockup - CPU#1 stuck for 23s! [dd:15505]

Or a message similar to

block drbd0: ASSERT( device->open_cnt == 0 )
  in drivers/block/drbd/drbd_main.c:2232

Signed-off-by: Sarah Newman <srn@prgmr.com>
---
 drivers/block/drbd/drbd_receiver.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 2b3103c30857..1ad693a5aab5 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -2531,7 +2531,11 @@ static int handle_write_conflicts(struct drbd_device *device,
 			peer_req->w.cb = superseded ? e_send_superseded :
 						   e_send_retry_write;
 			list_add_tail(&peer_req->w.list, &device->done_ee);
-			queue_work(connection->ack_sender, &peer_req->peer_device->send_acks_work);
+			/* put is in drbd_send_acks_wf() */
+			kref_get(&device->kref);
+			if (!queue_work(connection->ack_sender,
+					&peer_req->peer_device->send_acks_work))
+				kref_put(&device->kref, drbd_destroy_device);
 
 			err = -ENOENT;
 			goto out;
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
