Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D32CAB97E5
	for <lists+drbd-dev@lfdr.de>; Fri, 16 May 2025 10:41:42 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1168E16CD82;
	Fri, 16 May 2025 10:41:41 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AA17E16B860
	for <drbd-dev@lists.linbit.com>; Thu, 15 May 2025 04:48:28 +0200 (CEST)
Received: by mail-wr1-f47.google.com with SMTP id
	ffacd0b85a97d-3a0bcb1f1afso62840f8f.0
	for <drbd-dev@lists.linbit.com>; Wed, 14 May 2025 19:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1747277307; x=1747882107; darn=lists.linbit.com;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=FItXa11qN+0s7dVpL1ctUiYBBXBhkE0ieGUkZAanOhI=;
	b=DXrUOXPb2GwUY/k0IjqNa+HV834tPkeydVhtzXXTmIck6b1tqqxGcC4t9AgxwIHohJ
	LHR/PQyqphmQ3OoWnIco5sOaD2OZB0RXb3RqzXM1YF2/QDLBwBlIPpb3oY+Z3BLdXWx0
	MptuTUSzGavvMXBQGoT//Bo80n7uAQ1CzeKFibrpfpXaKmCX9cWDvsZrOLIt11U4rqVu
	zHplAm5UBnvgsAc2B/kcqyLbSe41UT+unPgGyPtGBwKGAm6AMkrkm2Bidjl9z1CQJtsV
	lIDwleay3UJKthBStUpLOAGet/hgeHFdyNKVfHSZkjmslwTYC6VgXaTOVuIl7DywWev9
	ueVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1747277307; x=1747882107;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=FItXa11qN+0s7dVpL1ctUiYBBXBhkE0ieGUkZAanOhI=;
	b=e+jHnwhikC+wIF80aor/P71FrOMdrLg62dRF4lJ8imhPrnnPr1XbX+woHHC3kn1agu
	9rljQvKStV8/fQ+ExWMlyMSzY1OiCpnCKpT6ZvDVj83ptMVnmxirF/cxc462WVTztY4/
	pLnGlUk3KIMcI0PKWRNOlq/YT+uToFBsYVoqkjmELm1XBMcZ8J+5aLOWUwl6jbH2vJAR
	KWEjHytW7t/LecMbGv+9GkBjhPhAaFKdXgg8nLYYGWYpFojD4+j6vyiI+zKb3rzOWogl
	88InYJtE3UpJdwm8Y9fOHZF7f5rGyPvslj6n1XOwge+lmj/5fDybpEBlQGRrF7j28wbA
	HOGg==
X-Gm-Message-State: AOJu0YwSw+QQf2qs9ICsI4bgx3DL00dgyqgNtYGD5rfjffeHJ6a93Avi
	mJpza6/8L85/OYsr/9NkWnvL+1qPT/q2HXlZ39z0j05gildhUrPSY6660NV0m/P2hIItDgsDjSI
	h
X-Gm-Gg: ASbGncuvQ94oOkoM5WiDgvR31WE6kOhO4mMcP3tmKgiAb2j/UFKanx/Tccw1+kFtHbk
	fps6fRrs8VX7kZxRZEmfww+YosV3sVNnMx7x1a9M7Ko5E1772LZ13YabRKK09+keFxpndvo/VVo
	fY4TvIzYbU0jo+JC7NmNmhBDo/9XeR9cv7XdxaqLPKMOdPd1cAUfk9rSL5IS2xObZU3KebvHxCY
	usX2C/KJ4i+Wwrdsy/tWBJkvTy2bJ1jkhCyw6GHtXeQudoGjAN+pz2WsA4HRLMkmmXxs4p30yJT
	bf+eSaHLXJJse6A1tU1w/+s3nlHx3OaR/M+hNdD8TUP92AgBeMNw
X-Google-Smtp-Source: AGHT+IGBpit/dQSxpGiogOvaL6dQSD5si1R+YPH1HRVcwlJgsU1nEQ/km2OaORmO7ad7OYUWxF4b7w==
X-Received: by 2002:a05:6000:250d:b0:38d:e472:e6a0 with SMTP id
	ffacd0b85a97d-3a3496bd89fmr1677258f8f.9.1747277307296; 
	Wed, 14 May 2025 19:48:27 -0700 (PDT)
Received: from p15.suse.cz ([202.127.77.110]) by smtp.gmail.com with ESMTPSA id
	d2e1a72fcca58-7423772832csm10578197b3a.59.2025.05.14.19.48.25
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 May 2025 19:48:26 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: drbd-dev@lists.linbit.com
Subject: [PATCH v2 2/2] remove lock file after using it
Date: Thu, 15 May 2025 10:48:15 +0800
Message-ID: <20250515024817.25717-3-heming.zhao@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515024817.25717-1-heming.zhao@suse.com>
References: <20250515024817.25717-1-heming.zhao@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 16 May 2025 10:41:11 +0200
Cc: zzhou@suse.com
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

In a SELinux env, if a user runs as root to set up a DRBD device,
it will leave a lock file in "/var/run/drbd/lock/". Then HA pacemaker
will fail to set up DRBD because of a permission issue.

This commit removes the lock file when drbdsetup and drbdmeta close
the lock fd.

