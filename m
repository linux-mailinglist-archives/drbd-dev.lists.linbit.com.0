Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C6A4E4CD5
	for <lists+drbd-dev@lfdr.de>; Wed, 23 Mar 2022 07:42:54 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7B54A421740;
	Wed, 23 Mar 2022 07:42:53 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C7CA3420983
	for <drbd-dev@lists.linbit.com>; Wed, 23 Mar 2022 07:42:51 +0100 (CET)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8DA2C68AFE; Wed, 23 Mar 2022 07:42:48 +0100 (CET)
Date: Wed, 23 Mar 2022 07:42:48 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ryusuke Konishi <konishi.ryusuke@gmail.com>
Message-ID: <20220323064248.GA24874@lst.de>
References: <20220124091107.642561-1-hch@lst.de>
	<20220124091107.642561-2-hch@lst.de>
	<20220322211915.GA2413063@roeck-us.net>
	<CAKFNMonRd5QQMzLoH3T=M=C=2Q_j9d86EYzZeY4DU2HQAE3E8w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKFNMonRd5QQMzLoH3T=M=C=2Q_j9d86EYzZeY4DU2HQAE3E8w@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	linux-nfs@vger.kernel.org, linux-nilfs <linux-nilfs@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Pavel Begunkov <asml.silence@gmail.com>, linux-block@vger.kernel.org,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.co>,
	device-mapper development <dm-devel@redhat.com>,
	"Md . Haris Iqbal" <haris.iqbal@ionos.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	ntfs3@lists.linux.dev, Jack Wang <jinpu.wang@ionos.com>,
	Christoph Hellwig <hch@lst.de>,
	Guenter Roeck <linux@roeck-us.net>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [dm-devel] [PATCH 01/19] fs: remove mpage_alloc
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

On Wed, Mar 23, 2022 at 06:38:22AM +0900, Ryusuke Konishi wrote:
> This looks because the mask of GFP_KERNEL is removed along with
> the removal of mpage_alloc().
> 

> The default value of the gfp flag is set to GFP_HIGHUSER_MOVABLE by
> inode_init_always().
> So, __GFP_HIGHMEM hits the gfp warning at bio_alloc() that
> do_mpage_readpage() calls.

Yeah.  Let's try this to match the iomap code:

diff --git a/fs/mpage.c b/fs/mpage.c
index 9ed1e58e8d70b..d465883edf719 100644
--- a/fs/mpage.c
+++ b/fs/mpage.c
@@ -148,13 +148,11 @@ static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
 	int op = REQ_OP_READ;
 	unsigned nblocks;
 	unsigned relative_block;
-	gfp_t gfp;
+	gfp_t gfp = mapping_gfp_constraint(page->mapping, GFP_KERNEL);
 
 	if (args->is_readahead) {
 		op |= REQ_RAHEAD;
-		gfp = readahead_gfp_mask(page->mapping);
-	} else {
-		gfp = mapping_gfp_constraint(page->mapping, GFP_KERNEL);
+		gfp |= __GFP_NORETRY | __GFP_NOWARN;
 	}
 
 	if (page_has_buffers(page))
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
