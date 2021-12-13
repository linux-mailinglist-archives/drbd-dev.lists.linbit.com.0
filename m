Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E5C47377D
	for <lists+drbd-dev@lfdr.de>; Mon, 13 Dec 2021 23:33:43 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 81FA14205F7;
	Mon, 13 Dec 2021 23:33:42 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 70FC6420367
	for <drbd-dev@lists.linbit.com>; Mon, 13 Dec 2021 23:33:41 +0100 (CET)
Received: by mail-pl1-f169.google.com with SMTP id m24so12190772pls.10
	for <drbd-dev@lists.linbit.com>; Mon, 13 Dec 2021 14:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JBrnYBdN57EoO3+g1W9Yge7xcXyekmtEM1h0EZo2kY8=;
	b=eARJjq7XJszaMczlFn5jgZvZcSDXQXUrOCZYsx809qFqbE5oot7LUTLpKsKwE3rPC5
	xtzFlR0r+1O5x6ORmle5Z1ZPwLkmR3mPBRDEcc0tbYNiOUNZY+k44IADAdzMVeDtWesq
	WXdfYLSyn3KpUkOB70V/sqzVf12W5IOAIj8cY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JBrnYBdN57EoO3+g1W9Yge7xcXyekmtEM1h0EZo2kY8=;
	b=lNB/T+s64aVAik5uweLv1nN3lzqvuT4ukeC6dKFYpj7OCUA9b2sf1KyS3nPBRM7xIR
	A7p+3ixmIq8yBk6snxc5dQ2srmpyTchMLVUpm0VakHWyDu0UC2U38RY+mwL9PPDAIJLB
	0UYboNR/vDIIH6/mMYVxxeoyynfPaqAgfvnXLDCM/dYyk673zg+NQas5+8sQfB27eL1P
	uYS0uYePof0kKWckcK7Dma4puvo5NNPW+YFv3GVdjDYkCag+ZB8yOGQpwzb+bU5h8z3U
	K2B39XN4T+RYADswCj2BXBD4W2TvZm9fZ7o1iXIAMqK5Pbs9jMGvBbhsKQySTSN560qL
	H6mA==
X-Gm-Message-State: AOAM5302K42x66Gqo+RfK1I0hfQVYbvz+XL1n2WvYLyJn0DoWDbW7NZ3
	QDQ59UVz/kTSXy0V5MRex+1ZuA==
X-Google-Smtp-Source: ABdhPJxe6o4hOFNGN6tkza4eHukpb5VYQzgGFvNJG64zJBWEIjooblWbxwzQ9Y8VbxpS6IcLW+ABAw==
X-Received: by 2002:a17:90b:3a85:: with SMTP id
	om5mr1179078pjb.108.1639434820151; 
	Mon, 13 Dec 2021 14:33:40 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id k5sm7007688pgm.94.2021.12.13.14.33.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Dec 2021 14:33:37 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: linux-hardening@vger.kernel.org
