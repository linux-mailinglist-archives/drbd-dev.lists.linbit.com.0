Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F0086FA13
	for <lists+drbd-dev@lfdr.de>; Mon,  4 Mar 2024 07:32:24 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 87E9E42062A;
	Mon,  4 Mar 2024 07:32:23 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
	[209.85.167.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E70FD42062A
	for <drbd-dev@lists.linbit.com>; Sun,  3 Mar 2024 10:13:13 +0100 (CET)
Received: by mail-lf1-f54.google.com with SMTP id
	2adb3069b0e04-512e39226efso3313011e87.0
	for <drbd-dev@lists.linbit.com>; Sun, 03 Mar 2024 01:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1709457192; x=1710061992; darn=lists.linbit.com;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=PRF2l+Gw3LD+/v4EZqqlKqbcscuB8dHk0ghtaLYEkj8=;
	b=Wb3Rs222Lfv1TZNesKukpJRCl/u5jFHdbPU3LLFXWDqsrlgvMkZprPI5eFH+SRCRvX
	hIyGcfQFya70ihbn41um+LZrX9aOLtUWrN1kCOblAz6ggFWtgwuVaM3bv4HjbH6hKPia
	6PPHPJ546c3CGtIBdgbCkLv9QexoPziC7+VaNhFR6FXqdGB200pSXdqSdGJbS3+fQRzw
	vb65al6JBMGV7cRvNsXuQUxqSwlOXPOyOcKNxYLBaz8cHCG/Bv5nPzywsXyjSoFAoNBM
	fwozFjpXwD11XWwMqytZ2IUuv/yVrAK3LJ/Jb7NQ9FDZYLhQ+WZ/ke08yJOxfXKrGpLN
	9OYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709457192; x=1710061992;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=PRF2l+Gw3LD+/v4EZqqlKqbcscuB8dHk0ghtaLYEkj8=;
	b=WrM2JCI+0ao9TqqgZ8lsaSpskxwvDzC+5gnY8pow+P1owR2S9tjloPLNLdSJCPm/ME
	quYMCwekDNWfgxsrZzpJLFZmUQi231E10/AY4QMNnN9DZYzmO5eb6falQoi48LYakxCs
	v6YULJOAFC3zEIWZ5RLzEUWy7+Y+NbMF3XdXVgIADWRmAaH+1O20eiV3eBi+6bomuZ2F
	Rj8Chlfiho5uu0tOePx+bUAMz7EjSM4xBq5848ZdwbCl+0a9rjePB3ar9l/QSc3Y+EFB
	FQTwwem1un7ugojCxh1Tk+TfuwQUKQ7BiLNx1EGLW0hb5S2bPOqVAGW2IXU+/KQ5gOhT
	ahNw==
X-Gm-Message-State: AOJu0YzgOEoiOC/lwZaUuC8T7x4z6wUeKq1cLs8aCCC8MO/vjVncQfJX
	iioEXWY2tqb2D4Seu7mAgOICX9NZDnLhOEt4/IZG//CIotuQoT6KSyYp0AzocLjc5AXmuvtsZMl
	H
X-Google-Smtp-Source: AGHT+IGP9OR7ONWwwvGvgurwMhspyZ7h/pyEGmrIaJtJkjsqdbScdgzKNne9Ivd5JSduyrgvHw+9eg==
X-Received: by 2002:a05:6512:ea3:b0:513:2858:6a67 with SMTP id
	bi35-20020a0565120ea300b0051328586a67mr4633860lfb.63.1709457192534;
	Sun, 03 Mar 2024 01:13:12 -0800 (PST)
Received: from localhost.localdomain ([23.247.139.60])
	by smtp.gmail.com with ESMTPSA id
	rs11-20020a17090b2b8b00b0029af7dfd49asm7699989pjb.50.2024.03.03.01.13.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 03 Mar 2024 01:13:12 -0800 (PST)
From: Su Yue <glass.su@suse.com>
X-Google-Original-From: Su Yue <l@damenly.org>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 1/2] crm-fence-peer.9.sh: fix parsing in_ccm crmd fields of
	node_state with Pacemaker 2.1.7
Date: Sun,  3 Mar 2024 17:12:58 +0800
Message-ID: <20240303091259.5045-1-l@damenly.org>
X-Mailer: git-send-email 2.44.0
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

If pacemaker version < 2.1.7, in_ccm of node_state is "true" or "false"
and crmd is "online" or "offline".

pacemaker 2.1.7 changed the two fields into timestamps.
For in_ccm, the value is timestamp since when node has been a cluster
member("true"). A value 0 of means the node is not a cluster member("false").
For crmd, the value is timestamp since when peer has been online in
CPG("online"). A value 0 means the peer is offline in CPG("offline").

The original code doesn't handle these fields in timestamp format.
Since there are many comprare of strings in context, converting in_ccm and crmd
from timestamps/0 to old strings is simpler and clearer.

Link: https://github.com/ClusterLabs/pacemaker/blob/Pacemaker-2.1.7/lib/pengine/unpack.c#L1581
Signed-off-by: Su Yue <glass.su@suse.com>
---
 scripts/crm-fence-peer.9.sh | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/scripts/crm-fence-peer.9.sh b/scripts/crm-fence-peer.9.sh
index 44da6516bf3f..a3353a7354a6 100755
--- a/scripts/crm-fence-peer.9.sh
+++ b/scripts/crm-fence-peer.9.sh
@@ -888,6 +888,31 @@ guess_if_pacemaker_will_fence()
 		esac
 	done
 
+	# Copied from pacemaker-2.1.7:lib/pengine/unpack.c:
+	# Since crm_feature_set 3.18.0 (pacemaker-2.1.7):
+	#
+	# - in_ccm		::= <timestamp>|0
+	# Since when node has been a cluster member. A value 0 of means the
+	# node is not a cluster member.
+	# - crmd		::= <timestamp>|0
+	# Since when peer has been online in CPG. A value 0 means the peer
+	# is offline in CPG.
+	if [[ $in_ccm =~ ^[0-9]+$ ]]; then
+		if [[ $in_ccm = "0" ]]; then
+			in_ccm="false"
+		else
+			in_ccm="true"
+		fi
+	fi
+
+	if [[ $crmd =~ ^[0-9]+$ ]]; then
+		if [[ $crmd = "0" ]]; then
+			crmd="offline"
+		else
+			crmd="online"
+		fi
+	fi
+
 	# if it is not enabled, no point in waiting for it.
 	if ! $stonith_enabled ; then
 		# "normalize" the rest of the logic
-- 
2.44.0

