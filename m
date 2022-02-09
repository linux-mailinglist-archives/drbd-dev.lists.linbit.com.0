Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B69664AF3AE
	for <lists+drbd-dev@lfdr.de>; Wed,  9 Feb 2022 15:08:25 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A133C42094D;
	Wed,  9 Feb 2022 15:08:24 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
	[209.85.218.43])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 389F8420949
	for <drbd-dev@lists.linbit.com>; Wed,  9 Feb 2022 15:08:22 +0100 (CET)
Received: by mail-ej1-f43.google.com with SMTP id e7so3615077ejn.13
	for <drbd-dev@lists.linbit.com>; Wed, 09 Feb 2022 06:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=I5bx1qEtEg3EIzDv8AQCkahDWh6kYfXn3OFOgd1OTgg=;
	b=h1a3/iEzTG3qiinGOPEQEcIOyBFs0Uk8dAcTSe527i9dZNw25gmqQ1UVfVep7cjSKO
	vVEldcrrq1G4mvLimfM/OJTq3PqrlXTgCK91nS62Po3lk7IWDrvs2tXKP5XIJqHB71AW
	5jaVCe7tLS3rFIQDHT7KrOBmg1Par9XzTRo0rIufYOAacbzSiQo3oQ5VD5Ypuv9dCgjg
	5AEgfMdbxj/DfLj1H6N/fWiGYEtwTXwXfxKnXGg3r/wjIwk7Uyc0a1JS/MT50vvfERJQ
	Y3zXopwud/1nKroLaxl6MWuFUbGtuZi2g8hY5kWRSnS5/s8h9q3wuu0HtNssCArRHHBw
	n1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I5bx1qEtEg3EIzDv8AQCkahDWh6kYfXn3OFOgd1OTgg=;
	b=ggUWwnyuuO5TJn888X3irJ4/Xycb5ZjMHO5CzDMOqK3/aFEMqu7JVVyOgiTxkKDjOj
	X3oJQF4zSgLfhuQPpaZ1fmrEZoBBQJ2SGetnMYYCU7fDgmDeHFsYncZPTplpBrRmLSCv
	aqXfM/gPiLyvu+WO40D9cPhdE0Br6VbKlu3YB3WkiX+YuMoSVTqmeM7BoO/steDIPzrX
	JXE3NG8KZcHTILAQ4wxLlJzjixEJpEFbS1ar3mC2E+owU2CfOi9rBgjW6IhSwP5+JuUN
	lHPV2QLEncyG0jNQEHJ/h+GktfPoE+JT/xZ1xuCbQuy29X1GVcSmnSQM9CY2mYXyNpgn
	hPsQ==
X-Gm-Message-State: AOAM532wefyFXcBOq1434Q5d3piMnsVOXEhMk0MySQIllP/bfUw6vGud
	0mJp7TtKgNq0KgubfNLtR5Akg0vGRjBxLW73on0L2g==
X-Google-Smtp-Source: ABdhPJzLJN+qYozEzQz4G3pucxfA9BKQJ8B2bDBEeDHB5sIEzgJRDkQpP0iVNBhtpmdi/dHQfGoa28HPCL5HUVirJAw=
X-Received: by 2002:a17:907:1b1c:: with SMTP id
	mp28mr2137509ejc.624.1644415702501; 
	Wed, 09 Feb 2022 06:08:22 -0800 (PST)
MIME-Version: 1.0
References: <20220209082828.2629273-1-hch@lst.de>
	<20220209082828.2629273-4-hch@lst.de>
	<CAMGffE=GMYNsw+mDt1h-BDh3JXkdrP9v2AUF7z0xE7jkumM+RQ@mail.gmail.com>
	<20220209140448.GA20765@lst.de>
In-Reply-To: <20220209140448.GA20765@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 9 Feb 2022 15:08:11 +0100
Message-ID: <CAMGffEm5qivscB8r+koGL7-bVxUOPr6=wLH6-RfHqzp8u2+HMw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: axboe@kernel.dk, manoj@linux.ibm.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, philipp.reisner@linbit.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	target-devel@vger.kernel.org, haris.iqbal@ionos.com,
	ukrishn@linux.ibm.com, lars.ellenberg@linbit.com,
	drbd-dev@lists.linbit.com, mrochs@linux.ibm.com
Subject: Re: [Drbd-dev] [PATCH 3/7] rnbd: drop WRITE_SAME support
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

On Wed, Feb 9, 2022 at 3:04 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Feb 09, 2022 at 11:16:13AM +0100, Jinpu Wang wrote:
> > Hi Christoph,
> >
> >
> > On Wed, Feb 9, 2022 at 9:28 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > REQ_OP_WRITE_SAME was only ever submitted by the legacy Linux zeroing
> > > code, which has switched to use REQ_OP_WRITE_ZEROES long before rnbd was
> > > even merged.
> >
> > Do you think if it makes sense to instead of removing
> > REQ_OP_WRITE_SAME, simply convert it to REQ_OP_WRITE_ZEROES?
>
> Well, they have different semantics, so you can't just "convert" it.
> But it might make sense to add REQ_OP_WRITE_ZEROES.
Thanks, we will add support for REQ_OP_WRITE_ZEROES later.

For this patch, I've run internal tests, works fine.

Acked-by: Jack Wang <jinpu.wang@ionos.com>
Thanks!
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
