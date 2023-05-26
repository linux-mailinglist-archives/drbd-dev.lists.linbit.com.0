Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8A97121EF
	for <lists+drbd-dev@lfdr.de>; Fri, 26 May 2023 10:14:08 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B53194252EB;
	Fri, 26 May 2023 10:14:07 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 530E64252DD
	for <drbd-dev@lists.linbit.com>; Fri, 26 May 2023 10:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=;
	b=LD/oWd/+mUj05u7ro37NQInoFL
	QzOw/tkYA8cVHDX+8VYtqDDKsM8OF05TnEUZx6NkzwaoN6OKUQAZJV8bkH41SMqO8dkQiogL53on9
	oGdLGmmKwtwfXwxOgpUBRjTOSi7VN2TtkHQI5QOFNgLJsKY70Td+PpxZPdYun+JdJPmInaFuVTou+
	cxx2GDaEkVUCw6GgAS+3fCiOb4NrG7orVCeA4t1x7IE24+c2eoYcddQeqDJmjo0iQjOcgFWaQCbqq
	6qSd+rSBRbQ8QJPvXdLtfoQC1oVaNYbInTaTaPEVhKwja5Gzbn10nhYW9T1C1gWHoZn5YHKTC+iiv
	bWNDgIlg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
	Linux)) id 1q2Sa5-001ZC5-2F; Fri, 26 May 2023 08:13:49 +0000
Date: Fri, 26 May 2023 01:13:49 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <ZHBqPbMCsNHVRvkt@infradead.org>
References: <20230526073336.344543-1-mcgrof@kernel.org>
	<20230526073336.344543-4-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230526073336.344543-4-mcgrof@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: djwong@kernel.org, philipp.reisner@linbit.com, linux-mm@kvack.org,
	dm-devel@redhat.com, agk@redhat.com, drbd-dev@lists.linbit.com,
	willy@infradead.org, hch@infradead.org, p.raghav@samsung.com,
	rohan.puri@samsung.com, senozhatsky@chromium.org,
	snitzer@kernel.org, linux-block@vger.kernel.org, hare@suse.de,
	kbusch@kernel.org, axboe@kernel.dk, da.gomez@samsung.com,
	linux-kernel@vger.kernel.org, rpuri.linux@gmail.com,
	linux-xfs@vger.kernel.org, minchan@kernel.org,
	patches@lists.linux.dev, linux-fsdevel@vger.kernel.org,
	lars.ellenberg@linbit.com
Subject: Re: [Drbd-dev] [PATCH v2 3/5] iomap: simplify iomap_init() with
	PAGE_SECTORS
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
