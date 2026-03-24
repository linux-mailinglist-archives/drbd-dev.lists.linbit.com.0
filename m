Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGyWCeKtwmkyggQAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Tue, 24 Mar 2026 16:29:38 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF05318082
	for <lists+drbd-dev@lfdr.de>; Tue, 24 Mar 2026 16:29:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9777E162809;
	Tue, 24 Mar 2026 16:29:35 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 60FF816084B
	for <drbd-dev@lists.linbit.com>; Tue, 24 Mar 2026 16:29:32 +0100 (CET)
Received: by mail-wm1-f51.google.com with SMTP id
	5b1f17b1804b1-486fda2a389so33130795e9.1
	for <drbd-dev@lists.linbit.com>; Tue, 24 Mar 2026 08:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1774366171;
	x=1774970971; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=AwVFOUDI8jos7wgB4yWql5shDVi/mFaLE8Zy0cbHbw4=;
	b=b2Cn18t5Um00n/G9YJNnQKpVZPEXoBQddBj997m/xY3MYzz6c/CcBmAVN15po07PNV
	Q5zj36cEiiAHTRB2F69GmlbZKHBaZhW9r0EdBtJyBoUaI0wjjC/FDPE9aHVb12Um0Bbx
	zImdYwGXiFLi7EJGLB94OXCT352E3Bg/v2GbsxZx32ZUcikjgNsywxQRCN4mM9KvsbeN
	1tnWJBF7rBE8TlgAaPpsqx+B4Oli/FLE1BmqhzLb1FbNztcYSr1lztq/65l3ophi92K2
	Oyjeh7JtXdVR3Ik3O9Ctm+kyqQEyGO7X4s0d1SzucqpCvBQPCn+68SfxezAaj5SPzCd2
	kOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1774366171; x=1774970971;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=AwVFOUDI8jos7wgB4yWql5shDVi/mFaLE8Zy0cbHbw4=;
	b=WGmpfGahzK/WqZNB1YbIdYOmL94rZp1ClbFrBz8HYLpZmQO+bIOu4KKmf4rMQ0ULRX
	bE8IcAGGfcvLOvFPeRHn9iD+LgXBVX4mzJy5VW/rSOsYMXZd9+klhhbvDnk3oCa12PQ4
	WJUk5mTQ1yQRrEhHCY9K0+s2bYDkPa42T1QmeND67xfQJ+e3nsNtURrqXZcHEOWj3I/l
	shMdcJONqgKkM5x0mItjkgpbEsksVQrFb100z6LvotMfitILpcKtodHrAJxDGO0M/E2/
	g3pxYYHObkho/B5Rt2dwChdjqRD0kR6uSqVDXEdJTGp4R9OZiEK/vhKHasR1Blhchi0i
	ebHw==
X-Gm-Message-State: AOJu0YyY/ml1kVaRViyRc/0lbBIB9WulwyHMlbsQbsBZtpjhqxdsUZzl
	V0VZkTKUCJAk6KAiVC3eDENcfgrvDhXyblu1jtWsd/BGLC/s+6HSTbCqMQ/4ARuWjMCLPQ==
X-Gm-Gg: ATEYQzzZcjGOO+vqSGaWWy210mLQ+II/qrXjSuGQ9fNKrobNZUhdvCOgC6x2Yz6oEvc
	6ncLAbY6g4MQ2SQtmlFZC2stisSm6Pd5fvcAt+m7FTXFEYLLBRSlNdCB1Ri70yetZLEm4ZrEzvK
	QmfXc6tbIOaxYFG1AkcU5SI7U/nCQyCDFEgrIZFcfji0OcQfwHbPil5BfO0qg3Njz58HvCAf8Iv
	KgSUP5r/kvAtFJ2ce0BrIhIExAIRRxbWqZgIwJkwkNWxd4XzXaqxqm/7oZ3rnjcqDmA4wjN6rEM
	xYF7PM2ZLoB1FcD1S1rgZ/RRq2Jby9kCA+X0GqGd7g+Ag1vAsNgEQgNIxtyW1MiS7pgzU/GI2ay
	NxuaWs5wpRbZCEc9TbBgh0944XoyaVuavmbDjP9fQLV86bHJW1YlKq5EAnfwHJSuDZiZAs3EnRf
	9o/rZhcQHnuMujOjA+DjUWiFOTWH4w6aU4i7tY/EohMYUYC01aESp171QJd6ZpS4gqTKQeAKhm9
	y4kJ4I9sWQo6H+YBPo2Gw==
X-Received: by 2002:a05:600c:a088:b0:477:b734:8c53 with SMTP id
	5b1f17b1804b1-48715fef727mr3062615e9.12.1774366171355; 
	Tue, 24 Mar 2026 08:29:31 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-48711764625sm60092705e9.14.2026.03.24.08.29.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Mar 2026 08:29:30 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] drbd: use genl pre_doit/post_doit
Date: Tue, 24 Mar 2026 16:29:07 +0100
Message-ID: <20260324152907.2840984-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [0.65 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MIXED_CHARSET(0.56)[subject];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[linbit-com.20230601.gappssmtp.com:s=20230601];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.281];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20230601.gappssmtp.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linbit.com:email,linbit.com:mid]
X-Rspamd-Queue-Id: 9EF05318082
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Every doit handler followed the same pattern: stack-allocate an
adm_ctx, call drbd_adm_prepare() at the top, call drbd_adm_finish()
at the bottom. This duplicated boilerplate across 25 handlers and
made error paths inconsistent, since some handlers could miss sending
the reply skb on early-exit paths.

The generic netlink framework already provides pre_doit/post_doit
hooks for exactly this purpose. An old comment even noted "this
would be a good candidate for a pre_doit hook".

