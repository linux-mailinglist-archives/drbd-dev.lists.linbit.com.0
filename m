Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 395361D08F1
	for <lists+drbd-dev@lfdr.de>; Wed, 13 May 2020 08:49:06 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 268BA42044D;
	Wed, 13 May 2020 08:49:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CCB9342040E
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 08:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=odEF+vTzoFfHyTWWiNQx03JnPVn3vRNfnvB12nAg5Nk=;
	b=PG/AU9++xT2G5osNUthzZMjOV5
	YD9mvVxBmvRuwWjhDEzS1HlmX6UW2BRk7cWWsONeXmB/Ora1iepH3SztYSbXgSubG9aSxZkOUiUQ/
	+XkIBWFG7vogdGPb61Bmxbc9ZeEXUbStn94wRPx26Foe3PAqwLvT/1GM1bkgoShGxFJz+fUfyWepv
	+1MR7mh/o4lqcc7bz/C0KKwVdg2B4odmpQoEep9srwFU05/f+voY0tqbYOZn5a/BNIBJnp6DgJGCK
	z5B9SuygRFDPBsVwwk4TGBIs9WD9IuXBJRqygX3alpzr7mL04ohAISqWKr/MzjT+xBTeZpLlxbZZ9
	OEKidlsw==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYks9-0004sd-8j; Wed, 13 May 2020 06:28:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:39 +0200
Message-Id: <20200513062649.2100053-25-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 24/33] ipv6: add ip6_sock_set_addr_preferences
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

Add a helper to directly set the IPV6_ADD_PREFERENCES sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/ipv6.h       |   1 +
 net/ipv6/ipv6_sockglue.c | 127 +++++++++++++++++++++------------------
 net/sunrpc/xprtsock.c    |   8 ++-
 3 files changed, 75 insertions(+), 61 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 69bc1651aaef8..04b2bc1935054 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1177,5 +1177,6 @@ int ipv6_sock_mc_drop(struct sock *sk, int ifindex,
 
 int ip6_sock_set_v6only(struct sock *sk, bool val);
 void ip6_sock_set_recverr(struct sock *sk, bool val);
+int ip6_sock_set_addr_preferences(struct sock *sk, bool val);
 
 #endif /* _NET_IPV6_H */
diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index 3c67626b6f5a9..c23d42e809d7e 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -157,6 +157,74 @@ void ip6_sock_set_recverr(struct sock *sk, bool val)
 }
 EXPORT_SYMBOL(ip6_sock_set_recverr);
 
