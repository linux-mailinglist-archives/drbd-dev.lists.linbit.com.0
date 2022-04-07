Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED064F75CC
	for <lists+drbd-dev@lfdr.de>; Thu,  7 Apr 2022 08:15:22 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5950242101D;
	Thu,  7 Apr 2022 08:15:21 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 404CD421014
	for <drbd-dev@lists.linbit.com>; Thu,  7 Apr 2022 08:15:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zelM0W3roF2hyF5IfymbR30q0/P/DpF9Q12I1M+1k/o=;
	b=DU87k1kT9d2X5nqsU2v/XFoOZu
	0fa4hJhHKNsQsEEWrgdP3Mdlwfllx/h+7zKSoH6OXOlpe7QGrlBHyVqZeZEeL/ngq157/GVDWQ+oz
	CM+KmdmZROokCN0nGPRGepcyo+cxjrV7XlsdXYXPDvjMDvJpJO+ibRl3C4VaLpXP2kRL9/i92HhIF
	F2GH5TOlLD5HN0KKQYhGOln/vVjeZAjY7ncDvnuukO5Rqoo+aQ8VBEOhZwGBqezHM7dCweRtxVZWC
	7twZ8DZRyRtZPjyqpZImvVr4mYnv2QSv12KyKBHjv4sWmle0BbZS/gtVnWuoLP4p/tz0Wu+dURiyl
	DMLrq1+A==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1ncLQJ-009dnj-SU; Thu, 07 Apr 2022 06:15:15 +0000
Date: Wed, 6 Apr 2022 23:15:15 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Message-ID: <Yk6Bc7lvjCsmlkoq@infradead.org>
References: <20220406190445.1937206-1-christoph.boehmwalder@linbit.com>
	<20220406190445.1937206-4-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220406190445.1937206-4-christoph.boehmwalder@linbit.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph@boehmwalder.at>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 3/3] drbd: set QUEUE_FLAG_STABLE_WRITES
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Wed, Apr 06, 2022 at 09:04:45PM +0200, Christoph B=F6hmwalder wrote:
> From: Christoph B=F6hmwalder <christoph@boehmwalder.at>
> =

> We want our pages not to change while they are being written.

Please document the _why_.  A commit like that will leave everyone
looking at this code in the future rather puzzled.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