Use them:

- pre_doit heap-allocates adm_ctx, looks up per-command flags from a
  new drbd_genl_cmd_flags[] table, runs drbd_adm_prepare(), and
  stores the context in info->user_ptr[0].
- post_doit sends the reply, drops kref references for
  device/connection/resource, and frees the adm_ctx.
- Handlers just receive adm_ctx from info->user_ptr[0], set
  reply_dh->ret_code, and return. All teardown is in post_doit.
- drbd_adm_finish() is removed, superseded by post_doit.

Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
Some context: we are currently in the process of converting the old
genl_magic macro infrastructure to YNL. This patch is a prerequisite
to that work because it decouples the preperation/cleanup logic from
the actual handlers.

 drivers/block/drbd/drbd_nl.c    | 573 ++++++++++++++++++--------------
 include/linux/genl_magic_func.h |   4 +
 2 files changed, 324 insertions(+), 253 deletions(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index e201f0087a0f..e18fa260a662 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -75,6 +75,15 @@ int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb)
 
 #include <linux/drbd_genl_api.h>
 #include "drbd_nla.h"
+
+static int drbd_pre_doit(const struct genl_split_ops *ops,
+			 struct sk_buff *skb, struct genl_info *info);
+static void drbd_post_doit(const struct genl_split_ops *ops,
+			   struct sk_buff *skb, struct genl_info *info);
+
+#define GENL_MAGIC_FAMILY_PRE_DOIT	drbd_pre_doit
+#define GENL_MAGIC_FAMILY_POST_DOIT	drbd_post_doit
+
 #include <linux/genl_magic_func.h>
 
 static atomic_t drbd_genl_seq = ATOMIC_INIT(2); /* two. */
@@ -144,18 +153,46 @@ static int drbd_msg_sprintf_info(struct sk_buff *skb, const char *fmt, ...)
 	return 0;
 }
 
-/* This would be a good candidate for a "pre_doit" hook,
- * and per-family private info->pointers.
- * But we need to stay compatible with older kernels.
- * If it returns successfully, adm_ctx members are valid.
- *
+/* Flags for drbd_adm_prepare() */
+#define DRBD_ADM_NEED_MINOR	 (1 << 0)
+#define DRBD_ADM_NEED_RESOURCE	 (1 << 1)
+#define DRBD_ADM_NEED_CONNECTION (1 << 2)
+
+/* Per-command flags for drbd_pre_doit() */
+static const unsigned int drbd_genl_cmd_flags[] = {
+	[DRBD_ADM_GET_STATUS]     = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_NEW_MINOR]      = DRBD_ADM_NEED_RESOURCE,
+	[DRBD_ADM_DEL_MINOR]      = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_NEW_RESOURCE]   = 0,
+	[DRBD_ADM_DEL_RESOURCE]   = DRBD_ADM_NEED_RESOURCE,
+	[DRBD_ADM_RESOURCE_OPTS]  = DRBD_ADM_NEED_RESOURCE,
+	[DRBD_ADM_CONNECT]        = DRBD_ADM_NEED_RESOURCE,
+	[DRBD_ADM_CHG_NET_OPTS]   = DRBD_ADM_NEED_CONNECTION,
+	[DRBD_ADM_DISCONNECT]     = DRBD_ADM_NEED_CONNECTION,
+	[DRBD_ADM_ATTACH]         = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_CHG_DISK_OPTS]  = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_RESIZE]         = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_PRIMARY]        = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_SECONDARY]      = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_NEW_C_UUID]     = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_START_OV]       = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_DETACH]         = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_INVALIDATE]     = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_INVAL_PEER]     = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_PAUSE_SYNC]     = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_RESUME_SYNC]    = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_SUSPEND_IO]     = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_RESUME_IO]      = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_OUTDATE]        = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_GET_TIMEOUT_TYPE] = DRBD_ADM_NEED_MINOR,
+	[DRBD_ADM_DOWN]           = DRBD_ADM_NEED_RESOURCE,
+};
+
+/*
  * At this point, we still rely on the global genl_lock().
  * If we want to avoid that, and allow "genl_family.parallel_ops", we may need
  * to add additional synchronization against object destruction/modification.
  */
-#define DRBD_ADM_NEED_MINOR	1
-#define DRBD_ADM_NEED_RESOURCE	2
-#define DRBD_ADM_NEED_CONNECTION 4
 static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 	struct sk_buff *skb, struct genl_info *info, unsigned flags)
 {
@@ -163,8 +200,6 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 	const u8 cmd = info->genlhdr->cmd;
 	int err;
 
-	memset(adm_ctx, 0, sizeof(*adm_ctx));
-
 	/* genl_rcv_msg only checks for CAP_NET_ADMIN on "GENL_ADMIN_PERM" :( */
 	if (cmd != DRBD_ADM_GET_STATUS && !capable(CAP_NET_ADMIN))
 	       return -EPERM;
@@ -300,9 +335,45 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 	return err;
 }
 