Date: Mon, 13 Dec 2021 14:33:24 -0800
Message-Id: <20211213223331.135412-11-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211213223331.135412-1-keescook@chromium.org>
References: <20211213223331.135412-1-keescook@chromium.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2581; h=from:subject;
	bh=t2kEV0qyDDwEqGOOcKtmt4HKQwDSfEhGz4Ec2s2rQhk=;
	b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBht8o5ttmUrgv272ZEuKN3uNPCU+YVuXyy31dW6tyg
	6v3qUZSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYbfKOQAKCRCJcvTf3G3AJtsdEA
	CuG2SKVJaoKduvJ0fedusEp7JCfmREAhrfqmgjlsmxKbBlTuRSOlqMu5m+sn5NqqrYHdYdUzOJLjMj
	zIfASffWaGBS5406hCj75rRaABBwIyS6NZ/GawLEDPs6JJkurBCFoj1rqutTzXEkSgXWVcCwMvLELj
	ZOGASNONISKukk+wV4kuBgPqorR9mu58RyTouYjQJQUgcuUYL7roCJpOSekAjj5tc3TKqHSLW06ubP
	63u2PshlQkvbxCG9rplXwxhFyBVNjNe1gk49r/TPN40XINzpHd/kMCRF5JTGkIsgadjWnTESMGwjmI
	e3oNjiIkpi27eT9i404SF/5HfIc+A6PJla/3OrUFVD4IDqu7L71l4zwMD+71OTmzI7SrSiLEcbiTRM
	eJr+uJce4HIrM/kwfBlSpep/hGUE41gfxquEBmaY7ExgofG5d7HmH45LtJhE5F9NfnxKyA4jnOiKU/
	E3gV7dOcdG7UKphzp5kriupm1sABfzJZ/y+3+AbkgrZCyzmJ9JhkAJqXtZY+sex6nLMzZiMtfjJ1p2
	P2MdtC5n17ycfxD2Tgo9/oGi92W5ecMFrJIyFoFFt86F+MNLZAMAfmfh3v9PoZWOEFMPx0YliQiNqC
	otRg0xK33NjN0aQiVHTn+/WQuGIAS34i2tZst0z8HKkYBZEYvHYfh2Z4dIxg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
	fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Cc: Jens Axboe <axboe@kernel.dk>, Kees Cook <keescook@chromium.org>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 10/17] drbd: Use struct_group() to zero algs
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

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add a struct_group() for the algs so that memset() can correctly reason
about the size. "objdump -d" shows no changes to the executable
instructions.

Cc: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linbit.com
Cc: linux-block@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/block/drbd/drbd_main.c     | 3 ++-
 drivers/block/drbd/drbd_protocol.h | 6 ++++--
 drivers/block/drbd/drbd_receiver.c | 3 ++-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 07b3c6093e7d..6f450816c4fa 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -729,7 +729,8 @@ int drbd_send_sync_param(struct drbd_peer_device *peer_device)
 	cmd = apv >= 89 ? P_SYNC_PARAM89 : P_SYNC_PARAM;
 
 	/* initialize verify_alg and csums_alg */
-	memset(p->verify_alg, 0, 2 * SHARED_SECRET_MAX);
+	BUILD_BUG_ON(sizeof(p->algs) != 2 * SHARED_SECRET_MAX);
+	memset(&p->algs, 0, sizeof(p->algs));
 
 	if (get_ldev(peer_device->device)) {
 		dc = rcu_dereference(peer_device->device->ldev->disk_conf);
diff --git a/drivers/block/drbd/drbd_protocol.h b/drivers/block/drbd/drbd_protocol.h
index dea59c92ecc1..a882b65ab5d2 100644
--- a/drivers/block/drbd/drbd_protocol.h
+++ b/drivers/block/drbd/drbd_protocol.h
@@ -283,8 +283,10 @@ struct p_rs_param_89 {
 
 struct p_rs_param_95 {
 	u32 resync_rate;
-	char verify_alg[SHARED_SECRET_MAX];
-	char csums_alg[SHARED_SECRET_MAX];
+	struct_group(algs,
+		char verify_alg[SHARED_SECRET_MAX];
+		char csums_alg[SHARED_SECRET_MAX];
+	);
 	u32 c_plan_ahead;
 	u32 c_delay_target;
 	u32 c_fill_target;
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 1f740e42e457..6df2539e215b 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3921,7 +3921,8 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 
 	/* initialize verify_alg and csums_alg */
 	p = pi->data;
-	memset(p->verify_alg, 0, 2 * SHARED_SECRET_MAX);
+	BUILD_BUG_ON(sizeof(p->algs) != 2 * SHARED_SECRET_MAX);
+	memset(&p->algs, 0, sizeof(p->algs));
 
 	err = drbd_recv_all(peer_device->connection, p, header_size);
 	if (err)
-- 
2.30.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
