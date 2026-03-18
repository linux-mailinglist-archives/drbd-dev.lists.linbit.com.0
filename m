Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKhmNNeEumnrXQIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 11:56:23 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 77C6D2BA4E4
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 11:56:23 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 507501627BA;
	Wed, 18 Mar 2026 11:56:11 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 420 seconds by postgrey-1.31 at mail19;
	Wed, 18 Mar 2026 11:56:06 CET
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE70D160941
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 11:56:06 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A26060054;
	Wed, 18 Mar 2026 10:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B134FC2BCB2;
	Wed, 18 Mar 2026 10:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773830945;
	bh=rPI1z+CLJKD2kXzKIunBdArVZmP56Ja3EB7Q6RmZlww=;
	h=From:To:Cc:Subject:Date:From;
	b=bJaQhboKRHX5m6x3lAqpDzlsnvr3W82yjDezpBlk/2+FqorFURXJlCQ46Nl3+lN1F
	1MF2E2JeJGYlPZT1RTHdx2tfKIshB3cT6ls0MCJ+j8rJOD3CNtFdZ2k2cdKH7d4GPj
	Qp6uTgmrv3uo0nqRKVKRI43Az0o73TVwoSdJDhWEz/RvBjY+gR8xa36NswlqPW5ia+
	9c0B0PfWYHDJe6ZyQvAsRIkQjsRaA0+NDz1CfW7iNAAL6t6ntgE4TdVg2E9tW9BBxX
	/LKVwdHFT1ZutfRJdyANSQlpwaln1UpG8PTvXvaI6mycJ3s/WQ4j621ZCIRuv2jsUa
	sbI1YX685wcVQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 1/2] drbd: fix rdma dependency
Date: Wed, 18 Mar 2026 11:48:49 +0100
Message-Id: <20260318104858.1868731-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Arnd Bergmann <arnd@arndb.de>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[arnd@kernel.org,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:arnd@arndb.de,m:martin.petersen@oracle.com,m:ebiggers@google.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:ardb@kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.821];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 77C6D2BA4E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Arnd Bergmann <arnd@arndb.de>

The new rdma transport module uses a trick to only build support
if infiniband/rdma is enabled. This seems to be done the wrong way
around, as it gets built if RDMA is in a loadable module, but not
if it's built-in.

However, this fails in configurations that have infiniband support
in a loadable module but drbd built-in:

ERROR: modpost: "rdma_bind_addr" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_listen" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_destroy_id" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_destroy_qp" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_disconnect" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "__rdma_create_kernel_id" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_resolve_route" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_reject" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_accept" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!
ERROR: modpost: "rdma_create_qp" [drivers/block/drbd/drbd_transport_rdma.ko] undefined!

Address this by moving the logic from Makefile into Kconfig and
describing the two conditions in which rdma transport can be used
in drbd.

Fixes: 038cb6e644e4 ("drbd: add RDMA transport implementation")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/block/drbd/Kconfig  | 5 +++++
 drivers/block/drbd/Makefile | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 377f0d040031..29ec6ed84251 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -39,6 +39,11 @@ config BLK_DEV_DRBD
 
 	  If unsure, say N.
 
+config DRBD_TRANSPORT_RDMA
+	tristate
+	depends on RDMA=y || (BLK_DEV_DRBD=RDMA)
+	default BLK_DEV_DRBD
+
 config DRBD_FAULT_INJECTION
 	bool "DRBD fault injection"
 	depends on BLK_DEV_DRBD
diff --git a/drivers/block/drbd/Makefile b/drivers/block/drbd/Makefile
index 99a1cfeed423..caf888235d53 100644
--- a/drivers/block/drbd/Makefile
+++ b/drivers/block/drbd/Makefile
@@ -13,4 +13,4 @@ obj-$(CONFIG_BLK_DEV_DRBD)     += drbd.o
 
 obj-$(CONFIG_BLK_DEV_DRBD)     += drbd_transport_tcp.o
 obj-$(CONFIG_BLK_DEV_DRBD)     += drbd_transport_lb-tcp.o
-obj-$(if $(CONFIG_BLK_DEV_DRBD),$(if $(CONFIG_INFINIBAND),m)) += drbd_transport_rdma.o
+obj-$(CONFIG_DRBD_TRANSPORT_RDMA) += drbd_transport_rdma.o
-- 
2.39.5

