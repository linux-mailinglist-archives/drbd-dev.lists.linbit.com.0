Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC12D9317
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:26 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5EA56420843;
	Mon, 14 Dec 2020 06:56:14 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 99246420636
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:59:12 +0100 (CET)
Received: by mail-il1-f193.google.com with SMTP id c18so12764227iln.10
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ATctDvSorLPrXp1SKQJHRaW20qCQV72hfrLZocFRIZg=;
	b=AeBb/SV8w0VbGcstrybVBfk5TxtG9muW8TZgPvvcE086Ruk1INdlKgbJSzvm8z0vho
	npdXOALYmb/EoNXEbiSIVj23nvkcTVYcfzNKEr7AXJlS05mJNpRLK883sdt7e4QnSatf
	IZeM4XLPOKs2LgOvQM847sETSfqX1cH1cQtrv7qFg2jF/yK0Us23TRlPZPUZd9pIJ7Xh
	K3JjnehN7QjS4LfCYwelZy8ueTbXPlvXmBAyAwotgw/hm40c+O+fR1QW1Jc+TfXbY3Su
	TfwWBySO3byZtzin1ks/cgILQAHdnFrWAieSIlM53WDxro7eTWj9A81yjRaXEd6w8/OO
	/04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ATctDvSorLPrXp1SKQJHRaW20qCQV72hfrLZocFRIZg=;
	b=PJ/fQJanHU1O32jjnrVZVoKlawhbUjOTXuqg5RNKf+mtyudAigws+4sJNPoGrf8bK/
	PxUWzmD12+GW3zQlphfUZNsvahUwQyB7Aw18Pgpfa7ai3D7Yj5RSezysiMolPwjz0hGp
	ROOLBUROGzRqnwyZoUdadJ/RQWaMBa4+7OWaiaKrDva155tgQlM+iqJHdFRJ6K4KrUxM
	oLVdeECrD1KkqiPJwo4AT4jIE/jl9Gr4mLNm25aXxqRoI6XCz3tyCDKCsxuT1TVnD9Q6
	BY6xsTL/4y6qWbuVnjWDMMU0iQnCGc4Euw/WFnOBqT/+C+KicPcTRW9Dqc40fZ8ENhtT
	e4gA==
X-Gm-Message-State: AOAM531FfyFIMNy8ooxBwlyxcxAenG/t8GBKOThgnbL8DmL4m3ElYK2y
	7UqtgRJVkvvmkma3qqtDv92VeiCuLA3kcA==
X-Google-Smtp-Source: ABdhPJxPiGpdhM4l1m9ii67thEw8zgbjgV6mrb2gDmcKsYeF/4icPYxFyJtup2waT1Dmm6nj/vqqsg==
X-Received: by 2002:a92:c052:: with SMTP id o18mr27198183ilf.245.1607839151911;
	Sat, 12 Dec 2020 21:59:11 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id s1sm6962752iot.0.2020.12.12.21.59.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:59:11 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:58:58 -0500
Message-Id: <20201213055859.3305-8-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213055859.3305-1-michael.d.labriola@gmail.com>
References: <20201213055859.3305-1-michael.d.labriola@gmail.com>
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
