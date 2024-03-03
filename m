Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5AD86FA14
	for <lists+drbd-dev@lfdr.de>; Mon,  4 Mar 2024 07:32:27 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 337C542066E;
	Mon,  4 Mar 2024 07:32:26 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9FFC042062A
	for <drbd-dev@lists.linbit.com>; Sun,  3 Mar 2024 10:13:15 +0100 (CET)
Received: by mail-lf1-f45.google.com with SMTP id
	2adb3069b0e04-5133bd7eb47so1037354e87.3
	for <drbd-dev@lists.linbit.com>; Sun, 03 Mar 2024 01:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1709457194; x=1710061994; darn=lists.linbit.com;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=fAIeYmaA7ge5hjJLuf5YfpXb61jeXA8ryikULlwbGPU=;
	b=Rfq2xxTD9CIfVDdzUKIYx5yPjGZNu297mCRde+CD2rlAM+PdUXDZGZ11Q8CnLl8+Xr
	Lcw4GAM3ueOJGwC/FGt0ew8KGM7uQlMhfUU5A/ifNXjSTTngYEjnuGypRourJONjEaPt
	l6DI01oG2M5QlPUA5hnwZFSeWqNb2u8PbRC2U5IN0MfSUpGurwquIXDmxQihVo/rNeDf
	YxZQrjeKCOrHoC8OwKVA4D8c/woaXKX3ArJtfjduDr8hXeWX43MDLxauYIjRgNSGCHl3
	ykvEO0IoC4IU226hY1Jc8AEyzU+dUOG5746b+gWRkUKXhXdLJFP/Ut23ElITwlsl70rh
	ncfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709457194; x=1710061994;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=fAIeYmaA7ge5hjJLuf5YfpXb61jeXA8ryikULlwbGPU=;
	b=XWa0pak5EV4Ko92zXxii+HmhQ/FWSs8y55jR2gWjwm209TNpzqyxG8Hw+FMLHtJPzw
	x40fOOOJpqC1LN+F0qLKas/GEvNDjk1ARhEgoyTUlNrs/TQm+HLY4SPtG9EJM65GVNDP
	O8+kVCCUhEz/5BEdz7D2yPUPlzeeXo3T8VIZOQSY0YrODgfXCDDkH7fVpkl/LuZW6YVQ
	qYSXaTG5k1jicanEqzbJt7/UzR+flVCuJDhP5RqTcuWSMrsb7doMLdwA1o2Xh//zsYu0
	Cn9Bdn9LPhG3qmrWXpkt4bIbYwf0sLEVsXPxnYDb3EzArlpyEYk+7qBtOBGs+ap9uuvN
	is6Q==
X-Gm-Message-State: AOJu0Yyhg2fS/61FIdZksnBhB3A2Z/NaqkV8458yVkG6LPGs6PSG2wge
	bAqpToUXeCZwQdPeXWUiPLxxMiuH31LWeTLj+xcyhGYAS7RV6zK9YSEKi8g4CxTM88S+KiPDSy4
	U
X-Google-Smtp-Source: AGHT+IFpzK+i0RHGkhaax9ZkuH7g2H/pDxr4FGAuKGAdojrKvkLtj9wzbfJ4YY5/X5EQ5/KW0HJLhw==
X-Received: by 2002:a05:6512:2214:b0:512:f7e0:47ce with SMTP id
	h20-20020a056512221400b00512f7e047cemr5051072lfu.44.1709457194374;
	Sun, 03 Mar 2024 01:13:14 -0800 (PST)
Received: from localhost.localdomain ([23.247.139.60])
	by smtp.gmail.com with ESMTPSA id
	rs11-20020a17090b2b8b00b0029af7dfd49asm7699989pjb.50.2024.03.03.01.13.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 03 Mar 2024 01:13:13 -0800 (PST)
From: Su Yue <glass.su@suse.com>
X-Google-Original-From: Su Yue <l@damenly.org>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 2/2] crm-fence-peer.9.sh: use join of node_state to judge
	whether node is banned
Date: Sun,  3 Mar 2024 17:12:59 +0800
Message-ID: <20240303091259.5045-2-l@damenly.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240303091259.5045-1-l@damenly.org>
References: <20240303091259.5045-1-l@damenly.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Mar 2024 07:32:11 +0100
Cc: lars.ellenberg@linbit.com
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

From: Su Yue <glass.su@suse.com>

crmd in node_state can't be "banned". join should be used instead
of crmd.

Signed-off-by: Su Yue <glass.su@suse.com>
---
 scripts/crm-fence-peer.9.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/crm-fence-peer.9.sh b/scripts/crm-fence-peer.9.sh
index a3353a7354a6..b326a1656c15 100755
--- a/scripts/crm-fence-peer.9.sh
+++ b/scripts/crm-fence-peer.9.sh
@@ -934,7 +934,7 @@ guess_if_pacemaker_will_fence()
 
 	# for further inspiration, see pacemaker:lib/pengine/unpack.c, determine_online_status_fencing()
 	[[ -z $in_ccm ]] && will_fence=true
-	[[ $crmd = "banned" ]] && will_fence=true
+	[[ $join = "banned" ]] && will_fence=true
 	if [[ ${expected-down} = "down" && $in_ccm = "false"  && $crmd != "online" ]]; then
 		: "pacemaker considers this as clean down"
 	elif [[ $in_ccm = false ]] || [[ $crmd != "online" ]]; then
-- 
2.44.0

