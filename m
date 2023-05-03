Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 940266F4F6C
	for <lists+drbd-dev@lfdr.de>; Wed,  3 May 2023 06:20:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 12FD9420FB8;
	Wed,  3 May 2023 06:20:19 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 176D34203AB
	for <drbd-dev@lists.linbit.com>; Wed,  3 May 2023 06:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309;
	h=In-Reply-To:Content-Transfer-Encoding
	:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=x21ZOyqwSO6akl9eeR4mmRhulhewI5kv9bFdmjbWKCU=;
	b=AHWCgdRImqZ8SLjE5Si39Zr/w2
	eTG00Ck5ii4BoHAOWS5HnXwslL7C5lqoHC3HFq3kDyqLEL5PFpuWEgFd+NB+tOMFJLc8YuIvPCZtU
	gTVxyFz5RJuKBp3GwXyo+hqS8voies41iDkSk/CoNIvblA2dZFrBNHJdlDV5AUR1leEYBiJ3PyMLi
	jhlxE8Q0QZXxTzUaiJwP+SL8K0XEr+hK9fFwFz76MVyEG/PlcSJHwivIV7IAolifer8nDrSstZ+DF
	fUJVKOwyir1uWk95PHoGBV65piKy5DTNo71fW4xIZyKmTAMPUsDc0oDaMrffxJvGIZ8EN6kBAGkKy
	q52u7XbQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
	Linux)) id 1pu3wH-003IJ3-0K; Wed, 03 May 2023 04:18:01 +0000
Date: Tue, 2 May 2023 21:18:01 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>
Message-ID: <ZFHgefWofVt24tRl@infradead.org>
References: <20230502092922.175857-1-christoph.boehmwalder@linbit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230502092922.175857-1-christoph.boehmwalder@linbit.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jens Axboe <axboe@kernel.dk>, Thomas Voegtle <tv@lio96.de>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	Lars Ellenberg <lars.ellenberg@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH] drbd: do not set REQ_PREFLUSH when
	submitting barrier
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

On Tue, May 02, 2023 at 11:29:22AM +0200, Christoph B=F6hmwalder wrote:
>  	struct bio *bio =3D bio_alloc(device->ldev->backing_bdev, 0,
> -				    REQ_OP_FLUSH | REQ_PREFLUSH, GFP_NOIO);
> +				    REQ_OP_FLUSH, GFP_NOIO);

This isn't going to work.  flush bios are (somewhat confusingly)
implemented as writes with no data and the preflush flag.  So this
should be:

	REQ_OP_WRITE | REQ_PREFLUSH.

and it looks like whatever flushing this does hasn't wroked for a long
time.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
