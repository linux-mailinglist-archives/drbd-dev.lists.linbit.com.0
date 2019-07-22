Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id A8CFF72D48
	for <lists+drbd-dev@lfdr.de>; Wed, 24 Jul 2019 13:19:37 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id AB65B101AC4A;
	Wed, 24 Jul 2019 13:19:35 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id A3FED101AC47
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 13:19:15 +0200 (CEST)
Received: by mail-wm1-f67.google.com with SMTP id v19so41283706wmj.5
	for <drbd-dev@lists.linbit.com>; Wed, 24 Jul 2019 04:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Fv8hugCBoIx/Q3Fy16D1zd2fZY1SOamgZUucCQcurVo=;
	b=kcLBPTjTcYDcwqx2QMBCtZVsxpUoBD92GWVPt5+d04M0L61D/gnTxnGypUyqCVVx9S
	sR91OSRRjHKndL8EgZFOyIzKp0qKAcYpDLczfVycH9SYCDKXFsl2IxAZRil5tCOGOY+J
	XNjJP6HxiNQQZT2lNeO/Ll5EtD2na3rZYLdGCmSoxyHWR2bxQNsUu40jLacg4Tnpn57r
	vkrv6IJ5qZgbE3hAn5PCZwK4JkeC2Chj3h9ZDhCpBGmsERnpLuXAFTZYKYlvDrug4c3j
	7lj1tBmIS8yPFaouwz6Wq+j8dfxf6w5kce+0urDEI1mJocjsive6tIC/ONvwEO7YfPMj
	SyIg==
X-Gm-Message-State: APjAAAUxSs8Om8ZAkPpWUCw+WnnO4DuYn+S9/WeipwHqF+tLOJhb/aMz
	qvG3DfIOsftgk0LriTatcSsuf4tQq71EzQ==
X-Google-Smtp-Source: APXvYqzuCDAoZDzxNG1PZFNAIQR7AMsm4m/1Ruoec55eGjG+zaE/xKMB6w8XK0Y2k+QTH2DEsw7bvg==
X-Received: by 2002:a1c:7414:: with SMTP id p20mr71955704wmc.145.1563967154593;
	Wed, 24 Jul 2019 04:19:14 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id 2sm59237224wrn.29.2019.07.24.04.19.14
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 24 Jul 2019 04:19:14 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Wed, 24 Jul 2019 13:19:12 +0200
Resent-Message-ID: <20190724111912.GE6697@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 309 seconds by postgrey-1.31 at mail09;
	Mon, 22 Jul 2019 14:32:09 CEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id E947D101AC44
	for <drbd-dev@lists.linbit.com>; Mon, 22 Jul 2019 14:32:09 +0200 (CEST)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
	1MS3rB-1i0ppS27tD-00TS5J; Mon, 22 Jul 2019 14:26:49 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
Date: Mon, 22 Jul 2019 14:26:34 +0200
Message-Id: <20190722122647.351002-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:TUkJdt6WnOtvIKaR0C75bjyJONsAuTghX9dFPBuK/8hnMLggk3n
	oaimOoXAU2Z5zyElT/gELYVsGJyidfA2ExueKc9APQYmKTBUXBWzq5pdcaRaVmUMkwDM8eK
	3TBy71px+BMkF5WdicIU/qxkzYwfULo/cL305TewpfFFQBaqDWboMCadDAH4olBURs/jRw1
	q6sUBbFtTzs7Kvn0ZEUiw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uRraT6O9ceU=:z5emMszznvG6FZx8uVTK6W
	S+QmpATJQ0rJYdhEUI/pef2WC69geMpvecNnLorObPk27E64QzR29buABdklItGKGMPJvPzNI
	WOMmTtsOoeUWFiQdnxkH11PCzJrWVSY+40zF14EEErMjOh6vvQloRGHuVyHZNTaqP8wFlFBhI
	F51MkpMi+NmJYJOhYGhE9pYyCq+dqoGzXQlbp/3R8qGl9tGh6wePNM/lgz73iNJQk8r7XjmYq
	t8+jsCUoS/hqenZiCiqQoxUA5u1DNmtlECj3skprhjInyy8zL2IEYqptbPytSs/A6AcS0kML4
	P24LLNV4xQoRW8k336KbB3DhbXDiE9SAwa1wUSyi1CsH+WcLT235uSMAdQ//mmLobD4XugPkq
	InFwTAS8PXiFrAC7ELf/v6GissTBHFUQkusjaFvT1U55OfTMsAY5Q6sYgjx3jG5aQMvPjwNtb
	bcoGgCAcMbR1p/ZcVAphkt/EXk9KaJrGFk3xt1sd/8TbnOwbhyfW1HBNEUxuIr5eXBNzsE/XF
	Lqivm0iUSVH9j5LxvDZSkNLgJNB+RslltvwaUwbb83+keVlwDyouO6rKk3ZgllR0tN9SJTqPF
	NPPiWxhyG+Dw1NkQu0BhIdDIfujCE8fCnmVsCEbeuS85TBi2M3/4n/tBALmYiySzVMOOc+YxK
	Nr5ujL+DTHHaQXhed4WyR06dD/pbMdO33GQ9scFh82v4vyyEA+mZCLxqojHyu44qZ6hEk4hUh
	vtLdJ+Kd9BFEaI949cv7a6ufwni0cVlUnrrAGg==
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Roland Kammerer <roland.kammerer@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] [v2] drbd: dynamically allocate shash descriptor
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Building with clang and KASAN, we get a warning about an overly large
stack frame on 32-bit architectures:

drivers/block/drbd/drbd_receiver.c:921:31: error: stack frame size of 1280 bytes in function 'conn_connect'
      [-Werror,-Wframe-larger-than=]

We already allocate other data dynamically in this function, so
just do the same for the shash descriptor, which makes up most of
this memory.

Link: https://lore.kernel.org/lkml/20190617132440.2721536-1-arnd@arndb.de/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
- don't try to zero a NULL descriptor pointer,
  based on review from Roland Kammerer.
---
 drivers/block/drbd/drbd_receiver.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 90ebfcae0ce6..2b3103c30857 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -5417,7 +5417,7 @@ static int drbd_do_auth(struct drbd_connection *connection)
 	unsigned int key_len;
 	char secret[SHARED_SECRET_MAX]; /* 64 byte */
 	unsigned int resp_size;
-	SHASH_DESC_ON_STACK(desc, connection->cram_hmac_tfm);
+	struct shash_desc *desc;
 	struct packet_info pi;
 	struct net_conf *nc;
 	int err, rv;
@@ -5430,6 +5430,13 @@ static int drbd_do_auth(struct drbd_connection *connection)
 	memcpy(secret, nc->shared_secret, key_len);
 	rcu_read_unlock();
 
+	desc = kmalloc(sizeof(struct shash_desc) +
+		       crypto_shash_descsize(connection->cram_hmac_tfm),
+		       GFP_KERNEL);
+	if (!desc) {
+		rv = -1;
+		goto fail;
+	}
 	desc->tfm = connection->cram_hmac_tfm;
 
 	rv = crypto_shash_setkey(connection->cram_hmac_tfm, (u8 *)secret, key_len);
@@ -5571,7 +5578,10 @@ static int drbd_do_auth(struct drbd_connection *connection)
 	kfree(peers_ch);
 	kfree(response);
 	kfree(right_response);
-	shash_desc_zero(desc);
+	if (desc) {
+		shash_desc_zero(desc);
+		kfree(desc);
+	}
 
 	return rv;
 }
-- 
2.20.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
