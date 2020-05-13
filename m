Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BA98A1D079E
	for <lists+drbd-dev@lfdr.de>; Wed, 13 May 2020 08:33:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A756B42042B;
	Wed, 13 May 2020 08:33:04 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 606AD4203EE
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 08:28:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=VriKupxRYsJlL2uxVcilvd0cTKLGSfORdeySMsHEWM0=;
	b=sR5EMxLZAt8B7bA1KxAxjuv6wd
	og2rytl6Jc0A+7hlcV8EXWIPDvh8UgyAUErFODUlIipxvuEJxEu+x0A+pFk4I9pySnf1f6T/pJsTu
	KUB2RdqvTmiJkfhDXGEnvLdf2lvs3k6LXxLu8DoXiOA5hsxN5fm073OAF4CTNSLl0Ep1EftErwAfc
	ruLPqbJ9CiN7AAnc5ZtNGwBAsO1fO1kYiDgavZXz4LAWVgsG1wmLD7Lx1Aqs0ZTJ+3mTtyrj5sjE6
	Cyq8JY7tvf4boI1g+6bKr+ilMXPAkaVbj0N5rx+PLXDX6Fpi6bbyIG6W385vcDxJrl4RMddG0+l3X
	3F/wY21g==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYksL-00054q-LC; Wed, 13 May 2020 06:28:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:43 +0200
Message-Id: <20200513062649.2100053-29-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 28/33] sctp: add sctp_sock_set_nodelay
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

Add a helper to directly set the SCTP_NODELAY sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dlm/lowcomms.c       | 10 ++--------
 include/net/sctp/sctp.h |  1 +
 net/sctp/socket.c       |  8 ++++++++
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index e4939d770df53..6fa45365666a8 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1034,7 +1034,6 @@ static int sctp_bind_addrs(struct connection *con, uint16_t port)
 static void sctp_connect_to_sock(struct connection *con)
 {
 	struct sockaddr_storage daddr;
-	int one = 1;
 	int result;
 	int addr_len;
 	struct socket *sock;
@@ -1081,8 +1080,7 @@ static void sctp_connect_to_sock(struct connection *con)
 	log_print("connecting to %d", con->nodeid);
 
 	/* Turn off Nagle's algorithm */
-	kernel_setsockopt(sock, SOL_SCTP, SCTP_NODELAY, (char *)&one,
-			  sizeof(one));
+	sctp_sock_set_nodelay(sock->sk, true);
 
 	/*
 	 * Make sock->ops->connect() function return in specified time,
@@ -1296,7 +1294,6 @@ static int sctp_listen_for_all(void)
 	struct socket *sock = NULL;
 	int result = -EINVAL;
 	struct connection *con = nodeid2con(0, GFP_NOFS);
-	int one = 1;
 
 	if (!con)
 		return -ENOMEM;
@@ -1311,10 +1308,7 @@ static int sctp_listen_for_all(void)
 	}
 
 	sock_set_rcvbuf(sock->sk, NEEDED_RMEM);
-	result = kernel_setsockopt(sock, SOL_SCTP, SCTP_NODELAY, (char *)&one,
-				   sizeof(one));
-	if (result < 0)
-		log_print("Could not set SCTP NODELAY error %d\n", result);
+	sctp_sock_set_nodelay(sock->sk, true);
 
 	write_lock_bh(&sock->sk->sk_callback_lock);
 	/* Init con struct */
diff --git a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
index f702b14d768ba..b505fa082f254 100644
--- a/include/net/sctp/sctp.h
+++ b/include/net/sctp/sctp.h
@@ -617,5 +617,6 @@ static inline bool sctp_newsk_ready(const struct sock *sk)
 
 int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
 		int addrs_size, int op);
+void sctp_sock_set_nodelay(struct sock *sk, bool val);
 
 #endif /* __net_sctp_h__ */
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 30c981d9f6158..64c395f7a86d5 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -3066,6 +3066,14 @@ static int sctp_setsockopt_nodelay(struct sock *sk, char __user *optval,
 	return 0;
 }
 
+void sctp_sock_set_nodelay(struct sock *sk, bool val)
+{
+	lock_sock(sk);
+	sctp_sk(sk)->nodelay = val;
+	release_sock(sk);
+}
+EXPORT_SYMBOL(sctp_sock_set_nodelay);
+
 /*
  *
  * 7.1.1 SCTP_RTOINFO
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
