Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A881E56FC
	for <lists+drbd-dev@lfdr.de>; Thu, 28 May 2020 07:47:43 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 95CEF4203FB;
	Thu, 28 May 2020 07:47:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 96EB04203C9
	for <drbd-dev@lists.linbit.com>; Thu, 28 May 2020 07:42:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=qBnse2shEU3So1CWJwgeKLynW7Isk7mayxyjulMnVC0=;
	b=D31fvomspcxV7eYOOMCBPgoAoL
	sNhiNH4/TqAuGbZwvAaCi+xEoev9O+0/jQ+Yu9X+rwT3QDpyA2zrf5HeMHCMTQHL5wYkr7bIPGLOp
	npQhNi0nY7rPGiVFc1Q5Fr2pwYUHuccoIV0Z6oKR3TjhCw2NiaJn9IVSgPTMGkNkmfG15Bbe0Np5x
	T9PLRh9B7/XT1bTTfcfiN5i2cv0reGjep2NzTVzEmkvWY6Va2T8tuTerE8wolgeMjIpfXiUEH6LRV
	yvv0t7WefpHEVpdhKE3VutTiyfTSpQEKce/LHU/wJ3pNS1VktxTozjYjHF1G7TKtFytzaKMd1eMir
	ku1K+Ogw==;
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeAqv-0001rY-8T; Thu, 28 May 2020 05:13:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:18 +0200
Message-Id: <20200528051236.620353-11-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 10/28] tcp: add tcp_sock_set_cork
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

Add a helper to directly set the TCP_CORK sockopt from kernel space
without going through a fake uaccess.  Cleanup the callers to avoid
pointless wrappers now that this is a simple function call.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_int.h      | 14 --------
 drivers/block/drbd/drbd_receiver.c |  4 +--
 drivers/block/drbd/drbd_worker.c   |  6 ++--
 fs/cifs/transport.c                |  8 ++---
 include/linux/tcp.h                |  2 ++
 net/ipv4/tcp.c                     | 51 +++++++++++++++++++-----------
 net/rds/tcp_send.c                 |  9 ++----
 7 files changed, 43 insertions(+), 51 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index aae99a2d7bd40..3550adc93c68b 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -1570,20 +1570,6 @@ extern void drbd_set_recv_tcq(struct drbd_device *device, int tcq_enabled);
 extern void _drbd_clear_done_ee(struct drbd_device *device, struct list_head *to_be_freed);
 extern int drbd_connected(struct drbd_peer_device *);
 
-static inline void drbd_tcp_cork(struct socket *sock)
-{
-	int val = 1;
-	(void) kernel_setsockopt(sock, SOL_TCP, TCP_CORK,
-			(char*)&val, sizeof(val));
-}
-
-static inline void drbd_tcp_uncork(struct socket *sock)
-{
-	int val = 0;
-	(void) kernel_setsockopt(sock, SOL_TCP, TCP_CORK,
-			(char*)&val, sizeof(val));
-}
-
 static inline void drbd_tcp_nodelay(struct socket *sock)
 {
 	int val = 1;
diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index c15e7083b13a6..55ea907ad33cb 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -6162,7 +6162,7 @@ void drbd_send_acks_wf(struct work_struct *ws)
 	rcu_read_unlock();
 
 	if (tcp_cork)
-		drbd_tcp_cork(connection->meta.socket);
+		tcp_sock_set_cork(connection->meta.socket->sk, true);
 
 	err = drbd_finish_peer_reqs(device);
 	kref_put(&device->kref, drbd_destroy_device);
@@ -6175,7 +6175,7 @@ void drbd_send_acks_wf(struct work_struct *ws)
 	}
 
 	if (tcp_cork)
-		drbd_tcp_uncork(connection->meta.socket);
+		tcp_sock_set_cork(connection->meta.socket->sk, false);
 
 	return;
 }
diff --git a/drivers/block/drbd/drbd_worker.c b/drivers/block/drbd/drbd_worker.c
index 0dc019da1f8d0..2b89c9f2ca707 100644
--- a/drivers/block/drbd/drbd_worker.c
+++ b/drivers/block/drbd/drbd_worker.c
@@ -2098,7 +2098,7 @@ static void wait_for_work(struct drbd_connection *connection, struct list_head *
 	if (uncork) {
 		mutex_lock(&connection->data.mutex);
 		if (connection->data.socket)
-			drbd_tcp_uncork(connection->data.socket);
+			tcp_sock_set_cork(connection->data.socket->sk, false);
 		mutex_unlock(&connection->data.mutex);
 	}
 
@@ -2153,9 +2153,9 @@ static void wait_for_work(struct drbd_connection *connection, struct list_head *
 	mutex_lock(&connection->data.mutex);
 	if (connection->data.socket) {
 		if (cork)
-			drbd_tcp_cork(connection->data.socket);
+			tcp_sock_set_cork(connection->data.socket->sk, true);
 		else if (!uncork)
-			drbd_tcp_uncork(connection->data.socket);
+			tcp_sock_set_cork(connection->data.socket->sk, false);
 	}
 	mutex_unlock(&connection->data.mutex);
 }
diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
index c97570eb2c180..99760063e0006 100644
--- a/fs/cifs/transport.c
+++ b/fs/cifs/transport.c
@@ -325,7 +325,6 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	size_t total_len = 0, sent, size;
 	struct socket *ssocket = server->ssocket;
 	struct msghdr smb_msg;
-	int val = 1;
 	__be32 rfc1002_marker;
 
 	if (cifs_rdma_enabled(server)) {
@@ -345,8 +344,7 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	}
 
 	/* cork the socket */
-	kernel_setsockopt(ssocket, SOL_TCP, TCP_CORK,
-				(char *)&val, sizeof(val));
+	tcp_sock_set_cork(ssocket->sk, true);
 
 	for (j = 0; j < num_rqst; j++)
 		send_length += smb_rqst_len(server, &rqst[j]);
@@ -435,9 +433,7 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	}
 
 	/* uncork it */
