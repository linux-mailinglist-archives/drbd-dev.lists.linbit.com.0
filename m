Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGhJLzUcl2ktuwIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Feb 2026 15:20:37 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 5289715F6AB
	for <lists+drbd-dev@lfdr.de>; Thu, 19 Feb 2026 15:20:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8AC8A1630D3;
	Thu, 19 Feb 2026 15:20:25 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CB1F91626A1
	for <drbd-dev@lists.linbit.com>; Thu, 19 Feb 2026 15:20:21 +0100 (CET)
Received: by mail-wr1-f44.google.com with SMTP id
	ffacd0b85a97d-4359a302794so818299f8f.1
	for <drbd-dev@lists.linbit.com>; Thu, 19 Feb 2026 06:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1771510821;
	x=1772115621; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=5WPV5zc+4pTYNW/WHh9z0i95W/Lb1GJgH88opLKR1Gc=;
	b=QEIidKX1XeeQ77sD75CWQlM+WxP+uuWXS80o7O9O4do3382X0emvjSrOa3aLM538sL
	3Z0BPpIUqpv3npj0OujHMNgM4DFOlSEh31Ik+zJ9ZJ9Qye8jPReGdRq3Ue5rX+4eus7k
	FlsCApPDyw+jBgTMI6w/AOouZ1DJEe26i45JzGTIx4jglUJQcQk1e0lU0A01Li4Z+fHD
	Fn3GnX+lJQS2hs5YnrSpUq+OhRc1Lsm1W7vpDHWHpfRfOnZZEmtUI/vdxjlOR8II3buE
	v52uKGGv2n3SlRFyjYrhuA3SibVM49cMZ4lyY1TJc7KoqYxSn1yN53f0jVcENZJLcluw
	D+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1771510821; x=1772115621;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=5WPV5zc+4pTYNW/WHh9z0i95W/Lb1GJgH88opLKR1Gc=;
	b=tIFY2i2LvRpmerJy1xxfrWKuwd0+xWcotZKttEeYFINWa5g0I6G2pnVhoR9lN93Yts
	X3JLdB8tDom6lDSJBHzVjkAlYEzK8CwFzyn6qDzFYtogiQo8J1S56p47whmcFR+GCn3O
	br4FOUJFtMnFI35jGUt3Kd5FlGzEQQnNqhhOTWta6v2fcPcte0K8HamA+4QmbgcFwXNJ
	bz/EqFAYVevNLmjNaQfKqdMj/swjL5s7ZOt2oyifETLj11smm77Z7mMLTLXJYeza9+Vd
	q9mlClzXs9cZJtn7DZaumKD++n6Ccrkv+w9aVG0waobuKKNedCAJverzABj+JOqJ2mVC
	TJsw==
X-Forwarded-Encrypted: i=1;
	AJvYcCWLA3g9BrUTPj/HQ74VZuiZYNiHlVVnud5Ovrl6qUHPSZl6PqygRcVnQsvL3wEuSa8idFCLWEOKGA==@lists.linbit.com
X-Gm-Message-State: AOJu0Ywsm9tHUMcw6IqBNoFUwjrHlRUQ2tLRQiVhm6lK6mdOfrktT1Yy
	X7Yz0SgxsYrJlifCxfZ6YVkzklRwZyN/kzk48CEFPenmORltewHHbWOHW5rA150yhOzK8A==
X-Gm-Gg: AZuq6aIEAhznwyLeJN78ffmYbXTaLEMLBxx9ciq1e1FQGX//OfBbcYsRir9TjcdZCLU
	l+LGiQvxIMXynygK0IHjoMxf8o1+HJkTFspDQnSHNKV8Al0pAcjo6bRuXS8Al8+5NlRS/6d6UoQ
	Szez2KafibRHW5mj6UR3ZhrWhYT38LCdTXrR/yvDbImYHG+bPa/3TKCrUIVAET/fMVHr3dsr/h9
	QUE4rL8v56VTedo/mrWuZrhzuv/mgPwu6x66ZAjrgF5WqwUKcWxQ8tLIdsmI6VQWp20vJUrr156
	H/Z4fDVyTMl5+4LmgeGvZ/hq/zWN5VbUjl6aOxJz4cFZP1qvU6ZHC8Pnrphmu81Fr2O37L7qaAc
	Mp3yljFMtpNeYHFf9khd47iYalhAz+KAb141XHAqJd77xtPoDabBJeHsAwmTOpg4bmnXbOEV6nv
	BKel111MMf6ORMKIdbRc5piHPdtPeMKZtM6nVIPgFWSb+MU4qo16We/fbpG0WnTC9InkxlHb4Ao
	hsjsdMIji4xmsYMllfOFgZFLtmLccE1nzE=
