Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIUdBhmEqGmgvQAAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 04 Mar 2026 20:12:25 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 8C939206F74
	for <lists+drbd-dev@lfdr.de>; Wed, 04 Mar 2026 20:12:24 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2BC09163136;
	Wed,  4 Mar 2026 20:12:15 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DA38C163116
	for <drbd-dev@lists.linbit.com>; Wed,  4 Mar 2026 20:11:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772651461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=nM7kNBSEq9uce0DB9nBNjzTI/YSlQuc5UuGQ7K2UugI=;
	b=iHgJwzNOvwJGU5XXw5/QBZqrO5gEERGSteW0DBE/iwUL7ZsHqTtC0pJX+54S2k3cEiSed8
	N7oEc7pmzzKwDZF7/z1g9LHXvP/iefhllf3sFV2hvnP3rbbqjZXQKqkS6ZBmVM5tRhxvn1
	etfLGayB4Y+LT32dfjCqR2GNBnspVe8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
	(ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
	cipher=TLS_AES_256_GCM_SHA384) id us-mta-317-ng3K5dKrOE6uUqSz4RUfzQ-1;
	Wed, 04 Mar 2026 14:04:35 -0500
X-MC-Unique: ng3K5dKrOE6uUqSz4RUfzQ-1
X-Mimecast-MFC-AGG-ID: ng3K5dKrOE6uUqSz4RUfzQ_1772651074
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
	(mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
	[10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with
	ESMTPS id 6B99019560A3; Wed,  4 Mar 2026 19:04:34 +0000 (UTC)
Received: from pasta.fast.eng.rdu2.dc.redhat.com (unknown [10.44.32.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with
	ESMTP id E2E941800576; Wed,  4 Mar 2026 19:04:31 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 2/4] block: get rid of blk_status_to_{errno, str} inconsistency
Date: Wed,  4 Mar 2026 20:04:07 +0100
Message-ID: <20260304190424.291743-3-agruenba@redhat.com>
In-Reply-To: <20260304190424.291743-1-agruenba@redhat.com>
References: <20260304190424.291743-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: ToJ8LIcTqzDKiVVR5KsxvKRz7K-2jrQyMdQREaP-sB8_1772651074
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Cc: dm-devel@lists.linux.dev, Andreas Gruenbacher <agruenba@redhat.com>,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
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
X-Rspamd-Queue-Id: 8C939206F74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	FORGED_SENDER(0.00)[agruenba@redhat.com,drbd-dev-bounces@lists.linbit.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:agruenba@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[agruenba@redhat.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.612];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:rdns,mail19.linbit.com:helo]
X-Rspamd-Action: no action

Change blk_status_to_str() to be consistent with blk_status_to_errno()
and return "I/O" for undefined status codes.

With that, the fallback case in the blk_errors array can be removed with
no change in behavior.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 block/blk-core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 474700ffaa1c..a20042f15790 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -161,9 +161,6 @@ static const struct {
 	[BLK_STS_DURATION_LIMIT]	= { -ETIME, "duration limit exceeded" },
 
 	[BLK_STS_INVAL]		= { -EINVAL,	"invalid" },
-
-	/* everything else not covered above: */
-	[BLK_STS_IOERR]		= { -EIO,	"I/O" },
 };
 
 blk_status_t errno_to_blk_status(int errno)
@@ -194,7 +191,7 @@ const char *blk_status_to_str(blk_status_t status)
 	int idx = (__force int)status;
 
 	if (WARN_ON_ONCE(idx >= ARRAY_SIZE(blk_errors)))
-		return "<null>";
+		return "I/O";
 	return blk_errors[idx].name;
 }
 EXPORT_SYMBOL_GPL(blk_status_to_str);
-- 
2.52.0

