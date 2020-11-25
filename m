Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF42C4EF4
	for <lists+drbd-dev@lfdr.de>; Thu, 26 Nov 2020 07:47:13 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 039E74207A2;
	Thu, 26 Nov 2020 07:47:11 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
	[98.124.60.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 52717420313
	for <drbd-dev@lists.linbit.com>; Thu, 26 Nov 2020 00:21:58 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by kvm5.telegraphics.com.au (Postfix) with ESMTP id 414EA2A490;
	Wed, 25 Nov 2020 18:21:54 -0500 (EST)
Date: Thu, 26 Nov 2020 10:21:54 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Nick Desaulniers <ndesaulniers@google.com>
In-Reply-To: <CAKwvOdna5Zj_O=sB7Q0jHZX0BJSaakX=ZyftwQ_3=L3-ZB54XQ@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2011260918510.6@nippy.intranet>
References: <202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<ca071decb87cc7e905411423c05a48f9fd2f58d7.camel@perches.com>
	<0147972a72bc13f3629de8a32dee6f1f308994b5.camel@HansenPartnership.com>
	<d8d1e9add08cdd4158405e77762d4946037208f8.camel@perches.com>
	<dbd2cb703ed9eefa7dde9281ea26ab0f7acc8afe.camel@HansenPartnership.com>
	<20201123130348.GA3119@embeddedor>
	<8f5611bb015e044fa1c0a48147293923c2d904e4.camel@HansenPartnership.com>
	<202011241327.BB28F12F6@keescook>
	<a841536fe65bb33f1c72ce2455a6eb47a0107565.camel@HansenPartnership.com>
	<CAKwvOdkGBn7nuWTAqrORMeN1G+w3YwBfCqqaRD2nwvoAXKi=Aw@mail.gmail.com>
	<alpine.LNX.2.23.453.2011260750300.6@nippy.intranet>
	<CAKwvOdna5Zj_O=sB7Q0jHZX0BJSaakX=ZyftwQ_3=L3-ZB54XQ@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 26 Nov 2020 07:47:04 +0100
Cc: alsa-devel@alsa-project.org, bridge@lists.linux-foundation.org,
	target-devel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
	linux-wireless <linux-wireless@vger.kernel.org>,
	linux-fbdev@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	wcn36xx@lists.infradead.org, linux-i3c@lists.infradead.org,
	linux1394-devel@lists.sourceforge.net,
	linux-afs@lists.infradead.org, drbd-dev@lists.linbit.com,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	rds-devel@oss.oracle.com, linux-scsi@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, linux-atm-general@lists.sourceforge.net,
	ceph-devel@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	cluster-devel@redhat.com, usb-storage@lists.one-eyed-alien.net,
	linux-mmc@vger.kernel.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-input@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, linux-ext4@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	netfilter-devel@vger.kernel.org, linux-media@vger.kernel.org,
	GR-Linux-NIC-Dev@marvell.com, Kees Cook <keescook@chromium.org>,
	selinux@vger.kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	intel-gfx@lists.freedesktop.org, linux-sctp@vger.kernel.org,
	reiserfs-devel@vger.kernel.org, linux-geode@lists.infradead.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-gpio@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-mediatek@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, xen-devel@lists.xenproject.org,
	nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>, linux-can@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org, linux-block@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, samba-technical@lists.samba.org,
	LKML <linux-kernel@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	linux-security-module@vger.kernel.org, linux-usb@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, patches@opensource.cirrus.com,
	Joe Perches <joe@perches.com>, linux-integrity@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	"maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>
Subject: Re: [Drbd-dev] [Intel-wired-lan] [PATCH 000/141] Fix fall-through
 warnings for Clang
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

On Wed, 25 Nov 2020, Nick Desaulniers wrote:

> On Wed, Nov 25, 2020 at 1:33 PM Finn Thain <fthain@telegraphics.com.au> 
> wrote:
> >
> > Or do you think that a codebase can somehow satisfy multiple checkers 
> > and their divergent interpretations of the language spec?
> 
> Have we found any cases yet that are divergent? I don't think so.

There are many implementations, so I think you are guaranteed to find more 
divergence if you look. That's because the spec is full of language like 
this: "implementations are encouraged not to emit a diagnostic" and 
"implementations are encouraged to issue a diagnostic".

Some implementations will decide to not emit (under the premise that vast 
amounts of existing code would have to get patched until the compiler goes 
quiet) whereas other implementations will decide to emit (under the 
premise that the author is doing the checking and not the janitor or the 
packager).

> It sounds to me like GCC's cases it warns for is a subset of Clang's. 
> Having additional coverage with Clang then should ensure coverage for 
> both.
> 

If that claim were true, the solution would be simple. (It's not.)

For the benefit of projects that enable -Werror and projects that 
nominated gcc as their preferred compiler, clang would simply need a flag 
to enable conformance with gcc by suppressing those additional warnings 
that clang would normally produce.

This simple solution is, of course, completely unworkable, since it would 
force clang to copy some portion of gcc's logic (rewritten under LLVM's 
unique license) and then to track future changes to that portion of gcc 
indefinitely.
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
