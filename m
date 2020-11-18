Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F3E2B7905
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Nov 2020 09:46:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 476CC4205F4;
	Wed, 18 Nov 2020 09:46:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from m9784.mail.qiye.163.com (m9784.mail.qiye.163.com
	[220.181.97.84])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 029874202DB
	for <drbd-dev@lists.linbit.com>; Wed, 18 Nov 2020 09:46:22 +0100 (CET)
Received: from [192.168.9.105] (unknown [101.207.233.66])
	by m9784.mail.qiye.163.com (Hmail) with ESMTPA id 456C941C1F;
	Wed, 18 Nov 2020 16:46:21 +0800 (CST)
From: Zhang Duan <duan.zhang@easystack.cn>
To: philipp.reisner@linbit.com
Message-ID: <859ad180-0e92-5542-4d52-730589e99682@easystack.cn>
Date: Wed, 18 Nov 2020 16:46:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.3
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSUI3V1ktWUFJV1kPCR
	oVCBIfWUFZHU1PHxpJTUMeHUNCVkpNS05NQ0JKQ0pPSkJVGRETFhoSFyQUDg9ZV1kWGg8SFR0UWU
	FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pgg6TSo*Sz0zIjw2ExQMHDlW
	Nh8wCy9VSlVKTUtOTUNCSkNKTkJKVTMWGhIXVR8OGhVVARMaFRw7HhoIAggPGhgQVRgVRVlXWRIL
	WUFZSktKVUlLTFVJSEhVTU1ZV1kIAVlBSU5NSzcG
X-HM-Tid: 0a75da8884b72086kuqy456c941c1f
Cc: drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/2] drbd: delay resync start unless source has
 transferred to L_SYNC_SOURCE
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

drbd_start_resync may be rescheduled due to down_trylock failure, leaves a
state of L_WF_BITMAP_S while target state is L_SYNC_TARGET and already has
sent its resync request. Then, resync going on while the source is 
L_WF_BITMAP_S
will lead to data lose by time sequence below:

L_WF_BITMAP_S                   L_SYNC_TARGET
                                 resync request(sector A)
reply old data(A)               read & write old data(A)
new IO(A)
send oos(A)                     set oos(A)
A is at new version             resync write A done
                                 set in sync(A) but A is at old version

Signed-off-by: ZhangDuan <duan.zhang@easystack.cn>
---
  drbd/drbd_receiver.c | 9 +++++++++
  1 file changed, 9 insertions(+)

diff --git drbd/drbd_receiver.c drbd/drbd_receiver.c
index a31e44b2..7a9ce4d0 100644
--- drbd/drbd_receiver.c
+++ drbd/drbd_receiver.c
@@ -3301,6 +3301,15 @@ static int receive_DataRequest(struct 
drbd_connection *connection, struct packet
  		return ignore_remaining_packet(connection, pi->size);
  	}
  +	/* Tell target to have a retry, waiting for the rescheduled
+	 * drbd_start_resync to complete. Otherwise the concurrency
+	 * of send oos and resync may lead to a data lose. */
+	if ((pi->cmd == P_RS_DATA_REQUEST || pi->cmd == P_CSUM_RS_REQUEST) &&
+			peer_device->repl_state[NOW] == L_WF_BITMAP_S) {
+		drbd_send_ack_rp(peer_device, P_RS_CANCEL, p);
+		return ignore_remaining_packet(connection, pi->size);
+	}
+	
  	peer_req = drbd_alloc_peer_req(peer_device, GFP_TRY);
  	err = -ENOMEM;
  	if (!peer_req)
-- 
2.24.0.windows.2


-- 
Sincerely Yours,
Zhang Duan
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
