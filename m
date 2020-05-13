Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A91D2203
	for <lists+drbd-dev@lfdr.de>; Thu, 14 May 2020 00:27:00 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1BF294203E4;
	Thu, 14 May 2020 00:26:59 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
	[209.85.218.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3415E420317
	for <drbd-dev@lists.linbit.com>; Thu, 14 May 2020 00:26:57 +0200 (CEST)
Received: by mail-ej1-f45.google.com with SMTP id n17so983980ejh.7
	for <drbd-dev@lists.linbit.com>; Wed, 13 May 2020 15:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5gtvWq/MeF/6oEmnw1qXQmZlv3KNk4h6BjoEUKhO/AI=;
	b=qnuaqcZyt8F/fu6JacXR348SsoSa3Tm7AzZNuvdyRoTov1keyBvQu8pXUwf75HxiOf
	Kp75KOKoGDVG9AVOlHoBHnEOZ+aGnlYmnNxamZckzNM5gr/kauOLnvq8RbJVSj57g1cw
	9NN4htlh7EN6fcqVbepwUivXJDqDlyuHYUdtHPY21wxmzjXy/ZgI5w7jQM2uM22NfFtA
	q8lS8JkKuJziplyt33amkKJeLTRetS+ezNJTjHtj9SEkChz+0OHqn2TMVceqrJ2eD/4/
	0tsEvnEt2hykkPAkDhJ48WHxBHzBhAZBdTwTt86tywE0BQeuxSyyhNQdkXE9MGPz7xQ5
	Snkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5gtvWq/MeF/6oEmnw1qXQmZlv3KNk4h6BjoEUKhO/AI=;
	b=bJ09eWB2vFSm1xcE4iOTVrNCNkfI+x5KF5cNQG9yv+9Ds/Cdnv5Xxwa3xks1MfIEfW
	g/Z455krPFkFVdK2tOkWR4iOsd0D8EIGiKilg6SiGJX3Mr2nFwn8O4HMcggvCJW7tdDm
	mS0cA5y0ZTCSxgL72PK1HppQ4SM9PIZRkORHSU49fjGbnmqc5kjHuZ2yTejIxg7W8goL
	yBjHQwyiQkbZOSHuxNiL5OVtS/qIUiOCYuzgr3dLlxbZ1ccMPJvXP3wEf+zLjkjZu41D
	ibEOVBKuyD4cj5Da14kuEAiOGdhlWPybda7I+DR+ylDodlX9puj3ocw2yWEgnqZphN1m
	t1ZQ==
X-Gm-Message-State: AOAM530JxT59PXt6B1Lu5Bk87GtO8Czc9vSFZiYACrc/m5dprlHoQX0q
	n1bH6b4u3jpnapVT4P6Svw8F+/EnfW3J3ZfYgzvzWw==
X-Google-Smtp-Source: ABdhPJz1YkZyiu1OaSAVXpO2AAQnxlh/qNnka1A5+jaiVwuM2r/ADoB+8k1+qusteX+AGprilg7rK2SWSnm96LhSDK4=
X-Received: by 2002:a17:906:1f8b:: with SMTP id
	t11mr1180169ejr.201.1589408817417; 
	Wed, 13 May 2020 15:26:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200508161517.252308-1-hch@lst.de>
	<CAPcyv4j3gVqrZWCCc2Q-6JizGAQXW0b+R1BcvWCZOvzaukGLQg@mail.gmail.com>
	<20200509082352.GB21834@lst.de>
	<CAPcyv4ggb7_rwzGbhHNXSHd+jjSpZC=+DMEztY6Cu8Bc=ZNzag@mail.gmail.com>
	<20200512080820.GA2336@lst.de>
In-Reply-To: <20200512080820.GA2336@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 13 May 2020 15:26:45 -0700
Message-ID: <CAPcyv4iWB=ZMmpc1aWfpJabSbCdvB28dCeSp_xj7AZMfbF_rjg@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-xtensa@linux-xtensa.org,
	linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Geoff Levand <geoff@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jim Paris <jim@jtan.com>, linux-block@vger.kernel.org,
	Minchan Kim <minchan@kernel.org>, linux-m68k@lists.linux-m68k.org,
	Philip Kelleher <pjk1939@linux.ibm.com>, linux-bcache@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	Joshua Morris <josh.h.morris@us.ibm.com>,
	Nitin Gupta <ngupta@vflare.org>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] remove a few uses of ->queuedata
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

On Tue, May 12, 2020 at 1:08 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Sat, May 09, 2020 at 08:07:14AM -0700, Dan Williams wrote:
> > > which are all used in the I/O submission path (generic_make_request /
> > > generic_make_request_checks).  This is mostly a prep cleanup patch to
> > > also remove the pointless queue argument from ->make_request - then
> > > ->queue is an extra dereference and extra churn.
> >
> > Ah ok. If the changelogs had been filled in with something like "In
> > preparation for removing @q from make_request_fn, stop using
> > ->queuedata", I probably wouldn't have looked twice.
> >
> > For the nvdimm/ driver updates you can add:
> >
> >     Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> >
> > ...or just let me know if you want me to pick those up through the nvdimm tree.
>
> I'd love you to pick them up through the nvdimm tree.  Do you want
> to fix up the commit message yourself?

Will do, thanks.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
