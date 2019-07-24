Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D14872D4A
	for <lists+drbd-dev@lfdr.de>; Wed, 24 Jul 2019 13:20:07 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id E404D101AC4E;
	Wed, 24 Jul 2019 13:20:05 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id E8310101AC47
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 13:19:43 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id c2so43332551wrm.8
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 04:19:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id;
	bh=IQLyRnhX1U98uZ5/RlUPme0HMor/hCDsDY8BvZ+8wGg=;
	b=TiRaJCF1MfmLuoZqDTqLk1fMZuIT0PxN+gN9cV6nKe5EYpN2c94Xufx5s29OVZjRJo
	NVd8MhjwOkBrja7mYR+96m3SYY5BpT0aRyw0Q4+go8hahZFCIY1dgsJ/Xv9ngkrFD3AB
	c/uJhrg18o4JuOFA0g2CjCZNJCll5mgQ1TNFDgwQQS1hQVaQEXyW3gZKxvQaTwjUHElQ
	ITmbRZE2E7eL6wCVib6ky8jg6lN8ScDialCiXth6sdXK+dfPuxWGAPdC9GsE2TzmJzwY
	TWT0p7WnPi8QKX0cJg0Q4ECsIQkCoFrD4Jfb6U4/bJlg4qSus2yYLTslikHIiCFw0fZ7
	13IQ==
X-Gm-Message-State: APjAAAX0nKWryTiQocxw/Z+RoIWXfWfmtsYwKeshLoSlLqqdLrbfMeP8
	sXLiXWzm0URKuemM7dC7qsZ2t0yBrTTskw==
X-Google-Smtp-Source: APXvYqw9gYk+ey2n1WgESzq0fqvol7ppjFaPIrByDkRCDYBWh5nX8RUiYrtJNWS6gdMbM8LyU0nO0A==
X-Received: by 2002:adf:ff84:: with SMTP id j4mr7912319wrr.71.1563967183257;
	Wed, 24 Jul 2019 04:19:43 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	h16sm46109183wrv.88.2019.07.24.04.19.42
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Jul 2019 04:19:43 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Wed, 24 Jul 2019 13:19:41 +0200
Resent-Message-ID: <20190724111941.GF6697@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 382 seconds by postgrey-1.31 at mail09;
	Wed, 24 Jul 2019 05:55:46 CEST
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 950EB101AC44
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 05:55:45 +0200 (CEST)
Received: by mail-pg1-f195.google.com with SMTP id f20so11240321pgj.0
	for <drbd-dev@lists.linbit.com>; Tue, 23 Jul 2019 20:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=IQLyRnhX1U98uZ5/RlUPme0HMor/hCDsDY8BvZ+8wGg=;
	b=a96Fshk/MwVVdB7NTmT4qZmZCuO8Xnost8WdcmjbpP9gHxAdpF98Ipx0xQu5jIjJfv
	f+gLkd1Kc8DPyCaq9E6PV4aqzK+EiVhwpaUyLUq5/c6NsaXP89+pdCL7u+viIM52Lfih
	uIa1UpOUc3PSnxqg1PKEvJRxokGT1YpgoCYCHtqPfB+NAdgtXMK5tud/u/rZ3bAeUq1S
	VEAB2W3bpmCPHYFFGRwynJdB9a0s40Eh+MX+Eb0YCdUNBDQSvJn3wUMTOI3mV2A09JyH
	PBtUpi0TooicuDLdNR5wbOUapVFpYVgcqRcZaujgUVysqrFv+ZJgQT6UFxjIXoLm+w4P
	RB8A==
X-Received: by 2002:a62:38c6:: with SMTP id f189mr9125668pfa.157.1563940163555;
	Tue, 23 Jul 2019 20:49:23 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([2402:f000:4:72:808::3ca])
	by smtp.gmail.com with ESMTPSA id
	v10sm45113413pfe.163.2019.07.23.20.49.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jul 2019 20:49:23 -0700 (PDT)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
To: philipp.reisner@linbit.com,
	lars.ellenberg@linbit.com,
	axboe@kernel.dk
Date: Wed, 24 Jul 2019 11:49:16 +0800
Message-Id: <20190724034916.28703-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.0
Cc: linux-block@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 1/2] block: drbd: Fix a possible null-pointer
	dereference in receive_protocol()
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <http://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <http://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

In receive_protocol(), when crypto_alloc_shash() on line 3754 fails,
peer_integrity_tfm is NULL, and error handling code is executed.
In this code, crypto_free_shash() is called with NULL, which can cause a
null-pointer dereference, because:
crypto_free_shash(NULL)
    crypto_ahash_tfm(NULL)
        "return &NULL->base"

To fix this bug, peer_integrity_tfm is checked before calling
crypto_free_shash().

This bug is found by a static analysis tool STCheck written by us.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/block/drbd/drbd_receiver.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 90ebfcae0ce6..a4df2b8291f6 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3807,7 +3807,8 @@ static int receive_protocol(struct drbd_connection *connection, struct packet_in
 disconnect_rcu_unlock:
 	rcu_read_unlock();
 disconnect:
-	crypto_free_shash(peer_integrity_tfm);
+	if (peer_integrity_tfm)
+		crypto_free_shash(peer_integrity_tfm);
 	kfree(int_dig_in);
 	kfree(int_dig_vv);
 	conn_request_state(connection, NS(conn, C_DISCONNECTING), CS_HARD);
-- 
2.17.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
