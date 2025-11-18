Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D4055C67D5E
	for <lists+drbd-dev@lfdr.de>; Tue, 18 Nov 2025 08:08:46 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7169A162789;
	Tue, 18 Nov 2025 08:08:33 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 3566 seconds by postgrey-1.31 at mail19;
	Tue, 18 Nov 2025 08:08:30 CET
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8C7AE1608F4
	for <drbd-dev@lists.linbit.com>; Tue, 18 Nov 2025 08:08:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UOVltvm8AEcc6pbXpl9Km0eDgkPooIIKrT0WA4zquc0=;
	b=tpIvhqFYTmwBmhBMeAtKifC3BW
	afWLzBuM8IMWkqEsNb0IzuvCgyExOFzN60rt3PV90iLZYJekwFTEFua5jq6tweNq7urMoOMegOxeX
	WS+U8yUxIdwUTGKqTwIzboAmwPvovDuzhx8ycnqRUOmnKqRMXlrpI01TcsWqjjmisIiCZk1ihJxyV
	hrvfK9gvaun7AewDQT7ceYVU5861HV7J/K09Fw0/Li+evS9YJRa1LcgUrAKNwlYn+L7ac9L0aNGXI
	lDuu/Ej0E20aKShS9IFbl6Ia6DeB98ZWM1i6TanrHhCkEUKCp6QXNHU9qNnKTEBGsH0fWiUW1Trtf
	U030YVwQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
	Hat Linux)) id 1vLEti-0000000HTFr-0qii;
	Tue, 18 Nov 2025 06:09:02 +0000
Date: Mon, 17 Nov 2025 22:09:02 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Sukrut Heroorkar <hsukrut3@gmail.com>
Subject: Re: [PATCH] drbd: add missing kernel-doc for peer_device parameter
Message-ID: <aRwNfiIWUVl5G0eX@infradead.org>
References: <20251117172557.355797-1-hsukrut3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117172557.355797-1-hsukrut3@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, david.hunter.linux@gmail.com,
	Philipp Reisner <philipp.reisner@linbit.com>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, shuah@kernel.org,
	"open list:DRBD DRIVER" <drbd-dev@lists.linbit.com>
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

On Mon, Nov 17, 2025 at 10:55:56PM +0530, Sukrut Heroorkar wrote:
> W=1 build warns that peer_device is undocumented in the bitmap I/O
> handlers. This parameter was introduced in commit 8164dd6c8ae1
> ("drbd: Add peer device parameter to whole-bitmap I/O handlers"), but
> the kernel-doc was not updated.
> 
> Add the missing @peer_device entry.

Or just make it a non-kerneldoc comment as it doesn't document an
external API to start with.

