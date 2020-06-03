Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A19B1ED94C
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jun 2020 01:34:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 30F084203F9;
	Thu,  4 Jun 2020 01:34:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8D10C4203E7
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 01:32:17 +0200 (CEST)
Received: by mail-pg1-f195.google.com with SMTP id o8so2656010pgm.7
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jun 2020 16:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=z79mte9tXyXKJqcwg2to640Wx2Eg5qdbPrxISPqquNw=;
	b=oLglV2NFfWcYacYEWd+TtydM20VTgwWe1gq21Fthy+SgsdpnjxFQ4Ga6u1Qy8QOuhq
	1+c/7ALdx0vchA5G8glRAPu5IZRrjlpO6MXFnSd1l4xnQge821R1YpyaThNWtUXXRQkZ
	BdWautw1YEzJ6ceFFpGiknqeHem+S3a8xUfFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z79mte9tXyXKJqcwg2to640Wx2Eg5qdbPrxISPqquNw=;
	b=LC1thNr9N+7KOCoSFflDNcXDWVH2UQztbdcr+Iicjmk1ikFS/vHYHyU+o1mU4tcT0r
	X7iq6wdZmmMA98CWjlezUdE4WeKvnJXIQaZ/8K2isC+++deTs+rpAcjiSpkCd750vuD7
	rM+TsfeKlZMQEvt0z17KBOabtXc2gb+X4Av3UaNxa6E0CZL7UtMUYj72eslGwZO7NPMO
	I1v++vHsoP0jgA7k4PUBcJQ9m8/zZH0ppaxFF4WoQjEVRwGrZGon4NjXUl2lXmnJkB5v
	9L8tjnH/P5o81/6decSWKMFiArKKkLUFDzrQxia4KigrqGMZa3pmsfNrBuEWVf9lylJs
	jJYA==
X-Gm-Message-State: AOAM531U9M1pUDjfvnyNcPhlCQB7X+XCp+0ETbG3Q0LZTth7xgwWj09o
	qJAvs/bDO7OPmBIzY1SJHy//rQ==
X-Google-Smtp-Source: ABdhPJzEnF0voBtIhVxbXIY3ed6bQ+lYw39TPSGZER6ztQVM7GNLumS6Ixq11iEOXvbkyysEKAiNmA==
X-Received: by 2002:aa7:9a93:: with SMTP id w19mr1488633pfi.155.1591227136432; 
	Wed, 03 Jun 2020 16:32:16 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id j8sm3442213pjw.11.2020.06.03.16.32.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 Jun 2020 16:32:12 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed,  3 Jun 2020 16:31:56 -0700
Message-Id: <20200603233203.1695403-4-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603233203.1695403-1-keescook@chromium.org>
References: <20200603233203.1695403-1-keescook@chromium.org>
MIME-Version: 1.0
Cc: Andy Whitcroft <apw@canonical.com>, Kees Cook <keescook@chromium.org>,
	linux-ide@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	linux-mm@kvack.org, Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, clang-built-linux@googlegroups.com,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 03/10] b43: Remove uninitialized_var() usage
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

Using uninitialized_var() is dangerous as it papers over real bugs[1]
(or can in the future), and suppresses unrelated compiler warnings (e.g.
"unused variable"). If the compiler thinks it is uninitialized, either
simply initialize the variable or make compiler changes. As a precursor
to removing[2] this[3] macro[4], just initialize this variable to NULL,
and make the (unreachable!) code do a conditional test.

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index d3c001fa8eb4..88cdcea10d61 100644
--- a/drivers/net/wireless/broadcom/b43/phy_n.c
+++ b/drivers/net/wireless/broadcom/b43/phy_n.c
@@ -4222,7 +4222,7 @@ static void b43_nphy_tx_gain_table_upload(struct b43_wldev *dev)
 	u32 rfpwr_offset;
 	u8 pga_gain, pad_gain;
 	int i;
-	const s16 *uninitialized_var(rf_pwr_offset_table);
+	const s16 *rf_pwr_offset_table = NULL;
 
 	table = b43_nphy_get_tx_gain_table(dev);
 	if (!table)
@@ -4256,9 +4256,13 @@ static void b43_nphy_tx_gain_table_upload(struct b43_wldev *dev)
 			pga_gain = (table[i] >> 24) & 0xf;
 			pad_gain = (table[i] >> 19) & 0x1f;
 			if (b43_current_band(dev->wl) == NL80211_BAND_2GHZ)
-				rfpwr_offset = rf_pwr_offset_table[pad_gain];
+				rfpwr_offset = rf_pwr_offset_table
+						? rf_pwr_offset_table[pad_gain]
+						: 0;
 			else
-				rfpwr_offset = rf_pwr_offset_table[pga_gain];
+				rfpwr_offset = rf_pwr_offset_table
+						? rf_pwr_offset_table[pga_gain]
+						: 0;
 		} else {
 			pga_gain = (table[i] >> 24) & 0xF;
 			if (b43_current_band(dev->wl) == NL80211_BAND_2GHZ)
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
