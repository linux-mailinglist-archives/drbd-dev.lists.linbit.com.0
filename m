Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail09.linbit.com (mail09.linbit.com [212.69.161.110])
	by mail.lfdr.de (Postfix) with ESMTPS id A769681609
	for <lists+drbd-dev@lfdr.de>; Mon,  5 Aug 2019 11:56:52 +0200 (CEST)
Received: from mail09.linbit.com (localhost [127.0.0.1])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 8687E101AC51;
	Mon,  5 Aug 2019 11:56:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id 6B9D9101AC4C
	for <drbd-dev@lists.linbit.com>; Mon,  5 Aug 2019 11:56:05 +0200 (CEST)
Received: by mail-wr1-f66.google.com with SMTP id n9so83863890wru.0
	for <drbd-dev@lists.linbit.com>; Mon, 05 Aug 2019 02:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rex3CMTdtCHM7CAWplaJUUOU3mko7kdksIcr/Dd/9dw=;
	b=MJc09NZQKi07cN3eLI655jSsFdcBOccbvl9vH54qK3ECwcy1pCGto+ZMPIstT2Yi9D
	/nsTwCHJsfpD/DyniNq/SmcNHPr+qwbliVj8cRo0YFl1cXnKgj7FefKj543gAREWJQnF
	kF6fF8MG6unPoxGgPKRH/UNRVi95H4ogeSBSekDvXEt5LYN4OJZRBRGt4Y9KblwZY2xu
	TorQ4XvNjaB7fYDeCNNygAQ5Qchs9t2LmklZVkzBTXRX8uyLnAOecuWHJ+Hwyj2HL8MO
	YgX8RdGZVo5rALNCCP/X9fClCx7u1sco2i7irfkWIkzPPQlv6HHAHPDEOdiFmbiBUr3T
	Eglg==
X-Gm-Message-State: APjAAAWuvFJgL1Tj4vt2hiGfyVSspk28EG7WRxzvgcm+OvoXvb7abV7/
	yHnvfrcNPeha6ld9UctVwmH2Zj/d0lkfac5s
X-Google-Smtp-Source: APXvYqyi+feHl6yfCPmJRAo06+bb0WAG7JmzpuG1Me3m0EuurUgI0m8ZFZQtwzr9C5AxfqtXDfxyuQ==
X-Received: by 2002:adf:aac8:: with SMTP id i8mr1961920wrc.56.1564998964071;
	Mon, 05 Aug 2019 02:56:04 -0700 (PDT)
Received: from soda.linbit (212-186-191-219.static.upcbusiness.at.
	[212.186.191.219]) by smtp.gmail.com with ESMTPSA id
	n12sm87670962wmc.24.2019.08.05.02.56.03
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Aug 2019 02:56:03 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 5 Aug 2019 11:56:01 +0200
Resent-Message-ID: <20190805095601.GC17295@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail09.linbit.com (LINBIT Mail Daemon) with ESMTP id CD613101AC46
	for <drbd-dev@lists.linbit.com>; Fri,  2 Aug 2019 15:31:24 +0200 (CEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 565EB21852;
	Fri,  2 Aug 2019 13:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564752375;
	bh=23B8luakk6bxCcsYaOoRRvGgRBG7IONl/QGkKxDbqvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q4k1GU1DH4aJNt5ax34tXvn2EuLMi+BVwVufL7iQ6vdNu6u3k86a/mM38oAlnvHho
	F2T7capDVks/rgHeXHPUDxsYaCBq5exQCy0JteXpC+jvhTW+mMvp9UnFQNoCwca5Wb
	tUgtmF2dDh6v0m6JWXPnCBPgb4rH0ztjW1+UhJuc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri,  2 Aug 2019 09:25:39 -0400
Message-Id: <20190802132547.14517-15-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802132547.14517-1-sashal@kernel.org>
References: <20190802132547.14517-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Jens Axboe <axboe@kernel.dk>, Sasha Levin <sashal@kernel.org>,
	Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
	Roland Kammerer <roland.kammerer@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH AUTOSEL 4.9 15/22] drbd: dynamically allocate
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
index 83957a1e15ed7..8e8e4ccb128f3 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -5297,7 +5297,7 @@ static int drbd_do_auth(struct drbd_connection *connection)
 	unsigned int key_len;
 	char secret[SHARED_SECRET_MAX]; /* 64 byte */
 	unsigned int resp_size;
-	SHASH_DESC_ON_STACK(desc, connection->cram_hmac_tfm);
+	struct shash_desc *desc;
 	struct packet_info pi;
 	struct net_conf *nc;
 	int err, rv;
@@ -5310,6 +5310,13 @@ static int drbd_do_auth(struct drbd_connection *connection)
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
 
@@ -5452,7 +5459,10 @@ static int drbd_do_auth(struct drbd_connection *connection)
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
