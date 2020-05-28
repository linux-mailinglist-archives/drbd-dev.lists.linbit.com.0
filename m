Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E121E569B
	for <lists+drbd-dev@lfdr.de>; Thu, 28 May 2020 07:39:14 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3A3E64203D7;
	Thu, 28 May 2020 07:39:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 92633420383
	for <drbd-dev@lists.linbit.com>; Thu, 28 May 2020 07:39:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=ArfUN0byB3Uq+uJrbTK/3I3YkF2OfRio3Yy2O4aNtms=;
	b=UaviI5C9wMtc9Cj3+spf+9ZU69
	mrryeoJ0Z24pMECma7sLfjamDNtvTIZHcvRX6hhmdhbV1gPc+qbf3wfcc8w7DtqWITfpHph9PYzLn
	5ymVNaMWfn/XGub0CLh14e5L7USg2ZvzywnFuqkJwY3+3argGWy/9U9NDdYSnF46EhcCoKD+1B/Tv
	7mKVIbG8oCz3QPehKktSh5Dkz3kvNspUdWuOTFhjLBkPfY5eJWpoj/IpcXEAmJPN5hWqWXzjWChn2
	bGti+9Kq0PXPHviBYkG9jPARS5FbNooLqsUGcj9stkvGpjNl8u7q5HHk56NUt3VWkyncMBkoIJLPW
	7G/1PxuQ==;
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeArh-0002Z7-IZ; Thu, 28 May 2020 05:14:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:33 +0200
Message-Id: <20200528051236.620353-26-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 25/28] ipv6: add ip6_sock_set_addr_preferences
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
 include/net/ipv6.h       | 67 ++++++++++++++++++++++++++++++++++++++++
 net/ipv6/ipv6_sockglue.c | 59 +----------------------------------
 net/sunrpc/xprtsock.c    |  7 +++--
 3 files changed, 72 insertions(+), 61 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 49c4abf991489..9a90759830162 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1195,4 +1195,71 @@ static inline void ip6_sock_set_recverr(struct sock *sk)
 	release_sock(sk);
 }
 
+static inline int __ip6_sock_set_addr_preferences(struct sock *sk, int val)
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
+static inline int ip6_sock_set_addr_preferences(struct sock *sk, bool val)
+{
+	int ret;
+
+	lock_sock(sk);
+	ret = __ip6_sock_set_addr_preferences(sk, val);
+	release_sock(sk);
+	return ret;
+}
+
 #endif /* _NET_IPV6_H */
diff --git a/net/ipv6/ipv6_sockglue.c b/net/ipv6/ipv6_sockglue.c
index e10258c2210e8..adbfed6adf11c 100644
--- a/net/ipv6/ipv6_sockglue.c
+++ b/net/ipv6/ipv6_sockglue.c
@@ -845,67 +845,10 @@ static int do_ipv6_setsockopt(struct sock *sk, int level, int optname,
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
index 0d3ec055bc12f..3a143e250b9ac 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -2150,7 +2150,6 @@ static int xs_tcp_finish_connecting(struct rpc_xprt *xprt, struct socket *sock)
 
 	if (!transport->inet) {
 		struct sock *sk = sock->sk;
-		unsigned int addr_pref = IPV6_PREFER_SRC_PUBLIC;
 
 		/* Avoid temporary address, they are bad for long-lived
 		 * connections such as NFS mounts.
@@ -2159,8 +2158,10 @@ static int xs_tcp_finish_connecting(struct rpc_xprt *xprt, struct socket *sock)
 		 *    knowledge about the normal duration of connections,
 		 *    MAY override this as appropriate.
 		 */
-		kernel_setsockopt(sock, SOL_IPV6, IPV6_ADDR_PREFERENCES,
-				(char *)&addr_pref, sizeof(addr_pref));
+		if (xs_addr(xprt)->sa_family == PF_INET6) {
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
