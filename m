Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB572830A6
	for <lists+drbd-dev@lfdr.de>; Mon,  5 Oct 2020 09:13:07 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AE8EB4208A9;
	Mon,  5 Oct 2020 09:13:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 6C6A14208A2
	for <drbd-dev@lists.linbit.com>; Mon,  5 Oct 2020 09:13:05 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id D829867373; Mon,  5 Oct 2020 09:13:03 +0200 (CEST)
Date: Mon, 5 Oct 2020 09:13:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20201005071303.GA12639@lst.de>
References: <20200925160618.1481450-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200925160618.1481450-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-block@vger.kernel.org, Lars Ellenberg <lars.ellenberg@linbit.com>,
	drbd-dev@lists.linbit.com, Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [Drbd-dev] remove bdget() as a public API
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

ping?

On Fri, Sep 25, 2020 at 06:06:16PM +0200, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series first cleans up the somewhat odd size handling in
> drbd, and then kill off bdget() as a public API.
---end quoted text---
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
