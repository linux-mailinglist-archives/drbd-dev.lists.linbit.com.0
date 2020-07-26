Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED722E078
	for <lists+drbd-dev@lfdr.de>; Sun, 26 Jul 2020 17:13:12 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C9B01420546;
	Sun, 26 Jul 2020 17:13:11 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 78EDA420480
	for <drbd-dev@lists.linbit.com>; Sun, 26 Jul 2020 17:13:10 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id B6A7A68B05; Sun, 26 Jul 2020 17:12:38 +0200 (CEST)
Date: Sun, 26 Jul 2020 17:12:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200726151238.GA23460@lst.de>
References: <20200726150333.305527-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726150333.305527-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Minchan Kim <minchan@kernel.org>, Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	cgroups@vger.kernel.org, linux-mm@kvack.org, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] bdi cleanups v3
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

On Sun, Jul 26, 2020 at 05:03:19PM +0200, Christoph Hellwig wrote:
> Hi Jens,
> 
> this series contains a bunch of different BDI cleanups.  The biggest item
> is to isolate block drivers from the BDI in preparation of changing the
> lifetime of the block device BDI in a follow up series.

Ooops, sorry for reposting this - it is exactly the same v3 I already
posted.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
