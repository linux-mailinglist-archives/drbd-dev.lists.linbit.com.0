Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C44E6CCA
	for <lists+drbd-dev@lfdr.de>; Fri, 25 Mar 2022 04:12:50 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4BAE3420471;
	Fri, 25 Mar 2022 04:12:49 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m24100.qiye.163.com (mail-m24100.qiye.163.com
	[220.194.24.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E47E94201F2
	for <drbd-dev@lists.linbit.com>; Fri, 25 Mar 2022 04:12:47 +0100 (CET)
Received: from easystack.cn (localhost [127.0.0.1])
	by mail-m24100.qiye.163.com (Hmail) with ESMTP id D4416560230;
	Fri, 25 Mar 2022 11:02:59 +0800 (CST)
Message-ID: <ANUANAAVIdwn*FrX7b*E8aoA.3.1648177379860.Hmail.rui.xu@easystack.cn>
To: Rui Xu <rui.xu@easystack.cn>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 153.3.1.47
In-Reply-To: <20220302123523.471277-1-rui.xu@easystack.cn>
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [153.3.1.47) ] by ajax-webmail (
	[127.0.0.1] ) ; Fri, 25 Mar 2022 11:02:59 +0800 (GMT+08:00)
From: Xu Rui <rui.xu@easystack.cn>
Date: Fri, 25 Mar 2022 11:02:59 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWRkfGB5WS04ZTRgYQk8aSR
	1OVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUpPSk1PTElNSE1NTjdXWQweGVlBDwkOHldZEh8eFQ9Z
	QVlHOjUuOjU6Oi0yHwwVUT0JI0wZUT5DGhQ6VUhVSk1PQ0pMTEhMQkJCSFUzFhoSF1UJDhJVAw47
	HhoIAggPGhgQVRgVRVlXWRILWUFZSk5IVUhVSlVPTFlXWQgBWUFITUNMN1dZFAsPEhQVCFlBSzcG
X-HM-Tid: 0a7fbf06fa148c39kuqt17facf8e533
Cc: philipp.reisner@linbit.com, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev]
	=?utf-8?q?=5BPATCH=5D_drbd=3Ado_not_wait_for_negotiati?=
	=?utf-8?q?on_result_with_unconnected_peer?=
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
Date: 2022-03-02 20:35:23
To:  joel.colledge@linbit.com,philipp.reisner@linbit.com,drbd-dev@lists.linbit.com
Cc:  dongsheng.yang@easystack.cn,Rui Xu <rui.xu@easystack.cn>
Subject: [PATCH] drbd:do not wait for negotiation result with unconnected peer>The commit 8a962a6a from Dec 2014
>"drbd: fix leaving of D_NEGOTIATING if some peer do not have the minor yet"
>introduced a bug that disk state will always stay in negotiating since there
>will never be negotiation result with unconnected peer.
>
>So do not wait for an negotiation result with unconnected peer!
>
>Signed-off-by: Rui Xu <rui.xu@easystack.cn>
>---
> drbd/drbd_state.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drbd/drbd_state.c b/drbd/drbd_state.c
>index aeaf36a..f79f5a4 100644
>--- a/drbd/drbd_state.c
>+++ b/drbd/drbd_state.c
>@@ -1912,7 +1912,8 @@ static void sanitize_state(struct drbd_resource *resource)
> 				enum drbd_repl_state nr = peer_device->negotiation_result;
> 				enum drbd_disk_state pdsk = peer_device->disk_state[NEW];
> 
>-				if (pdsk == D_UNKNOWN || pdsk < D_NEGOTIATING)
>+				if (pdsk == D_UNKNOWN || pdsk < D_NEGOTIATING ||
>+				    peer_device->connection->cstate[NEW] < C_CONNECTED)
> 					continue;
> 
> 				if (pdsk == D_UP_TO_DATE)
>-- 
>1.8.3.1
>


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
