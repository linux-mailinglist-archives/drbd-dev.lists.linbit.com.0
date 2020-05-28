Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6FA1E56A7
	for <lists+drbd-dev@lfdr.de>; Thu, 28 May 2020 07:41:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4123A4203F0;
	Thu, 28 May 2020 07:41:13 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 055624203C9
	for <drbd-dev@lists.linbit.com>; Thu, 28 May 2020 07:39:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=1p3cd+gWSJpx0kr+QTwgr/Rfd2wUwT7HTc1b3QOXmAk=;
	b=actGpQKrGmLduRlAPittX5HMiS
	grFUGQ9E7KErmFMkBTMTODl3drMsnL9k6lLNdxpTO1IoaA4WEfi0E+logisRNY9JwnSyI8GQQLdwE
	METiRzK3a7FUKrgC4OFAGbDknOACaP/K6CHMdu4DroXfmgLQ3ASU0m+XMcGtgC54AQX9YORjcoGjA
	09mXFqNaK9fqyGfAETNx5k+yHccZB+YfGOAFaF4N/WHyMGC5imST+LclhRY0WXJ1yngJtMu3HPRYu
	PkuHeTI9nptn22KpOaVKo22bgVtdygyHspgZPDPmoJBwEiIuotljIMAw9fb8esDI1HNZeU6ywppf9
	LJVmte6w==;
Received: from p4fdb1ad2.dip0.t-ipconnect.de ([79.219.26.210] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat
	Linux)) id 1jeArk-0002bM-Ar; Thu, 28 May 2020 05:14:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Thu, 28 May 2020 07:12:34 +0200
Message-Id: <20200528051236.620353-27-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 26/28] ipv6: add ip6_sock_set_recvpktinfo
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

Add a helper to directly set the IPV6_RECVPKTINFO sockopt from kernel
space without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/ipv6.h   |  7 +++++++
 net/sunrpc/svcsock.c | 10 ++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/include/net/ipv6.h b/include/net/ipv6.h
index 9a90759830162..5e65bf2fd32d0 100644
--- a/include/net/ipv6.h
+++ b/include/net/ipv6.h
@@ -1262,4 +1262,11 @@ static inline int ip6_sock_set_addr_preferences(struct sock *sk, bool val)
 	return ret;
 }
 
+static inline void ip6_sock_set_recvpktinfo(struct sock *sk)
+{
+	lock_sock(sk);
+	inet6_sk(sk)->rxopt.bits.rxinfo = true;
+	release_sock(sk);
+}
+
 #endif /* _NET_IPV6_H */
diff --git a/net/sunrpc/svcsock.c b/net/sunrpc/svcsock.c
index a391892977cd2..e7a0037d9b56c 100644
--- a/net/sunrpc/svcsock.c
+++ b/net/sunrpc/svcsock.c
@@ -595,8 +595,6 @@ static struct svc_xprt_class svc_udp_class = {
 
 static void svc_udp_init(struct svc_sock *svsk, struct svc_serv *serv)
 {
-	int err, level, optname, one = 1;
-
 	svc_xprt_init(sock_net(svsk->sk_sock->sk), &svc_udp_class,
 		      &svsk->sk_xprt, serv);
 	clear_bit(XPT_CACHE_AUTH, &svsk->sk_xprt.xpt_flags);
@@ -617,17 +615,13 @@ static void svc_udp_init(struct svc_sock *svsk, struct svc_serv *serv)
 	switch (svsk->sk_sk->sk_family) {
 	case AF_INET:
 		ip_sock_set_pktinfo(svsk->sk_sock->sk);
-		return;
+		break;
 	case AF_INET6:
-		level = SOL_IPV6;
-		optname = IPV6_RECVPKTINFO;
+		ip6_sock_set_recvpktinfo(svsk->sk_sock->sk);
 		break;
 	default:
 		BUG();
 	}
-	err = kernel_setsockopt(svsk->sk_sock, level, optname,
-					(char *)&one, sizeof(one));
-	dprintk("svc: kernel_setsockopt returned %d\n", err);
 }
 
 /*
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
