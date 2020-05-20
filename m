Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9553A1DBF60
	for <lists+drbd-dev@lfdr.de>; Wed, 20 May 2020 22:00:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 689C0420416;
	Wed, 20 May 2020 22:00:32 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A52F84203F3
	for <drbd-dev@lists.linbit.com>; Wed, 20 May 2020 21:56:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=OW2uCMeCAECvL0mFP+aIowjmR1Y37DbY3NyDlODlSU4=;
	b=UA6PaKxV+xIcFMzHF3iPOdbLeU
	ll4bvIiCxtw/t4xg1wCqEMfLPQD5jz3Muxml4cdmm21Z8D6ygA4AXn+b4rEqQvINBPpnMkd96/H9F
	sM9gOTkeFdj8RfQ3r43LJanFWwnzw248TJMIgy6oA9N3wNsXRb4xcK+tWQWjU9VrkkexCYh2d+dMf
	R1LSv7oyBPpV2HEXkjP7qdEW+XSSrJcXS7As302dfN6tvk+1Gcr6oJz4Jc2BaPTBsRaHFI/V39JdU
	au3Bp5KZ3Nm+xgT1tU5pvQLnUKN1o2Dmz49w76h2UICPK6ZTE95j1SXuVkVlYi+oc6as+vDhsm0h2
	02xMUuIg==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUoS-0002L3-E8; Wed, 20 May 2020 19:55:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:54:45 +0200
Message-Id: <20200520195509.2215098-10-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200520195509.2215098-1-hch@lst.de>
References: <20200520195509.2215098-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	linux-nvme@lists.infradead.org, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, ocfs2-devel@oss.oracle.com
Subject: [Drbd-dev] [PATCH 09/33] net: add sock_set_keepalive
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

Add a helper to directly set the SO_KEEPALIVE sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dlm/lowcomms.c     |  6 +-----
 include/net/sock.h    |  1 +
 net/core/sock.c       | 10 ++++++++++
 net/rds/tcp_listen.c  |  6 +-----
 net/sunrpc/xprtsock.c |  4 +---
 5 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b79711d0aac72..b6e6dba281547 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1142,11 +1142,7 @@ static struct socket *tcp_create_listen_sock(struct connection *con,
 		con->sock = NULL;
 		goto create_out;
 	}
-	result = kernel_setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
-				 (char *)&one, sizeof(one));
-	if (result < 0) {
-		log_print("Set keepalive failed: %d", result);
-	}
+	sock_set_keepalive(sock->sk);
 
 	result = sock->ops->listen(sock, 5);
 	if (result < 0) {
diff --git a/include/net/sock.h b/include/net/sock.h
index 99ef43508d2b5..dc08c176238fd 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2691,6 +2691,7 @@ void sock_def_readable(struct sock *sk);
 int sock_bindtoindex(struct sock *sk, int ifindex);
 void sock_enable_timestamps(struct sock *sk);
 void sock_no_linger(struct sock *sk);
+void sock_set_keepalive(struct sock *sk);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_reuseaddr(struct sock *sk);
 void sock_set_sndtimeo(struct sock *sk, s64 secs);
diff --git a/net/core/sock.c b/net/core/sock.c
index e4a4dd2b3d8b3..728f5fb156a0c 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -779,6 +779,16 @@ void sock_enable_timestamps(struct sock *sk)
 }
 EXPORT_SYMBOL(sock_enable_timestamps);
 
+void sock_set_keepalive(struct sock *sk)
+{
+	lock_sock(sk);
+	if (sk->sk_prot->keepalive)
+		sk->sk_prot->keepalive(sk, true);
+	sock_valbool_flag(sk, SOCK_KEEPOPEN, true);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_keepalive);
+
 /*
  *	This is meant for all protocols to use and covers goings on
  *	at the socket level. Everything here is generic.
diff --git a/net/rds/tcp_listen.c b/net/rds/tcp_listen.c
index bbb31b9c0b391..d8bd132769594 100644
--- a/net/rds/tcp_listen.c
+++ b/net/rds/tcp_listen.c
@@ -43,13 +43,9 @@ int rds_tcp_keepalive(struct socket *sock)
 	/* values below based on xs_udp_default_timeout */
 	int keepidle = 5; /* send a probe 'keepidle' secs after last data */
 	int keepcnt = 5; /* number of unack'ed probes before declaring dead */
-	int keepalive = 1;
 	int ret = 0;
 
-	ret = kernel_setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
-				(char *)&keepalive, sizeof(keepalive));
-	if (ret < 0)
-		goto bail;
+	sock_set_keepalive(sock->sk);
 
 	ret = kernel_setsockopt(sock, IPPROTO_TCP, TCP_KEEPCNT,
 				(char *)&keepcnt, sizeof(keepcnt));
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 845d0be805ece..30082cd039960 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2110,7 +2110,6 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 	struct sock_xprt *transport = container_of(xprt, struct sock_xprt, xprt);
 	unsigned int keepidle;
 	unsigned int keepcnt;
-	unsigned int opt_on = 1;
 	unsigned int timeo;
 
 	spin_lock(&xprt->transport_lock);
@@ -2122,8 +2121,7 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 	spin_unlock(&xprt->transport_lock);
 
 	/* TCP Keepalive options */
-	kernel_setsockopt(sock, SOL_SOCKET, SO_KEEPALIVE,
-			(char *)&opt_on, sizeof(opt_on));
+	sock_set_keepalive(sock->sk);
 	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPIDLE,
 			(char *)&keepidle, sizeof(keepidle));
 	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPINTVL,
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