-static int drbd_adm_finish(struct drbd_config_context *adm_ctx,
-	struct genl_info *info, int retcode)
+static int drbd_pre_doit(const struct genl_split_ops *ops,
+			 struct sk_buff *skb, struct genl_info *info)
 {
+	struct drbd_config_context *adm_ctx;
+	u8 cmd = info->genlhdr->cmd;
+	unsigned int flags;
+	int err;
+
+	adm_ctx = kzalloc_obj(*adm_ctx);
+	if (!adm_ctx)
+		return -ENOMEM;
+
+	flags = (cmd < ARRAY_SIZE(drbd_genl_cmd_flags))
+		? drbd_genl_cmd_flags[cmd] : 0;
+
+	err = drbd_adm_prepare(adm_ctx, skb, info, flags);
+	if (err && !adm_ctx->reply_skb) {
+		/* Fatal error before reply_skb was allocated. */
+		kfree(adm_ctx);
+		return err;
+	}
+	if (err)
+		adm_ctx->reply_dh->ret_code = err;
+
+	info->user_ptr[0] = adm_ctx;
+	return 0;
+}
+
+static void drbd_post_doit(const struct genl_split_ops *ops,
+			   struct sk_buff *skb, struct genl_info *info)
+{
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
+
+	if (!adm_ctx)
+		return;
+
+	if (adm_ctx->reply_skb)
+		drbd_adm_send_reply(adm_ctx->reply_skb, info);
+
 	if (adm_ctx->device) {
 		kref_put(&adm_ctx->device->kref, drbd_destroy_device);
 		adm_ctx->device = NULL;
@@ -316,12 +387,7 @@ static int drbd_adm_finish(struct drbd_config_context *adm_ctx,
 		adm_ctx->resource = NULL;
 	}
 
-	if (!adm_ctx->reply_skb)
-		return -ENOMEM;
-
-	adm_ctx->reply_dh->ret_code = retcode;
-	drbd_adm_send_reply(adm_ctx->reply_skb, info);
-	return 0;
+	kfree(adm_ctx);
 }
 
 static void setup_khelper_env(struct drbd_connection *connection, char **envp)
@@ -766,15 +832,15 @@ static const char *from_attrs_err_to_txt(int err)
 
 int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct set_role_parms parms;
 	int err;
 	enum drbd_ret_code retcode;
 	enum drbd_state_rv rv;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
@@ -783,24 +849,24 @@ int drbd_adm_set_role(struct sk_buff *skb, struct genl_info *info)
 		err = set_role_parms_from_attrs(&parms, info);
 		if (err) {
 			retcode = ERR_MANDATORY_TAG;
-			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+			drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 			goto out;
 		}
 	}
 	genl_unlock();
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
 
 	if (info->genlhdr->cmd == DRBD_ADM_PRIMARY)
-		rv = drbd_set_role(adm_ctx.device, R_PRIMARY, parms.assume_uptodate);
+		rv = drbd_set_role(adm_ctx->device, R_PRIMARY, parms.assume_uptodate);
 	else
