Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id F33D1AFC2FA
	for <lists+drbd-dev@lfdr.de>; Tue,  8 Jul 2025 08:43:15 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BE3C6162279;
	Tue,  8 Jul 2025 08:42:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7FBE4160650
	for <drbd-dev@lists.linbit.com>; Sat,  5 Jul 2025 19:32:55 +0200 (CEST)
Received: by mail-wr1-f50.google.com with SMTP id
	ffacd0b85a97d-3a50fc7ac4dso800936f8f.0
	for <drbd-dev@lists.linbit.com>; Sat, 05 Jul 2025 10:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1751736774; x=1752341574;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Vr/ZD3BCUnN4ej5gioLyrHVyB4YH9QmjY1UHVXxI2VU=;
	b=RWzBJjcOz8ZpdTwDcxUFUTRHoxs1f4a1nvng6gel5O31xvC38UxPCJle7grqRM79Sa
	gcTTEpOehhuL/FWnqVIIUXw9cfNBmVlni/6Mo1UBgN9X5vwgjOSdGgBAozQ0jR1Y/zyy
	tj6EvfPqxABRMxripioYRWVpsCJFj745jxPxxr/MioAAIHQhGGQ1+IBHMzNMRPQvk/Hh
	T2miJ9pA92pJeaAEJPmNyvF6GCoJYX4k6JBxIQMnzyBbMzHs6ZQLvyWJvatLPK6TuVGo
	7ySyfvhiOVqWoEXRI5i+Q9FhfozMMyqbiuiExiHPfOhjsdFlpO7CZMVS8hfnd2FopfvH
	IWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1751736774; x=1752341574;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=Vr/ZD3BCUnN4ej5gioLyrHVyB4YH9QmjY1UHVXxI2VU=;
	b=rpWnNZVqqeiXQQUnyA7LxbcjBfSv6DAWdE208KQjjA+jBGXQxCVJtOWaGrjQevtvc7
	r0YW6xvSDGN5ehxRfibVPVH7kRloCFd5lAx/ZjbUh3zfr7eElsR5oB6QAVZhoUvT4aly
	dCxsdpWQh9jwjR2bzH1+02dmL1KNLP6GszyUxfWO8Vc1K5c/IyzPATQ/H4j4wHBdQqq8
	5bOnQwVqpKW0B7EsDs1zFDnBTkE8JibeHepjF3WElc2l/uN2bts4I5DWB7qDj/kYxMUN
	0Uy3Tcqxt+xu5RQramYFN+w+4gx3le/SpN32vGHgYb+iQ65HZjzU+euo8QTqe0KmrWeE
	/UZg==
X-Forwarded-Encrypted: i=1;
	AJvYcCXsUFbtTqPv9djbCKZj2FSlE+wV8acbIi62nNwl1thBD+HcqxMkYH1TWNu7NanE/tLZHul2fhcQ2w==@lists.linbit.com
X-Gm-Message-State: AOJu0YyjANU/pYuG2vCzW40O0meaZf4Qu9gYPLi6O5Kzr86lQXhnuaF8
	O1AjQFrtB8zZq0EkFjqw+kWHtwhShV4YQe0eTaQTozincOzzEX42u1tZ
X-Gm-Gg: ASbGncuKRqbMgMO7FC6u8jxkT8Vesap67q8YghZAQBQSRUatFkW8h5aKW0fDPYdQ+9f
	OE7q/WVsyNARPal47tfTmUI+SOqna4wO8D46tAxGs/Xs9lKtYrrwFiVkweVQgKGG8dzoflBJ7jH
	+D+sFHa0eMYEFlf5XhW6scgVSuqFXzhs37NkCFr81hYX3YuffCiVKLJuWShrHxjyj1bDGMoxr7e
	EOvgkUFvEOnAD5r3+kNtL7lahSerHsK+puR0HRyPf25VfX10XaHAH5jeP6TclwT8YHQ2NzHbc0Q
	wQr9ecgGdfTi9gKX+05fVDRdM/5vnDvZJhC+Wnyrasf9NU9f/DvPibhOwfrJELjdWFpXsl9l1zG
	s8lw5zD6ECPr1QnxIFqM9goVBf/SB8+CACRsB
X-Google-Smtp-Source: AGHT+IG/6HH9ShvrRUcFIgouUs+F16roF+T0fvocNgtyC7J6R2vbml3IdtiWwj7ol8JOeLlHcd8OBg==
X-Received: by 2002:a05:6000:4807:b0:3a8:6260:d321 with SMTP id
	ffacd0b85a97d-3b49aa429cemr1784449f8f.3.1751736774164; 
	Sat, 05 Jul 2025 10:32:54 -0700 (PDT)
Received: from ekhafagy-ROG-Zephyrus-M16-GU603HR-GU603HR.. ([197.46.88.143])
	by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-454c041cd4asm5618845e9.28.2025.07.05.10.32.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 05 Jul 2025 10:32:53 -0700 (PDT)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: 
Subject: [PATCH v2] DRBD: replace strcpy with strscpy
Date: Sat,  5 Jul 2025 20:32:44 +0300
Message-ID: <20250705173248.59003-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704175018.333165-1-eslam.medhat1993@gmail.com>
References: <20250704175018.333165-1-eslam.medhat1993@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Jul 2025 08:42:35 +0200
Cc: Jens Axboe <axboe@kernel.dk>, eslam.medhat1993@gmail.com,
	skhan@linuxfoundation.com, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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

V2:
 - I forgot about null termination so i fixed it.

Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>
---
 drivers/block/drbd/drbd_main.c     | 17 +++++++++--------
 drivers/block/drbd/drbd_receiver.c |  4 ++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 52724b79be30..028a5cf41d7f 100644
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
+		int integrity_len = strlen(nc->integrity_alg) + 1;
+		size += integrity_len;
+		strscpy(p->integrity_alg, nc->integrity_alg, integrity_len);
+	}
+
 	rcu_read_unlock();
 
 	return __conn_send_command(connection, sock, cmd, size, NULL, 0);
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index e5a2e5f7887b..9c2d439f26e8 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -3985,14 +3985,14 @@ static int receive_SyncParam(struct drbd_connection *connection, struct packet_i
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

