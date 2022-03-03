Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE514CBC94
	for <lists+drbd-dev@lfdr.de>; Thu,  3 Mar 2022 12:32:36 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D210D421787;
	Thu,  3 Mar 2022 12:32:34 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 208DF4201B9
	for <drbd-dev@lists.linbit.com>; Thu,  3 Mar 2022 12:32:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=bJa9qgtYYfiIC+/F69WRpdhiIshV0iFeP9NQD2r57nU=;
	b=pJ9yeyYaX6spyaSzNdz4ZWz/+3
	4vvJ1ua3dKNn0a/+vA8kygqoFt4BP7vNGJl5ZhGy7RGnTuVV1EYGDFzSs3k7jnOzixxeHnRvToRgz
	uSx5cTsaz+uvUl73IBetWqRvMbYEqHU/eKTaVjVL7VsC1UFLU97UlraqBCZzLfWCwxdxXHBu1xicV
	DgYVmcuPbL3D7OIwQlzRn+wvHPymiw72yyPwi4XapikvmeHj43cFEs/PyK6nGzdiUM2G2OtsvjrBT
	rPzWBCrPTqAEUJxW+upFLV4V+3G0pV1YPlDe1onNub1l9cgl/1MeOt9mOMgnVk/hA4PiHIyRT3pCG
	a3VvQQvw==;
Received: from [91.93.38.115] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPjh6-006Dd0-7h; Thu, 03 Mar 2022 11:32:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Mar 2022 14:32:18 +0300
Message-Id: <20220303113223.326220-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-block@vger.kernel.org, linux-security-module@vger.kernel.org,
	drbd-dev@lists.linbit.com, Philipp Reisner <philipp.reisner@linbit.com>,
	Kees Cook <keescook@chromium.org>
Subject: [Drbd-dev] a few trivial bdevname() removals
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

this series contains a few trivial conversion from bdevname to the %pg
format specifier.

Diffstat:
 block/bdev.c                  |    8 +++-----
 block/blk-lib.c               |    6 ++----
 drivers/block/drbd/drbd_req.c |    6 ++----
 drivers/block/pktcdvd.c       |   10 +++-------
 security/loadpin/loadpin.c    |    5 +----
 5 files changed, 11 insertions(+), 24 deletions(-)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
