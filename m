Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Io4AvvJumm6bwIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:51:23 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id CF0242BEA30
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:51:22 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7440316312C;
	Wed, 18 Mar 2026 16:49:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
	[209.85.128.170])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 66411162774
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 00:23:24 +0100 (CET)
Received: by mail-yw1-f170.google.com with SMTP id
	00721157ae682-79a40fb9890so30973257b3.1
	for <drbd-dev@lists.linbit.com>; Tue, 17 Mar 2026 16:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1773789803; x=1774394603;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=4qAb7BAjRHOKOhLG2ZwGENg8pg0OEX1p0HLdyPGydEM=;
	b=EaAuFpuMKn6HfyiWi/A6DBwnwT3v6CkfNxt3VPkpYznM1EnbRUJm5GT6jh+DR3cmcp
	2yxLFg8LRMRYyZqM4DMAUsRr+d0LcwM/udWqmCbircIzr/d8wJz4MinNMHJGvhUTMju0
	nEF86xcCmhMAmvruXyWuoJaMQjDvvfQflCuQ9nZuksCmS1RhXH+koAujLwSyw2wZEd6p
	KnAcuhCWQd/82Qh9dciTC4/wRA+J+B7EKA6KRyA/lG1DpqAk93cfFROVEcHcOzIoTEIT
	9GLpENP1fw/sRJcfeVIOpsmpE0SUkkLKzx1zbViX3S771UTOqF2gmcVtowiDTyuZ48Xe
	0oXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773789803; x=1774394603;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=4qAb7BAjRHOKOhLG2ZwGENg8pg0OEX1p0HLdyPGydEM=;
	b=rpf9WEDQ7iPAAT9BgaprypqHS7IUtJvm0mDXIeUNjtyGL9tTGJ40leBAQBR7GNGU38
	qM5W/oxvVmM0I6NwxPFObcK535mBfB7ot7WRNU19phfwKFk27wbyVXP0doW/tp3xTlDj
	28ljuyiYAOLjcbr6uX712jFyWz5BUlIMdz+B3q94AJaafjOyzWiw9/Kvv7sbh1yd5WuR
	4I/tM1ZdxrICBCn1brW9w1clIkfLU6Z0uv92I2Uq7/4rjlgiAYpyXFqld5G28J0sJL0p
	/vzo+zqf+fBC3X98vOlUX36PcScSg+e00xhhHvrBVIEfgpQjmvyq2nXQUzu+XIVb7zvZ
	yXAg==
X-Gm-Message-State: AOJu0YyalLyVQLJaONNwejQqhd6Qq6saXZYXjJ5/2vAEfhPaOA48rwc3
	p5R90wXllaOXNBZLFSmQefvqD+wOyIGMlgRQnosnw7CHEulzk++pl40z
X-Gm-Gg: ATEYQzwuuYvMllruLN1dA6JvvXUdBZYFoU/BMx14VPXndmn+tQyxvlnZ7oI2a3P66Nh
	JNNb4wcKRwt51ID9JLryH5SNWz0p2QdfMgVkU3ZgwKfGK4v1ETXGpyzLIsx2dyW4CCtCHsEmE9t
	X4dYtPdqGjNgCdMd2dLnBXI0lHvoaaUTnUqJEl+/RJmATlC1REG9hcgU6VDyWvsescrY1kJSbzv
	hqy23Eq3mUYfaD3xOcWmUJ6GtRDMubj9WfYwgaWIVmaStRkuO8tioK92n1Uj9YI3OiGJdSHJqqY
	9kSl4T2kB1s/+sliqTk6V/Ur7QjY0xawwLKWyrzPIxbZvkRnedNMVrjKY4phpmw40YOMqLP8Sgr
	6XE+wQk6KRrT7qN6qSTfArwu4POIePF/7Q94zstr/M9zQT7Qd6A8aJJHIjQeTjQXo0Tv2RssMIA
	C3M3vDgyEaOYVY5EdXKFjmsl1OxKQBgoDZDZDslajGFWF/X+yQUxPfzlgsJ70FynjaA9yuaPPUe
	uJEo1//Wj+oE8dr49vGjyp0
X-Received: by 2002:a05:690c:60c4:b0:799:1c93:7adb with SMTP id
	00721157ae682-79a718a5e91mr13675337b3.23.1773789803317; 
	Tue, 17 Mar 2026 16:23:23 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::f769])
	by smtp.gmail.com with ESMTPSA id
	00721157ae682-79a715d221dsm6858217b3.37.2026.03.17.16.23.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2026 16:23:23 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 4/4] drbd: Add check for error pointer
Date: Tue, 17 Mar 2026 18:23:18 -0500
Message-ID: <20260317232318.18923-5-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317232318.18923-1-ethantidmore06@gmail.com>
References: <20260317232318.18923-1-ethantidmore06@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 18 Mar 2026 16:49:43 +0100
Cc: linux-block@vger.kernel.org, Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [2.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[ethantidmore06@gmail.com,drbd-dev-bounces@lists.linbit.com];
	NEURAL_HAM(-0.00)[-0.162];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:philipp.reisner@linbit.com,m:lars.ellenberg@linbit.com,m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:ethantidmore06@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.linbit.com];
	FROM_NEQ_ENVFROM(0.00)[ethantidmore06@gmail.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: CF0242BEA30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The function find_cfg_context_attr() can return an error pointer or NULL
in its error path.

Change NULL check to IS_ERR_OR_NULL().

Detected by Smatch:
drivers/block/drbd/drbd_nl.c:6571 drbd_adm_dump_paths() error:
'resource_filter' dereferencing possible ERR_PTR()

Fixes: 626c95b0e2a23 ("drbd: rework netlink interface for DRBD 9 multi-peer config")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/block/drbd/drbd_nl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/drbd/drbd_nl.c b/drivers/block/drbd/drbd_nl.c
index c5e253820ccf..1f458eb972e9 100644
--- a/drivers/block/drbd/drbd_nl.c
+++ b/drivers/block/drbd/drbd_nl.c
@@ -6566,7 +6566,7 @@ static int drbd_adm_dump_paths(struct sk_buff *skb, struct netlink_callback *cb)
 	resource = (struct drbd_resource *)cb->args[0];
 	if (!cb->args[0]) {
 		resource_filter = find_cfg_context_attr(cb->nlh, T_ctx_resource_name);
-		if (resource_filter) {
+		if (!IS_ERR_OR_NULL(resource_filter)) {
 			retcode = ERR_RES_NOT_KNOWN;
 			resource = drbd_find_resource(nla_data(resource_filter));
 			if (!resource)
-- 
2.53.0

