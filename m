Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A2821277D
	for <lists+drbd-dev@lfdr.de>; Thu,  2 Jul 2020 17:14:58 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id EC8844203F1;
	Thu,  2 Jul 2020 17:14:57 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BE35A420385
	for <drbd-dev@lists.linbit.com>; Thu,  2 Jul 2020 17:14:56 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 9DA8768B05; Thu,  2 Jul 2020 17:14:53 +0200 (CEST)
Date: Thu, 2 Jul 2020 17:14:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Qian Cai <cai@lca.pw>
Message-ID: <20200702151453.GA1799@lst.de>
References: <20200629193947.2705954-1-hch@lst.de>
	<20200629193947.2705954-19-hch@lst.de>
	<20200702141001.GA3834@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702141001.GA3834@lca.pw>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-nvdimm@lists.01.org, linux-s390@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, Alexander Potapenko <glider@google.com>,
	kasan-dev@googlegroups.com, Andrey Ryabinin <aryabinin@virtuozzo.com>,
	linux-bcache@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Christoph Hellwig <hch@lst.de>,
	Dmitry Vyukov <dvyukov@google.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 18/20] block: refator submit_bio_noacct
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

On Thu, Jul 02, 2020 at 10:10:10AM -0400, Qian Cai wrote:
> On Mon, Jun 29, 2020 at 09:39:45PM +0200, Christoph Hellwig wrote:
> > Split out a __submit_bio_noacct helper for the actual de-recursion
> > algorithm, and simplify the loop by using a continue when we can't
> > enter the queue for a bio.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Reverting this commit and its dependencies,
> 
> 5a6c35f9af41 block: remove direct_make_request
> ff93ea0ce763 block: shortcut __submit_bio_noacct for blk-mq drivers
> 
> fixed the stack-out-of-bounds during boot,
> 
> https://lore.kernel.org/linux-block/000000000000bcdeaa05a97280e4@google.com/

Yikes.  bio_alloc_bioset pokes into bio_list[1] in a totally
undocumented way.  But even with that the problem should only show
up with "block: shortcut __submit_bio_noacct for blk-mq drivers".

Can you try this patch?

diff --git a/block/blk-core.c b/block/blk-core.c
index bf882b8d84450c..9f1bf8658b611a 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -1155,11 +1155,10 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
 static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
 {
 	struct gendisk *disk = bio->bi_disk;
-	struct bio_list bio_list;
+	struct bio_list bio_list[2] = { };
 	blk_qc_t ret = BLK_QC_T_NONE;
 
-	bio_list_init(&bio_list);
-	current->bio_list = &bio_list;
+	current->bio_list = bio_list;
 
 	do {
 		WARN_ON_ONCE(bio->bi_disk != disk);
@@ -1174,7 +1173,7 @@ static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
 		}
 
 		ret = blk_mq_submit_bio(bio);
-	} while ((bio = bio_list_pop(&bio_list)));
+	} while ((bio = bio_list_pop(&bio_list[0])));
 
 	current->bio_list = NULL;
 	return ret;
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
