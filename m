Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ED39A4ED368
	for <lists+drbd-dev@lfdr.de>; Thu, 31 Mar 2022 07:46:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CD0D24205A5;
	Thu, 31 Mar 2022 07:46:22 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 33FED4205A5
	for <drbd-dev@lists.linbit.com>; Thu, 31 Mar 2022 07:46:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VHxYyj8oI/x8CDOncWd8lVjMuGnCh4YGy0kjeNixfRo=;
	b=v+3GYGhhNOuOBkOlGBzEhkX85/
	JghKIhs9yfAn9EO74KcBy/YmZj7kU/erfqEDIuzitsVFumO/jucPXduLZnSJObuJa3z8ZmrSs1I0w
	70vgVwhlecmKbteJjUd1jjwOmcOk4e9AhhV90+W2ySM1rFNlqXOUaNC22L7EI79kZeCqrYpDPmGJx
	PeIeUCD+fqHRXFKBqeoBCWTYOZbVjEIYyF5PUULPMOiIb+qMZ32CGjf4LlwH6BT6sVYrxVXn6wdii
	Amx5vFrfAS00iLp3Q7kUZIM3x5700qrXsCiAXH66sqp3De9o/4CySRdGymA+kx4iIlHRK4WhbDB/S
	4yDBWt8g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1nZndS-000jyC-Ph; Thu, 31 Mar 2022 05:46:18 +0000
Date: Wed, 30 Mar 2022 22:46:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Message-ID: <YkVAKjFVgFxkUuIy@infradead.org>
References: <20220330185551.3553196-1-christoph.boehmwalder@linbit.com>
	<YkVACyO7rReUAjqj@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YkVACyO7rReUAjqj@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Philipp Reisner <philipp.reisner@linbit.com>, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Jens Axboe <abxoe@kernel.dk>, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [RESEND PATCH] drbd: fix potential silent data
	corruption
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

On Wed, Mar 30, 2022 at 10:45:47PM -0700, Christoph Hellwig wrote:
> The change looks good, but this really should grow a proper Fixes tag.
> 

And for the resend fix the spelling of Jens' email address.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
