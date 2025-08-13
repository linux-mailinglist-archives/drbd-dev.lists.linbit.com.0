Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D564B25707
	for <lists+drbd-dev@lfdr.de>; Thu, 14 Aug 2025 00:55:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C11EB1626DE;
	Thu, 14 Aug 2025 00:55:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EF6C5162267
	for <drbd-dev@lists.linbit.com>; Thu, 14 Aug 2025 00:55:18 +0200 (CEST)
Received: by mail-wm1-f42.google.com with SMTP id
	5b1f17b1804b1-45a1b05ac1eso1482045e9.1
	for <drbd-dev@lists.linbit.com>; Wed, 13 Aug 2025 15:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1755125718; x=1755730518;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=u/7HuxK1PiW4pica1ZvP+UeUtnq1Mq8dM1bfrWpL2pA=;
	b=WzMNJJ4PBjAk1zBBPuQA9uJdtGR5HNzqD2IJy1tBrYfWcxpEvAl3VKAfiztmzkDCbd
	mbNyKqgOQ2hitWcd8X5rfL/LHguXMLm4Qs9og356fwq/YGdF9VGuuqU5Bmk9iHjc9nPo
	RgSLi24gseqjB5vk3DGeiHaaR99VgO9mP7s03IgRLVM/nOBEXWRmnbkucCdG/wGcbgVP
	nnzPkQLTwqWMO7vwtRUwYTDGStIwE5AodPacOjn+eb2BmNMVLjJ5wiIMbruRcCSH0TIj
	44a1JabGYugoit/jvnkTtV9zYcZ6r7Kum9JQq7rvAfXw1uEUa5J7zX/M7pMNicGV09nx
	JAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1755125718; x=1755730518;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=u/7HuxK1PiW4pica1ZvP+UeUtnq1Mq8dM1bfrWpL2pA=;
	b=ekecPkwffK86LEIArknIh2Hht5OFFXwz+n1z6DdKtYIEHNPtXljuzUlM8hD5uWHhEi
	8oYeyyPIxX5Sjr+YqJhRKCsD5iXu3TN/C2VUirz0Pc5IyeM3GQTGVeQ6tBoxW06SyGAx
	BeBrvtkHARogu8GiP0hLmE0Vwb8DlBkb8+u8kAxmWOxeD1CFNQTYb2sfDy5qAzmBnPUe
	TzfVVOgwVhlM1nuzXeZniczzbK3e5kq6UKSdT25Dig6o/lZpdgUdspQhMIeuKnshu/IO
	irzWCt3t2OK/eeXRxZedWyxqQy1Rlz8z4F9t+IKay0qXZnydWXn5kJJxzazjS/VhbNVa
	lQdg==
X-Forwarded-Encrypted: i=1;
	AJvYcCXpax3OKZH40QhEmx0OtuJO/eeHmA+62SLYwqMNP5qvP5OavCiHH+RMK3Jqx4AN/QpPub3TLxfjmw==@lists.linbit.com
X-Gm-Message-State: AOJu0YyZSoRY9NVo0Uults38SDkTP0m7tRJQo7kuZ+yrGXKLVCwlrhs3
	XcF6zwhBp6B0EoVlnXTELWg8AxDfqYbXwLyHQuGyZOonw74mkym2Zyhm
X-Gm-Gg: ASbGncs6b8NWsJXac4Hbj0Bfo2pmYTzs9dT5qUNGVPMxyfk5uUHfxGXCOXj8fkCdDmj
	WSXf3VjgHvp9TpqXdKM4YB99/G4zjW2raWWpmjdIc0VWSuwb62yNZvL3+egMrPNtUNPnnHqekpN
	LZpnrhV2ekXbKkwP/DnyGp5Qq+/esBwt2kNWlt3+gqvMM69VdJ6HepAaKrH+P+gtIEUGRcRQ+ag
	E0V2X99Yjn6HxKU6vvGTV0zuxfIZ4PFODfVnU+hgBZveFIQWFW0NwCHRCuveUlRf5S8d1Z1nX2B
	qc5K8e3x1B0yUwpGvrmk+onb/j+woZvRfprc/vYDhytFknQXB9q1Yf8WPW6H5arq05Ig8ou/fFV
	Raop5PNV+GkQv/24RxXWwRUmU12qFEAdZlMm2qAYci1rMAZ2K8/kodTLNaQDPxszyDgyGJ9apwQ
	==
