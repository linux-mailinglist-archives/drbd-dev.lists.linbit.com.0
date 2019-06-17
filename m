Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2548539
	for <lists+drbd-dev@lfdr.de>; Mon, 17 Jun 2019 16:23:36 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id D25B71028A76;
	Mon, 17 Jun 2019 16:23:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id B842E1011BF7
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2019 16:23:33 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id d18so10196381wrs.5
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2019 07:23:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=gaTGRdDB0thDW3Ct1CDs280PA/dC7vaN+4NGn3khl1o=;
	b=Mc6sWwaeH2U+HLW9c5BKdSLIH/67aBEHrpzNR5eX5I+ZkppO3TvBa2YgOusvAIZBl/
	YHwfk4z4Z5stTeGEW8eom1Z07BtS923Th/7vMcxOPyg8efAgTVrTyrbZAhBomvoHJQux
	oKTRkOCspy/2xiC8zH7KsoiH1VhFe6NA5IANiTmwzy/Suvdb3bpq06VsNeuDKLAMSoMa
	mgWFNkEhQfpJ7vjHvqxnglGQ0mNjvJ9Z1+lUkk17K1MOrn7PjPn3rs8+KgBVNg/qn1Iu
	kPl3jXYNIOmwBpBIw4gCG7ze7XyXE964v6N8wXOrqJOEaNd0GvsPAkacL9L5ZIbMYwE/
	ZdTw==
X-Gm-Message-State: APjAAAVBOl2jeBdEEsZVPyKwEpy41vYqA98hYcbGcG3SlYwCEaXziLZn
	C/edcUX+qxjpjkHe79Ej/7+a5MCYtvQV2w==
X-Google-Smtp-Source: APXvYqy5/J+gflJWLwkdv4eGp8vUMy8je4sbGiHGkSA49MNxqEg/KV9uWqZsof7ams+LxXUqoyQdXw==
X-Received: by 2002:a5d:540e:: with SMTP id g14mr1124755wrv.346.1560781412847; 
	Mon, 17 Jun 2019 07:23:32 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219])
	by smtp.gmail.com with ESMTPSA id 72sm4470284wrk.22.2019.06.17.07.23.32
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 17 Jun 2019 07:23:32 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 17 Jun 2019 16:23:30 +0200
Resent-Message-ID: <20190617142330.GF30528@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 314 seconds by postgrey-1.31 at mail09;
	Mon, 17 Jun 2019 15:30:19 CEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 26A251011BF7
	for <drbd-dev@lists.linbit.com>; Mon, 17 Jun 2019 15:30:19 +0200 (CEST)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
	(mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
	1MXXZf-1i81xr1oqd-00YxKf; Mon, 17 Jun 2019 15:24:44 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>
Date: Mon, 17 Jun 2019 15:24:13 +0200
Message-Id: <20190617132440.2721536-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:yiXEMLOB97u6ow4J7zGkKBjm/BFhumDE+NdcmaYm9WjfiCT/Cmn
	V/NLe0vmPNWXTdWF+BBYfUAJvJWRlM85gl+YQSPREoTkGVG39VyhcFa9g3lyJluG+07I775
	AXtdbkBvHkHTTl1uCy+pvzXhZzO6TmBcczsVNfxvFbO6tNJbIYOMsjyNsSRKdCTx99cap6Z
	ltLjUJek80sb/m+Ef1nZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:x7eaEfgzVCU=:DSy6Ywtp3cMXEvvCGDo7ej
	jLHXb0jW59b0iiXKESZJPWmmT9x2YXhHZbbG4veuyWYsq1Y9a3+IYcobCesE6+8ILPAJmAUCc
	JjLkgDH/TUHKwXrbO8XtQiuOnKtacTUniycBvESHvngMMdqq4B2mKh2tU1B5opooi2Z/eHlIJ
	FIAFvvvrf6+/P6TT4ZEe/NkrEEU7UvNvE15WgMl/CyCTXFNHvJng7eJA0tnZomwgRI3ncm2MA
	B4TyuUdwvcBeVI9naEphhXeD36j9MhFO/wYNpKpbf0P3anZz3yu/S1su49WDPsbsL2cI8PBXT
	++LkMQ/XU/OtaB1T1v9bbzWlW0KWdVy+Gv9KSr7KHlrIfv1747jQkYCh9FMEeqmM7HItE2nwc
	cN3ww246yepJ2D6SqfumRZch1FFzS7/5o9MNN5kZeLgJgIJRiYSitag7kulpMig1cEwokfEl1
	kSWxXaYnoLgIbH8xnXPIL5C4B8zDcCNTKXnVxBYRdHEOsNhr6p1XPgErwJhwSVNb1XBE76KlW
	VfFWJysjlF68GCVqPUiOjSo0PdEQ4DILHLRP1Iprc0u/RxwXe4RPeXJnA4M12CgnL1RxP6xzY
	QnQC9UYjCcnr2qrJZRJWVgS/J67YecG6CEz1ouiM7hEtIqxTwgSzQlZl6Jf/+KjkqjCpe6f9K
	XYmuLFRnKnguG4C6RZdBMCnlTRLFrEdnWqH8zT0n9cXVgjHr4T5fcKsZv0JjuxI7C2TxJZ+is
	7HLgxDbEUAqwLzD3uMm0mxZHR45PlsLFmO+iMA==
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	Eric Biggers <ebiggers@google.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Roland Kammerer <roland.kammerer@linbit.com>, drbd-dev@lists.linbit.com,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [Drbd-dev] [PATCH] drbd: dynamically allocate shash descriptor
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

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/block/drbd/drbd_receiver.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 90ebfcae0ce6..10fb26e862d7 100644
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
+			crypto_shash_descsize(connection->cram_hmac_tfm),
+		       GFP_KERNEL);
+	if (!desc) {
+		rv = -1;
+		goto fail;
+	}
 	desc->tfm = connection->cram_hmac_tfm;
 
 	rv = crypto_shash_setkey(connection->cram_hmac_tfm, (u8 *)secret, key_len);
@@ -5572,6 +5579,7 @@ static int drbd_do_auth(struct drbd_connection *connection)
 	kfree(response);
 	kfree(right_response);
 	shash_desc_zero(desc);
+	kfree(desc);
 
 	return rv;
 }
-- 
2.20.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
