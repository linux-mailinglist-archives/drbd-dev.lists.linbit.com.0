Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F01976ACC
	for <lists+drbd-dev@lfdr.de>; Thu, 12 Sep 2024 15:38:20 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 017A9420902;
	Thu, 12 Sep 2024 15:38:17 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1105 seconds by postgrey-1.31 at mail19;
	Thu, 12 Sep 2024 15:38:13 CEST
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 01A6B420471
	for <drbd-dev@lists.linbit.com>; Thu, 12 Sep 2024 15:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/26s98bTNvSj5M/BlPsuAYPYyynLUzG06LntovkizxM=;
	b=Ek6r3+GXY7P2xOtPBNBq3e+iIU
	abeXNP6vl/BlvYviQt4qrNql39HE1ptkWwZAM50pepyU0RWZZzJ0te9q+sn6CEvsBtRPhG9dmaUAG
	lOyN1DThCTEn1IUaKV1Go1957CAMWdo2iJePECdFesc1TlxSGx/ZkhTQ472B24LtZWKwbF9LzTR+W
	U3bCxjB7syPLuuHjs7hWyq7Q4a197OjZkR7I3ia8v1+4JF5P17M3ta/iDSV+YDCNT8d97KHBrnuPG
	FiJ+HofHqnEvQRJq9TUMdOkkVYZexIb4J0ZO7D+9OqVB0SV10OlUiD+KVatasQ37yVUOm+RqgInEG
	k53qh4jQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
	Hat Linux)) id 1sojje-0000000DBQH-3YY9;
	Thu, 12 Sep 2024 13:19:46 +0000
Date: Thu, 12 Sep 2024 06:19:46 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Subject: Re: [PATCH] brbd: Fix atomicity violation in drbd_uuid_set_bm()
Message-ID: <ZuLqcjFuPtmq_7Nj@infradead.org>
References: <20240911091619.4430-1-chenqiuji666@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911091619.4430-1-chenqiuji666@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, philipp.reisner@linbit.com, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	baijiaju1990@gmail.com, lars.ellenberg@linbit.com,
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

I can't really comment on the code here, but the subject needs a

s/brbd/drbd/

