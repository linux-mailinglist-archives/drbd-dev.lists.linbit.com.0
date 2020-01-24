Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7414ABB1
	for <lists+drbd-dev@lfdr.de>; Mon, 27 Jan 2020 22:34:54 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DB4DA420343;
	Mon, 27 Jan 2020 22:34:52 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1971 seconds by postgrey-1.31 at mail19;
	Mon, 27 Jan 2020 22:34:51 CET
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D4B6D4202F4
	for <drbd-dev@lists.linbit.com>; Mon, 27 Jan 2020 22:34:51 +0100 (CET)
Received: by mail-ed1-f68.google.com with SMTP id p23so3604889edr.5
	for <drbd-dev@lists.linbit.com>; Mon, 27 Jan 2020 13:34:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YcwyPAFjSUef256jVd/LqgAlAGJ5MT3dwIwcaJOlvSc=;
	b=eCj3A/GdWz8ydcOnc/dVjCpylLBiB0R4gWGCo6setMgLvcNyCudkstj3GFVGXMwhOe
	bTSfITKRQp1R4xAgWL6bR+O6Pure+wk6HSH72j+s5ZhSI6XmsD7+LbhFn1sQcTUw3IvG
	HORGamrgSkTzf5bIzOj4k8s6X85KPTQCuREM/vmztKEwyMU5vkpaZJ4jdYUjcR8bDOLA
	g/d1OWAtLhzY5o7EYAfptNywwK0YYPWTvS7N6Na56EqoyU7Cq5CKV7WGnE57khg9GfOU
	rb2rkMPRA26ZmDQpbekZgxqajkTWTVTfvnsRQ209bglF//Cb+21t44UrwiQSXU+uMq63
	4AUw==
X-Gm-Message-State: APjAAAX2sB4xlxVbnYNvcyLG5PUdCEnfksWzi/En+7bZvdyAqxsp+1SA
	TwF9Cd9fpCJIOtdMoTdvpJs11Yv+BtBZGjjl
X-Google-Smtp-Source: APXvYqx2RapkfbDx7kKMy8Dzcv2G8UgRF/MxM+MliaK3CiPCl77krY+fe0oXruSlxOq1yRgE7pJfTw==
X-Received: by 2002:adf:e887:: with SMTP id d7mr23293657wrm.162.1580157226898; 
	Mon, 27 Jan 2020 12:33:46 -0800 (PST)
Received: from grappa.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	n8sm22066544wrx.42.2020.01.27.12.33.46
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 27 Jan 2020 12:33:46 -0800 (PST)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 27 Jan 2020 21:33:44 +0100
Resent-Message-ID: <20200127203344.GG26861@grappa.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 378 seconds by postgrey-1.31 at mail19;
	Fri, 24 Jan 2020 21:10:03 CET
Received: from 7.mo177.mail-out.ovh.net (7.mo177.mail-out.ovh.net
	[46.105.61.149])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DBDF74203BA
	for <drbd-dev@lists.linbit.com>; Fri, 24 Jan 2020 21:10:03 +0100 (CET)
Received: from player746.ha.ovh.net (unknown [10.110.103.129])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id E672212111D
	for <drbd-dev@lists.linbit.com>; Fri, 24 Jan 2020 21:03:44 +0100 (CET)
Received: from sk2.org (unknown [77.240.182.90])
	(Authenticated sender: steve@sk2.org)
	by player746.ha.ovh.net (Postfix) with ESMTPSA id 2A304EB0DCF2;
	Fri, 24 Jan 2020 20:03:38 +0000 (UTC)
From: Stephen Kitt <steve@sk2.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com
Date: Fri, 24 Jan 2020 21:03:07 +0100
Message-Id: <20200124200307.1808593-1-steve@sk2.org>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5593470739511987563
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrvdeggddufedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucfkpheptddrtddrtddrtddpjeejrddvgedtrddukedvrdeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejgeeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopegurhgsugdquggvvheslhhishhtshdrlhhinhgsihhtrdgtohhm
Cc: linux-block@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
	linux-kernel@vger.kernel.org
Subject: [Drbd-dev] [PATCH] drbd fifo_alloc: use struct_size
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

Switching to struct_size for the allocation in fifo_alloc avoids
hard-coding the type of fifo_buffer.values in fifo_alloc. It also
provides overflow protection; to avoid pessimistic code being
generated by the compiler as a result, this patch also switches
fifo_size to unsigned, propagating the change as appropriate.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 drivers/block/drbd/drbd_int.h      | 2 +-
 drivers/block/drbd/drbd_nl.c       | 3 ++-
 drivers/block/drbd/drbd_receiver.c | 2 +-
 drivers/block/drbd/drbd_worker.c   | 4 ++--
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index ddbf56014c51..aae99a2d7bd4 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -622,7 +622,7 @@ struct fifo_buffer {
 	int total; /* sum of all values */
 	int values[0];
 };
-extern struct fifo_buffer *fifo_alloc(int fifo_size);
+extern struct fifo_buffer *fifo_alloc(unsigned int fifo_size);
 
 /* flag bits per connection */
 enum {
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index de2f94d0103a..da4a3ebe04ef 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -1575,7 +1575,8 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 	struct drbd_device *device;
 	struct disk_conf *new_disk_conf, *old_disk_conf;
 	struct fifo_buffer *old_plan = NULL, *new_plan = NULL;
-	int err, fifo_size;
+	int err;
+	unsigned int fifo_size;
 
 	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
 	if (!adm_ctx.reply_skb)
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 2b3103c30857..79e216446030 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3887,7 +3887,7 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 	struct disk_conf *old_disk_conf = NULL, *new_disk_conf = NULL;
 	const int apv = connection->agreed_pro_version;
 	struct fifo_buffer *old_plan = NULL, *new_plan = NULL;
-	int fifo_size = 0;
+	unsigned int fifo_size = 0;
 	int err;
 
 	peer_device = conn_peer_device(connection, pi->vnr);
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 5bdcc70ad589..b7f605c6e231 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -482,11 +482,11 @@ static void fifo_add_val(struct fifo_buffer *fb, int value)
 		fb->values[i] += value;
 }
 
-struct fifo_buffer *fifo_alloc(int fifo_size)
+struct fifo_buffer *fifo_alloc(unsigned int fifo_size)
 {
 	struct fifo_buffer *fb;
 
-	fb = kzalloc(sizeof(struct fifo_buffer) + sizeof(int) * fifo_size, GFP_NOIO);
+	fb = kzalloc(struct_size(fb, values, fifo_size), GFP_NOIO);
 	if (!fb)
 		return NULL;
 
-- 
2.24.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
