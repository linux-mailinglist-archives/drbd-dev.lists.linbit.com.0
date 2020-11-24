Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD4C2C1EAB
	for <lists+drbd-dev@lfdr.de>; Tue, 24 Nov 2020 08:08:21 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 04A634207E4;
	Tue, 24 Nov 2020 08:08:19 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
	[98.124.60.144])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 69BA64202D8
	for <drbd-dev@lists.linbit.com>; Tue, 24 Nov 2020 01:58:43 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by kvm5.telegraphics.com.au (Postfix) with ESMTP id 0EF842A8E0;
	Mon, 23 Nov 2020 19:58:39 -0500 (EST)
Date: Tue, 24 Nov 2020 11:58:37 +1100 (AEDT)
From: Finn Thain <fthain@telegraphics.com.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
In-Reply-To: <CANiq72=z+tmuey9wj3Kk7wX5s0hTHpsQdLhAqcOVNrHon6xn5Q@mail.gmail.com>
Message-ID: <alpine.LNX.2.23.453.2011241036520.7@nippy.intranet>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
	<alpine.LNX.2.23.453.2011230938390.7@nippy.intranet>
	<CANiq72=z+tmuey9wj3Kk7wX5s0hTHpsQdLhAqcOVNrHon6xn5Q@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 24 Nov 2020 08:08:15 +0100
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


On Mon, 23 Nov 2020, Miguel Ojeda wrote:

> On Mon, 23 Nov 2020, Finn Thain wrote:
> 
> > On Sun, 22 Nov 2020, Miguel Ojeda wrote:
> > 
> > > 
> > > It isn't that much effort, isn't it? Plus we need to take into 
> > > account the future mistakes that it might prevent, too.
> > 
> > We should also take into account optimisim about future improvements 
> > in tooling.
> > 
> Not sure what you mean here. There is no reliable way to guess what the 
> intention was with a missing fallthrough, even if you parsed whitespace 
> and indentation.
> 

What I meant was that you've used pessimism as if it was fact.

For example, "There is no way to guess what the effect would be if the 
compiler trained programmers to add a knee-jerk 'break' statement to avoid 
a warning".

Moreover, what I meant was that preventing programmer mistakes is a 
problem to be solved by development tools. The idea that retro-fitting new 
language constructs onto mature code is somehow necessary to "prevent 
future mistakes" is entirely questionable.

> > > So even if there were zero problems found so far, it is still a 
> > > positive change.
> > > 
> > 
> > It is if you want to spin it that way.
> > 
> How is that a "spin"? It is a fact that we won't get *implicit* 
> fallthrough mistakes anymore (in particular if we make it a hard error).
> 

Perhaps "handwaving" is a better term?

> > > I would agree if these changes were high risk, though; but they are 
> > > almost trivial.
> > > 
> > 
> > This is trivial:
> > 
> >  case 1:
> >         this();
> > +       fallthrough;
> >  case 2:
> >         that();
> > 
> > But what we inevitably get is changes like this:
> > 
> >  case 3:
> >         this();
> > +       break;
> >  case 4:
> >         hmmm();
> > 
> > Why? Mainly to silence the compiler. Also because the patch author 
> > argued successfully that they had found a theoretical bug, often in 
> > mature code.
> > 
> If someone changes control flow, that is on them. Every kernel developer 
> knows what `break` does.
> 

Sure. And if you put -Wimplicit-fallthrough into the Makefile and if that 
leads to well-intentioned patches that cause regressions, it is partly on 
you.

Have you ever considered the overall cost of the countless 
-Wpresume-incompetence flags?

Perhaps you pay the power bill for a build farm that produces logs that 
no-one reads? Perhaps you've run git bisect, knowing that the compiler 
messages are not interesting? Or compiled software in using a language 
that generates impenetrable messages? If so, here's a tip:

# grep CFLAGS /etc/portage/make.conf 
CFLAGS="... -Wno-all -Wno-extra ..."
CXXFLAGS="${CFLAGS}"

Now allow me some pessimism: the hardware upgrades, gigawatt hours and 
wait time attributable to obligatory static analyses are a net loss.

> > But is anyone keeping score of the regressions? If unreported bugs 
> > count, what about unreported regressions?
> > 
> Introducing `fallthrough` does not change semantics. If you are really 
> keen, you can always compare the objects because the generated code 
> shouldn't change.
> 

No, it's not for me to prove that such patches don't affect code 
generation. That's for the patch author and (unfortunately) for reviewers.

> Cheers,
> Miguel
> 
_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