X-Received: by 2002:a5d:5d83:0:b0:437:6b6e:d114 with SMTP id
	ffacd0b85a97d-4379db9800dmr29808717f8f.30.1771510820603; 
	Thu, 19 Feb 2026 06:20:20 -0800 (PST)
Received: from localhost.localdomain.com (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-43796a5ac7csm47122906f8f.7.2026.02.19.06.20.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Feb 2026 06:20:20 -0800 (PST)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] drbd: fix "LOGIC BUG" in drbd_al_begin_io_nonblock()
Date: Thu, 19 Feb 2026 15:20:12 +0100
Message-ID: <20260219142012.97756-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Lars Ellenberg <lars@linbit.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.09 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:lars@linbit.com,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	NEURAL_SPAM(0.00)[0.733];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 5289715F6AB
X-Rspamd-Action: no action

From: Lars Ellenberg <lars.ellenberg@linbit.com>

Even though we check that we "should" be able to do lc_get_cumulative()
while holding the device->al_lock spinlock, it may still fail,
if some other code path decided to do lc_try_lock() with bad timing.

If that happened, we logged "LOGIC BUG for enr=...",
but still did not return an error.

The rest of the code now assumed that this request has references
for the relevant activity log extents.

The implcations are that during an active resync, mutual exclusivity of
resync versus application IO is not guaranteed. And a potential crash
at this point may not realizs that these extents could have been target
of in-flight IO and would need to be resynced just in case.

Also, once the request completes, it will give up activity log references it
does not even hold, which will trigger a BUG_ON(refcnt == 0) in lc_put().

Fix:

Do not crash the kernel for a condition that is harmless during normal
operation: also catch "e->refcnt == 0", not only "e == NULL"
when being noisy about "al_complete_io() called on inactive extent %u\n".

And do not try to be smart and "guess" whether something will work, then
be surprised when it does not.
Deal with the fact that it may or may not work.  If it does not, remember a
possible "partially in activity log" state (only possible for requests that
cross extent boundaries), and return an error code from
drbd_al_begin_io_nonblock().

A latter call for the same request will then resume from where we left off.

Cc: stable@vger.kernel.org
Signed-off-by: Lars Ellenberg <lars.ellenberg@linbit.com>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/drbd_actlog.c   | 53 +++++++++++++-----------------
 drivers/block/drbd/drbd_interval.h |  5 ++-
 2 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/drivers/block/drbd/drbd_actlog.c b/drivers/block/drbd/drbd_actlog.c