X-Google-Smtp-Source: AGHT+IFeCjojdSo/SpRtqi2SaYzzhmaB5U1RpVmYXo6pe2aArUfXV1t+Q54VbnzmGyma/aP/wkq4Tg==
X-Received: by 2002:a05:600c:1911:b0:459:d9a2:e920 with SMTP id
	5b1f17b1804b1-45a1b5ffe70mr4084125e9.4.1755125718357; 
	Wed, 13 Aug 2025 15:55:18 -0700 (PDT)
Received: from ekhafagy-ROG-Zephyrus-M16-GU603HR-GU603HR.. ([156.204.193.65])
	by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-45a1a590192sm16446865e9.24.2025.08.13.15.55.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 Aug 2025 15:55:18 -0700 (PDT)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] DRBD: replace strcpy with strscpy
Date: Thu, 14 Aug 2025 01:54:53 +0300
Message-ID: <20250813225510.138105-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: skhan@linuxfoundation.com, eslam.medhat1993@gmail.com
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

strcpy is deprecated due to lack of bounds checking. This patch replaces
strcpy with strscpy, the recommended alternative for null terminated
strings, to follow best practices.

I had to do a small refactor for __drbd_send_protocol since it uses
strlen anyways. so why not use that for strscpy.

Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
 drivers/block/drbd/drbd_main.c     | 17 +++++++++--------
 drivers/block/drbd/drbd_receiver.c |  4 ++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 52724b79be30..4e5bd74be90a 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -742,9 +742,9 @@ int drbd_send_sync_param(struct drbd_peer_device *peer_device)
 	}
 
 	if (apv >= 88)
-		strcpy(p->verify_alg, nc->verify_alg);
+		strscpy(p->verify_alg, nc->verify_alg);
 	if (apv >= 89)
-		strcpy(p->csums_alg, nc->csums_alg);
+		strscpy(p->csums_alg, nc->csums_alg);
 	rcu_read_unlock();
 
 	return drbd_send_command(peer_device, sock, cmd, size, NULL, 0);
@@ -771,10 +771,6 @@ int __drbd_send_protocol(struct drbd_connection *connection, enum drbd_packet cm
 		return -EOPNOTSUPP;
 	}
 
-	size = sizeof(*p);
-	if (connection->agreed_pro_version >= 87)
-		size += strlen(nc->integrity_alg) + 1;
-
 	p->protocol      = cpu_to_be32(nc->wire_protocol);
 	p->after_sb_0p   = cpu_to_be32(nc->after_sb_0p);
 	p->after_sb_1p   = cpu_to_be32(nc->after_sb_1p);
@@ -787,8 +783,13 @@ int __drbd_send_protocol(struct drbd_connection *connection, enum drbd_packet cm
 		cf |= CF_DRY_RUN;
 	p->conn_flags    = cpu_to_be32(cf);
 
-	if (connection->agreed_pro_version >= 87)
-		strcpy(p->integrity_alg, nc->integrity_alg);
+	size = sizeof(*p);
+	if (connection->agreed_pro_version >= 87) {
+		int integrity_len = strlen(nc->integrity_alg);
+		size += integrity_len + 1;
+		strscpy(p->integrity_alg, nc->integrity_alg, integrity_len);
+	}
+
 	rcu_read_unlock();
 
 	return __conn_send_command(connection, sock, cmd, size, NULL, 0);
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 975024cf03c5..d4ea742664c2 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3989,14 +3989,14 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
 			*new_net_conf = *old_net_conf;
 
 			if (verify_tfm) {
-				strcpy(new_net_conf->verify_alg, p->verify_alg);
+				strscpy(new_net_conf->verify_alg, p->verify_alg);
 				new_net_conf->verify_alg_len = strlen(p->verify_alg) + 1;
 				crypto_free_shash(peer_device->connection->verify_tfm);
 				peer_device->connection->verify_tfm = verify_tfm;
 				drbd_info(device, "using verify-alg: \"%s\"\n", p->verify_alg);
 			}
 			if (csums_tfm) {
-				strcpy(new_net_conf->csums_alg, p->csums_alg);
+				strscpy(new_net_conf->csums_alg, p->csums_alg);
 				new_net_conf->csums_alg_len = strlen(p->csums_alg) + 1;
 				crypto_free_shash(peer_device->connection->csums_tfm);
 				peer_device->connection->csums_tfm = csums_tfm;
-- 
2.43.0

