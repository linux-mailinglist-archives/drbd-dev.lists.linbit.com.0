Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E298D33ABEC
	for <lists+drbd-dev@lfdr.de>; Mon, 15 Mar 2021 08:01:45 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7F2594264CD;
	Mon, 15 Mar 2021 08:01:37 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E6E3642062E
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 11:55:44 +0100 (CET)
Received: by mail-wm1-f49.google.com with SMTP id o26so3527236wmc.5
	for <drbd-dev@lists.linbit.com>; Fri, 12 Mar 2021 02:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CQ2DfDdVbjmrehTjwybpEwMo+GbFYXt1R0CwuBdY3Z0=;
	b=OghrvRpS8GWv/AV2ViOXbgTejwPy/gpOEe32zLkGmtvykZU0mA2lJyRWzqmmb1K1j4
	FesBzDGRHwApz1sUTLSb7KsA0Kq7y3o+Aa8+OLK4bYkbcmGmf5eH2y1s8jQbwcSFZwqX
	Jj1LPCVlsV8XrcQNIsjLT2QiXqB2L+guzQ4YkhZ/ZvNFtQ3juB+J7AKfIS8Hq+g6KXly
	xONNkru+slCIA/hDIB+kLJwxk+wRqinyKG4qqc33vRzGKfmm4CeOkiX/n4xWDkFhCpL9
	1AGgKMsjnXiZKJFNc27dCH3ocNFLOMDsy68oApOjCZchXDOusCet6BaY9iQN6N/KkEkZ
	1ltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CQ2DfDdVbjmrehTjwybpEwMo+GbFYXt1R0CwuBdY3Z0=;
	b=CVR7bi9RBExDjY+Q2hehI2VED97TId8IKaOGxomyqVnd7s2t1P6lSng9yWqAOoP3Tw
	bD1Obh/ytZQe/s4Mw9Sd73UAnPHR/Xzyooz+dD1ClmKxt2siBXuyJCW5v+bz4bepzOuJ
	NhCz9liIaDPwxMmjXxCfuXBfjf70v9WOxtPxdTiam5jsGDoh4k1hroc9oSnnR9LmKsBb
	YhmOzRLMzgXZCFvrJiRo6C+eOsH3qWQiKc9zsL9l25lgq8wku2DoXBfyI26bg5r/ayBS
	h4mW7/QOH2D8uGg1YQVAKGMHM2fJq7qA2kyk5lO2tZ7joI+72pK1PMuD4pwMsRf78syJ
	JpSQ==
X-Gm-Message-State: AOAM530kVH+wpT6/fUoPHs3RDXgJCMGXji9crwzSDG+jaizh7pvUaba5
	5sQJR5mKC7g340MPDl5JqGgypQ==
X-Google-Smtp-Source: ABdhPJz0HY2DHTHFDRtkB2revKFFtu6vGCyfJwf+UX60jhtgQzFrnGp54e9OnekD8J52ZO5w2YW1hQ==
X-Received: by 2002:a1c:a306:: with SMTP id m6mr12059136wme.13.1615546544651; 
	Fri, 12 Mar 2021 02:55:44 -0800 (PST)
Received: from dell.default ([91.110.221.204])
	by smtp.gmail.com with ESMTPSA id
	q15sm7264962wrr.58.2021.03.12.02.55.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 12 Mar 2021 02:55:44 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 12 Mar 2021 10:55:28 +0000
Message-Id: <20210312105530.2219008-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210312105530.2219008-1-lee.jones@linaro.org>
References: <20210312105530.2219008-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Mar 2021 08:01:35 +0100
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH 09/11] block: drbd: drbd_receiver: Demote less
	than half complete kernel-doc header
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

Fixes the following W=1 kernel build warning(s):

 drivers/block/drbd/drbd_receiver.c:1641: warning: Function parameter or member 'op' not described in 'drbd_submit_peer_request'
 drivers/block/drbd/drbd_receiver.c:1641: warning: Function parameter or member 'op_flags' not described in 'drbd_submit_peer_request'
 drivers/block/drbd/drbd_receiver.c:1641: warning: Function parameter or member 'fault_type' not described in 'drbd_submit_peer_request'

Cc: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
Cc: Jens Axboe <axboe@kernel.dk>
Cc: drbd-dev@lists.linbit.com
Cc: linux-block@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/block/drbd/drbd_receiver.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 89818a5e0ac67..7a32185347247 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1618,7 +1618,7 @@ static void drbd_issue_peer_wsame(struct drbd_device *device,
 }
 
 
-/**
+/*
  * drbd_submit_peer_request()
  * @device:	DRBD device.
  * @peer_req:	peer request
-- 
2.27.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
