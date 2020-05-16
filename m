Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id E52D01F827C
	for <lists+drbd-dev@lfdr.de>; Sat, 13 Jun 2020 12:12:48 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C563C420409;
	Sat, 13 Jun 2020 12:12:48 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9542E420416
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 11:58:02 +0200 (CEST)
Received: by mail-wr1-f65.google.com with SMTP id l11so12301024wru.0
	for <drbd-dev@lists.linbit.com>; Sat, 13 Jun 2020 02:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:resent-from:resent-date:resent-message-id
	:resent-to:dkim-signature:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=TG5YZgmRlXVS7HvhJz7DOFxKZzjqL5DT1HxTsi4ato4=;
	b=M57iQNjtub4kEIPFrSCPXPO2Xekz9g6so59/rp8GLKuE6NPaMb6dOdWFiJrQ42ihS2
	+k5/GcDpwZAoxMMa0//8EXW2NqJ2E7TJFRmpsh4A0ICmBVp3L2FHoK3+bv1VvT7f842w
	NOrLrbTA/fFWrHEHgvNXz3c/zRgf/k+aoXpzPXnZ0ztlnW6FrclcwytBX5o1ieACbnZh
	Y+D3ZVr88nT0ipv0IBOg6OrZvlTWSl9AtZuDs6iiQfPykiR7wNs4/XnGc/jtkwFJBsMC
	DVshmoNAHfiIbUgz1DctgozI6se6eI3J9cyZmZVjloG03Y0gIZpRuC2ItMRydTW16CVo
	3tPQ==
X-Gm-Message-State: AOAM5314V5kb645tl8t0+NDSItZl0reSkONJF2bMKj8ATd/W5Vo9xJIr
	EBiOIs9Ejd+rXmm+EfwSkD0lt9PqERpu/I4s
X-Google-Smtp-Source: ABdhPJyZD9lgMjpibEeEcOT6VBFBkM/3pJKbpOd0ZTvFZbkqftJcmV5b7UZ/7HakKwnOXXYTPhriXQ==
X-Received: by 2002:a5d:44c6:: with SMTP id z6mr18901694wrr.20.1592042282000; 
	Sat, 13 Jun 2020 02:58:02 -0700 (PDT)
Received: from soda.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	w10sm14277432wrp.16.2020.06.13.02.58.01
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 13 Jun 2020 02:58:01 -0700 (PDT)
Resent-From: Lars Ellenberg <lars.ellenberg@linbit.com>
Resent-Date: Sat, 13 Jun 2020 11:57:59 +0200
Resent-Message-ID: <20200613095759.GJ4222@soda.linbit>
Resent-To: drbd-dev@lists.linbit.com
X-Original-To: drbd-dev@lists.linbit.com
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 0A9E9420105
	for <drbd-dev@lists.linbit.com>; Sat, 16 May 2020 17:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TG5YZgmRlXVS7HvhJz7DOFxKZzjqL5DT1HxTsi4ato4=;
	b=RnggIlJMvxkkVJkInT4pqpaVSA
	SmN+fQmJr6rXEhoA27zDDtoVe3MfLbqyOGnjbFroFdUEa2bz7T8LXqJhdZ04Kn8zUaw7zqnqucvEE
	jylJg+5o3OTrPcU/9WnNB5DHJG6s2r/4zP/X7rBAVxQdC6M19CKb7CjJPN7ckvsf+3VEUSWXTjPOs
	h4KyUBqEslvU/z84GxRvc0uH9xKOs7/moDDDKZUR3/JC6le8XeM7SlwM6eCF1D2ew/AfzjZ81WeGR
	TID2vSDI6gItLhZe+n8N/K+Igbx6wbsz1MCCu7X4o5NOmt5PKestOUG7qfbgkfaJZ9h4Kw4hb2rBr
	xNF175SA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1jZyrs-000842-U1; Sat, 16 May 2020 15:36:52 +0000
Date: Sat, 16 May 2020 08:36:52 -0700
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <David.Laight@aculab.com>
Message-ID: <20200516153652.GM16070@bombadil.infradead.org>
References: <20200514062820.GC8564@lst.de>
	<20200513062649.2100053-1-hch@lst.de>
	<20200513062649.2100053-28-hch@lst.de>
	<20200513180058.GB2491@localhost.localdomain>
	<129070.1589556002@warthog.procyon.org.uk>
	<05d946ae948946158dbfcbc07939b799@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05d946ae948946158dbfcbc07939b799@AcuMS.aculab.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	'David Howells' <dhowells@redhat.com>,
	"linux-sctp@vger.kernel.org" <linux-sctp@vger.kernel.org>,
	"target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
	"linux-afs@lists.infradead.org" <linux-afs@lists.infradead.org>,
	"drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
	"linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>,
	"rds-devel@oss.oracle.com" <rds-devel@oss.oracle.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
	"linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>,
	Neil Horman <nhorman@tuxdriver.com>,
	Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Vlad Yasevich <vyasevich@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Jon Maloy <jmaloy@redhat.com>, Ying Xue <ying.xue@windriver.com>,
	"David S. Miller" <davem@davemloft.net>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Drbd-dev] [Ocfs2-devel] [PATCH 27/33] sctp: export
	sctp_setsockopt_bindx
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

On Sat, May 16, 2020 at 03:11:40PM +0000, David Laight wrote:
> From: David Howells
> > Sent: 15 May 2020 16:20
> > Christoph Hellwig <hch@lst.de> wrote:
> > 
> > > > The advantage on using kernel_setsockopt here is that sctp module will
> > > > only be loaded if dlm actually creates a SCTP socket.  With this
> > > > change, sctp will be loaded on setups that may not be actually using
> > > > it. It's a quite big module and might expose the system.
> > >
> > > True.  Not that the intent is to kill kernel space callers of setsockopt,
> > > as I plan to remove the set_fs address space override used for it.
> > 
> > For getsockopt, does it make sense to have the core kernel load optval/optlen
> > into a buffer before calling the protocol driver?  Then the driver need not
> > see the userspace pointer at all.
> > 
> > Similar could be done for setsockopt - allocate a buffer of the size requested
> > by the user inside the kernel and pass it into the driver, then copy the data
> > back afterwards.
> 
> Yes, it also simplifies all the compat code.
> And there is a BPF test in setsockopt that also wants to
> pass on a kernel buffer.
> 
> I'm willing to sit and write the patch.
> Quoting from a post I made later on Friday.
> 
> Basically:
> 
> This patch sequence (to be written) does the following:
> 
> Patch 1: Change __sys_setsockopt() to allocate a kernel buffer,
>          copy the data into it then call set_fs(KERNEL_DS).
>          An on-stack buffer (say 64 bytes) will be used for
>          small transfers.
> 
> Patch 2: The same for __sys_getsockopt().
> 
> Patch 3: Compat setsockopt.
> 
> Patch 4: Compat getsockopt.
> 
> Patch 5: Remove the user copies from the global socket options code.
> 
> Patches 6 to n-1; Remove the user copies from the per-protocol code.
> 
> Patch n: Remove the set_fs(KERNEL_DS) from the entry points.
> 
> This should be bisectable.

I appreciate your dedication to not publishing the source code to
your kernel module, but Christoph's patch series is actually better.
It's typesafe rather than passing void pointers around.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
