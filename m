Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 686691D0784
	for <lists+drbd-dev@lfdr.de>; Wed, 13 May 2020 08:32:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4A18B420428;
	Wed, 13 May 2020 08:32:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 924E74203F6
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 08:28:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=t2+3d1GMUU2gBdyKmy97XR5S00mpHCy5yoItuCa1zGY=;
	b=AnGUZI2WfSEtplEsKif/1o+xBr
	EwZUHPMEJ6jWSrgBiNmJdYUPVwb+jvhZisK8EGPuaO/mX54wLLt9P4ZR4OOg8+f29wNKBTDf+ZvtR
	mBkRKyC7LoK1AJehXOF0Se8IXja1iutw1kSSk5O3dfsb56Tt1awvGAhlZvQbg3PTncpC3lcSEyCOx
	pzwvBvJX7oSjM9LJZ4URrlajmOmKb+7ZOG8qgMsJMoYFMgNkurPlWLjF4MrPa93USxsMDMkdabanv
	iYzBD/b+XoWw0gVDYrAFWHKIXUaoMxyPzyhA4J3Orhc6WeM82PYgGLU41gozvE5be/R2OXfUBuRvU
	/74d/HLA==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYkrw-0004ea-1N; Wed, 13 May 2020 06:27:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:35 +0200
Message-Id: <20200513062649.2100053-21-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 20/33] ipv4: add ip_sock_set_recverr
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

Add a helper to directly set the IP_RECVERR sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/ip.h         |  1 +
 net/ipv4/ip_sockglue.c   | 10 ++++++++++
 net/rxrpc/local_object.c |  8 +-------
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/net/ip.h b/include/net/ip.h
index 1e2feca8630d0..7ab8140b54429 100644
--- a/include/net/ip.h
+++ b/include/net/ip.h
@@ -767,5 +767,6 @@ static inline bool inetdev_valid_mtu(unsigned int mtu)
 
 void ip_sock_set_tos(struct sock *sk, int val);
 void ip_sock_set_freebind(struct sock *sk, bool val);
+void ip_sock_set_recverr(struct sock *sk, bool val);
 
 #endif	/* _IP_H */
diff --git a/net/ipv4/ip_sockglue.c b/net/ipv4/ip_sockglue.c
index 0c40887a817f8..9abecc3195520 100644
--- a/net/ipv4/ip_sockglue.c
+++ b/net/ipv4/ip_sockglue.c
@@ -589,6 +589,16 @@ void ip_sock_set_freebind(struct sock *sk, bool val)
 }
 EXPORT_SYMBOL(ip_sock_set_freebind);
 
+void ip_sock_set_recverr(struct sock *sk, bool val)
+{
+	lock_sock(sk);
+	inet_sk(sk)->recverr = val;
+	if (!val)
+		skb_queue_purge(&sk->sk_error_queue);
+	release_sock(sk);
+}
+EXPORT_SYMBOL(ip_sock_set_recverr);
+
 /*
  *	Socket option code for IP. This is the end of the line after any
  *	TCP,UDP etc options on an IP socket.
diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 562ea36c96b0f..1b87b8a9ff725 100644
--- a/net/rxrpc/local_object.c
+++ b/net/rxrpc/local_object.c
@@ -171,13 +171,7 @@ static int rxrpc_open_socket(struct rxrpc_local *local, struct net *net)
 		/* Fall through */
 	case AF_INET:
 		/* we want to receive ICMP errors */
-		opt = 1;
-		ret = kernel_setsockopt(local->socket, SOL_IP, IP_RECVERR,
-					(char *) &opt, sizeof(opt));
-		if (ret < 0) {
-			_debug("setsockopt failed");
-			goto error;
-		}
+		ip_sock_set_recverr(local->socket->sk, true);
 
 		/* we want to set the don't fragment bit */
 		opt = IP_PMTUDISC_DO;
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
