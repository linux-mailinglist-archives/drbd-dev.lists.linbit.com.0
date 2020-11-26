Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EED2C6054
	for <lists+drbd-dev@lfdr.de>; Fri, 27 Nov 2020 08:09:15 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 25F374207C0;
	Fri, 27 Nov 2020 08:09:12 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 29E914207A7
	for <drbd-dev@lists.linbit.com>; Thu, 26 Nov 2020 16:28:24 +0100 (CET)
Received: by mail-ot1-f68.google.com with SMTP id g19so2128903otp.13
	for <drbd-dev@lists.linbit.com>; Thu, 26 Nov 2020 07:28:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kP9MspVOPl/NnVl8oGn1EIC/+F8CcK5+OXo+jY56Nno=;
	b=jkxLrCFv+9dSB2tOLboiQhO2z2jFIG5lOllqPpKYC+POaKBl60jHsor576lp69jLuF
	e8p7Y+EZNrFJEbrEoPaI/4A+p2uzysiB6+rriicZopkAWanW7Zf2ffiTq9puPeq3C9Lj
	WrPctkj+Xu9/iYRbD/q3w6LsLs//KSBzJOWhO2BnC40LNF/3aBWsg88vR0E1+DLZR3QH
	vuJjOm+jgESA6aaqlg+K/3dSuzeys2Gr/TW+uO2qRal0KpSwoEe1VkYDKBZqzQT0HUv8
	US31rpn706fRQebWkLPXOIx2h2Ih7v1cR1KyHbbYIKC3hzJ93+Hn5ZWmiIjTfmayHWrY
	BHhg==
X-Gm-Message-State: AOAM531AZD8qMmoWTaV/uqKmJ6vjjW1M+ulDA9JWMiDqwtfuv4m+foW8
	iWzScaktYn4XDGDtJLeLkxd6CD4lGWJ3HjlU6zI=
X-Google-Smtp-Source: ABdhPJyYtol6dSfaI6WhgTcuunq7fhBuSULViECyA4Z+K27bCejCuaia55DZ/aziu9dD69JTQZlYwW/4z6Mu7Di+rU4=
X-Received: by 2002:a05:6830:210a:: with SMTP id
	i10mr2551843otc.145.1606404504116; 
	Thu, 26 Nov 2020 07:28:24 -0800 (PST)
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
In-Reply-To: <CANiq72nobq=ptWK-qWxU91JHqkKhMcRtJNnw2XJd5-vSJWZd8Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Nov 2020 16:28:12 +0100
Message-ID: <CAMuHMdV5kOakvZJMWLxbpigFPS+Xuw6DVYsWCWZy7wGsv3idcw@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

Hi Miguel,

On Thu, Nov 26, 2020 at 3:54 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, Nov 25, 2020 at 11:44 PM Edward Cree <ecree.xilinx@gmail.com> wrote:
> > To make the intent clear, you have to first be certain that you
> >  understand the intent; otherwise by adding either a break or a
> >  fallthrough to suppress the warning you are just destroying the
> >  information that "the intent of this code is unknown".
>
> If you don't know what the intent of your own code is, then you
> *already* have a problem in your hands.

The maintainer is not necessarily the owner/author of the code, and
thus may not know the intent of the code.

> > or does it flag up code
> >  that can be mindlessly "fixed" (in which case the warning is
> >  worthless)?  Proponents in this thread seem to be trying to
> >  have it both ways.
>
> A warning is not worthless just because you can mindlessly fix it.
> There are many counterexamples, e.g. many
> checkpatch/lint/lang-format/indentation warnings, functional ones like
> the `if (a = b)` warning...

BTW, you cannot mindlessly fix the latter, as you cannot know if
"(a == b)" or "((a = b))" was intended, without understanding the code
(and the (possibly unavailable) data sheet, and the hardware, ...).

P.S. So far I've stayed out of this thread, as I like it if the compiler
     flags possible mistakes.  After all I was the one fixing new
     "may be used uninitialized" warnings thrown up by gcc-4.1, until
     (a bit later than) support for that compiler was removed...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
