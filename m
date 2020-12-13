Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B44D2D930D
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DB69B420813;
	Mon, 14 Dec 2020 06:56:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 525B2420634
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:07:24 +0100 (CET)
Received: by mail-qk1-f193.google.com with SMTP id 19so12693433qkm.8
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sIxoDP8vzpNwOr/ZONrMGfaq9DZp+SERLzwAxCVxlUo=;
	b=lRohXLJ/voxJi7hu5IXGBJDRwbYB498lV4QmX5sO8vtjoLyDh3ccGrQct1ZvIYwN4d
	T0J+hdLrdoRA6A1A/ydEhy/wkhVoI66Swav6QAucE0Li0XbqwRNzMt6MFRgVuSPh3GkX
	6BkBw7pfKq5FrYrJjQU7XfTj59aDsB7hM1mMl6/mKVlyJaAQJtM9iigqC2YtJVbjTUIp
	iLLUd1W/7tPec0udcbo2CoSWPY5I7aGXAw6sLRyhGO/mUyx6EctaQOZRk5b2r75t1xbE
	b3ywkdNMQApTyGlX67sSqVqMX/1pYQKUzYY0rRNPGx8gmZHRlgGSj60ZXXgkZcIQ4G0z
	beHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sIxoDP8vzpNwOr/ZONrMGfaq9DZp+SERLzwAxCVxlUo=;
	b=IxlLr+ZImvcv8b9DRI+t5jfQb8SB8c4wmc8g3Xp267yA5DVm1S2QwCHh6yj6bY6A9X
	FjhAb93mbBJEDyMJRqbKJYRpm1Vyk9Y808X/zV5DMMJkjIs80v6Jgq2nPoktS3oiaMXF
	yA8DFWVNW7lISi9aT4O4jDk59xgCAmHxkhHJk8KTB+jZnzlqY6hx9YoC/Svr9quH4qWV
	wcNb8DS78H3QG+eMaudwzA0xtlMZCD000UKXr4Eg8kOX698c46/aHYDa4CfU+RV2FcnB
	qJWhULkVxyPdxrbwhJg0bH4e0CHYRBNSqI4Mp8ZK619RQLX+OcFGYGDZxabPo3I8Nvgg
	Cknw==
X-Gm-Message-State: AOAM533+Tw5fsAOQSENMcFT5TNW7TrB55jXAqt6WykeEoQ2GCLdii9c1
	BonB2wbEONFm7tfyUU4eOQBxHcCOv/YqMA==
X-Google-Smtp-Source: ABdhPJyaN+SVb57VIPvjMnATvc+WTqov43pRDwMnISY8YEuKoku5XZhDy2tNhj0gc2DPb/dQeAuwKA==
X-Received: by 2002:a37:5dc3:: with SMTP id
	r186mr25793811qkb.472.1607836044190; 
	Sat, 12 Dec 2020 21:07:24 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id
	f185sm11803045qkb.119.2020.12.12.21.07.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:07:23 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:07:02 -0500
Message-Id: <20201213050704.997-7-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213050704.997-1-michael.d.labriola@gmail.com>
References: <20201213050704.997-1-michael.d.labriola@gmail.com>
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
