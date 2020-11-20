Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 119632BFFEE
	for <lists+drbd-dev@lfdr.de>; Mon, 23 Nov 2020 07:21:57 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 791C14207A8;
	Mon, 23 Nov 2020 07:21:53 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7142F420334
	for <drbd-dev@lists.linbit.com>; Fri, 20 Nov 2020 20:51:49 +0100 (CET)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
	[163.114.132.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ADA4D206B6;
	Fri, 20 Nov 2020 19:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605901908;
	bh=RBzOhaxiAPO90htsWQNreeN48VhmFALIIs8F+S8F2tg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0HJ898xky9A4AiX47c8E/kv2vloKTCLDsa1B08r0Ns0UI6ViLC8sEEmzvLmSWmHDR
	rh+QM7asV5JMfRqDaW/zMVHUMAG8pWVLOHT3LXTHM6aAp9QNwMcpVcVlrfF8wRUqJ9
	pWgdeTKSVxQ+8c5KHivLBQCp2OjpIRpNZteZuQdk=
Date: Fri, 20 Nov 2020 11:51:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Kees Cook <keescook@chromium.org>
Message-ID: <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <202011201129.B13FDB3C@keescook>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 07:21:47 +0100
Cc: alsa-devel@alsa-project.org, linux-atm-general@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-hardening@vger.kernel.org, wcn36xx@lists.infradead.org,
	samba-technical@lists.samba.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	usb-storage@lists.one-eyed-alien.net, drbd-dev@lists.linbit.com,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, Nick Desaulniers <ndesaulniers@google.com>,
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
	linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	tipc-discussion@lists.sourceforge.net,
	linux-ext4@vger.kernel.org, linux-media@vger.kernel.org,
	GR-Linux-NIC-Dev@marvell.com, linux-watchdog@vger.kernel.org,
	selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
	linux-can@vger.kernel.org, linux-block@vger.kernel.org,
	linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-mediatek@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, xen-devel@lists.xenproject.org,
	nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
	ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, x86@kernel.org,
	linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	netdev@vger.kernel.org, linux-decnet-user@lists.sourceforge.net,
	linux-mmc@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
	linux-crypto@vger.kernel.org, patches@opensource.cirrus.com,
	Joe Perches <joe@perches.com>, linux-integrity@vger.kernel.org,
	target-devel@vger.kernel.org
Subject: Re: [Drbd-dev] [PATCH 000/141] Fix fall-through warnings for Clang
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

On Fri, 20 Nov 2020 11:30:40 -0800 Kees Cook wrote:
> On Fri, Nov 20, 2020 at 10:53:44AM -0800, Jakub Kicinski wrote:
> > On Fri, 20 Nov 2020 12:21:39 -0600 Gustavo A. R. Silva wrote:  
> > > This series aims to fix almost all remaining fall-through warnings in
> > > order to enable -Wimplicit-fallthrough for Clang.
> > > 
> > > In preparation to enable -Wimplicit-fallthrough for Clang, explicitly
> > > add multiple break/goto/return/fallthrough statements instead of just
> > > letting the code fall through to the next case.
> > > 
> > > Notice that in order to enable -Wimplicit-fallthrough for Clang, this
> > > change[1] is meant to be reverted at some point. So, this patch helps
> > > to move in that direction.
> > > 
> > > Something important to mention is that there is currently a discrepancy
> > > between GCC and Clang when dealing with switch fall-through to empty case
> > > statements or to cases that only contain a break/continue/return
> > > statement[2][3][4].  
> > 
> > Are we sure we want to make this change? Was it discussed before?
> > 
> > Are there any bugs Clangs puritanical definition of fallthrough helped
> > find?
> > 
> > IMVHO compiler warnings are supposed to warn about issues that could
> > be bugs. Falling through to default: break; can hardly be a bug?!  
> 
> It's certainly a place where the intent is not always clear. I think
> this makes all the cases unambiguous, and doesn't impact the machine
> code, since the compiler will happily optimize away any behavioral
> redundancy.

If none of the 140 patches here fix a real bug, and there is no change
to machine code then it sounds to me like a W=2 kind of a warning.

I think clang is just being annoying here, but if I'm the only one who
feels this way chances are I'm wrong :)
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
