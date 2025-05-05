Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22492AA95C9
	for <lists+drbd-dev@lfdr.de>; Mon,  5 May 2025 16:27:04 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C3A8B16B836;
	Mon,  5 May 2025 16:27:00 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 07E8E160645
	for <drbd-dev@lists.linbit.com>; Mon,  5 May 2025 16:26:26 +0200 (CEST)
Received: by mail-wr1-f47.google.com with SMTP id
	ffacd0b85a97d-3913b539aabso1995084f8f.2
	for <drbd-dev@lists.linbit.com>; Mon, 05 May 2025 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1746455186;
	x=1747059986; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=ticlIpPbqXjzJ+JAHisibJR5pqedJr+Gmor+qJZgu7o=;
	b=EN6f8Vvl1XM1o+QGNo7oAImKCjF5dDVeS5V/Qqz8KtdG4bw5H6P1yc0Fog+S+9zk3a
	wLYxb3uOstEm8NX17G4bDuFNfpFUCfu4hIiOX4OQ5343XdWyV3+PaXhEUhLAadwITAEu
	0n4KoWIgqbHvmrRVaOmnXR4Vjq/TfRCQS425CSdJIyZwmtlWDOtbAfz+BeaLKrLxr9Bg
	TOY+KGKZ24O3jDGtthi+1YI2S2JJ3x15aBnywIodFxR2JB78JlmCZ+goz3o2ZY6jXiKU
	ceTlNzrHAItB8yYJbWNDdlFhyseqHbhsNaPMDViCfwHYUhGKnVTKN0S59Hwal5Guzfrm
	E8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1746455186; x=1747059986;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=ticlIpPbqXjzJ+JAHisibJR5pqedJr+Gmor+qJZgu7o=;
	b=PHyJQclvg4iLoyqZ/6ELMF65+zRBapYKx22s+wSz3DiUDfGC8WkKsofcoYenEHuPBQ
	rPHiuTIRKlxlxzHSKFTfO7EXRkfUGpWXC9ijyTIoxeKyIfkp7bwcCE+GIS4VTh9yIoLS
	9QDY2fVnox5c66L/eCUNsEjir+UaVZWK3rnQEFxTIBRRsHI3vDOfdecWsO0M42a6UkNR
	e5TdskZnUeexzrt9CkpuYxSIUNOnPSg8sGaeH7DsZa04gvMgT05BVXOkY6YBtb0hhLRA
	qGlNXYIFccHN//I73ua2GGK0iClHuO5OQzftGCYZ0OdyK9hJoNRFHO30UJwOobIOdljd
	ntYQ==
X-Gm-Message-State: AOJu0YzADV6Ae0ddqq61Swm0KzjndOc/LilLAILyeZBjJ3HPDHkvy3Rs
	AKW3P34sOIlD54ukdNu7io40rth6r6cyegl6t8M2e2knxD+6JDuVvdDl/hImhjQ+czQ8EXApQCN
	zJck=
X-Gm-Gg: ASbGncvYicFxIxJgJTQcK+8E5Jb2IawGzXUtDRQZPO+4aS3lJXBS6Ja4VJ1n7O3ZKge
	N1n27cCrF5o5SlFUGRO/NiIea0Q4M75Vwfz+3iaRFAwefZUl6/T4KsSOYjnqdpAZJ0BTiohTmlo
	FGuScxk3MqLbuBM6qtklFLVS9pU1X9lAv2xXgQIko0STNc1TqlxfqDl9fR1LnDnpemRmIwJQ1O+
	vtw2BHx0shZBExkYAtA+VqdEWmkoD437B1H8kQHroz0xIrqqDdnO020YX8SsFLsoGCIZVr1inWy
	/XoVKL2+7l7Z7K1SIqYDIdf+B5TzYEkqdCyxaJW6elKNdc3lAWaaBzvMKlnWucxQIcypfccu06U
	JefTi1eeR0eSP07MD
X-Google-Smtp-Source: AGHT+IHBh6lr15PN0uvuQ/yaJzs8faM1xsCTYg1JcBuD5qE+wEmsP6/Ytkl0gRhrYd7ak/dGhf91WA==
X-Received: by 2002:a05:6000:40db:b0:3a0:7a8f:db22 with SMTP id
	ffacd0b85a97d-3a09fd863e4mr5886893f8f.24.1746455185966; 
	Mon, 05 May 2025 07:26:25 -0700 (PDT)