Signed-off-by: Heming Zhao <heming.zhao@suse.com>
---
 user/shared/drbdmeta.c    |  3 +++
 user/shared/shared_tool.c | 40 +++++++++++++++++++++++++++++----------
 user/shared/shared_tool.h |  2 +-
 user/v84/drbdsetup.c      |  2 +-
 user/v9/drbdsetup.c       |  2 +-
 5 files changed, 36 insertions(+), 13 deletions(-)

diff --git a/user/shared/drbdmeta.c b/user/shared/drbdmeta.c
index 099592a530da..c84c09abef86 100644
--- a/user/shared/drbdmeta.c
+++ b/user/shared/drbdmeta.c
@@ -5482,6 +5482,9 @@ int main(int argc, char **argv)
 	if (minor_attached)
 		fprintf(stderr, "# Output might be stale, since minor %d is attached\n", cfg->minor);
 
+	if ((cfg->minor != -1) && (cfg->lock_fd != -1))
+		dt_unlock_drbd(cfg->lock_fd, cfg->minor);
+
 	// dummy bool normalization to not return negative values, the usual "FIXME sane exit codes" still applies */
 	return !!rv;
 	/* and if we want an explicit free,
diff --git a/user/shared/shared_tool.c b/user/shared/shared_tool.c
index 20598132a0ac..b45d71379d96 100644
--- a/user/shared/shared_tool.c
+++ b/user/shared/shared_tool.c
@@ -759,9 +759,26 @@ void ensure_dir(const char *dirname)
 	}
 }
 
+static char *get_lock_filename(int minor, int check_dir)
+{
+	int sz;
+	char *lfname;
+
+	if (check_dir)
+		ensure_dir(drbd_lock_dir());
+
+	sz = asprintf(&lfname, "%s/drbd-%d-%d",
+		      drbd_lock_dir(), LANANA_DRBD_MAJOR, minor);
+	if (sz < 0) {
+		perror("");
+		exit(20);
+	}
+	return lfname;
+}
+
 int dt_lock_drbd(int minor)
 {
-	int sz, lfd;
+	int lfd;
 	char *lfname;
 
 	/* THINK.
@@ -777,14 +794,7 @@ int dt_lock_drbd(int minor)
 	 * We should store something in the meta data to detect such abuses.
 	 */
 
-	ensure_dir(drbd_lock_dir());
-	sz = asprintf(&lfname, "%s/drbd-%d-%d",
-		      drbd_lock_dir(), LANANA_DRBD_MAJOR, minor);
-	if (sz < 0) {
-		perror("");
-		exit(20);
-	}
-
+	lfname = get_lock_filename(minor, 1);
 	lfd = get_fd_lockfile_timeout(lfname, 1);
 	free (lfname);
 	if (lfd < 0)
@@ -793,10 +803,20 @@ int dt_lock_drbd(int minor)
 }
 
 /* ignore errors */
-void dt_unlock_drbd(int lock_fd)
+void dt_unlock_drbd(int lock_fd, int minor)
 {
+	int ret;
+	char *lfname;
+
 	if (lock_fd >= 0)
 		unlock_fd(lock_fd);
+
+	lfname = get_lock_filename(minor, 0);
+	ret = unlink(lfname);
+	free(lfname);
+	if (ret < 0) {
+		perror("unlink");
+	}
 }
 
 void dt_print_gc(const uint32_t* gen_cnt)
diff --git a/user/shared/shared_tool.h b/user/shared/shared_tool.h
index 3dedf79683f5..44f10b549a77 100644
--- a/user/shared/shared_tool.h
+++ b/user/shared/shared_tool.h
@@ -108,7 +108,7 @@ extern bool addr_scope_local(const char *input);
 extern unsigned long long m_strtoll(const char* s,const char def_unit);
 extern int only_digits(const char *s);
 extern int dt_lock_drbd(int minor);
-extern void dt_unlock_drbd(int lock_fd);
+extern void dt_unlock_drbd(int lock_fd, int minor);
 extern int dt_minor_of_dev(const char *device);
 extern void dt_print_gc(const uint32_t* gen_cnt);
 extern void dt_pretty_print_gc(const uint32_t* gen_cnt);
diff --git a/user/v84/drbdsetup.c b/user/v84/drbdsetup.c
index 9127a4462a0e..530af7b70b95 100644
--- a/user/v84/drbdsetup.c
+++ b/user/v84/drbdsetup.c
@@ -3715,7 +3715,7 @@ int main(int argc, char **argv)
 	rv = cmd->function(cmd, argc, argv);
 
 	if ((context & CTX_MINOR) && !cmd->lockless)
-		dt_unlock_drbd(lock_fd);
+		dt_unlock_drbd(lock_fd, minor);
 	return rv;
 }
 #endif
diff --git a/user/v9/drbdsetup.c b/user/v9/drbdsetup.c
index 8aa9b7c48a6a..e7fa4d8bad7b 100644
--- a/user/v9/drbdsetup.c
+++ b/user/v9/drbdsetup.c
@@ -4779,6 +4779,6 @@ int drbdsetup_main(int argc, char **argv)
 	rv = cmd->function(cmd, argc, argv);
 
 	if ((context & CTX_MINOR) && !cmd->lockless)
-		dt_unlock_drbd(lock_fd);
+		dt_unlock_drbd(lock_fd, minor);
 	return rv;
 }
-- 
2.43.0

