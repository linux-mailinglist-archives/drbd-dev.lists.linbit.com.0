Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE72020D6
	for <lists+drbd-dev@lfdr.de>; Sat, 20 Jun 2020 05:33:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BDF642040E;
	Sat, 20 Jun 2020 05:33:20 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4CCBA4203EF
	for <drbd-dev@lists.linbit.com>; Sat, 20 Jun 2020 05:30:22 +0200 (CEST)
Received: by mail-pf1-f195.google.com with SMTP id h185so5385091pfg.2
	for <drbd-dev@lists.linbit.com>; Fri, 19 Jun 2020 20:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=IA+yT7PCs96a2QLkRTxqRX0+cmxfGmmmnF6nm+mE/f4=;
	b=MqimT0fbxuqxM+QmcrwARR+/amwNiuCI+hP1wCfX1g7kgv7NJcSBiwI/l7uGyvqsK2
	Oxc/+t3p4QpbDzYvQgitVypdVq8W23fO1zrrGQ69Qr0YZljTlWhw1Ev4MY87zvbvDu1N
	bh/IFvhDf4w/OsdEMgGvGYEdX6xS6wWHv8oxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IA+yT7PCs96a2QLkRTxqRX0+cmxfGmmmnF6nm+mE/f4=;
	b=HyBKCPPpokuadZPuiF9HFJfgSJESdCGpCSjUrLs0eQeavKjvRcl2inQ/6Z0WeoyFpb
	m09h2X3WVCGCXEDW/bgwltDyLJ/Uv313QZ9I2xU8DtKlUogUcuDKMkhQdDIcJvGnktoV
	Cs8FkNsFSdNcu/8TJIRA6Kgoc2ZJ0XLMtMUAFhV8kN9HBdBOAGyMCUjYgpyZWHSfMqtG
	ToKWtSeUJwv+5z+3PsWvEFbBgaZ1Kam5xjJz9D/UwmZdm0tV3ciBsmDT3BEVAAiiCDoQ
	qJWAomKZ1XoNDSdRJeZYDqNE1sIw0sJTYZ7ymHjwGHQKEuHat3bnCVhgTFDDnhnd6Wod
	sofA==
X-Gm-Message-State: AOAM5328o2CTVycemk1hXy0j5FG6f2LgcvQ+yCtZBzRAehc2ClIj1OpX
	Whbn/LGn5TMEoe9lV21FR8P6Tw==
X-Google-Smtp-Source: ABdhPJzWXmNsQYGlo/XoAt7rJ3XMQnqVn/2emw/g557qtVZoXAJYxangSZ/rdwKB6suIvTYXAUcnDQ==
X-Received: by 2002:a65:5645:: with SMTP id m5mr5147418pgs.434.1592623822112; 
	Fri, 19 Jun 2020 20:30:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	a12sm7138426pfr.44.2020.06.19.20.30.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 19 Jun 2020 20:30:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 19 Jun 2020 20:29:57 -0700
Message-Id: <20200620033007.1444705-7-keescook@chromium.org>
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
Subject: [Drbd-dev] [PATCH v2 06/16] ide: Remove uninitialized_var() usage
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

drivers/ide/ide-taskfile.c:232:34: warning: unused variable 'flags' [-Wunused-variable]
        unsigned long uninitialized_var(flags);
                                        ^

[1] https://lore.kernel.org/lkml/20200603174714.192027-1-glider@google.com/
[2] https://lore.kernel.org/lkml/CA+55aFw+Vbj0i=1TGqCR5vQkCzWJ0QxK6CernOU6eedsudAixw@mail.gmail.com/
[3] https://lore.kernel.org/lkml/CA+55aFwgbgqhbp1fkxvRKEpzyR5J8n1vKT1VZdz9knmPuXhOeg@mail.gmail.com/
[4] https://lore.kernel.org/lkml/CA+55aFz2500WfbKXAx8s67wrm9=yVJu65TpLgN_ybYNv0VEOKA@mail.gmail.com/

Fixes: ce1e518190ea ("ide: don't disable interrupts during kmap_atomic()")
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/ide/ide-taskfile.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ide/ide-taskfile.c b/drivers/ide/ide-taskfile.c
index aab6a10435b6..a26f85ab58a9 100644
--- a/drivers/ide/ide-taskfile.c
+++ b/drivers/ide/ide-taskfile.c
@@ -229,7 +229,6 @@ void ide_pio_bytes(ide_drive_t *drive, struct ide_cmd *cmd,
 	ide_hwif_t *hwif = drive->hwif;
 	struct scatterlist *sg = hwif->sg_table;
 	struct scatterlist *cursg = cmd->cursg;
-	unsigned long uninitialized_var(flags);
 	struct page *page;
 	unsigned int offset;
 	u8 *buf;
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
