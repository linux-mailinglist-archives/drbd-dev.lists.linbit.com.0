Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 213922D930C
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:18 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B2B0842080E;
	Mon, 14 Dec 2020 06:56:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5D81942062C
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:07:24 +0100 (CET)
Received: by mail-qk1-f196.google.com with SMTP id w79so12704839qkb.5
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=b7ALxxBeZClVOnn+kimzQ76vWzYXCYgM5l/GowdpwGs=;
	b=tgBP0hZBxPNGVoUkrt6cwbGSGG1mP33Sa8RpI/jeoZsbRhXhDIxa05KQ8aqLnSFCpI
	yPYkPZN0G1aSfdvMpr4tLi3NB1BMOL5r7W+MXZQo/UzCe93nezH+wIC1G45a9DDo5jYY
	+f6Cf2Vt0E58iG74y47WzPGdsVfNsRYii4zGgiJpZNTOb/3I/Nk67fh58+Fn1WoQN0IJ
	7D+Qj1Ix+MtDhCMOioxvp7DgvuFITtKjC0hQiCVceD+fuDMxOQnUWftOh9k036voykYa
	s+7QLusvvn1B9s7HuQqjNhFthk69Pf4rlhQncmolG4+ZVFctdgy65ObDEHp9dRjrurhH
	QZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=b7ALxxBeZClVOnn+kimzQ76vWzYXCYgM5l/GowdpwGs=;
	b=kZq8oE4+NPf4OUhUbxnwUpnnqlr8kuMpfgpwlTbMXwrP1ydA2Kyzfad7uqQq8pw81G
	yNzkMWa2vAcFIMSx7+ve78UY5I14uF41lHxDvpLGHIeP3adoHnSat7F/fKx486y00BT7
	TKoFtyKqFHeMaYTOXjzl5/+urglOxkI5bAjJKpxzi6tvHCjsa/0sxF88w601/P+Hnwyt
	i0tNQpYemFedxy568TQq0JQAWzW9WLdCeR3RBGvTogLbssIvQiHSw/QHQsoh27IvN/15
	3FkiPJh/iPnQ9W08Glssr3v5vledTs8aM2dmnv64eEEidOEFjwkHUzXmWk4Gu+mJrMGd
	Tz7Q==
X-Gm-Message-State: AOAM530TSIF6JgNunyetw1XebsLW25etfqECzsGSYRKv9W3F2khwhRjW
	InNaW9tvkmbm5zhLAg7VJ6QI8JcecSN6uw==
X-Google-Smtp-Source: ABdhPJwojWjiNICce7iZ0UCS1b1iYhMsXzHWywgIwXXvcX9fqz7AO51RAQdj4579oSKatjimZG88mA==
X-Received: by 2002:a37:b987:: with SMTP id
	j129mr23297464qkf.131.1607836043358; 
	Sat, 12 Dec 2020 21:07:23 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id
	f185sm11803045qkb.119.2020.12.12.21.07.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:07:22 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:07:01 -0500
Message-Id: <20201213050704.997-6-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213050704.997-1-michael.d.labriola@gmail.com>
References: <20201213050704.997-1-michael.d.labriola@gmail.com>
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
