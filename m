Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IVIIaZnuGlEdgEAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Mar 2026 21:27:18 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 27D1A2A02C7
	for <lists+drbd-dev@lfdr.de>; Mon, 16 Mar 2026 21:27:18 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BFB68162701;
	Mon, 16 Mar 2026 21:27:16 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CCAB91608F3
	for <drbd-dev@lists.linbit.com>; Mon, 16 Mar 2026 21:27:13 +0100 (CET)
Received: by mail-wm1-f54.google.com with SMTP id
	5b1f17b1804b1-4853c1ca73aso42024505e9.2
	for <drbd-dev@lists.linbit.com>; Mon, 16 Mar 2026 13:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1773692833; x=1774297633;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=QGkSCnkaww1lWR+SNMIGIRrj8X0ysk6mGmmOv90jF6Y=;
	b=dkjTZ4XmMIgYtChv8hrM7jGE2jmnWu7dx1GJ5N9ebjW4x16qW8o36Aua3xx/9xvHgE
	lJr6tDBvVOrR4vitn0qMm1d3jlBFwO2oQxCU/dQT4Xrpg9hKA48N2r1kXKG0Y2bjSLFc
	RfMX8uqjI87UA163F9iV4SHUdOXCl2HPYuwHbjhAgPOrQ12+HJS+UHtv2IvbaqxVrkbw
	Bbpxh0wv6zRY8uRK1DNyswqYsPSn6mKicGbCfyg7AjWum7XagVocuY3Xj0YAoMFQ5C2h
	/KGe1d9EPCJ/vGSxk2D2gaMKkMD/J4wBAj+ZIeOR9v8ifAnd2BCC6ISnAL6DFLijoWBU
	MdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773692833; x=1774297633;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=QGkSCnkaww1lWR+SNMIGIRrj8X0ysk6mGmmOv90jF6Y=;
	b=SzDmdKeecr5nPShL3O6DRAyCA0xHxR/iYYWZ8rs1Zf9ogettdffzn0dX7YxTY0JA3G
	ffMC21q0fuXa3mHV1ao4kar27G6t7Mm5hCQoH3nR+/kyEfwIvGPy7NTma2qpbIoOeVVR
	m4MulIvXIfy8dholLrTQsFUgoQjvbHdpbHAzgCvE806fZatVtc7EIqG41Vh3e1glWStJ
	ddMd97j1rjMpXlJeTb8VqDhJOItnXkpDsZ2crWHo+5jezNoFvHgMQokcXR8gIKn+jT2z
	QyJDd+4NiFfgcyAGpoKbIQH2OxvEs4WjFy3xug+0c0O8Cbchd5AM+ILOnoZl13TnDxmc
	Lgyw==
X-Forwarded-Encrypted: i=1;
	AJvYcCXHh8u6zQ9RRpH5oZRZ8Y4GIbP0jxzVLr+CUEPvWP2vHYC3rR81mGG/aA5fnWUdHYJc50k3Jde9aA==@lists.linbit.com
X-Gm-Message-State: AOJu0YwQVn149NPcWjhTXrZJbVVNgCS2Gc+JeaK5v4wxSBaYdqDv/MPp
	qAomYJXkRJiMdRpbVKFXXOpI406d/XKaKBM+NMoJ3TTyMCp7pLtHArrT
X-Gm-Gg: ATEYQzx3FUJrYlKpEzCyUT9V4EbsCaqoEdJmVmSb/oamDUC6uJ54JitlAZ9Dejrv3/z
	i6i2XTgGLfZWLo7txHkh+97BUOqPIIvuCB3+imgX7mR73tFXfk9zmPjtfEPEGj3GlPz5xasKzc0
	Kj4ryB/7WM0rbTqlXubiudYP3NUVJ8Jm+gxK4+XnuZ0tME3wnFpEM06Cl8uCRDUytHQ3lQBwC2k
	0gINy8V6A779FO9VuYQ+oZQWjeZcKn+AcaeaUB3b/DloROVJc0fBND7vSvAKPmbmFoZ1c5n9H3I
	uZjI8DCVOMt/6yT/yHjy5J6LP7PClpV8JwXxFX2mY6O/hERP7VUoJe8LS89DMkeFq1nctz+yLec
	ANH9z6VIVn4+jglIFQJgg5lEHh5eGVrj7Vlh+RSfTX/uhLSvmWJu1qykvd11QBBxb91UIV/Qvtp
	Ue3dbM3k9jqkfA2xEvtS6kQQ==
X-Received: by 2002:a05:600d:8499:10b0:485:3f30:6250 with SMTP id
	5b1f17b1804b1-48556714fd8mr184206035e9.20.1773692832397; 
	Mon, 16 Mar 2026 13:27:12 -0700 (PDT)
Received: from localhost ([87.254.0.141]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-48557777105sm172470675e9.4.2026.03.16.13.27.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Mar 2026 13:27:10 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	drbd-dev@lists.linbit.com, linux-block@vger.kernel.org
Subject: [PATCH][next] drbd: Fix typos: "receive_peer_dagatg" ->
	"receive_peer_dagtag"
Date: Mon, 16 Mar 2026 20:25:48 +0000
Message-ID: <20260316202549.33978-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[coliniking@gmail.com,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[coliniking@gmail.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 27D1A2A02C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are a couple of typos in drbd_info and drbd_err messages.
Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/block/drbd/drbd_receiver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 06d83b5ffafb..100207623182 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -8850,14 +8850,14 @@ static int receive_peer_dagtag(struct drbd_connection *connection, struct packet
 			    strategy != SYNC_SOURCE_USE_BITMAP &&
 			    strategy != SYNC_TARGET_USE_BITMAP) {
 				drbd_info(peer_device,
-					  "receive_peer_dagatg(): %s by rule=%s\n",
+					  "receive_peer_dagtag(): %s by rule=%s\n",
 					  strategy_descriptor(strategy).name,
 					  drbd_sync_rule_str(rule));
 				goto out;
 			}
 		} else if (ps != strategy) {
 			drbd_err(peer_device,
-				 "receive_peer_dagatg(): Inconsistent resync directions %s %s\n",
+				 "receive_peer_dagtag(): Inconsistent resync directions %s %s\n",
 				 strategy_descriptor(strategy).name, strategy_descriptor(ps).name);
 			goto out;
 		}
-- 
2.53.0

