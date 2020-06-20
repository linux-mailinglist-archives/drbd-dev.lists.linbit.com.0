Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAE720207A
	for <lists+drbd-dev@lfdr.de>; Sat, 20 Jun 2020 05:31:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 36CAF4203FF;
	Sat, 20 Jun 2020 05:31:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 63CEE420317
	for <drbd-dev@lists.linbit.com>; Sat, 20 Jun 2020 05:30:20 +0200 (CEST)
Received: by mail-pj1-f68.google.com with SMTP id h95so5289284pje.4
	for <drbd-dev@lists.linbit.com>; Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YYIu82vaLERDRRVNezIsYro3B9HeZTQxC/aBbKcbPE4=;
	b=AtmMokfEBFiCVkYDMGVHGJuJS9fKp3FifwZogKQ2q6x4hzDovnsRDnERm9pIhMX5VI
	ToWY1NArXw8XqplWnXUVi18xafByHCkKQ3jNMc0A7Q42LSaPw/Owem45vKA8WDI8WLVz
	orkNoFzi4U8cu25M9SMeU7hdywlADX44zclAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YYIu82vaLERDRRVNezIsYro3B9HeZTQxC/aBbKcbPE4=;
	b=YRKNzXNHwNHt7OFtieJ89bM8IDqbahwK6RaxeexQrjIW72MG0UE50rYo7WAuJruykH
	jrEB0BJtKnqfLAzwmn5VHewQrDTQ3CESI0Np6lG6p3iuteYgp+qReYfyeyuRYiMUXvQq
	H88VZuutL7T0hQLOvnKYO9gKHvpVjvEPZpDkRFmD3WxoVshEj+8DsN3bbxAXEOXkm1In
	XR/46p1gbfdc1nMZHqUHlHzjNBV0AyxoFngmfSNJBGJp8LvZvM0K1Q7dpnVWcMXFn3DX
	dNg+lGm6ozEgiHvJFRE65R+RippDbQ9J3F2r1TYxXUvQ+zHMxNkDPLGDPFEAb61kCaNl
	vZIQ==
X-Gm-Message-State: AOAM533JsWxdCjgMAyO97uyoXuZz4+bfHXjH1cI7TOWXhI+YWsxGm6me
	9zDXyajGdLRkn74i9ozcjPOxlA==
X-Google-Smtp-Source: ABdhPJzr2vJct8/WkWUzne3Cmk1hS4+0nx/CV5ignmOUO6jPnss1JMiZ2KbcObWfeGsMcluI2vysoA==
X-Received: by 2002:a17:90a:d244:: with SMTP id
	o4mr6477083pjw.186.1592623819315; 
	Fri, 19 Jun 2020 20:30:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	u14sm7848572pfk.211.2020.06.19.20.30.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Jun 2020 20:30:17 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 20:29:55 -0700
Message-Id: <20200620033007.1444705-5-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620033007.1444705-1-keescook@chromium.org>
References: <20200620033007.1444705-1-keescook@chromium.org>
MIME-Version: 1.0
Cc: Andy Whitcroft <apw@canonical.com>, Kees Cook <keescook@chromium.org>,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	x86@kernel.org, linux-wireless@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	clang-built-linux@googlegroups.com, linux-mm@kvack.org,
	Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, linux-ide@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 04/16] b43: Remove uninitialized_var() usage
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
to removing[2] this[3] macro[4], just initialize this variable to NULL.
No later NULL deref is possible due to the early returns outside of the
(phy->rev >= 7 && phy->rev < 19) case, which explicitly tests for NULL.

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Fixes: 58619b14d106 ("b43: move under broadcom vendor directory")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/broadcom/b43/phy_n.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/b43/phy_n.c b/drivers/net/wireless/broadcom/b43/phy_n.c
index c33b4235839d..46db91846007 100644
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
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
