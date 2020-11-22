Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A482BFFF7
	for <lists+drbd-dev@lfdr.de>; Mon, 23 Nov 2020 07:22:06 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4BF814207E8;
	Mon, 23 Nov 2020 07:21:57 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
	[96.44.175.130])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A5C84420331
	for <drbd-dev@lists.linbit.com>; Sun, 22 Nov 2020 23:36:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 3EEFD12808AA; 
	Sun, 22 Nov 2020 14:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1606084565;
	bh=y5Oo39UQGhMKIHztx5i9osM+IVUxOt/AInbXjgVEmOM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=it2DEm5qbX6tNKGabRZf0YZ7FJN256ppIXEFnMqNHN+XY9h76oTIzuZgEyEoREiKM
	yiP/0zNVKPNW1kWiLTindkrOQ7bXlSJOTVsRohihqSOzq1tvOmtHcybKKU2pQsn+gK
	kXbE7Tzelwaqt/71bFtBSSIQ6PZYHLF3M7J5PGe0=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YhaEdPXdRRpF; Sun, 22 Nov 2020 14:36:05 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown
	[IPv6:2601:600:8280:66d1::527])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id
	B820412808A7; Sun, 22 Nov 2020 14:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1606084565;
	bh=y5Oo39UQGhMKIHztx5i9osM+IVUxOt/AInbXjgVEmOM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=it2DEm5qbX6tNKGabRZf0YZ7FJN256ppIXEFnMqNHN+XY9h76oTIzuZgEyEoREiKM
	yiP/0zNVKPNW1kWiLTindkrOQ7bXlSJOTVsRohihqSOzq1tvOmtHcybKKU2pQsn+gK
	kXbE7Tzelwaqt/71bFtBSSIQ6PZYHLF3M7J5PGe0=
Message-ID: <1c7d7fde126bc0acf825766de64bf2f9b888f216.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Nov 2020 14:36:00 -0800
In-Reply-To: <CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
	<20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011201129.B13FDB3C@keescook>
	<20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
	<202011220816.8B6591A@keescook>
	<9b57fd4914b46f38d54087d75e072d6e947cb56d.camel@HansenPartnership.com>
	<CANiq72nZrHWTA4_Msg6MP9snTyenC6-eGfD27CyfNSu7QoVZbw@mail.gmail.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Nov 2020 07:21:47 +0100
Cc: alsa-devel@alsa-project.org,
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
	rds-devel@oss.oracle.com, Desaulniers <ndesaulniers@google.com>,
	linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
	oss-drivers@netronome.com, bridge@lists.linux-foundation.org,
	linux-security-module@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	linux-stm32@st-md-mailman.stormreply.com, cluster-devel@redhat.com,
	linux-acpi@vger.kernel.org, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org,
	linux-input <linux-input@vger.kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	Media Mailing List <linux-media@vger.kernel.org>,
	GR-Linux-NIC-Dev@marvell.com, Kees Cook <keescook@chromium.org>,
	selinux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, Nick@linbit.com,
	linux-geode@lists.infradead.org, linux-can@vger.kernel.org,
	linux-block@vger.kernel.org, linux-gpio@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-mediatek@lists.infradead.org,
	GR-everest-linux-l2@marvell.com, xen-devel@lists.xenproject.org,
	nouveau@lists.freedesktop.org, linux-hams@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-nfs@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
	Linux-MM <linux-mm@kvack.org>,
	Network Development <netdev@vger.kernel.org>,
	linux-decnet-user@lists.sourceforge.net, linux-mmc@vger.kernel.org,
	linux-kernel <linux-kernel@vger.kernel.org>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-usb@vger.kernel.org, netfilter-devel@vger.kernel.org,
	List <linux-crypto@vger.kernel.org>, Linux@linbit.com,
	Joe Perches <joe@perches.com>, linux-integrity@vger.kernel.org,
	patches@opensource.cirrus.com, target-devel@vger.kernel.org
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

On Sun, 2020-11-22 at 21:35 +0100, Miguel Ojeda wrote:
> On Sun, Nov 22, 2020 at 7:22 PM James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> > Well, it's a problem in an error leg, sure, but it's not a really
> > compelling reason for a 141 patch series, is it?  All that fixing
> > this error will do is get the driver to print "oh dear there's a
> > problem" under four more conditions than it previously did.
> > 
> > We've been at this for three years now with nearly a thousand
> > patches, firstly marking all the fall throughs with /* fall through
> > */ and later changing it to fallthrough.  At some point we do have
> > to ask if the effort is commensurate with the protection
> > afforded.  Please tell me our reward for all this effort isn't a
> > single missing error print.
> 
> It isn't that much effort, isn't it?

Well, it seems to be three years of someone's time plus the maintainer
review time and series disruption of nearly a thousand patches.  Let's
be conservative and assume the producer worked about 30% on the series
and it takes about 5-10 minutes per patch to review, merge and for
others to rework existing series.  So let's say it's cost a person year
of a relatively junior engineer producing the patches and say 100h of
review and application time.  The latter is likely the big ticket item
because it's what we have in least supply in the kernel (even though
it's 20x vs the producer time).

>  Plus we need to take into account the future mistakes that it might
> prevent, too. So even if there were zero problems found so far, it is
> still a positive change.

Well, the question I was asking is if it's worth the cost which I've
tried to outline above.

> I would agree if these changes were high risk, though; but they are
> almost trivial.

It's not about the risk of the changes it's about the cost of
implementing them.  Even if you discount the producer time (which
someone gets to pay for, and if I were the engineering manager, I'd be
unhappy about), the review/merge/rework time is pretty significant in
exchange for six minor bug fixes.  Fine, when a new compiler warning
comes along it's certainly reasonable to see if we can benefit from it
and the fact that the compiler people think it's worthwhile is enough
evidence to assume this initially.  But at some point you have to ask
whether that assumption is supported by the evidence we've accumulated
over the time we've been using it.  And if the evidence doesn't support
it perhaps it is time to stop the experiment.

James


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