+static int __ip6_sock_set_addr_preferences(struct sock *sk, int val)
+{
+	unsigned int pref = 0;
+	unsigned int prefmask = ~0;
+
+	/* check PUBLIC/TMP/PUBTMP_DEFAULT conflicts */
+	switch (val & (IPV6_PREFER_SRC_PUBLIC |
+		       IPV6_PREFER_SRC_TMP |
+		       IPV6_PREFER_SRC_PUBTMP_DEFAULT)) {
+	case IPV6_PREFER_SRC_PUBLIC:
+		pref |= IPV6_PREFER_SRC_PUBLIC;
+		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC |
+			      IPV6_PREFER_SRC_TMP);
+		break;
+	case IPV6_PREFER_SRC_TMP:
+		pref |= IPV6_PREFER_SRC_TMP;
+		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC |
+			      IPV6_PREFER_SRC_TMP);
+		break;
+	case IPV6_PREFER_SRC_PUBTMP_DEFAULT:
+		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC |
+			      IPV6_PREFER_SRC_TMP);
+		break;
+	case 0:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* check HOME/COA conflicts */
+	switch (val & (IPV6_PREFER_SRC_HOME | IPV6_PREFER_SRC_COA)) {
+	case IPV6_PREFER_SRC_HOME:
+		prefmask &= ~IPV6_PREFER_SRC_COA;
+		break;
+	case IPV6_PREFER_SRC_COA:
+		pref |= IPV6_PREFER_SRC_COA;
+		break;
+	case 0:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* check CGA/NONCGA conflicts */
+	switch (val & (IPV6_PREFER_SRC_CGA|IPV6_PREFER_SRC_NONCGA)) {
+	case IPV6_PREFER_SRC_CGA:
+	case IPV6_PREFER_SRC_NONCGA:
+	case 0:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	inet6_sk(sk)->srcprefs = (inet6_sk(sk)->srcprefs & prefmask) | pref;
+	return 0;
+}
+
+int ip6_sock_set_addr_preferences(struct sock *sk, bool val)
+{
+	int ret;
+
+	lock_sock(sk);
+	ret = __ip6_sock_set_addr_preferences(sk, val);
+	release_sock(sk);
+	return ret;
+}
+EXPORT_SYMBOL(ip6_sock_set_addr_preferences);
+
 static int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 		    char __user *optval, unsigned int optlen)
 {
@@ -859,67 +927,10 @@ static int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
 		break;
 
 	case IPV6_ADDR_PREFERENCES:
-	    {
-		unsigned int pref = 0;
-		unsigned int prefmask = ~0;
-
 		if (optlen < sizeof(int))
 			goto e_inval;
-
-		retv = -EINVAL;
-
-		/* check PUBLIC/TMP/PUBTMP_DEFAULT conflicts */
-		switch (val & (IPV6_PREFER_SRC_PUBLIC|
-			       IPV6_PREFER_SRC_TMP|
-			       IPV6_PREFER_SRC_PUBTMP_DEFAULT)) {
-		case IPV6_PREFER_SRC_PUBLIC:
-			pref |= IPV6_PREFER_SRC_PUBLIC;
-			break;
-		case IPV6_PREFER_SRC_TMP:
-			pref |= IPV6_PREFER_SRC_TMP;
-			break;
-		case IPV6_PREFER_SRC_PUBTMP_DEFAULT:
-			break;
-		case 0:
-			goto pref_skip_pubtmp;
-		default:
-			goto e_inval;
-		}
-
-		prefmask &= ~(IPV6_PREFER_SRC_PUBLIC|
-			      IPV6_PREFER_SRC_TMP);
-pref_skip_pubtmp:
-
-		/* check HOME/COA conflicts */
-		switch (val & (IPV6_PREFER_SRC_HOME|IPV6_PREFER_SRC_COA)) {
-		case IPV6_PREFER_SRC_HOME:
-			break;
-		case IPV6_PREFER_SRC_COA:
-			pref |= IPV6_PREFER_SRC_COA;
-		case 0:
-			goto pref_skip_coa;
-		default:
-			goto e_inval;
-		}
-
-		prefmask &= ~IPV6_PREFER_SRC_COA;
-pref_skip_coa:
-
-		/* check CGA/NONCGA conflicts */
-		switch (val & (IPV6_PREFER_SRC_CGA|IPV6_PREFER_SRC_NONCGA)) {
-		case IPV6_PREFER_SRC_CGA:
-		case IPV6_PREFER_SRC_NONCGA:
-		case 0:
-			break;
-		default:
-			goto e_inval;
-		}
-
-		np->srcprefs = (np->srcprefs & prefmask) | pref;
-		retv = 0;
-
+		retv = __ip6_sock_set_addr_preferences(sk, val);
 		break;
-	    }
 	case IPV6_MINHOPCOUNT:
 		if (optlen < sizeof(int))
 			goto e_inval;
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 88aa198456858..7aaf2baf0c393 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2150,7 +2150,6 @@ static int xs_tcp_finish_connecting(struct rpc_xprt *xprt, struct socket *sock)
 
 	if (!transport->inet) {
 		struct sock *sk = sock->sk;
-		unsigned int addr_pref = IPV6_PREFER_SRC_PUBLIC;
 
 		/* Avoid temporary address, they are bad for long-lived
 		 * connections such as NFS mounts.
@@ -2159,8 +2158,11 @@ static int xs_tcp_finish_connecting(struct rpc_xprt *xprt, struct socket *sock)
 		 *    knowledge about the normal duration of connections,
 		 *    MAY override this as appropriate.
 		 */
-		kernel_setsockopt(sock, SOL_IPV6, IPV6_ADDR_PREFERENCES,
-				(char *)&addr_pref, sizeof(addr_pref));
+		if (xs_addr(xprt)->sa_family == PF_INET6 &&
+		    IS_REACHABLE(CONFIG_IPV6)) {
+			ip6_sock_set_addr_preferences(sk,
+				IPV6_PREFER_SRC_PUBLIC);
+		}
 
 		xs_tcp_set_socket_timeouts(xprt, sock);
 
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
