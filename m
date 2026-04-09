Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBLlEABK12neMAgAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Thu, 09 Apr 2026 08:41:04 +0200
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id D7FE43C6A6B
	for <lists+drbd-dev@lfdr.de>; Thu, 09 Apr 2026 08:41:03 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1EAAE1626A7;
	Thu,  9 Apr 2026 08:40:49 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 89442160870
	for <drbd-dev@lists.linbit.com>; Thu,  9 Apr 2026 08:40:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9XvyWJUSOM5eV4ieBRtSFsN4pGEcp8pm1zhh04ZFATw=;
	b=uS2D+CKIPopKb6rIgjfm4tVtzG
	QeMBW3Fp8fk+PVjZ5wR1CuFkHSircRVfSkqC98oiDwIaZW3JhGLVKg1kcKRSLMAjfTdG+ZjrdlIUc
	smn4R7HTNUMFwqr/BPUEox0cK67EgrHn2U/TDvGZBCvUyLGDanQvcmQOOM9xoWWIuIPkEdLCDlIOj
	dEWXH2wnIuwKyP6JTg0e8vpF9DH5RSfho/Grs0TzVxsJyBRlEFy2ZS5A9f66ljyWYM4tkiEqC/903
	TouMg4cJSvkCNXCaWTEVS2z1JlFPxocmA390s5zpckRdujmzl3wnDUqKWlyqnxTxwZG1xnK2OY/zg
	f9N1BvOA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
	Hat Linux)) id 1wAj4E-00000009mpj-1sUz;
	Thu, 09 Apr 2026 06:40:42 +0000
Date: Wed, 8 Apr 2026 23:40:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 00/20] DRBD 9 rework
Message-ID: <addJ6uTc8Zo4GKpW@infradead.org>
References: <20260327223820.2244227-1-christoph.boehmwalder@linbit.com>
	<ecf00b4b-c3f8-4161-a97d-3d23b423cabf@kernel.dk>
	<adXk_m3SbRcWTOIC@infradead.org>
	<c92d5318-8c8e-434f-835e-61cf1fae4edf@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c92d5318-8c8e-434f-835e-61cf1fae4edf@kernel.dk>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
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
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+mx];
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
	FORGED_RECIPIENTS(0.00)[m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:hch@infradead.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.804];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid,mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: D7FE43C6A6B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

First an apology, I thought it was in your tree, but it looks like
the drbd branch just has minor fixes.  So a lot less urgency.

On Wed, Apr 08, 2026 at 06:58:58AM -0600, Jens Axboe wrote:
> See the previous discussion,

Do you have a pointer to that discussion?  I can't remember one.

> the goal is to sync the two drbd code
> bases. It's followed the "usual" pattern of the in-kernel driver being
> neglected and development and users pushed to the out-of-tree one,
> which is highly annoying.

I don't think that's a a usual pattern.  Also the new version looks
like a complete rewrite and not something incremental:

 45 files changed, 45891 insertions(+), 16264 deletions(-)

For a code base that is "29482 total".

I think reviewing it would be easier by just adding an new drbd9 driver
and then steering people toward it carefully, as that is actually
reviewable compared to non-bisectable patches changing large chunks
of code in a non-atomic way.

