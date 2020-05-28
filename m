Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4EC1E56C4
	for <lists+drbd-dev@lfdr.de>; Thu, 28 May 2020 07:41:43 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 73D6D4203F2;
	Thu, 28 May 2020 07:41:43 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 75E264203DE
	for <drbd-dev@lists.linbit.com>; Thu, 28 May 2020 07:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=2/3V+8xW2Dg2wOlgqylSs8i5g7RJAznZxdE6S/5cuLE=;
	b=NXCU2lMQlEDGK4ONn3qpkzAt6r
	4qvuCFPEvDkGTYLbEf6UQd9sNgvQxP4b2fLd5F248U13z/ofck7PQ7tB9ptdEE2LTpx1Xns2H8bWI
	/z4zhy82bvvOLKWtGxpDgVJ5QpqLnWUk64HdblDBm0AtTdsoImcXzZkDiXpB2KdDKgANnVbdxLl1b
	t094b6ujRfgXO5DtXa/bOXDy6sFKmlnriVmvBkzV3a204AXii3N/fCF1q7kCVH635/F49klFj6N0m
	A9YfJm2AmUgwLBNGko+af3oIE9x7KAkJNwEUNt+d80uinZicSAzAgCz7eLN06vCgKdPbqqQqIazAS
	qBY58pJA==;
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeArb-0002VB-At; Thu, 28 May 2020 05:13:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:31 +0200
Message-Id: <20200528051236.620353-24-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 23/28] ipv6: add ip6_sock_set_v6only
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

Add a helper to directly set the IPV6_V6ONLY sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/ipv6.h        | 11 +++++++++++
 net/ipv6/ip6_udp_tunnel.c |  5 +----
 net/sunrpc/svcsock.c      |  6 +-----
 3 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 39a00d3ef5e22..9b91188c9a74c 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1177,4 +1177,15 @@ int ipv6_sock_mc_join_ssm(struct sock *sk, int ifindex,
 			  const struct in6_addr *addr, unsigned int mode);
 int ipv6_sock_mc_drop(struct sock *sk, int ifindex,
 		      const struct in6_addr *addr);
+
+static inline int ip6_sock_set_v6only(struct sock *sk)
+{
+	if (inet_sk(sk)->inet_num)
+		return -EINVAL;
+	lock_sock(sk);
+	sk->sk_ipv6only = true;
+	release_sock(sk);
+	return 0;
+}
+
 #endif /* _NET_IPV6_H */
diff --git a/net/ipv6/ip6_udp_tunnel.c b/net/ipv6/ip6_udp_tunnel.c
index 6523609516d25..2e0ad1bc84a83 100644
--- a/net/ipv6/ip6_udp_tunnel.c
+++ b/net/ipv6/ip6_udp_tunnel.c
@@ -25,10 +25,7 @@ int udp_sock_create6(struct net *net, struct udp_port_cfg *cfg,
 		goto error;
 
 	if (cfg->ipv6_v6only) {
-		int val = 1;
-
-		err = kernel_setsockopt(sock, IPPROTO_IPV6, IPV6_V6ONLY,
-					(char *) &val, sizeof(val));
+		err = ip6_sock_set_v6only(sock->sk);
 		if (err < 0)
 			goto error;
 	}
diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index 7a805d165689c..a391892977cd2 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -1328,7 +1328,6 @@ static struct svc_xprt *svc_create_socket(struct svc_serv *serv,
 	struct sockaddr *newsin = (struct sockaddr *)&addr;
 	int		newlen;
 	int		family;
-	int		val;
 	RPC_IFDEBUG(char buf[RPC_MAX_ADDRBUFLEN]);
 
 	dprintk("svc: svc_create_socket(%s, %d, %s)\n",
@@ -1364,11 +1363,8 @@ static struct svc_xprt *svc_create_socket(struct svc_serv *serv,
 	 * getting requests from IPv4 remotes.  Those should
 	 * be shunted to a PF_INET listener via rpcbind.
 	 */
-	val = 1;
 	if (family == PF_INET6)
-		kernel_setsockopt(sock, SOL_IPV6, IPV6_V6ONLY,
-					(char *)&val, sizeof(val));
-
+		ip6_sock_set_v6only(sock->sk);
 	if (type == SOCK_STREAM)
 		sock->sk->sk_reuse = SK_CAN_REUSE; /* allow address reuse */
 	error = kernel_bind(sock, sin, len);
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
