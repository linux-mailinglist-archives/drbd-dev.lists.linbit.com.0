Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C59E815FB
	for <lists+drbd-dev@lfdr.de>; Mon,  5 Aug 2019 11:55:56 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id F32D6101AC4B;
	Mon,  5 Aug 2019 11:55:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 0ADF8101AC42
	for <drbd-dev@lists.linbit.com>; Mon,  5 Aug 2019 11:55:49 +0200 (CEST)
Received: by mail-wr1-f68.google.com with SMTP id g17so83740787wrr.5
	for <drbd-dev@lists.linbit.com>; Mon, 05 Aug 2019 02:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=R7aN6+NJwCXetYaqe/8K24E8RkaOM2Ef6P0fvKHd1bQ=;
	b=G6XQ8pz9f6PTwpSQWP+YjiLr7T25q+KeSpDFdJj+LMfGTFKtl2c/r95DKAWH/4Nw5D
	P1CSon1Lw53mZfTkA5rs/HfBvJgG/ge5eRsQRZtFtRSk/3cmFpo0i2UxsmlpxKgTOn9L
	xsMc5Se6Na3A5nVWIDxalXYXuB2lHpHQvev7Jsi9XqKkbwmvTt3TzEbBk7MkKaUy7uG5
	3vgokJlfDqwkKj7NxGckZvGWgR/F8wraFUVXyGTN9hOjMwyfwKZ8ivTX3cebBu8bgkL2
	RvrzPGbh3m+RM3WOwcLfUpasirgTb6UaUT+nzvKlKC/NYsjRNAkhlCWB1Mg1glNBuIUQ
	wi3g==
X-Gm-Message-State: APjAAAX+O7Rg7f3Go/2Bj9iFmt8yvJNfXxsip9DFoPJeOeOWO+HzPkG0
	RQAdmjPpId/jRCseMVg7uuzTGb0EV5R1DIqS
X-Google-Smtp-Source: APXvYqyUrWh0OhwflzgrJgr1clnJ5oOxrQjlyOMqEx/6ksgjiV18bKC2soRiVEWEsbjnFETSqtfiyg==
X-Received: by 2002:a5d:6a90:: with SMTP id
	s16mr107762376wru.288.1564998948914; 
	Mon, 05 Aug 2019 02:55:48 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	h16sm97083168wrv.88.2019.08.05.02.55.48
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Aug 2019 02:55:48 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 5 Aug 2019 11:55:46 +0200
Resent-Message-ID: <20190805095546.GA17295@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 544 seconds by postgrey-1.31 at mail09;
	Fri, 02 Aug 2019 15:31:24 CEST
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id C3E3F101AC43
	for <drbd-dev@lists.linbit.com>; Fri,  2 Aug 2019 15:31:24 +0200 (CEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4FC7421871;
	Fri,  2 Aug 2019 13:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564752237;
	bh=8f7K031i4FP76JzNvmYkrd181BcKJpbw4yDnNNJNuMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iaIkmwfwEezNwS5Y9Vw1SeuZSplp5K1GwvGXCZJmF/1EHVLSgzp8UvwgYjQXc7hCS
	levBzANEE5xaA6nDq/9a7eQwfgeE6/ic8ssdH66vGxoGPwqJvVjx5wA0+NfrcnfTun
	arnQb47z2v9gzvG0FjMTMJ3bf6Gh3wSSpuw8El6o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri,  2 Aug 2019 09:22:49 -0400
Message-Id: <20190802132302.13537-29-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802132302.13537-1-sashal@kernel.org>
References: <20190802132302.13537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
	Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
	Roland Kammerer <roland.kammerer@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH AUTOSEL 4.19 29/42] drbd: dynamically allocate
	shash descriptor
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

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 77ce56e2bfaa64127ae5e23ef136c0168b818777 ]

Building with clang and KASAN, we get a warning about an overly large
stack frame on 32-bit architectures:

drivers/block/drbd/drbd_receiver.c:921:31: error: stack frame size of 1280 bytes in function 'conn_connect'
      [-Werror,-Wframe-larger-than=]

We already allocate other data dynamically in this function, so
just do the same for the shash descriptor, which makes up most of
this memory.

Link: https://lore.kernel.org/lkml/20190617132440.2721536-1-arnd@arndb.de/
Reviewed-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Roland Kammerer <roland.kammerer@linbit.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/block/drbd/drbd_receiver.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index cb919b9640660..3cdadf75c82da 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -5240,7 +5240,7 @@ static int drbd_do_auth(struct drbd_connection *connection)
 	unsigned int key_len;
 	char secret[SHARED_SECRET_MAX]; /* 64 byte */
 	unsigned int resp_size;
-	SHASH_DESC_ON_STACK(desc, connection->cram_hmac_tfm);
+	struct shash_desc *desc;
 	struct packet_info pi;
 	struct net_conf *nc;
 	int err, rv;
@@ -5253,6 +5253,13 @@ static int drbd_do_auth(struct drbd_connection *connection)
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
 	desc->flags = 0;
 
@@ -5395,7 +5402,10 @@ static int drbd_do_auth(struct drbd_connection *connection)
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
2.20.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
