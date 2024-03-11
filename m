Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5AE877B21
	for <lists+drbd-dev@lfdr.de>; Mon, 11 Mar 2024 08:04:05 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8485A420627;
	Mon, 11 Mar 2024 08:04:04 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6099E420026
	for <drbd-dev@lists.linbit.com>; Mon, 11 Mar 2024 04:44:08 +0100 (CET)
Received: by mail-pl1-f174.google.com with SMTP id
	d9443c01a7336-1dd3c6c8dbbso5606315ad.1
	for <drbd-dev@lists.linbit.com>; Sun, 10 Mar 2024 20:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1710128647; x=1710733447;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=Uqf/Jkk0NFQZ1ArKKj86vJrb3nslVxHqnT0lqQ8B590=;
	b=PP5extQO0UJxh28D40ixMU6eHvDVIXwFaNF+OLEx2ayF8DDq2sQMEWTjjYyKt+uCFK
	eo9izVrO+k3SUOfwPOf2byqSqvLv7bicLJHX60KfXBDgpaGMYKCIKc72z0/60UYHVZXi
	ryYKiaA2g+znjHFTkA+aCkMf5JKBJyRG6yavPjD7bge/Gd+IvL8OyYGellTsQjKKO6wk
	k3kTFGNzWPMGlbcPaVDbhD80eyHmn4JQQMA6qrk6lR/P4loljZnlOqIFc+chfBurm8nD
	/Q/J6ecNeHxG2/0aEoLXCvWgwiXxlTL6T3ZrHCys/4LEp9W57jrvpOoQyLDcfRyWb5s4
	nTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1710128647; x=1710733447;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=Uqf/Jkk0NFQZ1ArKKj86vJrb3nslVxHqnT0lqQ8B590=;
	b=GcQIjiO8AwUsaDmktfUU09DII2YYDBZopi4C/Ew58bIYRs81luBvxLBAbKY7Ck99KI
	nf/7HGTUHhSpTdt41jD0Cx59jgbKO+SLdAEzAtXXVeTnbatQRGKNwDfSkDunDHixlI3y
	1vAY7m0h2w7WMMtYD/9mThVYPDFd+lUq0wJr3SFOebfy0f/URSYBDV3Gdx/xdvHLHt8v
	AgdVyUqULFVyGz9pKlojs3A/45bz54Aoe0rXKlojrZGBFsN9XzepkLI2rJHDcSIFzzOr
	Fj9o87pa+nY2XkYajtBQxRdGNJCFMbpVdJ+eXN5g33eHnINCvrPotzXK4WZ1E+8PEDBE
	X7fQ==
X-Forwarded-Encrypted: i=1;
	AJvYcCXBAHYO0XG8SoIRP7EZgYZtvx2vPYwry7QknR0kl4ss9lOeVcvhKY6Itd1Qz8R3oJt7UsIgLPztZVnChJnxSEpYFpvZ4oQ6eowe
X-Gm-Message-State: AOJu0Yxsdw0caX8GxOK6hss26CwuA/4eYM5fg4YKGFkC+38tCxbgPXgd
	U8r66dLiF6QrmeAi5wvLv8WddLJvNyb68DeJqHDk+8refuXoErhh
X-Google-Smtp-Source: AGHT+IFpyX1+j2mnwa8ni51KfFT4JSVV3tiX8GAi4YroXgQjyCnwVsmAbVHPUnQonnidiVVHEd8cpg==
X-Received: by 2002:a17:902:d395:b0:1dc:fcde:853a with SMTP id
	e21-20020a170902d39500b001dcfcde853amr6096389pld.1.1710128647004;
	Sun, 10 Mar 2024 20:44:07 -0700 (PDT)
Received: from vaxr-BM6660-BM6360.. ([2001:288:7001:2703:b289:6f57:682e:c7f1])
	by smtp.gmail.com with ESMTPSA id
	w17-20020a170902d11100b001dca68b97d3sm3494934plw.44.2024.03.10.20.44.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 10 Mar 2024 20:44:06 -0700 (PDT)
From: I-HSIN CHENG <richard120310@gmail.com>
To: philipp.reisner@linbit.com
Subject: [PATCH] lru_cache: Initialize hlist_head in lc_create
Date: Mon, 11 Mar 2024 11:44:01 +0800
Message-Id: <20240311034401.234854-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 11 Mar 2024 08:03:57 +0100
Cc: lars.ellenberg@linbit.com, I-HSIN CHENG <richard120310@gmail.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Use INIT_HLIST_HEAD to perform the initialization for each pointer to
struct list_head in the variable "slot" to provide more safety and
prevent possible bugs from uninitialized behavior.

Signed-off-by: I-HSIN CHENG <richard120310@gmail.com>
---
 lib/lru_cache.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/lru_cache.c b/lib/lru_cache.c
index b3d918761..ae122792e 100644
--- a/lib/lru_cache.c
+++ b/lib/lru_cache.c
@@ -105,6 +105,9 @@ struct lru_cache *lc_create(const char *name, struct kmem_cache *cache,
 	if (!lc)
 		goto out_fail;
 
+	for (int i = 0; i < e_count; i++)
+		INIT_HLIST_HEAD(slot + i);
+
 	INIT_LIST_HEAD(&lc->in_use);
 	INIT_LIST_HEAD(&lc->lru);
 	INIT_LIST_HEAD(&lc->free);
-- 
2.34.1

