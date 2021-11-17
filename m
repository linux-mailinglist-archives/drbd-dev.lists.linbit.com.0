Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBC455559
	for <lists+drbd-dev@lfdr.de>; Thu, 18 Nov 2021 08:15:53 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8AC5C42095A;
	Thu, 18 Nov 2021 08:15:52 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5DD32420204
	for <drbd-dev@lists.linbit.com>; Wed, 17 Nov 2021 10:38:19 +0100 (CET)
Received: by mail-pj1-f50.google.com with SMTP id
	j5-20020a17090a318500b001a6c749e697so4039470pjb.1
	for <drbd-dev@lists.linbit.com>; Wed, 17 Nov 2021 01:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-language:content-transfer-encoding;
	bh=Aki1NLeVtsw26dC02yR/rmj2WdHrHGV0mkw6Kw4rHCw=;
	b=jZ5dkPMf9wul3etBBgJWkwsyn7EE3gI+sqkW28tqz68xjxuD27gIO1xXt/szcXsrDZ
	5jN1zYJ9RnRLgDEzwyRoatlR/N+OwJuRjYPaHqLJpw/zbXqB+txldPOfJA8b/YjBUZCt
	4nEYacysDDtBJhp4GrD86U2byGGheF9PkTZtgsL+nTM2yEsPsJvGxOE9fIlm8RhhFXU8
	kP+iwB6Mp/RmjTDPKXXC2upfjPKR72Rc/O/g8JKeOvDBOsq1cN0moJxaKSm8WSAjjBIX
	PventnqvI1R5PBVuFQtNtUDyF3FDAP9Nvx3K1YxepWnxTqr9KPDhAnSMwHilr/gwI23N
	rXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-language:content-transfer-encoding;
	bh=Aki1NLeVtsw26dC02yR/rmj2WdHrHGV0mkw6Kw4rHCw=;
	b=2UZIrRQ1HXUiBqzF4lpEl9fnWs4Fh+JKrkTaDYLwG8iUkMrc5MF6miwqSFO3cSYkIr
	EfSQtx+gHa0CiSZDaaULcyL/pdgjlXGSRnl2NL+ml/k6/FZmMxjvPnqypHerFMhV/qAV
	LVAeIu+aFKxkHiy3v8T+8RMuWAmhmIoYCZr7rdVcmWWuDzKSM3RmkDggfOsAqlbA0voB
	FF8yXbfnJv9x0m63Rxs7zF7BVTg+XiuPJ4/5jt2tWCoq6fZQKPPXSRY7ivZv65a9Lp8d
	ZyLpJjfGLlzxqTi11R0U5DxnZ+inlTEPfXO33McYaQ7snkrXqslwnbZXfdg6lr0+AgW0
	13GA==
X-Gm-Message-State: AOAM530IfvKB8SALOyQ6l0MDr6bT5QjH+cKQp5TjrZlMfiLWcz2YSIo5
	OrOpe6dCb4OczVps7s4rDv4=
X-Google-Smtp-Source: ABdhPJy1tYpf+Ff1f/HN12UhwDRBest1lP6OWxOPXMQlYVK1+8lb3BdUwEVMqc1YzlmYhEiilmUrOg==
X-Received: by 2002:a17:90b:4c0b:: with SMTP id
	na11mr8226675pjb.53.1637141898264; 
	Wed, 17 Nov 2021 01:38:18 -0800 (PST)
Received: from [192.168.11.5] (KD106167171201.ppp-bb.dion.ne.jp.
	[106.167.171.201])
	by smtp.gmail.com with ESMTPSA id rj8sm5338117pjb.0.2021.11.17.01.38.16
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 17 Nov 2021 01:38:17 -0800 (PST)
To: Jonathan Corbet <corbet@lwn.net>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <3cbff170-582b-b6cf-0988-e0d0c9b47505@gmail.com>
Date: Wed, 17 Nov 2021 18:38:14 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.14.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Thu, 18 Nov 2021 08:15:51 +0100
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com,
	linux-kernel@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-doc@vger.kernel.org
Subject: [Drbd-dev] [PATCH] docs: admin-guide/blockdev: Use subgraphs in
 node-states-8.dot
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

While node-states-8.dot has two digraphs, dot(1) command can not
properly handle multiple graphs in a DOT file.

Use subgraphs and merge them into a single graph.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Philipp Reisner <philipp.reisner@linbit.com>
Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
---
Hi Jon,

I happened to spot a broken DOT script at the bottom of

    https://www.kernel.org/doc/html/latest/admin-guide/blockdev/drbd/figures.html

and managed to fix it.

DRBD DRIVER maintainers,
If I'm missing something here, please let me know.

        Thanks, Akira
--
 .../blockdev/drbd/node-states-8.dot           | 25 +++++++++++--------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/drbd/node-states-8.dot b/Documentation/admin-guide/blockdev/drbd/node-states-8.dot
index bfa54e1f8016..993f0c152ead 100644
--- a/Documentation/admin-guide/blockdev/drbd/node-states-8.dot
+++ b/Documentation/admin-guide/blockdev/drbd/node-states-8.dot
@@ -1,13 +1,16 @@
-digraph node_states {
-	Secondary -> Primary           [ label = "ioctl_set_state()" ]
-	Primary   -> Secondary 	       [ label = "ioctl_set_state()" ]
-}
+digraph G {
+	compound=true;
+	subgraph node_states {
+		Secondary -> Primary           [ label = "ioctl_set_state()" ]
+		Primary   -> Secondary 	       [ label = "ioctl_set_state()" ]
+	}
 
-digraph peer_states {
-	Secondary -> Primary           [ label = "recv state packet" ]
-	Primary   -> Secondary 	       [ label = "recv state packet" ]
-	Primary   -> Unknown 	       [ label = "connection lost" ]
-	Secondary  -> Unknown  	       [ label = "connection lost" ]
-	Unknown   -> Primary           [ label = "connected" ]
-	Unknown   -> Secondary         [ label = "connected" ]
+	subgraph peer_states {
+		Secondary -> Primary           [ label = "recv state packet" ]
+		Primary   -> Secondary 	       [ label = "recv state packet" ]
+		Primary   -> Unknown 	       [ label = "connection lost" ]
+		Secondary  -> Unknown  	       [ label = "connection lost" ]
+		Unknown   -> Primary           [ label = "connected" ]
+		Unknown   -> Secondary         [ label = "connected" ]
+	}
 }

base-commit: 53b606fa29e321352a105978726b975b42b292a4
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
