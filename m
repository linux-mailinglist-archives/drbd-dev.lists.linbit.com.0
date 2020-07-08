Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCC128BCBB
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Oct 2020 17:46:16 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C88734207CA;
	Mon, 12 Oct 2020 17:46:16 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0783B4207AE
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 17:44:11 +0200 (CEST)
Received: by mail-wr1-f67.google.com with SMTP id h7so19745707wre.4
	for <drbd-dev@lists.linbit.com>; Mon, 12 Oct 2020 08:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=zOWf3p3xI1sepLL9g4G4R9mj9kA3+N6jtmLxi0HMHLk=;
	b=ocwCfpXkWCHKdjOhPEpvdpacDhgyxDa9uhuMBPNC1488eBiFSeXge4T4uCPGpjSt02
	dQtkDkbMyAbSu/rGZoBDm/CZN2mW557zTnr1wFEe8B5ccP3OJxjcqp85yEVYx0MZ5s/m
	VatNKpfc1b52i318XX9Tx42t2DYp19MXtHZexC+2anoiQ1a7Me1jKbJpXfG6jLZ5ndC/
	Qk8bg7CdZLkvH+zFIZNF+3nXvGTgKy33EaCGuSREtKgkPAz4FnGXEwCA8we8o5WWYpxe
	dnMR+sLKcGDkixy5+iPIiV1VOgUDb0GIZS3MxCMMTTJ/wb6Yd/QUallO4Ho2ih0k1Ywc
	jMSQ==
X-Gm-Message-State: AOAM530JVCLWMhtjC5/+SpelDcK2rCXRBYylCKwCEYINuokrlsSWO5OT
	TgmaRiMFLOBTp4ZpaRYmRETLE5XevBBxfS2T
X-Google-Smtp-Source: ABdhPJw5HQKqPTKENA0S+hfmf4pmd+EOb9LFsVJQnwx0BfAJOYB6L/Ph5yxPz7W/uxpMqUA0+CY6UA==
X-Received: by 2002:adf:9124:: with SMTP id j33mr30256782wrj.272.1602517390560;
	Mon, 12 Oct 2020 08:43:10 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	y10sm19700668wrq.73.2020.10.12.08.43.10
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 12 Oct 2020 08:43:10 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Mon, 12 Oct 2020 17:43:08 +0200
Resent-Message-ID: <20201012154308.GX2116@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 401 seconds by postgrey-1.31 at mail19;
	Wed, 08 Jul 2020 15:34:02 CEST
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2BEBD4203BA
	for <drbd-dev@lists.linbit.com>; Wed,  8 Jul 2020 15:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1594215241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=zOWf3p3xI1sepLL9g4G4R9mj9kA3+N6jtmLxi0HMHLk=;
	b=ibKECbv7rP7SJrGQIrDSN/Wk0vD+CT2g/Q/gtHGGYqXVSa68bOnoxYh0Tyu9dy+C6s8xMH
	PcSflHD5awycX7qUobWKjEChWufjWYOC6lsws3WEWYKk12bk81ys220pDQ4LJT7iTwmj4Q
	ZVSt8LksCtO2aMYR6loFBXGuIGNbe20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-328-TBCS1W0rPTaI3Dzd6AdJZw-1; Wed, 08 Jul 2020 09:27:16 -0400
X-MC-Unique: TBCS1W0rPTaI3Dzd6AdJZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EEB121082;
	Wed,  8 Jul 2020 13:27:14 +0000 (UTC)
Received: from T590 (ovpn-12-49.pek2.redhat.com [10.72.12.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD6717FE8B;
	Wed,  8 Jul 2020 13:27:08 +0000 (UTC)
Date: Wed, 8 Jul 2020 21:27:04 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
Message-ID: <20200708132704.GB3340386@T590>
References: <20200708075819.4531-1-guoqing.jiang@cloud.ionos.com>
	<20200708075819.4531-2-guoqing.jiang@cloud.ionos.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708075819.4531-2-guoqing.jiang@cloud.ionos.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH RFC 1/5] block: return ns precision from
 disk_start_io_acct
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

On Wed, Jul 08, 2020 at 09:58:15AM +0200, Guoqing Jiang wrote:
> Currently the duration accounting of bio based driver is converted from
> jiffies to ns, means it could be less accurate as request based driver.
> 
> So let disk_start_io_acct return from ns precision, instead of convert
> jiffies to ns in disk_end_io_acct.
> 
> Cc: Philipp Reisner <philipp.reisner@linbit.com>
> Cc: Lars Ellenberg <lars.ellenberg@linbit.com>
> Cc: drbd-dev@lists.linbit.com
> Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
> ---
>  block/blk-core.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/block/blk-core.c b/block/blk-core.c
> index d9d632639bd1..0e806a8c62fb 100644
> --- a/block/blk-core.c
> +++ b/block/blk-core.c
> @@ -1466,6 +1466,7 @@ unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
>  	struct hd_struct *part = &disk->part0;
>  	const int sgrp = op_stat_group(op);
>  	unsigned long now = READ_ONCE(jiffies);
> +	unsigned long start_ns = ktime_get_ns();
>  
>  	part_stat_lock();
>  	update_io_ticks(part, now, false);
> @@ -1474,7 +1475,7 @@ unsigned long disk_start_io_acct(struct gendisk *disk, unsigned int sectors,
>  	part_stat_local_inc(part, in_flight[op_is_write(op)]);
>  	part_stat_unlock();
>  
> -	return now;
> +	return start_ns;
>  }
>  EXPORT_SYMBOL(disk_start_io_acct);
>  
> @@ -1484,11 +1485,11 @@ void disk_end_io_acct(struct gendisk *disk, unsigned int op,
>  	struct hd_struct *part = &disk->part0;
>  	const int sgrp = op_stat_group(op);
>  	unsigned long now = READ_ONCE(jiffies);
> -	unsigned long duration = now - start_time;
> +	unsigned long duration = ktime_get_ns() - start_time;
>  
>  	part_stat_lock();
>  	update_io_ticks(part, now, true);
> -	part_stat_add(part, nsecs[sgrp], jiffies_to_nsecs(duration));
> +	part_stat_add(part, nsecs[sgrp], duration);
>  	part_stat_local_dec(part, in_flight[op_is_write(op)]);
>  	part_stat_unlock();

Hi Guoqing,

Cost of ktime_get_ns() can be observed as not cheap in high IOPS device,
so not sure the conversion is good. Also could you share what benefit we can
get with this change?

Thanks,
Ming

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
