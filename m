Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A984A4F0F07
	for <lists+drbd-dev@lfdr.de>; Mon,  4 Apr 2022 07:17:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8503042097C;
	Mon,  4 Apr 2022 07:17:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 983794201B9
	for <drbd-dev@lists.linbit.com>; Fri,  1 Apr 2022 10:36:45 +0200 (CEST)
Received: by mail-qt1-f177.google.com with SMTP id bp39so1602243qtb.6
	for <drbd-dev@lists.linbit.com>; Fri, 01 Apr 2022 01:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+mSCDYPk3U9vdhqL8Gmqs9PhseJMmr9FU0irA0rfjxE=;
	b=VmgqgP1xI/S/P3HIba5wPAeNYZvDDOjgpzdyQ3g3xGbRgAIgVIP1NgrAoq7n1yhYzx
	Vu3FBKquivjAHibTaQ+JPAv2MEBuBs2yCf9+oMG63qo7I5S8UOLnLspAVW3gWXyb2IxT
	FCxJSXdRVEVZMjdQILJyD6oUMc+NXX9LEJpgUnaHwV/6esJ1hbVR4AanILYLR9DsC94+
	eIRo5CsT1co60Xbr47DdRIcKYkm9cWZ6X9ESEBGCBb58EcsiD/F7PaiPPACbIPK+/drs
	2whc1NRQmUbHgrxiTUNrrpuX1/xmMzCFr711kIvpmq5fxVzAxTTsx2eAEMP78MrYdL7s
	SFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+mSCDYPk3U9vdhqL8Gmqs9PhseJMmr9FU0irA0rfjxE=;
	b=PJCLeYX+mVIBseEd55ykrP+1KWajzg6h1hq168UmVyk0iSaj7zeoZZLUo559BZBzU0
	i6FOQTKMkmhmAblQuBF3qX2oKhGdPyu5eMm15xd65xlZEBIytb0n2FIaLIsh0TvdCO9b
	hXLILoI1tvn17+taeCAM4AgQk5QCL5L8DkqUQde3z7sVcbcB+huN2FHEU+8xE7nJu5k4
	R6dhzzRR6Na0Pt0eaZRhcF+W6xCoPciIBY9NSplqpwDf+xAu9ZaudVp15edCTYELgXFw
	/RIgeoauXWMl0kMUNSiesikFlAED+S9+5GaPvufZVx40+lszUmqzciIywkSdUDgEjsJe
	bUiQ==
X-Gm-Message-State: AOAM533xeuS14Fey2QlwSAYLm7+YD5NG8cFpgDg1QHdt+Y/CK8Fd09WX
	iwfZ7b/0TtYHWZTbJSoALVM=
X-Google-Smtp-Source: ABdhPJzOWkUlQCyJVlzJDVTy84GLdOju1HdNzkPqrDqJ6+tAitfS8ZsYVSOZu/6Y9Eg2vjaf+7S9Dw==
X-Received: by 2002:a05:622a:1786:b0:2e1:f1b9:8a1d with SMTP id
	s6-20020a05622a178600b002e1f1b98a1dmr7603681qtk.443.1648802204065;
	Fri, 01 Apr 2022 01:36:44 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
	by smtp.gmail.com with ESMTPSA id
	o28-20020a05620a111c00b0067d3b9ef388sm891887qkk.98.2022.04.01.01.36.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 01 Apr 2022 01:36:43 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: philipp.reisner@linbit.com
Date: Fri,  1 Apr 2022 08:36:37 +0000
Message-Id: <20220401083637.2407766-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Apr 2022 07:17:15 +0200
Cc: axboe@kernel.dk, Lv Ruyi <lv.ruyi@zte.com.cn>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
	Zeal Robot <zealci@zte.com.cn>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] block: fix potential dereference null pointer
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

From: Lv Ruyi <lv.ruyi@zte.com.cn>

rcu_dereference may return NULL, so check the returned pointer.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/block/drbd/drbd_req.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/block/drbd/drbd_req.c b/drivers/block/drbd/drbd_req.c
index e1e58e91ee58..8ab6da155e2f 100644
--- a/drivers/block/drbd/drbd_req.c
+++ b/drivers/block/drbd/drbd_req.c
@@ -577,6 +577,10 @@ int __req_mod(struct drbd_request *req, enum drbd_req_event what,
 		D_ASSERT(device, !(req->rq_state & RQ_NET_MASK));
 		rcu_read_lock();
 		nc = rcu_dereference(connection->net_conf);
+		if (!nc) {
+			rcu_read_unlock();
+			break;
+		}
 		p = nc->wire_protocol;
 		rcu_read_unlock();
 		req->rq_state |=
@@ -690,6 +694,10 @@ int __req_mod(struct drbd_request *req, enum drbd_req_event what,
 		/* close the epoch, in case it outgrew the limit */
 		rcu_read_lock();
 		nc = rcu_dereference(connection->net_conf);
+		if (!nc) {
+			rcu_read_unlock();
+			break;
+		}
 		p = nc->max_epoch_size;
 		rcu_read_unlock();
 		if (connection->current_tle_writes >= p)
-- 
2.25.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
