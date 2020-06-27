Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 716E428BC1F
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:39:32 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 751194203A6;
	Mon, 12 Oct 2020 17:39:31 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D00DB4202B1
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:39:29 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id h7so19731661wre.4
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-original-authentication-results:x-gm-message-state:resent-from
	:resent-date:resent-message-id:resent-to:from:to:cc:subject:date
	:message-id:mime-version:content-transfer-encoding;
	bh=gUR7SO/jA66AQiWEGtHvArqwtsInTo0Jq9Iu9eNoSwU=;
	b=pKwDsLdAFBUqWAxBy+/RbiWGrjQTKlg/H1LmOyEe5uInDWjU4+NuMpGkkYOTfke86O
	XYU7FQvgWYSHwEBDfR6isi5Bhl9+npbvrVf4tR+/FSRco/TyaEapIcxJO8OtXh5aD7Vo
	B88DZDi6H/hT2qdb+2G1g1nkC7v57iT4SFfxXSd3he5Pm7Yy0ot+C+uesUn7yT2PQIj4
	WJgACkOoe66wIZCpOinUBS/0x28u2VsVABQveA3jpm3yyn3kbTq+5OSB0msWYsAUi4FZ
	9fcUkVDO3jv4WWdPMzonUGIcDX+JHgLWB2wF2bDHf4G8xd2ZTZe34I7zVGHEFepYnM+1
	IfQg==
X-Original-Authentication-Results: smtp.al2klimov.de;
	auth=pass smtp.auth=aklimov@al2klimov.de
	smtp.mailfrom=grandmaster@al2klimov.de
X-Gm-Message-State: AOAM532pOu+UMS0RkndYWsdfLpCYko3RC5FVFg+33k1ca5arczag2/az
	P3HJtvkJWJ2Xc5iIGZOjNSoPohyJc+gqRwHd
X-Google-Smtp-Source: ABdhPJyI8qZ88jl+GDUdjsHNO9s80ir7SUXkN8yHnQa6qQUaf7I82tqsn65ZsgGDRgvBkQ5WyC/WsA==
X-Received: by 2002:a5d:6591:: with SMTP id q17mr30276424wru.173.1602517168723;
	Mon, 12 Oct 2020 08:39:28 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	j101sm27416389wrj.9.2020.10.12.08.39.27
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:39:28 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:39:26 +0200
Resent-Message-ID: <20201012153926.GQ2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 356 seconds by postgrey-1.31 at mail19;
	Sat, 27 Jun 2020 12:37:21 CEST
Received: from smtp.al2klimov.de (smtp.al2klimov.de [78.46.175.9])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D8F27420112
	for <drbd-dev@lists.linbit.com>; Sat, 27 Jun 2020 12:37:21 +0200 (CEST)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
	by smtp.al2klimov.de (Postfix) with ESMTPA id B4757BC130;
	Sat, 27 Jun 2020 10:31:22 +0000 (UTC)
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
To: philipp.reisner@linbit.com, lars.ellenberg@linbit.com, corbet@lwn.net,
	axboe@kernel.dk, mchehab+samsung@kernel.org, drbd-dev@lists.linbit.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org
Date: Sat, 27 Jun 2020 12:31:11 +0200
Message-Id: <20200627103111.71771-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam-Level: ******
Authentication-Results: smtp.al2klimov.de;
	auth=pass smtp.auth=aklimov@al2klimov.de
	smtp.mailfrom=grandmaster@al2klimov.de
X-Spam: Yes
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [Drbd-dev] [PATCH] Replace HTTP links with HTTPS ones: DRBD driver
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

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
          If both the HTTP and HTTPS versions
          return 200 OK and serve the same content:
            Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 If there are any URLs to be removed completely or at least not HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See https://lkml.org/lkml/2020/6/26/837

 Documentation/admin-guide/blockdev/drbd/index.rst | 2 +-
 Documentation/admin-guide/blockdev/floppy.rst     | 6 +++---
 drivers/block/drbd/Kconfig                        | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/drbd/index.rst b/Documentation/admin-guide/blockdev/drbd/index.rst
index 68ecd5c113e9..561fd1e35917 100644
--- a/Documentation/admin-guide/blockdev/drbd/index.rst
+++ b/Documentation/admin-guide/blockdev/drbd/index.rst
@@ -10,7 +10,7 @@ Description
   clusters and in this context, is a "drop-in" replacement for shared
   storage. Simplistically, you could see it as a network RAID 1.
 
-  Please visit http://www.drbd.org to find out more.
+  Please visit https://www.drbd.org to find out more.
 
 .. toctree::
    :maxdepth: 1
diff --git a/Documentation/admin-guide/blockdev/floppy.rst b/Documentation/admin-guide/blockdev/floppy.rst
index 4a8f31cf4139..0328438ebe2c 100644
--- a/Documentation/admin-guide/blockdev/floppy.rst
+++ b/Documentation/admin-guide/blockdev/floppy.rst
@@ -6,7 +6,7 @@ FAQ list:
 =========
 
 A FAQ list may be found in the fdutils package (see below), and also
-at <http://fdutils.linux.lu/faq.html>.
+at <https://fdutils.linux.lu/faq.html>.
 
 
 LILO configuration options (Thinkpad users, read this)
@@ -220,11 +220,11 @@ It also contains additional documentation about the floppy driver.
 
 The latest version can be found at fdutils homepage:
 
- http://fdutils.linux.lu
+ https://fdutils.linux.lu
 
 The fdutils releases can be found at:
 
- http://fdutils.linux.lu/download.html
+ https://fdutils.linux.lu/download.html
 
  http://www.tux.org/pub/knaff/fdutils/
 
diff --git a/drivers/block/drbd/Kconfig b/drivers/block/drbd/Kconfig
index 52d885cdccb5..cbacddc55a1d 100644
--- a/drivers/block/drbd/Kconfig
+++ b/drivers/block/drbd/Kconfig
@@ -35,7 +35,7 @@ config BLK_DEV_DRBD
 	  cache coherency.
 
 	  For automatic failover you need a cluster manager (e.g. heartbeat).
-	  See also: http://www.drbd.org/, http://www.linux-ha.org
+	  See also: https://www.drbd.org/, http://www.linux-ha.org
 
 	  If unsure, say N.
 
-- 
2.27.0

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
