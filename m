Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKoNFFW/jmmzEQEAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Feb 2026 07:06:13 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 78E321332AA
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Feb 2026 07:06:12 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AA97C1630CC;
	Fri, 13 Feb 2026 07:05:59 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C84C216094D
	for <drbd-dev@lists.linbit.com>; Fri, 13 Feb 2026 07:05:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PZUSXqE0G9A6YIVtMGcb/ILxAy5ED9bTFTJF56eUpSA=;
	b=jK6FbZ40StO4DgcPKg6ynS9q3d
	gxfdkgbRWWgKKKlxzlqfhngzUJkYgfuG6ojrcIlwYr9AgnaOOmSbay+WaOnMciYC8ZqeVOoHRIC9z
	L5LbQH7VlR1wnBoL+wCYSI+NrcSRYdGNGnWMG1JMu9Ydgqez8nittbDXwWdgb6c0hObDbWdI0YdYI
	N0BuCV3Sma3qP7RNbu4z80chU/IG1ItwLjFSEQN+kvBN25mfBBRsakr2mwN0JTOt+TdPDgKyq+4IO
	W0pt4iaDXKXBvT/e2GPgqpwKPNEJdPU7zCc33paWIeojVaeukIRy+rMT+gBxS2U60gA88VLAHhmAN
	RnjZvLGQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
	Hat Linux)) id 1vqmJO-000000033Fm-2AIN;
	Fri, 13 Feb 2026 06:05:54 +0000
Date: Thu, 12 Feb 2026 22:05:54 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH] drbd: always set BLK_FEAT_STABLE_WRITES
Message-ID: <aY6_Qg3gPKBPdttw@infradead.org>
References: <20260205173928.3166880-2-christoph.boehmwalder@linbit.com>
	<aYWNhtixUGuj3hat@infradead.org>
	<eaa83421-a07a-4ee7-81ad-f32d4a237ff8@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eaa83421-a07a-4ee7-81ad-f32d4a237ff8@linbit.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Philipp Reisner <philipp.reisner@linbit.com>, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	R_DKIM_REJECT(1.00)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[infradead.org : SPF not aligned (relaxed),none];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:linux-block@vger.kernel.org,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:hch@infradead.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@infradead.org,drbd-dev-bounces@lists.linbit.com];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[infradead.org:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	TAGGED_RCPT(0.00)[drbd-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid]
X-Rspamd-Queue-Id: 78E321332AA
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 04:01:43PM +0100, Christoph Böhmwalder wrote:
> The current block layer logic actually seems correct to me. The
> underlying device may or may not require stable writes, but regardless
> of that, DRBD itself definitely does need it. In blk_stack_limits, DRBD
> is the top device, and DRBD's backing disk is the bottom device. If the
> backing disk happens to require stable writes, this would indeed be
> correctly inherited.
> 
> So the only missing logic is that DRBD still wants to enable stable
> writes for itself even if the backing disk does *not* request it.
> So it seems to me that this patch is the correct fix for DRBD's special
> case.
> 
> Is it not supposed to work like that?

No, I guess I just misunderstood your report.

