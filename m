Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9570C1DC052
	for <lists+drbd-dev@lfdr.de>; Wed, 20 May 2020 22:38:28 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 76AF4420434;
	Wed, 20 May 2020 22:38:28 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BC79B420424
	for <drbd-dev@lists.linbit.com>; Wed, 20 May 2020 22:33:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=CohEq7IX/OF1rZJsT6wV2qMWAc/eXczZXke5014yf6k=;
	b=nrnGlUaGYsraCK7qHqu5QoVapF
	roe1qJlfRQCmGPK1gpYBl6EaK5c0DLkyNe93ndr2PvJfoy/fVJivZDBGbnX9GbQfTqdNzL1JFJJhD
	lIXRmsm+gol/kP1NyUsBWael1unXa8wL7cDfudAw/LS3cnVz81sFEHBWJ+S/ISp7Enpm3afSQ095U
	eL20JzkleepZ0fBmXgBJiE1cr1LaD0p2MxYHQ7jggt7Q94F73eyxM14j66efbC7UNdafO13qqsnWi
	i9657gDXAlab2m0XT2NvcEKTCwjl8+C7gP/XBUA2ilxsAIIRjRSspGAt5bgxnSQtOdQcTZV1Jz7Bc
	64V8e1qA==;
Received: from [2001:4bb8:188:1506:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbUoi-0002iL-W4; Wed, 20 May 2020 19:55:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 20 May 2020 21:54:51 +0200
Message-Id: <20200520195509.2215098-16-hch@lst.de>
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
	rds-devel@oss.oracle.com, Sagi Grimberg <sagi@grimberg.me>,
	linux-rdma@vger.kernel.org, cluster-devel@redhat.com,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>, ocfs2-devel@oss.oracle.com
Subject: [Drbd-dev] [PATCH 15/33] tcp: add tcp_sock_set_syncnt
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

Add a helper to directly set the TCP_SYNCNT sockopt from kernel space
without going through a fake uaccess.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Sagi Grimberg <sagi@grimberg.me>
---
 drivers/nvme/host/tcp.c |  9 +--------
 include/linux/tcp.h     |  1 +
 net/ipv4/tcp.c          | 12 ++++++++++++
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
index 4e4a750ecdb97..2872584f52f63 100644
--- a/drivers/nvme/host/tcp.c
+++ b/drivers/nvme/host/tcp.c
@@ -1336,14 +1336,7 @@ static int nvme_tcp_alloc_queue(struct nvme_ctrl *nctrl,
 	}
 
 	/* Single syn retry */
-	opt = 1;
-	ret = kernel_setsockopt(queue->sock, IPPROTO_TCP, TCP_SYNCNT,
-			(char *)&opt, sizeof(opt));
-	if (ret) {
-		dev_err(nctrl->device,
-			"failed to set TCP_SYNCNT sock opt %d\n", ret);
-		goto err_sock;
-	}
+	tcp_sock_set_syncnt(queue->sock->sk, 1);
 
 	/* Set TCP no delay */
 	tcp_sock_set_nodelay(queue->sock->sk);
diff --git a/include/linux/tcp.h b/include/linux/tcp.h
index 2eaf8320b9db0..6aa4ae5ebf3d5 100644
--- a/include/linux/tcp.h
+++ b/include/linux/tcp.h
@@ -500,5 +500,6 @@ int tcp_skb_shift(struct sk_buff *to, struct sk_buff *from, int pcount,
 void tcp_sock_set_cork(struct sock *sk, bool on);
 void tcp_sock_set_nodelay(struct sock *sk);
 void tcp_sock_set_quickack(struct sock *sk, int val);
+int tcp_sock_set_syncnt(struct sock *sk, int val);
 
 #endif	/* _LINUX_TCP_H */
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 27b5e7a4e2ef9..d2c67ae1da07a 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -2881,6 +2881,18 @@ void tcp_sock_set_quickack(struct sock *sk, int val)
 }
 EXPORT_SYMBOL(tcp_sock_set_quickack);
 
+int tcp_sock_set_syncnt(struct sock *sk, int val)
+{
+	if (val < 1 || val > MAX_TCP_SYNCNT)
+		return -EINVAL;
+
+	lock_sock(sk);
+	inet_csk(sk)->icsk_syn_retries = val;
+	release_sock(sk);
+	return 0;
+}
+EXPORT_SYMBOL(tcp_sock_set_syncnt);
+
 /*
  *	Socket option code for TCP.
  */
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
