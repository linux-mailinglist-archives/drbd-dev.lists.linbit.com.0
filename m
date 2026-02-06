Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHM7N9OVhWk7DwQAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Fri, 06 Feb 2026 08:18:43 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 83F48FAE64
	for <lists+drbd-dev@lfdr.de>; Fri, 06 Feb 2026 08:18:43 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 22762162ED6;
	Fri,  6 Feb 2026 08:18:31 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 2106 seconds by postgrey-1.31 at mail19;
	Fri, 06 Feb 2026 08:18:26 CET
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4F8191608F3
	for <drbd-dev@lists.linbit.com>; Fri,  6 Feb 2026 08:18:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZXrRBnmDZKOWe4vfrMf+XXsjZ5+XXZ/4HO8NGf3/PuQ=;
	b=SEBPOHA6XebvRYRnQLAZyfY3O0
	zPgcE8UITkCIrubNX3UJsMfaL1pPelcPlLCKLo73ZVN96QqfN32iy1MC5ZYXF958Yj9Q2old4HIEi
	1TV4YE/P9Tj1n/qGlBghMeCbH7JWGBsgv2IPuo0QtPJI0cWFDHprPwz0f8c9vMMg8jSdST8HM6Qij
	odQZ2OXIY6KN3lFGy/VVAIZX7e1mPRDKx58DaMQdO70CEs+ex3K4cv3608i5BBvMVFLwftdYFXtOV
	UTRR2I9un++/dXClFjqA+/EZ1/+lFRp4PynD9G0emzYtnTJUr9AZ8AQPaoA16Pgl7IvLsTBazwBg6
	LjifVnwg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
	Hat Linux)) id 1voFYk-0000000AxLL-49gg;
	Fri, 06 Feb 2026 06:43:19 +0000
Date: Thu, 5 Feb 2026 22:43:18 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Subject: Re: [PATCH] drbd: always set BLK_FEAT_STABLE_WRITES
Message-ID: <aYWNhtixUGuj3hat@infradead.org>
References: <20260205173928.3166880-2-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205173928.3166880-2-christoph.boehmwalder@linbit.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
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
	FORGED_RECIPIENTS(0.00)[m:christoph.boehmwalder@linbit.com,m:axboe@kernel.dk,m:philipp.reisner@linbit.com,m:linux-kernel@vger.kernel.org,m:linux-block@vger.kernel.org,m:lars.ellenberg@linbit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@infradead.org,drbd-dev-bounces@lists.linbit.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:mid]
X-Rspamd-Queue-Id: 83F48FAE64
X-Rspamd-Action: no action

On Thu, Feb 05, 2026 at 06:39:29PM +0100, Christoph Böhmwalder wrote:
> DRBD requires stable pages because it may read the same bio data
> multiple times for local disk I/O and network transmission, and in
> some cases for calculating checksums.
> 
> The BLK_FEAT_STABLE_WRITES flag is set when the device is first
> created, but blk_set_stacking_limits() clears it whenever a
> backing device is attached. In some cases the flag may be
> inherited from the backing device, but we want it to be enabled
> at all times.

This looks like a bug.  If an underlying device requires
BLK_FEAT_STABLE_WRITES, the upper device needs to inherit it.

> Note: this commit is based on the for-6.19/block tree in case it is
> still possible to take it into the 6.19 release as this *could* lead
> to silent data corruption. However, due to other protection
> mechanisms in DRBD, this is relatively unlikely to happen in the
> real world and we have not seen any corresponding reports from users.
> So if this only lands in 6.20/7.0, it is also fine.

I'm fine with this as a hot fix for 6.19 and -stable:

Reviewed-by: Christoph Hellwig <hch@lst.de>

But can you please also do the proper block layer fix and then
revert the drbd one?

