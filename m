Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F265B617B
	for <lists+drbd-dev@lfdr.de>; Mon, 12 Sep 2022 21:08:19 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 361554204BE;
	Mon, 12 Sep 2022 21:08:18 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
	[209.85.210.51])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 72796420311
	for <drbd-dev@lists.linbit.com>; Mon, 12 Sep 2022 21:08:15 +0200 (CEST)
Received: by mail-ot1-f51.google.com with SMTP id
	h9-20020a9d5549000000b0063727299bb4so6523072oti.9
	for <drbd-dev@lists.linbit.com>; Mon, 12 Sep 2022 12:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sourceruckus-org.20210112.gappssmtp.com; s=20210112;
	h=to:subject:message-id:date:from:in-reply-to:references:mime-version
	:from:to:cc:subject:date;
	bh=vli6qwshpGRlfY5aRxWJBCdjCUi+/0D5WU2x1yIxuwI=;
	b=dEct025oOu7NQaljPFY9Qt0M7cK5Iirf9EwGT4T7pKhzMRqwUFIYAyMp2UWCyqyHoz
	2UZpT+yTexygfys7L3xpn1FaEs+2ukuSlSjXQ8EcmmyUKTkwqheeFXxbwgpHgqfy0tZs
	dq4XNB6D4jhbvoGBPaql/AlUi/FKZmUrI1hdB+MTwoLCt9yfDovzJJ++Eg2Zsl+T++tT
	jfg82YREwOTYKr0CjhjYtCUpiwNuZfEMMRu5AXCjImRKmaT0ryR1QD+4l80isEItLX/s
	0fYScMRijRpl2btXqBO96GU/KHRmEGV6yzDWQ3RqdMYDzrifAvGhgNU6jbL5EuI68YfA
	LFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=to:subject:message-id:date:from:in-reply-to:references:mime-version
	:x-gm-message-state:from:to:cc:subject:date;
	bh=vli6qwshpGRlfY5aRxWJBCdjCUi+/0D5WU2x1yIxuwI=;
	b=S7my3PSHN5XxbTiwMGbO5BVrLSpU2Bg+tactqGWHHHKn0jDodiLa/bF8V9XAhnAJIf
	IPdTPvzIR1GXwIOJZNvY84apm2Ys2SCM6udKmyBZHig++BcmT8F7Sbta1DFob0DwdGVd
	zCe+Xzb5zRzHM84Ns93tPGFBfKsUWiHsPh+ZmSyzXDioRIrK9Eu76wn5mIf5RxjiEDjw
	MWJAms1remZBhA5ijsKQ8tcACV3b6qLZ3u4SaVcNcx3xMnGbRKkB8oQhI8Q/cnR6eYjK
	SKdNoVg+S7kUzN3XcIFvd5VzD+QGUIkchuza/8JqR5BQOE9vlAvB6Rux2YxQyZefPsLN
	uXXA==
X-Gm-Message-State: ACgBeo3GGiOiEd40YGJiSkflpoJoAZ8PzllUpo557rp50D17HF1e6KKe
	OcdSPgOnq84gFMkKzpDutwAgYC3D2JSd6fNMvclXbogcOM5EAg==
X-Google-Smtp-Source: AA6agR5YTIVT4hMY0lA5X5Bc3ecTMUVq72XNdbWqOCyrCL9CG9fOH12fDVkWe2LdzqWNRpk2FJzGH6qXaEN/1mFNB4Q=
X-Received: by 2002:a9d:84d:0:b0:654:9b59:b625 with SMTP id
	71-20020a9d084d000000b006549b59b625mr7352535oty.98.1663009694876;
	Mon, 12 Sep 2022 12:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220908211337.17090-1-veggiemike@sourceruckus.org>
	<20220908211337.17090-2-veggiemike@sourceruckus.org>
	<CAGNP_+VfjTkF57HJAk1-MEmJbGbcjVeUEX702awJo+mUE29uuw@mail.gmail.com>
	<Yxs5wZZVMHNAVo4N@grappa.linbit>
In-Reply-To: <Yxs5wZZVMHNAVo4N@grappa.linbit>
From: Michael Labriola <veggiemike@sourceruckus.org>
Date: Mon, 12 Sep 2022 15:08:04 -0400
Message-ID: <CAA1fRFhObGu9GoJDngzORG315t8+q7EBGLj64ThcA6RKhW1pHg@mail.gmail.com>
To: drbd-dev@lists.linbit.com, Lars Ellenberg <lars.ellenberg@linbit.com>, 
	Joel Colledge <joel.colledge@linbit.com>
Subject: Re: [Drbd-dev] [PATCH 1/3] drbd: remove WRITE_SAME support
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

