Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F22D9316
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:25 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3E68442083F;
	Mon, 14 Dec 2020 06:56:14 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 23FEE420634
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:59:11 +0100 (CET)
Received: by mail-il1-f194.google.com with SMTP id t9so12778973ilf.2
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sIxoDP8vzpNwOr/ZONrMGfaq9DZp+SERLzwAxCVxlUo=;
	b=BfiQfWNjGdPo0faIFGOc52DVWeIRfa7aQcYJIp88PN6cRSYplTtnE0jR47PD7PnEuJ
	EitX06yspLiNYrMnkZf6n8ARfxtZkjVICwu6JbcIq3OwFQuIIadllDXGTt/D68UglPV8
	2DIHpF1IYxV9HF4Agyixxg9gYnJhDimXdBDkBlM9pQ7oEQronQo0ux9fNtrDmx5tJqpE
	SQbd1glSe9ORyDw8aiOHqZSALUQZ8UC6Jkx6wAVq2eLTCKbYWWlONhSo9+6OMwQ8vEeg
	FTvt4hVpw0G9Z7jogEw1zNFPAYeJQPcsybw1OVuUEuJl4sK+YgUUpeKCp5txQ3RNlt5w
	ySrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sIxoDP8vzpNwOr/ZONrMGfaq9DZp+SERLzwAxCVxlUo=;
	b=Z5+DdD/D/9x8Q8pfwkRKHlo9dvktZPU+dbrM1WEPYbn4Qd6XRZCZG0wbRnlIbetFTW
	p8zziFoix9vk1xfDKdWuXoe8J/zjToL4dLHb2DzDojd/Py48qivNLmqne4PNs1n2EHrE
	BI2v+0aeTAHE1g1+ox5jTE9gDbSNW+zPDiKMAImia55DBisKXKnIi4KHdcZ39JjBlr/J
	MVPgFx0vGPiIf4NMV6Nnnjj+p2I0gOcrV4HF218L9RqVpvF74lR0haDQLjTndIkjzBLJ
	717xtTiZxrQCCr/FUL7zktYb3U5xd+FhgLqVHbuZ/mW1xE2SBTHyy7uD8wzlJZsPOhJH
	VvZg==
X-Gm-Message-State: AOAM532b6c6KkXrHCoY3Uq0qv82SgZYuljx+CnEACKof4q1cuAqaVYQ3
	5Db7fGSQ+qj/lk9Qnh1o7bQAqLxQYNzXTw==
X-Google-Smtp-Source: ABdhPJzYtq3Ols+BoktA9q2elGm4YtLP6tgk3eDCy9BkgYSbmJ3YqflMsWacSlJWQBJ24M6BwwEsiQ==
X-Received: by 2002:a92:dc11:: with SMTP id t17mr27063000iln.307.1607839151119;
	Sat, 12 Dec 2020 21:59:11 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id s1sm6962752iot.0.2020.12.12.21.59.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:59:10 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:58:57 -0500
Message-Id: <20201213055859.3305-7-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213055859.3305-1-michael.d.labriola@gmail.com>
References: <20201213055859.3305-1-michael.d.labriola@gmail.com>
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] [PATCH 6/8] drbd: get rid of set_fs() usage
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

5.10 is getting rid of set_fs().  When I went looking through git commits
to figure out how to properly protect sendpage, what I found was this
commit from 4.13:

    10428957 drbd: ->sendpage() never needed set_fs()

Signed-off-by: Michael D Labriola <michael.d.labriola@gmail.com>
---
 drbd/drbd_transport_tcp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drbd/drbd_transport_tcp.c b/drbd/drbd_transport_tcp.c
index 3b1d4273..4e076460 100644
--- a/drbd/drbd_transport_tcp.c
+++ b/drbd/drbd_transport_tcp.c
@@ -1138,7 +1138,6 @@ static int dtt_send_page(struct drbd_transport *transport, enum drbd_stream stre
 	struct drbd_tcp_transport *tcp_transport =
 		container_of(transport, struct drbd_tcp_transport, transport);
 	struct socket *socket = tcp_transport->stream[stream];
-	mm_segment_t oldfs = get_fs();
 	int len = size;
 	int err = -EIO;
 
@@ -1147,7 +1146,6 @@ static int dtt_send_page(struct drbd_transport *transport, enum drbd_stream stre
 
 	msg_flags |= MSG_NOSIGNAL;
 	dtt_update_congested(tcp_transport);
-	set_fs(KERNEL_DS);
 	do {
 		int sent;
 
@@ -1173,7 +1171,6 @@ static int dtt_send_page(struct drbd_transport *transport, enum drbd_stream stre
 		 * and add that to the while() condition below.
 		 */
 	} while (len > 0 /* THINK && peer_device->repl_state[NOW] >= L_ESTABLISHED */);
-	set_fs(oldfs);
 	clear_bit(NET_CONGESTED, &tcp_transport->transport.flags);
 
 	if (len == 0)
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
