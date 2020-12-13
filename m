Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F292D930E
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:19 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0B2C6420818;
	Mon, 14 Dec 2020 06:56:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 58965420636
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:07:25 +0100 (CET)
Received: by mail-qk1-f194.google.com with SMTP id 143so12692508qke.10
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ATctDvSorLPrXp1SKQJHRaW20qCQV72hfrLZocFRIZg=;
	b=Jg9lxnQLUuzAcHuPLB9TifLDRzUTIMhUXWHzige/TqzJlJjYtIQIG8dzFfdBNCk6/x
	aeftHtGRno3gxonm3+OmzNGeGZyeHF5ziyuMpMcpiPm8MVlBwZdNMq7B15K+kdua7e7Q
	KpN6Om14B24m2DypT/LejF2uW0Cxvv8WpkyW+OngktcMmSotGwhnuHVF1u7wKUezR0P/
	U7f61INn1a4nuS8ID0ug4FX7QJEnA2wOl4ScNnL/36rYH+Q9mmFXiQ5TVDLvlUrncDb7
	wUx0yRg9md08yVCr89k0M3rZw/d7SwZk2oPkl/R8P7/FaRrRGnRhvZpDKRo72BFQt3Wh
	zFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ATctDvSorLPrXp1SKQJHRaW20qCQV72hfrLZocFRIZg=;
	b=dZp/wMM+RIk82GS/AlLzrPhRd0IpOLJ8sRaVQS5XJveFTy/VikM7Rxlc0/PswYUWMs
	LQ0ST62bORtNMOpEnpwD23fr2/EoZYCPkkzhXjXZVVtzZSn3u6OTb8Nm91xddS8q48eD
	6I2kJ78aNVaueU47YLD7xbUKzUIZAHbEBZ4riiH7mjtZP2U34Iif9wEpIsz3qkqtDvvz
	FXb5CFUahS0eC7nkMyxPtTGHr0vLhHyRDULPx7fDuka2JcD/1DbUiWATWSBbI7zx0o7Y
	5XbupC4kdDj5nN/P7uRqsEJhUnYJ7SWJAB0cT37f0uAhJGr01foVSoUalFZk45Hjs68t
	6wkQ==
X-Gm-Message-State: AOAM533fx7gQAzF1+w3SsMBH7EQiaRoPJXBYTDwIb2crp2Y42Fh3fCCh
	tj680Qd6qj9/OWC2BMa4ZNSu41wmQgeTtQ==
X-Google-Smtp-Source: ABdhPJwkqDbeKhgpeLI161nEtvOztXbYFG89LrAmWVAVxc4520Myek12fVj7f9D0isx0CRdwjWrGlw==
X-Received: by 2002:a37:d41:: with SMTP id 62mr26727128qkn.110.1607836045110; 
	Sat, 12 Dec 2020 21:07:25 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id
	f185sm11803045qkb.119.2020.12.12.21.07.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:07:24 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:07:03 -0500
Message-Id: <20201213050704.997-8-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213050704.997-1-michael.d.labriola@gmail.com>
References: <20201213050704.997-1-michael.d.labriola@gmail.com>
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] [PATCH 7/8] drbd: don't use sched_setscheduler()
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

The sched_setscheduler() function was removed in 5.9.  Use
sched_set_fifo_low() like the mainline drbd8 module did here:

    c9ec0524 sched,drbd: Convert to sched_set_fifo*()

Signed-off-by: Michael D Labriola <michael.d.labriola@gmail.com>
---
 drbd/drbd_receiver.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drbd/drbd_receiver.c b/drbd/drbd_receiver.c
index 46368949..6fb2ec39 100644
--- a/drbd/drbd_receiver.c
+++ b/drbd/drbd_receiver.c
@@ -9390,13 +9390,10 @@ int drbd_ack_receiver(struct drbd_thread *thi)
 	unsigned int header_size = drbd_header_size(connection);
 	int expect   = header_size;
 	bool ping_timeout_active = false;
-	struct sched_param param = { .sched_priority = 2 };
 	struct drbd_transport *transport = &connection->transport;
 	struct drbd_transport_ops *tr_ops = transport->ops;
 
-	rv = sched_setscheduler(current, SCHED_RR, &param);
-	if (rv < 0)
-		drbd_err(connection, "drbd_ack_receiver: ERROR set priority, ret=%d\n", rv);
+	sched_set_fifo_low(current);
 
 	while (get_t_state(thi) == RUNNING) {
 		drbd_thread_current_set_cpu(thi);
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
