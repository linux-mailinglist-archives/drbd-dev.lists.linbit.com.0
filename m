Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0939E2D9312
	for <lists+drbd-dev@lfdr.de>; Mon, 14 Dec 2020 06:56:23 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AA40942082C;
	Mon, 14 Dec 2020 06:56:13 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
	[209.85.166.169])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 136D24205A9
	for <drbd-dev@lists.linbit.com>; Sun, 13 Dec 2020 06:59:08 +0100 (CET)
Received: by mail-il1-f169.google.com with SMTP id g1so12787620ilk.7
	for <drbd-dev@lists.linbit.com>; Sat, 12 Dec 2020 21:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B3MerAz6CxwlBZxnanBMvYILKAxYlgr54EtmdOqbjYI=;
	b=Q49MW5b2wC2EO9JM9bOlabRmQOgs/Ix1tY6/ug5HGwxZK6Nn864rja0ecS63M4rdb5
	ZAR6lFvu/I+iFTz0epCChVj5MW/s/sby4PUOeq4BqvpdC2AvPS93K6Jq+8jsyq7u9pm9
	llamfWN60gyDzSPHPNrJ463oJbKI5/ljqJzpao8m/pNUM1c/90ojdu8eJZO0zSSZ+fmo
	DltrEwxYzvvIlb/KS6xYBWXdL5YbNiNQVxTvIoGnb3TMVYEJhyMbjOGmlBexEhRDtLTE
	zL8wJPiUmUHYv6pUpFAJyrW49eejq4Tk6IgHpZ3Zk+0rY2iBfJzX/Dp+W58bvZzcif4K
	E03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B3MerAz6CxwlBZxnanBMvYILKAxYlgr54EtmdOqbjYI=;
	b=bYVWRQTpT00KjHdQL1hFC1WhZDg6H97RAqnnRKob41wsmHFDUrWOZn6l7AyG9eEsvq
	L/ILwOMXjPzh++mPXNNb4SY47U+ngd2K3OtVBAbK/mhmb2IWubNl9JprzfHZt8AoMeKv
	sG2qyCRPM4ZB8gZA+DwoaIcSwyclBTX6snFuKdXXJWT3V1fLXeL5zKLPsMDnL+L2TuQi
	hsvmliGaUETSHpjSY9h+aDI/d3evwo8yfBji/i4xdgU11yAsZt3NxeR4E+dlD00CKgjm
	ZTNmvfMXnpuVA8gn1XeXCljB+m5v3pypwz7ZEQWRZkdjyIzSg+S5ZV8yQodBD6iWmURu
	hgWw==
X-Gm-Message-State: AOAM531HJkm3r8aeaJS5g3UZdp6tSK0j3dNPCsgirpm9HLPIKnGMPfY+
	IGVcZR6k3uQNsWWYKBwO2gj4wh1muNgYwQ==
X-Google-Smtp-Source: ABdhPJxXAx88ztLDE85pRXo2fopdrXokFwBmiSIpECCSOm9ZEgeZLXBrGCLsvScyF946lYbj+mMerw==
X-Received: by 2002:a92:845c:: with SMTP id l89mr26011719ild.114.1607839147878;
	Sat, 12 Dec 2020 21:59:07 -0800 (PST)
Received: from aldarion.fios-router.home
	(pool-74-97-22-49.prvdri.fios.verizon.net. [74.97.22.49])
	by smtp.gmail.com with ESMTPSA id s1sm6962752iot.0.2020.12.12.21.59.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 12 Dec 2020 21:59:07 -0800 (PST)
From: Michael D Labriola <michael.d.labriola@gmail.com>
To: drbd-dev@lists.linbit.com
Date: Sun, 13 Dec 2020 00:58:53 -0500
Message-Id: <20201213055859.3305-3-michael.d.labriola@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201213055859.3305-1-michael.d.labriola@gmail.com>
References: <20201213055859.3305-1-michael.d.labriola@gmail.com>
X-Mailman-Approved-At: Mon, 14 Dec 2020 06:56:11 +0100
Subject: [Drbd-dev] [PATCH 2/8] compat: fix include for blkdev_get_by_path
	test
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

This function lives in linux/blkdev.h

Signed-off-by: Michael D Labriola <michael.d.labriola@gmail.com>
---
 drbd/drbd-kernel-compat/tests/have_blkdev_get_by_path.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drbd/drbd-kernel-compat/tests/have_blkdev_get_by_path.c b/drbd/drbd-kernel-compat/tests/have_blkdev_get_by_path.c
index d0bae496..f795c1d1 100644
--- a/drbd/drbd-kernel-compat/tests/have_blkdev_get_by_path.c
+++ b/drbd/drbd-kernel-compat/tests/have_blkdev_get_by_path.c
@@ -1,4 +1,4 @@
-#include <linux/fs.h>
+#include <linux/blkdev.h>
 
 /*
  * In kernel version 2.6.38-rc1, open_bdev_exclusive() was replaced by
-- 
2.17.1

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
