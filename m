Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oENDJO6EumnrXQIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 11:56:46 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 425E22BA4F4
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 11:56:46 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8EEEE162807;
	Wed, 18 Mar 2026 11:56:39 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C474616225B
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 11:56:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B79CE600AE;
	Wed, 18 Mar 2026 10:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63340C2BC87;
	Wed, 18 Mar 2026 10:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773830967;
	bh=adVL11Bn9sVPglFjef0NJ/axzG5NgUNfhBPEq00X3JE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dxHlKXXyXxFnjQUGEkEwFOH5ywPaeJbF/W8uEBmlK6rbVsQjDjY10PBTn7V0+LER2
	TOfnQi55aAtR5Eghew+pSC7EBGb/xTlXli0ksEUh+dL7SVDWSr+x0ffa9IUXxDYE65
	jzUk5yn5DVTakAARX+IKE1D9PAYl6CuKLbBHPEr4tX1KCma6rfoPQ79ae2fK5shLEw
	t6rG10NP6b0PlCpjsHYizh1f5Xj/8l/hWOaw3NVFZz+ueAe2jjZ7XtvsAw6qHVrxDo
	QgK3DDoH7dnClJ0JB7gBylZGXNSWVsQmy+FJntIJnqaa+eF4OTQzaBciuO1B2QMgeD
	yk958UE6SzY3A==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH 2/2] drbd: select CONFIG_NET_HANDSHAKE
Date: Wed, 18 Mar 2026 11:48:50 +0100
Message-Id: <20260318104858.1868731-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260318104858.1868731-1-arnd@kernel.org>
References: <20260318104858.1868731-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@google.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Simon Horman <horms@kernel.org>,
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
X-Spamd-Result: default: False [3.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[arnd@kernel.org,drbd-dev-bounces@lists.linbit.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:-];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:arnd@arndb.de,m:ebiggers@google.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:horms@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,drbd-dev-bounces@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.841];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns,arndb.de:email]
X-Rspamd-Queue-Id: 425E22BA4F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

The TLS handshake code is optional and has to be enabled for DRBD:

ERROR: modpost: "tls_handshake_cancel" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
ERROR: modpost: "tls_server_hello_x509" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
ERROR: modpost: "tls_client_hello_x509" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
ERROR: modpost: "tls_get_record_type" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!
ERROR: modpost: "tls_alert_recv" [drivers/block/drbd/drbd_transport_tcp.ko] undefined!

Select the option whenever DRBD is eanbled and rework the dependency in
the symbol so it can be selected more easily.

Fixes: fa8ef6960ebd ("drbd: add TCP transport implementation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/block/drbd/Kconfig | 1 +
 net/Kconfig                | 4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 29ec6ed84251..de9e232d6479 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -11,6 +11,7 @@ config BLK_DEV_DRBD
 	depends on PROC_FS && INET
 	select LRU_CACHE
 	select CRC32
+	select NET_HANDSHAKE
 	help
 
 	  NOTE: In order to authenticate connections you have to select
diff --git a/net/Kconfig b/net/Kconfig
index 62266eaf0e95..769880113740 100644
--- a/net/Kconfig
+++ b/net/Kconfig
@@ -92,9 +92,7 @@ source "drivers/dibs/Kconfig"
 source "net/xdp/Kconfig"
 
 config NET_HANDSHAKE
-	bool
-	depends on SUNRPC || NVME_TARGET_TCP || NVME_TCP
-	default y
+	def_bool SUNRPC || NVME_TARGET_TCP || NVME_TCP
 
 config NET_HANDSHAKE_KUNIT_TEST
 	tristate "KUnit tests for the handshake upcall mechanism" if !KUNIT_ALL_TESTS
-- 
2.39.5

