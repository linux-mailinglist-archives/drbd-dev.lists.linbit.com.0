Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMjpEv2DqGmYvAAAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 04 Mar 2026 20:11:57 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 0187E206F50
	for <lists+drbd-dev@lfdr.de>; Wed, 04 Mar 2026 20:11:56 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D764B16312C;
	Wed,  4 Mar 2026 20:11:45 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 377 seconds by postgrey-1.31 at mail19;
	Wed, 04 Mar 2026 20:10:52 CET
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 81D99163115
	for <drbd-dev@lists.linbit.com>; Wed,  4 Mar 2026 20:10:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772651451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=c4/gvWAc7jMA8PiPw4OjdtXDR+vFdse+XnqHD39G+E8=;
	b=UlKk5ynsHbye7t39sHZRPl2ACjT+ThsnVXEFTvKDeHQ+wlGDI6kOEMfRtMV9fgFwWaTgAO
	e33UN40TID1K7yNoOFZzXkTnpT7I9L5qaRDdNWuZGV2B9nJUzOiwFre9Mo645VwILREc3O
	tds98g4fkUwa7ika3BS3KW29DezegK4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
	(ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
	cipher=TLS_AES_256_GCM_SHA384) id us-mta-2-RnlrEz9nMkejANd1DJV44g-1;
	Wed, 04 Mar 2026 14:04:39 -0500
X-MC-Unique: RnlrEz9nMkejANd1DJV44g-1
X-Mimecast-MFC-AGG-ID: RnlrEz9nMkejANd1DJV44g_1772651077
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
	(mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
	[10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256) (No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with
	ESMTPS id 6C4491956088; Wed,  4 Mar 2026 19:04:37 +0000 (UTC)
Received: from pasta.fast.eng.rdu2.dc.redhat.com (unknown [10.44.32.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with
	ESMTP id D82EB1800576; Wed,  4 Mar 2026 19:04:34 +0000 (UTC)
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 3/4] bio: rename bio_chain arguments
Date: Wed,  4 Mar 2026 20:04:08 +0100
Message-ID: <20260304190424.291743-4-agruenba@redhat.com>
In-Reply-To: <20260304190424.291743-1-agruenba@redhat.com>
References: <20260304190424.291743-1-agruenba@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: B746hkHRCoCyVnMQNv31XWqgSsIHZBfOVTML5SrCLxc_1772651077
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Cc: dm-devel@lists.linux.dev, Andreas Gruenbacher <agruenba@redhat.com>,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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
X-Rspamd-Queue-Id: 0187E206F50
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
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:agruenba@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:hch@lst.de,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.569];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,mail19.linbit.com:rdns,mail19.linbit.com:helo]
X-Rspamd-Action: no action

Use the same argument names in bio_chain() as in bio_chain_and_submit()
to be consistent.  Slightly improve the function description.

Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index eadf4c1e9994..5e60bf3730af 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -369,22 +369,22 @@ static void bio_chain_endio(struct bio *bio)
 
 /**
  * bio_chain - chain bio completions
- * @bio: the target bio
- * @parent: the parent bio of @bio
+ * @prev: the bio to chain
+ * @new: the bio to chain to
  *
- * The caller won't have a bi_end_io called when @bio completes - instead,
- * @parent's bi_end_io won't be called until both @parent and @bio have
- * completed; the chained bio will also be freed when it completes.
+ * The caller won't have a bi_end_io called when @prev completes.  Instead,
+ * @new's bi_end_io will be called once both @new and @prev have completed.
+ * Like an unchained bio, @prev will be put when it completes.
  *
- * The caller must not set bi_private or bi_end_io in @bio.
+ * The caller must not set bi_private or bi_end_io in @prev.
  */
-void bio_chain(struct bio *bio, struct bio *parent)
+void bio_chain(struct bio *prev, struct bio *new)
 {
-	BUG_ON(bio->bi_private || bio->bi_end_io);
+	BUG_ON(prev->bi_private || prev->bi_end_io);
 
-	bio->bi_private = parent;
-	bio->bi_end_io	= bio_chain_endio;
-	bio_inc_remaining(parent);
+	prev->bi_private = new;
+	prev->bi_end_io	= bio_chain_endio;
+	bio_inc_remaining(new);
 }
 EXPORT_SYMBOL(bio_chain);
 
-- 
2.52.0

