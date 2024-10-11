Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [94.177.8.207])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B47B999EF7
	for <lists+drbd-dev@lfdr.de>; Fri, 11 Oct 2024 10:24:47 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4A04942039E;
	Fri, 11 Oct 2024 10:24:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 332B8420304
	for <drbd-dev@lists.linbit.com>; Fri, 11 Oct 2024 10:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=0WqWBsb4wOY3z+1H9hPz45EJnT
	eLm8H6aaZDu+7tKj9LYnB+4QEhXunePug4pojsejT0erWU2o9PXYHn8jQ5cvDhvoyXQKqAj1RH9Xy
	BIE5O/yBdbCeisqhsnWdE373XVGFiu7OX5s0trwBwUuJXXe3cwQGlsMNv+ew3gidh6b30GbK8/Mst
	UrRB+uqoj+E6jDZ/5cWAsjc+/JSlvM3grFQ50iaNkZRTf06hu1KIrxP4FQGeUJrTTy8j9KLdwarDF
	wK93n+nX5v9JXwsKpCMPjNcOsYQRM8B6pFl3zp/Ik2Paib8zQC0bor+OJUBepVVbhcwjF5uP43jWg
	OEZzhMhg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
	Linux)) id 1szAws-0000000FgK5-39n5; Fri, 11 Oct 2024 08:24:34 +0000
Date: Fri, 11 Oct 2024 01:24:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: linux@treblig.org
Subject: Re: [PATCH] drbd: Remove unused conn_lowest_minor
Message-ID: <ZwjgwtjPT7IV3XAs@infradead.org>
References: <20241010204426.277535-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010204426.277535-1-linux@treblig.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: axboe@kernel.dk, philipp.reisner@linbit.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, lars.ellenberg@linbit.com,
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

