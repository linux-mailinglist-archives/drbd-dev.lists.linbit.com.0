Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362B3FE334
	for <lists+drbd-dev@lfdr.de>; Wed,  1 Sep 2021 21:41:43 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 764B042061C;
	Wed,  1 Sep 2021 21:41:42 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A6B59420603
	for <drbd-dev@lists.linbit.com>; Wed,  1 Sep 2021 21:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vWlTtF1Q8Qb+H9Mh5Lyd8cot75BUAmc8fIIm40WTtmY=;
	b=QJpDbxhMM7k2u/aLZK7AJ5/A6k
	Q2Hu2RuNltNyHzduekKTiEZSVz6hLOIkyWwcUuFc3o5HpS73E42l0WjHsFBSmNgX4nhddKyoTGXCY
	qJ4uWBhNaJljPYqJw9svvfSaliCUIprE8jPp9DOY53OcXpPjCohmfEUFdrC9dtQ9yjSOvmtdN6TJt
	jV+9UWZVPOgUSuRQClBs2WPEGHifPdTQnfIk2Up9ie5WLT4434KelFsys82JeT8WuqsxLCBz4I7qd
	9oCPifEZvFaptipbkFitoghG/b4lZCR85oNvrBf0jCvvnZVJmChcJkOdHkXFd0OWD+3HZVTP2XNdo
	RZWGZ5zw==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
	(Red Hat Linux)) id 1mLW6v-0077go-PV; Wed, 01 Sep 2021 19:41:25 +0000
Date: Wed, 1 Sep 2021 12:41:25 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <YS/XZeu3J3nAXUll@bombadil.infradead.org>
References: <20210830221000.179369-1-mcgrof@kernel.org>
	<20210830221000.179369-2-mcgrof@kernel.org>
	<CAMuHMdUUrp-ktVmOPRs7KinykrVKEMx-dG42RapPc-egxODNnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUUrp-ktVmOPRs7KinykrVKEMx-dG42RapPc-egxODNnQ@mail.gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, justin@coraid.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	Tim Waugh <tim@cyberelk.net>, Lars Ellenberg <drbd-dev@lists.linbit.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	"open list:TENSILICA XTENSA PORT \(xtensa\)"
	<linux-xtensa@linux-xtensa.org>, Johannes Berg <johannes.berg@intel.com>,
	Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
	linux-block@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
	Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
	Chris Zankel <chris@zankel.net>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	chris.obbard@collabora.com, Tejun Heo <tj@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>, thehajime@gmail.com,
	YiFei Zhu <zhuyifei1999@gmail.com>
Subject: Re: [Drbd-dev] [PATCH 01/15] z2ram: add error handling support for
	add_disk()
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

On Wed, Sep 01, 2021 at 03:41:47PM +0200, Geert Uytterhoeven wrote:
> > --- a/drivers/block/z2ram.c
> > +++ b/drivers/block/z2ram.c
> > @@ -333,8 +334,10 @@ static int z2ram_register_disk(int minor)
> >                 sprintf(disk->disk_name, "z2ram");
> >
> >         z2ram_gendisk[minor] = disk;
> > -       add_disk(disk);
> > -       return 0;
> > +       err = add_disk(disk);
> > +       if (err)
> > +               blk_cleaup_disk(disk);
> 
> blk_cleanup_disk()?

Fixed thanks.

  Luis
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
