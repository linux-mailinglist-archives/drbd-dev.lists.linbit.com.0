Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABDA86FA12
	for <lists+drbd-dev@lfdr.de>; Mon,  4 Mar 2024 07:32:20 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4149B420364;
	Mon,  4 Mar 2024 07:32:18 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3BBD2420641
	for <drbd-dev@lists.linbit.com>; Sat,  2 Mar 2024 16:47:14 +0100 (CET)
Received: by mail-wm1-f54.google.com with SMTP id
	5b1f17b1804b1-412d503f34dso3664595e9.3
	for <drbd-dev@lists.linbit.com>; Sat, 02 Mar 2024 07:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709394433;
	x=1709999233; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=AyqILGj8LozUO6lNz7jPIDUHki71aFKUXOIGpIu7ChE=;
	b=jmtJONU1zsa4k42Ov69qM2/4+Ee3FE/wFmnYIYJb7Rdmn8JFcGkqbRJarjIzeEj/90
	pvHnH8Slu/1V39kEq58d3JPtrbR7KfvZ/NBxFWyJFI/TgstaNpyv6w5106jlO4Iw+4+J
	U67n3I9/YqqeIVMm+pvlXBzF9F3HAbmop4KBnBMfb7wChk4EZmqlvs6QkTZehjOTrS4H
	OR4RxDsWqEi61kAcPfty/HoW6Br3LA3d88RjjAxlInsiFsltPYyIzROnBx91F0rqgntm
	iuyxCpsv2+IQLyBVbZZCkTpam0XprUtGpkN5FMMe5kpQD8JAwSbLGU8A3fClcDKHoO/7
	5RrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1709394433; x=1709999233;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-message-state:from:to:cc:subject:date:message-id
	:reply-to;
	bh=AyqILGj8LozUO6lNz7jPIDUHki71aFKUXOIGpIu7ChE=;
	b=PVEzlkSN4u6Cg1DICcPfpqK3+AWb4ddoQ+0EXxoQyvPdnt8/8nBfGeUghWri3skSPU
	+cpFye7m6nJ5qqF6ittrABj146i5DAz1hWEekQqwcniIualgbAUxLppgW8j9ibkZ/eUu
	hHrmiIqbqbApStwLA+AFUgDpps598ZUemu9A04Gw72nYPhPU+BWQY3oK5IBCbqy6csK9
	siqWTWGSz4yzGf5odDTuUjpxCxh8gMcAgnnIKvoHI9fSK26rB8wzPCUVt94oqcZv3kyu
	d2oRZeXjPGKMtMIWQ5I1o/F/wMXc7kmGvpGikwjbO+fYVJ7UmY++ASDQNbOIMGmVBsls
	aPuA==
X-Gm-Message-State: AOJu0YzSpVDkf9opRWF4ohGLH3OD/+wTJCM2msKUWQ/WP6dQfOCijZo+
	qsE4EJ2sAoDvefipKNxSmCHEeY7yGniBGBGkZrwzhjxmxrvJF5VMbPF7s/i9tN4RTmF9BYQ/uoR
	OyYE=
X-Google-Smtp-Source: AGHT+IF+sfABwZZ3c88+wPt/RoLTL7SYF0YRkbuRpqwWiu8UIYXt5PkZ1lPwvHV0Fp2qW9x7dKe1YQ==
X-Received: by 2002:a05:600c:4446:b0:412:8d27:b757 with SMTP id
	v6-20020a05600c444600b004128d27b757mr3457342wmn.37.1709394433076;
	Sat, 02 Mar 2024 07:47:13 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([89.159.1.53])
	by smtp.gmail.com with ESMTPSA id
	l33-20020a05600c1d2100b00412ca88537dsm4560258wms.0.2024.03.02.07.47.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 02 Mar 2024 07:47:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: drbd-dev@lists.linbit.com
Subject: [PATCH] configure.ac: Add an option to disable host udev version
	checks
Date: Sat,  2 Mar 2024 16:41:30 +0100
Message-Id: <20240302154129.683863-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 04 Mar 2024 07:32:11 +0100
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

In cross-compilation environment, the build host might have an outdated
udev or no udev at all. But the user may still want to build with the
enabled udev rule (for its udev-enabled target).

This patch adds a "--disable-udevchecks" option the disable build host
udev version check at configure-time and unconditionally install the
enabled udev rule. Without this new option, the behavior stays the same
(checks enabled).

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
As a side note, this host udev check triggered a non-reproducility
noticed by the Openembedded/Yocto project[0]. The first build may have been done
on a udev-incompatible host, the second on a compatible one resulting in
a disabled then enabled udev rule.
[0]: https://autobuilder.yocto.io/pub/repro-fail-openembedded/meta-networking/oe-reproducible-20240224-_r8qnlae/packages/diff-html/#reproducibleA-tmp---reproducibleA-tmp-deploy---reproducibleA-tmp-deploy-ipk---reproducibleA-tmp-deploy-ipk-core-------reproducibleA-tmp-deploy-ipk-core-----drbd-utils_-.--.--r-_core----.ipk---data.tar.zst---data.tar---file-list
---
 configure.ac | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/configure.ac b/configure.ac
index f1d69ea3..4c56d33b 100644
--- a/configure.ac
+++ b/configure.ac
@@ -71,6 +71,11 @@ AC_ARG_WITH([udev],
 	[AS_HELP_STRING([--with-udev],
 			[Enable udev integration])],
 	[WITH_UDEV=$withval])
+AC_ARG_ENABLE([udevchecks],
+	[AS_HELP_STRING([--disable-udevchecks],
+			[Disable host udev version checks])],
+	[],
+	[enable_udevchecks=yes])
 AC_ARG_WITH([xen],
 	[AS_HELP_STRING([--with-xen],
 			[Enable Xen integration])],
@@ -315,7 +320,7 @@ if test -z $GIT; then
    AC_MSG_WARN(Cannot update buildtag without git. You may safely ignore this warning when building from a tarball.)
 fi
 
-if test $UDEVADM = false && test $UDEVINFO = false; then
+if test "x$enable_udevchecks" != "xno" && test $UDEVADM = false && test $UDEVINFO = false; then
    if test "$WITH_UDEV" = "yes"; then
      AC_MSG_WARN([udev support enabled, but neither udevadm nor udevinfo found on this system.])
    fi
@@ -423,7 +428,7 @@ else
     test -z $INITDIR && INITDIR="$sysconfdir/init.d"
 
     dnl Our udev rules file is known to work only with udev >= 85
-    if test "$WITH_UDEV" = "yes"; then
+    if test "x$enable_udevchecks" != "xno" && test "$WITH_UDEV" = "yes"; then
        udev_version=$( set -- $($UDEVADM version); echo $1 )
        if test -z "$udev_version"; then
 	    udev_version=$( set -- $($UDEVINFO -V); echo $3 )
-- 
2.39.2

