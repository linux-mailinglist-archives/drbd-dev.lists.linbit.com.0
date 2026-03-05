Return-Path: <drbd-dev-bounces@lists.linbit.com>
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kC9OM6PJumm6bwIAu9opvQ
	(envelope-from <drbd-dev-bounces@lists.linbit.com>)
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:49:55 +0100
X-Original-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTP id 647052BE983
	for <lists+drbd-dev@lfdr.de>; Wed, 18 Mar 2026 16:49:55 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E66FA162F01;
	Wed, 18 Mar 2026 16:49:45 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 1213 seconds by postgrey-1.31 at mail19;
	Thu, 05 Mar 2026 15:57:42 CET
Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 557D1162807
	for <drbd-dev@lists.linbit.com>;
	Thu,  5 Mar 2026 15:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1772721137;
	h=from:subject:mime-version:from:date:message-id:subject:to:cc:
	reply-to:content-type:mime-version:in-reply-to:message-id;
	bh=fd+yf1MWzvARKFw8KBfrfEqR9xVpjfuoaal13vgTb08=;
	b=AAxZ2sSHWBbHI7bgo9b94IGyL9gbbFmnG2NRpr2rPRJHORW19c5D9fIVDKQmGT+SjHgHkT
	w9rTBRmAS7+aci8rWfM7wYOKLGRQnzJMIbXjN+AEn3+iu+I8HP9VaOkhlBNy7Miepdvy7t
	UiAagZ3L9669d9b9HdLl1d1kt7+OIufueeiBMmVyqxYcOF+mkzjmceodm2A5nCl4vYTDYe
	7qxP0ynSnam8VDnptEWPT0qLpJKADLMTFSAzRSAWnag2HxtiNXwEtRZAXpHePZpqV95Tky
	JhYfI8ghcEjCDB0EnM4Ax0kFdpMCCpE3TAh5Jm2IXeFDMhOo+zyImudtdQaCYA==
Message-Id: <aamTA2F84tiDbmF3@studio.local>
Mime-Version: 1.0
References: <20260304190424.291743-1-agruenba@redhat.com>
	<20260304190424.291743-5-agruenba@redhat.com>
In-Reply-To: <20260304190424.291743-5-agruenba@redhat.com>
Subject: Re: [PATCH 4/4] bio: use bio_io_error more often
Date: Thu, 5 Mar 2026 22:32:13 +0800
X-Original-From: Coly Li <colyli@fnnas.com>
Content-Type: text/plain; charset=UTF-8
Received: from studio.local ([120.245.64.174]) by smtp.feishu.cn with ESMTPS;
	Thu, 05 Mar 2026 22:32:14 +0800
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
From: "Coly Li" <colyli@fnnas.com>
X-Lms-Return-Path: <lba+269a993ef+206740+lists.linbit.com+colyli@fnnas.com>
To: "Andreas Gruenbacher" <agruenba@redhat.com>
X-Mailman-Approved-At: Wed, 18 Mar 2026 16:49:43 +0100
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
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
X-Spamd-Result: default: False [2.09 / 15.00];
	R_DKIM_REJECT(1.00)[fnnas-com.20200927.dkim.feishu.cn:s=s1];
	DATE_IN_PAST(1.00)[313];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_NO_TLS_LAST(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[fnnas.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[colyli@fnnas.com,drbd-dev-bounces@lists.linbit.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:agruenba@redhat.com,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:hch@lst.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[drbd-dev@lists.linbit.com];
	DKIM_TRACE(0.00)[fnnas-com.20200927.dkim.feishu.cn:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[drbd-dev@lists.linbit.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[colyli@fnnas.com,drbd-dev-bounces@lists.linbit.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[drbd-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	NEURAL_HAM(-0.00)[-0.495];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail19.linbit.com:helo,mail19.linbit.com:rdns]
X-Rspamd-Queue-Id: 647052BE983
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 04, 2026 at 08:04:09PM +0800, Andreas Gruenbacher wrote:
> Instead of setting bio->bi_status to BLK_STS_IOERR and calling
> bio_endio(bio), use the shorthand bio_io_error(bio).
> 
> Created with Coccinelle using the following semantic patch:
> 
> @@
> struct bio *bio;
> @@
> - bio->bi_status = BLK_STS_IOERR;
> - bio_endio(bio);
> + bio_io_error(bio);
> 
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  block/fops.c                  | 3 +--
>  drivers/block/drbd/drbd_int.h | 3 +--
>  drivers/md/bcache/bcache.h    | 3 +--
>  drivers/md/bcache/request.c   | 6 ++----
>  drivers/md/dm-mpath.c         | 3 +--
>  drivers/md/dm-writecache.c    | 3 +--
>  fs/f2fs/segment.c             | 3 +--
>  7 files changed, 8 insertions(+), 16 deletions(-)
> 

[snipped]

>  
> diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
> index ec9ff9715081..e0c9d9eef0a0 100644
> --- a/drivers/md/bcache/bcache.h
> +++ b/drivers/md/bcache/bcache.h
> @@ -947,8 +947,7 @@ static inline void closure_bio_submit(struct cache_set *c,
>  {
>  	closure_get(cl);
>  	if (unlikely(test_bit(CACHE_SET_IO_DISABLE, &c->flags))) {
> -		bio->bi_status = BLK_STS_IOERR;
> -		bio_endio(bio);
> +		bio_io_error(bio);
>  		return;
>  	}
>  	submit_bio_noacct(bio);
> diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
> index 3fa3b13a410f..0f6fa0a2920b 100644
> --- a/drivers/md/bcache/request.c
> +++ b/drivers/md/bcache/request.c
> @@ -1178,8 +1178,7 @@ void cached_dev_submit_bio(struct bio *bio)
>  
>  	if (unlikely((d->c && test_bit(CACHE_SET_IO_DISABLE, &d->c->flags)) ||
>  		     dc->io_disable)) {
> -		bio->bi_status = BLK_STS_IOERR;
> -		bio_endio(bio);
> +		bio_io_error(bio);
>  		return;
>  	}
>  
> @@ -1283,8 +1282,7 @@ void flash_dev_submit_bio(struct bio *bio)
>  	struct bcache_device *d = bio->bi_bdev->bd_disk->private_data;
>  
>  	if (unlikely(d->c && test_bit(CACHE_SET_IO_DISABLE, &d->c->flags))) {
> -		bio->bi_status = BLK_STS_IOERR;
> -		bio_endio(bio);
> +		bio_io_error(bio);
>  		return;
>  	}
>  

For bcache part, I feel current hard code is explict and clear.
The bio_io_error() wrapper is not so directly understood. This is just
my opinion, not a strong objection. 

Thanks.

Coly Li


[snipped]
