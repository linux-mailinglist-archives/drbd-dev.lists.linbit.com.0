Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG4jJXePqWni/gAAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 05 Mar 2026 15:13:11 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 37206213125
	for <lists+drbd-dev@lfdr.de>; Thu, 05 Mar 2026 15:13:10 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 448081630F1;
	Thu,  5 Mar 2026 15:12:58 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC08F16095C
	for <drbd-dev@lists.linbit.com>; Thu,  5 Mar 2026 15:12:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IO6QMfBHH8sMK+gsIVCR4BlKaz4fOls25p0dmnSxTg0=;
	b=EM5q36QGse8Eo0rdRyuwEK0kug
	POFFSpf0FFYzOJTVE5uLbRO3DCfB160ZZqk4rXNER8kLMqP6pjdqRGQdu3Wv1bUUUnJLpRiAL9/HQ
	jgUBJGbLO5UZ4bZSerntEBKkY/QRv4PNEv07OkOuskyR2pRgnsJjo9LBHTLEqBL/FNGQHc6Nm1cC/
	nNV8/XRfxLaZQunjXq1DcQwxccMR0XQVDaXcaBuvmW4zOUzPW16fx3b9qiKQmFTNVoxv9bekfTegc
	XUwq7ye1qckYMF7lOie+IMOP3XtMbX/ahMAqSi5tuPvP/4OSsf9HoHYYQJxRdS2F7Oobc9Lbh0x05
	uVpsHBRw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
	Hat Linux)) id 1vy9RZ-00000001vWO-2ZpE;
	Thu, 05 Mar 2026 14:12:49 +0000
Date: Thu, 5 Mar 2026 06:12:49 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: [PATCH 1/4] block: consecutive blk_status_t error codes
Message-ID: <aamPYU19Qdh-6R8m@infradead.org>
References: <20260304190424.291743-1-agruenba@redhat.com>
	<20260304190424.291743-2-agruenba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304190424.291743-2-agruenba@redhat.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@lists.linux.dev,
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
X-Rspamd-Queue-Id: 37206213125
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:-];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@infradead.org,drbd-dev-bounces@lists.linbit.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:agruenba@redhat.com,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.389];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,lst.de:email,mail19.linbit.com:rdns,mail19.linbit.com:helo]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 08:04:06PM +0100, Andreas Gruenbacher wrote:
> Since commit 9da3d1e912f3 ("block: Add core atomic write support"),
> there is a gap in the blk_status_t codes and block status code 18 is
> unused.  This causes blk_status_to_errno() and blk_status_to_str() to
> return incorrect values for that code.  Make the blk_status_t codes
> consecutive again to avoid that.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

