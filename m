Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 7550E2C3A62
	for <lists+drbd-dev@lfdr.de>; Wed, 25 Nov 2020 08:55:30 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3A8DF4207BA;
	Wed, 25 Nov 2020 08:55:24 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5A35E420168
	for <drbd-dev@lists.linbit.com>; Wed, 25 Nov 2020 00:46:35 +0100 (CET)
Received: by mail-qk1-f193.google.com with SMTP id u184so1224693qkf.3
	for <drbd-dev@lists.linbit.com>; Tue, 24 Nov 2020 15:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=H+rGPaoJ9R3rr7zK4cuxMwlBlLpdlGUAwlQnvIZjZd8=;
	b=rGjC6KnGzC9NIfLo6IfoTM7C5TiZmv4q08vYNRt8cewMWpFhbX886WW47/gIiopas/
	e2jKhT73QJs/dRAIbILcJdQSFnVW9dal1rOBoIKd0ECBe+nqcukIgJrBRfX2wbZlPbrR
	27L+0GE9CXpbAta7TZEIdoDweQHp+sEvmypYMH9hyutdrnRkkklGbspFfFiZY+HYfDHj
	jsH/8tjPy+0JiTdJWitSDoQxXZntWXoEWL0cWLR+fmdpM332GBoSCjfuWUHY88IWDiPh
	04ztpEPYlCjpB7IXy1yQhW/otwe7DgKcwtOpyIrk5XdAw3ZKiOAkll08YWpT8S+NhzMx
	e/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=H+rGPaoJ9R3rr7zK4cuxMwlBlLpdlGUAwlQnvIZjZd8=;
	b=ZJikHk6a2I9kwfm9YJkoK2tQbNhkAQwH5CDKq8xGzzRrh35xWKARIpOGU7mzovYc9Y
	GfjtMo6WsTBEh3L/tmLP7MHtznMOjUP7OoZ74ZDPAP9OJDFfxEHfcnGjaozhjQSTZZ8E
	ksY7BYIUukSSKfKXZDiCKyc91hhqrfz0IlazL8yPbOAKdzKCvY+adR5gPpDtz4LUJiwm
	uD16q56wil1B9iVAHxXgXvFwjjtMr/J3Otwbm/w+og6d70DoD+rvAcbLtRcwIsAMlR+V
	y3CYkmUVIg5SKLZiIob/9VMrS5ek0XCPPB2cstGRSfbeyT7LSNqBcylGLsnoTk8aR9Jb
	I5YA==
X-Gm-Message-State: AOAM533pRrLLsJ1af9KsZDjJ98s+1faoOB2+9CVFKHmyGSc25+WFaYda
	4ck62aL/4PCX8t58j4x/1U9V4dfu/tWWY7TlW/E=
X-Google-Smtp-Source: ABdhPJzOwu2wFsHHn8A1YNPfZeoFLdmnMgNDFogUYxSXdSyfkKR4RJ+IXZpEdbdh4p7RHhstmUROclNZOq0Hltp8jFg=
X-Received: by 2002:a5b:40e:: with SMTP id m14mr627984ybp.33.1606261594309;
	Tue, 24 Nov 2020 15:46:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
	<alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
	<CANiq72=z+tmuey9wj3Kk7wX5s0hTHpsQdLhAqcOVNrHon6xn5Q@mail.gmail.com>
	<alpine.LNX.2.23.453.2011241036520.7@nippy.intranet>
In-Reply-To: <alpine.LNX.2.23.453.2011241036520.7@nippy.intranet>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Nov 2020 00:46:23 +0100
Message-ID: <CANiq72=Ybm2MHmOizo1xQ_QYGuvbthtnLbwCkr8AFb8PcfmuQw@mail.gmail.com>
To: Finn Thain <fthain@telegraphics.com.au>
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:55:20 +0100
Cc: linux-watchdog@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-atm-general@lists.sourceforge.net,
	reiserfs-devel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
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
	linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	GR-Linux-NIC-Dev@marvell.com, Kees Cook <keescook@chromium.org>,
	selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
	linux-can@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-mediatek@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, xen-devel@lists.xenproject.org,
	nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
	ceph-devel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org, linux-block@vger.kernel.org,
	linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
	Linux-MM <linux-mm@kvack.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
	linux-integrity@vger.kernel.org, target-devel@vger.kernel.org
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

On Tue, Nov 24, 2020 at 1:58 AM Finn Thain <fthain@telegraphics.com.au> wrote:
>
> What I meant was that you've used pessimism as if it was fact.

"future mistakes that it might prevent" is neither pessimism nor states a fact.

> For example, "There is no way to guess what the effect would be if the
> compiler trained programmers to add a knee-jerk 'break' statement to avoid
> a warning".

It is only knee-jerk if you think you are infallible.

> Moreover, what I meant was that preventing programmer mistakes is a
> problem to be solved by development tools

This warning comes from a development tool -- the compiler.

> The idea that retro-fitting new
> language constructs onto mature code is somehow necessary to "prevent
> future mistakes" is entirely questionable.

The kernel is not a frozen codebase.

Further, "mature code vs. risk of change" arguments don't apply here
because the semantics of the program and binary output isn't changing.

> Sure. And if you put -Wimplicit-fallthrough into the Makefile and if that
> leads to well-intentioned patches that cause regressions, it is partly on
> you.

Again: adding a `fallthrough` does not change the program semantics.
If you are a maintainer and want to cross-check, compare the codegen.

> Have you ever considered the overall cost of the countless
> -Wpresume-incompetence flags?

Yeah: negative. On the other hand, the overall cost of the countless
-fI-am-infallible flags is very noticeable.

> Perhaps you pay the power bill for a build farm that produces logs that
> no-one reads? Perhaps you've run git bisect, knowing that the compiler
> messages are not interesting? Or compiled software in using a language
> that generates impenetrable messages? If so, here's a tip:
>
> # grep CFLAGS /etc/portage/make.conf
> CFLAGS="... -Wno-all -Wno-extra ..."
> CXXFLAGS="${CFLAGS}"
>
> Now allow me some pessimism: the hardware upgrades, gigawatt hours and
> wait time attributable to obligatory static analyses are a net loss.

If you really believe compiler warnings and static analysis are
useless and costly, I think there is not much point in continuing the
discussion.

> No, it's not for me to prove that such patches don't affect code
> generation. That's for the patch author and (unfortunately) for reviewers.

I was not asking you to prove it. I am stating that proving it is very easy.

Cheers,
Miguel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
