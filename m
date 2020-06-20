Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 36991202068
	for <lists+drbd-dev@lfdr.de>; Sat, 20 Jun 2020 05:30:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1124B420400;
	Sat, 20 Jun 2020 05:30:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E007B4202D5
	for <drbd-dev@lists.linbit.com>; Sat, 20 Jun 2020 05:30:19 +0200 (CEST)
Received: by mail-pj1-f67.google.com with SMTP id k2so4994420pjs.2
	for <drbd-dev@lists.linbit.com>; Fri, 19 Jun 2020 20:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HyXcsVKIRYzWpBmnwJPGbhkvsengpFrT3ttylCxecK0=;
	b=Q7HTsK0JxwrRCE5gTrXMH6V7ktrH1FZWG28aENBbrpLCN5a5y1aJfpu+bsrRkW2sQp
	XhIJBGzuj1m86ch3OFQC2s0hXCylfLeJio9eW92zTzdHrrDStDztJUVyjkmLUN+wvcb0
	z3o/S8+1+G6wnqNAtk+SU1tTedQuZprUxGPmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HyXcsVKIRYzWpBmnwJPGbhkvsengpFrT3ttylCxecK0=;
	b=CH6iww3ImsJIrDr6hMD7L46pv7UvHJEbyJ/a7l03CR7EybMyJOjdPHvd2JlXYb4/41
	xhVBftKWg/d2aYd1ZEGbdGoZOr+VUnvMQMDTyVdM69zqFsnWC6UAtOX0D/T+0o/XHr9X
	5apZPfYe/ZHKROFTWhfUK/YXATFL4BnCNELCHhig2bg+EQPaCu4yI6JBjz5v2YSKQEat
	rYoGSzzpm8VwfQK+tGaTh72A2oUr5SBcD3gTETeDJ0duTba1euo65y9Kh1EN6k2xs1js
	mvjzz0hTnXX8/RoCa5CLOKQydTXZm8T+rNJvAbD5feWa9gSm6nNIWDZ54VNL2Annr85E
	I9ng==
X-Gm-Message-State: AOAM532Fan0NbxFV4k7L5KHgz/92hCTwVEJBVxxAl2xxU9f7b0Gau74W
	jN4aaFms5vkC6dtwa3qBWxllhw==
X-Google-Smtp-Source: ABdhPJxp162ffek9CJ+S9rRNhylZslyYHlf/m2Wtuw5WxNWPTSz41VLYVJnSPeycc1PuPsAzofcIoQ==
X-Received: by 2002:a17:90a:d305:: with SMTP id
	p5mr6252229pju.44.1592623818774; 
	Fri, 19 Jun 2020 20:30:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	g9sm7101346pfm.151.2020.06.19.20.30.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Jun 2020 20:30:17 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 20:29:54 -0700
Message-Id: <20200620033007.1444705-4-keescook@chromium.org>
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
	linux-clk@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH v2 03/16] drbd: Remove uninitialized_var() usage
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

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Fixes: a29728463b25 ("drbd: Backport the "events2" command")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/block/drbd/drbd_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_state.c b/drivers/block/drbd/drbd_state.c
index eeaa3b49b264..0067d328f0b5 100644
--- a/drivers/block/drbd/drbd_state.c
+++ b/drivers/block/drbd/drbd_state.c
@@ -1604,7 +1604,7 @@ static void broadcast_state_change(struct drbd_state_change *state_change)
 	unsigned int n_device, n_connection, n_peer_device, n_peer_devices;
 	void (*last_func)(struct sk_buff *, unsigned int, void *,
 			  enum drbd_notification_type) = NULL;
-	void *uninitialized_var(last_arg);
+	void *last_arg = NULL;
 
 #define HAS_CHANGED(state) ((state)[OLD] != (state)[NEW])
 #define FINAL_STATE_CHANGE(type) \
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
