Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FB92D9315
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:25 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1E43A42083A;
	Mon, 14 Dec 2020 06:56:14 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 55F2A42062C
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:59:11 +0100 (CET)
Received: by mail-il1-f193.google.com with SMTP id q1so12796032ilt.6
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b7ALxxBeZClVOnn+kimzQ76vWzYXCYgM5l/GowdpwGs=;
	b=reN/20dMq9JtwXMeddDGNjSjEyxJI2sJK7DFF+cdfA8BnR0VWvZ/LHk6jK8dLhp4OS
	M6RKpo7sBo/8SA7ms75xfM718xgOVQj7e0P8/6ZZpZaNrp6Z7/7Cd+DyThu78TIzO21z
	id3aKtELslThxAfNuckckPtF1seehGpht/nSFvXu8KEsB/xt/Iq63CuKK6UI4GsmQVx4
	arZqp4Me7z5NtFkG7/qSmeLhKqFzZNiP0T41936LK73DfiySJYxrswMiTrPbVYVs455M
	ZB63k8+87ZvxoAbwSvN9U3Whz/mwT/PZ/voxMA0HBXjCbgYw/TAEZ9TQi3+7fqIb5yfg
	EKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b7ALxxBeZClVOnn+kimzQ76vWzYXCYgM5l/GowdpwGs=;
	b=qvJsRmRqcDG+kkP6zm2R9FUjqJQDxy2gwukX7sYUOqNgcackn3GzGPyRDbNnFvg6an
	c9F06IyCkgW/PZO/z+I/SNBMg1J49LWpoiORg2CvfprCd6A+mdSgAJvcbdJJH79R6a6t
	l4HSv+2Rlan7esRD3A58GVB7IPv6+WyIq9wj/DbQoDneF1ETrdFr2yP8BpmjtfrugcvI
	TcBQMEwxb7R3J7FTLqs+3SMxEgCtGfl62vj4hrBOjvv3uPsrXYTAMnMZYxWQpx3JwU29
	hsfadlMhavoKoub9mWKMqSbR0LGvkTbvfbtGs2UmpnPxHRO2ChXLvAin6ViAqmaGuwhd
	z23A==
X-Gm-Message-State: AOAM532RybSf3PjTfm8I2LdnfCzfR0/cku1SjGrA3WkauY8fva5CW8Nb
	YDw28FetNX2HJEywNXOUn+NQSXIGFEPIhg==
X-Google-Smtp-Source: ABdhPJzxDI5eEuhgtpEpBddl9ZaLnSa0Ep/2aM3tuXgmn7UrnJX0CvdGmSmIhHXfNlHYJjn0fdg3Vg==
X-Received: by 2002:a05:6e02:e86:: with SMTP id
	t6mr25324836ilj.39.1607839150340; 
	Sat, 12 Dec 2020 21:59:10 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id s1sm6962752iot.0.2020.12.12.21.59.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:59:09 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:58:56 -0500
Message-Id: <20201213055859.3305-6-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213055859.3305-1-michael.d.labriola@gmail.com>
References: <20201213055859.3305-1-michael.d.labriola@gmail.com>
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] [PATCH 5/8] drbd: use sock_set_keepalive() instead of
	kernel_setsockopt()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

Looks like the rest of the code has been updated to use 5.8's sock_set_*
and tcp_set_* functions, but we've missed this one case.

Signed-off-by: Michael D Labriola <michael.d.labriola@gmail.com>
---
 drbd/drbd_transport_tcp.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drbd/drbd_transport_tcp.c b/drbd/drbd_transport_tcp.c
index 203dc4e0..3b1d4273 100644
--- a/drbd/drbd_transport_tcp.c
+++ b/drbd/drbd_transport_tcp.c
@@ -883,7 +883,6 @@ static int dtt_connect(struct drbd_transport *transport)
 	struct socket *dsocket, *csocket;
 	struct net_conf *nc;
 	int timeout, err;
-	int one = 1;
 	bool ok;
 
 	dsocket = NULL;
@@ -1065,9 +1064,7 @@ randomize:
 	dsocket->sk->sk_sndtimeo = timeout;
 	csocket->sk->sk_sndtimeo = timeout;
 
-	err = kernel_setsockopt(dsocket, SOL_SOCKET, SO_KEEPALIVE, (char *)&one, sizeof(one));
-	if (err)
-		tr_warn(transport, "Failed to enable SO_KEEPALIVE %d\n", err);
+	sock_set_keepalive(dsocket->sk);
 
 	return 0;
 
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
