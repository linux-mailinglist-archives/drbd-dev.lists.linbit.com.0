Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJT+N+XAz2kM0QYAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 03 Apr 2026 15:30:13 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0FB3947CF
	for <lists+drbd-dev@lfdr.de>; Fri, 03 Apr 2026 15:30:13 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C2589163135;
	Fri,  3 Apr 2026 15:30:11 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7DAEF1630C3
	for <drbd-dev@lists.linbit.com>; Fri,  3 Apr 2026 15:30:09 +0200 (CEST)
Received: by mail-wr1-f42.google.com with SMTP id
	ffacd0b85a97d-43b9d3ebed5so1814823f8f.1
	for <drbd-dev@lists.linbit.com>; Fri, 03 Apr 2026 06:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1775223009;
	x=1775827809; darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:from:to:cc:subject:date:message-id:reply-to;
	bh=8g8ZEEVqoRamXzFbeaJ4H/pq19Py4LNKbCScRl7Rr58=;
	b=zTXlm3iglrfUE+CkeZ7uIKd6t8+/CIKEWAJlJQ9NjftxexG4GjbEW3alidF1vYbS8x
	4bJLkFQjnDaq6FUZtlrjOHKE85cqFnc0ebnA8Q31J3otp5A1KukS06i5h1mUA4AclaNU
	Jhv0Q+BfgelWW0FA4qcOips3Hg7MM+2l+k6bUUsizrgnFcZNmCjg25/4rF9qxeXeJj9h
	xKIjSndf1De6i+59KBAGhzXcYdpKtbLIyYpmfbJtA3D4VOroQ6T/3GOunD+WTHwt5g7v
	ZP4KKy9mLqw7lJFwZLeQu69Mnx/hqNunE9Nza4yeroy6BB4KY4GNGh97za7gJs3/q7c8
	Shgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1775223009; x=1775827809;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc
	:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
	:message-id:reply-to;
	bh=8g8ZEEVqoRamXzFbeaJ4H/pq19Py4LNKbCScRl7Rr58=;
	b=h1Bsn1SUowRE+SJX3Iz2atJ3QgiwO0WvnvAw1aPhaLs74eE2kCC9+Xw/xxurrSJWt9
	prWK2RtGM47o9w+il0kOq6Yexp8tXTlKKbwMFKHHSmMsEpJtrHO/06VgKvm64yaBrgpG
	vvZ0diODsh9ZV3/ODrgE/aBV3NaaoEk8erNQpaZp53b42nr/uSo/eBTrJyy28eJHLjY4
	fCHxZc37PgfWe/feN1JrLdcsS98a91T7/gxA2ANwYWOMsaZCR5Hib8DuznAs3qHy1sle
	bGOQM5R1dSOCD3x7B4GS7Mv5wZB9uqrCP52O2/+WZ90a3+NtIm9BlvSc5xQz6V3ogGNC
	vU6A==
X-Gm-Message-State: AOJu0Yx0un2UyieOUwuqmHngAPtK5G4lzMmrEbE9mitdR3ngP+8EhfgJ
	51X2RNhkVcslDWXU2ZOqU2NQP1stOlp1kAIC1tHOSGElUb5MG5el64xLzvRVCRucWj/03g==
X-Gm-Gg: ATEYQzw+N/RsFBFjez9s++IutS4ctutkRiwc094O+VJErOUCQqN8j2S7lrP4QY+KFMV
	h60FIyTMfXYDRwNF5k6WHKMCGBHf+0bLVF+yhF2v5/46jrEX2X7XCYvESISpzAIZXF5dyWTljSg
	w24zjvkVoApZBqIhQustbdOycMonMxu5aibMNgWFwejlRixQIlh3jVLC/m/3Vh0xzAqCZNDRe8a
	PhGQrqKH9jbNGTe/uIyT4Xm0O7rnV64JiPDZ6wGwJbFrdxgi/3s+j7DEKX23VzL1/VoNjio5I+1
	sQ03l0IE/75KGtH7GEYMNjm81wg7k1fzg7UBoA523B0hQYHRNZBFm39wJy/Ma6EXTjT/3qjpqcD
	ldEcKxM0Vl71Nnsp0iIPXR8mAbaY+DKdgf7QJTOpdWw/809FCmU8R9b1LEahjRy0I4r7VFGQyq0
	iU9w8UkfWTsTCtAwZS/8gJ+BIKKaH6gGgmOkOJzCX8PEH6Boy9aa+HW9JLp0vhiQ+AMRN28d762
	MjDPcj0MeJjPOFkDjFtQA==
X-Received: by 2002:a05:600c:3b23:b0:488:869c:edaf with SMTP id
	5b1f17b1804b1-488996df052mr42186245e9.8.1775223008481; 
	Fri, 03 Apr 2026 06:30:08 -0700 (PDT)
Received: from localhost.localdomain (h082218028181.host.wavenet.at.
	[82.218.28.181]) by smtp.gmail.com with ESMTPSA id
	5b1f17b1804b1-48899eb50cfsm19501655e9.32.2026.04.03.06.30.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 03 Apr 2026 06:30:06 -0700 (PDT)
From: =?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH] drbd: remove DRBD_GENLA_F_MANDATORY flag handling
Date: Fri,  3 Apr 2026 15:29:53 +0200
Message-ID: <20260403132953.2248751-1-christoph.boehmwalder@linbit.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Johannes Berg <johannes.berg@intel.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
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
	R_DKIM_REJECT(0.00)[linbit-com.20251104.gappssmtp.com:s=20251104];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_SPAM(0.00)[0.671];
	FORGED_SENDER(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:johannes.berg@intel.com,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:kuba@kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DMARC_POLICY_ALLOW(0.00)[linbit.com,none];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christoph.boehmwalder@linbit.com,drbd-dev-bounces@lists.linbit.com];
	DKIM_TRACE(0.00)[linbit-com.20251104.gappssmtp.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linbit.com:email,linbit.com:mid]
