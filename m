Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D81C28BBE9
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:31:21 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 76DC442046E;
	Mon, 12 Oct 2020 17:31:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C00B942034B
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:29:23 +0200 (CEST)
Received: by mail-ej1-f66.google.com with SMTP id lw21so23772616ejb.6
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/Rg1Fu7lNBIhY267j1c394m8iVJA/XdLfvtW20iYY9c=;
	b=lpBQrtSrSTyeqf5cx/0vCb4DAF8/zU497gwA8gMqutRHt5PHLQsy7lbBLQSt/krt7h
	3GTECzINPuQ7Wd2EaahJv32bjjPFWgWEdB0lxPdWspuk0ehPyurVMXJTkbWsCzrXAKlK
	cAKtvO+67SsnPHhjcfF86W5TjrCLwkEewixrF0DK8PQHTtFz2tcmol5QtugQTN4v9Dse
	vDo/UW7o6SfQ93jGmRAO/Qe5Iffc84yigDcZKJ0x4pq5kjaAPpaJqbfeppm9ZuclVBia
	ipFlq/5BVwJq5MyncC+CPro9WyBLUuA58+wfA3xtRUsEv6pYnRDnHg7dPosWelHYUNlr
	ex/w==
X-Gm-Message-State: AOAM5323yt3WnOvjepe+YY0SxFTqJGyLog8V6d3Vg9ZHQcFkrpiYaVBW
	caLas072wLdDlJQjKkguhoMga5wQ2X4auVhD
X-Google-Smtp-Source: ABdhPJwxqV25fYsULVUOR2n3H2P6SCZc/lhPw+rEebRXM9e1CCpUx7Stik/HG7Z8Tfzf5nK7itVzWw==
X-Received: by 2002:a17:907:1005:: with SMTP id
	ox5mr28194788ejb.443.1602516563275; 
	Mon, 12 Oct 2020 08:29:23 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	w22sm10790014edu.15.2020.10.12.08.29.22
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:29:23 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:29:21 +0200
Resent-Message-ID: <20201012152921.GL2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from mail3-relais-sop.national.inria.fr
	(mail3-relais-sop.national.inria.fr [192.134.164.104])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 09F85420385
	for <drbd-dev@lists.linbit.com>; Sun, 27 Sep 2020 22:04:18 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.77,311,1596492000"; d="scan'208";a="360169506"
Received: from palace.rsr.lip6.fr (HELO palace.lip6.fr) ([132.227.105.202])
	by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-SHA256;
	27 Sep 2020 21:55:15 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Philipp Reisner <philipp.reisner@linbit.com>
Date: Sun, 27 Sep 2020 21:12:28 +0200
Message-Id: <1601233948-11629-19-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
Cc: Jens Axboe <axboe@kernel.dk>,
	=?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Joe Perches <joe@perches.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 18/18] drbd: use semicolons rather than commas to
	separate statements
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

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/block/drbd/drbd_receiver.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 422363daa618..87f732fb5456 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -111,8 +111,10 @@ static struct page *page_chain_tail(struct page *page, int *len)
 {
 	struct page *tmp;
 	int i = 1;
-	while ((tmp = page_chain_next(page)))
-		++i, page = tmp;
+	while ((tmp = page_chain_next(page))) {
+		++i;
+		page = tmp;
+	}
 	if (len)
 		*len = i;
 	return page;

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
