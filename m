Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6925F1D08BB
	for <lists+drbd-dev@lfdr.de>; Wed, 13 May 2020 08:36:36 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4B4A1420441;
	Wed, 13 May 2020 08:36:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5ED02420412
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 08:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=Q3f8maTF2WhcJdVNH6rzm87GRT50d4BxACqMxTxJ4BY=;
	b=cyzDx1uoh8IiQfgqAVcSotVmh6
	uYNpmIDX8eRx1zTp13fHCHimwYLgcArJiLCZgmhnVK9WDg8dXaW6SyzTThxwpKcA3K6fQDAdzMImx
	+3MykN3jaMNTPmD6tdS0//BJDxKVi8Hgtd0lXVPm5HMudbnLuBSnnLKeCf/gO9CHQiMif+stgJjDK
	p1HmNw+EHVn+8Enoh5JEafDugHKOb0+M4kJ/PfQMggv/wfXKkunOR7WL3g2z/Tfo8oIQ61TYVkjA5
	ouDak8sJvnYkyCZ8ATf7S7Dq7i/0BFEd0q/gcxvMbFNvKljzc+GOqukpMF9pp/HS5RB/fDtmU740T
	87t0LOEA==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYkrO-0004A8-Gx; Wed, 13 May 2020 06:27:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:24 +0200
Message-Id: <20200513062649.2100053-10-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 09/33] net: add sock_set_reuseport
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
index e1ed40ff01312..6b8e06947b243 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2688,6 +2688,7 @@ static inline bool sk_dev_equal_l3scope(struct sock *sk, int dif)
 
 void sock_def_readable(struct sock *sk);
 void sock_set_reuseaddr(struct sock *sk, unsigned char reuse);
+void sock_set_reuseport(struct sock *sk, bool reuseport);
 void sock_set_linger(struct sock *sk, bool onoff, unsigned int linger);
 void sock_set_priority(struct sock *sk, u32 priority);
 void sock_set_sndtimeo(struct sock *sk, unsigned int secs);
diff --git a/net/core/sock.c b/net/core/sock.c
index 6af01b757cf24..7f0baf1ccde17 100644
--- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -729,6 +729,14 @@ void sock_set_reuseaddr(struct sock *sk, unsigned char reuse)
 }
 EXPORT_SYMBOL(sock_set_reuseaddr);
 
+void sock_set_reuseport(struct sock *sk, bool reuseport)
+{
+	lock_sock(sk);
+	sk->sk_reuseport = reuseport;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sock_set_reuseport);
+
 static void __sock_set_linger(struct sock *sk, bool onoff, unsigned int linger)
 {
 	if (!onoff) {
diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index bb61d3758be2b..3dc2d52371a0e 100644
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
+		sock_set_reuseport(sock->sk, true);
 
 	err = xs_bind(transport, sock);
 	if (err) {
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
