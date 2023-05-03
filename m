Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F06EA6F5ADD
	for <lists+drbd-dev@lfdr.de>; Wed,  3 May 2023 17:21:44 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 488D9420FB8;
	Wed,  3 May 2023 17:21:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7C56B420668
	for <drbd-dev@lists.linbit.com>; Wed,  3 May 2023 17:21:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=N7IznD83rIz7GiKHPHolJ9OINb
	pIOboe3IJedmKDZPRHRsf0OogpX6xQ1JpO3d8WLlr4j0gB+LKDLNzeoYwoqdwFFz/7SZQamV0Lb9H
	KzDqZGmZqpFAT8dsP6oVZwd4IjrQmjHp+0wWi4dfuylwKaiB3INVKrRsYDKKYMqfioW6VcBhCM3Dt
	h5j85+dOOMm8eEX37jQR5/5D0dRgPF+HwTHwaZjanlnlzsqKV0RP2zuXy6W05/R6jVnQaQn7VK0zt
	JdFNGHZk3QYvDzM4NWKq5YC9/7UWgXWWSDe4ncNC4kKaNuniE6DcmoDVrPVavf584QC5D4YLQQDPV
	Uowm/l3Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
	Linux)) id 1puEGM-004wGF-2s; Wed, 03 May 2023 15:19:26 +0000
Date: Wed, 3 May 2023 08:19:26 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Message-ID: <ZFJ7fp/0EEcRrJrD@infradead.org>
References: <20230503121937.17232-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503121937.17232-1-christoph.boehmwalder@linbit.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
	Thomas Voegtle <tv@lio96.de>, Philipp Reisner <philipp.reisner@linbit.com>,
	stable@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: correctly submit flush bio on barrier
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