-	val = 0;
-	kernel_setsockopt(ssocket, SOL_TCP, TCP_CORK,
-				(char *)&val, sizeof(val));
+	tcp_sock_set_cork(ssocket->sk, false);
 
 	if ((total_len > 0) && (total_len != send_length)) {
 		cifs_dbg(FYI, "partial send (wanted=%u sent=%zu): terminating session\n",
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index bf44e85d709dc..889eeb2256c2d 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -497,4 +497,6 @@ static inline u16 tcp_mss_clamp(const struct tcp_sock *tp, u16 mss)
 int tcp_skb_shift(struct sk_buff *to, struct sk_buff *from, int pcount,
 		  int shiftlen);
 
+void tcp_sock_set_cork(struct sock *sk, bool on);
+
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 9700649963773..e6cf702e16d66 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2801,6 +2801,37 @@ static void tcp_enable_tx_delay(void)
 	}
 }
 
+/* When set indicates to always queue non-full frames.  Later the user clears
+ * this option and we transmit any pending partial frames in the queue.  This is
+ * meant to be used alongside sendfile() to get properly filled frames when the
+ * user (for example) must write out headers with a write() call first and then
+ * use sendfile to send out the data parts.
+ *
+ * TCP_CORK can be set together with TCP_NODELAY and it is stronger than
+ * TCP_NODELAY.
+ */
+static void __tcp_sock_set_cork(struct sock *sk, bool on)
+{
+	struct tcp_sock *tp = tcp_sk(sk);
+
+	if (on) {
+		tp->nonagle |= TCP_NAGLE_CORK;
+	} else {
+		tp->nonagle &= ~TCP_NAGLE_CORK;
+		if (tp->nonagle & TCP_NAGLE_OFF)
+			tp->nonagle |= TCP_NAGLE_PUSH;
+		tcp_push_pending_frames(sk);
+	}
+}
+
+void tcp_sock_set_cork(struct sock *sk, bool on)
+{
+	lock_sock(sk);
+	__tcp_sock_set_cork(sk, on);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(tcp_sock_set_cork);
+
 /*
  *	Socket option code for TCP.
  */
@@ -2979,25 +3010,7 @@ static int do_tcp_setsockopt(struct sock *sk, int level,
 		break;
 
 	case TCP_CORK:
-		/* When set indicates to always queue non-full frames.
-		 * Later the user clears this option and we transmit
-		 * any pending partial frames in the queue.  This is
-		 * meant to be used alongside sendfile() to get properly
-		 * filled frames when the user (for example) must write
-		 * out headers with a write() call first and then use
-		 * sendfile to send out the data parts.
-		 *
-		 * TCP_CORK can be set together with TCP_NODELAY and it is
-		 * stronger than TCP_NODELAY.
-		 */
-		if (val) {
-			tp->nonagle |= TCP_NAGLE_CORK;
-		} else {
-			tp->nonagle &= ~TCP_NAGLE_CORK;
-			if (tp->nonagle&TCP_NAGLE_OFF)
-				tp->nonagle |= TCP_NAGLE_PUSH;
-			tcp_push_pending_frames(sk);
-		}
+		__tcp_sock_set_cork(sk, val);
 		break;
 
 	case TCP_KEEPIDLE:
diff --git a/net/rds/tcp_send.c b/net/rds/tcp_send.c
index 78a2554a44979..8c4d1d6e9249d 100644
--- a/net/rds/tcp_send.c
+++ b/net/rds/tcp_send.c
@@ -38,23 +38,18 @@
 #include "rds.h"
 #include "tcp.h"
 
-static void rds_tcp_cork(struct socket *sock, int val)
-{
-	kernel_setsockopt(sock, SOL_TCP, TCP_CORK, (void *)&val, sizeof(val));
-}
-
 void rds_tcp_xmit_path_prepare(struct rds_conn_path *cp)
 {
 	struct rds_tcp_connection *tc = cp->cp_transport_data;
 
-	rds_tcp_cork(tc->t_sock, 1);
+	tcp_sock_set_cork(tc->t_sock->sk, true);
 }
 
 void rds_tcp_xmit_path_complete(struct rds_conn_path *cp)
 {
 	struct rds_tcp_connection *tc = cp->cp_transport_data;
 
-	rds_tcp_cork(tc->t_sock, 0);
+	tcp_sock_set_cork(tc->t_sock->sk, false);
 }
 
 /* the core send_sem serializes this with other xmit and shutdown */
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
