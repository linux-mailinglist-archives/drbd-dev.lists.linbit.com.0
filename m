Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [37.27.211.0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7AEAB98AF
	for <lists+drbd-dev@lfdr.de>; Fri, 16 May 2025 11:23:12 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id D24CE16B8CE;
	Fri, 16 May 2025 11:23:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 31F8B16B8CE
	for <drbd-dev@lists.linbit.com>; Fri, 16 May 2025 11:23:04 +0200 (CEST)
Received: by mail-wm1-f45.google.com with SMTP id
	5b1f17b1804b1-43cf257158fso13487425e9.2
	for <drbd-dev@lists.linbit.com>; Fri, 16 May 2025 02:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linbit-com.20230601.gappssmtp.com; s=20230601; t=1747387384;
	x=1747992184; darn=lists.linbit.com; 
	h=in-reply-to:content-disposition:mime-version:references
	:mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
	:date:message-id:reply-to;
	bh=LjW28cuEw17S0sGEzhwyHcHNmOnhwQGfPi8UdEB9LRU=;
	b=EbColzT59N0ocPlV2n71tC/i7+IBY1tGEexFROX5bMMpO/133ZmbDJ+w6uzzl2Lguu
	qZEh3iXvLXQ5b22LjRWSq/dgCjlXiDnVJHtyOFzZJjnIb79o4280xmkcO4LDw9rfk2GV
	LTKnM8lr12qDeZCIDLURKOAQ6sC1dNAiwCa3NEhgvYj64NEpVfN52fBvuUZ3yPGWMaqq
	rxuXbBbnnqA3NH+roxpgL1GNB1qrugPpFnxnqiWgHA+fsAY5UIu/lFzqHOvWPJunUx30
	MgzZN3tfCC+425yeRcEPR0wxyhEoJad2OVGji7YovJdKIeZjGCcEg+5B6bYRuXNPOAIC
	s4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20230601; t=1747387384; x=1747992184;
	h=in-reply-to:content-disposition:mime-version:references
	:mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
	:from:to:cc:subject:date:message-id:reply-to;
	bh=LjW28cuEw17S0sGEzhwyHcHNmOnhwQGfPi8UdEB9LRU=;
	b=rm+iPhkUl0LCuzos21e+8O0/EMZdx0QkACrQs3f/tnT4rbzxSd1IY6PuIafRGpaxyh
	zQJOW81sED0Z7bRtZ7iH5bdVfmefPK/o1h5V4Vs+By6r7r4enypIHs8hrtobdmWBzFZT
	yQnOQ1mbK+d6j+gBaowZh+4EDccJ6mWH3eTcgAJdO78bPOheY3HIlWn/8S5YyNZMcsg3
	bwrzJdofpLLERvl9yrsFfsp5tf4CzWzTKxh/xIq88S9PRr22tfviMKrZ1Xk2UglQrwIo
	RvPKljttrOWh/ox+zatKDR4L5Egy3VKZK1bIx/MHO/OV5f5OYuvtAZQLyQEyVJJ3o3lY
	tK4A==
X-Gm-Message-State: AOJu0YwSQHNVhCUlaDbBsbOnur/vCm5QjQ0VjQzfH576fQWWT0LHDPn3
	AKDyJuYLnfwDGkpLcS7gmteasPCNNJJsFyesGEIznwf6YGQrQxCvmXP1Qkz2WzYZWpUlH71+ihM
	MQEj8clo=
X-Gm-Gg: ASbGncspUe8nqCFK2DL8iXT0P5oemDCJyNHwvbMj02e8rywwZGKY46FdmqOV71r9usW
	4sOnJprW0PP3bX6AyhpBe1Cd24vFFBPLE+bhgA94jh4jMAZV1o7tEpC9wjuLiu9fiJDYo6QriTb
	HjspNDaXAaCmtle675mwPQrdGfnIqxhK5QEZOOkGSuYcez5JEx8mJkys6+uBuJICq9JDg2CBCy8
	/CO6j3cZ/n/uPt0Ja+vHNLkeW1FNrY0h7o2OaSZRfOpIBkpEgT/HYUQVRdyJHMVMT2nRUvg9/HE
	gfspCECHcQB8X96yNIRiKw/kaLAHKnWkgg4brq3GAC5nAieWbdIDVX+9cfH3Ltxtf7c1FuIAlah
	5TaGTSoI98yR1XycrmI5nlJo=
X-Google-Smtp-Source: AGHT+IFEsCWJ67S+bifXOteF0dVex4pcFlwBpVzxm86A1MH4oI8bZq2mNMbGENLfYCjNNxdULEtl1A==
X-Received: by 2002:a05:600c:c05:b0:440:94a2:95b8 with SMTP id
	5b1f17b1804b1-442feffc03dmr19409695e9.16.1747387383631; 
	Fri, 16 May 2025 02:23:03 -0700 (PDT)
Received: from grappa.linbit (62-99-137-214.static.upcbusiness.at.
	[62.99.137.214]) by smtp.gmail.com with ESMTPSA id
	ffacd0b85a97d-3a35ca62c70sm2272636f8f.54.2025.05.16.02.23.02
	for <drbd-dev@lists.linbit.com>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 May 2025 02:23:03 -0700 (PDT)
Date: Fri, 16 May 2025 11:23:01 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
To: drbd-dev@lists.linbit.com
Subject: Re: Possible memory leak in DRBD 8.4.11
Message-ID: <aCcD9VEz0N+Pq05M@grappa.linbit>
Mail-Followup-To: drbd-dev@lists.linbit.com
References: <CANA-72DMWg-UwGBVbM9y-p9zUJu_4LqZk3V9qOEZCM0nSHzq=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANA-72DMWg-UwGBVbM9y-p9zUJu_4LqZk3V9qOEZCM0nSHzq=Q@mail.gmail.com>
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

On Thu, Apr 24, 2025 at 11:22:52AM -0400, Reginald Cirque wrote:
> Good day,
> I was syncing a 300 GB LVM volume from a DRBD primary to a newly-built
> secondary, and noticed that the sending host (primary) had 300G of
> "untracked", used, memory (not visible in slab, cached, or associated
> with any application(s), simply shown as "kernel dynamic memory" in
> "smem -twk" output) for long (many hours) after the sync had
> completed, suggesting that DRBD buffers/page-pool were not reclaimed.
> 
> When I ran "drbdsetup down" to disconnect the secondary, I observed a
> kernel log message:
> "block drbd3: net_ee not empty, killed 291226 entries", which further
> suggests to me that DRBD buffers are not being properly reclaimed.
> 
> The memory was returned back to the system ~instantly after
> disconnecting the secondary.
> 
> I am running Linux kernel 6.1.128-1.el8.x86_64 and patching-in the
> 8.4.11 DRBD module in-tree.

For the broader audience and people finding this via some internet search:

On the receiving end, DRBD uses some "page pool" to do the IO from and to
the backend; these are "attached" to some other struct for that specific
IO request, and may be "recycled" for a later request.

If these pages are used to read in data from the backend and then are
sendpage()d to the peer, the network stack will grab an extra page_count().
Once the network stack no longer needs these pages, it is supposed to bring
that count down again (put_page()).

There is no "signal" from the network stack to track
when they are no longer needed by the network stack,
when it is okay to re-use these pages.
Simplified, DRBD keeps polling when the page_count() falls back to 1,
and then recycles the pages, or gives them back to the system.

All these things are expected to be communicated and processed in order,
so we walk the pages, re-use / re-cycle / give back all for which it
is okay to do so, but stop at the first page we find that appears to be
still in use (page_count() > 1).

We suspect that one of these pages sometimes for some reason
either starts out with a page_count() > 1, therefore never falls back to 1,
or for some reason the network stack keeps holding on to one extra page count,
or "forgets" to put it again. And because we process these in order,
that single "apparently still in use by the network" page keeps us
from processing all pages after it.

On disconnect, we don't care for their order anymore,
we just "kill" (put_page()) all of them.
Which gives back most of them to the system,
save for the few with page_count() > 1 at that time,
but those need to be put back by the entity
that holds on to that ref count.

In short: we don't think DRBD does the leaking, but only exposes
some leaking somewhere else, by making a single page leak obvious.
Because now that "single page leak" somewhere else causes DRBD to
hold on to a lot of pages for a long time.

As a work-around on our side, we may change our page handling here
to just not care, drop our "drbd internal page pool",
and only use the system page allocator (alloc_page(), put_page()) directly.
That way, whatever is holding on to page counts for "unexpectedly long" times
does no longer affect us, does no longer cause us to pile up unrelated pages.

We suspect that whatever is the reason for these "extra" page counts
may have become more visible over time.

Does that explanation make sense so far?

    Lars

