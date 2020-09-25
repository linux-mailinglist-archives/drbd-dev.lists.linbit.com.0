Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 90117278D99
	for <lists+drbd-dev@lfdr.de>; Fri, 25 Sep 2020 18:06:33 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 70DA6421028;
	Fri, 25 Sep 2020 18:06:32 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3FBAB421025
	for <drbd-dev@lists.linbit.com>; Fri, 25 Sep 2020 18:06:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209;
	h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=9fMaPbhzAtLsK4GqLf9UO/jqtWV45pALgS6VDR5Ex6g=;
	b=Dce1miEU6M5xuTkIphPHY2C711
	054xElroFEhbrHjROV4X2jynnOLXPd0zHs086v8oNlq3wQXKy5Egstt5ur4pIjb2nDyNKaCBuMWtw
	THpLx0YSF2ala+gUPUUifRv7YCYharUg8P4HOJKD1e0MQoT6i60yUFfFxI/26DS0TOWoKTvs2YJIU
	Xi2HTY3yaS4dES1qiZFFuGeVaIhcGyh4ceRJ43jWkA7DJ+SC/N+8dj1eglSyOYIAQiEjA+yb4XufM
	g2KOMwNW+mxe1OXq+cBeIUYpfyZZhjal7PqKCZpnX0mPgs9YMhXTU6AH8ybjhhQCXj9v9cjDBppwE
	lVwVb2Tw==;
Received: from [213.208.157.35] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLqEs-0003Nz-Tw; Fri, 25 Sep 2020 16:06:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Fri, 25 Sep 2020 18:06:16 +0200
Message-Id: <20200925160618.1481450-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org
Subject: [Drbd-dev] remove bdget() as a public API
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

Hi Jens,

this series first cleans up the somewhat odd size handling in
drbd, and then kill off bdget() as a public API.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
