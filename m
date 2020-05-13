Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F301D0770
	for <lists+drbd-dev@lfdr.de>; Wed, 13 May 2020 08:29:34 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1CEA74203FE;
	Wed, 13 May 2020 08:29:34 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D07F44202F0
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 08:28:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=th0Nfh1pUL22y9EWLURq762FQ1KsWRPJshht6PDdVb4=;
	b=Li4oioZrAkl7eVNe0OZolo/H0+
	jXJlzYMcbgcw0SSmOG5UrfUufvjV85Fh8ah7f5Y4DNuu9g7HEmGTbq3lI9LQslS6ySJIEJ6C5YjG0
	YHNYV+stBuMJOCOqU3+i2Fdta06Ou1t0pk+fePWpEwJOdbOqgmJt40bUWxiXpTkpepFmjuQk0olg2
	iPW+uqIDgt/9grZyZrHseXtiTiut/2MVpIkUqWDRZtuScc9DYqsBkzNRLk0yy6W1wjTe/gdvfO3yg
	6/mKDAbL27MXkQOExJVCjS+Xja/YnNDs6jpGpkinR3jpxDbRFq9i5oizWx9s5KG8oDCWPYG+ff/vr
	mlwjuG8Q==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYkrd-0004NC-HA; Wed, 13 May 2020 06:27:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:29 +0200
Message-Id: <20200513062649.2100053-15-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200513062649.2100053-1-hch@lst.de>
References: <20200513062649.2100053-1-hch@lst.de>
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
	linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
	linux-nfs@vger.kernel.org, Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, ocfs2-devel@oss.oracle.com
Subject: [Drbd-dev] [PATCH 14/33] tcp: add tcp_sock_set_user_timeout
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

Add a helper to directly set the TCP_USER_TIMEOUT sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ocfs2/cluster/tcp.c | 22 ++--------------------
 include/linux/tcp.h    |  1 +
 net/ipv4/tcp.c         |  8 ++++++++
 net/sunrpc/xprtsock.c  |  3 +--
 4 files changed, 12 insertions(+), 22 deletions(-)

diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
index 7936e22e39f34..5776df10d11f9 100644
--- a/fs/ocfs2/cluster/tcp.c
+++ b/fs/ocfs2/cluster/tcp.c
@@ -1441,14 +1441,6 @@ static void o2net_rx_until_empty(struct work_struct *work)
 	sc_put(sc);
 }
 
-static int o2net_set_usertimeout(struct socket *sock)
-{
-	int user_timeout = O2NET_TCP_USER_TIMEOUT;
-
-	return kernel_setsockopt(sock, SOL_TCP, TCP_USER_TIMEOUT,
-				(void *)&user_timeout, sizeof(user_timeout));
-}
-
 static void o2net_initialize_handshake(void)
 {
 	o2net_hand->o2hb_heartbeat_timeout_ms = cpu_to_be32(
@@ -1629,12 +1621,7 @@ static void o2net_start_connect(struct work_struct *work)
 	}
 
 	tcp_sock_set_nodelay(sc->sc_sock->sk, true);
-
-	ret = o2net_set_usertimeout(sock);
-	if (ret) {
-		mlog(ML_ERROR, "set TCP_USER_TIMEOUT failed with %d\n", ret);
-		goto out;
-	}
+	tcp_sock_set_user_timeout(sock->sk, O2NET_TCP_USER_TIMEOUT);
 
 	o2net_register_callbacks(sc->sc_sock->sk, sc);
 
@@ -1821,12 +1808,7 @@ static int o2net_accept_one(struct socket *sock, int *more)
 	new_sock->sk->sk_allocation = GFP_ATOMIC;
 
 	tcp_sock_set_nodelay(new_sock->sk, true);
-
-	ret = o2net_set_usertimeout(new_sock);
-	if (ret) {
-		mlog(ML_ERROR, "set TCP_USER_TIMEOUT failed with %d\n", ret);
-		goto out;
-	}
+	tcp_sock_set_user_timeout(new_sock->sk, O2NET_TCP_USER_TIMEOUT);
 
 	ret = new_sock->ops->getname(new_sock, (struct sockaddr *) &sin, 1);
 	if (ret < 0)
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 77b832acf3398..69c988f84a184 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -498,5 +498,6 @@ void tcp_sock_set_cork(struct sock *sk, bool on);
 void tcp_sock_set_nodelay(struct sock *sk, bool on);
 void tcp_sock_set_quickack(struct sock *sk, int val);
 int tcp_sock_set_syncnt(struct sock *sk, int val);
+void tcp_sock_set_user_timeout(struct sock *sk, u32 val);
 
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 773b5cd366ab7..9a8d062b17a48 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2882,6 +2882,14 @@ int tcp_sock_set_syncnt(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(tcp_sock_set_syncnt);
 
+void tcp_sock_set_user_timeout(struct sock *sk, u32 val)
+{
+	lock_sock(sk);
+	inet_csk(sk)->icsk_user_timeout = val;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(tcp_sock_set_user_timeout);
+
 /*
  *	Socket option code for TCP.
  */
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 3dc2d52371a0e..30d4c4fcd3e38 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2115,8 +2115,7 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 			(char *)&keepcnt, sizeof(keepcnt));
 
 	/* TCP user timeout (see RFC5482) */
-	kernel_setsockopt(sock, SOL_TCP, TCP_USER_TIMEOUT,
-			(char *)&timeo, sizeof(timeo));
+	tcp_sock_set_user_timeout(sock->sk, timeo);
 }
 
 static void xs_tcp_set_connect_timeout(struct rpc_xprt *xprt,
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
