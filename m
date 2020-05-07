Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9411F824E
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 11:57:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5995A4203EB;
	Sat, 13 Jun 2020 11:57:47 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7C3FE4203EB
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:56:25 +0200 (CEST)
Received: by mail-wm1-f66.google.com with SMTP id y20so10152508wmi.2
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:mime-version:content-disposition:user-agent;
	bh=HNjjKr721zyioVh3ETpuE4osF+zX8h3Tt4HKqOtkPFI=;
	b=nJLeSLqtB+39G7oyY7uAW3HRBSugfOvb98MYEVhKWKBvbtfUJExl5bIIiGmou40Uv/
	V60Us42XweApi3KIRj3bxGCMoIPEOuQmIoNqHWiZKt5MJWiL8+nEOIrq/QbtGYmIRknP
	TQh+k6lJJjzKyR0TsZBZ/lAa3xUMZjcF4iUrO2+xqryT1wVVNyVaTnT3C6uMyEQGutSH
	Q0vxsrcuQVlc+//N+7f8JUSnoaQLxDX2hJEyOwg1ksPrNpDzl7FZk3d8G8pbtmae9Ye9
	iNs7wFt0mkqu3nBq+7ZFdqiIjtjVxFz3L8/cQr2erm+Tty5FDpdbIwJJ3u0PhwYO5wmb
	emvw==
X-Gm-Message-State: AOAM532Esk9Tagz4uBs2P5gNehUCL26hagEKrP3MCTugKrGtVkjDRz4H
	OBsTzs5pHh8Q9FdKT/IiSHFHVIKulS0AIQ==
X-Google-Smtp-Source: ABdhPJzP1uX09xbhFZu45/SXkRHhhFNgrjKii4NeES3g+2vnNZ9iaoptrGLOzLG4TvDGk6Os/t2Ehw==
X-Received: by 2002:a1c:2b86:: with SMTP id r128mr3418376wmr.13.1592042184792; 
	Sat, 13 Jun 2020 02:56:24 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	67sm14725945wrk.49.2020.06.13.02.56.24
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:56:24 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:56:22 +0200
Resent-Message-ID: <20200613095622.GF4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 346 seconds by postgrey-1.31 at mail19;
	Thu, 07 May 2020 20:53:33 CEST
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C8A294203E8
	for <drbd-dev@lists.linbit.com>; Thu,  7 May 2020 20:53:33 +0200 (CEST)
Received: from embeddedor (unknown [189.207.59.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 908C124954;
	Thu,  7 May 2020 18:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588877266;
	bh=L19SLkkQXKcOuzW3RL8LtzKlqMiQPoyoesq3zLXKhnA=;
	h=Date:From:To:Cc:Subject:From;
	b=Z65uFmK9tBSaSMi50NVL8iZ9JUxFnlgm4iHolyTl8/eZ9jcErJOhoUHk31un83xOW
	7K9w4V79TCedl3epr+ZSOZqyenRt7cNlIiDY4i2KjckpxL7tKYNAcWYSJBQfulHb5j
	rs0z8eA/uaI7I0yqfUppDH/u4ElRzXnctijFPdmU=
Date: Thu, 7 May 2020 13:52:12 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20200507185212.GA14165@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH] drbd: Replace zero-length array with
	flexible-array
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

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

sizeof(flexible-array-member) triggers a warning because flexible array
members have incomplete type[1]. There are some instances of code in
which the sizeof operator is being incorrectly/erroneously applied to
zero-length arrays and the result is zero. Such instances may be hiding
some bugs. So, this work (flexible-array member conversions) will also
help to get completely rid of those sorts of issues.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/block/drbd/drbd_int.h      |    2 +-
 drivers/block/drbd/drbd_protocol.h |    8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/block/drbd/drbd_int.h b/drivers/block/drbd/drbd_int.h
index aae99a2d7bd4..a3314dd781a7 100644
--- a/drivers/block/drbd/drbd_int.h
+++ b/drivers/block/drbd/drbd_int.h
@@ -620,7 +620,7 @@ struct fifo_buffer {
 	unsigned int head_index;
 	unsigned int size;
 	int total; /* sum of all values */
-	int values[0];
+	int values[];
 };
 extern struct fifo_buffer *fifo_alloc(unsigned int fifo_size);
 
diff --git a/drivers/block/drbd/drbd_protocol.h b/drivers/block/drbd/drbd_protocol.h
index e6fc5ad72501..dea59c92ecc1 100644
--- a/drivers/block/drbd/drbd_protocol.h
+++ b/drivers/block/drbd/drbd_protocol.h
@@ -271,7 +271,7 @@ struct p_rs_param {
 	u32 resync_rate;
 
 	      /* Since protocol version 88 and higher. */
-	char verify_alg[0];
+	char verify_alg[];
 } __packed;
 
 struct p_rs_param_89 {
@@ -305,7 +305,7 @@ struct p_protocol {
 	u32 two_primaries;
 
 	/* Since protocol version 87 and higher. */
-	char integrity_alg[0];
+	char integrity_alg[];
 
 } __packed;
 
@@ -360,7 +360,7 @@ struct p_sizes {
 	u16	    dds_flags; /* use enum dds_flags here. */
 
 	/* optional queue_limits if (agreed_features & DRBD_FF_WSAME) */
-	struct o_qlim qlim[0];
+	struct o_qlim qlim[];
 } __packed;
 
 struct p_state {
@@ -409,7 +409,7 @@ struct p_compressed_bm {
 	 */
 	u8 encoding;
 
-	u8 code[0];
+	u8 code[];
 } __packed;
 
 struct p_delay_probe93 {

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
