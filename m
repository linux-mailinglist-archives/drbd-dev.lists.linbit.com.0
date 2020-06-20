Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 028902020AA
	for <lists+drbd-dev@lfdr.de>; Sat, 20 Jun 2020 05:32:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DC3D042040B;
	Sat, 20 Jun 2020 05:32:50 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DFD124203EB
	for <drbd-dev@lists.linbit.com>; Sat, 20 Jun 2020 05:30:22 +0200 (CEST)
Received: by mail-pg1-f195.google.com with SMTP id e18so5396647pgn.7
	for <drbd-dev@lists.linbit.com>; Fri, 19 Jun 2020 20:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=z7EOwykxg6pvaBNDuOu+42kuk7rsiOpCvhCBE52K1bI=;
	b=GrC+IOZrySdlLEK4pF+BAlmewCfLoCyliKgUjuk/ydT85FlEL5FqnBzvvOnr57wPjD
	+d4BDwGj8Yh36sEtqrgsaBveizDU+DBCtSr8QhxGsnrQavIJDCOrsXigZzkhdt7/OpSS
	XRgdiyXdiRjqSnqowhnYgzQBDhHhT2C1CEEkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z7EOwykxg6pvaBNDuOu+42kuk7rsiOpCvhCBE52K1bI=;
	b=bjVAPQXFQlqQO4FBGnBD20vtohyMBHLiGG3kQFMnoB2qqTq1mrFMQ84UvgJDLfVkqc
	sqBN8DyE6xoQXWLafDM9Lnti51opOmB8Lf3XaxO2lX4XYLJELW8bPOv6EVkTg0ITnIyb
	mLNvn1M+WFH3e9IMZO2oQUdbX/OUFSn6govh1gbLLf5Qd/S0ciup1od5QbV/5vrNXZHZ
	5wcqkQfkj+u9m4xbK7CSpEejHH5qV/m+ueJHEIOpUCphDRUoWH6yJqCIgyd3tWsew8CX
	6T5BhS4nowG5Js3wSpItPhROFPOWodJjP4c4cyvmrWu1sX7MUG8evy0nMtpHRNNi2UI6
	3C8Q==
X-Gm-Message-State: AOAM530bnnosp92vP9I8Jy9PAPMk8xY9IY2jzuhXhJhSBmWptPANimmD
	/mptC/voS+/ZUNGp/EgvRE9EdA==
X-Google-Smtp-Source: ABdhPJxUwYihv19naIWd90YPWGy74MBa6LZXytAE9iB2nTpTiFceu0QVc6N3h97/9su8g55CPqhYHw==
X-Received: by 2002:a63:5a60:: with SMTP id k32mr5268010pgm.73.1592623821607; 
	Fri, 19 Jun 2020 20:30:21 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	g17sm6301749pju.11.2020.06.19.20.30.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 20:29:56 -0700
Message-Id: <20200620033007.1444705-6-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200620033007.1444705-1-keescook@chromium.org>
References: <20200620033007.1444705-1-keescook@chromium.org>
MIME-Version: 1.0
Cc: Andy Whitcroft <apw@canonical.com>, linux-wireless@vger.kernel.org,
	Kees Cook <keescook@chromium.org>, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, x86@kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-spi@vger.kernel.org, linux-block@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	clang-built-linux@googlegroups.com, linux-mm@kvack.org,
	Alexander Potapenko <glider@google.com>,
	b43-dev@lists.infradead.org, linux-ide@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-clk@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 05/16] rtlwifi: rtl8192cu: Remove
	uninitialized_var() usage
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
and avoid sending garbage by returning.

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Fixes: dc0313f46664 ("rtlwifi: rtl8192cu: Add routine hw")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Acked-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
index f070f25bb735..5b071b70bc08 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192cu/hw.c
@@ -592,7 +592,7 @@ static void _rtl92cu_init_chipn_one_out_ep_priority(struct ieee80211_hw *hw,
 						    bool wmm_enable,
 						    u8 queue_sel)
 {
-	u16 uninitialized_var(value);
+	u16 value;
 
 	switch (queue_sel) {
 	case TX_SELE_HQ:
@@ -606,7 +606,7 @@ static void _rtl92cu_init_chipn_one_out_ep_priority(struct ieee80211_hw *hw,
 		break;
 	default:
 		WARN_ON(1); /* Shall not reach here! */
-		break;
+		return;
 	}
 	_rtl92c_init_chipn_reg_priority(hw, value, value, value, value,
 					value, value);
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
