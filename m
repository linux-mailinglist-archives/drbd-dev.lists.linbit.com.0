Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCUjGtHJumm6bwIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:50:41 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4122BE9B6
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:50:41 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2D20F1630EA;
	Wed, 18 Mar 2026 16:49:54 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
	[209.85.128.171])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2B7CF1622B5
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 00:23:22 +0100 (CET)
Received: by mail-yw1-f171.google.com with SMTP id
	00721157ae682-7927261a3acso51072437b3.0
	for <drbd-dev@lists.linbit.com>; Tue, 17 Mar 2026 16:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1773789802; x=1774394602;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=GVqejN9RcyteX0OK/Wyi8jfYU0wStXL+Y9sOPfh9k1k=;
	b=WYgmmXtZuJtgx6foTNN+XLI6p8DFrcM7Sj3W4NkXiO1DawwJdZIQa/Kd0WscrrpyE2
	9iGIt9xSPCRcKDorvQxXwTkLe/cUNIIu8gdulZDedn57AjRV2U+cGv+/DgZCGQRHDzQo
	H4ovRY5uM41VOk90+BWaHboEGSpk1sS9sF34Bp+nFNrSAfcSX/ydOnQxnIDjafgwbxeS
	C35FJZPXQ2T9Gnwmk5PqXiCEr11JnKVj7ZlW75El+P3sjra0LKvyf3Og4pXA9BEPpv91
	lu/WKGcq8n+9XyJrhVOq9qfeDk1cMgbxR7CdoBU/cr0Syy+aDAygrkSeA0AkIdBuxAZb
	6RBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773789802; x=1774394602;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=GVqejN9RcyteX0OK/Wyi8jfYU0wStXL+Y9sOPfh9k1k=;
	b=lGTSu+W9faCdJPggBW3uFaPXyuBrbJNZIxJxWFCkdxW82ZFeoymQ2NAMNxRyq3NNDs
	Om4dTWdl6KfQh+XgkM0XFHwKc5s5tODS8+eduXbyIct/cSV0U0fs5Wq+XaGEVu1RKTcj
	nH/3gSKfKsoPAysOD7V4Mi5Dbwbe2gg0xIWdVIehjRcgoBz6yV3d1lIbI7oh4pKCgB73
	uvqMffsg27P9ceAZA+jRCWLZghIv3NznFLj8jFnyQEJhrityViz0DaYxjcozhgUA1gXJ
	QbqjiKD46QNVC5wMvYKU6oR4Vt+UiYNai3ApQyEE7qN3JJb80cMHRXqic5Ea8taqCr/N
	bzlA==
X-Gm-Message-State: AOJu0YwZPYwIIb/YVIC1mobzBEdx6J3vytMyn1V5Ufpmikl/LdBRf8LD
	pBjGZ6MD69fxZTWf3YDD2CPp12VxL4Ede5v3KV+Q7Q5lJFjIr/alnL9C
X-Gm-Gg: ATEYQzznrVnkr4rVpLQou/p0cPgIzrOCeVLa5oBCpDmYwmK+qWnFqKFKXtHHAavtv2V
	7N8I5eKt15Oa/0CEbTrADyq4SISvXmJxl7bU35ZpN96IKD7jUWDuLP2cQfYPyGNqiDtl4vpvHmw
	JK8cg6U7wi/r9TpRhFG2/bISXhaHsfZ0FiFq8R9uaOjYmzHZbA3PIc5bBNudo9fX0Q1dYFAhfTO
	PgFyyKeOKErqcjzMLIGUesP/iLOcA7dibpdkNjGMEsxTmpyCbkGwvh11xnb8R3zTbwdNXq2SMc9
	vc5B4V10s90hRjW9VwLO5oCbHgSvnfx5iqkc1ZTVcc/a/4H6x1+JI6t14vEv9XVoP0AKweuzufk
	LNvE9QihFLY/Su0XT6SrTGjzig+GAxlm/MBoI/o8cFEyuw3w0t3d/k04iAH22oSOP5UJNxeUZIS
	z/KgZycG3HY63uEO8Aih+Y27SuKEUUa2jXFgQcCC2ozVzx/8NXeGbo2hM3LEcMBMYKznUH+2tSp
	cJb9viRtBugdmTgb4YgZKgN
X-Received: by 2002:a05:690c:110:b0:79a:38a2:d8ca with SMTP id
	00721157ae682-79a718c62demr13000817b3.23.1773789801990; 
	Tue, 17 Mar 2026 16:23:21 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::f769])
	by smtp.gmail.com with ESMTPSA id
	00721157ae682-79a715d221dsm6858217b3.37.2026.03.17.16.23.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2026 16:23:21 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 2/4] drbd: Fix variable dereference before check
Date: Tue, 17 Mar 2026 18:23:16 -0500
Message-ID: <20260317232318.18923-3-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317232318.18923-1-ethantidmore06@gmail.com>
References: <20260317232318.18923-1-ethantidmore06@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Mar 2026 16:49:43 +0100
Cc: linux-block@vger.kernel.org, Ethan Tidmore <ethantidmore06@gmail.com>,
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
X-Spamd-Result: default: False [2.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,drbd-dev-bounces@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.166];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:ethantidmore06@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.linbit.com];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 1F4122BE9B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The struct is 'req' is checked for NULL after resource was assigned from
a member from it.

Check 'req' for NULL before assigning resource.

Detected by Smatch:
drivers/block/drbd/drbd_req.c:1996 drbd_unplug() warn:
variable dereferenced before check 'req' (see line 1993)

Fixes: 71d075200b462 ("drbd: rework request processing for DRBD 9 multi-peer IO")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/block/drbd/drbd_req.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index e88b5da15c1e..4cbd9ec15157 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -1990,12 +1990,14 @@ static void drbd_unplug(struct blk_plug_cb *cb, bool from_schedule)
 {
 	struct drbd_plug_cb *plug = container_of(cb, struct drbd_plug_cb, cb);
 	struct drbd_request *req = plug->most_recent_req;
-	struct drbd_resource *resource = req->device->resource;
+	struct drbd_resource *resource;
 
 	kfree(cb);
 	if (!req)
 		return;
 
+	resource = req->device->resource;
+
 	read_lock_irq(&resource->state_rwlock);
 	/* In case the sender did not process it yet, raise the flag to
 	 * have it followed with P_UNPLUG_REMOTE just after. */
-- 
2.53.0

