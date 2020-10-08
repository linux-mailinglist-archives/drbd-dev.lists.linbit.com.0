Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3A2287D27
	for <lists+drbd-dev@lfdr.de>; Thu,  8 Oct 2020 22:31:03 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 65BDC42101C;
	Thu,  8 Oct 2020 22:31:02 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 10E14420FF0
	for <drbd-dev@lists.linbit.com>; Thu,  8 Oct 2020 22:31:00 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id CC4F868B02; Thu,  8 Oct 2020 22:30:58 +0200 (CEST)
Date: Thu, 8 Oct 2020 22:30:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20201008203058.GA27821@lst.de>
References: <CA+G9fYtwisRJtN4ht=ApeWc1jWssDok-7y2wee6Z0kzMP-atKg@mail.gmail.com>
	<CA+G9fYseTYRWoHUNZ=j4mjFs9dDJ-KOD8hDy+RnyDPx75HcVWw@mail.gmail.com>
	<24c8ee4d-d5f7-e49f-cd0c-7cf50a5fd885@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24c8ee4d-d5f7-e49f-cd0c-7cf50a5fd885@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-raid@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	martin.petersen@oracle.com, Song Liu <song@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	linux-mmc <linux-mmc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
	linux-block <linux-block@vger.kernel.org>,
	"open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
	<linux-ide@vger.kernel.org>, dm-devel@redhat.com,
	Linux-Next Mailing List <linux-next@vger.kernel.org>,
	Hannes Reinecke <hare@suse.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [ Regressions ] linux next 20201008:
 blk_update_request: I/O error, dev sda,
 sector 0 op 0x1:(WRITE) flags 0x800 phys_seg 0 prio class 0
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

On Thu, Oct 08, 2020 at 02:17:41PM -0600, Jens Axboe wrote:
> Just for everyones edification, that would be these 9 patches from the
> SCSI tree:

I sent the fixes out a bit ago and Cced the reporters..
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
