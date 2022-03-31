Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 142E74EE3CD
	for <lists+drbd-dev@lfdr.de>; Fri,  1 Apr 2022 00:06:26 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EBFC1420600;
	Fri,  1 Apr 2022 00:06:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
	[209.85.208.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B964E4201DC
	for <drbd-dev@lists.linbit.com>; Fri,  1 Apr 2022 00:05:55 +0200 (CEST)
Received: by mail-ed1-f45.google.com with SMTP id b15so880925edn.4
	for <drbd-dev@lists.linbit.com>; Thu, 31 Mar 2022 15:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+lEn0rQXRmAObsqwUwKyW/Jy0vdmwy8BXHEgwAE2mHM=;
	b=PEzt+lNbqXrw78tEz86wAgIk1WgIENnBw4AQdHmYeS76iY4ontNQCB7V2FhHBy137N
	h25I9VQ0x1o6CC6zeggAoOJdtDlPn9c1z1tZ96oTptUO/ZUDkFx1y54OdctnZSwRzjth
	2yTXbIkfbLK2y5U+Dxw40iw36w/h6fN5CvxNkhEyZ9bVeboOcS7khnNwGocYDeJ6DTH/
	fS1rAwNWAnioifnye/a/ou8j/md8VMXAHNChdh9G+ACrGzRkp+k+O2nBldq5EGDzZsDH
	QkCyBEQZMwcup94DmLfkop43kjPiwhJngebHt3HcdZl/+OPYbYpB0tNoFJ4tTVJxQKU7
	waNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+lEn0rQXRmAObsqwUwKyW/Jy0vdmwy8BXHEgwAE2mHM=;
	b=OXch7QNg3boB062bXPAcs60xO/12A/nJrAKfNh8svMv4G1rxBUIFjtunEpqBZxrL7I
	qLhv6HZI2fzi5+hsZDHVQn0GrHWbJjCNVpxYy5o8O6Xh4+W5f7LQPjvDGgGLvdUU5/+S
	94we/4092RdWyBYFSVtRhJZRLt76U+KooFPbM1j6ax2C7FG2cZkegyw6AvbQlOnDTjRC
	lFUpp8Tze05J2JXam0/MhOurVe1jjfqnR1BikEJKvNvY/mxj48N+Pi4pQGuGBcTs4d5u
	edaG4bRvwpVtd4ln8tBzDy0MFDSwvs+39VYD0f2D62s88/Ok0yu1UttjLyemTBPOn2UF
	RHzg==
X-Gm-Message-State: AOAM531Rl2iVbEKz9//7ubAd+C86AyElh+EDTUO33viijL/QTTT8wSW+
	d7Jq22zkgXQ57wluzRWQGa8=
X-Google-Smtp-Source: ABdhPJzNZk8q2x1q7JKwPHbmGCK62v+mwob1Y6v9D7/hHAtR5hk1m/aaU1rHniseikkyl4flEhzC2g==
X-Received: by 2002:a05:6402:1e8a:b0:41a:4242:7de9 with SMTP id
	f10-20020a0564021e8a00b0041a42427de9mr18307883edf.284.1648764355187;
	Thu, 31 Mar 2022 15:05:55 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
	[62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
	o2-20020a50d802000000b00410d7f0c52csm321110edj.8.2022.03.31.15.05.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Mar 2022 15:05:54 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>
Date: Fri,  1 Apr 2022 00:03:49 +0200
Message-Id: <20220331220349.885126-2-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331220349.885126-1-jakobkoschel@gmail.com>
References: <20220331220349.885126-1-jakobkoschel@gmail.com>
MIME-Version: 1.0
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, "Bos,
	H.J." <h.j.bos@vu.nl>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
	linux-block@vger.kernel.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
	Jakob Koschel <jakobkoschel@gmail.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Mike Rapoport <rppt@kernel.org>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 2/2] drbd: remove check of list iterator against
	head past the loop body
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

When list_for_each_entry() completes the iteration over the whole list
without breaking the loop, the iterator value will be a bogus pointer
computed based on the head element.

While it is safe to use the pointer to determine if it was computed
based on the head element, either with list_entry_is_head() or
&pos->member == head, using the iterator variable after the loop should
be avoided.

In preparation to limit the scope of a list iterator to the list
traversal loop, use a dedicated pointer to point to the found element [1].

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/block/drbd/drbd_req.c | 42 ++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index c04394518b07..b2571dc77fe6 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -332,17 +332,21 @@ static void set_if_null_req_next(struct drbd_peer_device *peer_device, struct dr
 static void advance_conn_req_next(struct drbd_peer_device *peer_device, struct drbd_request *req)
 {
 	struct drbd_connection *connection = peer_device ? peer_device->connection : NULL;
+	struct drbd_request *iter = req;
 	if (!connection)
 		return;
 	if (connection->req_next != req)
 		return;
-	list_for_each_entry_continue(req, &connection->transfer_log, tl_requests) {
-		const unsigned s = req->rq_state;
-		if (s & RQ_NET_QUEUED)
+
+	req = NULL;
+	list_for_each_entry_continue(iter, &connection->transfer_log, tl_requests) {
+		const unsigned int s = iter->rq_state;
+
+		if (s & RQ_NET_QUEUED) {
+			req = iter;
 			break;
+		}
 	}
-	if (&req->tl_requests == &connection->transfer_log)
-		req = NULL;
 	connection->req_next = req;
 }
 
@@ -358,17 +362,21 @@ static void set_if_null_req_ack_pending(struct drbd_peer_device *peer_device, st
 static void advance_conn_req_ack_pending(struct drbd_peer_device *peer_device, struct drbd_request *req)
 {
 	struct drbd_connection *connection = peer_device ? peer_device->connection : NULL;
+	struct drbd_request *iter = req;
 	if (!connection)
 		return;
 	if (connection->req_ack_pending != req)
 		return;
-	list_for_each_entry_continue(req, &connection->transfer_log, tl_requests) {
-		const unsigned s = req->rq_state;
-		if ((s & RQ_NET_SENT) && (s & RQ_NET_PENDING))
+
+	req = NULL;
+	list_for_each_entry_continue(iter, &connection->transfer_log, tl_requests) {
+		const unsigned int s = iter->rq_state;
+
+		if ((s & RQ_NET_SENT) && (s & RQ_NET_PENDING)) {
+			req = iter;
 			break;
+		}
 	}
-	if (&req->tl_requests == &connection->transfer_log)
-		req = NULL;
 	connection->req_ack_pending = req;
 }
 
@@ -384,17 +392,21 @@ static void set_if_null_req_not_net_done(struct drbd_peer_device *peer_device, s
 static void advance_conn_req_not_net_done(struct drbd_peer_device *peer_device, struct drbd_request *req)
 {
 	struct drbd_connection *connection = peer_device ? peer_device->connection : NULL;
+	struct drbd_request *iter = req;
 	if (!connection)
 		return;
 	if (connection->req_not_net_done != req)
 		return;
-	list_for_each_entry_continue(req, &connection->transfer_log, tl_requests) {
-		const unsigned s = req->rq_state;
-		if ((s & RQ_NET_SENT) && !(s & RQ_NET_DONE))
+
+	req = NULL;
+	list_for_each_entry_continue(iter, &connection->transfer_log, tl_requests) {
+		const unsigned int s = iter->rq_state;
+
+		if ((s & RQ_NET_SENT) && !(s & RQ_NET_DONE)) {
+			req = iter;
 			break;
+		}
 	}
-	if (&req->tl_requests == &connection->transfer_log)
-		req = NULL;
 	connection->req_not_net_done = req;
 }
 
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
