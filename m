Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 2657042B53A
	for <lists+drbd-dev@lfdr.de>; Wed, 13 Oct 2021 07:29:51 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 08E5C420FDC;
	Wed, 13 Oct 2021 07:29:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 477 seconds by postgrey-1.31 at mail19;
	Wed, 13 Oct 2021 07:29:30 CEST
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8CCA7420FCE
	for <drbd-dev@lists.linbit.com>; Wed, 13 Oct 2021 07:29:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5E2BE1FF87;
	Wed, 13 Oct 2021 05:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1634102493;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=ILLm2pe17/wADifWsNez+bTJrwsc+lrviMwLK7kUvDI=;
	b=bvKId0oH3n+XWRAa8k+X7S4sSfCSq6r7k6wkqvducj0gvOulmoiit7vAXJt7/Fugc4ApBB
	+eyuMKl31qjAEJWuSCiR357fXwBwkLJzIMHJmLSrbkPgZIeBcwzOpezb3tR0358vd8V0Yu
	v4i5Ls9qoC9uBvhPFPVe6ERT85hRkzU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1634102493;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=ILLm2pe17/wADifWsNez+bTJrwsc+lrviMwLK7kUvDI=;
	b=7QNd9vO2OGh2y9jVTVQKK6beKgduFwgxo0TkSLgWMuvnfJFmYXqVQMfqyW0QcEDOD1zLDp
	Em1u+x09Gi2O+KBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B800113CAE;
	Wed, 13 Oct 2021 05:21:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id rI5FINRsZmEARAAAMHmgww
	(envelope-from <colyli@suse.de>); Wed, 13 Oct 2021 05:21:24 +0000
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20211013051042.1065752-1-hch@lst.de>
	<20211013051042.1065752-2-hch@lst.de>
From: Coly Li <colyli@suse.de>
Message-ID: <cd1b2185-9682-1d97-9789-96f833007f62@suse.de>
Date: Wed, 13 Oct 2021 13:21:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013051042.1065752-2-hch@lst.de>
Content-Language: en-US
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
	Mike Snitzer <snitzer@redhat.com>, linux-nvme@lists.infradead.org,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	drbd-dev@lists.linbit.com, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
	linux-ext4@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Josef Bacik <josef@toxicpanda.com>,
	reiserfs-devel@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Anton Altaparmakov <anton@tuxera.com>,
	linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	Theodore Ts'o <tytso@mit.edu>,
	linux-ntfs-dev@lists.sourceforge.net, Jan Kara <jack@suse.com>,
	linux-fsdevel@vger.kernel.org,
	Phillip Lougher <phillip@squashfs.org.uk>, ntfs3@lists.linux.dev,
	linux-btrfs@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 01/29] bcache: remove bdev_sectors
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On 10/13/21 1:10 PM, Christoph Hellwig wrote:
> Use the equivalent block layer helper instead.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Coly Li <colyli@suse.de>

Thanks.

Coly Li

> ---
>   drivers/md/bcache/super.c     | 2 +-
>   drivers/md/bcache/util.h      | 4 ----
>   drivers/md/bcache/writeback.c | 2 +-
>   3 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index f2874c77ff797..4f89985abe4b7 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1002,7 +1002,7 @@ static void calc_cached_dev_sectors(struct cache_set *c)
>   	struct cached_dev *dc;
>   
>   	list_for_each_entry(dc, &c->cached_devs, list)
> -		sectors += bdev_sectors(dc->bdev);
> +		sectors += bdev_nr_sectors(dc->bdev);
>   
>   	c->cached_dev_sectors = sectors;
>   }
> diff --git a/drivers/md/bcache/util.h b/drivers/md/bcache/util.h
> index b64460a762677..a7da7930a7fda 100644
> --- a/drivers/md/bcache/util.h
> +++ b/drivers/md/bcache/util.h
> @@ -584,8 +584,4 @@ static inline unsigned int fract_exp_two(unsigned int x,
>   void bch_bio_map(struct bio *bio, void *base);
>   int bch_bio_alloc_pages(struct bio *bio, gfp_t gfp_mask);
>   
> -static inline sector_t bdev_sectors(struct block_device *bdev)
> -{
> -	return bdev->bd_inode->i_size >> 9;
> -}
>   #endif /* _BCACHE_UTIL_H */
> diff --git a/drivers/md/bcache/writeback.c b/drivers/md/bcache/writeback.c
> index 8120da278161e..c7560f66dca88 100644
> --- a/drivers/md/bcache/writeback.c
> +++ b/drivers/md/bcache/writeback.c
> @@ -45,7 +45,7 @@ static uint64_t __calc_target_rate(struct cached_dev *dc)
>   	 * backing volume uses about 2% of the cache for dirty data.
>   	 */
>   	uint32_t bdev_share =
> -		div64_u64(bdev_sectors(dc->bdev) << WRITEBACK_SHARE_SHIFT,
> +		div64_u64(bdev_nr_sectors(dc->bdev) << WRITEBACK_SHARE_SHIFT,
>   				c->cached_dev_sectors);
>   
>   	uint64_t cache_dirty_target =

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