On Fri, Sep 9, 2022 at 9:04 AM Lars Ellenberg <lars.ellenberg@linbit.com> wrote:
>
> On Fri, Sep 09, 2022 at 09:57:23AM +0200, Joel Colledge wrote:
> > Hi Michael,
> >
> > Thanks for the patch!
> >
> > > This commit mimics upstream commit a34592ff6b78, which removes all the
> > > WRITE_SAME code because "REQ_OP_WRITE_SAME was only ever submitted by
> > > the legacy Linux zeroing code, which has switched to use
> > > REQ_OP_WRITE_ZEROES long ago."  WRITE_SAME was then removed from Linux
> > > 5.18.
> >
> > This is an interesting case. If we remove all the write-same code like
> > this, then we either need to add it back in via compat, or we lose a
> > feature. I think it is OK to lose the feature on 5.18+ kernels, since
> > the rest of the kernel does not use it any more. On older kernels this
> > might break real use cases.
> >
> > There is also the case where our peer is running an older kernel and
> > we are running 5.18+. I think we should worry about that after
> > deciding what to do with peers that run the same kernel.
> >
> > I've added Lars to CC because he is more familiar with the historical
> > changes in this area.
> >
> > Note: If we do remove the feature entirely, we should stop advertising
> > the feature flag DRBD_FF_WSAME so that the peer knows that we do not
> > support it.
>
> Problem with that is: I overloaded this "feature flag":
> /* supports REQ_WRITE_SAME on the "wire" protocol.
>  * Note: this flag is overloaded,
>  * its presence also
>  *   - indicates support for 128 MiB "batch bios",
>  *     max discard size of 128 MiB
>  *     instead of 4M before that.
>  *   - indicates that we exchange additional settings in p_sizes
>  *     drbd_send_sizes()/receive_sizes()
>  */

Yeah, I stumbled onto that while on my first cut of this patch...
quickly backpedaled and did as little as possible in case there was
any other unanticipated ripple.

>
> I did that to avoid too much special casing with protocol version numbers,
> we had 8.4 and 9 version ranges, and introduced the feature on both.
>
> Takeaway: do not overload feature flags :-|
>
> My original commit message:
>     drbd: introduce WRITE_SAME support
>
>     We will support WRITE_SAME, if
>      * all peers support WRITE_SAME (both in kernel and DRBD version),
>      * all peer devices support WRITE_SAME
>      * logical_block_size is identical on all peers.
>
>     We may at some point introduce a fallback on the receiving side
>     for devices/kernels that do not support WRITE_SAME,
>     by open-coding a submit loop. But not yet.
>
> I don't think "open code a compat fallback" is useful,
> the only "relevant" usage of WSAME was ZERO-OUT,
> which got its own flag in upstream kernel (and then DRBD) in 2018.
>
> I don't think "WSAME" compat accross 8.4 <-> 9 is something we need to worry
> about, I'm fine with not supporting it or the other things it indicated when
> connecting 8.4 <-> 9, which should only be done temporarily.
> Most of the time a "stop everything; upgrade all nodes; start everything"
> will be more effective and have shorter overall downtime than a rolling upgrade
> one-by-one, moving services by stopping, then starting on an other node.
>
> But actually we do not need to remove the DRBD_FF_WSAME flag, because WSAME
> will not be used even if the feature flag is present, if we don't indicate
> support for it in the p_sizes per "peer device" aka volume.
> we now always report p->qlim->write_same_capable = 0.
>
> ==> I think the patch is okay as is.

Ok, good to hear.  I was a lot less sure of this one than other
"keeping up with mainline" patches I've worked on in the past.

I think I've gotten a little lost regarding the need for a compat
patch, though.  Are you saying that because the only real benefit of
WSAME is now taken care of by ZERO-OUT, there really is no need for a
compat patch to put WSAME back into the drbd9 tree (for pre-5.18
kernels)?

>
> If we want, we can just rename the flag,
> %s/DRBD_FF_WSAME/DRBD_FF_EXTENDED_QLIM/g or something.
>
> Should we want to drop the flag,
> for 9 <-> 9, git log (below) says that we can use PRO_VERSION >= 111
> to indicate "128 MiB batch bio size" and "extended p_sizes".
>
> 2021-07-30 95adb51a1 drbd: Allow reverting resync direction by usind the --discard-my-data flag        #define PRO_VERSION_MAX 121
> 2021-04-14 43a7362fa drbd: new option for "invalidate(-remote)" commands: "--reset-bitmap=no"          #define PRO_VERSION_MAX 120
> 2021-01-25 4f2682e38 drbd: Generalize when resync direction is based on disk states                    #define PRO_VERSION_MAX 119
> 2020-10-16 e595bfc63 drbd: Serialize connects and promotes properly                                    #define PRO_VERSION_MAX 118
> 2020-06-19 1f59029d7 drbd: Send config details, size, data UUIDs, and initial state before first 2pc   #define PRO_VERSION_MAX 117
> 2019-10-23 2f144892f drbd: Allow resync of a re-created peer from day0 UUID                            #define PRO_VERSION_MAX 116
> 2019-05-24 50124b2b9 drbd: introduce P_RS_CANCEL_AHEAD                                                 #define PRO_VERSION_MAX 115
> 2018-07-19 3d98754ed drbd: protocol 114: fix distributed deadlock on secondary activity log            #define PRO_VERSION_MAX 114
> 2018-04-11 6036fafcc drbd: introduce P_ZEROES (REQ_OP_WRITE_ZEROES on the "wire")
> 2018-03-13 d987c27a7 drbd: Automatically resolve split-brain in a specific case with quorum            #define PRO_VERSION_MAX 113
> 2016-08-29 6708bd087 drbd: two-phase resize                                                            #define PRO_VERSION_MAX 112
> 2016-01-28 399b81433 fixed resize for multiple nodes                                                   #define PRO_VERSION_MAX 111
> 2015-12-04 aeee107ec drbd: introduce WRITE_SAME support
> 2012-01-24 6a4b0c000 drbd: Implement cluster-wide state changes using two-phase commit                 #define PRO_VERSION_MAX 110
>
> _______________________________________________
> drbd-dev mailing list
> drbd-dev@lists.linbit.com
> https://lists.linbit.com/mailman/listinfo/drbd-dev
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
