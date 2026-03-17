Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFPdBubJumkLcAIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:51:02 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id EDE9D2BE9E9
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:51:01 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 555E716310D;
	Wed, 18 Mar 2026 16:49:55 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
	[209.85.128.175])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 504B916276A
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 00:23:22 +0100 (CET)
Received: by mail-yw1-f175.google.com with SMTP id
	00721157ae682-79a46ebe2beso28145787b3.2
	for <drbd-dev@lists.linbit.com>; Tue, 17 Mar 2026 16:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1773789801; x=1774394601;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=1bBa9pDPqbGfhOBwqPMjjiTOMbtTfvieka9d6hhFj70=;
	b=hOBsPdUCprsx5kpgbiZXHYnE9UjA/qCy4geZDiKl/4PBrokYxJ9TZv77lfzIZVx+3E
	3GypOs8KazteqlrZi3O0beMIoRnS2P1OcZQHyGZ5O2MwQQ28JrR6SdwwEuuUNXHdyPQa
	pio48eqNfz2kv6om6ck43YDWWFbq0Tda1dntTL7XqIYlQMWEUVUgdVpvrfrYY4s6l0yF
	UZ3HotSzoFsZkYRmll99dE8FsLLQy1SvrQNvTfvYmLudCE0m7DLYZ5MG7AlIbB1J+zOK
	A8QgydHeUxfTYqqOV+pwuu5vNtdIEoqxgI4BxvuBPYsryKpJRLs+JGC3ks+xJIypzBTb
	nkiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773789801; x=1774394601;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=1bBa9pDPqbGfhOBwqPMjjiTOMbtTfvieka9d6hhFj70=;
	b=VfMXfuLIT8DAuxNBpVdmpYQuONVyyac1pzl2yreKLwJWB3ezifbRhX+IrsI2WVYmeC
	RW15mq/Nx38Y7KgELwIzjzSFUq6SBaPTM78rtp4ydIsjB23iUbks2gsnCDuFxAerknuk
	GJChGAAfHq9sLc6EakuHZdll4AyOe0dGa7lvl/YQ/zrNw1FZ+eW+++/bK5VEr5aX2ErZ
	bg/fL7MIMoGW5R4GeKSG58PLXUlVxhhfUQJFzmV1aiFZOfqCmsX67UhkQ2xKUq3jS/lg
	ISX+F2fQP5vVekN2ufI0gRvSkm2RmsoSjNWJDnjNQq0NlAV+WxzRNpY0meASBT6qTKN0
	b6Pg==
X-Gm-Message-State: AOJu0YycMuhVjFRl6YmZZogSuAZGHDDz5VK8Qj4QcERjtgVK+OLUkT77
	ugCZu228Cz6rNJdmUKV3PI4WiDZmqUElWI04J3BYvWm6ISCfE9HYYk5u
X-Gm-Gg: ATEYQzyMsr7fTNUnEDQk52poqBaISCj1hmzTtwXEwh36f5x6bipK8WtBGWMUdtR31dr
	M2snSUIEhM4p3k94tB5AiKIQgt4+kBGqjozEf6VY5ufgN3rj+l+5KytMZyQ8IVuJWDOWKW3B2D7
	CN0JALhO6JiZhpjOrivRVooVVPy6D1IWBGo/kuCub25LSgh5cdbmg0h5+G5EWgjH7qA3y++zAr2
	qXukeg3PWfriIopv++7kHTpKnrYc/icc7nyee1iCI/6Zowc/otoQRaNwxDOoBIBDzNtDvWM8wM3
	jANbTWhrtjyBvS/oEIGAV6+G3VfKEmrHKX358wJKmAhLdD4mTPNV6O2F9qch8owWZlb3zQ532/m
	yUtouKA28q1d95kdcfsgqvUr00gynqh5HcBJHUUrp4RA/1lwZqaUIKW4vP2/kdmH/9nk2fhjjQf
	fh5SYCu/VumLMdA4GLXchE539CXx4xcLvWvkVaCwCVNWJ2Bf8Hh3tqhhBMu2RpCjUFzWtZ+of+O
	BrTNVaTeZn9XjTaQTpfLJzG
X-Received: by 2002:a05:690c:c1dc:b0:79a:3e2a:7b5e with SMTP id
	00721157ae682-79a71637f2fmr12821057b3.0.1773789801257; 
	Tue, 17 Mar 2026 16:23:21 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::f769])
	by smtp.gmail.com with ESMTPSA id
	00721157ae682-79a715d221dsm6858217b3.37.2026.03.17.16.23.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2026 16:23:21 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 1/4] drbd: Fix out-of-bounds access
Date: Tue, 17 Mar 2026 18:23:15 -0500
Message-ID: <20260317232318.18923-2-ethantidmore06@gmail.com>
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
	NEURAL_HAM(-0.00)[-0.154];
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
X-Rspamd-Queue-Id: EDE9D2BE9E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The array sync_rule_names[] has 22 elements and rule is used to access
this array. The variable rule has the possibility of being index 22
because the condition (rule > ARRAY_SIZE(sync_rule_names)) could
evaluate to 22 > 22 which would be false and then rule would be used to
index sync_rule_names[] which would cause and out-of-bounds bug.

Change condition from (rule > ARRAY_SIZE(sync_rule_names)) to
(rule >= ARRAY_SIZE(sync_rule_names)).

Detected by Smatch:
drivers/block/drbd/drbd_receiver.c:280 drbd_sync_rule_str() error:
buffer overflow 'sync_rule_names' 22 <= 22

Fixes: 851f106c134a3 ("drbd: rework receiver for DRBD 9 transport and protocol")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/block/drbd/drbd_receiver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 06d83b5ffafb..280be2ee7d7e 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -273,7 +273,7 @@ static void drbd_cancel_conflicting_resync_requests(struct drbd_peer_device *pee
 
 static const char *drbd_sync_rule_str(enum sync_rule rule)
 {
-	if (rule < 0 || rule > ARRAY_SIZE(sync_rule_names)) {
+	if (rule < 0 || rule >= ARRAY_SIZE(sync_rule_names)) {
 		WARN_ON(true);
 		return "?";
 	}
-- 
2.53.0