X-Rspamd-Queue-Id: 6F0FB3947CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DRBD used a custom mechanism to mark netlink attributes as "mandatory":
bit 14 of nla_type was repurposed as DRBD_GENLA_F_MANDATORY. Attributes
sent from userspace that had this bit present and that were unknown
to the kernel would lead to an error.

Since commit ef6243acb478 ("genetlink: optionally validate strictly/dumps"),
the generic netlink layer rejects unknown top-level attributes when
strict validation is enabled. DRBD never opted out of strict
validation, so unknown top-level attributes are already rejected by
the netlink core.

The mandatory flag mechanism was required for nested attributes, because
these are parsed liberally, silently dropping attributes unknown to the
kernel.

This prepares for the move to a new YNL-based family, which will use the
now-default strict parsing.
The current family is not expected to gain any new attributes, which
makes this change safe.

Old userspace that still sets bit 14 is unaffected: nla_type()
strips it before __nla_validate_parse() performs attribute validation,
so the bit never reaches DRBD.

Remove all references to the mandatory flag in DRBD.

Cc: Johannes Berg <johannes.berg@intel.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>
---
 drivers/block/drbd/Makefile       |   1 -
 drivers/block/drbd/drbd_nl.c      |  19 +--
 drivers/block/drbd/drbd_nla.c     |  56 --------
 drivers/block/drbd/drbd_nla.h     |   9 --
 include/linux/drbd_genl.h         | 208 +++++++++++++++---------------
 include/linux/genl_magic_func.h   |   3 +-
 include/linux/genl_magic_struct.h |  15 +--
 7 files changed, 114 insertions(+), 197 deletions(-)
 delete mode 100644 drivers/block/drbd/drbd_nla.c
 delete mode 100644 drivers/block/drbd/drbd_nla.h

diff --git a/drivers/block/drbd/Makefile b/drivers/block/drbd/Makefile
index 67a8b352a1d5..187eaf81f0f8 100644
--- a/drivers/block/drbd/Makefile
+++ b/drivers/block/drbd/Makefile
@@ -3,7 +3,6 @@ drbd-y := drbd_buildtag.o drbd_bitmap.o drbd_proc.o
 drbd-y += drbd_worker.o drbd_receiver.o drbd_req.o drbd_actlog.o
 drbd-y += drbd_main.o drbd_strings.o drbd_nl.o
 drbd-y += drbd_interval.o drbd_state.o
-drbd-y += drbd_nla.o
 drbd-$(CONFIG_DEBUG_FS) += drbd_debugfs.o
 
 obj-$(CONFIG_BLK_DEV_DRBD)     += drbd.o
diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index 1f8ffdf9b24e..d997d274092c 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -74,7 +74,6 @@ int drbd_adm_dump_peer_devices_done(struct netlink_callback *cb);
 int drbd_adm_get_initial_state(struct sk_buff *skb, struct netlink_callback *cb);
 
 #include <linux/drbd_genl_api.h>
-#include "drbd_nla.h"
 
 static int drbd_pre_doit(const struct genl_split_ops *ops,
 			 struct sk_buff *skb, struct genl_info *info);
