Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EFF4E6CC2
	for <lists+drbd-dev@lfdr.de>; Fri, 25 Mar 2022 04:07:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C5879420471;
	Fri, 25 Mar 2022 04:07:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 346 seconds by postgrey-1.31 at mail19;
	Fri, 25 Mar 2022 04:07:47 CET
Received: from mail-m24100.qiye.163.com (mail-m24100.qiye.163.com
	[220.194.24.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 30C254203DF
	for <drbd-dev@lists.linbit.com>; Fri, 25 Mar 2022 04:07:47 +0100 (CET)
Received: from easystack.cn (localhost [127.0.0.1])
	by mail-m24100.qiye.163.com (Hmail) with ESMTP id DBC0956023E;
	Fri, 25 Mar 2022 11:01:58 +0800 (CST)
Message-ID: <AJ*A6wDEId6nn-rl7MpNZapM.3.1648177318891.Hmail.rui.xu@easystack.cn>
To: Rui Xu <rui.xu@easystack.cn>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 153.3.1.47
In-Reply-To: <20220223084442.3312409-1-rui.xu@easystack.cn>
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [153.3.1.47) ] by ajax-webmail (
	[127.0.0.1] ) ; Fri, 25 Mar 2022 11:01:58 +0800 (GMT+08:00)
From: Xu Rui <rui.xu@easystack.cn>
Date: Fri, 25 Mar 2022 11:01:58 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWRpDSUlWQxkYTx8dQ0NDHx
	1JVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUpPSk5KSUlLTklNSTdXWQweGVlBDwkOHldZEh8eFQ9Z
	QVlHOjFROk0MPz4yH00VFVYJF0w2CzUhGgs2VUhVSk1PQ0pMTEhKQktPQlUzFhoSF1UJDhJVAw47
	HhoIAggPGhgQVRgVRVlXWRILWUFZSk5IVUhVSlVPTFlXWQgBWUFPTEJCN1dZFAsPEhQVCFlBSzcG
X-HM-Tid: 0a7fbf060beb8c39kuqt17facf8e507
Cc: philipp.reisner@linbit.com, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev]
	=?utf-8?q?=5BPATCH=5D_drbd=3A_fix_a_bug_of_do=5Fchange?=
	=?utf-8?q?=5Fdisk=5Fstate_when_attach?=
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

PING
From: Rui Xu <rui.xu@easystack.cn>
Date: 2022-02-23 16:44:42
To:  philipp.reisner@linbit.com,drbd-dev@lists.linbit.com
Cc:  dongsheng.yang@easystack.cn,Rui Xu <rui.xu@easystack.cn>
Subject: [PATCH] drbd: fix a bug of do_change_disk_state when attach>There is a bug in do_change_disk_state when attach disk to
>drbd. Consider this scenario:
>
>Primary: node-1, Secondary: node-2, node-3
>
>(1) Network failure occurs on node-1 so that node-2 and
>node-3 will lose connection to node-1
>
>(2) Detach the disk of drbd on node-2 use 'drbdadm detach'
>
>(3) Attach the disk of drbd on node-2 use 'drbdadm attach'
>
>we can see that disk state of node-2 will stay in the negotiating
>and miss a handshake with node-3, what causes this is when we attach,
>disk state will going to negotiating from attaching, we will determine
>whether a two-pc is required in do_change_disk_state, since we lose the
>connection with node-1 and node-1 was first connection, connection->agreeed
>_pro_version will less than 110, at last, we will not do a two-pc, which
>leads a problem that node-3 will not send p_state to node-2, then node-2 miss
>a handshake with node-3 and the disk state of node-2 will not change.
>
>Fix it by using supports_two_phase_commit to determine whether a two-pc is
>really required.
>
>Signed-off-by: Rui Xu <rui.xu@easystack.cn>
>---
> drbd/drbd_state.c | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>
>diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
>index aeaf36a..2cb501d 100644
>--- a/drbd/drbd_state.c
>+++ b/drbd/drbd_state.c
>@@ -5173,10 +5173,7 @@ static bool do_change_disk_state(struct change_context *context, enum change_pha
> 	if (device->disk_state[NOW] == D_ATTACHING &&
> 	    context->val.disk == D_NEGOTIATING) {
> 		if (device_has_peer_devices_with_disk(device)) {
>-			struct drbd_connection *connection =
>-				first_connection(device->resource);
>-			cluster_wide_state_change =
>-				connection && connection->agreed_pro_version >= 110;
>+			cluster_wide_state_change = supports_two_phase_commit(device->resource);
> 		} else {
> 			/* very last part of attach */
> 			context->val.disk = disk_state_from_md(device);
>-- 
>1.8.3.1
>


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
