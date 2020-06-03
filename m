Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BDD1ED951
	for <lists+drbd-dev@lfdr.de>; Thu,  4 Jun 2020 01:36:17 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 05542420401;
	Thu,  4 Jun 2020 01:36:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CABEC4203EF
	for <drbd-dev@lists.linbit.com>; Thu,  4 Jun 2020 01:32:20 +0200 (CEST)
Received: by mail-pj1-f67.google.com with SMTP id ga6so258138pjb.1
	for <drbd-dev@lists.linbit.com>; Wed, 03 Jun 2020 16:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/wgSseUcyTd9Drk76fcV4j2VbriV8jy/HYEGQ0NYaFk=;
	b=UstK7WLaEjDWaKH3+++ddeAXtqpiyFxQfl0O2lazw1LzLA/AjfOlogFybdXuhuVdpb
	rFJfQt4LgPRAzCjKoGukk2COBz4+5z1QncnyZ/CR0mBbgUwuOWUYwdicuZEexScuGgS/
	olVZGdjTE/8GbLwCvMROC7gFScCzYDYjU2Bl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/wgSseUcyTd9Drk76fcV4j2VbriV8jy/HYEGQ0NYaFk=;
	b=gTT4dRgMLK+C9KEh5RFJqeH7J6kZjg9DEygh3wPlU/ynYSa7WiMI0FIYQToEekTCDi
	PNKH06JIwHlu0mjKJGHK+ESo5HtOQkpLVHvegbnJsoLKki2Z6vIfuiuNOKQd/FGBrJ43
	7ufOSapfQ55/VGZMnj+qbXopeSLElACQXlqtc+BIj8cZdKTpBwOe9qBK+LSm2N+eqBbh
	izpq040IHoYv5WpXCSI0iHNhuvwFroatLbkxdbjY95PgkMzB3BnQNMfvUvCpY9WyHRbB
	NPdYuXKLYsE/K3eEME9B8ODeb3YiL3snEbLgyAIfQOo9SYZgkoXctGYWD3on6+/Rf1iZ
	gkSQ==
X-Gm-Message-State: AOAM530v2lTO2M247HMk1lBUKAj5iJmoSFkXM33yOGOkJVAtGbXhrQqR
	w1Sh1Q80htyvxcTW2Lvgftxziw==
X-Google-Smtp-Source: ABdhPJx0hlq73lYT8fOS+tXn65Ai8YEmL5/PSXJN4dJgAWJCbi3pNRJVeupDCakZZ2YluWv4rvJ6+A==
X-Received: by 2002:a17:902:b706:: with SMTP id
	d6mr2149275pls.304.1591227139667; 
	Wed, 03 Jun 2020 16:32:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	k19sm2867022pfg.153.2020.06.03.16.32.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 03 Jun 2020 16:32:16 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Wed,  3 Jun 2020 16:32:03 -0700
Message-Id: <20200603233203.1695403-11-keescook@chromium.org>
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
Subject: [Drbd-dev] [PATCH 10/10] compiler: Remove uninitialized_var() macro
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
(or can in the future), and suppresses unrelated compiler warnings
(e.g. "unused variable"). If the compiler thinks it is uninitialized,
either simply initialize the variable or make compiler changes.

As recommended[2] by[3] Linus[4], remove the macro.

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/compiler-clang.h | 2 --
 include/linux/compiler-gcc.h   | 6 ------
 tools/include/linux/compiler.h | 2 --
 tools/virtio/linux/kernel.h    | 2 --
 4 files changed, 12 deletions(-)

diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
index 790c0c6b8552..019f444b500b 100644
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@ -5,8 +5,6 @@
 
 /* Compiler specific definitions for Clang compiler */
 
-#define uninitialized_var(x) x = *(&(x))
-
 /* same as gcc, this was present in clang-2.6 so we can assume it works
  * with any version that can compile the kernel
  */
diff --git a/include/linux/compiler-gcc.h b/include/linux/compiler-gcc.h
index d7ee4c6bad48..ac3e29ae32de 100644
--- a/include/linux/compiler-gcc.h
+++ b/include/linux/compiler-gcc.h
@@ -58,12 +58,6 @@
 	(typeof(ptr)) (__ptr + (off));					\
 })
 
-/*
- * A trick to suppress uninitialized variable warning without generating any
- * code
- */
-#define uninitialized_var(x) x = x
-
 #ifdef CONFIG_RETPOLINE
 #define __noretpoline __attribute__((__indirect_branch__("keep")))
 #endif
diff --git a/tools/include/linux/compiler.h b/tools/include/linux/compiler.h
index 180f7714a5f1..29cbb73f2ae0 100644
--- a/tools/include/linux/compiler.h
+++ b/tools/include/linux/compiler.h
@@ -108,8 +108,6 @@
 # define noinline
 #endif
 
-#define uninitialized_var(x) x = *(&(x))
-
 #include <linux/types.h>
 
 /*
diff --git a/tools/virtio/linux/kernel.h b/tools/virtio/linux/kernel.h
index 6683b4a70b05..1e14ab967c11 100644
--- a/tools/virtio/linux/kernel.h
+++ b/tools/virtio/linux/kernel.h
@@ -109,8 +109,6 @@ static inline void free_page(unsigned long addr)
 	const typeof( ((type *)0)->member ) *__mptr = (ptr);	\
 	(type *)( (char *)__mptr - offsetof(type,member) );})
 
-#define uninitialized_var(x) x = x
-
 # ifndef likely
 #  define likely(x)	(__builtin_expect(!!(x), 1))
 # endif
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
