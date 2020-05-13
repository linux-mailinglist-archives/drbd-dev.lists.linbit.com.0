Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD1A1D08EE
	for <lists+drbd-dev@lfdr.de>; Wed, 13 May 2020 08:48:37 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E7EB8420443;
	Wed, 13 May 2020 08:48:36 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7489D420404
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 08:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=5TSZ8ysmfXzR1IyTmnCaDhVaLMJELOeh31MTPRTaaRg=;
	b=bg0Uo11GWZx6GNXGrHbkE3nXm0
	taqofikn5nC4WaRZXCxqiSLdyTkTTFW5UNIP24uAjeFOM0EGzvoL482lUYdOvuu8ct1+aXLqQRisK
	6IYJ3L4rSu39PvpsULY2UJkLwdTRuDVZY8Fco6Or/xpdxPXu9+REO84oBiXIgLQEKEUsbndw+l3jD
	P/kY4BPZ6CSprNiOIYEi+t10fgZtRaBF0v01Zui1LQjdoJY7+Y9FsoK3ElMqA/MVS2tzQavYzdHYF
	H9zewZGSEh4qP5IaY/4GsS2p/qUC1IRH7wlQcQHP9T+NHtpHjccmmK3YGr7hqB0o89AydBPZb9WDB
	HSJ6jAGA==;
Received: from [2001:4bb8:180:9d3f:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYksI-000522-Iw; Wed, 13 May 2020 06:28:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Wed, 13 May 2020 08:26:42 +0200
Message-Id: <20200513062649.2100053-28-hch@lst.de>
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
Subject: [Drbd-dev] [PATCH 27/33] sctp: export sctp_setsockopt_bindx
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

And call it directly from dlm instead of going through kernel_setsockopt.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/dlm/lowcomms.c       | 13 ++++++++-----
 include/net/sctp/sctp.h |  3 +++
 net/sctp/socket.c       |  5 +++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
index b722a09a7ca05..e4939d770df53 100644
--- a/fs/dlm/lowcomms.c
+++ b/fs/dlm/lowcomms.c
@@ -1005,14 +1005,17 @@ static int sctp_bind_addrs(struct connection *con, uint16_t port)
 		memcpy(&localaddr, dlm_local_addr[i], sizeof(localaddr));
 		make_sockaddr(&localaddr, port, &addr_len);
 
-		if (!i)
+		if (!i) {
 			result = kernel_bind(con->sock,
 					     (struct sockaddr *)&localaddr,
 					     addr_len);
-		else
-			result = kernel_setsockopt(con->sock, SOL_SCTP,
-						   SCTP_SOCKOPT_BINDX_ADD,
-						   (char *)&localaddr, addr_len);
+		} else {
+			lock_sock(con->sock->sk);
+			result = sctp_setsockopt_bindx(con->sock->sk,
+					(struct sockaddr *)&localaddr, addr_len,
+					SCTP_BINDX_ADD_ADDR);
+			release_sock(con->sock->sk);
+		}
 
 		if (result < 0) {
 			log_print("Can't bind to %d addr number %d, %d.\n",
diff --git a/include/net/sctp/sctp.h b/include/net/sctp/sctp.h
index 3ab5c6bbb90bd..f702b14d768ba 100644
--- a/include/net/sctp/sctp.h
+++ b/include/net/sctp/sctp.h
@@ -615,4 +615,7 @@ static inline bool sctp_newsk_ready(const struct sock *sk)
 	return sock_flag(sk, SOCK_DEAD) || sk->sk_socket;
 }
 
+int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
+		int addrs_size, int op);
+
 #endif /* __net_sctp_h__ */
diff --git a/net/sctp/socket.c b/net/sctp/socket.c
index 1c96b52c4aa28..30c981d9f6158 100644
--- a/net/sctp/socket.c
+++ b/net/sctp/socket.c
@@ -979,8 +979,8 @@ int sctp_asconf_mgmt(struct sctp_sock *sp, struct sctp_sockaddr_entry *addrw)
  *
  * Returns 0 if ok, <0 errno code on error.
  */
-static int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
-				 int addrs_size, int op)
+int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
+		int addrs_size, int op)
 {
 	int err;
 	int addrcnt = 0;
@@ -1032,6 +1032,7 @@ static int sctp_setsockopt_bindx(struct sock *sk, struct sockaddr *kaddrs,
 		return -EINVAL;
 	}
 }
+EXPORT_SYMBOL(sctp_setsockopt_bindx);
 
 static int sctp_connect_new_asoc(struct sctp_endpoint *ep,
 				 const union sctp_addr *daddr,
-- 
2.26.2

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
