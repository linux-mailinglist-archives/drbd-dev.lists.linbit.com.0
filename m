Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 617C01DC051
	for <lists+drbd-dev@lfdr.de>; Wed, 20 May 2020 22:37:58 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 453B142041A;
	Wed, 20 May 2020 22:37:58 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5DCE6420423
	for <drbd-dev@lists.linbit.com>; Wed, 20 May 2020 22:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=et+g5ZdKD14ecJAaL2pyLZLrEI/7sCh55AG+Ht1xyLs=;
	b=Xh0XW9lcVmOTdBZTOUYWNFWo1S
	uS4fryosiWetGCe9FHXWOD5jbQXuKYBMuJiRReYl/TQSQaFCUZfitbM4t1Fe9VpYKjf0j3LtxySPX
	7u+TtvAwOBUbt5JAE0U7WvtmL+A6AFJu1duuJ7OlvAy7+Aj0HkFXbNfFrP2bcCxGb37QEV4CXwr5K
	Yudb0hWEb3BC0BOx10v0rq5R43GfduxqGU09VRRQA1fEYXIJmzc8IytXOMLgvABUvuKhmVw4Xzufg
	jaD2CNJ+HKpHTD9/1i0V/WpOMy/jOJwxCQOZXNNPEyRzlhTywqi1WwqjGfRWdGPTMVgeFZxn/OQF+
	fCJAu/Pg==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUoo-0002pV-GE; Wed, 20 May 2020 19:55:58 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:54:53 +0200
Message-Id: <20200520195509.2215098-18-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 17/33] tcp: add tcp_sock_set_keepidle
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

Add a helper to directly set the TCP_KEEP_IDLE sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/tcp.h   |  1 +
 net/ipv4/tcp.c        | 49 ++++++++++++++++++++++++++++++-------------
 net/rds/tcp_listen.c  |  5 +----
 net/sunrpc/xprtsock.c |  3 +--
 4 files changed, 37 insertions(+), 21 deletions(-)

diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index de682143efe4d..5724dd84a85ed 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -498,6 +498,7 @@ int tcp_skb_shift(struct sk_buff *to, struct sk_buff *from, int pcount,
 		  int shiftlen);
 
 void tcp_sock_set_cork(struct sock *sk, bool on);
+int tcp_sock_set_keepidle(struct sock *sk, int val);
 void tcp_sock_set_nodelay(struct sock *sk);
 void tcp_sock_set_quickack(struct sock *sk, int val);
 int tcp_sock_set_syncnt(struct sock *sk, int val);
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 0004bd9ae7b0a..bdf0ff9333514 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2901,6 +2901,39 @@ void tcp_sock_set_user_timeout(struct sock *sk, u32 val)
 }
 EXPORT_SYMBOL(tcp_sock_set_user_timeout);
 
+static int __tcp_sock_set_keepidle(struct sock *sk, int val)
+{
+	struct tcp_sock *tp = tcp_sk(sk);
+
+	if (val < 1 || val > MAX_TCP_KEEPIDLE)
+		return -EINVAL;
+
+	tp->keepalive_time = val * HZ;
+	if (sock_flag(sk, SOCK_KEEPOPEN) &&
+	    !((1 << sk->sk_state) & (TCPF_CLOSE | TCPF_LISTEN))) {
+		u32 elapsed = keepalive_time_elapsed(tp);
+
+		if (tp->keepalive_time > elapsed)
+			elapsed = tp->keepalive_time - elapsed;
+		else
+			elapsed = 0;
+		inet_csk_reset_keepalive_timer(sk, elapsed);
+	}
+
+	return 0;
+}
+
+int tcp_sock_set_keepidle(struct sock *sk, int val)
+{
+	int err;
+
+	lock_sock(sk);
+	err = __tcp_sock_set_keepidle(sk, val);
+	release_sock(sk);
+	return err;
+}
+EXPORT_SYMBOL(tcp_sock_set_keepidle);
+
 /*
  *	Socket option code for TCP.
  */
@@ -3070,21 +3103,7 @@ static int do_tcp_setsockopt(struct sock *sk, int level,
 		break;
 
 	case TCP_KEEPIDLE:
-		if (val < 1 || val > MAX_TCP_KEEPIDLE)
-			err = -EINVAL;
-		else {
-			tp->keepalive_time = val * HZ;
-			if (sock_flag(sk, SOCK_KEEPOPEN) &&
-			    !((1 << sk->sk_state) &
-			      (TCPF_CLOSE | TCPF_LISTEN))) {
-				u32 elapsed = keepalive_time_elapsed(tp);
-				if (tp->keepalive_time > elapsed)
-					elapsed = tp->keepalive_time - elapsed;
-				else
-					elapsed = 0;
-				inet_csk_reset_keepalive_timer(sk, elapsed);
-			}
-		}
+		err = __tcp_sock_set_keepidle(sk, val);
 		break;
 	case TCP_KEEPINTVL:
 		if (val < 1 || val > MAX_TCP_KEEPINTVL)
diff --git a/net/rds/tcp_listen.c b/net/rds/tcp_listen.c
index 6f90ea077adcd..79f9adc008114 100644
--- a/net/rds/tcp_listen.c
+++ b/net/rds/tcp_listen.c
@@ -52,10 +52,7 @@ int rds_tcp_keepalive(struct socket *sock)
 	if (ret < 0)
 		goto bail;
 
-	ret = kernel_setsockopt(sock, IPPROTO_TCP, TCP_KEEPIDLE,
-				(char *)&keepidle, sizeof(keepidle));
-	if (ret < 0)
-		goto bail;
+	tcp_sock_set_keepidle(sock->sk, keepidle);
 
 	/* KEEPINTVL is the interval between successive probes. We follow
 	 * the model in xs_tcp_finish_connecting() and re-use keepidle.
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 231fd6162f68d..473290f7c5c0a 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2107,8 +2107,7 @@ static void xs_tcp_set_socket_timeouts(struct rpc_xprt *xprt,
 
 	/* TCP Keepalive options */
 	sock_set_keepalive(sock->sk);
-	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPIDLE,
-			(char *)&keepidle, sizeof(keepidle));
+	tcp_sock_set_keepidle(sock->sk, keepidle);
 	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPINTVL,
 			(char *)&keepidle, sizeof(keepidle));
 	kernel_setsockopt(sock, SOL_TCP, TCP_KEEPCNT,
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
