Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4B8AB97DF
	for <lists+drbd-dev@lfdr.de>; Fri, 16 May 2025 10:41:29 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3910516CD6A;
	Fri, 16 May 2025 10:41:25 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 89FED16B81E
	for <drbd-dev@lists.linbit.com>; Wed, 14 May 2025 17:04:12 +0200 (CEST)
Received: by mail-wr1-f43.google.com with SMTP id
	ffacd0b85a97d-3a0b28d9251so1020819f8f.0
	for <drbd-dev@lists.linbit.com>; Wed, 14 May 2025 08:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=suse.com; s=google; t=1747235051; x=1747839851; darn=lists.linbit.com;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=zXohOHHddlMCa4kg57grX7Uam3OmxS4SwJXlHNOvuzY=;
	b=QH+lU1SwXUIjEYKVO1+GDvbU+EQ/X9tqYuSu1tWFfSH3tXAKgcgCaLKHl63jkIER8y
	Tu26ZvmGdMoziRpikmIfxxMEWD5Bqk7H5RR0bN4p2rOV7839er64/l5uAyNmfd0bSFTq
	WceBSzIYRV0suf2BFNF1p9m2U97+AbBKBRmUjJUnlhJzQ+l+f4LxgHoPbX/FtY+xNMnu
	W6IncX+IIgHsUDd+IjNfwpLQ/xRPabczMIUazLvRtk5nMsc3ZrhPI+EsZvEJ80K5Zk25
	XfTz3Q5YzhHAvWMtVkpAiKMPaEBDk1rMEFqksH49XRz4SUwfAz6/T+UbQV6YrLvzxbQh
	P7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1747235051; x=1747839851;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
	:subject:date:message-id:reply-to;
	bh=zXohOHHddlMCa4kg57grX7Uam3OmxS4SwJXlHNOvuzY=;
	b=Hbw4jrhzEDYjt+tsFAelwkC6R5abO7xqZkaIHbl53wu9UN+Yy2etmdN6IvOX2Lq4Q/
	ELaXtTHDgynTNIhR1clcQEL3I1w+qNSyopNM0ARVtWKSsGywEWx7emAQ/OzbzngYOqdC
	6bCOfDzgyIEBCiCqNex+tSs+1r+Sv1J9sJBf7Iy6/O1YVfoxV0kSdbC6I553AmMPQdPp
	92ta73APTLU/yzZWJ15n04z9l6/fbdjEmWmfOGxH6BNpP4CDfKNH65ryo+iwIQSlrZeO
	MHvh1PXSFk03bnAf7Kr4S30Qxa5gTmrs7FcOsoN7KolBcvCFh8AT6FzPrMkaT29a3h3i
	FcZw==
X-Gm-Message-State: AOJu0YxDIxlyO28vT0mzVhfTmiutsvkRRYZ8BQ4XawY4xrpACyiKISF6
	jWXnL8cJutGy6LnE8B7tMbu7MskZ63npf2Q2dDMiM44jt6Pmesp8XyHPxJM+elyo5HCqYFyl3HF
	S
X-Gm-Gg: ASbGnctaXx3nj+CfgWi7538lxgX1rtw3Yvf7eTGlMtX/s+oJJst+T7UxWz+y/OQek9c
	0TNBRD8lSbNufVNNrUOzVLhsjPk8BtQM6p4R1Kn7lL2GOyLUcL1jbg6iKr9e52OSsnEhwaigki0
	nf8RXhkbfS/eYm5KSr22qqpYMx8oIrmXAaptFUzG+qTenFs+xuXcjUoJ2Zb3jWQx1jGcuHRgx4D
	9Gpf8GJ7Azm3Hl/RWaVFsLrJe5qw7H4f8h7Pj3BMNaGCE3PiF/P5Lqo478U2YKdCIg85kYwVFO0
	sgabEBH9H8MmD/ZFQJMGlCJFUShYCwc9BHFztJlzgrg5gMlpB2BI2EJWbEEfwUgL4w==
X-Google-Smtp-Source: AGHT+IEiqqn8mILUp2pmBYcOAoFhZKfC4CktpNcQQhf5D47+5U5/Mg7qnsOOFh7Yv49Raj5T/Z+Bgw==
X-Received: by 2002:a05:6000:220c:b0:38f:2b3c:569e with SMTP id
	ffacd0b85a97d-3a349923696mr1040229f8f.11.1747235051254; 
	Wed, 14 May 2025 08:04:11 -0700 (PDT)
Received: from localhost.localdomain ([202.127.77.110])
	by smtp.gmail.com with ESMTPSA id
	41be03b00d2f7-b23493257bcsm8944484a12.6.2025.05.14.08.04.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 May 2025 08:04:10 -0700 (PDT)
From: Heming Zhao <heming.zhao@suse.com>
To: drbd-dev@lists.linbit.com
Subject: [PATCH 2/2] remove lock file after using it
Date: Wed, 14 May 2025 23:04:00 +0800
Message-ID: <20250514150402.15848-2-heming.zhao@suse.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514150402.15848-1-heming.zhao@suse.com>
References: <20250514150402.15848-1-heming.zhao@suse.com>
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
 user/shared/shared_tool.c | 16 +++++++++++++++-
 user/shared/shared_tool.h |  2 +-
 user/v84/drbdsetup.c      |  2 +-
 user/v9/drbdsetup.c       |  2 +-
 5 files changed, 21 insertions(+), 4 deletions(-)

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
index 20598132a0ac..f9ed4e7258f8 100644
--- a/user/shared/shared_tool.c
+++ b/user/shared/shared_tool.c
@@ -793,10 +793,24 @@ int dt_lock_drbd(int minor)
 }
 
 /* ignore errors */
-void dt_unlock_drbd(int lock_fd)
+void dt_unlock_drbd(int lock_fd, int minor)
 {
+	int sz;
+	char *lfname;
+
 	if (lock_fd >= 0)
 		unlock_fd(lock_fd);
+
+	sz = asprintf(&lfname, "%s/drbd-%d-%d",
+		      drbd_lock_dir(), LANANA_DRBD_MAJOR, minor);
+	if (sz < 0) {
+		perror("");
+		exit(20);
+	}
+	if (unlink(lfname) < 0) {
+		perror("unlink");
+		exit(20);
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

