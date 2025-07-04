Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCAAAFC2F9
	for <lists+drbd-dev@lfdr.de>; Tue,  8 Jul 2025 08:42:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 853B8162276;
	Tue,  8 Jul 2025 08:42:41 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E6EC1160645
	for <drbd-dev@lists.linbit.com>; Fri,  4 Jul 2025 19:50:42 +0200 (CEST)
Received: by mail-wr1-f50.google.com with SMTP id
	ffacd0b85a97d-3a5123c1533so539677f8f.2
	for <drbd-dev@lists.linbit.com>; Fri, 04 Jul 2025 10:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1751651442; x=1752256242;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=7kzxKyGyUkMQNU8zFP39T97KAl93oC6U2R3DXkWnfQQ=;
	b=SJTZVStyHs879NWcvt26qXScOj5qzNI+ChOakDryzeYInySvZzPWDwnwUd7jN9/J+i
	rAJ1KqTcpqazcgND9Pcl8DKJytMyJ3+AzVRXlVQPJbpmSaea7YE5WjGYIqIBZrncY+Ij
	1tGzAr6REBngGbiiw+lWUs/jftcbJzdUIdX0HXBWZHklMzRtfOiBvijgFOxYoc0eyIGX
	4/K/lROp/nrmZr2l8L5TAki4amYnQH7fYBKQ1aOdEYftsT4gkAfeCLeZkOGALi9u8yXk
	BA0yG+Z7kZ6D8gaCzAHNT/3MsYreWDP2AhUw4I471Fu2rncIu3XuJTlI6GX+oQL7x8zw
	oJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1751651442; x=1752256242;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=7kzxKyGyUkMQNU8zFP39T97KAl93oC6U2R3DXkWnfQQ=;
	b=i+raF0B5X/LJatXXUwRtrCi9XEL5p6c9+vKSAIpZ64DRldHHLUPIAI4FwK+CS1CuRr
	8rR+APf9ypfw5IITZPCrqmrKqby/fLilkO/LfMtH0Z9prY3+Z0iae2aimPatdBlF196E
	I+FWYjnjoIApJ+Ag3X/QuSUrMEXYNZNf/+RqF4r3+7NG4ZWq2oPVKmP//uppLgbgCnIJ
	IeOeaIjea7LuScFo+jgpeZ0l+UWXF+0GwXWxl/g6sCfj+Fz+AYhKQ56w61yxgP4RuRsZ
	DxlEd+DbHO1IrWdQd1A+yHwm54F16N9Nm1Ga7f5RRdUVh5RQIdUu2VK5TbMS6jVCnlwL
	yUcQ==
X-Forwarded-Encrypted: i=1;
	AJvYcCWc+kakFlAlmXpKqUaDjZjKILztFiz87vu6OaU4P6xqoynxFGKguc4ob7mzJL05tEdLX/npls3xNg==@lists.linbit.com
X-Gm-Message-State: AOJu0YwyKD1+X4ytjGtrlQsOTX93XtoLwdZH+f3GqV+kbryIgQNrJlFM
	x5Oohc2uB6dLoR7OUZFN8owA74nRbA97FdSPyOivPn62V5VQt/KdQDU7
X-Gm-Gg: ASbGncs+1tEw3mlE9yU/F5oc37E+2FrUFDiN62VSQQEM2+2s8EQrO1LtPJ2VtovTHK+
	9/NoHKGPDZxlxDrZZsY1x9/RWP4uyo5+RedTGtZu1ESfgwdQmNodl3MQHD+5419diNZ7JQMD64a
	T8fi6jGvtn6YLFgQ3WjIV3M8f9qJ5TyhbOoprzvZfRcrVywB3CX30ESMTyjSay+I2jRbpsmmtGp
	2HYuOFgEvhUxfU6VEXNAa9RT1KplLk53CxrAYmwd/01/nL77t7g+nEFyRRKqE2MbJOAmuYiVSIp
	34p5Vj330hEpb5wi4mpr6NgvnW0CbYrffhVOmcqKyAXD6cfKq8pjXqxa5t5YzWofUNh2t6LfmZ0
	R4XGT0jYJds15wB0YTtTZlKlYccs5jjDfILNfSA==
X-Google-Smtp-Source: AGHT+IHkGqUW4qYzaIeEVo4MIPsGKugMbjdQlEOB95vKMllXraZTUlpZPd8DNQlc+GfPIEvC/98pUg==
X-Received: by 2002:a05:6000:2c13:b0:3a4:ef0d:e614 with SMTP id
	ffacd0b85a97d-3b4964def6bmr3030814f8f.33.1751651441612; 
	Fri, 04 Jul 2025 10:50:41 -0700 (PDT)
Received: from ekhafagy-ROG-Zephyrus-M16-GU603HR-GU603HR.. ([156.204.255.91])
	by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-3b4708d0ed9sm3063745f8f.38.2025.07.04.10.50.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 04 Jul 2025 10:50:41 -0700 (PDT)
From: Eslam Khafagy <eslam.medhat1993@gmail.com>
To: 
Subject: [PATCH] DRBD: replace strcpy with strscpy
Date: Fri,  4 Jul 2025 20:50:15 +0300
Message-ID: <20250704175018.333165-1-eslam.medhat1993@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 08 Jul 2025 08:42:35 +0200
Cc: Jens Axboe <axboe@kernel.dk>, Eslam Khafagy <eslam.medhat1993@gmail.com>,
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

