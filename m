Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sM7aD/DJumm6bwIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:51:12 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 2C4BD2BEA0F
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:51:12 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 417CE1627AE;
	Wed, 18 Mar 2026 16:49:56 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
	[209.85.128.173])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CD0F41627AE
	for <drbd-dev@lists.linbit.com>; Wed, 18 Mar 2026 00:23:23 +0100 (CET)
Received: by mail-yw1-f173.google.com with SMTP id
	00721157ae682-79a610a32a6so19393847b3.0
	for <drbd-dev@lists.linbit.com>; Tue, 17 Mar 2026 16:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gmail.com; s=20230601; t=1773789802; x=1774394602;
	darn=lists.linbit.com; 
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:from:to:cc:subject:date
	:message-id:reply-to;
	bh=FnaNOvfPGt1J4YqTrzM2VRxejeZjN9i1yPf1CzG0bKk=;
	b=Yh8/IOen/JeD1k4HTQJK5fPKCqN0lWlDf9SOjzTc30qQ1JrSSYLXWgYD7iAglC/1og
	vPW0cmntsYiMv/UB+xhGuhUDcl1XrxP4ix28RbMe3O2Z/8juCn6IeYXg9taCtgxMP9Xc
	XW9c+pSayiSbSqicu9YAiq9OUKU28e3L5xfMhu4H0D1ramaPWeAUPiD/CA8KRhzVg1zu
	lygp1n3LLxw7eH2mq+X8OGVDJtfFwfy6bmGgEAFsS+H9CVEm7ASfXrO7kEsmEzfsmCfw
	Vmxk6Y6liMKpJB00xPcABgI/KO0LtNmWOA+kjDJeGldfmO4Twj3FXJRYDRGQQ0kG+iq5
	y/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20251104; t=1773789802; x=1774394602;
	h=content-transfer-encoding:mime-version:references:in-reply-to
	:message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
	:to:cc:subject:date:message-id:reply-to;
	bh=FnaNOvfPGt1J4YqTrzM2VRxejeZjN9i1yPf1CzG0bKk=;
	b=AV3Os86VT3kn3EUWCKAR4TNOtkz0kQ5mPCrw/Xsle8uWo5uTiJuO9WuMAfmsM1oAFa
	qXX7X/t92sS6BC5iEoWBBNjXSIeLi2jttfwyIrcBc2IePaIFbV08dg8oKXhzGHogH0Nm
	LBCJ3dTAjQbVbm19jXkwfgQjd/vOFp0yVD0t5xmfBaelPISBW41av1RqnKDGtHBq6cWF
	RiANuJq0bWoEIh6vXwbFTKoanzGXdfRXlYr2qzuroqk85q+jk14AfmD5otzsvixbdvrJ
	nsYRb45aNxccyNy5ZKfFTLK2p55/Cp2GnAsBzMwBoWwjh5CSz8jK7Oa5k1lgA8S0XL8G
	EfHg==
X-Gm-Message-State: AOJu0YxhjqDOjZQRc0m9x4Zpo+8hdorjHMtKwYAnhZZbxhxbbi9Ei+pr
	hRVIqMlb42fcmLWZcKpUeh8ViOsGrwHHK+3XxriLktc8kPI2TCsrGlKHIVrRuj7x
X-Gm-Gg: ATEYQzxjskGK6tBfuiQ+Ni4zE4ktK10OeJTySQH2ZKCjz8062BLnUdfyalsDTErAv9w
	Kec8ZsAAnbgKU8dRyj3cookUTt0C42eBxXvL4NyIs0uvqvIo2vR1cJ+vPX/TwrEjGqqprAF7JM2
	bvroi2f5EL9UcMgWVsifHcWTJwlQOZLavjFKAZm2Q8ldjbvjaF/U6W9pFlW+q4kfHhsvRP5Ojlm
	shiJfotzTo3yF+fzsaw+zyHsSAG7eIjK7Mc4yQ3Wv6iSxbWvwuc57vxMlAVlYhy+FxhxzGAHf9M
	x0IjWLMbJLDXh3rElZ46yHM3daoAZsaQ3iLWgMZLTh04wenFCR/q1JlqSFXG3qlLQXBYX2CLzjc
	k8rAH0bXwzjz1wv9jnkbIsCWVhNPHHkvnn2J/8lvX0qyJS/VIKgvJBo2W6X3oSSZL2UN8xjqP26
	PJv9ge51XTQXbB2ecLgkbxMZuYYgId3NAvDpZhcQg86wDJpPxBi+ekpUC4vZuWUKGok69luFuZe
	0ZQ/jt3Ai+aZAaEzw9x0IvV
X-Received: by 2002:a05:690c:c119:b0:797:f005:2dc0 with SMTP id
	00721157ae682-79a71c88395mr12043627b3.50.1773789802632; 
	Tue, 17 Mar 2026 16:23:22 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::f769])
	by smtp.gmail.com with ESMTPSA id
	00721157ae682-79a715d221dsm6858217b3.37.2026.03.17.16.23.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Mar 2026 16:23:22 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	=?UTF-8?q?Christoph=20B=C3=B6hmwalder?=
	<christoph.boehmwalder@linbit.com>, Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 3/4] drbd: Add missing error code in drbd_main.c
Date: Tue, 17 Mar 2026 18:23:17 -0500
Message-ID: <20260317232318.18923-4-ethantidmore06@gmail.com>
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
	NEURAL_HAM(-0.00)[-0.156];
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
X-Rspamd-Queue-Id: 2C4BD2BEA0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

No error code is assigned in alloc_workqueue() error path.

Assign error code -ENOMEM.

Detected by Smatch:
drivers/block/drbd/drbd_main.c:4575 drbd_init() warn:
missing error code 'err'

Fixes: b2e550c8d1f54 ("drbd: rework module core for DRBD 9 transport and multi-peer")
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/block/drbd/drbd_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index e2c3530cfa13..689b7cac5ec2 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -4569,6 +4569,7 @@ static int __init drbd_init(void)
 		goto fail;
 	}
 
+	err = -ENOMEM;
 	ping_ack_sender = alloc_workqueue("drbd_pas",
 			WQ_UNBOUND | WQ_MEM_RECLAIM | WQ_HIGHPRI, 0);
 	if (!ping_ack_sender)
-- 
2.53.0