-		rv = drbd_set_role(adm_ctx.device, R_SECONDARY, 0);
+		rv = drbd_set_role(adm_ctx->device, R_SECONDARY, 0);
 
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 	genl_lock();
-	drbd_adm_finish(&adm_ctx, info, rv);
+	adm_ctx->reply_dh->ret_code = rv;
 	return 0;
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -1512,7 +1578,7 @@ static int disk_opts_check_al_size(struct drbd_device *device, struct disk_conf
 
 int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 	struct drbd_device *device;
 	struct disk_conf *new_disk_conf, *old_disk_conf;
@@ -1520,14 +1586,14 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 	int err;
 	unsigned int fifo_size;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto finish;
 
-	device = adm_ctx.device;
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	device = adm_ctx->device;
+	mutex_lock(&adm_ctx->resource->adm_mutex);
 
 	/* we also need a disk
 	 * to change the options on */
@@ -1551,7 +1617,7 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 	err = disk_conf_from_attrs_for_change(new_disk_conf, info);
 	if (err && err != -ENOMSG) {
 		retcode = ERR_MANDATORY_TAG;
-		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+		drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 		goto fail_unlock;
 	}
 
@@ -1577,7 +1643,7 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 	if (err) {
 		/* Could be just "busy". Ignore?
 		 * Introduce dedicated error code? */
-		drbd_msg_put_info(adm_ctx.reply_skb,
+		drbd_msg_put_info(adm_ctx->reply_skb,
 			"Try again without changing current al-extents setting");
 		retcode = ERR_NOMEM;
 		goto fail_unlock;
@@ -1640,9 +1706,9 @@ int drbd_adm_disk_opts(struct sk_buff *skb, struct genl_info *info)
 success:
 	put_ldev(device);
  out:
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
  finish:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -1734,7 +1800,7 @@ void drbd_backing_dev_free(struct drbd_device *device, struct drbd_backing_dev *
 
 int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_device *device;
 	struct drbd_peer_device *peer_device;
 	struct drbd_connection *connection;
@@ -1751,14 +1817,14 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 	enum drbd_state_rv rv;
 	struct net_conf *nc;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto finish;
 
-	device = adm_ctx.device;
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	device = adm_ctx->device;
+	mutex_lock(&adm_ctx->resource->adm_mutex);
 	peer_device = first_peer_device(device);
 	connection = peer_device->connection;
 	conn_reconfig_start(connection);
@@ -1803,7 +1869,7 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 	err = disk_conf_from_attrs(new_disk_conf, info);
 	if (err) {
 		retcode = ERR_MANDATORY_TAG;
-		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+		drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 		goto fail;
 	}
 
@@ -1954,7 +2020,7 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 			drbd_warn(device, "truncating a consistent device during attach (%llu < %llu)\n", nsz, eff);
 		} else {
 			drbd_warn(device, "refusing to truncate a consistent device (%llu < %llu)\n", nsz, eff);
-			drbd_msg_sprintf_info(adm_ctx.reply_skb,
+			drbd_msg_sprintf_info(adm_ctx->reply_skb,
 				"To-be-attached device has last effective > current size, and is consistent\n"
 				"(%llu > %llu sectors). Refusing to attach.", eff, nsz);
 			retcode = ERR_IMPLICIT_SHRINK;
@@ -2130,8 +2196,8 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 	kobject_uevent(&disk_to_dev(device->vdisk)->kobj, KOBJ_CHANGE);
 	put_ldev(device);
 	conn_reconfig_done(connection);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 
  force_diskless_dec:
@@ -2150,9 +2216,9 @@ int drbd_adm_attach(struct sk_buff *skb, struct genl_info *info)
 	kfree(new_disk_conf);
 	lc_destroy(resync_lru);
 	kfree(new_plan);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
  finish:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -2174,14 +2240,14 @@ static int adm_detach(struct drbd_device *device, int force)
  * Only then we have finally detached. */
 int drbd_adm_detach(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 	struct detach_parms parms = { };
 	int err;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
@@ -2189,16 +2255,16 @@ int drbd_adm_detach(struct sk_buff *skb, struct genl_info *info)
 		err = detach_parms_from_attrs(&parms, info);
 		if (err) {
 			retcode = ERR_MANDATORY_TAG;
-			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+			drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 			goto out;
 		}
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	retcode = adm_detach(adm_ctx.device, parms.force_detach);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
+	retcode = adm_detach(adm_ctx->device, parms.force_detach);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -2372,7 +2438,7 @@ static void free_crypto(struct crypto *crypto)
 
 int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 	struct drbd_connection *connection;
 	struct net_conf *old_net_conf, *new_net_conf = NULL;
@@ -2381,14 +2447,14 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 	int rsr; /* re-sync running */
 	struct crypto crypto = { };
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_CONNECTION);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto finish;
 
-	connection = adm_ctx.connection;
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	connection = adm_ctx->connection;
+	mutex_lock(&adm_ctx->resource->adm_mutex);
 
 	new_net_conf = kzalloc_obj(struct net_conf);
 	if (!new_net_conf) {
@@ -2403,7 +2469,7 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 	old_net_conf = connection->net_conf;
 
 	if (!old_net_conf) {
-		drbd_msg_put_info(adm_ctx.reply_skb, "net conf missing, try connect");
+		drbd_msg_put_info(adm_ctx->reply_skb, "net conf missing, try connect");
 		retcode = ERR_INVALID_REQUEST;
 		goto fail;
 	}
@@ -2415,7 +2481,7 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
 	err = net_conf_from_attrs_for_change(new_net_conf, info);
 	if (err && err != -ENOMSG) {
 		retcode = ERR_MANDATORY_TAG;
-		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+		drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 		goto fail;
 	}
 
@@ -2485,9 +2551,9 @@ int drbd_adm_net_opts(struct sk_buff *skb, struct genl_info *info)
  done:
 	conn_reconfig_done(connection);
  out:
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
  finish:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -2516,7 +2582,7 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 	struct connection_info connection_info;
 	enum drbd_notification_type flags;
 	unsigned int peer_devices = 0;
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_peer_device *peer_device;
 	struct net_conf *old_net_conf, *new_net_conf = NULL;
 	struct crypto crypto = { };
@@ -2527,14 +2593,13 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 	int i;
 	int err;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
-
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
-	if (!(adm_ctx.my_addr && adm_ctx.peer_addr)) {
-		drbd_msg_put_info(adm_ctx.reply_skb, "connection endpoint(s) missing");
+	if (!(adm_ctx->my_addr && adm_ctx->peer_addr)) {
+		drbd_msg_put_info(adm_ctx->reply_skb, "connection endpoint(s) missing");
 		retcode = ERR_INVALID_REQUEST;
 		goto out;
 	}
@@ -2544,15 +2609,15 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 	 * concurrent reconfiguration/addition/deletion */
 	for_each_resource(resource, &drbd_resources) {
 		for_each_connection(connection, resource) {
-			if (nla_len(adm_ctx.my_addr) == connection->my_addr_len &&
-			    !memcmp(nla_data(adm_ctx.my_addr), &connection->my_addr,
+			if (nla_len(adm_ctx->my_addr) == connection->my_addr_len &&
+			    !memcmp(nla_data(adm_ctx->my_addr), &connection->my_addr,
 				    connection->my_addr_len)) {
 				retcode = ERR_LOCAL_ADDR;
 				goto out;
 			}
 
-			if (nla_len(adm_ctx.peer_addr) == connection->peer_addr_len &&
-			    !memcmp(nla_data(adm_ctx.peer_addr), &connection->peer_addr,
+			if (nla_len(adm_ctx->peer_addr) == connection->peer_addr_len &&
+			    !memcmp(nla_data(adm_ctx->peer_addr), &connection->peer_addr,
 				    connection->peer_addr_len)) {
 				retcode = ERR_PEER_ADDR;
 				goto out;
@@ -2560,8 +2625,8 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 		}
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	connection = first_connection(adm_ctx.resource);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
+	connection = first_connection(adm_ctx->resource);
 	conn_reconfig_start(connection);
 
 	if (connection->cstate > C_STANDALONE) {
@@ -2581,7 +2646,7 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 	err = net_conf_from_attrs(new_net_conf, info);
 	if (err && err != -ENOMSG) {
 		retcode = ERR_MANDATORY_TAG;
-		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+		drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 		goto fail;
 	}
 
@@ -2597,11 +2662,11 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 
 	drbd_flush_workqueue(&connection->sender_work);
 
-	mutex_lock(&adm_ctx.resource->conf_update);
+	mutex_lock(&adm_ctx->resource->conf_update);
 	old_net_conf = connection->net_conf;
 	if (old_net_conf) {
 		retcode = ERR_NET_CONFIGURED;
-		mutex_unlock(&adm_ctx.resource->conf_update);
+		mutex_unlock(&adm_ctx->resource->conf_update);
 		goto fail;
 	}
 	rcu_assign_pointer(connection->net_conf, new_net_conf);
@@ -2612,10 +2677,10 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 	connection->csums_tfm = crypto.csums_tfm;
 	connection->verify_tfm = crypto.verify_tfm;
 
-	connection->my_addr_len = nla_len(adm_ctx.my_addr);
-	memcpy(&connection->my_addr, nla_data(adm_ctx.my_addr), connection->my_addr_len);
-	connection->peer_addr_len = nla_len(adm_ctx.peer_addr);
-	memcpy(&connection->peer_addr, nla_data(adm_ctx.peer_addr), connection->peer_addr_len);
+	connection->my_addr_len = nla_len(adm_ctx->my_addr);
+	memcpy(&connection->my_addr, nla_data(adm_ctx->my_addr), connection->my_addr_len);
+	connection->peer_addr_len = nla_len(adm_ctx->peer_addr);
+	memcpy(&connection->peer_addr, nla_data(adm_ctx->peer_addr), connection->peer_addr_len);
 
 	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
 		peer_devices++;
@@ -2633,7 +2698,7 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 		notify_peer_device_state(NULL, 0, peer_device, &peer_device_info, NOTIFY_CREATE | flags);
 	}
 	mutex_unlock(&notification_mutex);
-	mutex_unlock(&adm_ctx.resource->conf_update);
+	mutex_unlock(&adm_ctx->resource->conf_update);
 
 	rcu_read_lock();
 	idr_for_each_entry(&connection->peer_devices, peer_device, i) {
@@ -2646,8 +2711,8 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 	rv = conn_request_state(connection, NS(conn, C_UNCONNECTED), CS_VERBOSE);
 
 	conn_reconfig_done(connection);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
-	drbd_adm_finish(&adm_ctx, info, rv);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
+	adm_ctx->reply_dh->ret_code = rv;
 	return 0;
 
 fail:
@@ -2655,9 +2720,9 @@ int drbd_adm_connect(struct sk_buff *skb, struct genl_info *info)
 	kfree(new_net_conf);
 
 	conn_reconfig_done(connection);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -2729,40 +2794,40 @@ static enum drbd_state_rv conn_try_disconnect(struct drbd_connection *connection
 
 int drbd_adm_disconnect(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct disconnect_parms parms;
 	struct drbd_connection *connection;
 	enum drbd_state_rv rv;
 	enum drbd_ret_code retcode;
 	int err;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_CONNECTION);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto fail;
 
-	connection = adm_ctx.connection;
+	connection = adm_ctx->connection;
 	memset(&parms, 0, sizeof(parms));
 	if (info->attrs[DRBD_NLA_DISCONNECT_PARMS]) {
 		err = disconnect_parms_from_attrs(&parms, info);
 		if (err) {
 			retcode = ERR_MANDATORY_TAG;
-			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+			drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 			goto fail;
 		}
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
 	rv = conn_try_disconnect(connection, parms.force_disconnect);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 	if (rv < SS_SUCCESS) {
-		drbd_adm_finish(&adm_ctx, info, rv);
+		adm_ctx->reply_dh->ret_code = rv;
 		return 0;
 	}
 	retcode = NO_ERROR;
  fail:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -2784,7 +2849,7 @@ void resync_after_online_grow(struct drbd_device *device)
 
 int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct disk_conf *old_disk_conf, *new_disk_conf = NULL;
 	struct resize_parms rs;
 	struct drbd_device *device;
@@ -2795,14 +2860,14 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 	sector_t u_size;
 	int err;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto finish;
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	device = adm_ctx.device;
+	mutex_lock(&adm_ctx->resource->adm_mutex);
+	device = adm_ctx->device;
 	if (!get_ldev(device)) {
 		retcode = ERR_NO_DISK;
 		goto fail;
@@ -2815,7 +2880,7 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 		err = resize_parms_from_attrs(&rs, info);
 		if (err) {
 			retcode = ERR_MANDATORY_TAG;
-			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+			drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 			goto fail_ldev;
 		}
 	}
@@ -2907,9 +2972,9 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 	}
 
  fail:
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
  finish:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 
  fail_ldev:
@@ -2920,61 +2985,61 @@ int drbd_adm_resize(struct sk_buff *skb, struct genl_info *info)
 
 int drbd_adm_resource_opts(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 	struct res_opts res_opts;
 	int err;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto fail;
 
-	res_opts = adm_ctx.resource->res_opts;
+	res_opts = adm_ctx->resource->res_opts;
 	if (should_set_defaults(info))
 		set_res_opts_defaults(&res_opts);
 
 	err = res_opts_from_attrs(&res_opts, info);
 	if (err && err != -ENOMSG) {
 		retcode = ERR_MANDATORY_TAG;
-		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+		drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 		goto fail;
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	err = set_resource_options(adm_ctx.resource, &res_opts);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
+	err = set_resource_options(adm_ctx->resource, &res_opts);
 	if (err) {
 		retcode = ERR_INVALID_REQUEST;
 		if (err == -ENOMEM)
 			retcode = ERR_NOMEM;
 	}
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 
 fail:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
 int drbd_adm_invalidate(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_device *device;
 	int retcode; /* enum drbd_ret_code rsp. enum drbd_state_rv */
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
-	device = adm_ctx.device;
+	device = adm_ctx->device;
 	if (!get_ldev(device)) {
 		retcode = ERR_NO_DISK;
 		goto out;
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
 
 	/* If there is still bitmap IO pending, probably because of a previous
 	 * resync just being finished, wait for it before requesting a new resync.
@@ -2997,30 +3062,30 @@ int drbd_adm_invalidate(struct sk_buff *skb, struct genl_info *info)
 	} else
 		retcode = drbd_request_state(device, NS(conn, C_STARTING_SYNC_T));
 	drbd_resume_io(device);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 	put_ldev(device);
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
 static int drbd_adm_simple_request_state(struct sk_buff *skb, struct genl_info *info,
 		union drbd_state mask, union drbd_state val)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	retcode = drbd_request_state(adm_ctx.device, mask, val);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
+	retcode = drbd_request_state(adm_ctx->device, mask, val);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -3036,23 +3101,23 @@ static int drbd_bmio_set_susp_al(struct drbd_device *device,
 
 int drbd_adm_invalidate_peer(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	int retcode; /* drbd_ret_code, drbd_state_rv */
 	struct drbd_device *device;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
-	device = adm_ctx.device;
+	device = adm_ctx->device;
 	if (!get_ldev(device)) {
 		retcode = ERR_NO_DISK;
 		goto out;
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
 
 	/* If there is still bitmap IO pending, probably because of a previous
 	 * resync just being finished, wait for it before requesting a new resync.
@@ -3078,48 +3143,48 @@ int drbd_adm_invalidate_peer(struct sk_buff *skb, struct genl_info *info)
 	} else
 		retcode = drbd_request_state(device, NS(conn, C_STARTING_SYNC_S));
 	drbd_resume_io(device);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 	put_ldev(device);
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
 int drbd_adm_pause_sync(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	if (drbd_request_state(adm_ctx.device, NS(user_isp, 1)) == SS_NOTHING_TO_DO)
+	mutex_lock(&adm_ctx->resource->adm_mutex);
+	if (drbd_request_state(adm_ctx->device, NS(user_isp, 1)) == SS_NOTHING_TO_DO)
 		retcode = ERR_PAUSE_IS_SET;
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
 int drbd_adm_resume_sync(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	union drbd_dev_state s;
 	enum drbd_ret_code retcode;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	if (drbd_request_state(adm_ctx.device, NS(user_isp, 0)) == SS_NOTHING_TO_DO) {
-		s = adm_ctx.device->state;
+	mutex_lock(&adm_ctx->resource->adm_mutex);
+	if (drbd_request_state(adm_ctx->device, NS(user_isp, 0)) == SS_NOTHING_TO_DO) {
+		s = adm_ctx->device->state;
 		if (s.conn == C_PAUSED_SYNC_S || s.conn == C_PAUSED_SYNC_T) {
 			retcode = s.aftr_isp ? ERR_PIC_AFTER_DEP :
 				  s.peer_isp ? ERR_PIC_PEER_DEP : ERR_PAUSE_IS_CLEAR;
@@ -3127,9 +3192,9 @@ int drbd_adm_resume_sync(struct sk_buff *skb, struct genl_info *info)
 			retcode = ERR_PAUSE_IS_CLEAR;
 		}
 	}
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -3140,18 +3205,18 @@ int drbd_adm_suspend_io(struct sk_buff *skb, struct genl_info *info)
 
 int drbd_adm_resume_io(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_device *device;
 	int retcode; /* enum drbd_ret_code rsp. enum drbd_state_rv */
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	device = adm_ctx.device;
+	mutex_lock(&adm_ctx->resource->adm_mutex);
+	device = adm_ctx->device;
 	if (test_bit(NEW_CUR_UUID, &device->flags)) {
 		if (get_ldev_if_state(device, D_ATTACHING)) {
 			drbd_uuid_new_current(device);
@@ -3188,9 +3253,9 @@ int drbd_adm_resume_io(struct sk_buff *skb, struct genl_info *info)
 			tl_restart(first_peer_device(device)->connection, FAIL_FROZEN_DISK_IO);
 	}
 	drbd_resume_io(device);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -3843,23 +3908,24 @@ static int nla_put_status_info(struct sk_buff *skb, struct drbd_device *device,
 
 int drbd_adm_get_status(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 	int err;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
-	err = nla_put_status_info(adm_ctx.reply_skb, adm_ctx.device, NULL);
+	err = nla_put_status_info(adm_ctx->reply_skb, adm_ctx->device, NULL);
 	if (err) {
-		nlmsg_free(adm_ctx.reply_skb);
+		nlmsg_free(adm_ctx->reply_skb);
+		adm_ctx->reply_skb = NULL;
 		return err;
 	}
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -4046,46 +4112,47 @@ int drbd_adm_get_status_all(struct sk_buff *skb, struct netlink_callback *cb)
 
 int drbd_adm_get_timeout_type(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 	struct timeout_parms tp;
 	int err;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
 	tp.timeout_type =
-		adm_ctx.device->state.pdsk == D_OUTDATED ? UT_PEER_OUTDATED :
-		test_bit(USE_DEGR_WFC_T, &adm_ctx.device->flags) ? UT_DEGRADED :
+		adm_ctx->device->state.pdsk == D_OUTDATED ? UT_PEER_OUTDATED :
+		test_bit(USE_DEGR_WFC_T, &adm_ctx->device->flags) ? UT_DEGRADED :
 		UT_DEFAULT;
 
-	err = timeout_parms_to_priv_skb(adm_ctx.reply_skb, &tp);
+	err = timeout_parms_to_priv_skb(adm_ctx->reply_skb, &tp);
 	if (err) {
-		nlmsg_free(adm_ctx.reply_skb);
+		nlmsg_free(adm_ctx->reply_skb);
+		adm_ctx->reply_skb = NULL;
 		return err;
 	}
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
 int drbd_adm_start_ov(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_device *device;
 	enum drbd_ret_code retcode;
 	struct start_ov_parms parms;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
-	device = adm_ctx.device;
+	device = adm_ctx->device;
 
 	/* resume from last known position, if possible */
 	parms.ov_start_sector = device->ov_start_sector;
@@ -4094,11 +4161,11 @@ int drbd_adm_start_ov(struct sk_buff *skb, struct genl_info *info)
 		int err = start_ov_parms_from_attrs(&parms, info);
 		if (err) {
 			retcode = ERR_MANDATORY_TAG;
-			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+			drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 			goto out;
 		}
 	}
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
 
 	/* w_make_ov_request expects position to be aligned */
 	device->ov_start_sector = parms.ov_start_sector & ~(BM_SECT_PER_BIT-1);
@@ -4111,40 +4178,40 @@ int drbd_adm_start_ov(struct sk_buff *skb, struct genl_info *info)
 	retcode = drbd_request_state(device, NS(conn, C_VERIFY_S));
 	drbd_resume_io(device);
 
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
 
 int drbd_adm_new_c_uuid(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_device *device;
 	enum drbd_ret_code retcode;
 	int skip_initial_sync = 0;
 	int err;
 	struct new_c_uuid_parms args;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out_nolock;
 
-	device = adm_ctx.device;
+	device = adm_ctx->device;
 	memset(&args, 0, sizeof(args));
 	if (info->attrs[DRBD_NLA_NEW_C_UUID_PARMS]) {
 		err = new_c_uuid_parms_from_attrs(&args, info);
 		if (err) {
 			retcode = ERR_MANDATORY_TAG;
-			drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+			drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 			goto out_nolock;
 		}
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
 	mutex_lock(device->state_mutex); /* Protects us against serialized state changes. */
 
 	if (!get_ldev(device)) {
@@ -4189,9 +4256,9 @@ int drbd_adm_new_c_uuid(struct sk_buff *skb, struct genl_info *info)
 	put_ldev(device);
 out:
 	mutex_unlock(device->state_mutex);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 out_nolock:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -4224,14 +4291,14 @@ static void resource_to_info(struct resource_info *info,
 int drbd_adm_new_resource(struct sk_buff *skb, struct genl_info *info)
 {
 	struct drbd_connection *connection;
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 	struct res_opts res_opts;
 	int err;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, 0);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
@@ -4239,18 +4306,18 @@ int drbd_adm_new_resource(struct sk_buff *skb, struct genl_info *info)
 	err = res_opts_from_attrs(&res_opts, info);
 	if (err && err != -ENOMSG) {
 		retcode = ERR_MANDATORY_TAG;
-		drbd_msg_put_info(adm_ctx.reply_skb, from_attrs_err_to_txt(err));
+		drbd_msg_put_info(adm_ctx->reply_skb, from_attrs_err_to_txt(err));
 		goto out;
 	}
 
-	retcode = drbd_check_resource_name(&adm_ctx);
+	retcode = drbd_check_resource_name(adm_ctx);
 	if (retcode != NO_ERROR)
 		goto out;
 
-	if (adm_ctx.resource) {
+	if (adm_ctx->resource) {
 		if (info->nlhdr->nlmsg_flags & NLM_F_EXCL) {
 			retcode = ERR_INVALID_REQUEST;
-			drbd_msg_put_info(adm_ctx.reply_skb, "resource exists");
+			drbd_msg_put_info(adm_ctx->reply_skb, "resource exists");
 		}
 		/* else: still NO_ERROR */
 		goto out;
@@ -4258,7 +4325,7 @@ int drbd_adm_new_resource(struct sk_buff *skb, struct genl_info *info)
 
 	/* not yet safe for genl_family.parallel_ops */
 	mutex_lock(&resources_mutex);
-	connection = conn_create(adm_ctx.resource_name, &res_opts);
+	connection = conn_create(adm_ctx->resource_name, &res_opts);
 	mutex_unlock(&resources_mutex);
 
 	if (connection) {
@@ -4273,7 +4340,7 @@ int drbd_adm_new_resource(struct sk_buff *skb, struct genl_info *info)
 		retcode = ERR_NOMEM;
 
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -4286,38 +4353,38 @@ static void device_to_info(struct device_info *info,
 
 int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_genlmsghdr *dh = genl_info_userhdr(info);
 	enum drbd_ret_code retcode;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
 	if (dh->minor > MINORMASK) {
-		drbd_msg_put_info(adm_ctx.reply_skb, "requested minor out of range");
+		drbd_msg_put_info(adm_ctx->reply_skb, "requested minor out of range");
 		retcode = ERR_INVALID_REQUEST;
 		goto out;
 	}
-	if (adm_ctx.volume > DRBD_VOLUME_MAX) {
-		drbd_msg_put_info(adm_ctx.reply_skb, "requested volume id out of range");
+	if (adm_ctx->volume > DRBD_VOLUME_MAX) {
+		drbd_msg_put_info(adm_ctx->reply_skb, "requested volume id out of range");
 		retcode = ERR_INVALID_REQUEST;
 		goto out;
 	}
 
 	/* drbd_adm_prepare made sure already
 	 * that first_peer_device(device)->connection and device->vnr match the request. */
-	if (adm_ctx.device) {
+	if (adm_ctx->device) {
 		if (info->nlhdr->nlmsg_flags & NLM_F_EXCL)
 			retcode = ERR_MINOR_OR_VOLUME_EXISTS;
 		/* else: still NO_ERROR */
 		goto out;
 	}
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	retcode = drbd_create_device(&adm_ctx, dh->minor);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
+	retcode = drbd_create_device(adm_ctx, dh->minor);
 	if (retcode == NO_ERROR) {
 		struct drbd_device *device;
 		struct drbd_peer_device *peer_device;
@@ -4348,9 +4415,9 @@ int drbd_adm_new_minor(struct sk_buff *skb, struct genl_info *info)
 		}
 		mutex_unlock(&notification_mutex);
 	}
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -4393,20 +4460,20 @@ static enum drbd_ret_code adm_del_minor(struct drbd_device *device)
 
 int drbd_adm_del_minor(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	enum drbd_ret_code retcode;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_MINOR);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto out;
 
-	mutex_lock(&adm_ctx.resource->adm_mutex);
-	retcode = adm_del_minor(adm_ctx.device);
-	mutex_unlock(&adm_ctx.resource->adm_mutex);
+	mutex_lock(&adm_ctx->resource->adm_mutex);
+	retcode = adm_del_minor(adm_ctx->device);
+	mutex_unlock(&adm_ctx->resource->adm_mutex);
 out:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
@@ -4442,20 +4509,20 @@ static int adm_del_resource(struct drbd_resource *resource)
 
 int drbd_adm_down(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_resource *resource;
 	struct drbd_connection *connection;
 	struct drbd_device *device;
 	int retcode; /* enum drbd_ret_code rsp. enum drbd_state_rv */
 	unsigned i;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto finish;
 
-	resource = adm_ctx.resource;
+	resource = adm_ctx->resource;
 	mutex_lock(&resource->adm_mutex);
 	/* demote */
 	for_each_connection(connection, resource) {
@@ -4464,14 +4531,14 @@ int drbd_adm_down(struct sk_buff *skb, struct genl_info *info)
 		idr_for_each_entry(&connection->peer_devices, peer_device, i) {
 			retcode = drbd_set_role(peer_device->device, R_SECONDARY, 0);
 			if (retcode < SS_SUCCESS) {
-				drbd_msg_put_info(adm_ctx.reply_skb, "failed to demote");
+				drbd_msg_put_info(adm_ctx->reply_skb, "failed to demote");
 				goto out;
 			}
 		}
 
 		retcode = conn_try_disconnect(connection, 0);
 		if (retcode < SS_SUCCESS) {
-			drbd_msg_put_info(adm_ctx.reply_skb, "failed to disconnect");
+			drbd_msg_put_info(adm_ctx->reply_skb, "failed to disconnect");
 			goto out;
 		}
 	}
@@ -4480,7 +4547,7 @@ int drbd_adm_down(struct sk_buff *skb, struct genl_info *info)
 	idr_for_each_entry(&resource->devices, device, i) {
 		retcode = adm_detach(device, 0);
 		if (retcode < SS_SUCCESS || retcode > NO_ERROR) {
-			drbd_msg_put_info(adm_ctx.reply_skb, "failed to detach");
+			drbd_msg_put_info(adm_ctx->reply_skb, "failed to detach");
 			goto out;
 		}
 	}
@@ -4490,7 +4557,7 @@ int drbd_adm_down(struct sk_buff *skb, struct genl_info *info)
 		retcode = adm_del_minor(device);
 		if (retcode != NO_ERROR) {
 			/* "can not happen" */
-			drbd_msg_put_info(adm_ctx.reply_skb, "failed to delete volume");
+			drbd_msg_put_info(adm_ctx->reply_skb, "failed to delete volume");
 			goto out;
 		}
 	}
@@ -4499,28 +4566,28 @@ int drbd_adm_down(struct sk_buff *skb, struct genl_info *info)
 out:
 	mutex_unlock(&resource->adm_mutex);
 finish:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
 int drbd_adm_del_resource(struct sk_buff *skb, struct genl_info *info)
 {
-	struct drbd_config_context adm_ctx;
+	struct drbd_config_context *adm_ctx = info->user_ptr[0];
 	struct drbd_resource *resource;
 	enum drbd_ret_code retcode;
 
-	retcode = drbd_adm_prepare(&adm_ctx, skb, info, DRBD_ADM_NEED_RESOURCE);
-	if (!adm_ctx.reply_skb)
-		return retcode;
+	if (!adm_ctx->reply_skb)
+		return 0;
+	retcode = adm_ctx->reply_dh->ret_code;
 	if (retcode != NO_ERROR)
 		goto finish;
-	resource = adm_ctx.resource;
+	resource = adm_ctx->resource;
 
 	mutex_lock(&resource->adm_mutex);
 	retcode = adm_del_resource(resource);
 	mutex_unlock(&resource->adm_mutex);
 finish:
-	drbd_adm_finish(&adm_ctx, info, retcode);
+	adm_ctx->reply_dh->ret_code = retcode;
 	return 0;
 }
 
diff --git a/include/linux/genl_magic_func.h b/include/linux/genl_magic_func.h
index d4da060b7532..6edcac85155e 100644
--- a/include/linux/genl_magic_func.h
+++ b/include/linux/genl_magic_func.h
@@ -292,6 +292,10 @@ static struct genl_family ZZZ_genl_family __ro_after_init = {
 #endif
 	.maxattr = ARRAY_SIZE(CONCATENATE(GENL_MAGIC_FAMILY, _tla_nl_policy))-1,
 	.policy	= CONCATENATE(GENL_MAGIC_FAMILY, _tla_nl_policy),
+#ifdef GENL_MAGIC_FAMILY_PRE_DOIT
+	.pre_doit = GENL_MAGIC_FAMILY_PRE_DOIT,
+	.post_doit = GENL_MAGIC_FAMILY_POST_DOIT,
+#endif
 	.ops = ZZZ_genl_ops,
 	.n_ops = ARRAY_SIZE(ZZZ_genl_ops),
 	.mcgrps = ZZZ_genl_mcgrps,

base-commit: 67807fbaf12719fca46a622d759484652b79c7c3
-- 
2.53.0

