Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2DD1DC044
	for <lists+drbd-dev@lfdr.de>; Wed, 20 May 2020 22:34:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE489420429;
	Wed, 20 May 2020 22:34:56 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0891442040D
	for <drbd-dev@lists.linbit.com>; Wed, 20 May 2020 22:33:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=C2UtwTbHxpIiFVTn3+BVIr5DIb3IOtjvdGRCiARMuRY=;
	b=a9yPmtIoZ8me04TKN2NcziktFT
	2Dw/CMNHIZaY234CG/upWAqxWywv27mubygEEX95Qx6xT5sEkQNZsceI8CMdRIgmXzn2xFo52si6Q
	FpS282l+dps7bcw50jVBbtecb55sCnUH5r5MSOrPhHOLly+3drr9WwEhz1z9d9a/JZ7LE9k+km7VK
	yuCtCl1GoMniucif+yNfWKW5QDwDgqqQ+K6b+JrVxDTkAyQ1Q252ZZDja+JKgxc0KfS0UVnobGKJh
	s8eST8aPT3jN5xiS/oeVbdaVuxF0Cp0nA9hz+La9C/a04qIujB/DNsFCJ6wBN0TgD0u3JyfDQ7n/m
	22eflI2A==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUoy-0002xc-2U; Wed, 20 May 2020 19:56:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:54:56 +0200
Message-Id: <20200520195509.2215098-21-hch@lst.de>
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
	rds-devel@oss.oracle.com, Sagi Grimberg <sagi@grimberg.me>,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, ocfs2-devel@oss.oracle.com
Subject: [Drbd-dev] [PATCH 20/33] ipv4: add ip_sock_set_tos
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

Add a helper to directly set the IP_TOS sockopt from kernel space without
going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/tcp.c   | 14 +++-----------
 drivers/nvme/target/tcp.c | 10 ++--------
 include/net/ip.h          |  2 ++
 net/ipv4/ip_sockglue.c    | 30 +++++++++++++++++++++---------
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 2872584f52f63..4c972d8abf317 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1313,7 +1313,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 {
 	struct nvme_tcp_ctrl *ctrl = to_tcp_ctrl(nctrl);
 	struct nvme_tcp_queue *queue = &ctrl->queues[qid];
-	int ret, opt, rcv_pdu_size;
+	int ret, rcv_pdu_size;
 
 	queue->ctrl = ctrl;
 	INIT_LIST_HEAD(&queue->send_list);
@@ -1352,16 +1352,8 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 		sock_set_priority(queue->sock->sk, so_priority);
 
 	/* Set socket type of service */
-	if (nctrl->opts->tos >= 0) {
-		opt = nctrl->opts->tos;
-		ret = kernel_setsockopt(queue->sock, SOL_IP, IP_TOS,
-				(char *)&opt, sizeof(opt));
-		if (ret) {
-			dev_err(nctrl->device,
-				"failed to set IP_TOS sock opt %d\n", ret);
-			goto err_sock;
-		}
-	}
+	if (nctrl->opts->tos >= 0)
+		ip_sock_set_tos(queue->sock->sk, nctrl->opts->tos);
 
 	queue->sock->sk->sk_allocation = GFP_ATOMIC;
 	nvme_tcp_set_queue_io_cpu(queue);
diff --git a/drivers/nvme/target/tcp.c b/drivers/nvme/target/tcp.c
index 55bc4c3c0a74a..4546049a96b37 100644
--- a/drivers/nvme/target/tcp.c
+++ b/drivers/nvme/target/tcp.c
@@ -1452,14 +1452,8 @@ static int nvmet_tcp_set_queue_sock(struct nvmet_tcp_queue *queue)
 		sock_set_priority(sock->sk, so_priority);
 
 	/* Set socket type of service */
-	if (inet->rcv_tos > 0) {
-		int tos = inet->rcv_tos;
-
-		ret = kernel_setsockopt(sock, SOL_IP, IP_TOS,
-				(char *)&tos, sizeof(tos));
-		if (ret)
-			return ret;
-	}
+	if (inet->rcv_tos > 0)
+		ip_sock_set_tos(sock->sk, inet->rcv_tos);
 
 	write_lock_bh(&sock->sk->sk_callback_lock);
 	sock->sk->sk_user_data = queue;
diff --git a/include/net/ip.h b/include/net/ip.h
index 5b317c9f4470a..2fc52e26fa88b 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -765,4 +765,6 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
 	return likely(mtu >= IPV4_MIN_MTU);
 }
 
+void ip_sock_set_tos(struct sock *sk, int val);
+
 #endif	/* _IP_H */
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 8206047d70b6b..1733ac78c21aa 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -560,6 +560,26 @@ int ip_recv_error(struct sock *sk, struct msghdr *msg, int len, int *addr_len)
 	return err;
 }
 
+static void __ip_sock_set_tos(struct sock *sk, int val)
+{
+	if (sk->sk_type == SOCK_STREAM) {
+		val &= ~INET_ECN_MASK;
+		val |= inet_sk(sk)->tos & INET_ECN_MASK;
+	}
+	if (inet_sk(sk)->tos != val) {
+		inet_sk(sk)->tos = val;
+		sk->sk_priority = rt_tos2priority(val);
+		sk_dst_reset(sk);
+	}
+}
+
+void ip_sock_set_tos(struct sock *sk, int val)
+{
+	lock_sock(sk);
+	__ip_sock_set_tos(sk, val);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(ip_sock_set_tos);
 
 /*
  *	Socket option code for IP. This is the end of the line after any
@@ -743,15 +763,7 @@ static int do_ip_setsockopt(struct sock *sk, int level,
 			inet->cmsg_flags &= ~IP_CMSG_RECVFRAGSIZE;
 		break;
 	case IP_TOS:	/* This sets both TOS and Precedence */
-		if (sk->sk_type == SOCK_STREAM) {
-			val &= ~INET_ECN_MASK;
-			val |= inet->tos & INET_ECN_MASK;
-		}
-		if (inet->tos != val) {
-			inet->tos = val;
-			sk->sk_priority = rt_tos2priority(val);
-			sk_dst_reset(sk);
-		}
+		__ip_sock_set_tos(sk, val);
 		break;
 	case IP_TTL:
 		if (optlen < 1)
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
