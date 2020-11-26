Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EADC2C6056
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Nov 2020 08:09:17 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id DBB274207C8;
	Fri, 27 Nov 2020 08:09:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
	[209.85.219.176])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 2887542061B
	for <drbd-dev@lists.linbit.com>; Thu, 26 Nov 2020 18:05:57 +0100 (CET)
Received: by mail-yb1-f176.google.com with SMTP id t33so2217225ybd.0
	for <drbd-dev@lists.linbit.com>; Thu, 26 Nov 2020 09:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=O/jaIJrbif54isUECHds/J8Ujq0NdoNxUTCCwJWwQ80=;
	b=YymqsvqKytU8xghgrWvO9q2MBm/qo/QfMLfSKpWw4/r/4uRHhZxuPq9ek+nW3ctzYi
	vs3zi1yLEuFoGUDgrnF15wpJAK9RqJ1aO9sTXa0PjOzjLe+d4O/pTFiiO013Mx2qKoL4
	SkUMUUIjag5bjqwHGLYc9f20TwOaOWbGTale/6i8ahvnaZymX26ArF3ReuQKFVdof495
	iKDDkr6mQvIIbdynQAd2wxd2GUAuBku/vDm4jIdtOw4Ph7wkJ5rD2TxigEVm3yQ5C9tu
	pJCfZKqtAfLebSyeKrm6VDCN2G4oKvj4TFU9uFOnavPNoLjuB5eIt+ODZ6yyvDDDthAD
	GeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=O/jaIJrbif54isUECHds/J8Ujq0NdoNxUTCCwJWwQ80=;
	b=iGmWgOhBpZUFBfk0MejixPF1jZfBwP/mSOpEWYSiVqHcY4Sqb5/U8QFcKH3jkUqj8Q
	hXFkHf5ilYvElBm/+446ONRUbq4GlL4PGnRdET5HRBWItnX3pN915OltIhV4dTB06cud
	oapH7LCPIj/QyQj/KYbuNK1KM5YImcHGrVwuSitSJZEDKirdu1AN9BuEnEKYjgfK4kXe
	+O/r3Me5QC2Z7g5735vB/bWsr8bRfT584wnc569OYhTnXk9abQGxzZFdiEM6j1lKi7PO
	wHPSutdVZ707He0yxZZM6dKH+t2p9luDDNZCrVM+AiKHpYdANP1pyXyS3+TGzB3SsZHn
	VSOg==
X-Gm-Message-State: AOAM531aSon5Kwz9+bwCjCmIO3gPD5SBKEz+dokoCjLuiAk/xqpJbnib
	gUFSKZQ7lNwMBFhtDWBLf1O5LLcTdUAvq/JBCp4=
X-Google-Smtp-Source: ABdhPJxMy5ncXEZ6TSWkZ0cAXTnkQ7iw+jjdg+cNNUWTZPlZcmFMrQQcJd2JAoeBontKFrtwmzLazAacI3fdsjx9xvQ=
X-Received: by 2002:a5b:40e:: with SMTP id m14mr4835621ybp.33.1606410357153;
	Thu, 26 Nov 2020 09:05:57 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
	<1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
	<CANiq72m22Jb5_+62NnwX8xds2iUdWDMAqD8PZw9cuxdHd95W0A@mail.gmail.com>
	<fc45750b6d0277c401015b7aa11e16cd15f32ab2.camel@HansenPartnership.com>
	<CANiq72k5tpDoDPmJ0ZWc1DGqm+81Gi-uEENAtvEs9v3SZcx6_Q@mail.gmail.com>
	<4993259d01a0064f8bb22770503490f9252f3659.camel@HansenPartnership.com>
	<CANiq72kqO=bYMJnFS2uYRpgWATJ=uXxZuNUsTXT+3aLtrpnzvQ@mail.gmail.com>
	<44005bde-f6d4-5eaa-39b8-1a5efeedb2d3@gmail.com>
	<CANiq72nobq=ptWK-qWxU91JHqkKhMcRtJNnw2XJd5-vSJWZd8Q@mail.gmail.com>
	<CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
In-Reply-To: <CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Nov 2020 18:05:45 +0100
Message-ID: <CANiq72=n4rVvmKt0RCb5aOfQydA8bgDxfntRLDieV8Q2efP8Zg@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Mailman-Approved-At: Fri, 27 Nov 2020 08:09:08 +0100
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
	bridge@lists.linux-foundation.org,
	target-devel <target-devel@vger.kernel.org>, linux-iio@vger.kernel.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	virtualization@lists.linux-foundation.org,
	linux-ide@vger.kernel.org, dm-devel@redhat.com, keyrings@vger.kernel.org,
	MTD Maling List <linux-mtd@lists.infradead.org>,
	linux-hardening@vger.kernel.org, wcn36xx@lists.infradead.org,
	linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, Lars Ellenberg <drbd-dev@lists.linbit.com>,
	driverdevel <devel@driverdev.osuosl.org>,
	linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
	scsi <linux-scsi@vger.kernel.org>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, oss-drivers@netronome.com,
	linux-atm-general@lists.sourceforge.net,
	ceph-devel <ceph-devel@vger.kernel.org>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	linux-input <linux-input@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	NetFilter <netfilter-devel@vger.kernel.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	GR-Linux-NIC-Dev@marvell.com, Kees Cook <keescook@chromium.org>,
	selinux@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	linux-sctp@vger.kernel.org, reiserfs-devel@vger.kernel.org,
	linux-geode@lists.infradead.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org, linux-block@vger.kernel.org,
	GR-everest-linux-l2@marvell.com, xen-devel@lists.xenproject.org,
	Nouveau Dev <nouveau@lists.freedesktop.org>, linux-hams@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>, linux-can@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
	Linux-MM <linux-mm@kvack.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, samba-technical@lists.samba.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Edward Cree <ecree.xilinx@gmail.com>,
	linux-security-module <linux-security-module@vger.kernel.org>,
	USB list <linux-usb@vger.kernel.org>,
	tipc-discussion@lists.sourceforge.net,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	patches@opensource.cirrus.com, Joe Perches <joe@perches.com>,
	linux-mediatek@lists.infradead.org,
	linux-integrity <linux-integrity@vger.kernel.org>,
	"open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>
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

On Thu, Nov 26, 2020 at 4:28 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> The maintainer is not necessarily the owner/author of the code, and
> thus may not know the intent of the code.

Agreed, I was not blaming maintainers -- just trying to point out that
the problem is there :-)

In those cases, it is still very useful: we add the `fallthrough` and
a comment saying `FIXME: fallthrough intended? Figure this out...`.
Thus a previous unknown unknown is now a known unknown. And no new
unknown unknowns will be introduced since we enabled the warning
globally.

> BTW, you cannot mindlessly fix the latter, as you cannot know if
> "(a == b)" or "((a = b))" was intended, without understanding the code
> (and the (possibly unavailable) data sheet, and the hardware, ...).

That's right, I was referring to the cases where the compiler saves
someone time from a typo they just made.

Cheers,
Miguel
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
