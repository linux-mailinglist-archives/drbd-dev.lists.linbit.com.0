Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CFE1F8276
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:10:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B064E420404;
	Sat, 13 Jun 2020 12:10:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D8305420407
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:57:49 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id p5so12263328wrw.9
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:organization:from:in-reply-to:references
	:to:cc:subject:mime-version:content-id:content-transfer-encoding
	:date:message-id;
	bh=4jFShFTg902A0q2PIFAj13bBAo+TkoHxdtSFzmSJaQc=;
	b=bmsxCTNPqrTUfH4Qcx9ehM0orekX+hFEBfzdinPE6VjqiXg3n7r2Fu+dG1tbGo2vxy
	plnRLyeS6PEwZANCi7B2kFGrvL7JmcC/eFLfPFg3/ZFannjBX3Zx7kpzqZ+unDSzHjT4
	IKYbfoCoWi1Khj1+aTyEidtoikaPq/tGzajCpIHRyWsmYmKJnRET7FjkUMV6k4QT0uSU
	EOAe73DMzQk9/SCsCm+AbgcF2NKUmA1a5Hm7njzn3feYDLg5wN9QdJkXvmkrGgBAhLxE
	DZFUSr/eKyztOLJT+A6O5nOxPn0RPIEixB+nohn6FpzwZjDbbPfQwJCtBpU2MjYD5hpJ
	aQBg==
X-Gm-Message-State: AOAM5318s5G3K/fwD7Mzsb0AFg277jHwrUju12qtv68U8vYFq9xXrfz0
	Hz84dLGKmJ1DY2tebfcw0E4dv4Erz7axTJuh
X-Google-Smtp-Source: ABdhPJygfmBOVzxrKCV7PIO2dTyUcHhnGKbDIfEAcayIhG69AmP8Ets0twRAyiL5NYepUaSdxSxvXA==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr18425795wrw.379.1592042269218;
	Sat, 13 Jun 2020 02:57:49 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	h18sm14073486wru.7.2020.06.13.02.57.48
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:57:48 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:47 +0200
Resent-Message-ID: <20200613095747.GE4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EAE3D420105
	for <drbd-dev@lists.linbit.com>; Fri, 15 May 2020 17:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589555657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=4jFShFTg902A0q2PIFAj13bBAo+TkoHxdtSFzmSJaQc=;
	b=B8PkO8cLVVph/pN4dd3OZCiD6m3ovZaGaJOWfBZ+StZadTXIGXXz6Kc8OJqI4xXgRdbDLF
	gpI19S0HgO2Wop0X+9LiGznCSklVw/JiTjRedmd7OXpuIr+1pQSS/84mQvJWYxZmtVbL5A
	NMYg5s8AC5X1Mq9UFaQ7HCAfDCjKjCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-472-LQVTQu0OPIyPDmXCi0pv9g-1; Fri, 15 May 2020 11:14:13 -0400
X-MC-Unique: LQVTQu0OPIyPDmXCi0pv9g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 03A5684B8A0;
	Fri, 15 May 2020 15:14:10 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-112-95.rdu2.redhat.com
	[10.10.112.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D912F76E64;
	Fri, 15 May 2020 15:13:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20200514102919.GA12680@lst.de>
References: <20200514102919.GA12680@lst.de>
	<20200513062649.2100053-30-hch@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
	<3123534.1589375587@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-ID: <128581.1589555639.1@warthog.procyon.org.uk>
Date: Fri, 15 May 2020 16:13:59 +0100
Message-ID: <128582.1589555639@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	dhowells@redhat.com, linux-sctp@vger.kernel.org,
	target-devel@vger.kernel.org, linux-afs@lists.infradead.org,
	drbd-dev@lists.linbit.com, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
	cluster-devel@redhat.com, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	linux-block@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	netdev@vger.kernel.org, Vlad Yasevich <vyasevich@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>, ocfs2-devel@oss.oracle.com
Subject: Re: [Drbd-dev] [PATCH 29/33] rxrpc_sock_set_min_security_level
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

Christoph Hellwig <hch@lst.de> wrote:

> > Looks good - but you do need to add this to Documentation/networking/rxrpc.txt
> > also, thanks.
> 
> That file doesn't exist, instead we now have a
> cumentation/networking/rxrpc.rst in weird markup.

Yeah - that's only in net/next thus far.

> Where do you want this to be added, and with what text?  Remember I don't
> really know what this thing does, I just provide a shortcut.

The document itself describes what each rxrpc sockopt does.  Just look for
RXRPC_MIN_SECURITY_LEVEL in there;-)

Anyway, see the attached.  This also fixes a couple of errors in the doc that
I noticed.

David
---
diff --git a/Documentation/networking/rxrpc.rst b/Documentation/networking/rxrpc.rst
index 5ad35113d0f4..68552b92dc44 100644
--- a/Documentation/networking/rxrpc.rst
+++ b/Documentation/networking/rxrpc.rst
@@ -477,7 +477,7 @@ AF_RXRPC sockets support a few socket options at the SOL_RXRPC level:
 	 Encrypted checksum plus packet padded and first eight bytes of packet
 	 encrypted - which includes the actual packet length.
 
-     (c) RXRPC_SECURITY_ENCRYPTED
+     (c) RXRPC_SECURITY_ENCRYPT
 
 	 Encrypted checksum plus entire packet padded and encrypted, including
 	 actual packet length.
@@ -578,7 +578,7 @@ A client would issue an operation by:
      This issues a request_key() to get the key representing the security
      context.  The minimum security level can be set::
 
-	unsigned int sec = RXRPC_SECURITY_ENCRYPTED;
+	unsigned int sec = RXRPC_SECURITY_ENCRYPT;
 	setsockopt(client, SOL_RXRPC, RXRPC_MIN_SECURITY_LEVEL,
 		   &sec, sizeof(sec));
 
@@ -1090,6 +1090,15 @@ The kernel interface functions are as follows:
      jiffies).  In the event of the timeout occurring, the call will be
      aborted and -ETIME or -ETIMEDOUT will be returned.
 
+ (#) Apply the RXRPC_MIN_SECURITY_LEVEL sockopt to a socket from within in the
+     kernel::
+
+       int rxrpc_sock_set_min_security_level(struct sock *sk,
+					     unsigned int val);
+
+     This specifies the minimum security level required for calls on this
+     socket.
+
 
 Configurable Parameters
 =======================
diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
index 7dfcbd58da85..e313dae01674 100644
--- a/fs/afs/rxrpc.c
+++ b/fs/afs/rxrpc.c
@@ -57,7 +57,7 @@ int afs_open_socket(struct afs_net *net)
 	srx.transport.sin6.sin6_port	= htons(AFS_CM_PORT);
 
 	ret = rxrpc_sock_set_min_security_level(socket->sk,
-			RXRPC_SECURITY_ENCRYPT);
+						RXRPC_SECURITY_ENCRYPT);
 	if (ret < 0)
 		goto error_2;
 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
