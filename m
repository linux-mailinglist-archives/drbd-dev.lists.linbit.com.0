Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B439202101
	for <lists+drbd-dev@lfdr.de>; Sat, 20 Jun 2020 05:35:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0DA23420420;
	Sat, 20 Jun 2020 05:35:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 737CF4203DE
	for <drbd-dev@lists.linbit.com>; Sat, 20 Jun 2020 05:30:26 +0200 (CEST)
Received: by mail-pf1-f194.google.com with SMTP id d66so5376663pfd.6
	for <drbd-dev@lists.linbit.com>; Fri, 19 Jun 2020 20:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=7ExlyNd4C6Vtqo5InL4xGzXnaPAWUSdxdUBoxlRz8EM=;
	b=NXIjEZzmAlY5fdC/DwXct9GYDHogfeUCrjSkTO4JXjF9UTv+cR2dEUWt3FWlTNaAHp
	ArVHLS7GaAaX0GRdppC6MVL4iulBAnXl0RDRkmjEpohR99AIp9TcfcZKNXy8KweQ5j+M
	qKbddjlMm6r/UiOtSlPQhvc966Inhn9BIPgP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7ExlyNd4C6Vtqo5InL4xGzXnaPAWUSdxdUBoxlRz8EM=;
	b=s6ZkXhqZv/2CBRKXs9GmsZiI4rT00gtdHDPj3BnPOB81JGTbgc7QVhvJpmZ6HSuZ5z
	snowZeuvBDLJndjMir/Y52eR+WJbzNZH4ZWX9F776YNl2nWKzyuO8/Hxyviy6TFMY05R
	9EOgn+5uYVYbp/UsdyFDw83wIm+t7eTi7iXwPLwbGp9MQrbyReQ0xBauvfC/cUG1QEN+
	peNhKXkL+0uuZelKSRqUFm24Ijhn9XSna66Mv4x665yPUp3fr6X7Hn0jiqCEUYWOPOFi
	ikwtLS7aFeoWKfdAqa2p9odkjjVHOqs5pT+W5cmIALp1SNgbOzd4FgM2pMWgknVlU6wX
	g5pw==
X-Gm-Message-State: AOAM533kx9IZsfnBBcTAeIRiYcqS2cU49xAypwdqvvkQY8lrDsqv59nx
	of3NvQ8zZPlXyzvw64/PQIAIFw==
X-Google-Smtp-Source: ABdhPJyAJ8Da6kpj1cpdp7acRpdjHPEasdxnBrzutMhIZjw6K4AKJtCbSzx12+H3IHWiTttzpZGpTg==
X-Received: by 2002:a63:dd42:: with SMTP id g2mr5615212pgj.442.1592623825373; 
	Fri, 19 Jun 2020 20:30:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	n69sm7060385pjc.25.2020.06.19.20.30.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 20:30:02 -0700
Message-Id: <20200620033007.1444705-12-keescook@chromium.org>
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
Subject: [Drbd-dev] [PATCH v2 11/16] media: sur40: Remove
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
to removing[2] this[3] macro[4], just remove this variable since it was
actually unused:

drivers/input/touchscreen/sur40.c:459:6: warning: variable 'packet_id' set but not used [-Wunused-but-set-variable]
  459 |  u32 packet_id;
      |      ^~~~~~~~~

However, in keeping with the documentation desires outlined in commit
335abaea7a27 ("Input: sur40 - silence unnecessary noisy debug output"),
comment out the assignment instead of removing it.

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Fixes: 335abaea7a27 ("Input: sur40 - silence unnecessary noisy debug output")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/input/touchscreen/sur40.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/sur40.c b/drivers/input/touchscreen/sur40.c
index 34d31c7ec8ba..620cdd7d214a 100644
--- a/drivers/input/touchscreen/sur40.c
+++ b/drivers/input/touchscreen/sur40.c
@@ -456,8 +456,6 @@ static void sur40_poll(struct input_dev *input)
 {
 	struct sur40_state *sur40 = input_get_drvdata(input);
 	int result, bulk_read, need_blobs, packet_blobs, i;
-	u32 uninitialized_var(packet_id);
-
 	struct sur40_header *header = &sur40->bulk_in_buffer->header;
 	struct sur40_blob *inblob = &sur40->bulk_in_buffer->blobs[0];
 
@@ -491,7 +489,7 @@ static void sur40_poll(struct input_dev *input)
 		if (need_blobs == -1) {
 			need_blobs = le16_to_cpu(header->count);
 			dev_dbg(sur40->dev, "need %d blobs\n", need_blobs);
-			packet_id = le32_to_cpu(header->packet_id);
+			/* packet_id = le32_to_cpu(header->packet_id); */
 		}
 
 		/*
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
