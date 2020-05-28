Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC461E55E0
	for <lists+drbd-dev@lfdr.de>; Thu, 28 May 2020 07:15:45 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 764694203EB;
	Thu, 28 May 2020 07:15:45 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7088D4203C1
	for <drbd-dev@lists.linbit.com>; Thu, 28 May 2020 07:13:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=VdTXGAkw/1nyL6z33X0b7/NfvqZ5AsGTWmUq3QW34Eo=;
	b=md9DT93wq9CyegwUcnooDejIgt
	3RVXakTiNA+SzeIrMw6+4DfIoJ+SR34khvtM0G9H02BLqFS+21Oay/fY1xfO/BNAbMX9YX6ZJ9hWO
	HN4QpnRRtoAeeZ+0mUNkv/Fm517rEA07bFYZwkt3UAEoqX10gicnfzFlWyAvarrWLRO05HZ19ZhN/
	BffUbssLd+e536sUC0qy2pF1zPh/um59w298wa+F8QGJW9nEcIgT0Sr54+SQbvp8Bwl9dnYD4D11T
	DVeLSJva7v263FiZgzaUOTOpwSYxmel80Pqk5jurDrQmgIRqgjMIHajvQCh9piHDv9NJeUiWnH9Lg
	Vz0Do/eg==;
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeAqc-0001aJ-TK; Thu, 28 May 2020 05:12:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:13 +0200
Message-Id: <20200528051236.620353-6-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 05/28] net: add sock_bindtoindex
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

Add a helper to directly set the SO_BINDTOIFINDEX sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/sock.h        |  1 +
 net/core/sock.c           | 21 +++++++++++++++------
 net/ipv4/udp_tunnel.c     |  4 +---
 net/ipv6/ip6_udp_tunnel.c |  4 +---
 4 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/include/net/sock.h b/include/net/sock.h
index 9a7b9e98685ac..cdec7bc055d5b 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2688,6 +2688,7 @@ static inline bool sk_dev_equal_l3scope(struct sock *sk, int dif)
 
 void sock_def_readable(struct sock *sk);
 
+int sock_bindtoindex(struct sock *sk, int ifindex);
 void sock_no_linger(struct sock *sk);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_reuseaddr(struct sock *sk);
diff --git a/net/core/sock.c b/net/core/sock.c
index d3b1d61e4f768..23f80880fbb2c 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -566,7 +566,7 @@ struct dst_entry *sk_dst_check(struct sock *sk, u32 cookie)
 }
 EXPORT_SYMBOL(sk_dst_check);
 
-static int sock_setbindtodevice_locked(struct sock *sk, int ifindex)
+static int sock_bindtoindex_locked(struct sock *sk, int ifindex)
 {
 	int ret = -ENOPROTOOPT;
 #ifdef CONFIG_NETDEVICES
@@ -594,6 +594,18 @@ static int sock_setbindtodevice_locked(struct sock *sk, int ifindex)
 	return ret;
 }
 
+int sock_bindtoindex(struct sock *sk, int ifindex)
+{
+	int ret;
+
+	lock_sock(sk);
+	ret = sock_bindtoindex_locked(sk, ifindex);
+	release_sock(sk);
+
+	return ret;
+}
+EXPORT_SYMBOL(sock_bindtoindex);
+
 static int sock_setbindtodevice(struct sock *sk, char __user *optval,
 				int optlen)
 {
@@ -634,10 +646,7 @@ static int sock_setbindtodevice(struct sock *sk, char __user *optval,
 			goto out;
 	}
 
-	lock_sock(sk);
-	ret = sock_setbindtodevice_locked(sk, index);
-	release_sock(sk);
-
+	return sock_bindtoindex(sk, index);
 out:
 #endif
 
@@ -1216,7 +1225,7 @@ int sock_setsockopt(struct socket *sock, int level, int optname,
 		break;
 
 	case SO_BINDTOIFINDEX:
-		ret = sock_setbindtodevice_locked(sk, val);
+		ret = sock_bindtoindex_locked(sk, val);
 		break;
 
 	default:
diff --git a/net/ipv4/udp_tunnel.c b/net/ipv4/udp_tunnel.c
index 150e6f0fdbf59..2158e8bddf41c 100644
--- a/net/ipv4/udp_tunnel.c
+++ b/net/ipv4/udp_tunnel.c
@@ -22,9 +22,7 @@ int udp_sock_create4(struct net *net, struct udp_port_cfg *cfg,
 		goto error;
 
 	if (cfg->bind_ifindex) {
-		err = kernel_setsockopt(sock, SOL_SOCKET, SO_BINDTOIFINDEX,
-					(void *)&cfg->bind_ifindex,
-					sizeof(cfg->bind_ifindex));
+		err = sock_bindtoindex(sock->sk, cfg->bind_ifindex);
 		if (err < 0)
 			goto error;
 	}
diff --git a/net/ipv6/ip6_udp_tunnel.c b/net/ipv6/ip6_udp_tunnel.c
index 58956a6b66a21..6523609516d25 100644
--- a/net/ipv6/ip6_udp_tunnel.c
+++ b/net/ipv6/ip6_udp_tunnel.c
@@ -33,9 +33,7 @@ int udp_sock_create6(struct net *net, struct udp_port_cfg *cfg,
 			goto error;
 	}
 	if (cfg->bind_ifindex) {
-		err = kernel_setsockopt(sock, SOL_SOCKET, SO_BINDTOIFINDEX,
-					(void *)&cfg->bind_ifindex,
-					sizeof(cfg->bind_ifindex));
+		err = sock_bindtoindex(sock->sk, cfg->bind_ifindex);
 		if (err < 0)
 			goto error;
 	}
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
