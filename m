Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAiIEgbKDGrAlwUAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 19 May 2026 22:37:26 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id E83F5584C59
	for <lists+drbd-dev@lfdr.de>; Tue, 19 May 2026 22:37:25 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8F7CD163174;
	Tue, 19 May 2026 22:37:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 361 seconds by postgrey-1.31 at mail19;
	Tue, 19 May 2026 22:37:03 CEST
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A9ED91627B0
	for <drbd-dev@lists.linbit.com>; Tue, 19 May 2026 22:37:03 +0200 (CEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02F3260233;
	Tue, 19 May 2026 20:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE4641F000E9;
	Tue, 19 May 2026 20:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779222661;
	bh=ymV87WQu6SLHGYf9DY+7rf3qagjVFA0MccVv8lf/a0o=;
	h=From:To:Cc:Subject:Date;
	b=lksJY6WtjsZUHhEfl/IzdHRwWaka6Vi5OnC+E/2aL+TtNMKxMZzJGJUshjQspft05
	Wv9+Ynhn6s1RAgJ6QN90pyoSE9+yCFkijMgouFTNuNfQGsc2s2XZonrNUngruKUM4N
	ulSUivfz1HWbY0vfIzerd5SqmC2VAcYDG2WrSxLTt2LBFjJoLJN8e8JxeIe1zUs/nE
	jsoDxz78tA5y4CTKTN8weeRUXsWzMKQqFCRvvDayMiNtU5OyBDDYq9TlKMzC74NkSc
	KRAu2ccM/YswgKyHbyiEuXoevVT3zMXpQP1wn8GfCaXQmWTMxcqtCVpzUVHakAqIWq
	5oQeIdvbWOhrA==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH] drbd: remove unused drbd_nl_mcgrps[] array
Date: Tue, 19 May 2026 22:30:49 +0200
Message-Id: <20260519203057.1340528-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[arnd@kernel.org,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:kuba@kernel.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arnd@arndb.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,drbd-dev-bounces@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.516];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email]
X-Rspamd-Queue-Id: E83F5584C59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

After the rework, two files have a copy of drbd_nl_mcgrps[], but one
of them has no references:

drivers/block/drbd/drbd_nl_gen.c:641:42: error: 'drbd_nl_mcgrps' defined but not used [-Werror=unused-const-variable=]
  641 | static const struct genl_multicast_group drbd_nl_mcgrps[] = {
      |                                          ^~~~~~~~~~~~~~

At the default warning level, -Wunused-const-variables is turned off,
so this has gone unnoticed.

Remove the extra variable.

Fixes: 8098eeb693c4 ("drbd: replace genl_magic with explicit netlink serialization")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/block/drbd/drbd_nl_gen.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl_gen.c b/drivers/block/drbd/drbd_nl_gen.c
index fb44b948cec8..e133e8415205 100644
--- a/drivers/block/drbd/drbd_nl_gen.c
+++ b/drivers/block/drbd/drbd_nl_gen.c
@@ -638,10 +638,6 @@ const struct genl_split_ops drbd_nl_ops[32] = {
 	},
 };
 
-static const struct genl_multicast_group drbd_nl_mcgrps[] = {
-	[DRBD_NLGRP_EVENTS] = { "events", },
-};
-
 static int __drbd_cfg_context_from_attrs(struct drbd_cfg_context *s,
 		struct nlattr ***ret_nested_attribute_table,
 		struct genl_info *info)
-- 
2.39.5

