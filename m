Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 1594C8161A
	for <lists+drbd-dev@lfdr.de>; Mon,  5 Aug 2019 11:57:24 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id D36AC101AC53;
	Mon,  5 Aug 2019 11:57:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 52708101AC4D
	for <drbd-dev@lists.linbit.com>; Mon,  5 Aug 2019 11:56:11 +0200 (CEST)
Received: by mail-wm1-f66.google.com with SMTP id u25so62011046wmc.4
	for <drbd-dev@lists.linbit.com>; Mon, 05 Aug 2019 02:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QCn0pYfx2gcE3PSiquCpMeG6kIwsrA4F+feP+hB9VVM=;
	b=ScuNSgyotzbtzThgqs+KPAhM1c2kNWtphRwDBS3MY/xeo0JQ2BZOF38/C3QIl6nATm
	PWtQf2lmoPg68Fh8C5WaEsOWLeBHFRvVCxGdXJUzL6g8ignrOlH2QcOr7P6+gay5O6D2
	ZFgNw/OI2l3SUsAZqdprc6B/eDSWRyvlzZ+3K7W1kPxDez1KN/DLEM2mmY8vHrFmRsth
	8SGlH8HP0T9Ae1ToylLM375Z91XviI0r46miSteOgsCHvvSHZ76CeD1iPGotLNefimF/
	ZLBQHzkQT5actAZABAIKGVOT7oEIm7pUcxKLazAjFBbq7OBzaDywMZQHBR3opePMtazH
	1Eqw==
X-Gm-Message-State: APjAAAVnT+Lz1KalUd6Br2DU1ns1OCwgTUIjuRz8hz16wL9BmypFE6ka
	ZXABzJi5CQ+h8/M09PTZWpo4V/eEiJg0i7v2
X-Google-Smtp-Source: APXvYqw5DtOdNA9VUFQUjDCe7xE1N04K8EKFfWqmZ79ErzLr4rby4C82Tr0IBBQJ+pPkw9JKK5CACw==
X-Received: by 2002:a1c:6641:: with SMTP id a62mr17267219wmc.175.1564998971118;
	Mon, 05 Aug 2019 02:56:11 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	b15sm102236260wrt.77.2019.08.05.02.56.10
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Aug 2019 02:56:10 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 5 Aug 2019 11:56:09 +0200
Resent-Message-ID: <20190805095609.GD17295@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id CEB2F101AC47
	for <drbd-dev@lists.linbit.com>; Fri,  2 Aug 2019 15:31:24 +0200 (CEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 12EBB2173E;
	Fri,  2 Aug 2019 13:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564752139;
	bh=yPrQMS+7RMJW6ZvOmMUVj0WXisOzt31m6mEW5a5WZSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wKg9xc9zlePV3tunDNGhedoyKebzshNPOwg9ZZinIJ3HEvK4f6682t+X5hc8/XVau
	DGHo9J90IGx8mAW6ZHwETB8Sm2grkaQk0uESNsOKeBOI3vmPIOD7hc41LWtk85WtLd
	Ub6GW7VsmhkWbps1FketUeJ8ZaWMDb/F640+wmuA=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri,  2 Aug 2019 09:19:31 -0400
Message-Id: <20190802131951.11600-57-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
	Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
	Roland Kammerer <roland.kammerer@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH AUTOSEL 5.2 57/76] drbd: dynamically allocate
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
index 90ebfcae0ce6e..2b3103c308573 100644
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
2.20.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
http://lists.linbit.com/mailman/listinfo/drbd-dev
