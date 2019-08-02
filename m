Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7C4815FF
	for <lists+drbd-dev@lfdr.de>; Mon,  5 Aug 2019 11:56:23 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 3D761101AC52;
	Mon,  5 Aug 2019 11:56:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 9FE91101AC42
	for <drbd-dev@lists.linbit.com>; Mon,  5 Aug 2019 11:55:56 +0200 (CEST)
Received: by mail-wm1-f68.google.com with SMTP id w9so6283931wmd.1
	for <drbd-dev@lists.linbit.com>; Mon, 05 Aug 2019 02:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=y0sUgFK1R33xXSRCq1YwCJJ+OJIOh3pQv6fk9zvznF0=;
	b=RL9pCjV0BHjAgoW37JmNbOf3F1S6K/j5eP3itat8ewzgy5vuf13ntJJu7+0wIfeiN/
	YLBrUEo8Frr7XeVXVcSuQU2DSUpJYfR3JX61G1Pue6k/R4rkSeIw7692DpY19jyur4Uh
	262lzTmKSP7ydtOgrcDxFtx8utHKeMicS85fXUmNOqeGx+pNPcB6UrBv7RPxxZuyCveE
	4zWbUzUJOFeigSjfloVUSj+ls1Ruv5MgQWYNF3vPx59WmupD/PwRJUGbi+LJB5dLq6iM
	74UrCI5StY6+JUKr4MY/6RlyKNeuBrlBjl93Ubo/o9tcq4uE0j3a8TurkudEkBXrusIF
	Hjkw==
X-Gm-Message-State: APjAAAUKQZ2JcmtvDYFH8WqOIkEyWih7wm3Si4XCG29YbvoK9JTIkoJ1
	YS9iK7wg+EBMWXkk0R1N1xWVoAlc1HRBcIMX
X-Google-Smtp-Source: APXvYqyG2Y9kbZ7PoM6eZyMvI2CpqsLr6ZcVt850hBOP3y+RnP0n5ZvAKHJBl/hq7klfOammr+1xLA==
X-Received: by 2002:a7b:c933:: with SMTP id h19mr18620457wml.52.1564998955511; 
	Mon, 05 Aug 2019 02:55:55 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	a81sm90428194wmh.3.2019.08.05.02.55.54
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Aug 2019 02:55:55 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 5 Aug 2019 11:55:53 +0200
Resent-Message-ID: <20190805095553.GB17295@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id CC006101AC45
	for <drbd-dev@lists.linbit.com>; Fri,  2 Aug 2019 15:31:24 +0200 (CEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 597AA21773;
	Fri,  2 Aug 2019 13:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564752310;
	bh=q4d4x2lkfsO0GUeJ0SOejnd4a/QA+DlwwvcJ+8ajbZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0yLsSAG6evG1eeV6BSuSQOikvJX2HZfOmJt0e8Qj3BOUtPAgRdGNXef4Z5MRfobDn
	KRDUu1EcrUmS9Vs12paGZTQ0nfu13Mfc48LuH4jO7cMUACHfdCxDvsXHn/p46nGJrH
	c/rOoomc1shDIAUDw6vwGwQdC/IlvIBLh1v+JRyE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri,  2 Aug 2019 09:24:13 -0400
Message-Id: <20190802132422.13963-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802132422.13963-1-sashal@kernel.org>
References: <20190802132422.13963-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
	Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
	Roland Kammerer <roland.kammerer@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH AUTOSEL 4.14 21/30] drbd: dynamically allocate
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
index 1aad373da50e2..8fbdfaacc2226 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -5237,7 +5237,7 @@ static int drbd_do_auth(struct drbd_connection *connection)
 	unsigned int key_len;
 	char secret[SHARED_SECRET_MAX]; /* 64 byte */
 	unsigned int resp_size;
-	SHASH_DESC_ON_STACK(desc, connection->cram_hmac_tfm);
+	struct shash_desc *desc;
 	struct packet_info pi;
 	struct net_conf *nc;
 	int err, rv;
@@ -5250,6 +5250,13 @@ static int drbd_do_auth(struct drbd_connection *connection)
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
 
@@ -5392,7 +5399,10 @@ static int drbd_do_auth(struct drbd_connection *connection)
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
