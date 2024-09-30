Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E9D98B4E4
	for <lists+drbd-dev@lfdr.de>; Tue,  1 Oct 2024 08:50:09 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C674A4202C8;
	Tue,  1 Oct 2024 08:50:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail2-relais-roc.national.inria.fr
	(mail2-relais-roc.national.inria.fr [192.134.164.83])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2583B42012B
	for <drbd-dev@lists.linbit.com>; Mon, 30 Sep 2024 13:28:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=qnfJr2JifYt0TRzmtqO+mgXV4VxU/z0o+uWEZRVe07I=;
	b=EpzwlheRhiWecFNoyf4rVuQwUD3eFfP0tw49DBuVU7xdPKz7pM7yTpfv
	QcqFNss6kBEsv9MQ1+2JBrSruasZWFGcIZK2UD+8JZnRhw6nQ0hIkRaNE
	2Z5IxEKmLZXwvlrNJkCVxzb7lwB2wXcHwPQFHJldmcVEk2Qb7LLr583B8 w=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
	dkim=none (message not signed) header.i=none;
	spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
	dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; d="scan'208";a="185956876"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
	by mail2-relais-roc.national.inria.fr with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:26 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 06/35] lru_cache: Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:20:52 +0200
Message-Id: <20240930112121.95324-7-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 01 Oct 2024 08:49:58 +0200
Cc: kernel-janitors@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
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

Reorganize kerneldoc parameter names to match the parameter
order in the function header.

Problems identified using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 lib/lru_cache.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/lru_cache.c b/lib/lru_cache.c
index 9e0d469c7658..40f22213c3b3 100644
--- a/lib/lru_cache.c
+++ b/lib/lru_cache.c
@@ -576,8 +576,8 @@ struct lc_element *lc_element_by_index(struct lru_cache *lc, unsigned i)
 
 /**
  * lc_seq_dump_details - Dump a complete LRU cache to seq in textual form.
- * @lc: the lru cache to operate on
  * @seq: the &struct seq_file pointer to seq_printf into
+ * @lc: the lru cache to operate on
  * @utext: user supplied additional "heading" or other info
  * @detail: function pointer the user may provide to dump further details
  * of the object the lc_element is embedded in. May be NULL.

