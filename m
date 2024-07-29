Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA7493F6C6
	for <lists+drbd-dev@lfdr.de>; Mon, 29 Jul 2024 15:35:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8F5AB42064C;
	Mon, 29 Jul 2024 15:35:29 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1B8184203C0
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jul 2024 15:34:31 +0200 (CEST)
Received: by mail-lj1-f181.google.com with SMTP id
	38308e7fff4ca-2f025b94e07so45144911fa.0
	for <drbd-dev@lists.linbit.com>; Mon, 29 Jul 2024 06:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1722260070; x=1722864870; darn=lists.linbit.com;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=8whJPoxE5nej44+rcv+30gqBy2ml5Z82RRk+sBNK/Co=;
	b=BxPl/zq/9tv1vSw3cep0lYAL1pBTWy0dLCZLUESDrK4Ajmg9ofSGm1GWsePWPVBpIj
	E69/3cbhXH2tY5eOBMLcK3G0CwFzoiggkf1B3ONyjF0Keg9tOVtLATgoZMZc6tww5lpV
	BY8aFzk/5q2zCm811VSzFpRMxBw3qZ855Ag3bd+VVjZhrLH+l8rz+hPpu3aADymVfg/l
	wnk5tBTBULwf87+iCcfAhDVVJEMTAzMUcmGSkjHLUEPkcgKuoVxcyxRZihyBGcE76BV6
	WS1GTm5kflaqMBSfVa7+zw5M5OW+HI/O3XEAHbe53EhVv9dnSPOsEDk1he+4X8v3P6Bw
	pBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1722260070; x=1722864870;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=8whJPoxE5nej44+rcv+30gqBy2ml5Z82RRk+sBNK/Co=;
	b=agTHFWoN6eOlHU0xZ3a+os4uC6kaVy2opqaxMFYLu1fczAF0TE+4KZn6kMJH/jCCl1
	NBs4rBkIhAiraNpdJIi9WZbSotLtzDq9RTSX7IGW9ffCcb6CHnWDlD+PI9FX07FaXq4N
	SoiWYkBseA35/HhkAIcySWyinJ1AJc7YPArj9CA5JX06rKem6KGKHO4p4AWoTpHGVvpE
	/AVp929PMB/JSRvYzebSDl0yL5C1SExSfDinMoDtGIL0hWb/AS96+Crv+P3YGz+s54Lf
	p3eBP5/WseIOf0w7xTodMBScZJHK3Nc0wpTV41+6J8/HHd/yiU0uHRfzVshDrESI1pJy
	NTwg==
X-Gm-Message-State: AOJu0YyI9+iXpsrzpPYC5vnJMZTaokZgcTM2FNOJm6kvbOQMFf1BvyYT
	Gs5lW3++N8Di8O7LaWU9zhKBlt6JgjTCHN8YzJbrtZz8IBSWeyqpncj4e7uwKLebboRJkOIXlME
	W
X-Google-Smtp-Source: AGHT+IEOMF7YTyyoKhRsdQJpTmdCN2/bdmETMrpYmpluX6q/2+ox4jQV47nfgPncGwCv6h+vPFvOnA==
X-Received: by 2002:a2e:9b90:0:b0:2ef:22bc:6fb0 with SMTP id
	38308e7fff4ca-2f12ee241efmr56519411fa.34.1722260070285; 
	Mon, 29 Jul 2024 06:34:30 -0700 (PDT)
Received: from localhost.localdomain ([23.247.139.60])
	by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-70ead71832csm6802427b3a.72.2024.07.29.06.34.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 29 Jul 2024 06:34:29 -0700 (PDT)
From: Su Yue <glass.su@suse.com>
To: drbd-dev@lists.linbit.com
Subject: [RFC PATCH 2/3] drbd.ocf: update regex of sed for new output from
	crm_resource
Date: Mon, 29 Jul 2024 21:34:09 +0800
Message-ID: <20240729133410.8332-3-glass.su@suse.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729133410.8332-1-glass.su@suse.com>
References: <20240729133410.8332-1-glass.su@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Since Pacemaker-2.1.0
crm_resource --resource "$OCF_RESOURCE_INSTANCE" --locate outputs
'resource promotable-clone is running on: cluster02 Promoted'
was
'resource promotable-clone is running on: cluster02 Master'.

So update the regular expression.

Signed-off-by: Su Yue <glass.su@suse.com>
---
 scripts/drbd.ocf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/drbd.ocf b/scripts/drbd.ocf
index 133aff737455..bbe25f38edda 100755
--- a/scripts/drbd.ocf
+++ b/scripts/drbd.ocf
@@ -999,7 +999,7 @@ crm_resource_locate_master()
 	called_crm_resource_locate=true
 	DRBD_PRIMARY_PEER_according_to_pcmk=$(
 		crm_resource --resource "$OCF_RESOURCE_INSTANCE" --locate 2>/dev/null |
-		sed -ne 's/^.*is running on: \([^ ]*\) Master.*$/\1/p' |
+		sed -ne 's/^.*is running on: \([^ ]*\) \(Master\|Promoted\).*$/\1/p' |
 		grep -vix -m1 -e "$HOSTNAME")
 }
 
-- 
2.45.2

