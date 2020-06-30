Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C78220FB93
	for <lists+drbd-dev@lfdr.de>; Tue, 30 Jun 2020 20:19:35 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DFB3E4203C7;
	Tue, 30 Jun 2020 20:19:33 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id CC25842032F
	for <drbd-dev@lists.linbit.com>; Tue, 30 Jun 2020 20:19:31 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2C5A868B05; Tue, 30 Jun 2020 20:19:29 +0200 (CEST)
Date: Tue, 30 Jun 2020 20:19:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200630181928.GA7853@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
	<bd1443c0-be37-115b-1110-df6f0e661a50@kernel.dk>
	<6ddbe343-0fc2-58c8-3726-c4ba9952994f@kernel.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ddbe343-0fc2-58c8-3726-c4ba9952994f@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-bcache@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] rename ->make_request_fn and move it to the
 block_device_operations
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

On Tue, Jun 30, 2020 at 09:43:31AM -0600, Jens Axboe wrote:
> On 6/30/20 7:57 AM, Jens Axboe wrote:
> > On 6/29/20 1:39 PM, Christoph Hellwig wrote:
> >> Hi Jens,
> >>
> >> this series moves the make_request_fn method into block_device_operations
> >> with the much more descriptive ->submit_bio name.  It then also gives
> >> generic_make_request a more descriptive name, and further optimize the
> >> path to issue to blk-mq, removing the need for the direct_make_request
> >> bypass.
> > 
> > Looks good to me, and it's a nice cleanup as well. Applied.
> 
> Dropped, insta-crashes with dm:

Hmm.  Can you send me what is at "submit_bio_noacct+0x1f6" from gdb?
Or your .config?
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
