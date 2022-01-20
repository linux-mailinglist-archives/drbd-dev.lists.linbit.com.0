Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9820F4949C8
	for <lists+drbd-dev@lfdr.de>; Thu, 20 Jan 2022 09:46:37 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 757584205C4;
	Thu, 20 Jan 2022 09:46:37 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1ED834201E2
	for <drbd-dev@lists.linbit.com>; Thu, 20 Jan 2022 09:46:34 +0100 (CET)
Received: by mail-ed1-f46.google.com with SMTP id f21so25441636eds.11
	for <drbd-dev@lists.linbit.com>; Thu, 20 Jan 2022 00:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cgwK+h4TcKTuzoMVgpyjaT6hqJgZPgeFi9/82jcEytw=;
	b=bSaFa+URfbmU/MszEXVOlamjch2d/bVKLmiJuU4jZJRaWnRGqGHrY9tAQfmQRbRXiV
	uc/9kTk3/S5l1jHMLdTRmVU57otES44XeerqdTVprmM6I9EDUZQLX+yH0h63YbxWR9mE
	9nbGRPoufn7nse+dFWj62siY9k2GshoKLCrxbi33+uXmG5HvTOiNXAwJCNJOjjOHmaSp
	XOP01luyWgvqHzNdBA4wIYoRQp0k9Ft6zqCX+Ra/R90oY2R7/AxbMlg/sS1PwZuWZg03
	Z3JDZLtjXW1ZdUyTLOQOdSV8iGdn5zWa6hPXzsGCHlb9LWK1Z0CByscOqozFwyTfAd7X
	/t3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cgwK+h4TcKTuzoMVgpyjaT6hqJgZPgeFi9/82jcEytw=;
	b=N6XrLWyy1HWVMAX+dzh8e7BKYVjsFewGckv7Mh5cGPjBV76prLqVAamwVuMvfNCY4u
	/ziZY0CnC7M0jklt+TaBYOk7F8UCiQFE458HzlZqRlygWZBeK/utfmGEZ0fWpe/6j9gK
	UVYGXe8+90G1VRZzV4bOxnUkyVZiQElQEnk2/Nze+v80YYU9UfKALaIzzZmq+94PNIP8
	cbpONjV4phfnBVK7BXQQP02s3f2rFVlC9/uvD+VzKEUn1b+xh8qQ28MBwwUKS5DJgXrk
	XbOz5/zP9ZDgjQK6/k61mX4gFvrJk9f61Jsm1qIAwFYzM1PgIC1HGDVS/vc+r2oeDO5k
	4gng==
X-Gm-Message-State: AOAM533g7ligDF6Lba9LA2YNlcPV8WZrCI4pOHSoFPYQtDn6Jst2fgmE
	DmYoxyk1VheO6F1hkcDXaG5aAebn9ef1U7M1KYtLTw==
X-Google-Smtp-Source: ABdhPJxuyj+5hYqiz1QG79H/zXO6tZsV+Dq+Pw3BW6UC4M2lhhCbPthTcTo8B1M9EwB4FqJ6g90lXSpEfvPIb7w08Cw=
X-Received: by 2002:a05:6402:195:: with SMTP id
	r21mr34247351edv.174.1642668394471; 
	Thu, 20 Jan 2022 00:46:34 -0800 (PST)
MIME-Version: 1.0
References: <20220118071952.1243143-1-hch@lst.de>
	<20220118071952.1243143-11-hch@lst.de>
	<CAMGffEmFZB1PPE09bfxQjKw-tJhdprEkF-OWrVF4Kjsf1OwQ_g@mail.gmail.com>
	<20220120083746.GA5622@lst.de>
In-Reply-To: <20220120083746.GA5622@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Thu, 20 Jan 2022 09:46:23 +0100
Message-ID: <CAMGffE=+ENBdRfugG4k3yB_ca3rqwnaKFXC4+8=CZ=LGvggA6w@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.co>,
	dm-devel@redhat.com, "Md . Haris Iqbal" <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Pavel Begunkov <asml.silence@gmail.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] [PATCH 10/19] rnbd-srv: simplify bio mapping in
	process_rdma
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

On Thu, Jan 20, 2022 at 9:37 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Jan 19, 2022 at 01:20:54AM +0100, Jinpu Wang wrote:
> > this changes lead to IO error all the time, because bio_add_page return len.
> > We need  if (bio_add_page(bio, virt_to_page(data), datalen,
> >                      offset_in_page(data)) < datalen)
>
> Does this version look good to you?
>
> http://git.infradead.org/users/hch/block.git/commitdiff/62adb08e765b889dd8db4227cad33a710e36d631

Yes, lgtm, thank you!
Reviewed-by: Jack Wang <jinpu.wang@ionons.com>
Tested-by: Jack Wang <jinpu.wang@ionos.com>
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