Received: from ryzen9.home (192-164-20-231.hdsl.highway.telekom.at.
	[192.164.20.231]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-441b89ee3a9sm134115385e9.23.2025.05.05.07.26.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 05 May 2025 07:26:25 -0700 (PDT)
From: Philipp Reisner <philipp.reisner@linbit.com>
To: "zhengbing . huang" <zhengbing.huang@easystack.cn>
Subject: [PATCH 1/1] rdma: Fix cm leak
Date: Mon,  5 May 2025 16:26:23 +0200
Message-ID: <20250505142623.424049-2-philipp.reisner@linbit.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425102421.1673048-1-zhengbing.huang@easystack.cn>
References: <20250425102421.1673048-1-zhengbing.huang@easystack.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: drbd-dev@lists.linbit.com
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
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

From: "zhengbing.huang" <zhengbing.huang@easystack.cn>

We found that when all the DRBD devices are down, the reference count
of the drbd_transport_rdma module is still 1.

[root@node-4 ~]# drbdadm status
No currently configured DRBD found.
[root@node-4 ~]# lsmod | grep drbd
drbd_transport_rdma   262144  1

Then, we found an unreleased cm structure and discover
that its state is DSB_CONNECT_REQ + DSB_ERROR.

crash> struct dtr_cm ffff57e515da9400
struct dtr_cm {
  kref = {
    refcount = {
      refs = {
        counter = 1
...
state = 9,
...
}

The scenario of this problem should be like this:
dtr_cma_event_handler() get an RDMA_CM_EVENT_CONNECT_REQUEST event,
and call dtr_cma_accept() to alloc a cm. and set cm->state = DSM_CONNECT_REQ,
now the cm->kref count is 2.
then dtr_cma_event_handler() get xxx_CONNECT_ERROR/xxx_UNREACHABLE/xxx_REJECTED
event, and set_bit(DSB_ERROR, &cm->state).
the cm remove from path in dtr_cma_retry_connect, put one ref.
and cm->state dont has DSB_CONNECTING flag, then return 0.
Now, the cm->kref count is 1, and state is DSB_CONNECT_REQ + DSB_ERROR.

Therefore, when we test the DSB_CONNECTING flag,
we should also test the DSB_CONNECT_REQ flag to avoid cm leak.

Signed-off-by: zhengbing.huang <zhengbing.huang@easystack.cn>
Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
---
 drbd/drbd_transport_rdma.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drbd/drbd_transport_rdma.c b/drbd/drbd_transport_rdma.c
index be919a926..4a9ba8fa6 100644
--- a/drbd/drbd_transport_rdma.c
+++ b/drbd/drbd_transport_rdma.c
@@ -1278,8 +1278,8 @@ static int dtr_cma_event_handler(struct rdma_cm_id *cm_id, struct rdma_cm_event
 		/* cm->state = DSM_CONNECTED; is set later in the work item */
 		/* This is called for active and passive connections */
 
-		connecting = test_and_clear_bit(DSB_CONNECTING, &cm->state);
-		connecting |= test_bit(DSB_CONNECT_REQ, &cm->state);
+		connecting = test_and_clear_bit(DSB_CONNECTING, &cm->state) ||
+			test_and_clear_bit(DSB_CONNECT_REQ, &cm->state);
 		kref_get(&cm->kref); /* connected -> expect a disconnect in the future */
 		kref_get(&cm->kref); /* for the work */
 		schedule_work(&cm->establish_work);
@@ -1307,7 +1307,9 @@ static int dtr_cma_event_handler(struct rdma_cm_id *cm_id, struct rdma_cm_event
 		set_bit(DSB_ERROR, &cm->state);
 
 		dtr_cma_retry_connect(cm->path, cm);
-		if (!test_and_clear_bit(DSB_CONNECTING, &cm->state))
+		connecting = test_and_clear_bit(DSB_CONNECTING, &cm->state) ||
+			test_and_clear_bit(DSB_CONNECT_REQ, &cm->state);
+		if (!connecting)
 			return 0; /* keep ref; __dtr_disconnect_path() won */
 		break;
 
@@ -2787,7 +2789,8 @@ static void __dtr_disconnect_path(struct dtr_path *path)
 	 * events. Destroy the cm and cm_id to avoid leaking it.
 	 * This is racing with the event delivery, which drops a reference.
 	 */
-	if (test_and_clear_bit(DSB_CONNECTING, &cm->state))
+	if (test_and_clear_bit(DSB_CONNECTING, &cm->state) ||
+	    test_and_clear_bit(DSB_CONNECT_REQ, &cm->state))
 		kref_put(&cm->kref, dtr_destroy_cm);
 
 	kref_put(&cm->kref, dtr_destroy_cm);
-- 
2.49.0

