Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB711E56FD
	for <lists+drbd-dev@lfdr.de>; Thu, 28 May 2020 07:48:14 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 061BB4203EB;
	Thu, 28 May 2020 07:48:14 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 392274203C9
	for <drbd-dev@lists.linbit.com>; Thu, 28 May 2020 07:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=HYPIJHzaipXnJhaolqjBrsOCPLOUFa2mAOX5V2S5H8I=;
	b=OngkRCdDFl6ltateudWaoCbpYe
	+KbClzPNxl8UlaUpzDQHP6eSKfHiXIBMG5jXATfvF/wT1O6pZsEHn4+yRebU+UpLPPGiz/jkbcQpA
	mo3oxgqynclXcKXuvkBnfA+E00bzdNT6DiaQmwZ6r8MfD35w6oiXG9eErQKl0RHVOMR/P43lHm1q+
	+qa0bwJflCLyvofJNlwruMzhKzs/bwXW9diBiX6Cnjj/fmZ3iwaYLiQLtynUNv8Req+tHFdI2vfpj
	yddQCilPLHX0kDB47eTXmW3oSPOGE475dD/2yMp4+k1SWVdnfEZ1yjPwAnJLNsa88hmVnIj450en3
	ir1mXRow==;
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeArO-0002KP-BQ; Thu, 28 May 2020 05:13:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:27 +0200
Message-Id: <20200528051236.620353-20-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528051236.620353-1-hch@lst.de>
References: <20200528051236.620353-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	cluster-devel@redhat.com, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-nvme@lists.infradead.org, Jon Maloy <jmaloy@redhat.com>,
	linux-rdma@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, linux-nfs@vger.kernel.org,
	Ying Xue <ying.xue@windriver.com>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	ocfs2-devel@oss.oracle.com, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 19/28] ipv4: add ip_sock_set_freebind
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Add a helper to directly set the IP_FREEBIND sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/target/iscsi/iscsi_target_login.c | 13 +++----------
 include/net/ip.h                          |  1 +
 net/ipv4/ip_sockglue.c                    |  8 ++++++++
 3 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
index b561b07a869a0..85748e3388582 100644
--- a/drivers/target/iscsi/iscsi_target_login.c
+++ b/drivers/target/iscsi/iscsi_target_login.c
@@ -15,6 +15,7 @@
 #include <linux/sched/signal.h>
 #include <linux/idr.h>
 #include <linux/tcp.h>        /* TCP_NODELAY */
+#include <net/ip.h>
 #include <net/ipv6.h>         /* ipv6_addr_v4mapped() */
 #include <scsi/iscsi_proto.h>
 #include <target/target_core_base.h>
@@ -855,7 +856,7 @@ int iscsit_setup_np(
 	struct sockaddr_storage *sockaddr)
 {
 	struct socket *sock = NULL;
-	int backlog = ISCSIT_TCP_BACKLOG, ret, opt = 0, len;
+	int backlog = ISCSIT_TCP_BACKLOG, ret, len;
 
 	switch (np->np_network_transport) {
 	case ISCSI_TCP:
@@ -900,15 +901,7 @@ int iscsit_setup_np(
 	if (np->np_network_transport == ISCSI_TCP)
 		tcp_sock_set_nodelay(sock->sk);
 	sock_set_reuseaddr(sock->sk);
-
-	opt = 1;
-	ret = kernel_setsockopt(sock, IPPROTO_IP, IP_FREEBIND,
-			(char *)&opt, sizeof(opt));
-	if (ret < 0) {
-		pr_err("kernel_setsockopt() for IP_FREEBIND"
-			" failed\n");
-		goto fail;
-	}
+	ip_sock_set_freebind(sock->sk);
 
 	ret = kernel_bind(sock, (struct sockaddr *)&np->np_sockaddr, len);
 	if (ret < 0) {
diff --git a/include/net/ip.h b/include/net/ip.h
index 2fc52e26fa88b..5f5d8226b6abc 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -765,6 +765,7 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
 	return likely(mtu >= IPV4_MIN_MTU);
 }
 
+void ip_sock_set_freebind(struct sock *sk);
 void ip_sock_set_tos(struct sock *sk, int val);
 
 #endif	/* _IP_H */
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index b43a29e11f4a5..767838d2030d8 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -581,6 +581,14 @@ void ip_sock_set_tos(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(ip_sock_set_tos);
 
+void ip_sock_set_freebind(struct sock *sk)
+{
+	lock_sock(sk);
+	inet_sk(sk)->freebind = true;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(ip_sock_set_freebind);
+
 /*
  *	Socket option code for IP. This is the end of the line after any
  *	TCP,UDP etc options on an IP socket.
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