@@ -239,14 +238,14 @@ static int drbd_adm_prepare(struct drbd_config_context *adm_ctx,
 			goto fail;
 
 		/* and assign stuff to the adm_ctx */
-		nla = nested_attr_tb[__nla_type(T_ctx_volume)];
+		nla = nested_attr_tb[T_ctx_volume];
 		if (nla)
 			adm_ctx->volume = nla_get_u32(nla);
-		nla = nested_attr_tb[__nla_type(T_ctx_resource_name)];
+		nla = nested_attr_tb[T_ctx_resource_name];
 		if (nla)
 			adm_ctx->resource_name = nla_data(nla);
-		adm_ctx->my_addr = nested_attr_tb[__nla_type(T_ctx_my_addr)];
-		adm_ctx->peer_addr = nested_attr_tb[__nla_type(T_ctx_peer_addr)];
+		adm_ctx->my_addr = nested_attr_tb[T_ctx_my_addr];
+		adm_ctx->peer_addr = nested_attr_tb[T_ctx_peer_addr];
 		if ((adm_ctx->my_addr &&
 		     nla_len(adm_ctx->my_addr) > sizeof(adm_ctx->connection->my_addr)) ||
 		    (adm_ctx->peer_addr &&
@@ -825,7 +824,6 @@ drbd_set_role(struct drbd_device *const device, enum drbd_role new_role, int for
 static const char *from_attrs_err_to_txt(int err)
 {
 	return	err == -ENOMSG ? "required attribute missing" :
-		err == -EOPNOTSUPP ? "unknown mandatory attribute" :
 		err == -EEXIST ? "can not change invariant setting" :
 		"invalid attribute value";
 }
@@ -3303,14 +3301,13 @@ static int nla_put_drbd_cfg_context(struct sk_buff *skb,
 static struct nlattr *find_cfg_context_attr(const struct nlmsghdr *nlh, int attr)
 {
 	const unsigned hdrlen = GENL_HDRLEN + GENL_MAGIC_FAMILY_HDRSZ;
-	const int maxtype = ARRAY_SIZE(drbd_cfg_context_nl_policy) - 1;
 	struct nlattr *nla;
 
 	nla = nla_find(nlmsg_attrdata(nlh, hdrlen), nlmsg_attrlen(nlh, hdrlen),
 		       DRBD_NLA_CFG_CONTEXT);
 	if (!nla)
 		return NULL;
-	return drbd_nla_find_nested(maxtype, nla, __nla_type(attr));
+	return nla_find_nested(nla, attr);
 }
 
 static void resource_to_info(struct resource_info *, struct drbd_resource *);
@@ -4068,7 +4065,6 @@ int drbd_adm_get_status_all(struct sk_buff *skb, struct netlink_callback *cb)
 	struct nlattr *nla;
 	const char *resource_name;
 	struct drbd_resource *resource;
-	int maxtype;
 
 	/* Is this a followup call? */
 	if (cb->args[0]) {
@@ -4088,10 +4084,7 @@ int drbd_adm_get_status_all(struct sk_buff *skb, struct netlink_callback *cb)
 	/* No explicit context given.  Dump all. */
 	if (!nla)
 		goto dump;
-	maxtype = ARRAY_SIZE(drbd_cfg_context_nl_policy) - 1;
-	nla = drbd_nla_find_nested(maxtype, nla, __nla_type(T_ctx_resource_name));
-	if (IS_ERR(nla))
-		return PTR_ERR(nla);
+	nla = nla_find_nested(nla, T_ctx_resource_name);
 	/* context given, but no name present? */
 	if (!nla)
 		return -EINVAL;
diff --git a/drivers/block/drbd/drbd_nla.c b/drivers/block/drbd/drbd_nla.c
deleted file mode 100644
index df0d241d3f6a..000000000000
--- a/drivers/block/drbd/drbd_nla.c
+++ /dev/null
@@ -1,56 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-#include <linux/kernel.h>
-#include <net/netlink.h>
-#include <linux/drbd_genl_api.h>
-#include "drbd_nla.h"
-
-static int drbd_nla_check_mandatory(int maxtype, struct nlattr *nla)
-{
-	struct nlattr *head = nla_data(nla);
-	int len = nla_len(nla);
-	int rem;
-
-	/*
-	 * validate_nla (called from nla_parse_nested) ignores attributes
-	 * beyond maxtype, and does not understand the DRBD_GENLA_F_MANDATORY flag.
-	 * In order to have it validate attributes with the DRBD_GENLA_F_MANDATORY
-	 * flag set also, check and remove that flag before calling
-	 * nla_parse_nested.
-	 */
-
-	nla_for_each_attr(nla, head, len, rem) {
-		if (nla->nla_type & DRBD_GENLA_F_MANDATORY) {
-			nla->nla_type &= ~DRBD_GENLA_F_MANDATORY;
-			if (nla_type(nla) > maxtype)
-				return -EOPNOTSUPP;
-		}
-	}
-	return 0;
-}
-
-int drbd_nla_parse_nested(struct nlattr *tb[], int maxtype, struct nlattr *nla,
-			  const struct nla_policy *policy)
-{
-	int err;
-
-	err = drbd_nla_check_mandatory(maxtype, nla);
-	if (!err)
-		err = nla_parse_nested_deprecated(tb, maxtype, nla, policy,
-						  NULL);
-
-	return err;
-}
-
-struct nlattr *drbd_nla_find_nested(int maxtype, struct nlattr *nla, int attrtype)
-{
-	int err;
-	/*
-	 * If any nested attribute has the DRBD_GENLA_F_MANDATORY flag set and
-	 * we don't know about that attribute, reject all the nested
-	 * attributes.
-	 */
-	err = drbd_nla_check_mandatory(maxtype, nla);
-	if (err)
-		return ERR_PTR(err);
-	return nla_find_nested(nla, attrtype);
-}
diff --git a/drivers/block/drbd/drbd_nla.h b/drivers/block/drbd/drbd_nla.h
deleted file mode 100644
index d3555df0d353..000000000000
--- a/drivers/block/drbd/drbd_nla.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef __DRBD_NLA_H
-#define __DRBD_NLA_H
-
-extern int drbd_nla_parse_nested(struct nlattr *tb[], int maxtype, struct nlattr *nla,
-				 const struct nla_policy *policy);
-extern struct nlattr *drbd_nla_find_nested(int maxtype, struct nlattr *nla, int attrtype);
-
-#endif  /* __DRBD_NLA_H */
diff --git a/include/linux/drbd_genl.h b/include/linux/drbd_genl.h
index 53f44b8cd75f..f53c534aba0c 100644
--- a/include/linux/drbd_genl.h
+++ b/include/linux/drbd_genl.h
@@ -87,7 +87,7 @@
  */
 GENL_struct(DRBD_NLA_CFG_REPLY, 1, drbd_cfg_reply,
 		/* "arbitrary" size strings, nla_policy.len = 0 */
-	__str_field(1, DRBD_GENLA_F_MANDATORY,	info_text, 0)
+	__str_field(1, 0,	info_text, 0)
 )
 
 /* Configuration requests typically need a context to operate on.
@@ -96,10 +96,10 @@ GENL_struct(DRBD_NLA_CFG_REPLY, 1, drbd_cfg_reply,
  * and/or the replication group (aka resource) name,
  * and the volume id within the resource. */
 GENL_struct(DRBD_NLA_CFG_CONTEXT, 2, drbd_cfg_context,
-	__u32_field(1, DRBD_GENLA_F_MANDATORY,	ctx_volume)
-	__str_field(2, DRBD_GENLA_F_MANDATORY,	ctx_resource_name, 128)
-	__bin_field(3, DRBD_GENLA_F_MANDATORY,	ctx_my_addr, 128)
-	__bin_field(4, DRBD_GENLA_F_MANDATORY,	ctx_peer_addr, 128)
+	__u32_field(1, 0,	ctx_volume)
+	__str_field(2, 0,	ctx_resource_name, 128)
+	__bin_field(3, 0,	ctx_my_addr, 128)
+	__bin_field(4, 0,	ctx_peer_addr, 128)
 )
 
 GENL_struct(DRBD_NLA_DISK_CONF, 3, disk_conf,
@@ -108,86 +108,86 @@ GENL_struct(DRBD_NLA_DISK_CONF, 3, disk_conf,
 	__s32_field(3, DRBD_F_REQUIRED | DRBD_F_INVARIANT,	meta_dev_idx)
 
 	/* use the resize command to try and change the disk_size */
-	__u64_field(4, DRBD_GENLA_F_MANDATORY | DRBD_F_INVARIANT,	disk_size)
+	__u64_field(4, DRBD_F_INVARIANT,	disk_size)
 	/* we could change the max_bio_bvecs,
 	 * but it won't propagate through the stack */
-	__u32_field(5, DRBD_GENLA_F_MANDATORY | DRBD_F_INVARIANT,	max_bio_bvecs)
-
-	__u32_field_def(6, DRBD_GENLA_F_MANDATORY,	on_io_error, DRBD_ON_IO_ERROR_DEF)
-	__u32_field_def(7, DRBD_GENLA_F_MANDATORY,	fencing, DRBD_FENCING_DEF)
-
-	__u32_field_def(8,	DRBD_GENLA_F_MANDATORY,	resync_rate, DRBD_RESYNC_RATE_DEF)
-	__s32_field_def(9,	DRBD_GENLA_F_MANDATORY,	resync_after, DRBD_MINOR_NUMBER_DEF)
-	__u32_field_def(10,	DRBD_GENLA_F_MANDATORY,	al_extents, DRBD_AL_EXTENTS_DEF)
-	__u32_field_def(11,	DRBD_GENLA_F_MANDATORY,	c_plan_ahead, DRBD_C_PLAN_AHEAD_DEF)
-	__u32_field_def(12,	DRBD_GENLA_F_MANDATORY,	c_delay_target, DRBD_C_DELAY_TARGET_DEF)
-	__u32_field_def(13,	DRBD_GENLA_F_MANDATORY,	c_fill_target, DRBD_C_FILL_TARGET_DEF)
-	__u32_field_def(14,	DRBD_GENLA_F_MANDATORY,	c_max_rate, DRBD_C_MAX_RATE_DEF)
-	__u32_field_def(15,	DRBD_GENLA_F_MANDATORY,	c_min_rate, DRBD_C_MIN_RATE_DEF)
-	__u32_field_def(20,     DRBD_GENLA_F_MANDATORY, disk_timeout, DRBD_DISK_TIMEOUT_DEF)
+	__u32_field(5, DRBD_F_INVARIANT,	max_bio_bvecs)
+
+	__u32_field_def(6, 0,	on_io_error, DRBD_ON_IO_ERROR_DEF)
+	__u32_field_def(7, 0,	fencing, DRBD_FENCING_DEF)
+
+	__u32_field_def(8,	0,	resync_rate, DRBD_RESYNC_RATE_DEF)
+	__s32_field_def(9,	0,	resync_after, DRBD_MINOR_NUMBER_DEF)
+	__u32_field_def(10,	0,	al_extents, DRBD_AL_EXTENTS_DEF)
+	__u32_field_def(11,	0,	c_plan_ahead, DRBD_C_PLAN_AHEAD_DEF)
+	__u32_field_def(12,	0,	c_delay_target, DRBD_C_DELAY_TARGET_DEF)
+	__u32_field_def(13,	0,	c_fill_target, DRBD_C_FILL_TARGET_DEF)
+	__u32_field_def(14,	0,	c_max_rate, DRBD_C_MAX_RATE_DEF)
+	__u32_field_def(15,	0,	c_min_rate, DRBD_C_MIN_RATE_DEF)
+	__u32_field_def(20,     0, disk_timeout, DRBD_DISK_TIMEOUT_DEF)
 	__u32_field_def(21,     0 /* OPTIONAL */,       read_balancing, DRBD_READ_BALANCING_DEF)
 	__u32_field_def(25,     0 /* OPTIONAL */,       rs_discard_granularity, DRBD_RS_DISCARD_GRANULARITY_DEF)
 
-	__flg_field_def(16, DRBD_GENLA_F_MANDATORY,	disk_barrier, DRBD_DISK_BARRIER_DEF)
-	__flg_field_def(17, DRBD_GENLA_F_MANDATORY,	disk_flushes, DRBD_DISK_FLUSHES_DEF)
-	__flg_field_def(18, DRBD_GENLA_F_MANDATORY,	disk_drain, DRBD_DISK_DRAIN_DEF)
-	__flg_field_def(19, DRBD_GENLA_F_MANDATORY,	md_flushes, DRBD_MD_FLUSHES_DEF)
+	__flg_field_def(16, 0,	disk_barrier, DRBD_DISK_BARRIER_DEF)
+	__flg_field_def(17, 0,	disk_flushes, DRBD_DISK_FLUSHES_DEF)
+	__flg_field_def(18, 0,	disk_drain, DRBD_DISK_DRAIN_DEF)
+	__flg_field_def(19, 0,	md_flushes, DRBD_MD_FLUSHES_DEF)
 	__flg_field_def(23,     0 /* OPTIONAL */,	al_updates, DRBD_AL_UPDATES_DEF)
 	__flg_field_def(24,     0 /* OPTIONAL */,	discard_zeroes_if_aligned, DRBD_DISCARD_ZEROES_IF_ALIGNED_DEF)
 	__flg_field_def(26,     0 /* OPTIONAL */,	disable_write_same, DRBD_DISABLE_WRITE_SAME_DEF)
 )
 
 GENL_struct(DRBD_NLA_RESOURCE_OPTS, 4, res_opts,
-	__str_field_def(1,	DRBD_GENLA_F_MANDATORY,	cpu_mask,       DRBD_CPU_MASK_SIZE)
-	__u32_field_def(2,	DRBD_GENLA_F_MANDATORY,	on_no_data, DRBD_ON_NO_DATA_DEF)
+	__str_field_def(1,	0,	cpu_mask,       DRBD_CPU_MASK_SIZE)
+	__u32_field_def(2,	0,	on_no_data, DRBD_ON_NO_DATA_DEF)
 )
 
 GENL_struct(DRBD_NLA_NET_CONF, 5, net_conf,
-	__str_field_def(1,	DRBD_GENLA_F_MANDATORY | DRBD_F_SENSITIVE,
+	__str_field_def(1,	DRBD_F_SENSITIVE,
 						shared_secret,	SHARED_SECRET_MAX)
-	__str_field_def(2,	DRBD_GENLA_F_MANDATORY,	cram_hmac_alg,	SHARED_SECRET_MAX)
-	__str_field_def(3,	DRBD_GENLA_F_MANDATORY,	integrity_alg,	SHARED_SECRET_MAX)
-	__str_field_def(4,	DRBD_GENLA_F_MANDATORY,	verify_alg,     SHARED_SECRET_MAX)
-	__str_field_def(5,	DRBD_GENLA_F_MANDATORY,	csums_alg,	SHARED_SECRET_MAX)
-	__u32_field_def(6,	DRBD_GENLA_F_MANDATORY,	wire_protocol, DRBD_PROTOCOL_DEF)
-	__u32_field_def(7,	DRBD_GENLA_F_MANDATORY,	connect_int, DRBD_CONNECT_INT_DEF)
-	__u32_field_def(8,	DRBD_GENLA_F_MANDATORY,	timeout, DRBD_TIMEOUT_DEF)
-	__u32_field_def(9,	DRBD_GENLA_F_MANDATORY,	ping_int, DRBD_PING_INT_DEF)
-	__u32_field_def(10,	DRBD_GENLA_F_MANDATORY,	ping_timeo, DRBD_PING_TIMEO_DEF)
-	__u32_field_def(11,	DRBD_GENLA_F_MANDATORY,	sndbuf_size, DRBD_SNDBUF_SIZE_DEF)
-	__u32_field_def(12,	DRBD_GENLA_F_MANDATORY,	rcvbuf_size, DRBD_RCVBUF_SIZE_DEF)
-	__u32_field_def(13,	DRBD_GENLA_F_MANDATORY,	ko_count, DRBD_KO_COUNT_DEF)
-	__u32_field_def(14,	DRBD_GENLA_F_MANDATORY,	max_buffers, DRBD_MAX_BUFFERS_DEF)
-	__u32_field_def(15,	DRBD_GENLA_F_MANDATORY,	max_epoch_size, DRBD_MAX_EPOCH_SIZE_DEF)
-	__u32_field_def(16,	DRBD_GENLA_F_MANDATORY,	unplug_watermark, DRBD_UNPLUG_WATERMARK_DEF)
-	__u32_field_def(17,	DRBD_GENLA_F_MANDATORY,	after_sb_0p, DRBD_AFTER_SB_0P_DEF)
-	__u32_field_def(18,	DRBD_GENLA_F_MANDATORY,	after_sb_1p, DRBD_AFTER_SB_1P_DEF)
-	__u32_field_def(19,	DRBD_GENLA_F_MANDATORY,	after_sb_2p, DRBD_AFTER_SB_2P_DEF)
-	__u32_field_def(20,	DRBD_GENLA_F_MANDATORY,	rr_conflict, DRBD_RR_CONFLICT_DEF)
-	__u32_field_def(21,	DRBD_GENLA_F_MANDATORY,	on_congestion, DRBD_ON_CONGESTION_DEF)
-	__u32_field_def(22,	DRBD_GENLA_F_MANDATORY,	cong_fill, DRBD_CONG_FILL_DEF)
-	__u32_field_def(23,	DRBD_GENLA_F_MANDATORY,	cong_extents, DRBD_CONG_EXTENTS_DEF)
-	__flg_field_def(24, DRBD_GENLA_F_MANDATORY,	two_primaries, DRBD_ALLOW_TWO_PRIMARIES_DEF)
-	__flg_field(25, DRBD_GENLA_F_MANDATORY | DRBD_F_INVARIANT,	discard_my_data)
-	__flg_field_def(26, DRBD_GENLA_F_MANDATORY,	tcp_cork, DRBD_TCP_CORK_DEF)
-	__flg_field_def(27, DRBD_GENLA_F_MANDATORY,	always_asbp, DRBD_ALWAYS_ASBP_DEF)
-	__flg_field(28, DRBD_GENLA_F_MANDATORY | DRBD_F_INVARIANT,	tentative)
-	__flg_field_def(29,	DRBD_GENLA_F_MANDATORY,	use_rle, DRBD_USE_RLE_DEF)
-	/* 9: __u32_field_def(30,	DRBD_GENLA_F_MANDATORY,	fencing_policy, DRBD_FENCING_DEF) */
-	/* 9: __str_field_def(31,     DRBD_GENLA_F_MANDATORY, name, SHARED_SECRET_MAX) */
+	__str_field_def(2,	0,	cram_hmac_alg,	SHARED_SECRET_MAX)
+	__str_field_def(3,	0,	integrity_alg,	SHARED_SECRET_MAX)
+	__str_field_def(4,	0,	verify_alg,     SHARED_SECRET_MAX)
+	__str_field_def(5,	0,	csums_alg,	SHARED_SECRET_MAX)
+	__u32_field_def(6,	0,	wire_protocol, DRBD_PROTOCOL_DEF)
+	__u32_field_def(7,	0,	connect_int, DRBD_CONNECT_INT_DEF)
+	__u32_field_def(8,	0,	timeout, DRBD_TIMEOUT_DEF)
+	__u32_field_def(9,	0,	ping_int, DRBD_PING_INT_DEF)
+	__u32_field_def(10,	0,	ping_timeo, DRBD_PING_TIMEO_DEF)
+	__u32_field_def(11,	0,	sndbuf_size, DRBD_SNDBUF_SIZE_DEF)
+	__u32_field_def(12,	0,	rcvbuf_size, DRBD_RCVBUF_SIZE_DEF)
+	__u32_field_def(13,	0,	ko_count, DRBD_KO_COUNT_DEF)
+	__u32_field_def(14,	0,	max_buffers, DRBD_MAX_BUFFERS_DEF)
+	__u32_field_def(15,	0,	max_epoch_size, DRBD_MAX_EPOCH_SIZE_DEF)
+	__u32_field_def(16,	0,	unplug_watermark, DRBD_UNPLUG_WATERMARK_DEF)
+	__u32_field_def(17,	0,	after_sb_0p, DRBD_AFTER_SB_0P_DEF)
+	__u32_field_def(18,	0,	after_sb_1p, DRBD_AFTER_SB_1P_DEF)
+	__u32_field_def(19,	0,	after_sb_2p, DRBD_AFTER_SB_2P_DEF)
+	__u32_field_def(20,	0,	rr_conflict, DRBD_RR_CONFLICT_DEF)
+	__u32_field_def(21,	0,	on_congestion, DRBD_ON_CONGESTION_DEF)
+	__u32_field_def(22,	0,	cong_fill, DRBD_CONG_FILL_DEF)
+	__u32_field_def(23,	0,	cong_extents, DRBD_CONG_EXTENTS_DEF)
+	__flg_field_def(24, 0,	two_primaries, DRBD_ALLOW_TWO_PRIMARIES_DEF)
+	__flg_field(25, DRBD_F_INVARIANT,	discard_my_data)
+	__flg_field_def(26, 0,	tcp_cork, DRBD_TCP_CORK_DEF)
+	__flg_field_def(27, 0,	always_asbp, DRBD_ALWAYS_ASBP_DEF)
+	__flg_field(28, DRBD_F_INVARIANT,	tentative)
+	__flg_field_def(29,	0,	use_rle, DRBD_USE_RLE_DEF)
+	/* 9: __u32_field_def(30,	0,	fencing_policy, DRBD_FENCING_DEF) */
+	/* 9: __str_field_def(31,     0, name, SHARED_SECRET_MAX) */
 	/* 9: __u32_field(32,         DRBD_F_REQUIRED | DRBD_F_INVARIANT,     peer_node_id) */
 	__flg_field_def(33, 0 /* OPTIONAL */,	csums_after_crash_only, DRBD_CSUMS_AFTER_CRASH_ONLY_DEF)
 	__u32_field_def(34, 0 /* OPTIONAL */, sock_check_timeo, DRBD_SOCKET_CHECK_TIMEO_DEF)
 )
 
 GENL_struct(DRBD_NLA_SET_ROLE_PARMS, 6, set_role_parms,
-	__flg_field(1, DRBD_GENLA_F_MANDATORY,	assume_uptodate)
+	__flg_field(1, 0,	assume_uptodate)
 )
 
 GENL_struct(DRBD_NLA_RESIZE_PARMS, 7, resize_parms,
-	__u64_field(1, DRBD_GENLA_F_MANDATORY,	resize_size)
-	__flg_field(2, DRBD_GENLA_F_MANDATORY,	resize_force)
-	__flg_field(3, DRBD_GENLA_F_MANDATORY,	no_resync)
+	__u64_field(1, 0,	resize_size)
+	__flg_field(2, 0,	resize_force)
+	__flg_field(3, 0,	no_resync)
 	__u32_field_def(4, 0 /* OPTIONAL */, al_stripes, DRBD_AL_STRIPES_DEF)
 	__u32_field_def(5, 0 /* OPTIONAL */, al_stripe_size, DRBD_AL_STRIPE_SIZE_DEF)
 )
@@ -195,31 +195,31 @@ GENL_struct(DRBD_NLA_RESIZE_PARMS, 7, resize_parms,
 GENL_struct(DRBD_NLA_STATE_INFO, 8, state_info,
 	/* the reason of the broadcast,
 	 * if this is an event triggered broadcast. */
-	__u32_field(1, DRBD_GENLA_F_MANDATORY,	sib_reason)
+	__u32_field(1, 0,	sib_reason)
 	__u32_field(2, DRBD_F_REQUIRED,	current_state)
-	__u64_field(3, DRBD_GENLA_F_MANDATORY,	capacity)
-	__u64_field(4, DRBD_GENLA_F_MANDATORY,	ed_uuid)
+	__u64_field(3, 0,	capacity)
+	__u64_field(4, 0,	ed_uuid)
 
 	/* These are for broadcast from after state change work.
 	 * prev_state and new_state are from the moment the state change took
 	 * place, new_state is not neccessarily the same as current_state,
 	 * there may have been more state changes since.  Which will be
 	 * broadcasted soon, in their respective after state change work.  */
-	__u32_field(5, DRBD_GENLA_F_MANDATORY,	prev_state)
-	__u32_field(6, DRBD_GENLA_F_MANDATORY,	new_state)
+	__u32_field(5, 0,	prev_state)
+	__u32_field(6, 0,	new_state)
 
 	/* if we have a local disk: */
-	__bin_field(7, DRBD_GENLA_F_MANDATORY,	uuids, (UI_SIZE*sizeof(__u64)))
-	__u32_field(8, DRBD_GENLA_F_MANDATORY,	disk_flags)
-	__u64_field(9, DRBD_GENLA_F_MANDATORY,	bits_total)
-	__u64_field(10, DRBD_GENLA_F_MANDATORY,	bits_oos)
+	__bin_field(7, 0,	uuids, (UI_SIZE*sizeof(__u64)))
+	__u32_field(8, 0,	disk_flags)
+	__u64_field(9, 0,	bits_total)
+	__u64_field(10, 0,	bits_oos)
 	/* and in case resync or online verify is active */
-	__u64_field(11, DRBD_GENLA_F_MANDATORY,	bits_rs_total)
-	__u64_field(12, DRBD_GENLA_F_MANDATORY,	bits_rs_failed)
+	__u64_field(11, 0,	bits_rs_total)
+	__u64_field(12, 0,	bits_rs_failed)
 
 	/* for pre and post notifications of helper execution */
-	__str_field(13, DRBD_GENLA_F_MANDATORY,	helper, 32)
-	__u32_field(14, DRBD_GENLA_F_MANDATORY,	helper_exit_code)
+	__str_field(13, 0,	helper, 32)
+	__u32_field(14, 0,	helper_exit_code)
 
 	__u64_field(15,                      0, send_cnt)
 	__u64_field(16,                      0, recv_cnt)
@@ -233,12 +233,12 @@ GENL_struct(DRBD_NLA_STATE_INFO, 8, state_info,
 )
 
 GENL_struct(DRBD_NLA_START_OV_PARMS, 9, start_ov_parms,
-	__u64_field(1, DRBD_GENLA_F_MANDATORY,	ov_start_sector)
-	__u64_field(2, DRBD_GENLA_F_MANDATORY,	ov_stop_sector)
+	__u64_field(1, 0,	ov_start_sector)
+	__u64_field(2, 0,	ov_stop_sector)
 )
 
 GENL_struct(DRBD_NLA_NEW_C_UUID_PARMS, 10, new_c_uuid_parms,
-	__flg_field(1, DRBD_GENLA_F_MANDATORY, clear_bm)
+	__flg_field(1, 0, clear_bm)
 )
 
 GENL_struct(DRBD_NLA_TIMEOUT_PARMS, 11, timeout_parms,
@@ -246,11 +246,11 @@ GENL_struct(DRBD_NLA_TIMEOUT_PARMS, 11, timeout_parms,
 )
 
 GENL_struct(DRBD_NLA_DISCONNECT_PARMS, 12, disconnect_parms,
-	__flg_field(1, DRBD_GENLA_F_MANDATORY,	force_disconnect)
+	__flg_field(1, 0,	force_disconnect)
 )
 
 GENL_struct(DRBD_NLA_DETACH_PARMS, 13, detach_parms,
-	__flg_field(1, DRBD_GENLA_F_MANDATORY,	force_detach)
+	__flg_field(1, 0,	force_detach)
 )
 
 GENL_struct(DRBD_NLA_RESOURCE_INFO, 15, resource_info,
@@ -315,12 +315,12 @@ GENL_struct(DRBD_NLA_PEER_DEVICE_STATISTICS, 22, peer_device_statistics,
 )
 
 GENL_struct(DRBD_NLA_NOTIFICATION_HEADER, 23, drbd_notification_header,
-	__u32_field(1, DRBD_GENLA_F_MANDATORY, nh_type)
+	__u32_field(1, 0, nh_type)
 )
 
 GENL_struct(DRBD_NLA_HELPER, 24, drbd_helper_info,
-	__str_field(1, DRBD_GENLA_F_MANDATORY, helper_name, 32)
-	__u32_field(2, DRBD_GENLA_F_MANDATORY, helper_status)
+	__str_field(1, 0, helper_name, 32)
+	__u32_field(2, 0, helper_status)
 )
 
 /*
@@ -333,9 +333,9 @@ GENL_notification(
 	DRBD_EVENT, 1, events,
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
 	GENL_tla_expected(DRBD_NLA_STATE_INFO, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NET_CONF, DRBD_GENLA_F_MANDATORY)
-	GENL_tla_expected(DRBD_NLA_DISK_CONF, DRBD_GENLA_F_MANDATORY)
-	GENL_tla_expected(DRBD_NLA_SYNCER_CONF, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_NET_CONF, 0)
+	GENL_tla_expected(DRBD_NLA_DISK_CONF, 0)
+	GENL_tla_expected(DRBD_NLA_SYNCER_CONF, 0)
 )
 
 	/* query kernel for specific or all info */
@@ -349,7 +349,7 @@ GENL_op(
 	),
 	/* To select the object .doit.
 	 * Or a subset of objects in .dumpit. */
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0)
 )
 
 	/* add DRBD minor devices as volumes to resources */
@@ -367,7 +367,7 @@ GENL_op(DRBD_ADM_DEL_RESOURCE, 8, GENL_doit(drbd_adm_del_resource),
 GENL_op(DRBD_ADM_RESOURCE_OPTS, 9,
 	GENL_doit(drbd_adm_resource_opts),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_RESOURCE_OPTS, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_RESOURCE_OPTS, 0)
 )
 
 GENL_op(
@@ -403,7 +403,7 @@ GENL_op(
 	DRBD_ADM_RESIZE, 13,
 	GENL_doit(drbd_adm_resize),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_RESIZE_PARMS, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_RESIZE_PARMS, 0)
 )
 
 GENL_op(
@@ -424,18 +424,18 @@ GENL_op(
 	DRBD_ADM_NEW_C_UUID, 16,
 	GENL_doit(drbd_adm_new_c_uuid),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_NEW_C_UUID_PARMS, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_NEW_C_UUID_PARMS, 0)
 )
 
 GENL_op(
 	DRBD_ADM_START_OV, 17,
 	GENL_doit(drbd_adm_start_ov),
-	GENL_tla_expected(DRBD_NLA_START_OV_PARMS, DRBD_GENLA_F_MANDATORY)
+	GENL_tla_expected(DRBD_NLA_START_OV_PARMS, 0)
 )
 
 GENL_op(DRBD_ADM_DETACH,	18, GENL_doit(drbd_adm_detach),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED)
-	GENL_tla_expected(DRBD_NLA_DETACH_PARMS, DRBD_GENLA_F_MANDATORY))
+	GENL_tla_expected(DRBD_NLA_DETACH_PARMS, 0))
 
 GENL_op(DRBD_ADM_INVALIDATE,	19, GENL_doit(drbd_adm_invalidate),
 	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_F_REQUIRED))
@@ -460,36 +460,36 @@ GENL_op(DRBD_ADM_GET_RESOURCES, 30,
 	 GENL_op_init(
 		 .dumpit = drbd_adm_dump_resources,
 	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_RESOURCE_INFO, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_RESOURCE_STATISTICS, DRBD_GENLA_F_MANDATORY))
+	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0)
+	 GENL_tla_expected(DRBD_NLA_RESOURCE_INFO, 0)
+	 GENL_tla_expected(DRBD_NLA_RESOURCE_STATISTICS, 0))
 
 GENL_op(DRBD_ADM_GET_DEVICES, 31,
 	 GENL_op_init(
 		 .dumpit = drbd_adm_dump_devices,
 		 .done = drbd_adm_dump_devices_done,
 	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_DEVICE_INFO, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_DEVICE_STATISTICS, DRBD_GENLA_F_MANDATORY))
+	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0)
+	 GENL_tla_expected(DRBD_NLA_DEVICE_INFO, 0)
+	 GENL_tla_expected(DRBD_NLA_DEVICE_STATISTICS, 0))
 
 GENL_op(DRBD_ADM_GET_CONNECTIONS, 32,
 	 GENL_op_init(
 		 .dumpit = drbd_adm_dump_connections,
 		 .done = drbd_adm_dump_connections_done,
 	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_CONNECTION_INFO, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_CONNECTION_STATISTICS, DRBD_GENLA_F_MANDATORY))
+	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0)
+	 GENL_tla_expected(DRBD_NLA_CONNECTION_INFO, 0)
+	 GENL_tla_expected(DRBD_NLA_CONNECTION_STATISTICS, 0))
 
 GENL_op(DRBD_ADM_GET_PEER_DEVICES, 33,
 	 GENL_op_init(
 		 .dumpit = drbd_adm_dump_peer_devices,
 		 .done = drbd_adm_dump_peer_devices_done,
 	 ),
-	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_PEER_DEVICE_INFO, DRBD_GENLA_F_MANDATORY)
-	 GENL_tla_expected(DRBD_NLA_PEER_DEVICE_STATISTICS, DRBD_GENLA_F_MANDATORY))
+	 GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0)
+	 GENL_tla_expected(DRBD_NLA_PEER_DEVICE_INFO, 0)
+	 GENL_tla_expected(DRBD_NLA_PEER_DEVICE_STATISTICS, 0))
 
 GENL_notification(
 	DRBD_RESOURCE_STATE, 34, events,
@@ -524,7 +524,7 @@ GENL_op(
 	GENL_op_init(
 	        .dumpit = drbd_adm_get_initial_state,
 	),
-	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, DRBD_GENLA_F_MANDATORY))
+	GENL_tla_expected(DRBD_NLA_CFG_CONTEXT, 0))
 
 GENL_notification(
 	DRBD_HELPER, 40, events,
diff --git a/include/linux/genl_magic_func.h b/include/linux/genl_magic_func.h
index 6edcac85155e..a7d36c9ea924 100644
--- a/include/linux/genl_magic_func.h
+++ b/include/linux/genl_magic_func.h
@@ -149,7 +149,8 @@ static int __ ## s_name ## _from_attrs(struct s_name *s,		\
 	if (!tla)							\
 		return -ENOMSG;						\
 	DPRINT_TLA(#s_name, "<=-", #tag_name);				\
-	err = drbd_nla_parse_nested(ntb, maxtype, tla, s_name ## _nl_policy);	\
+	err = nla_parse_nested_deprecated(ntb, maxtype, tla,			\
+					  s_name ## _nl_policy, NULL);	\
 	if (err)							\
 		return err;						\
 									\
diff --git a/include/linux/genl_magic_struct.h b/include/linux/genl_magic_struct.h
index 621b87a87d74..2200cedd160a 100644
--- a/include/linux/genl_magic_struct.h
+++ b/include/linux/genl_magic_struct.h
@@ -25,16 +25,6 @@ extern void CONCATENATE(GENL_MAGIC_FAMILY, _genl_unregister)(void);
  * Extension of genl attribute validation policies			{{{2
  */
 
-/*
- * @DRBD_GENLA_F_MANDATORY: By default, netlink ignores attributes it does not
- * know about.  This flag can be set in nlattr->nla_type to indicate that this
- * attribute must not be ignored.
- *
- * We check and remove this flag in drbd_nla_check_mandatory() before
- * validating the attribute types and lengths via nla_parse_nested().
- */
-#define DRBD_GENLA_F_MANDATORY (1 << 14)
-
 /*
  * Flags specific to drbd and not visible at the netlink layer, used in
  * <struct>_from_attrs and <struct>_to_skb:
@@ -52,7 +42,6 @@ extern void CONCATENATE(GENL_MAGIC_FAMILY, _genl_unregister)(void);
 #define DRBD_F_SENSITIVE (1 << 1)
 #define DRBD_F_INVARIANT (1 << 2)
 
-#define __nla_type(x)	((__u16)((x) & NLA_TYPE_MASK & ~DRBD_GENLA_F_MANDATORY))
 
 /*									}}}1
  * MAGIC
@@ -158,12 +147,12 @@ enum {								\
 #undef __field
 #define __field(attr_nr, attr_flag, name, nla_type, type,	\
 		__get, __put, __is_signed)			\
-	T_ ## name = (__u16)(attr_nr | ((attr_flag) & DRBD_GENLA_F_MANDATORY)),
+	T_ ## name = (__u16)(attr_nr),
 
 #undef __array
 #define __array(attr_nr, attr_flag, name, nla_type, type,	\
 		maxlen, __get, __put, __is_signed)		\
-	T_ ## name = (__u16)(attr_nr | ((attr_flag) & DRBD_GENLA_F_MANDATORY)),
+	T_ ## name = (__u16)(attr_nr),
 
 #include GENL_MAGIC_INCLUDE_FILE
 

base-commit: 20a8e451ec1c7e99060b1bbaaad03ce88c39ddb8
-- 
2.53.0