index 742b2908ff68..b3dbf6c76e98 100644
--- a/drivers/block/drbd/drbd_actlog.c
+++ b/drivers/block/drbd/drbd_actlog.c
@@ -483,38 +483,20 @@ void drbd_al_begin_io(struct drbd_device *device, struct drbd_interval *i)
 
 int drbd_al_begin_io_nonblock(struct drbd_device *device, struct drbd_interval *i)
 {
-	struct lru_cache *al = device->act_log;
 	/* for bios crossing activity log extent boundaries,
 	 * we may need to activate two extents in one go */
 	unsigned first = i->sector >> (AL_EXTENT_SHIFT-9);
 	unsigned last = i->size == 0 ? first : (i->sector + (i->size >> 9) - 1) >> (AL_EXTENT_SHIFT-9);
-	unsigned nr_al_extents;
-	unsigned available_update_slots;
 	unsigned enr;
 
-	D_ASSERT(device, first <= last);
-
-	nr_al_extents = 1 + last - first; /* worst case: all touched extends are cold. */
-	available_update_slots = min(al->nr_elements - al->used,
-				al->max_pending_changes - al->pending_changes);
-
-	/* We want all necessary updates for a given request within the same transaction
-	 * We could first check how many updates are *actually* needed,
-	 * and use that instead of the worst-case nr_al_extents */
-	if (available_update_slots < nr_al_extents) {
-		/* Too many activity log extents are currently "hot".
-		 *
-		 * If we have accumulated pending changes already,
-		 * we made progress.
-		 *
-		 * If we cannot get even a single pending change through,
-		 * stop the fast path until we made some progress,
-		 * or requests to "cold" extents could be starved. */
-		if (!al->pending_changes)
-			__set_bit(__LC_STARVING, &device->act_log->flags);
-		return -ENOBUFS;
+	if (i->partially_in_al_next_enr) {
+		D_ASSERT(device, first < i->partially_in_al_next_enr);
+		D_ASSERT(device, last >= i->partially_in_al_next_enr);
+		first = i->partially_in_al_next_enr;
 	}
 
+	D_ASSERT(device, first <= last);
+
 	/* Is resync active in this area? */
 	for (enr = first; enr <= last; enr++) {
 		struct lc_element *tmp;
@@ -529,14 +511,21 @@ int drbd_al_begin_io_nonblock(struct drbd_device *device, struct drbd_interval *
 		}
 	}
 
-	/* Checkout the refcounts.
-	 * Given that we checked for available elements and update slots above,
-	 * this has to be successful. */
+	/* Try to checkout the refcounts. */
 	for (enr = first; enr <= last; enr++) {
 		struct lc_element *al_ext;
 		al_ext = lc_get_cumulative(device->act_log, enr);
-		if (!al_ext)
-			drbd_info(device, "LOGIC BUG for enr=%u\n", enr);
+
+		if (!al_ext) {
+			/* Did not work. We may have exhausted the possible
+			 * changes per transaction. Or raced with someone
+			 * "locking" it against changes.
+			 * Remember where to continue from.
+			 */
+			if (enr > first)
+				i->partially_in_al_next_enr = enr;
+			return -ENOBUFS;
+		}
 	}
 	return 0;
 }
@@ -556,7 +545,11 @@ void drbd_al_complete_io(struct drbd_device *device, struct drbd_interval *i)
 
 	for (enr = first; enr <= last; enr++) {
 		extent = lc_find(device->act_log, enr);
-		if (!extent) {
+		/* Yes, this masks a bug elsewhere.  However, during normal
+		 * operation this is harmless, so no need to crash the kernel
+		 * by the BUG_ON(refcount == 0) in lc_put().
+		 */
+		if (!extent || extent->refcnt == 0) {
 			drbd_err(device, "al_complete_io() called on inactive extent %u\n", enr);
 			continue;
 		}
diff --git a/drivers/block/drbd/drbd_interval.h b/drivers/block/drbd/drbd_interval.h
index 366489b72fe9..5d3213b81eed 100644
--- a/drivers/block/drbd/drbd_interval.h
+++ b/drivers/block/drbd/drbd_interval.h
@@ -8,12 +8,15 @@
 struct drbd_interval {
 	struct rb_node rb;
 	sector_t sector;		/* start sector of the interval */
-	unsigned int size;		/* size in bytes */
 	sector_t end;			/* highest interval end in subtree */
+	unsigned int size;		/* size in bytes */
 	unsigned int local:1		/* local or remote request? */;
 	unsigned int waiting:1;		/* someone is waiting for completion */
 	unsigned int completed:1;	/* this has been completed already;
 					 * ignore for conflict detection */
+
+	/* to resume a partially successful drbd_al_begin_io_nonblock(); */
+	unsigned int partially_in_al_next_enr;
 };
 
 static inline void drbd_clear_interval(struct drbd_interval *i)

base-commit: 72f4d6fca699a1e35b39c5e5dacac2926d254135
-- 
2.52.0

