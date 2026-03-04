Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLHiMDiEqGmgvQAAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 04 Mar 2026 20:12:56 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 79A07206F83
	for <lists+drbd-dev@lfdr.de>; Wed, 04 Mar 2026 20:12:56 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2D67B16313E;
	Wed,  4 Mar 2026 20:12:47 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 36143163117
	for <drbd-dev@lists.linbit.com>; Wed,  4 Mar 2026 20:11:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772651461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=BaLtYgei9IWIO1DSr3vx23YgMlhkxC2wxvdO5uumCI4=;
	b=aDxwZjkW3pBcdpWQRanhp7KdYYEk9h9ZC3rW5g94bgzMkdLxBJDnSaiTAOUG7WhS2BMv9e
	Z5RrIgchUWA/u6Kxeil6dWMryHUmDFmNJFArLQ9gLHqtno5SOc1EV1ch5Q5cVX48z6iA78
	sMRVeGsCH5NFsMfiObeD7khZCl8cMno=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
	(ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
	cipher=TLS_AES_256_GCM_SHA384) id us-mta-605-RvUA3WaMPNqHxqOGAKktYw-1;
	Wed, 04 Mar 2026 14:04:32 -0500
X-MC-Unique: RvUA3WaMPNqHxqOGAKktYw-1
X-Mimecast-MFC-AGG-ID: RvUA3WaMPNqHxqOGAKktYw_1772651071
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
	(mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
	[10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with
	ESMTPS id 7551C1800464; Wed,  4 Mar 2026 19:04:31 +0000 (UTC)
Received: from pasta.fast.eng.rdu2.dc.redhat.com (unknown [10.44.32.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with
	ESMTP id 0E76418002A6; Wed,  4 Mar 2026 19:04:28 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 1/4] block: consecutive blk_status_t error codes
Date: Wed,  4 Mar 2026 20:04:06 +0100
Message-ID: <20260304190424.291743-2-agruenba@redhat.com>
In-Reply-To: <20260304190424.291743-1-agruenba@redhat.com>
References: <20260304190424.291743-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: Mo_YroPHHs9-fRGGCWJrX_sR-oRZ4IHi7hjp0cpIirg_1772651071
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
X-Rspamd-Queue-Id: 79A07206F83
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
	NEURAL_HAM(-0.00)[-0.605];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:rdns,mail19.linbit.com:helo]
X-Rspamd-Action: no action

Since commit 9da3d1e912f3 ("block: Add core atomic write support"),
there is a gap in the blk_status_t codes and block status code 18 is
unused.  This causes blk_status_to_errno() and blk_status_to_str() to
return incorrect values for that code.  Make the blk_status_t codes
consecutive again to avoid that.

Fixes: 9da3d1e912f3 ("block: Add core atomic write support")
Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
---
 include/linux/blk_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 8808ee76e73c..89a722d76c28 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -168,7 +168,7 @@ typedef u16 blk_short_t;
 /*
  * Invalid size or alignment.
  */
-#define BLK_STS_INVAL	((__force blk_status_t)19)
+#define BLK_STS_INVAL	((__force blk_status_t)18)
 
 /**
  * blk_path_error - returns true if error may be path related
-- 
2.52.0

