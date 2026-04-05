Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEElGZiT1mmiGQgAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 08 Apr 2026 19:42:48 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0BF3BFBE7
	for <lists+drbd-dev@lfdr.de>; Wed, 08 Apr 2026 19:42:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4616E16315F;
	Wed,  8 Apr 2026 19:42:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 240C8160920
	for <drbd-dev@lists.linbit.com>; Sun,  5 Apr 2026 17:47:10 +0200 (CEST)
Received: by mail-wm1-f45.google.com with SMTP id
	5b1f17b1804b1-48557c8ad47so26022655e9.0
	for <drbd-dev@lists.linbit.com>; Sun, 05 Apr 2026 08:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20251104; t=1775404030; x=1776008830;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=Ij+T5jzWpjsPXYuNnUcPKiRbTS9+M0L00zfNyuOLfvI=;
	b=Ea0aeGhpMYdHQC4ZoJZ3vZWkYe+xXzZ36oH6YllIQrLyUy1riSfU7NHdOWSD2jgytR
	nEuGyQHV1tti8B7LzqbbI2/4re/mOdKOKylV1K50xQz9gLNn97byByC+CPUAMSlQht83
	Gv9w0YUepiA2KTcYIoz+b+DgYfVuihgrI70IZ928WGMH4W0VA1hoibVPNubo7fGHajiW
	s+pHGIG+z3OO5GmyY7dS7MQ2cyxYE/zs9M9tyIkMETOs6hbImjxHFO1yEraJFE30RJKZ
	xtUHXKrfa19MYRrb8juuAb2Yent52Q0HgsL+XxQ+Y1AxwZrZMqMTOGKAFMtcx3yw7jLi
	iSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775404030; x=1776008830;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=Ij+T5jzWpjsPXYuNnUcPKiRbTS9+M0L00zfNyuOLfvI=;
	b=VaRgUwq0IqPEh0B00vMzspoFIYFW6R5p59iWrgYb4ZX0S15nQw7NH5v0FJVZhB71sQ
	h+e3/nk0Tv+p4MShLlP+rHU2sMqHtj3GcQq5noACvF9PDwrDcZIdKq3OKvuKfvfAwv00
	4+jfY6vwRQXVA4KU6kzINjUiBCxC7RUzz5nZ7iw/wq/9vfuft5aNk2mlMsWIBp7Czfx9
	IDZpKWZFUEJOJDBI1QjYDZJ4jjZx/a7wv9++nV9x2440kza5rdr7ad/xNDxYyi7Cwolq
	mvg579PbCP9H3teN/wc4M6Gkg+JQ/9EDhHBxMNVUdCBGiNPYFj2P+HScJDr3uY7RIbVn
	dN4w==
X-Forwarded-Encrypted: i=1;
	AJvYcCUiLQQWdxe1JF1JgXPA1mPqzOw0Mvf3JoBxQOv8aVsIwk0SHB4utg6fGyJ00xBFva8eAq45QhSwOA==@lists.linbit.com
X-Gm-Message-State: AOJu0Yxn1NDZT9cgEtXKke68mXXoIJ9wl3Jl5BXk8bM+0lgB01gvx4Ph
	0tIOAz/B8hrkRK13L5l8209Sn0Jbshm5VXOz3NZKtPpxkWvmpOvTRtW/
X-Gm-Gg: AeBDietV6PZ/hqYAWgRqc/pGhU00F7FVOkpj/PTo+mtrNx+xtaYLSByC5IIIZGkLYDU
	uNpQnciS1D96ogOEp4W7RLFsEIlicpnExxU71Lz6VRYM3R6fKPVbKlb8f5/o6F88Qt0ZUY96C0B
	RXTYI50T9BMjQKiYYrteyBTZzQbA4v9GfcG+DbX0UIZnDpucP20CC60NCcQxQsFKcHTpGR4Vcfl
	CnzG2n/iMdzG3InAzeunUiBMp7MOlb36poLpBP+4H2LEUu8q9n2rukMJjHfWK43dYbWvpX+1Piu
	hgr1lC4xQzq7KQx60ReEAAFvG34X1pPRZ/peahjfHVWBl8tSX8CvBQlbaioh7eRPYWcjc52SeCo
	UAY7sFKZgKKJ2kdA/0941yftxZKs9EoJJstfYA8JXenC1X4Ji4R2jN+M+854mTVTFBi2pIx7CVZ
	WSeLWkQVITs3ALyUceufhmO9czFIBCiNPEht0hIv83bPxX/vanQfFEA1ZC6eDppjHknK5lGPOjd
	j2zBFA6igTb
X-Received: by 2002:a05:600c:4593:b0:488:9696:488a with SMTP id
	5b1f17b1804b1-488997e7dc7mr165902365e9.30.1775404030180; 
	Sun, 05 Apr 2026 08:47:10 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
	by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-488b0c53a27sm22255485e9.7.2026.04.05.08.47.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 05 Apr 2026 08:47:09 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: [PATCH v3] drbd: use get_random_u64() where appropriate
Date: Sun,  5 Apr 2026 16:47:04 +0100
Message-ID: <20260405154704.4610-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 08 Apr 2026 19:42:34 +0200
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	David Carlier <devnexen@gmail.com>, linux-kernel@vger.kernel.org,
	drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [3.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	DATE_IN_PAST(1.00)[73];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.dk,vger.kernel.org,gmail.com,lists.linbit.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:devnexen@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[devnexen@gmail.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnexen@gmail.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	NEURAL_SPAM(0.00)[0.617];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 0E0BF3BFBE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the typed random integer helpers instead of
get_random_bytes() when filling a single integer variable.
The helpers return the value directly, require no pointer
or size argument, and better express intent.

Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/block/drbd/drbd_main.c | 4 ++--
 drivers/block/drbd/drbd_nl.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 200d464e984b..b1a721dd0496 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -874,7 +874,7 @@ void drbd_gen_and_send_sync_uuid(struct drbd_peer_device *peer_device)
 	if (uuid && uuid != UUID_JUST_CREATED)
 		uuid = uuid + UUID_NEW_BM_OFFSET;
 	else
-		get_random_bytes(&uuid, sizeof(u64));
+		uuid = get_random_u64();
 	drbd_uuid_set(device, UI_BITMAP, uuid);
 	drbd_print_uuids(device, "updated sync UUID");
 	drbd_md_sync(device);
@@ -3337,7 +3337,7 @@ void drbd_uuid_new_current(struct drbd_device *device) __must_hold(local)
 	u64 val;
 	unsigned long long bm_uuid;
 
-	get_random_bytes(&val, sizeof(u64));
+	val = get_random_u64();
 
 	spin_lock_irq(&device->ldev->md.uuid_lock);
 	bm_uuid = device->ldev->md.uuid[UI_BITMAP];
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index e201f0087a0f..377f60b40f28 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -3173,7 +3173,7 @@ int drbd_adm_resume_io(struct sk_buff *skb, struct genl_info *info)
 			 * matching real data uuid exists).
 			 */
 			u64 val;
-			get_random_bytes(&val, sizeof(u64));
+			val = get_random_u64();
 			drbd_set_ed_uuid(device, val);
 			drbd_warn(device, "Resumed without access to data; please tear down before attempting to re-configure.\n");
 		}
-- 
2.53.0

