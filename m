Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 966D81DC09E
	for <lists+drbd-dev@lfdr.de>; Wed, 20 May 2020 22:54:10 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9A3D542042F;
	Wed, 20 May 2020 22:54:09 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9E99042042A
	for <drbd-dev@lists.linbit.com>; Wed, 20 May 2020 22:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=lR78mSGloKOw4Rm59o11Y3p0CvdJlgBCc0uACk8cE6g=;
	b=jtn3jNEE5JKB2rLfC6PmvfXfCK
	hxeycbY7L0KsI6dZFdQOPF/zTctqZgERT1qUejSclpw/Em5BB7WXobICh5/jETDWFMGUO2psK7JBt
	6GzG4XT3cb/VwjwxyhPFaQx0cHwzxNugnGpnIOhQzcoWrZAOufcGMphhLyCsae9yad5p7okpJKGbV
	MUaQ9HmWzKkszOyz3krbemb53bLjSGol/suoI2Zua0PsUfh39Og76MMLxmNzFmamn/1VVSVHfPv+z
	dLeohnc4OgWL6YYFyOTljKkjhfWmweh3jhUUsUB6JoTcocjV2TbpiHGmEHP11TKLF0OiwSak7yirN
	Dt1+y/QQ==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUoX-0002Uf-Ph; Wed, 20 May 2020 19:55:42 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:54:47 +0200
Message-Id: <20200520195509.2215098-12-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 11/33] net: add sock_set_reuseport
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

Add a helper to directly set the SO_REUSEPORT sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/net/sock.h    |  1 +
 net/core/sock.c       |  8 ++++++++
 net/sunrpc/xprtsock.c | 17 +----------------
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/include/net/sock.h b/include/net/sock.h
index c997289aabbf9..d994daa418ec2 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2695,6 +2695,7 @@ void sock_set_keepalive(struct sock *sk);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_rcvbuf(struct sock *sk, int val);
 void sock_set_reuseaddr(struct sock *sk);
+void sock_set_reuseport(struct sock *sk);
 void sock_set_sndtimeo(struct sock *sk, s64 secs);
 
 #endif	/* _SOCK_H */
diff --git a/net/core/sock.c b/net/core/sock.c
index 3c6ebf952e9ad..2ca3425b519c0 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -729,6 +729,14 @@ void sock_set_reuseaddr(struct sock *sk)
 }
 EXPORT_SYMBOL(sock_set_reuseaddr);
 
+void sock_set_reuseport(struct sock *sk)
+{
+	lock_sock(sk);
+	sk->sk_reuseport = true;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_reuseport);
+
 void sock_no_linger(struct sock *sk)
 {
 	lock_sock(sk);
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 30082cd039960..399848c2bcb29 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -1594,21 +1594,6 @@ static int xs_get_random_port(void)
 	return rand + min;
 }
 
-/**
- * xs_set_reuseaddr_port - set the socket's port and address reuse options
- * @sock: socket
- *
- * Note that this function has to be called on all sockets that share the
- * same port, and it must be called before binding.
- */
-static void xs_sock_set_reuseport(struct socket *sock)
-{
-	int opt = 1;
-
-	kernel_setsockopt(sock, SOL_SOCKET, SO_REUSEPORT,
-			(char *)&opt, sizeof(opt));
-}
-
 static unsigned short xs_sock_getport(struct socket *sock)
 {
 	struct sockaddr_storage buf;
@@ -1801,7 +1786,7 @@ static struct socket *xs_create_sock(struct rpc_xprt *xprt,
 	xs_reclassify_socket(family, sock);
 
 	if (reuseport)
-		xs_sock_set_reuseport(sock);
+		sock_set_reuseport(sock->sk);
 
 	err = xs_bind(transport, sock);
 	if (err) {
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
